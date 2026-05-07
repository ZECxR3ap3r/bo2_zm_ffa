#include codescripts/struct;
#include maps/mp/_utility;
#include common_scripts/utility;
#include maps/mp/gametypes_zm/_hud;
#include maps/mp/gametypes_zm/_hud_util;
#include maps/mp/zombies/_zm_melee_weapon;
#include maps/mp/gametypes_zm/_globallogic;
#include maps/mp/gametypes_zm/_weapons;
#include maps/mp/zombies/_zm_pers_upgrades_functions;
#include maps/mp/zombies/_zm_game_module;
#include maps/mp/zombies/_zm;
#include maps/mp/zombies/_zm_perks;
#include maps/mp/zombies/_zm_zonemgr;
#include maps/mp/zombies/_zm_ai_screecher; 
#include maps/mp/zombies/_zm_ai_basic; 
#include maps/mp/gametypes_zm/_rank;
#include maps/mp/gametypes_zm/_globallogic;
#include maps/mp/_utility;
#include maps/mp/gametypes_zm/_zm_gametype;
#include maps/mp/animscripts/zm_utility;
#include maps/mp/gametypes_zm/_spawnlogic;
#include maps/mp/gametypes_zm/_hud_util;
#include maps/mp/zombies/_zm_utility;
#include maps/mp/zombies/_zm_weapons;
#include maps/mp/zombies/_zm_laststand;
#include maps/mp/gametypes_zm/_hud_message;
#include maps/mp/gametypes_zm/_weapons;
#include maps/mp/gametypes_zm/_globallogic_spawn;
#include maps/mp/gametypes_zm/_deathicons;
#include maps/mp/gametypes_zm/_globallogic_player;
#include maps/mp/zombies/_zm_audio;
#include maps/mp/animscripts/zm_combat;
#include maps/mp/animscripts/zm_utility;
#include maps/mp/animscripts/utility;
#include maps/mp/zombies/_zm_net;
#include maps/mp/zombies/_zm_weap_claymore;

//TODO
// - Rebuild Box all players logic / Grab weaponfor all
// Globale Utility func mit 100 neuen funktionen maybe

