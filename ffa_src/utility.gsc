Freezeall() {
	level endon("prematch_done");
	
	while(isdefined(level.prematch_title)) {
		wait .05;
		foreach(player in level.players) {
			player freezecontrols(1);
			player setClientDvar("cg_usecolorcontrol", 1);
			player setClientDvar("cg_colorsaturation", 0);
			player setClientDvar("cg_crosshairalpha", 0);
		}
	}
}

fontPulse() {
	self notify ( "fontPulse" );
	self endon ( "fontPulse" );
	self endon( "death" );
	
	self.fontScale = 5;
	self ChangeFontScaleOverTime( 0.1 );
	self.fontScale = 1.8;	
}

SetVisionback() {
	for(i = 0;i < 1.1;i += 0.1) {
		foreach(player in level.players)
		player setClientDvar("cg_colorsaturation", i);
			
		wait .05;
	}
}

SetVisiongrey() {
	for(i = 1;i > 0;i -= 0.1) {
		foreach(player in level.players)
		player setClientDvar("cg_colorsaturation", i);
			
		wait .05;
	}
}

ChangeWallbuys() {
	foreach(weapon in level.zombie_weapons) {
		weapon.cost = 0;
		level.zombie_include_weapons[ weapon ] = 1;
		weapon.is_in_box = 1;
		weapon.ammo_cost = 0;
	}
}

EnableChests() {
	wait 10;
	foreach(box in level.chests) {
		box thread maps/mp/zombies/_zm_magicbox::show_chest();
		box.zombie_cost = 0;
	}
}

isrealint(num) {
	for(i = 0;i < 10;i++) {
		if(num == i)
			return true;
	}
	return false;
}

setmstimer(time, minutecounter) {
	if(isdefined(minutecounter))
		self.label = &"0:0";
	
	for(i = time;i > 0;i -= .1) {
		clean_rounded_int = round(i * 10);
		fertig = clean_rounded_int / 10;
		if(isrealint(fertig))
			self settext(fertig+".0");
		else
			self setvalue(fertig);
		wait .1;
	}
}

Getthescores() {
	struct = spawnstruct();
	struct.firstplace = "";
	struct.secondplace = "";
	struct.thirdplace = "";
	
	points = 0;
	// Getting the highest
	for(i = 0;i < level.players.size;i++) {
		if(level.players[i].pointstowin >= points) {
			points = level.players[i].pointstowin;
			struct.firstplace = level.players[i];
		}
	}
	// Getting the second
	points = 0;
	for(i = 0;i < level.players.size;i++) {
		if(level.players[i].pointstowin >= points && level.players[i].pointstowin <= struct.firstplace.pointstowin && struct.firstplace != level.players[i]) {
			points = level.players[i].pointstowin;
			struct.secondplace = level.players[i];
		}
	}
	// Getting the third
	points = 0;
	for(i = 0;i < level.players.size;i++) {
		if(level.players[i].pointstowin >= points && level.players[i].pointstowin <= struct.secondplace.pointstowin && struct.secondplace != level.players[i]) {
			points = level.players[i].pointstowin;
			struct.thirdplace = level.players[i];
		}
	}
	
	return struct;
}

round(value) {
	return int(floor(value + 0.5));
}

claymore_detonation_new() {
	self endon( "death" );
	self waittill_not_moving();
	detonateradius = 96;
	damagearea = spawn( "trigger_radius", self.origin + ( 0, 0, 0 - detonateradius ), 4, detonateradius, detonateradius * 2 );
	damagearea setexcludeteamfortrigger( self.team );
	damagearea enablelinkto();
	damagearea linkto( self );
	self.damagearea = damagearea;
	self thread delete_claymores_on_death( self.owner, damagearea );
	self.owner.claymores[ self.owner.claymores.size ] = self;
	while ( 1 ) {
		damagearea waittill( "trigger", ent );
		if ( isDefined( self.owner ) && ent == self.owner )
			continue;
		if ( isDefined( ent.ignore_claymore ) && ent.ignore_claymore )
			continue;
		while ( !ent shouldaffectweaponobject( self ) )
			continue;
		if ( ent damageconetrace( self.origin, self ) > 0 ) {
			self playsound( "wpn_claymore_alert" );
			wait 0.4;
			if ( isDefined( self.owner ) )
				self detonate( self.owner );
			else
				self detonate( undefined );
			return;
		}
	}
}

