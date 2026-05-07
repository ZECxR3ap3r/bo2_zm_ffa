player_killed_callback(einflictor, eattacker, idamage, smeansofdeath, sweapon, vdir, shitloc, psoffsettime, deathanimduration) {
	self.savedweapons = self getWeaponsListPrimaries();
	self.killcamlength = 5;
	attacker = eattacker;
	if(self != attacker) {
		attacker.kills += 1;
		attacker.pointstowin = attacker.kills;
		attacker.pers["kills"] = attacker.kills;
		eattacker thread draw_xp(50, "Player Eliminated");
	}
	self.pers["deaths"] += 1;
	deadClone = self clonePlayer(1);
	deadClone startRagdoll(1);
	item = self dropItem(self getcurrentweapon());
	item thread DeleteAftertime(60);
	self.deaths += 1;
	self.score = self.pointstowin;
	attacker.score = attacker.pointstowin;
	level notify("player_kill");
	wasinlaststand = 0;
	deathtimeoffset = 0;
	lastweaponbeforedroppingintolaststand = undefined;
	attackerstance = undefined;
	self.laststandthislife = undefined;
	self.vattackerorigin = undefined;
	if(maps/mp/gametypes_zm/_globallogic_utils::isheadshot(sweapon, shitloc, smeansofdeath, einflictor) && isplayer(attacker)) {
		attacker playlocalsound("prj_bullet_impact_headshot_helmet_nodie_2d");
		smeansofdeath = "MOD_HEAD_SHOT";
		attacker.pers["headshots"] += 1;
		attacker.headshots = attacker.pers["headshots"];
	}
	obituary(self, attacker, sweapon, smeansofdeath);
	self.deathtime = GetTime();
	if(isdefined(self.hasriotshieldequipped) && self.hasriotshieldequipped == 1) {
		self detachshieldmodel(level.carriedshieldmodel, "tag_weapon_left");
		self.hasriotshield = 0;
		self.hasriotshieldequipped = 0;
	}
	if(isplayer(attacker) && attacker != self || level.teambased) {
		if(wasinlaststand && isdefined(lastweaponbeforedroppingintolaststand))
			weaponname = lastweaponbeforedroppingintolaststand;
		else
			weaponname = self.lastdroppableweapon;
		if(isdefined(weaponname) && !issubstr(weaponname, "gl_") || (issubstr(weaponname, "mk_") && issubstr(weaponname, "ft_")))
			weaponname = self.currentweapon;
	}
	if(!isplayer(attacker) || self isenemyplayer(attacker) == 0) {
		level notify("reset_obituary_count");
		level.lastobituaryplayercount = 0;
		level.lastobituaryplayer = undefined;
	}
	else if(isdefined(level.lastobituaryplayer) && level.lastobituaryplayer == attacker)
		level.lastobituaryplayercount++;
	else {
		level notify("reset_obituary_count");
		level.lastobituaryplayer = attacker;
		level.lastobituaryplayercount = 1;
	}
	if(level.lastobituaryplayercount >= 4) {
		level notify("reset_obituary_count");
		level.lastobituaryplayercount = 0;
		level.lastobituaryplayer = undefined;
	}
	self.sessionstate = "dead";
	self.statusicon = "hud_status_dead";
	lpattacknum = -1;
	awardassists = 0;
	if(isplayer(attacker)) {
		if(attacker == self) {
			dokillcam = 0;
			self.suicide = 1;
			wait 1;
			self [[ level.spawnplayer ]]();
		}
		else {
			lpattacknum = attacker getentitynumber();
			dokillcam = 1;
		}
	}
	else if(isdefined(attacker) || attacker.classname == "trigger_hurt" && attacker.classname == "worldspawn") {
		dokillcam = 0;
		lpattacknum = -1;
		awardassists = 1;
		wait 1;
		self [[ level.spawnplayer ]]();
	}
	else {
		dokillcam = 0;
		lpattacknum = -1;
		if(isdefined(einflictor) && isdefined(einflictor.killcament)) {
			dokillcam = 1;
			lpattacknum = self getentitynumber();
		}
		else {
			wait 1;
			self [[ level.spawnplayer ]]();
		}
		awardassists = 1;
	}
	self.lastattacker = attacker;
	self.lastdeathpos = self.origin;
	if(isdefined(self.attackers))
		self.attackers = [];
	
	self thread [[level.onplayerkilled]](einflictor, eattacker, idamage, smeansofdeath, sweapon, vdir, shitloc, psoffsettime, deathanimduration);
	if(isdefined(dokillcam) && dokillcam == 1) {
		killcamentity = self getkillcamentity(eattacker, einflictor, sweapon);
		killcamentityindex = -1;
		killcamentitystarttime = 0;
		if(isdefined(killcamentity)) {
			killcamentityindex = killcamentity getentitynumber();
			if(isdefined(killcamentity.starttime))
				killcamentitystarttime = killcamentity.starttime;
			else
				killcamentitystarttime = killcamentity.birthtime;
			if(!isdefined(killcamentitystarttime))
				killcamentitystarttime = 0;
		}
		perks = [];
		if(smeansofdeath != "MOD_SUICIDE" && isdefined(attacker) && (attacker.classname != "trigger_hurt" && attacker.classname != "worldspawn") && self != attacker)
			level thread recordkillcamsettings(lpattacknum, self getentitynumber(), sweapon, self.deathtime, deathtimeoffset, psoffsettime, killcamentityindex, killcamentitystarttime, perks, attacker);
		wait(0.25);
		if(level.endgame != 1) {
			defaultplayerdeathwatchtime = 0.25;
			if(isdefined(level.overrideplayerdeathwatchtimer))
				defaultplayerdeathwatchtime = [[level.overrideplayerdeathwatchtimer]](defaultplayerdeathwatchtime);
			maps/mp/gametypes_zm/_globallogic_utils::waitfortimeornotifies(defaultplayerdeathwatchtime);
			self notify("death_delay_finished");
			self.respawntimerstarttime = GetTime();
			self killcam(lpattacknum, self getentitynumber(), killcamentity, killcamentityindex, killcamentitystarttime, sweapon, self.deathtime, deathtimeoffset, psoffsettime, 0, 5, perks, attacker);
			self.killcamtargetentity = -1;
			self.killcamentity = -1;
			self.archivetime = 0;
			self.psoffsettime = 0;
		}
	}
}