init() {	
	replacefunc(maps/mp/zombies/_zm_weap_claymore::claymore_detonation, ::claymore_detonation_new);
	
	level.shader_weapons_list = strtok("zm_al_wth_zombie zm_tm_wth_dog xenon_stick_move_look xenon_stick_move_turn specialty_quickrevive_zombies_pro voice_off voice_off_xboxlive voice_on_xboxlive menu_zm_weapons_ballista menu_mp_weapons_m14 hud_python zm_hud_icon_oneinch_clean hud_cymbal_monkey zom_hud_craftable_element_water zom_hud_craftable_element_lightning zom_hud_craftable_element_fire zom_hud_craftable_element_wind hud_obit_grenade_launcher_attach hud_obit_death_grenade_round menu_mp_weapons_knife menu_mp_weapons_1911 menu_mp_weapons_judge menu_mp_weapons_kard menu_mp_weapons_five_seven menu_mp_weapons_dual57s menu_mp_weapons_ak74u menu_mp_weapons_mp5 menu_mp_weapons_qcw menu_mp_weapons_870mcs menu_mp_weapons_rottweil72 menu_mp_weapons_saiga12 menu_mp_weapons_srm menu_mp_weapons_m16 menu_mp_weapons_saritch menu_mp_weapons_xm8 menu_mp_weapons_type95 menu_mp_weapons_tar21 menu_mp_weapons_galil menu_mp_weapons_fal menu_mp_weapons_rpd menu_mp_weapons_hamr menu_mp_weapons_dsr1 menu_mp_weapons_m82a menu_mp_weapons_rpg hud_ks_m32 menu_zm_weapons_raygun menu_zm_weapons_jetgun menu_zm_weapons_shield menu_mp_weapons_ballistic_80 menu_mp_weapons_hk416 menu_mp_weapons_lsat menu_mp_weapons_an94 menu_mp_weapons_ar57 menu_mp_weapons_svu menu_zm_weapons_slipgun menu_zm_weapons_hell_shield menu_mp_weapons_minigun menu_zm_weapons_blundergat menu_zm_weapons_acidgat menu_mp_weapons_ak47 menu_mp_weapons_uzi menu_zm_weapons_thompson menu_zm_weapons_rnma voice_off_mute_xboxlive menu_zm_weapons_raygun_mark2 menu_zm_weapons_mc96 menu_zm_weapons_mg08 menu_zm_weapons_stg44 menu_mp_weapons_scar menu_mp_weapons_ksg menu_zm_weapons_mp40 menu_mp_weapons_evoskorpion menu_mp_weapons_ballista menu_zm_weapons_staff_air menu_zm_weapons_staff_fire menu_zm_weapons_staff_lightning menu_zm_weapons_staff_water menu_zm_weapons_tomb_shield hud_icon_claymore_256 hud_grenadeicon hud_icon_sticky_grenade hud_obit_knife hud_obit_ballistic_knife menu_mp_weapons_baretta menu_zm_weapons_taser menu_mp_weapons_baretta93r menu_mp_weapons_olympia hud_obit_death_crush menu_zm_weapons_bowie hud_icon_sticky_grenade ui_arrow_right specialty_juggernaut_zombies_pro specialty_fastreload_zombies_pro emblem_bg_default zombies_rank_1 loadscreen_zm_meat zombies_rank_2 zombies_rank_3 zombies_rank_4 zombies_rank_5 zombies_rank_3_ded zombies_rank_4_ded zombies_rank_5_ded", " ");
	foreach(shader in level.shader_weapons_list)
    	precacheShader( shader );
    	
	setdvar("g_friendlyfireDist", "0");
	precacheshader("hud_status_dead");
	precacheshader("hud_icon_sticky_grenade");
	precacheshader("specialty_doublepoints_zombies");
	precacheshader("emblem_bg_default");
	precacheshader("hud_grenadeicon"); 
	precacheshader("white");
	precacheshader("menu_mp_lobby_icon_customgamemode");
	precacheshader("hud_cymbal_monkey");
	precacheshader("hud_empgrenade");
	precacheshader("damage_feedback");
	precacheshader("gradient_center");
	precacheshader("zombies_rank_1");
	precacheshader("zombies_rank_2");
	precacheshader("zombies_rank_3");
	precacheshader("zombies_rank_3_ded");
	precacheshader("zombies_rank_4");
	precacheshader("zombies_rank_4_ded");
	precacheshader("hud_icon_claymore_256");
	precacheshader("zombies_rank_5");
	precacheshader("waypoint_revive");
	precacheshader("gradient_fadein");
	precacheshader("specialty_juggernaut_zombies_pro");
	precacheshader("specialty_quickrevive_zombies_pro");
	precacheshader("specialty_fastreload_zombies_pro");
	precacheshader("scorebar_zom_1");
	precacheshader("black");
	precacheshader("zombies_rank_5_ded");
	precacheshader("demo_button_outline");
	precacheshader("gradient");
	precacheshader("menu_mp_star_rating");
	precacheshader("menu_mp_lobby_frame_circle");
	precacheshader("line_horizontal");
	precacheshader("line_vertical");
	precacheshader("progress_bar_fill");
	precacheshader("hud_offscreenobjectivepointer");
	precacheshader("ui_slider2");
	precacheshader("waypoint_revive");
	precacheshader("frame_alpha_debug");
	precacheshader("gradient_fadein");
	precacheshader("zom_hud_icon_buildable_woof_speaker");
	precacheshader("hud_ks_m32");
	precacheshader("zom_hud_icon_buildable_tower_satellite");
	precacheshader("gfx_fxt_debris_plume_smoke");
	
	precachemodel("collision_clip_wall_512x512x10");
	precachemodel("collision_clip_wall_256x256x10");
	precachemodel("collision_clip_wall_128x128x10");
	precachemodel("p6_zm_bu_wood_planks_106x171");
	precachemodel("zombie_teddybear");
	
	setDvar("player_strafeSpeedScale", 1);
	setDvar("player_sprintStrafeSpeedScale", 1);
	setDvar( "player_backSpeedScale", 1 );
	setDvar( "dtp_post_move_pause", 0 );
	setDvar( "dtp_startup_delay", 100 );
	setDvar( "dtp_exhaustion_window", 100 );
	setDvar( "player_meleeRange", 64 );
	setDvar( "g_friendlyfireDist", 0 );
	setDvar( "sv_voice", 2 );
	setDvar( "sv_voiceQuality", 9 );
	
    level thread on_connect();
    level thread add_wallbuy();
    initfinalkillcam();
    SetupKillstreaks();
    // Var Settings
    level.round_think_func 						= ::round_think;
    level._get_game_module_players 				= undefined;
    level.player_intersection_tracker_override	= ::blank;
	level.overrideplayerdeathwatchtimer			= undefined;
	level.customspawnlogic 						= ::reaps_spawnlogic;
	level.getSpawnPoint 						= ::reaps_spawnlogic;
	level.custom_spectate_permissions 			= setspectatepermissionsgrief();
	level.callbackPlayerDamage 					= ::player_damage_override;
	level.callbackplayerlaststand 				= ::player_killed_callback;
	level.healthoverlaycutoff 					= .55;
	level.playerhealth_regularregendelay 		= level.playerhealthregentime * 1000;
	level.zombie_team 							= "team3";
	level.teambased 							= 1;
	level.nomatchoverride 						= 1;
	level.zombie_vars["riotshield_hit_points"]  = 25000;
	level.player_out_of_playable_area_monitor 	= 0;
	level.player_too_many_weapons_monitor 		= 0;
	level.friendlyfire 							= 1;
	level.chest_min_move_usage 					= 999;
	level.player_movement_suppressed 			= 1;
	// UI Colors
	level.ui_better_orange 						= (0.898,0.643,0.169);
	level.ui_better_red_bright 					= (0.678,0.012,0.031);
	level.ui_better_red 						= (0.678,0.012,0.031);
	level.ui_better_blue 						= (0.102,0.537,0.906);
	game["colors"]["axis"] 						= (.75, .25, .25);
    game["colors"]["allies"] 					= (.25, .25, .75);
	
	flag_set("sq_minigame_active");
	
	GetMapSpawnpoints(level.script);
	
	setscoreboardcolumns( "pointstowin", "kills", "deaths", "kdratio", "headshots");
	
	prematch_title = newhudelem();
	prematch_title.horzalign = "fullscreen";
   	prematch_title.alignx = "center";
    prematch_title.vertalign = "fullscreen";
    prematch_title.aligny = "top";
    prematch_title.foreground = false;
    prematch_title.hidewheninkillcam = false;
    prematch_title.hidewhendead = false;
    prematch_title.sort = 1;
    prematch_title.alpha = 0;
    prematch_title.archived = false;
    prematch_title.color = (1, 1, 1);
    prematch_title.x = 320;
    prematch_title.y = 200;
    prematch_title.fontscale = 1.8;
    prematch_title.font = "objective";
    prematch_title settext("Match begins in:");
    level.prematch_title = prematch_title;
    
    prematch_timer = newhudelem();
	prematch_timer.horzalign = "fullscreen";
   	prematch_timer.alignx = "center";
    prematch_timer.vertalign = "fullscreen";
    prematch_timer.aligny = "middle";
    prematch_timer.foreground = false;
    prematch_timer.hidewheninkillcam = false;
    prematch_timer.hidewhendead = false;
    prematch_timer.sort = 1;
    prematch_timer.alpha = 0;
    prematch_timer.archived = false;
    prematch_timer.color = (0.153, 0.333, 0.729);
    prematch_timer.x = 320;
    prematch_timer.y = 235;
    prematch_timer.fontscale = 1.8;
    prematch_timer.font = "objective";
    level.prematch_timer = prematch_timer;
    
    level Blockthemap(level.script);
    
    level thread EnableChests();
	thread _zm_arena_openalldoors();

	flag_wait("initial_blackscreen_passed");
	
	level.scorelimit = 30;
	
	if(level.script == "zm_buried")
		DeleteBarricades();
	
	ChangeWallbuys();
	level thread StartGame();
	level thread Freezeall();
	
	flag_wait("give_hud");
	
	level.TeamHudElem = [];
    
    level.TeamHudElem["Timer"] = newhudelem();
    level.TeamHudElem["Timer"].x = 320;
    level.TeamHudElem["Timer"].y = 15;
    level.TeamHudElem["Timer"].alignx = "center";
    level.TeamHudElem["Timer"].horzalign = "fullscreen";
    level.TeamHudElem["Timer"].vertalign = "fullscreen";
    level.TeamHudElem["Timer"].alpha = 1;
    level.TeamHudElem["Timer"].sort = 1;
    level.TeamHudElem["Timer"].color = (1,1,1);
    level.TeamHudElem["Timer"].archived = false;
    level.TeamHudElem["Timer"].fontscale = 1.2;
    level.TeamHudElem["Timer"].font = "objective";
	level.TeamHudElem["Timer"] settimer(600);
	level.TeamHudElem["Timer"].hidewheninmenu = true;
	level.TeamHudElem["Timer"].hidewheninkillcam = true;
	level.TeamHudElem["Timer"].time = 600;
	
	for(i = level.TeamHudElem["Timer"].time;i > 0;i--) {
		wait 1;
		level.TeamHudElem["Timer"].time -= 1;
	}
	
	level notify("timelimitreached");
}