UI_Destroy() {
	foreach(hud in self.TeamHudElem)
		hud destroy();
	
	if(isdefined(self.Weaponnameline))
		self.Weaponnameline destroy();
	
	if(isdefined(self.Weaponname))
		self.Weaponname destroy();
		
	if(isdefined(self.WeaponammoStock))
		self.WeaponammoStock destroy();
		
	if(isdefined(self.WeaponammoClip))
		self.WeaponammoClip destroy();
	
	if(isdefined(self.GrenadeIcon1))
		self.GrenadeIcon1 destroy();
		
	if(isdefined(self.GrenadeIcon2))
		self.GrenadeIcon2 destroy();
		
	if(isdefined(self.GrenadeIcon3))
		self.GrenadeIcon3 destroy();
		
	if(isdefined(self.GrenadeIcon4))
		self.GrenadeIcon4 destroy();
		
	if(isdefined(self.SecondaryIcon1))
		self.SecondaryIcon1 destroy();
		
	if(isdefined(self.SecondaryIcon2))
		self.SecondaryIcon2 destroy();
		
	if(isdefined(self.SecondaryIcon3))
		self.SecondaryIcon3 destroy();
		
	if(isdefined(self.WeaponAmmoTextNew))
		self.WeaponAmmoTextNew destroy();
		
	if(isdefined(self.WeaponAmmoTextNew2))
		self.WeaponAmmoTextNew2 destroy();
		
	if(isdefined(self.namehud))
		self.namehud destroy();
		
	if(isdefined(self.Test))
		self.Test destroy();
		
	if(isdefined(self.ClaymoreIcon))
		self.ClaymoreIcon destroy();
		
	if(isdefined(self.armorbarui))
		self.armorbarui destroy();
	
	if(isdefined(self.KillStreakSlot["ThreeShader"]))
		self.KillStreakSlot["ThreeShader"] destroy();
		
	if(isdefined(self.KillStreakSlot["TwoShader"]))
		self.KillStreakSlot["TwoShader"] destroy();
		
	if(isdefined(self.KillStreakSlot["OneShader"]))
		self.KillStreakSlot["OneShader"] destroy();
		
	if(isdefined(self.KillStreakSlot["KillCouunterBack"]))
		self.KillStreakSlot["KillCouunterBack"] destroy();
		
	if(isdefined(self.KillStreakSlot["KillCouunterBar"]))
		self.KillStreakSlot["KillCouunterBar"] destroy();
	
	if(isdefined(self.health_bar))
		self.health_bar.alpha = 0;
		
	if(isdefined(self.health_text))
		self.health_text.alpha = 0;
}