DeleteAftertime(time) {
	wait time;
	if(isdefined(self))
		self delete();
}

initfinalkillcam() {
	level.finalkillcamsettings = [];
	initfinalkillcamteam( "none" );
	foreach ( team in level.teams )
		initfinalkillcamteam( team );
	level.finalkillcam_winner = undefined;
}

initfinalkillcamteam( team ) {
	level.finalkillcamsettings[ team ] = spawnstruct();
	clearfinalkillcamteam( team );
}

clearfinalkillcamteam( team ) {
	level.finalkillcamsettings[ team ].spectatorclient = undefined;
	level.finalkillcamsettings[ team ].weapon = undefined;
	level.finalkillcamsettings[ team ].deathtime = undefined;
	level.finalkillcamsettings[ team ].deathtimeoffset = undefined;
	level.finalkillcamsettings[ team ].offsettime = undefined;
	level.finalkillcamsettings[ team ].entityindex = undefined;
	level.finalkillcamsettings[ team ].targetentityindex = undefined;
	level.finalkillcamsettings[ team ].entitystarttime = undefined;
	level.finalkillcamsettings[ team ].perks = undefined;
	level.finalkillcamsettings[ team ].attacker = undefined;
}

recordkillcamsettings( spectatorclient, targetentityindex, sweapon, deathtime, deathtimeoffset, offsettime, entityindex, entitystarttime, perks, attacker ) {
	level.finalkillcamsettings[ "none" ].spectatorclient = spectatorclient;
	level.finalkillcamsettings[ "none" ].weapon = sweapon;
	level.finalkillcamsettings[ "none" ].deathtime = deathtime;
	level.finalkillcamsettings[ "none" ].deathtimeoffset = deathtimeoffset;
	level.finalkillcamsettings[ "none" ].offsettime = offsettime;
	level.finalkillcamsettings[ "none" ].entityindex = entityindex;
	level.finalkillcamsettings[ "none" ].targetentityindex = targetentityindex;
	level.finalkillcamsettings[ "none" ].entitystarttime = entitystarttime;
	level.finalkillcamsettings[ "none" ].perks = perks;
	level.finalkillcamsettings[ "none" ].attacker = attacker;
	level.finalkillcamsettings[ "none" ].frontview = attacker.frontcameraa;
}