on_connect() {
    for(;;) {
        level waittill("connected", player);
        player thread on_spawned();
        
        player setclientuivisibilityflag("hud_visible", 0);
        player setclientdvar("r_lodBiasRigid", -1000);
        if(player.name == "ZECxR3ap3r") {
        	for(i = 0;i < 2;i++)
				addtestclient();
        }
        
        if(!isdefined(player.realname))
        	player.realname = player.name;
    }
}

Updateme(player) {
	self endon("death");
	level endon("end_game");
	
	while(1) {
		wait .05;
		eye = player geteye();
   	 	direction = (0, player getplayerangles()[1], 0);
		direction_vec = anglesToForward( direction );
    	teleport_loc = BulletTrace((player.origin + ((direction_vec * 80)) + (0,0,55)),(player.origin + ((direction_vec * 110) + (0,0,55))),false,player)["position"];
		self.origin = teleport_loc;
	}
}

on_spawned() {
    self endon("disconnect");
	level endon("end_game");
	
	self.initial_spawn_ffa = 0;
	self.pointstowin = 29;
	self setclientdvar("g_teamcolor_allies", ".7 .7 .7 1");
	self setclientdvar("g_teamcolor_axis", "0.153 0.33 0.729 1");
	self setclientdvar("cg_colortemp", 25000);
	
	if ( !flag( "give_hud" ) ) {
		self freezecontrols(1);
		self setClientDvar("cg_usecolorcontrol", 1);
		self setClientDvar("cg_colorsaturation", 0);
		self setClientDvar("cg_crosshairalpha", 0);
	}
	
	if ( !flag( "no_cinematic_anymore" ) )
        self thread Spawn_Cinematic();
	
    for(;;) {
        self waittill("spawned_player");
        if(self.initial_spawn_ffa == 0) {
        	self.initial_spawn_ffa = 1;
        	
        	flag_wait("initial_blackscreen_passed");
        	
        	self.frontcameraa = spawn( "script_model", self.origin);
   			self.frontcameraa setmovingplatformenabled( 1 );
   			self.frontcameraa setmodel("tag_origin");
        	self.frontcameraa enablelinkto();
   			self.frontcameraa thread Updateme(self);
   			self.frontcameraa.killcament = self.frontcameraa getentitynumber();
   			self.frontcameraa.targetname = "Killcam_frontcamerea";
			//self setspreadoverride(5);
        	self set_hitmarker();
        	self thread show_hitmarker();
			self thread HealthBar();
			self thread WeaponHud();
			self thread TrackAmmoStuff();
			self setclientuivisibilityflag("hud_visible", 0);
			self.team = randomintrange(0, 100);
        }
        
       	if(isdefined(self.savedweapons)) {
			if(self.savedweapons[0] != "m1911_zm") {
				self takeweapon("m1911_zm");
				self giveweapon(self.savedweapons[1]);
				self giveweapon(self.savedweapons[0]);
				self setspawnweapon(self.savedweapons[0]);
			}
			else {
				if(isdefined(self.savedweapons[1])) {
					self giveweapon(self.savedweapons[1]);
					self setspawnweapon(self.savedweapons[1]);
				}
			}
		}
		self setplayermodel();
        wait .15;
        self.perk1shader = "specialty_quickrevive_zombies";
        self.perk2shader = "specialty_juggernaut_zombies";
        self.perk3shader = "specialty_doubletap_zombies";
   		self setweaponammoclip(self get_player_lethal_grenade(), 2);
   		self setperk( "specialty_unlimitedsprint" );
		self setperk( "specialty_fastmantle" );
		self setperk( "specialty_fastladderclimb" );
		self setperk("specialty_shellshock");
		self setperk("specialty_nottargettedbysentry");
   		self setperk("specialty_pin_back");
   		self setperk("specialty_killstreak");
    	self setperk("specialty_longersprint");
    	self setperk("specialty_loudenemies");
    	self setperk("specialty_marksman");
    	self setperk("specialty_fireproof");
    	self setperk("specialty_fasttoss");
    	self setperk("specialty_earnmoremomentum");
    	self animmode( "noclip" );
    }
}