GetMapSpawnpoints(map) {
	level.Spawnpoints = [];
	if(map == "zm_buried") {
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-799.46, -720.975, -30.5356);
		Spawnpoint.angles = (1.67541, 167.611, 0);
		Spawnpoint.zone = "zone_stables";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-1059.9, -712.502, -11.7862);
		Spawnpoint.angles = (5.03722, 63.8946, 0);
		Spawnpoint.zone = "zone_stables";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();Spawnpoint.origin = (-786.985, -433.424, -33.6375);
		Spawnpoint.angles = (2.09838, 180.086, 0);
		Spawnpoint.zone = "zone_stables";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-797.332, -68.1908, -34.7574);
		Spawnpoint.angles = (1.88964, 219.357, 0);
		Spawnpoint.zone = "zone_stables";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-1271.1, -147.14, 18.7032);
		Spawnpoint.angles = (5.66894, 270.405, 0);
		Spawnpoint.zone = "zone_stables";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-1559.16, -403.239, 40.8309);
		Spawnpoint.angles = (10.0799, 72.3376, 0);
		Spawnpoint.zone = "zone_stables";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-1060.08, -711.843, -11.7702);
		Spawnpoint.angles = (4.61974, 64.8174, 0);
		Spawnpoint.zone = "zone_stables";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-1438.63, -389.555, 168.214);
		Spawnpoint.angles = (9.65697, 29.9358, 0);
		Spawnpoint.zone = "zone_stables";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-1442.01, -139.204, 164.444);
		Spawnpoint.angles = (6.50939, 330.566, 0);
		Spawnpoint.zone = "zone_stables";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-810.55, -100.851, 102.918);
		Spawnpoint.angles = (11.3379, 52.3425, 0);
		Spawnpoint.zone = "zone_stables";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-697.544, -337.494, 94.0354);
		Spawnpoint.angles = (2.51586, 133.762, 0);
		Spawnpoint.zone = "zone_stables";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-866.819, -663.935, 107.841);
		Spawnpoint.angles = (0.208733, 88.0206, 0);
		Spawnpoint.zone = "zone_stables";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-1548.82, -1360.36, 90.3936);
		Spawnpoint.angles = (3.35632, 311.526, 0);
		Spawnpoint.zone = "zone_tunnel_gun2stables2";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-448.328, -1643.51, 158.431);
		Spawnpoint.angles = (11.1291, 159.426, 0);
		Spawnpoint.zone = "zone_tunnel_gun2stables";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-101.04, -1919.69, 269.943);
		Spawnpoint.angles = (11.1291, 85.5047, 0);
		Spawnpoint.zone = "zone_tunnel_gun2stables";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-1198.51, 456.022, 8.125);
		Spawnpoint.angles = (4.72412, 322.576, 0);
		Spawnpoint.zone = "zone_street_lightwest";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-647.672, 651.021, 8.125);
		Spawnpoint.angles = (3.88367, 273.137, 0);
		Spawnpoint.zone = "zone_street_lightwest";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-181.019, 682.534, -1.86183);
		Spawnpoint.angles = (4.72412, 287.463, 0);
		Spawnpoint.zone = "zone_street_lightwest";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (129.513, 131.912, 10.125);
		Spawnpoint.angles = (5.35034, 146.091, 0);
		Spawnpoint.zone = "zone_street_lightwest";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-378.194, 684.629, 144.125);
		Spawnpoint.angles = (4.72412, 138.698, 0);
		Spawnpoint.zone = "zone_morgue_upstairs";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-548.441, 717.746, 156.125);
		Spawnpoint.angles = (6.61377, 32.674, 0);
		Spawnpoint.zone = "zone_morgue_upstairs";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();Spawnpoint.origin = (-1145.02, 825.755, 145.638);
		Spawnpoint.angles = (1.99402, 358.946, 0);
		Spawnpoint.zone = "zone_underground_jail2";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-822.859, 660.566, 146.232);
		Spawnpoint.angles = (4.09241, 177.38, 0);
		Spawnpoint.zone = "zone_street_lightwest";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-1166.41, 508.094, 144.125);
		Spawnpoint.angles = (4.50989, 340.928, 0);
		Spawnpoint.zone = "zone_street_lightwest";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (228.495, 50.8199, 12.2754);
		Spawnpoint.angles = (5.35034, 220.117, 0);
		Spawnpoint.zone = "zone_general_store";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (217.674, -239.727, 11.0457);
		Spawnpoint.angles = (4.93286, 133.951, 0);
		Spawnpoint.zone = "zone_general_store";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (83.6041, -731.599, 8.125);
		Spawnpoint.angles = (4.93286, 135.111, 0);
		Spawnpoint.zone = "zone_general_store";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-282.629, -575.587, 8.125);
		Spawnpoint.angles = (7.45422, 177.611, 0);
		Spawnpoint.zone = "zone_general_store";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (42.908, -452.852, 144.125);
		Spawnpoint.angles = (4.30115, 127.947, 0);
		Spawnpoint.zone = "zone_general_store";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (239.113, -229.124, 144.125);
		Spawnpoint.angles = (4.09241, 89.704, 0);
		Spawnpoint.zone = "zone_street_lighteast";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-239.087, -662.605, 141.127);
		Spawnpoint.angles = (3.04321, 218.804, 0);
		Spawnpoint.zone = "zone_street_darkwest";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-252.325, -387.119, 144.125);
		Spawnpoint.angles = (5.1416, 270.781, 0);
		Spawnpoint.zone = "zone_street_darkwest";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-385.991, -1453.39, 152.125);
		Spawnpoint.angles = (5.35034, 140.263, 0);
		Spawnpoint.zone = "zone_gun_store";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-882.03, -958.095, 149.559);
		Spawnpoint.angles = (4.72412, 271.704, 0);
		Spawnpoint.zone = "zone_gun_store";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-863.518, -961.565, 27.4427);
		Spawnpoint.angles = (7.45422, 266.26, 0);
		Spawnpoint.zone = "zone_gun_store";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-716.5, -1065.7, 11.2499);
		Spawnpoint.angles = (3.04321, 313.847, 0);
		Spawnpoint.zone = "zone_gun_store";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-395.216, -1057.58, 8.125);
		Spawnpoint.angles = (1.3623, 220.062, 0);
		Spawnpoint.zone = "zone_gun_store";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-222.241, -1054.97, 8.125);
		Spawnpoint.angles = (3.88366, 264.639, 0);
		Spawnpoint.zone = "zone_gun_store";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-720.799, -1488.46, 143.707);
		Spawnpoint.angles = (4.0924, 38.6231, 0);
		Spawnpoint.zone = "zone_gun_store";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (84.619, -1842.4, -15.5495);
		Spawnpoint.angles = (3.35632, 73.4725, 0);
		Spawnpoint.zone = "zone_street_darkeast_nook";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (319.785, -1786.98, 57.5262);
		Spawnpoint.angles = (3.56506, 85.9475, 0);
		Spawnpoint.zone = "zone_street_darkeast_nook";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-49.9076, -1337.51, 32.125);
		Spawnpoint.angles = (2.09839, 358.172, 0);
		Spawnpoint.zone = "zone_street_darkeast_nook";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (183.225, -634.097, -2.69232);
		Spawnpoint.angles = (4.19678, 297.879, 0);
		Spawnpoint.zone = "zone_street_darkeast";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (431.327, -424.304, 8.125);
		Spawnpoint.angles = (2.09839, 233.197, 0);
		Spawnpoint.zone = "zone_street_darkeast";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (846.991, -849.548, -21.2521);
		Spawnpoint.angles = (3.56506, 179.606, 0);
		Spawnpoint.zone = "zone_street_darkeast_nook";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (904.353, -1061.46, 56.125);
		Spawnpoint.angles = (1.04919, 178.683, 0);
		Spawnpoint.zone = "zone_street_darkeast_nook";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (882.464, -1186.08, 56.125);
		Spawnpoint.angles = (3.98804, 223.277, 0);
		Spawnpoint.zone = "zone_underground_bar";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (829.19, -1835.57, 45.3068);
		Spawnpoint.angles = (0.834961, 118.637, 0);
		Spawnpoint.zone = "zone_underground_bar";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (434.637, -1630.78, 61.0859);
		Spawnpoint.angles = (2.09839, 38.481, 0);
		Spawnpoint.zone = "zone_underground_bar";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (1070.51, -1807.74, 120.125);
		Spawnpoint.angles = (6.92688, 131.574, 0);
		Spawnpoint.zone = "zone_underground_bar";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (1317.32, -1805.42, 131.364);
		Spawnpoint.angles = (5.24597, 176.261, 0);
		Spawnpoint.zone = "zone_underground_bar";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (772.241, -1956.9, 192.125);
		Spawnpoint.angles = (7.13562, 86.3979, 0);
		Spawnpoint.zone = "zone_underground_bar";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (999.005, -1056.27, 208.744);
		Spawnpoint.angles = (6.29517, 179.035, 0);
		Spawnpoint.zone = "zone_street_darkeast_nook";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (546.99, -1217.8, 208.125);
		Spawnpoint.angles = (5.45471, 221.997, 0);
		Spawnpoint.zone = "zone_underground_bar";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (129.138, -2074.75, 237.15);
		Spawnpoint.angles = (11.3379, 75.082, 0);
		Spawnpoint.zone = "zone_tunnel_gun2saloon";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (442.551, -2006.67, 276.721);
		Spawnpoint.angles = (21.2091, 83.3986, 0);
		Spawnpoint.zone = "zone_tunnel_gun2saloon";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (548.751, -418.789, 8.125);
		Spawnpoint.angles = (2.51587, 309.547, 0);
		Spawnpoint.zone = "zone_toy_store";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (771.827, -659.014, 8.125);
		Spawnpoint.angles = (5.45471, 134.348, 0);
		Spawnpoint.zone = "zone_toy_store";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (1094.56, -553.531, 87.4985);
		Spawnpoint.angles = (13.0188, 135.501, 0);
		Spawnpoint.zone = "zone_toy_store_floor2";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (793.649, -462.817, 128.612);
		Spawnpoint.angles = (3.98804, 220.508, 0);
		Spawnpoint.zone = "zone_toy_store_floor2";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (517.741, 15.3339, 142.904);
		Spawnpoint.angles = (8.39905, 232.516, 0);
		Spawnpoint.zone = "zone_candy_store_floor2";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (772.531, -316.417, 132.904);
		Spawnpoint.angles = (1.04919, 142.093, 0);
		Spawnpoint.zone = "zone_candy_store_floor2";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (1052.28, -337.406, 13.5033);
		Spawnpoint.angles = (5.45471, 147.053, 0);
		Spawnpoint.zone = "zone_candy_store_floor2";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (444.01, -276.494, 8.125);
		Spawnpoint.angles = (4.61975, 358.057, 0);
		Spawnpoint.zone = "zone_candy_store";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-702.036, -935.803, 6.2531);
		Spawnpoint.angles = (4.40552, 37.3275, 0);
		Spawnpoint.zone = "zone_street_darkwest";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-245.346, -672.35, 8.125);
		Spawnpoint.angles = (7.55859, 217.965, 0);
		Spawnpoint.zone = "zone_street_darkwest";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-697.743, -445.091, -26.6175);
		Spawnpoint.angles = (2.93884, 312.678, 0);
		Spawnpoint.zone = "zone_street_darkwest";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (93.4102, 543.987, 8.125);
		Spawnpoint.angles = (3.51988, 321.882, 0);
		Spawnpoint.zone = "zone_street_lighteast";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (481.013, 660.207, -4.875);
		Spawnpoint.angles = (3.09691, 306.869, 0);
		Spawnpoint.zone = "zone_street_lighteast";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (909.437, 957.216, -55.875);
		Spawnpoint.angles = (1.63023, 335.511, 0);
		Spawnpoint.zone = "zone_street_fountain";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (1508.22, 1356.41, -14.8983);
		Spawnpoint.angles = (2.47069, 244.731, 0);
		Spawnpoint.zone = "zone_church_graveyard";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (1176.28, 1447.03, -19.875);
		Spawnpoint.angles = (6.8762, 251.657, 0);
		Spawnpoint.zone = "zone_church_graveyard";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (653.806, 1388.62, -15.267);
		Spawnpoint.angles = (3.09691, 301.788, 0);
		Spawnpoint.zone = "zone_church_graveyard";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (792.756, 1443.54, -18.4611);
		Spawnpoint.angles = (4.36033, 255.585, 0);
		Spawnpoint.zone = "zone_church_graveyard";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (656.484, 1038.02, 5.3753);
		Spawnpoint.angles = (6.66746, 21.2522, 0);
		Spawnpoint.zone = "zone_church_graveyard";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (892.132, 958.864, -55.875);
		Spawnpoint.angles = (358.9, 331.231, 0);
		Spawnpoint.zone = "zone_street_fountain";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (1452.93, 738.018, -23.83);
		Spawnpoint.angles = (3.72862, 236.755, 0);
		Spawnpoint.zone = "zone_street_fountain";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (1552.28, 96.6004, -6.03203);
		Spawnpoint.angles = (6.66746, 127.49, 0);
		Spawnpoint.zone = "zone_street_fountain";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (1259.05, 284.659, -65.327);
		Spawnpoint.angles = (358.686, 109.242, 0);
		Spawnpoint.zone = "zone_street_fountain";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (1861.95, 53.7586, 2.17718);
		Spawnpoint.angles = (8.76585, 112.708, 0);
		Spawnpoint.zone = "zone_mansion_lawn";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (2044.91, 108.891, 2.77685);
		Spawnpoint.angles = (5.61826, 124.952, 0);
		Spawnpoint.zone = "zone_mansion_lawn";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (2340.71, 560.791, 104.125);
		Spawnpoint.angles = (8.34836, 179.236, 0);
		Spawnpoint.zone = "zone_mansion_lawn";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (2317.21, 69.309, 88.125);
		Spawnpoint.angles = (4.98655, 120.915, 0);
		Spawnpoint.zone = "zone_mansion_lawn";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (2323.05, 1070.75, 88.125);
		Spawnpoint.angles = (3.93735, 232.256, 0);
		Spawnpoint.zone = "zone_mansion_lawn";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (2110.37, 1055.32, 1.37868);
		Spawnpoint.angles = (3.72861, 214.93, 0);
		Spawnpoint.zone = "zone_mansion_lawn";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (1711.63, 1096.08, 0.505673);
		Spawnpoint.angles = (2.25645, 299.475, 0);
		Spawnpoint.zone = "zone_mansion_lawn";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (33.6579, 631.435, 8.125);
		Spawnpoint.angles = (0.635948, 48.6245, 0);
		Spawnpoint.zone = "zone_underground_courthouse";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (396.335, 640.215, 8.125);
		Spawnpoint.angles = (2.10812, 132.708, 0);
		Spawnpoint.zone = "zone_underground_courthouse";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (571.508, 753.61, 8.125);
		Spawnpoint.angles = (0.218468, 135.938, 0);
		Spawnpoint.zone = "zone_underground_courthouse";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-91.7176, 1097.98, 32.125);
		Spawnpoint.angles = (3.15731, 312.758, 0);
		Spawnpoint.zone = "zone_underground_courthouse";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (358.039, 1354.5, 8.125);
		Spawnpoint.angles = (5.26119, 178.444, 0);
		Spawnpoint.zone = "zone_underground_courthouse";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (528.472, 1432.29, 144.125);
		Spawnpoint.angles = (7.15084, 268.664, 0);
		Spawnpoint.zone = "zone_underground_courthouse";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (562.744, 751.191, 176.125);
		Spawnpoint.angles = (2.53109, 130.753, 0);
		Spawnpoint.zone = "zone_underground_courthouse2";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (564.79, 1118.51, 176.125);
		Spawnpoint.angles = (1.4764, 227.542, 0);
		Spawnpoint.zone = "zone_underground_courthouse2";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-98.0876, 776.368, 176.125);
		Spawnpoint.angles = (2.10812, 1.52611, 0);
		Spawnpoint.zone = "zone_underground_courthouse2";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-62.0405, 1393.29, 144.125);
		Spawnpoint.angles = (2.10812, 269.587, 0);
		Spawnpoint.zone = "zone_underground_courthouse2";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (232.285, 1553.42, 144.125);
		Spawnpoint.angles = (5.04696, 268.203, 0);
		Spawnpoint.zone = "zone_underground_courthouse2";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (341.962, 1368.97, 144.125);
		Spawnpoint.angles = (3.58028, 178.801, 0);
		Spawnpoint.zone = "zone_underground_courthouse2";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-1016.39, -1040.97, -23.875);
		Spawnpoint.angles = (5.04699, 123.26, 0);
		Spawnpoint.zone = "zone_street_darkwest_nook";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-1345.66, -953.647, -16.8019);
		Spawnpoint.angles = (6.09619, 7.53005, 0);
		Spawnpoint.zone = "zone_street_darkwest_nook";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;
		Spawnpoint = Spawnstruct();
		Spawnpoint.origin = (-1134.83, -806.24, -17.4078);
		Spawnpoint.angles = (5.67871, 357.362, 0);
		Spawnpoint.zone = "zone_street_darkwest_nook";
		level.Spawnpoints[level.Spawnpoints.size] = Spawnpoint;	
	}
}