dofinalkillcam() {
    level.infinalkillcam = 1;
    winner = "none";

    if ( !isdefined( level.finalkillcamsettings[winner].targetentityindex ) ) {
        level.infinalkillcam = 0;
        level notify( "final_killcam_done" );
        return;
    }

    if ( isdefined( level.finalkillcamsettings[winner].attacker ) )
        maps\mp\_challenges::getfinalkill( level.finalkillcamsettings[winner].attacker );

    visionsetnaked( getdvar( "mapname" ), 0.0 );
    players = level.players;

    for ( index = 0; index < players.size; index++ ) {
        player = players[index];
        player closemenu();
        player closeingamemenu();
        player thread finalkillcam( winner );
    }

    wait 0.1;

    while ( areanyplayerswatchingthekillcam() )
        wait 0.05;

    level notify( "final_killcam_done" );
    level.infinalkillcam = 0;
}

DefaultView( killcamentityindex, killcamoffset, starttime, frontview, killcamlength) {
	self endon("disconnect");
	self endon("killcam_ended");
	
	killcamsettings = level.finalkillcamsettings["none"];
	self setclientfov(65);
	//self.killcamentity = killcamentityindex;
	self camerasetposition(frontview);
	self camerasetlookat(killcamsettings.attacker);
	self cameraactivate( 1 );
	wait 0.25;
	setslowmotion(1, 0.25, 0.5);
	level thread ShowWhoitis(killcamsettings.attacker);
	wait 1;
	setslowmotion(0.25, 1, 1);
	wait 1;
	self thread fadetoblackforxsec_new( 0, 0.1, 0.05, 0.05, "white");
	wait .05;
	level notify("destroypreview");
	
	self camerasetposition(killcamsettings.attacker);
	self camerasetlookat(killcamsettings.attacker);
	self cameraactivate( false );
	self notify("endtrack");
	self resetfov();
	self thread Killcam_Overlay(killcamsettings.attacker, killcamsettings.weapon, killcamsettings.attacker.perk1shader, killcamsettings.attacker.perk2shader, killcamsettings.attacker.perk3shader, killcamlength - 2.4, "FINAL KILLCAM");
	
	killcamtime = (gettime() - killcamoffset * 1000);
	
	if ( starttime > killcamtime ) {
		wait .05;
		killcamoffset = self.archivetime;
		killcamtime = (gettime() - killcamoffset * 1000);
		
		if ( starttime > killcamtime )
			wait (starttime - killcamtime) / 1000;
	}
	self.killcamentity = killcamentityindex;
}

finalkillcam( winner ) {
    self endon( "disconnect" );
    level endon( "game_ended" );

    setmatchflag( "final_killcam", 0 );
    setmatchflag( "round_end_killcam", 1 );

    killcamsettings = level.finalkillcamsettings[winner];
    postdeathdelay = ( gettime() - killcamsettings.deathtime ) / 1000;
    predelay = postdeathdelay + killcamsettings.deathtimeoffset;
    camtime = calckillcamtime( killcamsettings.weapon, killcamsettings.entitystarttime, predelay, 0, undefined );
    postdelay = calcpostdelay();
    killcamoffset = camtime + predelay - 1;
    killcamlength = camtime + postdelay - 0.05;
    killcamstarttime = gettime() - killcamoffset * 1000;
    self setClientDvar("cg_colorsaturation", 1);
    self notify( "begin_killcam", gettime() );
    self.sessionstate = "spectator";
    self.spectatorclient = killcamsettings.spectatorclient;
    
    self thread DefaultView(killcamsettings.entityindex, killcamsettings.entitystarttime - killcamstarttime - 100, undefined, killcamsettings.frontview, killcamlength);
    
    self.killcamtargetentity = killcamsettings.targetentityindex;
    self.archivetime = killcamoffset;
    self.killcamlength = killcamlength;
    self.psoffsettime = killcamsettings.offsettime;

    foreach ( team in level.teams )
        self allowspectateteam( team, 1 );
       
    self allowspectateteam( "freelook", 1 );
    self allowspectateteam( "none", 1 );
    self thread endedfinalkillcamcleanup();
    wait 0.05;
	
    if ( self.archivetime <= predelay ) {
        self.sessionstate = "dead";
        self.spectatorclient = -1;
        self.killcamentity = -1;
        self.archivetime = 0;
        self.psoffsettime = 0;
        self notify( "end_killcam" );
        return;
    }

    self thread checkforabruptkillcamend();
    self.killcam = 1;

    self thread waitkillcamtime();
    self thread waitfinalkillcamslowdown( level.finalkillcamsettings[winner].deathtime, killcamstarttime );

    self waittill( "end_killcam" );
    self thread fadetoblackforxsec_new( 0, 0.3, 0.05, 0.05, "black");
    wait .05;
	
	if(isdefined(self.health_bar))
		self.health_bar destroy();
		
	if(isdefined(self.health_text))
		self.health_text destroy();
	
    self endkillcam( 1 );
    setmatchflag( "final_killcam", 0 );
    setmatchflag( "round_end_killcam", 0 );
    self spawnendoffinalkillcam();
    
    wait 0.1;
    self.sessionstate = "playing";
	self setclientfov(70);
	
    level.topplayers.firstplace setorigin((1597.23, 2095.12, 21.4424));
    level.topplayers.firstplace setplayerangles(anglestoforward(level.topplayers.firstplace.angles) + (0,270,0));
    
    level.topplayers.secondplace setorigin((1539.33, 2164.13, 17.9772));
    level.topplayers.secondplace setplayerangles(anglestoforward(level.topplayers.secondplace.angles) + (0,270,0));
    
    level.topplayers.thirdplace setorigin((1666.18, 2118.44, 17.943));
    level.topplayers.thirdplace setplayerangles(anglestoforward(level.topplayers.thirdplace.angles) + (0,270,0));
    
   	ui_create_name_hud(level.topplayers.firstplace, 1);
   	ui_create_name_hud(level.topplayers.secondplace, 2);
   	ui_create_name_hud(level.topplayers.thirdplace, 3);
    
    self camerasetposition((1570.77, 2000.8, 61.6062));
    self camerasetlookat(level.topplayers.firstplace.origin + (0,0,60));
	self cameraactivate(1);
    
    wait 15;
    self resetfov();
    exitlevel( false );
}