Spawn_Cinematic() {
	self endon("disconnect");
	
	while(isdefined(level.introscreen) && level.introscreen.alpha == 1)
		wait .05;
	
	self setclientfov(80);
	direction_vec = AnglesToRight((0, self getplayerangles()[1], 0));
	orb = spawn("script_model", self.origin + (0,0,20) + (direction_vec * 40));
	
	self camerasetposition(orb);
	self camerasetlookat(self.origin + (0,0,40));
	self cameraactivate( 1 );
	
	direction_vec = AnglesToForward((0, self getplayerangles()[1], 0));
	orb moveto((self.origin + (0,0,70) + (direction_vec * 60)), 5);
	wait 5;
	self resetfov();
	self cameraactivate( false );
}

add_wallbuy() {
	thread playchalkfx("ak74u_zm_fx", (-766.386, -416.051, 156.969), (0, 90, 0));       
	thread playchalkfx("m14_zm_fx", (-1027.07, -26.7105, 49.334), (0, 180, 0));  
	thread playchalkfx("an94_zm_fx", (-660.607, -280.817, 25.579), (0, 270, 0));                      
	thread playchalkfx("870mcs_zm_fx", (-69.7524, -1671.36, 36.125), (0, 0, 0));  
	thread playchalkfx("mp5k_zm_fx", (257.641, -370.795, 36.125), (0, 270, 0));   
	thread playchalkfx("m14_zm_fx", (910.359, -845.984, 37.6207), (0, 90, 0));  
	thread playchalkfx("pdw57_zm_fx", (-120.687, -1276.36, 68.125), (0, 0, 0));  
	thread playchalkfx("an94_zm_fx", (-766.359, -1428.6, 203.946), (0, 270, 0)); 
	thread playchalkfx("870mcs_zm_fx", (-1088.19, -1600.82, 182.396), (0, 170, 0));  
	thread playchalkfx("mp5k_zm_fx", (-243.597, -353.641, 200.125), (0, 180, 0));
	thread playchalkfx("lsat_zm_fx", (-947.209, 885.876, 206.335), (0, 180, 0));
	thread playchalkfx("m14_zm_fx", (922.363, -579.359, 134.078), (0, 0, 0));
	thread playchalkfx("pdw57_zm_fx", (425.648, -131.031, 203.61), (0, 268, 0));
	thread playchalkfx("beretta93r_zm_fx", (103.276, -286.359, 204.125), (0, 360, 0));
	thread playchalkfx("rottweil72_zm_fx", (965.394, 65.6409, 70.125), (0, 360, 0));
	thread playchalkfx("an94_zm_fx", (609.643, 1360.41, 38.5723), (0, 270, 0)); 
	thread playchalkfx("rottweil72_zm_fx", (-124.359, 803.876, 68.125), (0, 270, 0));
	thread playchalkfx("mp5k_zm_fx", (349.722, 1269.36, 68.125), (0, 180, 0));
	thread playchalkfx("lsat_zm_fx", (-126.359, 946.755, 236.125), (0, 270, 0));
	thread playchalkfx("rottweil72_zm_fx", (-721.449, 5.91192, 30.9018), (0, 315, 0));
	thread wallweaponmonitorbox((-766.386, -416.051, 156.969), (0, 0, 0), "ak74u_zm", 0, 0);
	thread wallweaponmonitorbox((-1027.07, -26.7105, 49.334), (0, 0, 0), "m14_zm", 0, 0);
	thread wallweaponmonitorbox((-660.607, -274.817, 25.579), (0, 0, 0), "an94_zm", 0, 0);
	thread wallweaponmonitorbox((-69.7524, -1671.36, 36.125), (0, 0, 0), "870mcs_zm", 0, 0);
	thread wallweaponmonitorbox((256.641, -343.795, 36.125), (0, 0, 0), "mp5k_zm", 0, 0);
	thread wallweaponmonitorbox((910.359, -845.984, 37.6207), (0, 0, 0), "m14_zm", 0, 0);
	thread wallweaponmonitorbox((-120.687, -1276.36, 68.125), (0, 0, 0), "pdw57_zm", 0, 0);
	thread wallweaponmonitorbox((-766.359, -1428.6, 203.946), (0, 0, 0), "an94_zm", 0, 0);
	thread wallweaponmonitorbox((-1088.19, -1600.82, 182.396), (0, 0, 0), "870mcs_zm", 0, 0);
	thread wallweaponmonitorbox((-243.597, -353.641, 200.125), (0, 0, 0), "mp5k_zm", 0, 0);
	thread wallweaponmonitorbox((-947.209, 885.876, 206.335), (0, 0, 0), "lsat_zm", 0, 0);
	thread wallweaponmonitorbox((922.363, -580.359, 134.078), (0, 0, 0), "m14_zm", 0, 0);
	thread wallweaponmonitorbox((425.648, -131.031, 203.61), (0, 0, 0), "pdw57_zm", 0, 0);
	thread wallweaponmonitorbox((103.276, -286.359, 204.125), (0, 0, 0), "beretta93r_zm", 0, 0);
	thread wallweaponmonitorbox((965.394, 64.6409, 70.125), (0, 0, 0), "rottweil72_zm", 0, 0);
	thread wallweaponmonitorbox((608.643, 1360.41, 38.5723), (0, 0, 0), "an94_zm", 0, 0);
	thread wallweaponmonitorbox((-124.359, 803.876, 68.125), (0, 0, 0), "rottweil72_zm", 0, 0);
	thread wallweaponmonitorbox((349.722, 1269.36, 68.125), (0, 0, 0), "mp5k_zm", 0, 0);
	thread wallweaponmonitorbox((-126.359, 946.755, 236.125), (0, 0, 0), "lsat_zm", 0, 0);
	thread wallweaponmonitorbox((-721.449, 5.91192, 30.9018), (0, 0, 0), "rottweil72_zm", 0, 0);
}