can_buy() {
	if (isDefined(self.is_drinking) && self.is_drinking > 0) {
		return 0;
	}
	if (self IsSwitchingWeapons()) {
		return 0;
	}
	if (self maps/mp/zombies/_zm_laststand::player_is_in_laststand()) {
		return 0;
	}
	current_weapon = self getcurrentweapon();
	if (is_placeable_mine(current_weapon) || is_equipment_that_blocks_purchase(current_weapon)) {
		return 0;
	}
	if (self in_revive_trigger()) {
		return 0;
	}
	if (current_weapon == "none") {
		return 0;
	}
	return 1;
}

playchalkfx(effect, origin, angles) //custom function
{
	for(;;)
	{
		fx = SpawnFX(level._effect[ effect ], origin,AnglesToForward(angles),AnglesToUp(angles));
		TriggerFX(fx);
		level waittill("connected", player);
		fx Delete();
	}
}

wallweaponmonitorbox(origin, angles, weapon, cost, ammo) {
	trigger = spawn("trigger_radius", origin, 0, 35, 80);
	weaponname = get_weapon_hint(weapon);
	trigger SetCursorHint("HINT_WEAPON", weapon);
	for (;;) {
		trigger waittill("trigger", player);
		if (player has_weapon_or_upgrade(weapon))
			if (player has_upgrade(weapon))
				finalcost = 4500;
			else
				finalcost = ammo;
		else
			finalcost = cost;
		trigger SetHintString(weaponname, cost);
		if (player usebuttonpressed() && player.score >= cost && player can_buy()) {
			grenades = player getweaponammoclip(player get_player_lethal_grenade());
			if (weapon == "semtex_bag") {
				if (grenades == 4) {
					wait 1;
					continue;
				}
				player.score -= cost;
				player thread weapon_give("frag_grenade_zm", 0, 1);
				player playsound("zmb_cha_ching");
				wait 2;
				continue;
			}
			if (!(player has_weapon_or_upgrade(weapon))) {
				player.score -= cost;
				player thread weapon_give(weapon, 0, 1);
				wait 3;
			}
			else {
				if (player has_upgrade(weapon) && player.score >= 4500) {
					if (player ammo_give(get_upgrade_weapon(weapon))) {
						player.score -= 4500;
						player playsound("zmb_cha_ching");
						wait 3;
					}
				}
				else if (player hasweapon(weapon) && player.score >= ammo) {
					if (player ammo_give(weapon)) {
						player.score -= ammo;
						player playsound("zmb_cha_ching");
						wait 3;
					}
				}
			}
		}
		else {
			play_sound_on_ent("no_purchase");
			if (player usebuttonpressed() && !player hasWeapon(weapon) && player.score < cost) {
				player maps/mp/zombies/_zm_audio::create_and_play_dialog("general", "no_money_weapon");
			}
		}
		wait .1;
	}
}