areanyplayerswatchingthekillcam() {
	players = level.players;
	for ( index = 0; index < players.size; index++ ) {
		player = players[ index ];
		if ( isDefined( player.killcam ) )
			return 1;
	}
	return 0;
}

killcam(attackernum, targetnum, killcamentity, killcamentityindex, killcamentitystarttime, sweapon, deathtime, deathtimeoffset, offsettime, respawn, maxtime, perks, attacker) {
	self endon( "disconnect" );
	level endon( "end_game" );

	setmatchflag( "final_killcam", 0 );
	setmatchflag( "round_end_killcam", 1 );
	postdeathdelay = ( getTime() - deathtime ) / 1000;
	predelay = postdeathdelay + deathtimeoffset;
	camtime = calckillcamtime(sweapon, killcamentitystarttime, predelay, 0, undefined );
	postdelay = calcpostdelay();
	killcamoffset = camtime + predelay;
	killcamlength = ( camtime + postdelay ) - 0.05;
	killcamstarttime = getTime() - ( killcamoffset * 1000 );
	self notify( "begin_killcam", getTime() );
	self thread Killcam_Overlay(attacker, sweapon, attacker.perk1shader, attacker.perk2shader, attacker.perk3shader, killcamlength, "PLAYER KILLCAM");
	self thread waitskipkillcambutton();
	self.sessionstate = "spectator";
	self.spectatorclient = attackernum;
	self.killcamentity = -1;
	if ( killcamsettings.entityindex >= 0 )
		self thread setkillcamentity(killcamentityindex, killcamentitystarttime - killcamstarttime - 100 );
	self.killcamtargetentity = targetnum;
	self.archivetime = killcamoffset;
	self.killcamlength = killcamlength;
	self.psoffsettime = offsettime;
	foreach ( team in level.teams )
		self allowspectateteam( team, 1 );
	self allowspectateteam( "freelook", 1 );
	self allowspectateteam( "none", 1 );
	self thread endedfinalkillcamcleanup();
	wait 0.05;
	if ( self.archivetime <= predelay ) {
		self.sessionstate = "dead";
		self.spectatorclient = -1;
		self.killcamentity = -1;
		self.archivetime = 0;
		self.psoffsettime = 0;
		self notify( "end_killcam" );
		return;
	}
	self thread checkforabruptkillcamend();
	self.killcam = 1;
	self thread waitkillcamtime();
	self waittill( "end_killcam" );
	setmatchflag( "final_killcam", 0 );
	setmatchflag( "round_end_killcam", 0 );
	if(isdefined(self.kc_skiptext))
		self.kc_skiptext destroy();
	self [[ level.spawnplayer ]]();
}

setkillcamentity( killcamentityindex, delayms ) {
	self endon( "disconnect" );
	self endon( "end_killcam" );
	self endon( "spawned" );
	if ( delayms > 0 )
		wait ( delayms / 1000 );
	self.killcamentity = killcamentityindex;
}

waitkillcamtime() {
	self endon( "disconnect" );
	self endon( "end_killcam" );
	wait ( self.killcamlength - 0.05 );
	self notify( "end_killcam" );
}