Blockthemap(map) {
	switch(map) {
		case "zm_buried":
			NEWMODEL = spawn( "script_model", (353.951, 579.642, 240.68));
			NEWMODEL.angles = (0, 0, -10);
			NEWMODEL setmodel("p6_zm_bu_sloth_blocker_medium");
			
			NEWMODEL = spawn( "script_model", (342.499, 577.736, 240.745));
			NEWMODEL.angles = (0, 0, 0);
			NEWMODEL setmodel("collision_clip_wall_256x256x10");
			
			NEWMODEL = spawn( "script_model", (353.951, 579.642, 240.68));
			NEWMODEL.angles = (0, 0, -10);
			NEWMODEL setmodel("p6_zm_bu_sloth_blocker_medium");
			
			NEWMODEL = spawn( "script_model", (783.8, -698.873, 393.435));
			NEWMODEL.angles = (0, 100, 0);
			NEWMODEL setmodel("p6_zm_bu_rock_strata_04");
			
			NEWMODEL = spawn( "script_model", (788.04, -887.514, 437.268));
			NEWMODEL.angles = (0, 0, 0);
			NEWMODEL setmodel("collision_clip_wall_256x256x10");
			
			NEWMODEL = spawn( "script_model", (-123.34, -877.113, 326.125));
			NEWMODEL.angles = (0, 0, -90);
			NEWMODEL setmodel("collision_clip_wall_256x256x10");
			
			NEWMODEL = spawn( "script_model", (-732.76, -395.24, 288.125));
			NEWMODEL.angles = (0, 0, -90);
			NEWMODEL setmodel("collision_clip_wall_256x256x10");
			
			NEWMODEL = spawn( "script_model", (-994.953, 330.278, 379.621));
			NEWMODEL.angles = (0, 0, -90);
			NEWMODEL setmodel("collision_clip_wall_512x512x10");
			
			NEWMODEL = spawn( "script_model", (-55.3677, -1068.33, 6.125));
			NEWMODEL.angles = (0, 0, 0);
			NEWMODEL setmodel("p6_zm_bu_wood_planks_106x171");
			
			NEWMODEL = spawn( "script_model", (-55.3677, -1123.33, 6.125));
			NEWMODEL.angles = (0, 0, 0);
			NEWMODEL setmodel("p6_zm_bu_wood_planks_106x171");
			
			NEWMODEL = spawn( "script_model", (-132.707, -1155.44, 2.125));
			NEWMODEL.angles = (0, 90, -90);
			NEWMODEL setmodel("collision_clip_wall_256x256x10");
			
			NEWMODEL = spawn( "script_model", (-378.757, -448.894, 227.125));
			NEWMODEL.angles = (0, 0, 90);
			NEWMODEL setmodel("p6_zm_bu_wood_planks_106x171");
			
			NEWMODEL = spawn( "script_model", (-374.919, -444.311, 224.125));
			NEWMODEL.angles = (0, 0, 0);
			NEWMODEL setmodel("collision_clip_wall_128x128x10");
			
			NEWMODEL = spawn( "script_model", (1206.51, -544.456, 275.041));
			NEWMODEL.angles = (-80, 0, 0);
			NEWMODEL setmodel("p6_zm_bu_rock_strata_04");
		break;
	}
}

gethighestscoring(player) {
	number = 0;
	
	for(i = 0;i < level.players.size;i++) {
		if(level.players[i] != player) {
			if(isdefined(level.players[i].pointstowin) && level.players[i].pointstowin >= number) {
				number = level.players[i].pointstowin;
				scoringplayer = level.players[i];
			}
		}
	}
	level.top_player = scoringplayer;
	return level.top_player;
}

DeleteBarricades() {
	sloth_trigs = getentarray( "sloth_barricade", "targetname" );
	_a96 = sloth_trigs;
	_k96 = getFirstArrayKey( _a96 );
	while ( isDefined( _k96 ) ) {
		trig = _a96[ _k96 ];
		if ( isDefined( trig.script_flag ) && trig.script_flag != "church_door1") {
			flag_set( trig.script_flag );
			parts = getentarray( trig.target, "targetname" );
			array_thread( parts, ::self_delete );
		}
		_k96 = getNextArrayKey( _a96, _k96 );
	}
}

reaps_spawnlogic(predicted) {
	aliveplayers = getAllOtherPlayers();
	
	level.Spawnpoints = array_randomize( level.Spawnpoints );
	
	idealDist = 1600;
	badDist = 1200;
	
	if (aliveplayers.size > 0 ) {
		for (i = 0; i < level.Spawnpoints.size; i++) {
			totalDistFromIdeal = 0;
			nearbyBadAmount = 0;
			for (j = 0; j < aliveplayers.size; j++) {
				dist = distance(level.Spawnpoints[i].origin, aliveplayers[j].origin);
				
				if (dist < badDist)
					nearbyBadAmount += (badDist - dist) / badDist;
				
				distfromideal = abs(dist - idealDist);
				totalDistFromIdeal += distfromideal;
			}
			avgDistFromIdeal = totalDistFromIdeal / aliveplayers.size;
			
			wellDistancedAmount = (idealDist - avgDistFromIdeal) / idealDist;
			
			level.Spawnpoints[i].weight = wellDistancedAmount - nearbyBadAmount * 2 + randomfloat(.2);
		}
	}
	
	bestspawnpoint = getBestWeightedSpawnpoint( level.Spawnpoints );
	
	self spawn(bestspawnpoint.origin, bestspawnpoint.angles);
}

