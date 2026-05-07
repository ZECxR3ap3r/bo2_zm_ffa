SetupKillstreaks() {
	add_streak("Subwoofer", "subwoofer_zm", 3, undefined);
	add_streak("UAV", undefined, 7, undefined);
	add_streak("War_Machine", "m32_zm", 5, ::ks_warmachine_init);
}

add_streak(streakuiname, streakcodename, streakcount, callback) {
	if(!isdefined(level.killstreaks))
		level.killstreaks = [];
		
	struct = spawnstruct();
	struct.streakname = streakuiname;
	if(isdefined(streakcodename))
		struct.codename = streakcodename;
	struct.adrenaline = streakcount;
	if(isdefined(callback))
		struct.function = callback;
	
	level.killstreak[streakuiname] = struct;
}

ks_warmachine_init() {
	self endon("disconnect");
	level endon("end_game");
	
	self thread ks_warmachine_ammo();
	self thread ks_warmachine_keep();
	
	self giveweapon("m32_upgraded_zm");
	self setspawnweapon("m32_upgraded_zm");
	self.warmachineshots = 12;
	self setweaponammostock("m32_upgraded_zm", self.warmachineshots);
}

ks_warmachine_keep() {
	self endon("disconnect");
	level endon("end_game");
	
	while(1) {
		self waittill("death");
		
		if(isdefined(self.warmachineshots)) {
			self takeweapon("m32_upgraded_zm");
			self giveweapon("m32_upgraded_zm");
			self setspawnweapon("m32_upgraded_zm");
		}
	}
}

ks_warmachine_ammo() {
	self endon("disconnect");
	level endon("end_game");
	
	while(1) {
		self waittill( "grenade_launcher_fire", grenade, weapname );
		if(weapname == "m32_upgraded_zm") {
			self.warmachineshots--;
			
			self setweaponammoclip("m32_upgraded_zm", 10);
			self setweaponammostock("m32_upgraded_zm", 10);
			
			if(self.warmachineshots <= 0) {
				self.warmachineshots = undefined;
				self takeweapon("m32_upgraded_zm");
				// Give saved weapon
			}
		}
	}
}