Get_Weapon_Damage(weap) {
	if(weap == "time_bomb_zm") {				//grenade
		mindamage = 0;
		maxdamage = 0;
	}
	else if(weap == "slowgun_zm") {				//mg
		mindamage = 0;
		maxdamage = 20;
	}
	else if(weap == "tazer_knuckles_zm") {				//melee
		mindamage = 100;
		maxdamage = 100;
	}
	else if(weap == "knife_ballistic_no_melee_zm") {				//pistol
		mindamage = 100;
		maxdamage = 100;
	}
	else if(weap == "knife_ballistic_bowie_zm") {				//pistol
		mindamage = 100;
		maxdamage = 100;
	}
	else if(weap == "knife_ballistic_zm") {				//pistol
		mindamage = 100;
		maxdamage = 100;
	}
	else if(weap == "raygun_mark2_zm") {				//pistol
		mindamage = 20;
		maxdamage = 30;
	}
	else if(weap == "ray_gun_zm") {				//pistol
		mindamage = 20;
		maxdamage = 30;
	}
	else if(weap == "cymbal_monkey_zm") {				//grenade
		mindamage = 100;
		maxdamage = 100;
	}
	else if(weap == "an94_zm") {				//rifle
		mindamage = 24;
		maxdamage = 40;
	}
	else if(weap == "m32_zm") {				//grenade
		mindamage = 100;
		maxdamage = 100;
	}
	else if(weap == "usrpg_zm") {				//rocketlauncher
		mindamage = 100;
		maxdamage = 100;
	}
	else if(weap == "claymore_zm") {				//grenade
		mindamage = 100;
		maxdamage = 100;
	}
	else if(weap == "frag_grenade_zm") {				//grenade
		mindamage = 100;
		maxdamage = 100;
	}
	else if(weap == "hamr_zm") {				//mg
		mindamage = 24;
		maxdamage = 40;
	}
	else if(weap == "lsat_zm") {				//mg
		mindamage = 24;
		maxdamage = 40;
	}
	else if(weap == "svu_zm") {				//rifle
		mindamage = 70;
		maxdamage = 100;
	}
	else if(weap == "barretm82_zm") {				//rifle
		mindamage = 70;
		maxdamage = 100;
	}
	else if(weap == "dsr50_zm") {				//rifle
		mindamage = 70;
		maxdamage = 120;
	}
	else if(weap == "fnfal_zm") {				//rifle
		mindamage = 40;
		maxdamage = 55;
	}
	else if(weap == "galil_zm") {				//rifle
		mindamage = 24;
		maxdamage = 40;
	}
	else if(weap == "tar21_zm") {				//rifle
		mindamage = 24;
		maxdamage = 40;
	}
	else if(weap == "m16_zm") {				//rifle
		mindamage = 24;
		maxdamage = 35;
	}
	else if(weap == "saritch_zm") {				//rifle
		mindamage = 49;
		maxdamage = 59;
	}
	else if(weap == "m14_zm") {				//rifle
		mindamage = 25;
		maxdamage = 45;
	}
	else if(weap == "srm1216_zm") {				//spread
		mindamage = 6;
		maxdamage = 25;
	}
	else if(weap == "saiga12_zm") {				//spread
		mindamage = 6;
		maxdamage = 30;
	}
	else if(weap == "rottweil72_zm") {				//spread
		mindamage = 45;
		maxdamage = 100;
	}
	else if(weap == "870mcs_zm") {				//spread
		mindamage = 45;
		maxdamage = 100;
	}
	else if(weap == "pdw57_zm") {				//smg
		mindamage = 16;
		maxdamage = 35;
	}
	else if(weap == "mp5k_zm") {				//smg
		mindamage = 18;
		maxdamage = 33;
	}
	else if(weap == "ak74u_zm") {				//smg
		mindamage = 18;
		maxdamage = 33;
	}
	else if(weap == "fivesevendw_zm") {				//pistol
		mindamage = 24;
		maxdamage = 55;
	}
	else if(weap == "beretta93r_zm") {				//pistol
		mindamage = 19;
		maxdamage = 45;
	}
	else if(weap == "fiveseven_zm") {				//pistol
		mindamage = 19;
		maxdamage = 55;
	}
	else if(weap == "kard_zm") {				//pistol
		mindamage = 19;
		maxdamage = 45;
	}
	else if(weap == "judge_zm") {				//pistol spread
		mindamage = 6;
		maxdamage = 50;
	}
	else if(weap == "rnma_zm") {				//pistol
		mindamage = 15;
		maxdamage = 60;
	}
	else if(weap == "m1911_zm") {				//pistol
		mindamage = 19;
		maxdamage = 30;
	}
	
	weapon_data = spawnstruct();
	weapon_data.damage_min = int(mindamage);
	weapon_data.damage_max = int(maxdamage);
	weapon_data.weapon_class = weaponclass(weap);
	
	return weapon_data;
}