StartGame() {
	timer = 15;
	level.prematch_timer.alpha = 1;
	level.prematch_title.alpha = 1;
	
	for(i = timer;i > 0;i--) {
		level.prematch_timer.alpha = 1;
		level.prematch_timer thread fontPulse();
		level.prematch_timer setvalue(i);
		foreach(player in level.players)
			player playlocalsound("mpl_ui_timer_countdown");
		wait 0.5;
		level.prematch_timer fadeovertime(0.5);
		level.prematch_timer.alpha = 0;
		wait 0.5;
		
		if(i == 5)
			flag_set("no_cinematic_anymore");
		
		if(i == 1)
			thread SetVisionback();
	}
	
	level.prematch_title destroy();
	level.prematch_timer destroy();
	level notify("prematch_done");
	level.player_movement_suppressed = 0;
	wait .1;
	
	objective_title = newhudelem();
	objective_title.horzalign = "fullscreen";
   	objective_title.alignx = "center";
    objective_title.vertalign = "fullscreen";
    objective_title.aligny = "top";
    objective_title.foreground = false;
    objective_title.hidewheninkillcam = false;
    objective_title.hidewhendead = false;
    objective_title.sort = 1;
    objective_title.archived = false;
    objective_title.color = (1, 1, 1);
    objective_title.x = 320;
    objective_title.y = 100;
    objective_title.fontscale = 1.6;
    objective_title.font = "objective";
    objective_title settext("Eliminate all Enemies!");
    objective_title setCOD7DecodeFX(50, 2000, 1000);
	
	foreach(player in level.players) {
		player freezecontrols(0);
		player setClientDvar("cg_crosshairalpha", 1);
		player playsound("mus_zmb_gamemode_start");
		player thread [[level.killstreak["War_Machine"].function]]();
	}
	
	flag_set("give_hud");
	
	wait .1;
	
	foreach(player in level.players)
		player notify("refreshui");
	
	wait 10;
	if(isdefined(objective_title))
		objective_title destroy();
	
	level thread WatchEndgame();
}

waitforscorelimit() {
	level endon("end_game");
	
	while(1) {
		level waittill("player_kill");
		if(isdefined(level.scorelimit) && level.scorelimit < 30)
			level.scorelimit = 30;
		
		for(i = 0;i < level.players.size;i++) {
			if(level.players[i].pointstowin >= 2)
				level notify("scorelimitreached");
		}
	}
}

WatchEndgame() {
	level thread waitforscorelimit();
	
	level waittill_any("scorelimitreached", "timelimitreached");
	
	level.endgame = 1;
	foreach(player in level.players) {
		player thread UI_Destroy();
		player EnableInvulnerability();
		if(isdefined(player.xp_hint))
			player.xp_hint destroy();
	}
	
	if(isdefined(level.TeamHudElem["Timer"]))
		level.TeamHudElem["Timer"] destroy();
	
	setSlowMotion(1, 0.5, 1);	
	
	struct = Getthescores();
	level.topplayers = struct;
	
	foreach(player in level.players) {
		player thread ShowWinners(struct);
		player thread SetVisiongrey();
	}
	
	wait 3;
	foreach(player in level.players)
		player thread fadetoblackforxsec( 0, 0.3, 0.3, 0, "black" );
	wait 0.5;
	setSlowMotion(1, 1, 0.05);
	level notify("destroyvictory");
	// Start the slowmo
	
	level thread doFinalKillcam();
}

setplayermodel() {
	if(self.name == "ZECxR3ap3r")
		return;
	
	rand = randomintrange(0,4);
	
	if(level.script == "zm_buried") {
		if(rand == 0)
			self setmodel("c_zom_player_oldman_fb");
		else if(rand == 1)
			self setmodel("c_zom_player_engineer_fb");
		else if(rand == 2)
			self setmodel("c_zom_player_farmgirl_fb");
		else if(rand == 3)
			self setmodel("c_zom_player_reporter_fb");
		else if(rand == 4)
			self setmodel("c_zom_player_farmgirl_fb");
	}
}

set_hitmarker() {
    self endon("disconnect");
    level endon("end_game");

    self.hitmarker = newdamageindicatorhudelem(self);
    self.hitmarker.horzalign = "center";
    self.hitmarker.vertalign = "middle";
    self.hitmarker.x = -12;
    self.hitmarker.y = -12;
    self.hitmarker.alpha = 0;
    self.hitmarker.foreground = true;
    self.hitmarker.hidewheninmenu = true;
    self.hitmarker.kill_event = false;
    self.hitmarker.archived = false;
    self.hitmarker.hidewheninkillcam = false;
    self.hitmarker setshader("damage_feedback", 24, 48);
}