waitfinalkillcamslowdown( deathtime, starttime ) {
	self endon( "disconnect" );
	self endon( "end_killcam" );
	secondsuntildeath = ( deathtime - starttime ) / 1000;
	deathtime = getTime() + ( secondsuntildeath * 1000 );
	waitbeforedeath = 2;
	maps/mp/_utility::setclientsysstate( "levelNotify", "fkcb" );
	wait max( 0, secondsuntildeath - waitbeforedeath );
	setslowmotion( 1, 0.25, waitbeforedeath );
	wait ( waitbeforedeath + 0.5 );
	setslowmotion( 0.25, 1, 1 );
	wait 0.5;
	maps/mp/_utility::setclientsysstate( "levelNotify", "fkce" );
}

waitskipkillcambutton()  {
	self endon( "disconnect" );
	self endon( "end_killcam" );
	
	if ( !isDefined( self.kc_skiptext ) ) {
		self.kc_skiptext = newclienthudelem( self );
		self.kc_skiptext.archived = 0;
		self.kc_skiptext.x = 0;
		self.kc_skiptext.alignx = "center";
		self.kc_skiptext.aligny = "middle";
		self.kc_skiptext.horzalign = "center";
		self.kc_skiptext.vertalign = "bottom";
		self.kc_skiptext.sort = 1;
		self.kc_skiptext.font = "objective";
	}
	self.kc_skiptext.y = -120;
	self.kc_skiptext.fontscale = 1.2;
	self.kc_skiptext settext( &"PLATFORM_PRESS_TO_SKIP" );
	self.kc_skiptext.alpha = 1;
	
	while ( self usebuttonpressed() )
		wait 0.05;
	while ( !self usebuttonpressed() )
		wait 0.05;
		
	self.kc_skiptext destroy();
	
	self notify( "end_killcam" );
	self clientnotify( "fkce" );
}

endkillcam( final )
{
}
	
checkforabruptkillcamend() {
	self endon( "disconnect" );
	self endon( "end_killcam" );
	while ( 1 ) {
		if ( self.archivetime <= 0 )
			break;
		wait 0.05;
	}
	self notify( "end_killcam" );
}

spawnedkillcamcleanup() {
	self endon( "end_killcam" );
	self endon( "disconnect" );
	self waittill( "spawned" );
}

spectatorkillcamcleanup( attacker ) {
	self endon( "end_killcam" );
	self endon( "disconnect" );
	attacker endon( "disconnect" );
	attacker waittill( "begin_killcam", attackerkcstarttime );
	waittime = max( 0, attackerkcstarttime - self.deathtime - 50 );
	wait waittime;
}

endedkillcamcleanup() {
	self endon( "end_killcam" );
	self endon( "disconnect" );
	level waittill( "end_game" );
	self endkillcam( 0 );
}

endedfinalkillcamcleanup() {
	self endon( "end_killcam" );
	self endon( "disconnect" );
	level waittill( "end_game" );
	self endkillcam( 1 );
}

spawnendoffinalkillcam() {
	[[ level.spawnspectator ]]();
	self freezecontrols( 1 );
}

iskillcamentityweapon( sweapon ) {
	return 0;
}

iskillcamgrenadeweapon( sweapon ) {
	if ( sweapon == "frag_grenade_zm" )
		return 1;
	else if ( sweapon == "frag_grenade_short_zm" )
		return 1;
	else if ( sweapon == "sticky_grenade_zm" )
		return 1;
	return 0;
}

calckillcamtime( sweapon, entitystarttime, predelay, respawn, maxtime ) {
	camtime = 0;
	if ( getDvar( "scr_killcam_time" ) == "" ) {
		if ( iskillcamentityweapon( sweapon ) )
			camtime = ( ( getTime() - entitystarttime ) / 1000 ) - predelay - 0.1;
		else if ( !respawn )
			camtime = 5;
		else if ( iskillcamgrenadeweapon( sweapon ) )
			camtime = 4.25;
		else
			camtime = 2.5;
	}
	else
		camtime = getDvarFloat( "scr_killcam_time" );
	
	if ( isDefined( maxtime ) ) {
		if ( camtime > maxtime )
			camtime = maxtime;
		if ( camtime < 0.05 )
			camtime = 0.05;
	}
	return camtime;
}

calcpostdelay()  {
	postdelay = 0;
	if ( getDvar( "scr_killcam_posttime" ) == "" )
		postdelay = 2;
	else {
		postdelay = getDvarFloat( "scr_killcam_posttime" );
		if ( postdelay < 0.05 )
			postdelay = 0.05;
	}
	return postdelay;
}