draw_xp( xp_value, hint_text, color ) {
	if ( !isDefined( color ) )
		color = 9;

	if ( isDefined(self.xp_hint) ) {	
		self.xp_hint_text += "\n^" + color + "+" + xp_value + " XP^7 " + hint_text;
		self.xp_hint setText( self.xp_hint_text );
		return;
	}

	self.xp_hint = newclienthudelem( self );
	self.xp_hint.x = 35;
	self.xp_hint.y = -25;	
	self.xp_hint.alignx = "left";
	self.xp_hint.aligny = "top";
	self.xp_hint.horzalign = "center";
	self.xp_hint.vertalign = "middle";
	self.xp_hint.archived = false;
	self.xp_hint.foreground = false;
	self.xp_hint.fontscale = 2;
	self.xp_hint.alpha = 0;
	self.xp_hint.color = ( 1, 1, 1 );
	self.xp_hint.hidewheninmenu = true;
	self.xp_hint.hidewhendead = true;
	self.xp_hint.font = "default";
	
	self.xp_hint_text = "^" + color + "+" + xp_value + " XP^7 " + hint_text;
	self.xp_hint setText( self.xp_hint_text );
	
	self.xp_hint changefontscaleovertime( 0.25 );
	self.xp_hint fadeovertime( 0.25 );
	self.xp_hint.alpha = 1;
	self.xp_hint.fontscale = 1;
	
	wait 1.5;
	
	self.xp_hint fadeovertime( 0.25 );
	self.xp_hint.alpha = 0;
	
	wait .25;
	self.xp_hint destroy();
}