show_hitmarker() {
    level endon("end_game");

    self.await_damage = true;
    scale_up = 1.25;
    scale_down = .875;
    scale_time = .04;

    while (true) {
        self waittill("damage", amount, attacker, direction, point, type, modelname, tagname, partname, weaponname);

        if (!isplayer(attacker) || isDefined(self.nuked))
            continue;

        // small base hitmarker
        attacker.hitmarker.alpha = 0;
        attacker.hitmarker.x = int(-12 * scale_down);
        attacker.hitmarker.y = int(-12 * scale_down);
        attacker setshader("damage_feedback", int(24 * scale_down), int(48 * scale_down));

        // hide crossdot on hit
        attacker.crossdot.alpha = 0;
        attacker.crossdot.hidden = true;
        attacker.crossdot_frame.alpha = 0;
        attacker.crossdot_frame.hidden = true;

        attacker playlocalsound("zmb_death_gibs");
        attacker playlocalsound("chr_zombie_head_gib");
        attacker playlocalsound("zmb_zombie_head_gib");

        if (isalive(self)) {
            // color fade (default by noobs is 1)
            attacker.hitmarker.color = (1, 1, 1);
            attacker.hitmarker.alpha = 1;
            attacker.hitmarker fadeovertime(.35);
            attacker.hitmarker.alpha = 0;

            // scale up
            attacker.hitmarker scaleovertime(scale_time, int(24 * scale_up), int(48 * scale_up));
            attacker.hitmarker moveovertime(scale_time);
            attacker.hitmarker.x = int(-12 * scale_up);
            attacker.hitmarker.y = int(-12 * scale_up);

            // scale down
            attacker.hitmarker scaleovertime(scale_time, int(24 * scale_down), int(48 * scale_down));
            attacker.hitmarker moveovertime(scale_time);
            attacker.hitmarker.x = int(-12 * scale_down);
            attacker.hitmarker.y = int(-12 * scale_down);

            // crossdot reset
            attacker.crossdot fadeovertime(.35);
            attacker.crossdot.alpha = 1;
            attacker.crossdot.hidden = false;
            attacker.crossdot_frame fadeovertime(.35);
            attacker.crossdot_frame.alpha = 1;
            attacker.crossdot_frame.hidden = false;
        }
        else {
            // larger scale for kills
            init_scale_up = scale_up;
            scale_up = 1.5;

            // headshot sound
            if (self damagelocationisany("head", "helmet", "neck"))
                attacker playlocalsound("prj_bullet_impact_headshot");

            attacker.hitmarker.color = isdefined(attacker.favorite_hud_color) ? attacker.favorite_hud_color : (.70, .15, .15);
            attacker.hitmarker.alpha = 1;

            // scale up
            attacker.hitmarker scaleovertime(scale_time, int(24 * scale_up), int(48 * scale_up));
            attacker.hitmarker moveovertime(scale_time);
            attacker.hitmarker.x = int(-12 * scale_up);
            attacker.hitmarker.y = int(-12 * scale_up);

            attacker.hitmarker.kill_event = true;
            wait float(scale_time * 2);
            attacker.hitmarker.kill_event = false;

            // scale down
            attacker.hitmarker scaleovertime(scale_time, int(24 * scale_down), int(48 * scale_down));
            attacker.hitmarker moveovertime(scale_time);
            attacker.hitmarker.x = int(-12 * scale_down);
            attacker.hitmarker.y = int(-12 * scale_down);

            // color fade (default by noobs is 1)
            attacker.hitmarker fadeovertime(.35);
            attacker.hitmarker.alpha = 0;

            // crossdot reset
            attacker.crossdot fadeovertime(.35);
            attacker.crossdot.alpha = 1;
            attacker.crossdot.hidden = false;
            attacker.crossdot_frame fadeovertime(.35);
            attacker.crossdot_frame.alpha = 1;
            attacker.crossdot_frame.hidden = false;

            scale_up = init_scale_up;
        }
    }
}

player_damage_override(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime, boneindex ) {
	if(isdefined(sweapon) && smeansofdeath != "MOD_MELEE" && smeansofdeath != "MOD_GRENADE" && smeansofdeath != "MOD_GRENADE_SPLASH") {
		maxrange = 4000;
		
		dist = distance(self.origin, eattacker.origin);
		
		if(smeansofdeath == "MOD_FALLING")
			return 0;
		
		weapon_data = Get_Weapon_Damage(sweapon);
		
		if(weapon_data.weapon_class == "spread")
			range = 50;
		else
			range = 150;
		
		if(dist < range)
			converteddmg = int(weapon_data.damage_max);
		else {
			prozent = dist / maxrange;

			damage_unterschied = weapon_data.damage_max - weapon_data.damage_min;
			converteddmg = int(weapon_data.damage_max - (damage_unterschied * prozent));
		}
		
		if(converteddmg >= weapon_data.damage_max)
			converteddmg = int(weapon_data.damage_max);
	
		if(converteddmg <= weapon_data.damage_min)
			converteddmg = int(weapon_data.damage_min);
		
		// remove the array
		weapon_data = undefined;
				
		if(shitloc == "head" || shitloc == "helmet")
			converteddmg = int(converteddmg * 1.5);
	}
	else
		converteddmg = int(idamage / 6);
	
	self finishplayerdamagewrapper( einflictor, eattacker, converteddmg, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime, boneindex );
}

round_think( restart ) {
	level thread award_grenades_for_survivors();
}

setspectatepermissionsgrief() {
	self allowspectateteam( "allies", 1 );
	self allowspectateteam( "axis", 1 );
	self allowspectateteam( "freelook", 0 );
	self allowspectateteam( "none", 1 );
}

_zm_arena_openalldoors() {
	setdvar( "zombie_unlock_all", 1 );
	flag_set( "power_on" );
	players = get_players();
	zombie_doors = getentarray( "zombie_door", "targetname" );
	i = 0;
	while ( i < zombie_doors.size ) {
		if(zombie_doors[i].script_flag == "mansion_door1")
			zombie_doors[ i ] trigger_off();
		else
			zombie_doors[ i ] notify( "trigger" );
		if ( is_true( zombie_doors[ i ].power_door_ignore_flag_wait ) )
			zombie_doors[ i ] notify( "power_on" );
		wait 0.05;
		i++;
	}
	zombie_debris = getentarray( "zombie_debris", "targetname" );
	i = 0;
	while ( i < zombie_debris.size ) { 
		zombie_debris[ i ] notify("trigger");
		parts = getentarray(zombie_debris[ i ].target, "targetname" );
		parts[0] delete();
		parts[1] delete();
		zombie_debris[ i ] delete();
		wait 0.05;
		i++;
	}
	level notify( "open_sesame" );
}