is_ks_weapon(weapon) {
	if(weapon == "m32_zm")
		return true;
	else if(weapon == "m32_upgraded_zm")
		return true;
	else
		return false;
}

fadetoblackforxsec_new( startwait, blackscreenwait, fadeintime, fadeouttime, shadername ) {
	if ( !isDefined( self.blackscreen ) )
		self.blackscreen = newclienthudelem( self );
	self.blackscreen.x = 0;
	self.blackscreen.y = 0;
	self.blackscreen.horzalign = "fullscreen";
	self.blackscreen.vertalign = "fullscreen";
	self.blackscreen.foreground = 0;
	self.blackscreen.hidewhendead = 0;
	self.blackscreen.hidewheninmenu = 1;
	self.blackscreen.hidewheninkillcam = 0;
	self.blackscreen.archived = false;
	self.blackscreen.sort = 50;
	if ( isDefined( shadername ) )
		self.blackscreen setshader( shadername, 640, 480 );
	else
		self.blackscreen setshader( "black", 640, 480 );
	self.blackscreen.alpha = 0;
	if ( fadeintime > 0 )
		self.blackscreen fadeovertime( fadeintime );
	self.blackscreen.alpha = 1;
	wait fadeintime;
	if ( !isDefined( self.blackscreen ) )
		return;
	wait blackscreenwait;
	if ( !isDefined( self.blackscreen ) )
		return;
	if ( fadeouttime > 0 )
		self.blackscreen fadeovertime( fadeouttime );
	self.blackscreen.alpha = 0;
	wait fadeouttime;
	if ( isDefined( self.blackscreen ) ) {
		self.blackscreen destroy();
		self.blackscreen = undefined;
	}
}