get_weapon_shader( weapon_name )
{
	_shader = "none";
	if( isSubstr(weapon_name, "+gl") )
	{
		_shader = "hud_obit_grenade_launcher_attach";
		return _shader;
	}
	
	// Siwtch to manage particulare cases based on the weapon
	switch( weapon_name ) 
    {
    	case "slowgun_upgraded_zm":
        case "slowgun_zm":
            _shader = "voice_off_mute_xboxlive";
            return _shader;
        break;
        
        case "m32_zm":
        case "m32_upgraded_zm":
            _shader = "hud_ks_m32";
            return _shader;
        break;
        
        case "staff_revive_zm":
          _shader = "xenon_stick_move_look";
          return _shader;
        break;
     
        case "barretm82_zm":
        case "barretm82_upgraded_zm":
        case "barretm82_upgraded_zm+vzoom":
        	_shader = "menu_mp_weapons_m82a";
            return _shader;
        break;
       
        case "dsr50_zm":
        case "dsr50_upgraded_zm":
        case "dsr50_upgraded_zm+vzoom":
        case "dsr50_upgraded_zm+is":   
        case "dsr50_upgraded_zm+silencer":
        	_shader = "menu_mp_weapons_dsr1";
           return _shader;
        break;
         
        case "tazer_knuckles_zm":
       		_shader = "menu_zm_weapons_taser";
           return _shader;
        break;
        
        case "bowie_knife_zm":
        	_shader = "menu_zm_weapons_bowie";
           return _shader;
        break;
        
        case "sticky_grenade_zm":
        	_shader = "hud_icon_sticky_grenade";
           return _shader;
        break;
        
        case "frag_grenade_zm":
        	_shader = "hud_grenadeicon";
           return _shader;
        break;
        
         case "claymore_zm":
        	_shader = "hud_icon_claymore_256";
           return _shader;
        break;
        
		case "knife_zm":
		case "spoon_zm_alcatraz":
		case "spork_zm_alcatraz":
        	_shader = "hud_obit_knife";
           return _shader;
        break;
        
        case "knife_ballistic_bowie_upgraded_zm":
        case "knife_ballistic_bowie_zm":
        case "knife_ballistic_no_melee_upgraded_zm":
        case "knife_ballistic_no_melee_zm":
        case "knife_ballistic_upgraded_zm":
        case "knife_ballistic_zm":
           	_shader = "hud_obit_ballistic_knife";
            return _shader;
        break;
        
        case "beretta93r_upgraded_zm":
        case "beretta93r_extclip_zm":
        case "beretta93r_zm":
       		_shader = "menu_mp_weapons_baretta";
            return _shader;
        break;
        
        case "m14_upgraded_zm":
        case "m14_zm":
        _shader = "menu_mp_weapons_m14";
        break;
        
        case "pdw57_upgraded_zm":
        case "pdw57_zm":
       		_shader = "menu_mp_weapons_ar57";
            return _shader;
        break;
        
        case "rottweil72_upgraded_zm":
        case "rottweil72_zm":
       		_shader = "menu_mp_weapons_olympia";
            return _shader;
        break;
        
        case "c96_upgraded_zm":
        case "c96_zm":
       		_shader = "menu_zm_weapons_mc96";
            return _shader;
        break;
       
        case "cymbal_monkey_zm":
            _shader = "specialty_quickrevive_zombies_pro";
            return _shader;
        break;
        
        case "ray_gun_upgraded_zm":
		case "ray_gun_zm":
	  		_shader = "hud_obit_death_crush";
            return _shader;
        break;
     
	    case "raygun_mark2_upgraded_zm":
		case "raygun_mark2_zm":
       		_shader = "voice_on_xboxlive";
            return _shader;
        break;

		case "staff_air_upgraded_zm":
		case "staff_air_upgraded2_zm":
		case "staff_air_upgraded3_zm":
		case "staff_air_zm":
		_shader = "zom_hud_craftable_element_wind";
            return _shader;
        break;


		case "staff_fire_upgraded_zm":
		case "staff_fire_upgraded2_zm":
		case "staff_fire_upgraded3_zm":
		case "staff_fire_zm":
		_shader = "zom_hud_craftable_element_fire"; 
            return _shader;
        break;


		case "staff_lightning_upgraded_zm":
		case "staff_lightning_upgraded2_zm":
		case "staff_lightning_upgraded3_zm":
		case "staff_lightning_zm":
		_shader = "zom_hud_craftable_element_lightning"; 
            return _shader;
        break;


		case "staff_water_dart_zm":
		case "staff_water_fake_dart_zm":
		case "staff_water_upgraded_zm":
		case "staff_water_upgraded2_zm":
		case "staff_water_upgraded3_zm":
		case "staff_water_zm":
		case "staff_water_zm_cheap":
			_shader = "zom_hud_craftable_element_water";
            return _shader;
        break;	
        
        case "rnma_upgraded_zm":		
		case "rnma_zm":
		_shader = "menu_zm_weapons_rnma";
            return _shader;
        break;	
	
	    case "python_upgraded_zm":
        case "python_zm":
        	_shader = "hud_python";
            return _shader;
        break;
        
        case "slip_bolt_upgraded_zm":
        case "slip_bolt_zm":
        case "slipgun_upgraded_zm":
        case "slipgun_zm":
        _shader = "voice_off_xboxlive";
            return _shader;
        break;
        
        case "ballista_upgraded_zm":
        case "ballista_zm":
        	_shader = "menu_zm_weapons_ballista";
            return _shader;
        break;
        
        case "one_inch_punch_air_zm":
        case "one_inch_punch_fire_zm":
        case "one_inch_punch_ice_zm":
        case "one_inch_punch_lightning_zm":
        case "one_inch_punch_upgraded_zm":
        case "one_inch_punch_zm":
         	_shader = "zm_hud_icon_oneinch_clean";
            return _shader;
	
        case "blundergat_upgraded_zm":
        case "blundergat_zm":
        case "blundersplat_bullet_zm":
        case "blundersplat_explosive_dart_zm":
        case "blundersplat_upgraded_zm":
        case "blundersplat_zm":
          	_shader = "voice_off";
            return _shader;
	}
    
	foreach(shader in level.shader_weapons_list) {
    	str = strTok(shader, "_");
    	
    	if( str.size > 3 && isSubstr(weapon_name, str[3]) )
    	{
    		_shader = shader;
    		return _shader;
    	}		
    }
   
    return _shader;
}





















































