ui_create_name_hud(player, place) {
	hudelem = newhudelem();
	hudelem.horzalign = "fullscreen";
	hudelem.vertalign = "fullscreen";
	hudelem.alignx = "center";
	hudelem.aligny = "top";
	hudelem.alpha = 1;
	hudelem.sort = 1;
	hudelem.fontscale = 1.2;
	
	hudelembg = newhudelem();
	hudelembg.horzalign = "fullscreen";
	hudelembg.vertalign = "fullscreen";
	hudelembg.alignx = "center";
	hudelembg.aligny = "top";
	hudelembg.sort = 0;
	hudelembg.alpha = 0.45;
	hudelembg.color = (0,0,0);
	hudelembg setshader("line_horizontal", 175, 15);
	
	if(place == 1) {
		hudelem.x = 320;
		hudelem.y = 170;
		hudelembg.x = 320;
		hudelembg.y = 170;
		hudelem.color = (1, 0.827, 0);
	}
	else if(place == 2) {
		hudelem.x = 190;
		hudelem.y = 220;
		hudelembg.x = 190;
		hudelembg.y = 220;
		hudelem.color = (0.753, 0.753, 0.753);
	}
	else if(place == 3) {
		hudelem.x = 460;
		hudelem.y = 230;
		hudelembg.x = 460;
		hudelembg.y = 230;
		hudelem.color = (0.745, 0.537, 0.439);
	}
	
	hudelem settext(player.name);
} 






















