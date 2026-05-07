Killcam_Overlay(attacker, weapon, perk1, perk2, perk3, killcamtime, reason) {
	topbackground = newclienthudelem(self);
	topbackground.horzalign = "fullscreen";
   	topbackground.alignx = "center";
    topbackground.vertalign = "fullscreen";
    topbackground.aligny = "top";
    topbackground.foreground = true;
    topbackground.hidewheninkillcam = false;
    topbackground.hidewhendead = false;
    topbackground.archived = false;
    topbackground.sort = 1;
    topbackground.alpha = 0;
    topbackground.color = (0.3, 0.3, 0.3);
    topbackground.x = 320;
    topbackground.y = -120;
    topbackground setshader("frame_alpha_debug", 640, 57);
    
    bottombackground = newclienthudelem(self);
	bottombackground.horzalign = "fullscreen";
   	bottombackground.alignx = "center";
    bottombackground.vertalign = "fullscreen";
    bottombackground.aligny = "bottom";
    bottombackground.foreground = false;
    bottombackground.hidewheninkillcam = false;
    bottombackground.hidewhendead = false;
    bottombackground.archived = false;
    bottombackground.sort = 1;
    bottombackground.alpha = 0;
    bottombackground.color = (0.3, 0.3, 0.3);
    bottombackground.x = 320;
    bottombackground.y = 600;
    bottombackground setshader("frame_alpha_debug", 640, 57);
    
    bottombackground.y = 480;
    bottombackground.alpha = 1;
    topbackground.y = 0;
    topbackground.alpha = 1;
    
    // spawn the text huds
    
    topline = newclienthudelem(self);
	topline.horzalign = "fullscreen";
   	topline.alignx = "center";
    topline.vertalign = "fullscreen";
    topline.aligny = "top";
    topline.foreground = true;
    topline.hidewheninkillcam = false;
    topline.hidewhendead = false;
    topline.archived = false;
    topline.sort = 2;
    topline.alpha = 1;
    topline.color = (1, 1, 1);
    topline.x = 320;
    topline.y = 57;
    topline setshader("line_horizontal", 500, 1);
    
    bottomline = newclienthudelem(self);
	bottomline.horzalign = "fullscreen";
   	bottomline.alignx = "center";
    bottomline.vertalign = "fullscreen";
    bottomline.aligny = "bottom";
    bottomline.foreground = true;
    bottomline.hidewheninkillcam = false;
    bottomline.hidewhendead = false;
    bottomline.archived = false;
    bottomline.sort = 2;
    bottomline.alpha = 1;
    bottomline.color = (1, 1, 1);
    bottomline.x = 320;
    bottomline.y = 423;
    bottomline setshader("line_horizontal", 500, 1);
    
    killcamtimer = newclienthudelem(self);
	killcamtimer.horzalign = "fullscreen";
   	killcamtimer.alignx = "center";
    killcamtimer.vertalign = "fullscreen";
    killcamtimer.aligny = "middle";
    killcamtimer.foreground = true;
    killcamtimer.hidewheninkillcam = false;
    killcamtimer.hidewhendead = false;
    killcamtimer.sort = 3;
    killcamtimer.alpha = 1;
    killcamtimer.archived = false;
    killcamtimer.color = (1, 1, 1);
    killcamtimer.x = 320;
    killcamtimer.y = 28;
    killcamtimer.font = "bigfixed";
    killcamtimer.fontscale = 1.25;
    killcamtimer thread setmstimer(killcamtime, 1);
    
    killcamtext = newclienthudelem(self);
	killcamtext.horzalign = "fullscreen";
   	killcamtext.alignx = "center";
    killcamtext.vertalign = "fullscreen";
    killcamtext.aligny = "top";
    killcamtext.foreground = true;
    killcamtext.hidewheninkillcam = false;
    killcamtext.hidewhendead = false;
    killcamtext.sort = 2;
    killcamtext.alpha = 1;
    killcamtext.archived = false;
    killcamtext.color = (0.2, 0.2, 0.2);
    killcamtext.x = 320;
    killcamtext.y = -11;
    killcamtext.font = "bigfixed";
    killcamtext.fontscale = 3.1;
    killcamtext settext(reason);
    
    killedby = newclienthudelem(self);
	killedby.horzalign = "fullscreen";
   	killedby.alignx = "left";
    killedby.vertalign = "fullscreen";
    killedby.aligny = "top";
    killedby.foreground = true;
    killedby.hidewheninkillcam = false;
    killedby.hidewhendead = false;
    killedby.sort = 1;
    killedby.alpha = 1;
    killedby.archived = false;
    killedby.color = (1, 1, 1);
    killedby.x = 350;
    killedby.y = 437;
    killedby.fontscale = 1.15;
    killedby settext("^8Killed By ^7\n" + attacker.realname);
    
    killedbyrank = newclienthudelem(self);
	killedbyrank.horzalign = "fullscreen";
   	killedbyrank.alignx = "center";
    killedbyrank.vertalign = "fullscreen";
    killedbyrank.aligny = "bottom";
    killedbyrank.foreground = true;
    killedbyrank.hidewheninkillcam = false;
    killedbyrank.hidewhendead = false;
    killedbyrank.archived = false;
    killedbyrank.sort = 3;
    killedbyrank.alpha = 1;
    killedbyrank.color = (1, 1, 1);
    killedbyrank.x = 320;
    killedbyrank.y = 455;
    killedbyrank setshader("zombies_rank_5_ded", 45, 55);
    
    killedwith = newclienthudelem(self);
	killedwith.horzalign = "fullscreen";
   	killedwith.alignx = "right";
    killedwith.vertalign = "fullscreen";
    killedwith.aligny = "top";
    killedwith.foreground = true;
    killedwith.hidewheninkillcam = false;
    killedwith.hidewhendead = false;
    killedwith.sort = 1;
    killedwith.alpha = 1;
    killedwith.archived = false;
    killedwith.color = (1, 1, 1);
    killedwith.x = 290;
    killedwith.y = 437;
    killedwith.fontscale = 1.15;
    killedwith settext("^8Killed With");
    
    killedbyweapon = newclienthudelem(self);
	killedbyweapon.horzalign = "fullscreen";
   	killedbyweapon.alignx = "right";
    killedbyweapon.vertalign = "fullscreen";
    killedbyweapon.aligny = "top";
    killedbyweapon.foreground = true;
    killedbyweapon.hidewheninkillcam = false;
    killedbyweapon.hidewhendead = false;
    killedbyweapon.archived = false;
    killedbyweapon.sort = 3;
    killedbyweapon.alpha = 1;
    killedbyweapon.color = (1, 1, 1);
    killedbyweapon.x = 290;
    killedbyweapon.y = 450;
    killedbyweapon setshader(get_weapon_shader(weapon), 30, 20);
    
    killedbyhisrank = newclienthudelem(self);
	killedbyhisrank.horzalign = "fullscreen";
   	killedbyhisrank.alignx = "center";
    killedbyhisrank.vertalign = "fullscreen";
    killedbyhisrank.aligny = "bottom";
    killedbyhisrank.foreground = true;
    killedbyhisrank.hidewheninkillcam = false;
    killedbyhisrank.hidewhendead = false;
    killedbyhisrank.sort = 1;
    killedbyhisrank.alpha = 1;
    killedbyhisrank.archived = false;
    killedbyhisrank.color = (0.153, 0.333, 0.729);
    killedbyhisrank.x = 320;
    killedbyhisrank.y = 475;
    killedbyhisrank.font = "bigfixed";
    killedbyhisrank.fontscale = 1;
    killedbyhisrank setvalue(536);
    
    // Lines
    
    leftline = newclienthudelem(self);
	leftline.horzalign = "fullscreen";
   	leftline.alignx = "center";
    leftline.vertalign = "fullscreen";
    leftline.aligny = "middle";
    leftline.foreground = true;
    leftline.hidewheninkillcam = false;
    leftline.hidewhendead = false;
    leftline.archived = false;
    leftline.sort = 3;
    leftline.alpha = 1;
    leftline.color = (0.3, 0.3, 0.3);
    leftline.x = 490;
    leftline.y = 452;
    leftline setshader("white", 1, 40);
    
    rightline = newclienthudelem(self);
	rightline.horzalign = "fullscreen";
   	rightline.alignx = "center";
    rightline.vertalign = "fullscreen";
    rightline.aligny = "middle";
    rightline.foreground = true;
    rightline.hidewheninkillcam = false;
    rightline.hidewhendead = false;
    rightline.archived = false;
    rightline.sort = 3;
    rightline.alpha = 1;
    rightline.color = (0.3, 0.3, 0.3);
    rightline.x = 150;
    rightline.y = 452;
    rightline setshader("white", 1, 40);
    
    // Perks
    
    rightperk = newclienthudelem(self);
	rightperk.horzalign = "fullscreen";
   	rightperk.alignx = "center";
    rightperk.vertalign = "fullscreen";
    rightperk.aligny = "middle";
    rightperk.foreground = true;
    rightperk.hidewheninkillcam = false;
    rightperk.hidewhendead = false;
    rightperk.archived = false;
    rightperk.sort = 3;
    rightperk.alpha = 1;
    rightperk.color = (1, 1, 1);
    rightperk.x = 600;
    rightperk.y = 452;
    rightperk setshader(perk1, 15, 20);
    
    middleperk = newclienthudelem(self);
	middleperk.horzalign = "fullscreen";
   	middleperk.alignx = "center";
    middleperk.vertalign = "fullscreen";
    middleperk.aligny = "middle";
    middleperk.foreground = true;
    middleperk.hidewheninkillcam = false;
    middleperk.hidewhendead = false;
    middleperk.archived = false;
    middleperk.sort = 3;
    middleperk.alpha = 1;
    middleperk.color = (1, 1, 1);
    middleperk.x = 570;
    middleperk.y = 452;
    middleperk setshader(perk2, 15, 20);
    
    leftperk = newclienthudelem(self);
	leftperk.horzalign = "fullscreen";
   	leftperk.alignx = "center";
    leftperk.vertalign = "fullscreen";
    leftperk.aligny = "middle";
    leftperk.foreground = true;
    leftperk.hidewheninkillcam = false;
    leftperk.hidewhendead = false;
    leftperk.archived = false;
    leftperk.sort = 3;
    leftperk.alpha = 1;
    leftperk.color = (1, 1, 1);
    leftperk.x = 540;
    leftperk.y = 452;
    leftperk setshader(perk3, 15, 20);
    
    self waittill("end_killcam");
    topbackground destroy();
    bottombackground destroy();
    bottomline destroy();
    topline destroy();
    killcamtimer destroy();
    killcamtext destroy();
    killedby destroy();
    killedbyrank destroy();
    killedwith destroy();
    killedbyweapon destroy();
    killedbyhisrank destroy();
    leftline destroy();
    rightline destroy();
    rightperk destroy();
    middleperk destroy();
    leftperk destroy();
}

ShowWhoitis(who) {
	animation = newhudelem();
	animation.horzalign = "fullscreen";
   	animation.alignx = "left";
    animation.vertalign = "fullscreen";
    animation.aligny = "top";
    animation.foreground = true;
    animation.hidewheninkillcam = false;
    animation.hidewhendead = false;
    animation.archived = false;
    animation.sort = 5;
    animation.alpha = 1;
    animation.color = (1, 1, 1);
    animation.x = -5;
    animation.y = 375;
    animation setshader("gradient_fadein", 1, 1);
    animation moveovertime(0.3);
    animation.x = 580;
   	animation scaleovertime(0.3, 250, 4);
   	wait 0.3;
   	animation scaleovertime(0.05, 1, 1);
   	animation.color = (0.153, 0.333, 0.729);
   	animation scaleovertime(0.15, 1, 40);
    
    emblembggradient = newhudelem();
	emblembggradient.horzalign = "fullscreen";
   	emblembggradient.alignx = "left";
    emblembggradient.vertalign = "fullscreen";
    emblembggradient.aligny = "top";
    emblembggradient.foreground = true;
    emblembggradient.hidewheninkillcam = false;
    emblembggradient.hidewhendead = false;
    emblembggradient.archived = false;
    emblembggradient.sort = 1;
    emblembggradient.alpha = 0;
    emblembggradient.color = (0.067, 0.157, 0.294);
    emblembggradient.x = 580;
    emblembggradient.y = 375;
    emblembggradient setshader("gradient", 1, 1);
    
    emblem = newhudelem();
	emblem.horzalign = "fullscreen";
   	emblem.alignx = "left";
    emblem.vertalign = "fullscreen";
    emblem.aligny = "middle";
    emblem.foreground = true;
    emblem.hidewheninkillcam = false;
    emblem.hidewhendead = false;
    emblem.archived = false;
    emblem.sort = 4;
    emblem.alpha = 0;
    emblem.color = (1, 1, 1);
    emblem.x = 585;
    emblem.y = 395;
    emblem setshader("zombies_rank_5_ded", 30, 35);
	
	namebg = newhudelem();
	namebg.horzalign = "fullscreen";
   	namebg.alignx = "right";
    namebg.vertalign = "fullscreen";
    namebg.aligny = "bottom";
    namebg.foreground = true;
    namebg.hidewheninkillcam = false;
    namebg.hidewhendead = false;
    namebg.archived = false;
    namebg.sort = 3;
    namebg.alpha = 0;
    namebg.color = (0, 0, 0);
    namebg.x = 580;
    namebg.y = 400;
    namebg setshader("gradient_fadein", 1, 1);
    
    namebgblue = newhudelem();
	namebgblue.horzalign = "fullscreen";
   	namebgblue.alignx = "center";
    namebgblue.vertalign = "fullscreen";
    namebgblue.aligny = "bottom";
    namebgblue.foreground = true;
    namebgblue.hidewheninkillcam = false;
    namebgblue.hidewhendead = false;
    namebgblue.archived = false;
    namebgblue.sort = 4;
    namebgblue.alpha = 0;
    namebgblue.color = (0.153, 0.333, 0.729);
    namebgblue.x = 520;
    namebgblue.y = 400;
    namebgblue setshader("line_horizontal", 1, 1);
    
    namebgline = newhudelem();
	namebgline.horzalign = "fullscreen";
   	namebgline.alignx = "right";
    namebgline.vertalign = "fullscreen";
    namebgline.aligny = "bottom";
    namebgline.foreground = true;
    namebgline.hidewheninkillcam = false;
    namebgline.hidewhendead = false;
    namebgline.archived = false;
    namebgline.sort = 5;
    namebgline.alpha = 0;
    namebgline.color = (0.153, 0.333, 0.729);
    namebgline.x = 580;
    namebgline.y = 401;
    namebgline setshader("gradient_fadein", 1, 1);
    
    name = newhudelem();
	name.horzalign = "fullscreen";
   	name.alignx = "right";
    name.vertalign = "fullscreen";
    name.aligny = "bottom";
    name.foreground = true;
    name.hidewheninkillcam = false;
    name.hidewhendead = false;
    name.archived = false;
    name.sort = 4;
    name.alpha = 0;
    name.color = (1, 1, 1);
    name.x = 577;
    name.y = 400;
    name.font = "objective";
    name.fontscale = 2.2;
    name settext(who.name);
    
    playersrang = newhudelem();
	playersrang.horzalign = "fullscreen";
   	playersrang.alignx = "right";
    playersrang.vertalign = "fullscreen";
    playersrang.aligny = "top";
    playersrang.foreground = true;
    playersrang.hidewheninkillcam = false;
    playersrang.hidewhendead = false;
    playersrang.archived = false;
    playersrang.sort = 4;
    playersrang.alpha = 0;
    playersrang.color = (1, 1, 1);
    playersrang.x = 577;
    playersrang.y = 400;
    playersrang.font = "objective";
    playersrang.fontscale = 1.4;
    playersrang.label = &"Level ^8";
    playersrang setvalue(536);
    
    rangbg = newhudelem();
	rangbg.horzalign = "fullscreen";
   	rangbg.alignx = "right";
    rangbg.vertalign = "fullscreen";
    rangbg.aligny = "top";
    rangbg.foreground = true;
    rangbg.hidewheninkillcam = false;
    rangbg.hidewhendead = false;
    rangbg.archived = false;
    rangbg.sort = 2;
    rangbg.alpha = 0;
    rangbg.color = (0, 0, 0);
    rangbg.x = 580;
    rangbg.y = 400;
    rangbg setshader("gradient_fadein", 1, 1);
    
    wait 0.1;
    
	emblembggradient fadeovertime(0.1);
	emblembggradient.alpha = 0.7;
	namebg fadeovertime(0.1);
	namebgblue fadeovertime(0.1);
	namebgline fadeovertime(0.1);
	namebg.alpha = 0.7;
	namebgline.alpha = 1;
	namebgblue.alpha = 0.4;
	rangbg fadeovertime(0.1);
	rangbg.alpha = 0.7;
	
	emblembggradient scaleovertime(0.05, 55, 40);
	rangbg scaleovertime(0.05, (who.name.size * 8), 15);
    namebg scaleovertime(0.05, (who.name.size * 7), 25);
    namebgblue scaleovertime(0.05, (who.name.size * 11), 25);
    namebgline scaleovertime(0.05, (who.name.size * 10), 1);
    
    wait .05;
    emblem fadeovertime(0.1);
	name fadeovertime(0.1);
	playersrang fadeovertime(0.1);
	
	emblem.alpha = 1;
	name.alpha = 1;
	playersrang.alpha = 1;
    
	level waittill("destroypreview");
	
	animation destroy();
	emblembggradient destroy();
	emblem destroy();
	namebg destroy();
	namebgline destroy();
	name destroy();
	playersrang destroy();
	namebgblue destroy();
	rangbg destroy();
}

ShowWinners(struct) {
	self.victoryhud = newclienthudelem(self);
    self.victoryhud.x = 320;
    self.victoryhud.y = 200;
    self.victoryhud.alignx = "center";
    self.victoryhud.horzalign = "fullscreen";
    self.victoryhud.vertalign = "fullscreen";
    self.victoryhud.alpha = 1;
    self.victoryhud.sort = 2;
    self.victoryhud.color = (1,1,1);
    self.victoryhud.archived = false;
    self.victoryhud.fontscale = 5;
    self.victoryhud.font = "bigfixed";
	self.victoryhud.hidewheninmenu = true;
	self.victoryhud.hidewheninkillcam = true;
	self.victoryhud settext("VICTORY");
	self.victoryhud ChangeFontScaleOverTime(0.15);
	self.victoryhud.fontscale = 1.7;
	
	self.victorybg = newclienthudelem(self);
	self.victorybg.horzalign = "fullscreen";
   	self.victorybg.alignx = "center";
    self.victorybg.vertalign = "fullscreen";
    self.victorybg.foreground = false;
    self.victorybg.hidewheninkillcam = false;
    self.victorybg.hidewhendead = false;
    self.victorybg.archived = false;
    self.victorybg.sort = 1;
    self.victorybg.alpha = 1;
    self.victorybg.color = (0, 0, 0);
    self.victorybg.x = 320;
    self.victorybg.y = 202;
    self.victorybg setshader("line_horizontal", 1, 40);
	self.victorybg scaleovertime(0.2, 450, 40);
	
	wait 0.5;
	
	self.endreason = newclienthudelem(self);
    self.endreason.x = 320;
    self.endreason.y = 242;
    self.endreason.alignx = "center";
    self.endreason.horzalign = "fullscreen";
    self.endreason.vertalign = "fullscreen";
    self.endreason.sort = 2;
    self.endreason.color = (1,1,1);
    self.endreason.archived = false;
    self.endreason.fontscale = 1.3;
    self.endreason.font = "default";
	self.endreason.hidewheninmenu = true;
	self.endreason.hidewheninkillcam = true;
	self.endreason settext("Scorelimit Reached");
	self.endreason fadeovertime(0.2);
	self.endreason.alpha = 1;
	
	self.rank1line = newclienthudelem(self);
	self.rank1line.horzalign = "fullscreen";
   	self.rank1line.alignx = "center";
    self.rank1line.vertalign = "fullscreen";
    self.rank1line.foreground = false;
    self.rank1line.hidewheninkillcam = false;
    self.rank1line.hidewhendead = false;
    self.rank1line.archived = false;
    self.rank1line.sort = 1;
    self.rank1line.alpha = 1;
    self.rank1line.color = (1, 0.827, 0);
    self.rank1line.x = 200;
    self.rank1line.y = 275;
    self.rank1line setshader("white", 1, 20);
    
    self.rank2line = newclienthudelem(self);
	self.rank2line.horzalign = "fullscreen";
   	self.rank2line.alignx = "center";
    self.rank2line.vertalign = "fullscreen";
    self.rank2line.foreground = false;
    self.rank2line.hidewheninkillcam = false;
    self.rank2line.hidewhendead = false;
    self.rank2line.archived = false;
    self.rank2line.sort = 1;
    self.rank2line.alpha = 1;
    self.rank2line.color = (0.753, 0.753, 0.753);
    self.rank2line.x = 200;
    self.rank2line.y = 300;
    self.rank2line setshader("white", 1, 20);
    
    self.rank3line = newclienthudelem(self);
	self.rank3line.horzalign = "fullscreen";
   	self.rank3line.alignx = "center";
    self.rank3line.vertalign = "fullscreen";
    self.rank3line.foreground = false;
    self.rank3line.hidewheninkillcam = false;
    self.rank3line.hidewhendead = false;
    self.rank3line.archived = false;
    self.rank3line.sort = 1;
    self.rank3line.alpha = 1;
    self.rank3line.color = (0.745, 0.537, 0.439);
    self.rank3line.x = 200;
    self.rank3line.y = 325;
    self.rank3line setshader("white", 1, 20);
    self.backgroundsend = [];
    for(i = 0;i < 3;i++) {
    	self.backgroundsend[i] = newclienthudelem(self);
		self.backgroundsend[i].horzalign = "fullscreen";
   		self.backgroundsend[i].alignx = "left";
    	self.backgroundsend[i].vertalign = "fullscreen";
    	self.backgroundsend[i].foreground = false;
    	self.backgroundsend[i].hidewheninkillcam = false;
    	self.backgroundsend[i].hidewhendead = false;
    	self.backgroundsend[i].archived = false;
    	self.backgroundsend[i].sort = 1;
   	 	self.backgroundsend[i].alpha = 0.4;
   	 	self.backgroundsend[i].color = (0, 0, 0);
    	self.backgroundsend[i].x = 200;
    	self.backgroundsend[i].y = 275 + (i * 25);
    	self.backgroundsend[i] setshader("black", 240, 20);
    }
    
    self.rank1text = newclienthudelem(self);
    self.rank1text.x = 210;
    self.rank1text.y = 277;
    self.rank1text.alignx = "left";
    self.rank1text.aligny = "top";
    self.rank1text.horzalign = "fullscreen";
    self.rank1text.vertalign = "fullscreen";
    self.rank1text.sort = 2;
    self.rank1text.color = (1, 0.827, 0);
    self.rank1text.archived = false;
    self.rank1text.fontscale = 1.2;
    self.rank1text.font = "default";
	self.rank1text.hidewheninmenu = true;
	self.rank1text.hidewheninkillcam = true;
	self.rank1text settext("1st");
	self.rank1text.alpha = 1;
	
	self.rank2text = newclienthudelem(self);
    self.rank2text.x = 210;
    self.rank2text.y = 302;
    self.rank2text.alignx = "left";
    self.rank2text.aligny = "top";
    self.rank2text.horzalign = "fullscreen";
    self.rank2text.vertalign = "fullscreen";
    self.rank2text.sort = 2;
    self.rank2text.color = (0.753, 0.753, 0.753);
    self.rank2text.archived = false;
    self.rank2text.fontscale = 1.2;
    self.rank2text.font = "default";
	self.rank2text.hidewheninmenu = true;
	self.rank2text.hidewheninkillcam = true;
	self.rank2text settext("2nd");
	self.rank2text.alpha = 1;
	
	self.rank3text = newclienthudelem(self);
    self.rank3text.x = 210;
    self.rank3text.y = 327;
    self.rank3text.alignx = "left";
    self.rank3text.aligny = "top";
    self.rank3text.horzalign = "fullscreen";
    self.rank3text.vertalign = "fullscreen";
    self.rank3text.sort = 2;
    self.rank3text.color = (0.745, 0.537, 0.439);
    self.rank3text.archived = false;
    self.rank3text.fontscale = 1.2;
    self.rank3text.font = "default";
	self.rank3text.hidewheninmenu = true;
	self.rank3text.hidewheninkillcam = true;
	self.rank3text settext("3rd");
	self.rank3text.alpha = 1;
	
	self.rank1name = newclienthudelem(self);
    self.rank1name.x = 260;
    self.rank1name.y = 277;
    self.rank1name.alignx = "left";
    self.rank1name.aligny = "top";
    self.rank1name.horzalign = "fullscreen";
    self.rank1name.vertalign = "fullscreen";
    self.rank1name.sort = 2;
    self.rank1name.color = (1,1,1);
    self.rank1name.archived = false;
    self.rank1name.fontscale = 1.2;
    self.rank1name.font = "default";
	self.rank1name.hidewheninmenu = true;
	self.rank1name.hidewheninkillcam = true;
	self.rank1name settext(struct.firstplace.name);
	self.rank1name.alpha = 1;
	
	self.rank2name = newclienthudelem(self);
    self.rank2name.x = 260;
    self.rank2name.y = 302;
    self.rank2name.alignx = "left";
    self.rank2name.aligny = "top";
    self.rank2name.horzalign = "fullscreen";
    self.rank2name.vertalign = "fullscreen";
    self.rank2name.sort = 2;
    self.rank2name.color = (1,1,1);
    self.rank2name.archived = false;
    self.rank2name.fontscale = 1.2;
    self.rank2name.font = "default";
	self.rank2name.hidewheninmenu = true;
	self.rank2name.hidewheninkillcam = true;
	self.rank2name settext(struct.secondplace.name);
	self.rank2name.alpha = 1;
	
	self.rank3name = newclienthudelem(self);
    self.rank3name.x = 260;
    self.rank3name.y = 327;
    self.rank3name.alignx = "left";
    self.rank3name.aligny = "top";
    self.rank3name.horzalign = "fullscreen";
    self.rank3name.vertalign = "fullscreen";
    self.rank3name.sort = 2;
    self.rank3name.color = (1,1,1);
    self.rank3name.archived = false;
    self.rank3name.fontscale = 1.2;
    self.rank3name.font = "default";
	self.rank3name.hidewheninmenu = true;
	self.rank3name.hidewheninkillcam = true;
	self.rank3name settext(struct.thirdplace.name);
	self.rank3name.alpha = 1;
	
	self.rank1score = newclienthudelem(self);
    self.rank1score.x = 430;
    self.rank1score.y = 277;
    self.rank1score.alignx = "right";
    self.rank1score.aligny = "top";
    self.rank1score.horzalign = "fullscreen";
    self.rank1score.vertalign = "fullscreen";
    self.rank1score.sort = 2;
    self.rank1score.color = (1,1,1);
    self.rank1score.archived = false;
    self.rank1score.fontscale = 1.2;
    self.rank1score.font = "default";
	self.rank1score.hidewheninmenu = true;
	self.rank1score.hidewheninkillcam = true;
	self.rank1score setvalue(struct.firstplace.pointstowin);
	self.rank1score.alpha = 1;
	
	self.rank2score = newclienthudelem(self);
    self.rank2score.x = 430;
    self.rank2score.y = 302;
    self.rank2score.alignx = "right";
    self.rank2score.aligny = "top";
    self.rank2score.horzalign = "fullscreen";
    self.rank2score.vertalign = "fullscreen";
    self.rank2score.sort = 2;
    self.rank2score.color = (1,1,1);
    self.rank2score.archived = false;
    self.rank2score.fontscale = 1.2;
    self.rank2score.font = "default";
	self.rank2score.hidewheninmenu = true;
	self.rank2score.hidewheninkillcam = true;
	self.rank2score setvalue(struct.secondplace.pointstowin);
	self.rank2score.alpha = 1;
	
	self.rank3score = newclienthudelem(self);
    self.rank3score.x = 430;
    self.rank3score.y = 327;
    self.rank3score.alignx = "right";
    self.rank3score.aligny = "top";
    self.rank3score.horzalign = "fullscreen";
    self.rank3score.vertalign = "fullscreen";
    self.rank3score.sort = 2;
    self.rank3score.color = (1,1,1);
    self.rank3score.archived = false;
    self.rank3score.fontscale = 1.2;
    self.rank3score.font = "default";
	self.rank3score.hidewheninmenu = true;
	self.rank3score.hidewheninkillcam = true;
	self.rank3score setvalue(struct.thirdplace.pointstowin);
	self.rank3score.alpha = 1;
	
	self.matchbonus = newclienthudelem(self);
    self.matchbonus.x = 320;
    self.matchbonus.y = 380;
    self.matchbonus.alignx = "center";
    self.matchbonus.horzalign = "fullscreen";
    self.matchbonus.vertalign = "fullscreen";
    self.matchbonus.sort = 2;
    self.matchbonus.color = (1,1,1);
    self.matchbonus.alpha = 0;
    self.matchbonus.archived = false;
    self.matchbonus.fontscale = 1.5;
    self.matchbonus.font = "default";
	self.matchbonus.hidewheninmenu = true;
	self.matchbonus.hidewheninkillcam = true;
	self.matchbonus settext("Match Bonus");
	self.matchbonus fadeovertime(0.2);
	self.matchbonus.alpha = 1;
	
	self.matchbonusnum = newclienthudelem(self);
    self.matchbonusnum.x = 320;
    self.matchbonusnum.y = 400;
    self.matchbonusnum.alignx = "center";
    self.matchbonusnum.horzalign = "fullscreen";
    self.matchbonusnum.vertalign = "fullscreen";
    self.matchbonusnum.sort = 2;
    self.matchbonusnum.alpha = 0;
    self.matchbonusnum.color = (1, 1, 1);
    self.matchbonusnum.archived = false;
    self.matchbonusnum.fontscale = 1.5;
    self.matchbonusnum.font = "default";
	self.matchbonusnum.hidewheninmenu = true;
	self.matchbonusnum.hidewheninkillcam = true;
	self.matchbonusnum.label = &"XP ^9";
	self.matchbonusnum setvalue(5703);
	self.matchbonusnum fadeovertime(0.35);
	self.matchbonusnum.alpha = 1;
	
	level waittill("destroyvictory");
	self.rank3score destroy();
	self.rank2score destroy();
	self.rank1score destroy();
	self.rank3name destroy();
	self.rank2name destroy();
	self.rank1name destroy();
	self.rank3text destroy();
	self.rank2text destroy();
	self.rank1text destroy();
	self.rank3line destroy();
	self.rank2line destroy();
	self.rank1line destroy();
	self.matchbonus destroy();
	self.matchbonusnum destroy();
	foreach(h in self.backgroundsend)
		h destroy();
	self.victorybg destroy();
	self.endreason destroy();
	self.victoryhud destroy();
}

FFA_Score_Hud() {
	self.TeamHudElem = [];
	
    self.TeamHudElem["Discord"] = newclienthudelem(self);
    self.TeamHudElem["Discord"].x = 320;
    self.TeamHudElem["Discord"].y = 0;
    self.TeamHudElem["Discord"].alignx = "center";
    self.TeamHudElem["Discord"].horzalign = "fullscreen";
    self.TeamHudElem["Discord"].vertalign = "fullscreen";
    self.TeamHudElem["Discord"].alpha = 0.4;
    self.TeamHudElem["Discord"].sort = 1;
    self.TeamHudElem["Discord"].color = (1,1,1);
    self.TeamHudElem["Discord"].archived = false;
    self.TeamHudElem["Discord"].fontscale = 1;
    self.TeamHudElem["Discord"].font = "objective";
	self.TeamHudElem["Discord"].hidewheninmenu = true;
	self.TeamHudElem["Discord"].hidewheninkillcam = true;
	self.TeamHudElem["Discord"] settext("Discord Link");
	
    self.TeamHudElem["AlliesScore"] = newclienthudelem(self);
    self.TeamHudElem["AlliesScore"].x = 300;
    self.TeamHudElem["AlliesScore"].y = 16;
    self.TeamHudElem["AlliesScore"].alignx = "center";
    self.TeamHudElem["AlliesScore"].horzalign = "fullscreen";
    self.TeamHudElem["AlliesScore"].vertalign = "fullscreen";
    self.TeamHudElem["AlliesScore"].alpha = 1;
    self.TeamHudElem["AlliesScore"].sort = 1;
    self.TeamHudElem["AlliesScore"].color = (1,1,1);
    self.TeamHudElem["AlliesScore"].glowalpha = 1;
    self.TeamHudElem["AlliesScore"].glowcolor = game["colors"]["allies"];
    self.TeamHudElem["AlliesScore"].archived = true;
    self.TeamHudElem["AlliesScore"].fontscale = 1;
    self.TeamHudElem["AlliesScore"].hidewheninmenu = true;
    self.TeamHudElem["AlliesScore"].hidewheninkillcam = true;
    
    self.TeamHudElem["AxisScore"] = newclienthudelem(self);
    self.TeamHudElem["AxisScore"].x = 340;
    self.TeamHudElem["AxisScore"].y = 16;
    self.TeamHudElem["AxisScore"].alignx = "center";
    self.TeamHudElem["AxisScore"].horzalign = "fullscreen";
    self.TeamHudElem["AxisScore"].vertalign = "fullscreen";
    self.TeamHudElem["AxisScore"].alpha = 1;
    self.TeamHudElem["AxisScore"].sort = 1;
    self.TeamHudElem["AxisScore"].color = (1,1,1);
    self.TeamHudElem["AxisScore"].glowalpha = 1;
    self.TeamHudElem["AxisScore"].glowcolor = game["colors"]["axis"];
    self.TeamHudElem["AxisScore"].archived = true;
    self.TeamHudElem["AxisScore"].fontscale = 1;
	self.TeamHudElem["AxisScore"].hidewheninmenu = true;
	self.TeamHudElem["AxisScore"].hidewheninkillcam = true;
    
    self.TeamHudElem["AxisBarBack"] = newclienthudelem(self);
    self.TeamHudElem["AxisBarBack"].x = 350;
    self.TeamHudElem["AxisBarBack"].y = 20;
    self.TeamHudElem["AxisBarBack"].alignx = "left";
    self.TeamHudElem["AxisBarBack"].horzalign = "fullscreen";
    self.TeamHudElem["AxisBarBack"].vertalign = "fullscreen";
    self.TeamHudElem["AxisBarBack"].alpha = 0.5;
    self.TeamHudElem["AxisBarBack"].sort = 1;
    self.TeamHudElem["AxisBarBack"].color = (0,0,0);
    self.TeamHudElem["AxisBarBack"].archived = true;
    self.TeamHudElem["AxisBarBack"] setshader("black", 60, 4);
    self.TeamHudElem["AxisBarBack"].hidewheninmenu = true;
    self.TeamHudElem["AxisBarBack"].hidewheninkillcam = true;
    
    self.TeamHudElem["AxisBar"] = newclienthudelem(self);
    self.TeamHudElem["AxisBar"].x = self.TeamHudElem["AxisBarBack"].x + 1;
    self.TeamHudElem["AxisBar"].y = 20;
    self.TeamHudElem["AxisBar"].alignx = "left";
    self.TeamHudElem["AxisBar"].horzalign = "fullscreen";
    self.TeamHudElem["AxisBar"].vertalign = "fullscreen";
    self.TeamHudElem["AxisBar"].alpha = 1;
    self.TeamHudElem["AxisBar"].sort = 1;
    self.TeamHudElem["AxisBar"].color = game["colors"]["axis"];
    self.TeamHudElem["AxisBar"].archived = true;
    self.TeamHudElem["AxisBar"] setshader("progress_bar_fill", 1, 4);
    self.TeamHudElem["AxisBar"].hidewheninmenu = true;
    self.TeamHudElem["AxisBar"].hidewheninkillcam = true;
    
    self.TeamHudElem["AxisName"] = newclienthudelem(self);
    self.TeamHudElem["AxisName"].x = 351;
    self.TeamHudElem["AxisName"].y = 25;
    self.TeamHudElem["AxisName"].alignx = "left";
    self.TeamHudElem["AxisName"].horzalign = "fullscreen";
    self.TeamHudElem["AxisName"].vertalign = "fullscreen";
    self.TeamHudElem["AxisName"].alpha = 1;
    self.TeamHudElem["AxisName"].sort = 1;
    self.TeamHudElem["AxisName"].color = (1,1,1);
    self.TeamHudElem["AxisName"].glowalpha = 1;
    self.TeamHudElem["AxisName"].glowcolor = game["colors"]["axis"];
    self.TeamHudElem["AxisName"].archived = true;
    self.TeamHudElem["AxisName"].fontscale = 1;
	self.TeamHudElem["AxisName"].hidewheninmenu = true;
	self.TeamHudElem["AxisName"].hidewheninkillcam = true;
    
    self.TeamHudElem["AlliesBarBack"] = newclienthudelem(self);
    self.TeamHudElem["AlliesBarBack"].x = 290;
    self.TeamHudElem["AlliesBarBack"].y = 20;
    self.TeamHudElem["AlliesBarBack"].alignx = "right";
    self.TeamHudElem["AlliesBarBack"].horzalign = "fullscreen";
    self.TeamHudElem["AlliesBarBack"].vertalign = "fullscreen";
    self.TeamHudElem["AlliesBarBack"].alpha = 0.5;
    self.TeamHudElem["AlliesBarBack"].sort = 0;
    self.TeamHudElem["AlliesBarBack"].color = (0,0,0);
    self.TeamHudElem["AlliesBarBack"].archived = true;
    self.TeamHudElem["AlliesBarBack"] setshader("black", 60, 4);
    self.TeamHudElem["AlliesBarBack"].hidewheninmenu = true;
    self.TeamHudElem["AlliesBarBack"].hidewheninkillcam = true;
    
    self.TeamHudElem["AlliesBar"] = newclienthudelem(self);
    self.TeamHudElem["AlliesBar"].x = self.TeamHudElem["AlliesBarBack"].x - 1;
    self.TeamHudElem["AlliesBar"].y = 20;
    self.TeamHudElem["AlliesBar"].alignx = "right";
    self.TeamHudElem["AlliesBar"].horzalign = "fullscreen";
    self.TeamHudElem["AlliesBar"].vertalign = "fullscreen";
    self.TeamHudElem["AlliesBar"].alpha = 1;
    self.TeamHudElem["AlliesBar"].sort = 2;
    self.TeamHudElem["AlliesBar"].color = game["colors"]["allies"];
    self.TeamHudElem["AlliesBar"].archived = true;
    self.TeamHudElem["AlliesBar"] setshader("progress_bar_fill", 1, 4);
    self.TeamHudElem["AlliesBar"].hidewheninmenu = true;
    self.TeamHudElem["AlliesBar"].hidewheninkillcam = true;
    
    self.TeamHudElem["AlliesName"] = newclienthudelem(self);
    self.TeamHudElem["AlliesName"].x = 289;
    self.TeamHudElem["AlliesName"].y = 25;
    self.TeamHudElem["AlliesName"].alignx = "right";
    self.TeamHudElem["AlliesName"].horzalign = "fullscreen";
    self.TeamHudElem["AlliesName"].vertalign = "fullscreen";
    self.TeamHudElem["AlliesName"].alpha = 1;
    self.TeamHudElem["AlliesName"].sort = 1;
    self.TeamHudElem["AlliesName"].color = (1,1,1);
    self.TeamHudElem["AlliesName"].glowalpha = 1;
    self.TeamHudElem["AlliesName"].glowcolor = game["colors"]["allies"];
    self.TeamHudElem["AlliesName"].archived = true;
    self.TeamHudElem["AlliesName"].fontscale = 1;
	self.TeamHudElem["AlliesName"].hidewheninmenu = true;
	self.TeamHudElem["AlliesName"] settext(self.realname);
	self.TeamHudElem["AlliesName"].hidewheninkillcam = true;
    
    while(1) {
    	level waittill("player_kill");
		axisScore = gethighestscoring(self);
		axisScorefinal = int(axisScore.pointstowin * 50);
		
		yourpoints = self.pointstowin * 50;
		self.TeamHudElem["AxisName"] settext(axisScore.realname);
		
		if(self.pointstowin >= 1) {
			allieswidth = (yourpoints / 1500) * 58;
			self.TeamHudElem["AlliesBar"] scaleovertime(.020, int(allieswidth), 3);
		}
		if(axisScore.pointstowin >= 1) {
			axiswidth = (axisScorefinal / 1500) * 58;
			self.TeamHudElem["AxisBar"] scaleovertime(.020, int(axiswidth), 3);
		}
		
		self.TeamHudElem["AlliesScore"] setvalue(yourpoints);
		self.TeamHudElem["AxisScore"] setvalue(axisScorefinal);
    }
}

DestroyBefore() {
	level waittill("end_game");
	
	if(isdefined(self))
		self destroy();
		
	self = undefined;
}

fadeinBlackOut( duration, alpha, player) {
	self endon("stopnewpoints");
	wait duration;
	self.alpha = alpha;
	player.addedpoints = undefined;
}

WeaponHud() {
    self endon("disconnect");
    level endon("end_game");
    
    flag_wait("give_hud");
    self thread FFA_Score_Hud();
    self thread KillStreakHud();
    level notify("player_kill");
    x = 620;

    self.Weaponnameline = newClientHudElem(self);
    self.Weaponnameline.x = x;
    self.Weaponnameline.y = 447;
    self.Weaponnameline.alignx = "RIGHT";
    self.Weaponnameline.aligny = "BOTTOM";
    self.Weaponnameline.horzalign = "fullscreen";
    self.Weaponnameline.vertalign = "fullscreen";
    self.Weaponnameline.alpha = 1;
    self.Weaponnameline.sort = 1;
    self.Weaponnameline.color = (0,0,0);
    self.Weaponnameline.archived = true;
    self.Weaponnameline.foreground = true;
    self.Weaponnameline.hidewheninmenu = 1;
    self.Weaponnameline.hidewheninkillcam = 1;
    self.Weaponnameline setshader("gradient_fadein", 130, 1);	// 115 normaler shader
    self.Weaponnameline thread DestroyBefore();

    self.Weaponname = createfontstring("hudbig", 1.4);
    self.Weaponname.x = x - 20;
    self.Weaponname.y = 428;
    self.Weaponname.alignx = "RIGHT";
    self.Weaponname.aligny = "BOTTOM";
    self.Weaponname.color = (1, 1, 1);
    self.Weaponname.alpha = 1;
    self.Weaponname.archived = true;
    self.Weaponname.sort = 80;
    self.Weaponname.font = "hudbig";
    self.Weaponname.foreground = true;
    self.Weaponname.fontscale = 1.3;
    self.Weaponname.horzalign = "fullscreen";
    self.Weaponname.vertalign = "fullscreen";
    self.Weaponname.hidewheninmenu = 1;
    self.Weaponname.realx = x - 4;
    self.Weaponname.hidewheninkillcam = 1;
    self.Weaponname thread DestroyBefore();

    self.WeaponammoStock = newClientHudElem(self);
    self.WeaponammoStock.x = x - 4;
    self.WeaponammoStock.y = 445;  // 220;
    self.WeaponammoStock.alignx = "RIGHT";
    self.WeaponammoStock.aligny = "BOTTOM";
    self.WeaponammoStock.color = (1, 1, 1);
    self.WeaponammoStock.alpha = 1;
    self.WeaponammoStock.sort = 80;
    self.WeaponammoStock.archived = true;
    self.WeaponammoStock.foreground = true;
    self.WeaponammoStock.fontscale = 1.8;
    self.WeaponammoStock.font = "default";
    self.WeaponammoStock.horzalign = "fullscreen";
    self.WeaponammoStock.vertalign = "fullscreen";
    self.WeaponammoStock.hidewheninmenu = 1;// 15 -
    self.WeaponammoStock.hidewheninkillcam = 1;
    self.WeaponammoStock.label = &"/";
    self.WeaponammoStock thread DestroyBefore();
    
    self.WeaponammoClip = newClientHudElem(self);
    self.WeaponammoClip.x = self.WeaponammoStock.x - 24;
    self.WeaponammoClip.y = 445;
    self.WeaponammoClip.alignx = "RIGHT";
    self.WeaponammoClip.aligny = "BOTTOM";
    self.WeaponammoClip.color = (1, 1, 1);
    self.WeaponammoClip.alpha = 1;
    self.WeaponammoClip.archived = true;
    self.WeaponammoClip.foreground = true;
    self.WeaponammoClip.font = "default";
    self.WeaponammoClip.fontscale = 1.8;
    self.WeaponammoClip.horzalign = "fullscreen";
    self.WeaponammoClip.vertalign = "fullscreen";
    self.WeaponammoClip.hidewheninmenu = 1;
    self.WeaponammoClip.hidewheninkillcam = 1;
    self.WeaponammoClip thread DestroyBefore();

    self.GrenadeIcon1 = newClientHudElem(self);
    self.GrenadeIcon1.x = x - 7;
    self.GrenadeIcon1.y = 450;  // 220;
    self.GrenadeIcon1.alignx = "RIGHT";
    self.GrenadeIcon1.aligny = "TOP";
    self.GrenadeIcon1.horzalign = "fullscreen";
    self.GrenadeIcon1.vertalign = "fullscreen";
    self.GrenadeIcon1.alpha = 0;
    self.GrenadeIcon1.sort = 10;
    self.GrenadeIcon1.color = (1, 1, 1);
    self.GrenadeIcon1.archived = true;
    self.GrenadeIcon1.foreground = false;
    self.GrenadeIcon1 setshader("hud_grenadeicon", 13, 13);
    self.GrenadeIcon1.hidewheninmenu = 1;
    self.GrenadeIcon1.hidewheninkillcam = 1;
    self.GrenadeIcon1 thread DestroyBefore();
    
    self.GrenadeIcon2 = newClientHudElem(self);
    self.GrenadeIcon2.x = x;
    self.GrenadeIcon2.y = 450;  // 220;
    self.GrenadeIcon2.alignx = "RIGHT";
    self.GrenadeIcon2.aligny = "TOP";
    self.GrenadeIcon2.horzalign = "fullscreen";
    self.GrenadeIcon2.vertalign = "fullscreen";
    self.GrenadeIcon2.alpha = 0;
    self.GrenadeIcon2.sort = 10;
    self.GrenadeIcon2.color = (0.5, 0.5, 0.5);
    self.GrenadeIcon2.archived = true;
    self.GrenadeIcon2.foreground = false;
    self.GrenadeIcon2 setshader("hud_grenadeicon", 13, 13);
    self.GrenadeIcon2.hidewheninmenu = 1;
    self.GrenadeIcon2.hidewheninkillcam = 1;
    self.GrenadeIcon2 thread DestroyBefore();

    self.SecondaryIcon1 = newClientHudElem(self);
    self.SecondaryIcon1.x = x - 40;
    self.SecondaryIcon1.y = 450;  // 220;
    self.SecondaryIcon1.alignx = "RIGHT";
    self.SecondaryIcon1.aligny = "TOP";
    self.SecondaryIcon1.horzalign = "fullscreen";
    self.SecondaryIcon1.vertalign = "fullscreen";
    self.SecondaryIcon1.alpha = 0;
    self.SecondaryIcon1.sort = 10;
    self.SecondaryIcon1.color = (1, 1, 1);
    self.SecondaryIcon1.archived = true;
    self.SecondaryIcon1.foreground = true;
    self.SecondaryIcon1.hidewheninmenu = 1;
    self.SecondaryIcon1.hidewheninkillcam = 1;
    self.SecondaryIcon1 thread DestroyBefore();
    
    self.SecondaryIcon2 = newClientHudElem(self);
    self.SecondaryIcon2.x = x - 35;
    self.SecondaryIcon2.y = 450;  // 220;
    self.SecondaryIcon2.alignx = "RIGHT";
    self.SecondaryIcon2.aligny = "TOP";
    self.SecondaryIcon2.horzalign = "fullscreen";
    self.SecondaryIcon2.vertalign = "fullscreen";
    self.SecondaryIcon2.alpha = 0;
    self.SecondaryIcon2.sort = 10;
    self.SecondaryIcon2.color = (0.5, 0.5, 0.5);
    self.SecondaryIcon2.archived = true;
    self.SecondaryIcon2.foreground = true;
    self.SecondaryIcon2.hidewheninmenu = 1;
    self.SecondaryIcon2.hidewheninkillcam = 1;
    self.SecondaryIcon2 thread DestroyBefore();
    
    self.SecondaryIcon3 = newClientHudElem(self);
    self.SecondaryIcon3.x = x - 30;
    self.SecondaryIcon3.y = 450;  // 220;
    self.SecondaryIcon3.alignx = "RIGHT";
    self.SecondaryIcon3.aligny = "TOP";
    self.SecondaryIcon3.horzalign = "fullscreen";
    self.SecondaryIcon3.vertalign = "fullscreen";
    self.SecondaryIcon3.alpha = 0;
    self.SecondaryIcon3.sort = 10;
    self.SecondaryIcon3.color = (0.5, 0.5, 0.5);
    self.SecondaryIcon3.archived = true;
    self.SecondaryIcon3.foreground = true;
    self.SecondaryIcon3.hidewheninmenu = 1;
    self.SecondaryIcon3.hidewheninkillcam = 1;
    self.SecondaryIcon3 thread DestroyBefore();
    
    self.WeaponAmmoTextNew = newClientHudElem(self);
    self.WeaponAmmoTextNew.x = x - 45;
    self.WeaponAmmoTextNew.y = 435;
    self.WeaponAmmoTextNew.alignx = "RIGHT";
    self.WeaponAmmoTextNew.aligny = "MIDDLE";
    self.WeaponAmmoTextNew.color = (1, 1, 1);
    self.WeaponAmmoTextNew.alpha = 1;
    self.WeaponAmmoTextNew.archived = false;
    self.WeaponAmmoTextNew.sort = 1;
    self.WeaponAmmoTextNew.fontscale = 1;
    self.WeaponAmmoTextNew.horzalign = "fullscreen";
    self.WeaponAmmoTextNew.vertalign = "fullscreen";
    self.WeaponAmmoTextNew.font = "small";
    self.WeaponAmmoTextNew.hidewheninmenu = 1;
    self.WeaponAmmoTextNew.hidewheninkillcam = 1;
    self.WeaponAmmoTextNew thread DestroyBefore();
    
    self.WeaponAmmoTextNew2 = newClientHudElem(self);
    self.WeaponAmmoTextNew2.x = x - 45;
    self.WeaponAmmoTextNew2.y = 425;
    self.WeaponAmmoTextNew2.alignx = "RIGHT";
    self.WeaponAmmoTextNew2.aligny = "MIDDLE";
    self.WeaponAmmoTextNew2.color = (1, 1, 1);
    self.WeaponAmmoTextNew2.alpha = 0;
    self.WeaponAmmoTextNew2.archived = false;
    self.WeaponAmmoTextNew2.sort = 1;
    self.WeaponAmmoTextNew2.fontscale = 1;
    self.WeaponAmmoTextNew2.font = "small";
    self.WeaponAmmoTextNew2.horzalign = "fullscreen";
    self.WeaponAmmoTextNew2.vertalign = "fullscreen";
    self.WeaponAmmoTextNew2.hidewheninmenu = 1;
    self.WeaponAmmoTextNew2.hidewheninkillcam = 1;
    self.WeaponAmmoTextNew2 thread DestroyBefore();
    
    while (1) {
        weapon = get_base_name(self getcurrentweapon());
        
        weaponname = self get_real_name(weapon);
        if(weaponname != "none") {
       		self.Weaponname.alpha = 1;
        	self.WeaponammoStock.alpha = 1;
        	self.WeaponammoClip.alpha = 1;
        	if(weaponClipSize(self getcurrentweapon()) >= 50)
        		self.WeaponAmmoTextNew2.alpha = 1;
        	else
        		self.WeaponAmmoTextNew2.alpha = 0;
        	self.WeaponAmmoTextNew.alpha = 1;
        	self.Weaponname.x = self.Weaponname.x - 20;
        	self.Weaponname settext(weaponname);
        	self.Weaponname moveOverTime(.1);
        	self.Weaponname.x = self.Weaponname.realx;
        }
        else {
        	self.WeaponammoStock.alpha = 0;
        	self.WeaponammoClip.alpha = 0;
        	self.Weaponname.alpha = 0;
        	self.WeaponAmmoTextNew2.alpha = 0;
        	self.WeaponAmmoTextNew.alpha = 0;
        }
        self waittill("weapon_change");
    }
}

HealthBar() {
    level endon("end_game");
    self endon("disconnect");
    
    flag_wait("give_hud");
	
    x = 20;
    y = 450;
    base_width = 65;
    base_height = 2;
    init_width = base_width * (self.maxhealth / 250);
    
    self.armorbarui = newClientHudElem(self);
    self.armorbarui.x = x + 1;
    self.armorbarui.y = 446;
    self.armorbarui.alignx = "left";
    self.armorbarui.aligny = "bottom";
    self.armorbarui.horzalign = "fullscreen";
    self.armorbarui.vertalign = "fullscreen";
    self.armorbarui.alpha = 1;
    self.armorbarui.sort = 6;
    self.armorbarui.color = (0.153, 0.333, 0.729);
    self.armorbarui.foreground = true;
    self.armorbarui.hidewheninmenu = true;
    self.armorbarui.hidewheninkillcam = true;
    self.armorbarui setshader("progress_bar_fill", int(65), 1);

    self.health_bar = newClientHudElem(self);
    self.health_bar.x = x + 1;
    self.health_bar.y = y + 1;
    self.health_bar.alignx = "left";
    self.health_bar.aligny = "bottom";
    self.health_bar.horzalign = "fullscreen";
    self.health_bar.vertalign = "fullscreen";
    self.health_bar.alpha = 1;
    self.health_bar.sort = 4;
    self.health_bar.archived = true;
    self.health_bar.foreground = true;
    self.health_bar.hidewheninmenu = true;
    self.health_bar.hidewheninkillcam = false;
    self.health_bar setshader("progress_bar_fill", init_width, base_height);
    self.health_bar thread DestroyBefore();

    self.health_text = self createFontString("default", 1);
    self.health_text.x = x + base_width + 5;
    self.health_text.y = y;
    self.health_text.alignx = "left";
    self.health_text.aligny = "middle";
    self.health_text.horzalign = "fullscreen";
    self.health_text.vertalign = "fullscreen";
    self.health_text.alpha = 1;
    self.health_text.sort = 4;
    self.health_text.archived = true;
    self.health_text.foreground = true;
    self.health_text.hidewheninmenu = true;
    self.health_text.hidewheninkillcam = false;
    self.health_text thread DestroyBefore();
    
    self.namehud = self createFontString("objective", 1.05);
    self.namehud.x = 22;
    self.namehud.y = 467;
    self.namehud.alignx = "left";
    self.namehud.aligny = "bottom";
    self.namehud.horzalign = "fullscreen";
    self.namehud.vertalign = "fullscreen";
    self.namehud.alpha = 1;
    self.namehud.color = (1, 1, 1);
    self.namehud.archived = true;
    self.namehud.foreground = true;
    self.namehud.hidewheninmenu = true;
    self.namehud.hidewheninkillcam = 1;
    self.namehud settext(self.realname);
    self.namehud thread DestroyBefore();
    
    self.Test = newClientHudElem(self);
    self.Test.x = 15;
    self.Test.y = 425;
    self.Test.alignx = "left";
    self.Test.aligny = "center";
    self.Test.horzalign = "fullscreen";
    self.Test.vertalign = "fullscreen";
    self.Test.alpha = 1;
    self.Test.archived = true;
    self.Test.color = (0,0,0);
    self.Test.foreground = false;
    self.Test.hidewheninkillcam = 1;
    self.Test.hidewheninmenu = 1;
    self.Test setshader("line_vertical", 90, 50);
    self.Test thread DestroyBefore();

    if (!isDefined(self.maxhealth) || self.maxhealth <= 0)
        self.maxhealth = 100;

    while (1) {
        if (level.intermission) {
            self.health_bar destroy();
            self.health_text destroy();
            break;
        }
        downed = self player_is_in_laststand();
        low_health = self.health < 75;

        if (downed || low_health)
            color = level.ui_better_red_bright;
        else
            color = (1, 1, 1);
       
        width = (self.health / self.maxhealth) * base_width * (250 / 250);
        width = downed ? 1 : int(max(width, 1));

        if (color == level.ui_better_red_bright) {
            self.health_bar.color = color;
            self.health_bar setShader("white", width, base_height);
        }
        else {
            self.health_bar.color = (1, 1, 1);
            self.health_bar setShader("white", width, base_height);
        }

        self.health_text.color = color;
        self.health_text setValue(downed ? 1 : self.health);
        wait .05;
    }
}

EmpHudWatcher() {
	self endon("disconnect");
	
	self.iconsize = 13;
	self.SecondaryShader = "";
	self.SecondaryGrenades = 0;
	SecondaryAmount = 0;
	
	while(1) {
		wait .2;
		if (self hasweapon("emp_grenade_zm") && isdefined(self.SecondaryIcon1)) {
			if (self.SecondaryShader != "hud_empgrenade") {
				self.SecondaryIcon1 setshader("hud_empgrenade", self.iconsize, self.iconsize);
				self.SecondaryIcon2 setshader("hud_empgrenade", self.iconsize, self.iconsize);
				self.SecondaryIcon3 setshader("hud_empgrenade", self.iconsize, self.iconsize);
				self.SecondaryShader = "hud_empgrenade";
			}
			SecondaryAmount = self getweaponammoclip("emp_grenade_zm");
			if(self.SecondaryGrenades != SecondaryAmount) {
				self.SecondaryGrenades = SecondaryAmount;
				if(SecondaryAmount == 2) {
					a = 1;
					b = 1;
					c = 0;
					
					self.SecondaryIcon2.color = (0.5,0.5,0.5);
					self.SecondaryIcon1.color = (1,1,1);
				}
				else if(SecondaryAmount == 1) {
					a = 0;
					b = 1;
					c = 0;
				
					self.SecondaryIcon2.color = (1,1,1);
					self.SecondaryIcon1.color = (0.5,0.5,0.5);
				}
				else {
					a = 0;
					b = 0;
					c = 0;
				}
				
				if(isdefined(a)) {
					self.SecondaryIcon2.alpha = b;
					self.SecondaryIcon1.alpha = a;
					self.SecondaryIcon3.alpha = c;
				}
			}
		}
		else if (self hasweapon("cymbal_monkey_zm") && isdefined(self.SecondaryIcon1)) {
			if (self.SecondaryShader != "hud_cymbal_monkey") {
				self.SecondaryIcon1 setshader("hud_cymbal_monkey", self.iconsize, self.iconsize);
				self.SecondaryIcon2 setshader("hud_cymbal_monkey", self.iconsize, self.iconsize);
				self.SecondaryIcon3 setshader("hud_cymbal_monkey", self.iconsize, self.iconsize);
				self.SecondaryShader = "hud_cymbal_monkey";
			}
			SecondaryAmount = self getweaponammoclip("cymbal_monkey_zm");
			
			if(self.SecondaryGrenades != SecondaryAmount) {
				self.SecondaryGrenades = SecondaryAmount;
				
				if(SecondaryAmount == 3) {
					a = 1;
					b = 1;
					c = 1;
					
					self.SecondaryIcon3.color = (0.5,0.5,0.5);
					self.SecondaryIcon2.color = (0.5,0.5,0.5);
					self.SecondaryIcon1.color = (1,1,1);
				}
				else if(SecondaryAmount == 2) {
					a = 0;
					b = 1;
					c = 1;
					
					self.SecondaryIcon3.color = (0.5,0.5,0.5);
					self.SecondaryIcon2.color = (1,1,1);
					self.SecondaryIcon1.color = (1,1,1);
				}
				else if(SecondaryAmount == 1) {
					a = 0;
					b = 0;
					c = 1;
					
					self.SecondaryIcon3.color = (1,1,1);
					self.SecondaryIcon1.color = (0.5,0.5,0.5);
					self.SecondaryIcon2.color = (0.5,0.5,0.5);
				}
				else {
					a = 0;
					b = 0;
					c = 0;
				}
				
				if(isdefined(a)) {
					self.SecondaryIcon2.alpha = b;
					self.SecondaryIcon1.alpha = a;
					self.SecondaryIcon3.alpha = c;
				}
			}
		}
		else if(self is_player_placeable_mine( "claymore_zm" ) ) {
			ThirdAmount = self getweaponammoclip("claymore_zm");
			
        	if(!isdefined(self.ClaymoreIcon)) {
        		self.ClaymoreIcon = newClientHudElem(self);
    			self.ClaymoreIcon.x = 570;
    			self.ClaymoreIcon.y = 450;
   				self.ClaymoreIcon.alignx = "RIGHT";
    			self.ClaymoreIcon.aligny = "TOP";
   				self.ClaymoreIcon.color = (1, 1, 1);
    			self.ClaymoreIcon.alpha = 1;
    			self.ClaymoreIcon.archived = false;
    			self.ClaymoreIcon.sort = 1;
    			self.ClaymoreIcon.horzalign = "fullscreen";
    			self.ClaymoreIcon.vertalign = "fullscreen";
    			self.ClaymoreIcon.hidewheninkillcam = 1;
    			self.ClaymoreIcon.hidewheninmenu = 1;
    			self.ClaymoreIcon setshader("hud_icon_claymore_256", self.iconsize + 3, self.iconsize + 3);
    			self.ClaymoreIcon thread DestroyBefore();
        	}
        	
        	if(ThirdAmount > 0 && self.ClaymoreIcon.alpha != 1)
        		self.ClaymoreIcon.alpha = 1;
        	else if(ThirdAmount < 1 && self.ClaymoreIcon.alpha != 0)
        		self.ClaymoreIcon.alpha = 0;
        }
        else if(isdefined(self.ClaymoreIcon))
        	self.ClaymoreIcon destroy();
        else if (!self hasweapon("cymbal_monkey_zm") && isdefined(self.SecondaryIcon1)) {
        	self.SecondaryIcon2.alpha = 0;
			self.SecondaryIcon1.alpha = 0;
			self.SecondaryIcon3.alpha = 0;
        }
	}
}

WeaponNewAmmoHud() {
	self endon("disconnect");
	
	while(1) {
		weapon = self getcurrentweapon();
		clipcount = self getweaponammoclip(weapon);
		
		if(!is_ks_weapon(weapon) && self.WeaponAmmoTextNew.alpha == 0)
			self.WeaponAmmoTextNew.alpha = 1;
		
		if(weaponClipSize(weapon) <= 20) {
			output = "";
			
			for(i = 0;i < clipcount;i++) 
				output += "| ";
			self.WeaponAmmoTextNew settext(output);
			self.WeaponAmmoTextNew2.alpha = 0;
		}
		else if(weaponClipSize(weapon) >= 50) {
			output = "";
			output2 = "";
			
			for(i = 0;i < clipcount;i++) {
				if(i < 100) {
					if(i >= 50)
						output2 += "|";
					else
						output += "|";
				}
			}
			
			self.WeaponAmmoTextNew settext(output);
			self.WeaponAmmoTextNew2.alpha = 1;
			self.WeaponAmmoTextNew2 settext(output2);
		}
		else {
			output = "";
			for(i = 0;i < clipcount;i++) 
				output += "|";
			self.WeaponAmmoTextNew settext(output);
			self.WeaponAmmoTextNew2.alpha = 0;
		}
		
		self waittill_any("weapon_change", "weapon_fired", "reload", "spawned_player", "refreshui");
	}
}

TrackAmmoStuff() {
	self endon("disconnect");
	
	flag_wait("give_hud");
	
	self thread ChangeColorText();
	self thread EmpHudWatcher();
	self thread WeaponNewAmmoHud();
	
	self.iconsize = 13;
	self.SecondaryShader = "";
	self.SecondaryGrenades = 0;
	
	while (1) {
		wait .05;
		
		weapon = self getcurrentweapon();
		if(weapon != "slowgun_zm" && weapon != "slowgun_upgraded_zm" && weapon != "jetgun_zm" && !is_ks_weapon(weapon)) {
			clipcount = self getweaponammoclip(weapon);
			stockammo = self getweaponammostock(weapon);
			self.WeaponammoClip setvalue(clipcount);
			self.WeaponammoStock setvalue(stockammo);
			if(stockammo < 10)
				self.WeaponammoClip.x = self.WeaponammoStock.x - 16;
			else if(stockammo < 100)
				self.WeaponammoClip.x = self.WeaponammoStock.x - 20;
			else
				self.WeaponammoClip.x = self.WeaponammoStock.x - 24;
			if(self.WeaponammoClip.alpha != 1)
				self.WeaponammoClip.alpha = 1;
		}
		else if(is_ks_weapon(weapon)) {
			self.WeaponammoStock setvalue(self.warmachineshots);
			self.WeaponammoClip.alpha = 0;
			self.WeaponAmmoTextNew.alpha = 0;
		}
		else {
			self.WeaponammoStock setvalue(int(self isweaponoverheating(1, self getcurrentweapon())));
			if(self.WeaponammoClip.alpha != 0)
				self.WeaponammoClip.alpha = 0;
		}
		
		grenades = self getweaponammoclip(self get_player_lethal_grenade());
		
		if(isdefined(grenades) && grenades == 0) {
			a = 0;
			b = 0;
		}
		else if(isdefined(grenades) && grenades == 1) {
			a = 0;
			b = 1;
			
			self.GrenadeIcon1.color = (0.5,0.5,0.5);
			self.GrenadeIcon2.color = (1,1,1);
		}
		else if(isdefined(grenades) && grenades == 2) {
			a = 1;
			b = 1;
			
			self.GrenadeIcon1.color = (1,1,1);
			self.GrenadeIcon2.color = (0.5,0.5,0.5);
		}
		
		if(isdefined(a)) {
			self.GrenadeIcon1.alpha = a;
			self.GrenadeIcon2.alpha = b;
		}
		
		if (self hasweapon("sticky_grenade_zm") && isdefined(self.GrenadeIcon1)) {
			if (self.GrenadeIcon1.shader != "hud_icon_sticky_grenade") {
				self.GrenadeIcon1 setshader("hud_icon_sticky_grenade", self.iconsize, self.iconsize);
				self.GrenadeIcon2 setshader("hud_icon_sticky_grenade", self.iconsize, self.iconsize);
			}
		}
		else if (self hasweapon("frag_grenade_zm") && isdefined(self.GrenadeIcon1)) {
			if (self.GrenadeIcon1.shader != "hud_grenadeicon") {
				self.GrenadeIcon1 setshader("hud_grenadeicon", self.iconsize, self.iconsize);
				self.GrenadeIcon2 setshader("hud_grenadeicon", self.iconsize, self.iconsize);
			}
		}
	}
}

get_real_name(weap) {
	if(weap == "raygun_mark2_zm")
		Weaponname = &"ZMWEAPON_RAYGUN_MARK2";
	else if(weap == "jetgun_zm")
		Weaponname = &"ZMWEAPON_JETGUN";
	else if(weap == "riotshield_zm")
		Weaponname = &"ZMWEAPON_RIOTSHIELD";
	else if(weap == "slipgun_zm")
		Weaponname = &"ZMWEAPON_SLIPGUN";
	else if(weap == "tazer_knuckles_zm")
		Weaponname = &"ZMWEAPON_TAZER";
	else if(weap == "knife_ballistic_no_melee_zm")
		Weaponname = &"WEAPON_KNIFE_BALLISTIC";
	else if(weap == "knife_ballistic_bowie_zm")
		Weaponname = &"WEAPON_KNIFE_BALLISTIC";
	else if(weap == "knife_ballistic_zm")
		Weaponname = &"WEAPON_KNIFE_BALLISTIC";
	else if(weap == "ray_gun_zm")
		Weaponname = &"WEAPON_RAY_GUN";
	else if(weap == "cymbal_monkey_zm")
		Weaponname = &"ZOMBIE_CYMBAL_MONKEY";
	else if(weap == "an94_zm")
		Weaponname = &"WEAPON_AN94";
	else if(weap == "m32_zm")
		Weaponname = &"WEAPON_M32";
	else if(weap == "usrpg_zm")
		Weaponname = &"WEAPON_USRPG";
	else if(weap == "claymore_zm")
		Weaponname = &"WEAPON_CLAYMORE";
	else if(weap == "sticky_grenade_zm")
		Weaponname = &"WEAPON_STICKY_GRENADE";
	else if(weap == "frag_grenade_zm")
		Weaponname = &"WEAPON_M2FRAGGRENADE";
	else if(weap == "hamr_zm")
		Weaponname = &"WEAPON_HAMR";
	else if(weap == "rpd_zm")
		Weaponname = &"WEAPON_RPD";
	else if(weap == "svu_zm")
		Weaponname = &"WEAPON_SVU";
	else if(weap == "barretm82_zm")
		Weaponname = &"WEAPON_BARRETM82";
	else if(weap == "dsr50_zm")
		Weaponname = &"WEAPON_DSR50";
	else if(weap == "fnfal_zm")
		Weaponname = &"ZMWEAPON_FNFAL";
	else if(weap == "galil_zm")
		Weaponname = &"WEAPON_GALIL";
	else if(weap == "tar21_zm")
		Weaponname = &"WEAPON_TAR21";
	else if(weap == "type95_zm")
		Weaponname = &"WEAPON_TYPE95";
	else if(weap == "xm8_zm")
		Weaponname = &"WEAPON_XM8";
	else if(weap == "m16_zm")
		Weaponname = &"WEAPON_M16";
	else if(weap == "saritch_zm")
		Weaponname = &"WEAPON_SARITCH";
	else if(weap == "m14_zm")
		Weaponname = &"WEAPON_M14";
	else if(weap == "srm1216_zm")
		Weaponname = &"WEAPON_SRM1216";
	else if(weap == "saiga12_zm")
		Weaponname = &"WEAPON_SAIGA12";
	else if(weap == "rottweil72_zm")
		Weaponname = &"WEAPON_ROTTWEIL72";
	else if(weap == "870mcs_zm")
		Weaponname = &"WEAPON_870MCS";
	else if(weap == "pdw57_zm")
		Weaponname = &"WEAPON_PDW57";
	else if(weap == "qcw05_zm")
		Weaponname = &"WEAPON_QCW05";
	else if(weap == "mp5k_zm")
		Weaponname = &"WEAPON_MP5K";
	else if(weap == "ak74u_zm")
		Weaponname = &"WEAPON_AK74U";
	else if(weap == "fivesevendw_zm")
		Weaponname = &"WEAPON_FIVESEVEN_DW";
	else if(weap == "beretta93r_zm")
		Weaponname = &"WEAPON_BERETTA93R";
	else if(weap == "fiveseven_zm")
		Weaponname = &"WEAPON_FIVESEVEN";
	else if(weap == "kard_zm")
		Weaponname = &"WEAPON_KARD";
	else if(weap == "judge_zm")
		Weaponname = &"WEAPON_JUDGE";
	else if(weap == "python_zm")
		Weaponname = &"WEAPON_PYTHON";
	else if(weap == "m1911_zm")
		Weaponname = &"WEAPON_M1911";
	else if(weap == "raygun_mark2_upgraded_zm")
		Weaponname = &"ZMWEAPON_RAYGUN_MARK2_UPGRADED";
	else if(weap == "knife_ballistic_no_melee_upgraded_zm")
		Weaponname = &"ZOMBIE_KNIFE_BALLISTIC_UPGRADED";
	else if(weap == "knife_ballistic_bowie_upgraded_zm")
		Weaponname = &"ZOMBIE_KNIFE_BALLISTIC_UPGRADED";
	else if(weap == "knife_ballistic_upgraded_zm")
		Weaponname = &"ZOMBIE_KNIFE_BALLISTIC_UPGRADED";
	else if(weap == "ray_gun_upgraded_zm")
		Weaponname = &"ZOMBIE_RAY_GUN_UPGRADED";
	else if(weap == "an94_upgraded_zm")
		Weaponname = &"ZMWEAPON_AN94_UPGRADED";
	else if(weap == "m32_upgraded_zm")
		Weaponname = &"WEAPON_M32";
	else if(weap == "usrpg_upgraded_zm")
		Weaponname = &"ZMWEAPON_USRPG_UPGRADED";
	else if(weap == "hamr_upgraded_zm")
		Weaponname = &"ZMWEAPON_HAMR_UPGRADED";
	else if(weap == "rpd_upgraded_zm")
		Weaponname = &"ZMWEAPON_RPD_UPGRADED";
	else if(weap == "svu_upgraded_zm")
		Weaponname = &"ZMWEAPON_SVU_UPGRADED";
	else if(weap == "barretm82_upgraded_zm")
		Weaponname = &"ZMWEAPON_BARRETM82_UPGRADED";
	else if(weap == "dsr50_upgraded_zm")
		Weaponname = &"ZMWEAPON_DSR50_UPGRADED";
	else if(weap == "fnfal_upgraded_zm")
		Weaponname = &"ZOMBIE_FNFAL_UPGRADED";
	else if(weap == "galil_upgraded_zm")
		Weaponname = &"ZOMBIE_GALIL_UPGRADED";
	else if(weap == "tar21_upgraded_zm")
		Weaponname = &"ZMWEAPON_TAR21_UPGRADED";
	else if(weap == "type95_upgraded_zm")
		Weaponname = &"ZMWEAPON_TYPE95_UPGRADED";
	else if(weap == "xm8_upgraded_zm")
		Weaponname = &"ZMWEAPON_XM8_UPGRADED";
	else if(weap == "m16_gl_upgraded_zm")
		Weaponname = &"ZOMBIE_M16_UPGRADED";
	else if(weap == "saritch_upgraded_zm")
		Weaponname = &"ZMWEAPON_SARITCH_UPGRADED";
	else if(weap == "m14_upgraded_zm")
		Weaponname = &"ZOMBIE_M14_UPGRADED";
	else if(weap == "srm1216_upgraded_zm")
		Weaponname = &"ZMWEAPON_SRM1216_UPGRADED";
	else if(weap == "saiga12_upgraded_zm")
		Weaponname = &"ZMWEAPON_SAIGA12_UPGRADED";
	else if(weap == "rottweil72_upgraded_zm")
		Weaponname = &"ZOMBIE_ROTTWEIL72_UPGRADED";
	else if(weap == "870mcs_upgraded_zm")
		Weaponname = &"ZMWEAPON_870MCS_UPGRADED";
	else if(weap == "pdw57_upgraded_zm")
		Weaponname = &"ZMWEAPON_PDW57_UPGRADED";
	else if(weap == "qcw05_upgraded_zm")
		Weaponname = &"ZMWEAPON_QCW05_UPGRADED";
	else if(weap == "mp5k_upgraded_zm")
		Weaponname = &"ZOMBIE_MP5K_UPGRADED";
	else if(weap == "ak74u_upgraded_zm")
		Weaponname = &"ZOMBIE_AK74U_UPGRADED";
	else if(weap == "fivesevendw_upgraded_zm")
		Weaponname = &"ZMWEAPON_FIVESEVEN_DW_UPGRADED";
	else if(weap == "beretta93r_upgraded_zm")
		Weaponname = &"ZMWEAPON_BERETTA93R_UPGRADED";
	else if(weap == "fiveseven_upgraded_zm")
		Weaponname = &"ZMWEAPON_FIVESEVEN_UPGRADED";
	else if(weap == "kard_upgraded_zm")
		Weaponname = &"ZMWEAPON_KARD_UPGRADED";
	else if(weap == "judge_upgraded_zm")
		Weaponname = &"ZMWEAPON_JUDGE_UPGRADED";
	else if(weap == "python_upgraded_zm")
		Weaponname = &"ZOMBIE_PYTHON_UPGRADED";
	else if(weap == "m1911_upgraded_zm")
		Weaponname = &"ZOMBIE_M1911_UPGRADED";
	else if(weap == "thompson_upgraded_zm")
		Weaponname = &"ZMWEAPON_THOMPSON_UPGRADED";
	else if(weap == "uzi_upgraded_zm")
		Weaponname = &"ZMWEAPON_UZI_UPGRADED";
	else if(weap == "ak47_upgraded_zm")
		Weaponname = &"ZMWEAPON_AK47_UPGRADED";
	else if(weap == "blundersplat_upgraded_zm")
		Weaponname = &"ZMWEAPON_ACIDGAT_UPGRADED";
	else if(weap == "blundergat_upgraded_zm")
		Weaponname = &"ZMWEAPON_BLUNDERGAT_UPGRADED";
	else if(weap == "lsat_upgraded_zm")
		Weaponname = &"ZMWEAPON_LSAT_UPGRADED";
	else if(weap == "upgraded_tomahawk_zm")
		Weaponname = &"ZMWEAPON_TOMAHAWK_UPGRADED";
	else if(weap == "thompson_zm")
		Weaponname = &"ZMWEAPON_THOMPSON";
	else if(weap == "uzi_zm")
		Weaponname = &"WEAPON_UZI";
	else if(weap == "ak47_zm")
		Weaponname = &"WEAPON_AK47";
	else if(weap == "blundersplat_zm")
		Weaponname = &"ZMWEAPON_ACIDGAT";
	else if(weap == "blundergat_zm")
		Weaponname = &"ZMWEAPON_BLUNDERGAT";
	else if(weap == "lsat_zm")
		Weaponname = &"WEAPON_LSAT";
	else if(weap == "willy_pete_zm")
		Weaponname = &"WEAPON_SMOKE_GRENADE";
	else if(weap == "bouncing_tomahawk_zm")
		Weaponname = &"ZMWEAPON_TOMAHAWK";
	else if(weap == "upgraded_tomahawk_zm")
		Weaponname = &"ZMWEAPON_TOMAHAWK_UPGRADED";
	else if(weap == "time_bomb_zm")
		Weaponname = &"ZMWEAPON_TIME_BOMB";
	else if(weap == "slowgun_zm")
		Weaponname = &"ZMWEAPON_PARALYZER";
	else if(weap == "rnma_zm")
		Weaponname = &"ZMWEAPON_RNMA";
	else if(weap == "slowgun_upgraded_zm")
		Weaponname = &"ZMWEAPON_PARALYZER_UPGRADED";
	else if(weap == "rnma_upgraded_zm")
		Weaponname = &"ZMWEAPON_RNMA_UPGRADED";
	else if(weap == "staff_revive_zm")
		Weaponname = &"ZMWEAPON_STAFF_REVIVE";
	else if(weap == "staff_water_upgraded_zm")
		Weaponname = &"ZMWEAPON_STAFF_WATER_UPGRADED";
	else if(weap == "staff_water_zm_cheap")
		Weaponname = &"ZMWEAPON_STAFF_WATER";
	else if(weap == "staff_water_zm")
		Weaponname = &"ZMWEAPON_STAFF_WATER";
	else if(weap == "staff_lightning_upgraded_zm")
		Weaponname = &"ZMWEAPON_STAFF_LIGHTNING_UPGRADED";
	else if(weap == "staff_lightning_zm")
		Weaponname = &"ZMWEAPON_STAFF_LIGHTNING";
	else if(weap == "staff_fire_upgraded_zm")
		Weaponname = &"ZMWEAPON_STAFF_FIRE_UPGRADED";
	else if(weap == "staff_fire_zm")
		Weaponname = &"ZMWEAPON_STAFF_FIRE";
	else if(weap == "staff_air_upgraded_zm")
		Weaponname = &"ZMWEAPON_STAFF_AIR_UPGRADED";
	else if(weap == "staff_air_zm")
		Weaponname = &"ZMWEAPON_STAFF_AIR";
	else if(weap == "beacon_zm")
		Weaponname = &"ZOMBIE_BEACON";
	else if(weap == "c96_zm")
		Weaponname = &"ZMWEAPON_C96";
	else if(weap == "ballista_zm")
		Weaponname = &"WEAPON_BALLISTA";
	else if(weap == "evoskorpion_zm")
		Weaponname = &"WEAPON_EVOSKORPION";
	else if(weap == "mp40_stalker_zm")
		Weaponname = &"ZMWEAPON_MP40_STALKER";
	else if(weap == "mp40_zm")
		Weaponname = &"ZMWEAPON_MP40";
	else if(weap == "ksg_zm")
		Weaponname = &"WEAPON_KSG";
	else if(weap == "scar_zm")
		Weaponname = &"WEAPON_SCAR";
	else if(weap == "mp44_zm")
		Weaponname = &"ZMWEAPON_MP44";
	else if(weap == "mg08_zm")
		Weaponname = &"ZMWEAPON_MG08";
	else if(weap == "c96_upgraded_zm")
		Weaponname = &"ZMWEAPON_C96_UPGRADED";
	else if(weap == "ballista_upgraded_zm")
		Weaponname = &"ZMWEAPON_BALLISTA_UPGRADED";
	else if(weap == "evoskorpion_upgraded_zm")
		Weaponname = &"ZMWEAPON_EVOSKORPION_UPGRADED";
	else if(weap == "mp40_stalker_upgraded_zm")
		Weaponname = &"ZMWEAPON_MP40_STALKER_UPGRADED";
	else if(weap == "mp40_upgraded_zm")
		Weaponname = &"ZMWEAPON_MP40_UPGRADED";
	else if(weap == "ksg_upgraded_zm")
		Weaponname = &"ZMWEAPON_KSG_UPGRADED";
	else if(weap == "scar_upgraded_zm")
		Weaponname = &"ZMWEAPON_SCAR_UPGRADED";
	else if(weap == "mp44_upgraded_zm")
		Weaponname = &"ZMWEAPON_MP44_UPGRADED";
	else if(weap == "mg08_upgraded_zm")
		Weaponname = &"ZMWEAPON_MG08_UPGRADED";
	else
		Weaponname = "none";
	
	return Weaponname;
}

ChangeColorText() {
	self endon("disconnect");
	level endon("end_game");
	while (1) {
		weapon = self getcurrentweapon();
		
		stockMax = WeaponMaxAmmo( weapon ) / 8;
		checkforlowammo = self getweaponammoclip(weapon) + self getweaponammostock(weapon);
		
		maxclip = weaponclipsize(weapon) / 3;
		checkforclip = self getweaponammoclip(weapon);
		
		if(weapon != "" && weapon != "none" && !self isthrowinggrenade() && isDefined(self.is_drinking) && self.is_drinking != 1 && !isdefined(self.screecher_weapon) && weapon != "slowgun_zm") {
			if(checkforlowammo <= stockMax) {
				self.WeaponammoStock fadeovertime(0.5);
				self.WeaponammoStock.color = level.ui_better_red;
				self.WeaponammoClip fadeovertime(0.5);
				self.WeaponammoClip.color = level.ui_better_red;
				self.WeaponAmmoTextNew fadeovertime(0.5);
				self.WeaponAmmoTextNew.color = level.ui_better_red;
				wait 0.5;
				self.WeaponammoStock fadeovertime(0.5);
				self.WeaponammoStock.color = (1, 1, 1);
				self.WeaponammoClip fadeovertime(0.5);
				self.WeaponammoClip.color = (1, 1, 1);
				self.WeaponAmmoTextNew fadeovertime(0.5);
				self.WeaponAmmoTextNew.color = (1,1,1);
				wait 0.5;
			}
			else if(checkforclip <= maxclip) {
				self.WeaponammoClip fadeovertime(0.5);
				self.WeaponammoClip.color = level.ui_better_red;
				self.WeaponAmmoTextNew fadeovertime(0.5);
				self.WeaponAmmoTextNew.color = level.ui_better_red;
				wait 0.5;
				self.WeaponammoClip fadeovertime(0.5);
				self.WeaponammoClip.color = (1, 1, 1);
				self.WeaponAmmoTextNew fadeovertime(0.5);
				self.WeaponAmmoTextNew.color = (1,1,1);
				wait 0.5;
			}
			else {
				if (self.WeaponammoStock.color != (1, 1, 1)) {
					self.WeaponammoStock.color = (1, 1, 1);
					self.WeaponAmmoTextNew.color = (1,1,1);
					wait 0.5;
				}
				if (self.WeaponammoClip.color != (1, 1, 1)) {
					self.WeaponammoClip.color = (1, 1, 1);
					self.WeaponAmmoTextNew.color = (1,1,1);
					wait 0.5;
				}
			}
		}
		wait .05;
	}
}

KillStreakHud() {
	self endon("disconnect");
	level endoN("end_game");
	
	if(!isdefined(self.KillStreakSlot))
		self.KillStreakSlot = [];
	
	self.KillStreakSlot["KillCouunterBar"] = newClientHudElem(self);
    self.KillStreakSlot["KillCouunterBar"].x = 625;
    self.KillStreakSlot["KillCouunterBar"].y = 393;
    self.KillStreakSlot["KillCouunterBar"].alignx = "RIGHT";
    self.KillStreakSlot["KillCouunterBar"].aligny = "BOTTOM";
    self.KillStreakSlot["KillCouunterBar"].horzalign = "fullscreen";
    self.KillStreakSlot["KillCouunterBar"].vertalign = "fullscreen";
    self.KillStreakSlot["KillCouunterBar"].alpha = 1;
    self.KillStreakSlot["KillCouunterBar"].sort = 2;
    self.KillStreakSlot["KillCouunterBar"].color = (1,1,1);
    self.KillStreakSlot["KillCouunterBar"].archived = true;
    self.KillStreakSlot["KillCouunterBar"].hidewheninmenu = 1;
    self.KillStreakSlot["KillCouunterBar"].hidewheninkillcam = 1;
    self.KillStreakSlot["KillCouunterBar"] setshader("white", 2, 0);
    
    self.KillStreakSlot["KillCouunterBack"] = newClientHudElem(self);
    self.KillStreakSlot["KillCouunterBack"].x = 625;
    self.KillStreakSlot["KillCouunterBack"].y = 393;
    self.KillStreakSlot["KillCouunterBack"].alignx = "RIGHT";
    self.KillStreakSlot["KillCouunterBack"].aligny = "BOTTOM";
    self.KillStreakSlot["KillCouunterBack"].horzalign = "fullscreen";
    self.KillStreakSlot["KillCouunterBack"].vertalign = "fullscreen";
    self.KillStreakSlot["KillCouunterBack"].alpha = 1;
    self.KillStreakSlot["KillCouunterBack"].sort = 0;
    self.KillStreakSlot["KillCouunterBack"].color = (0,0,0);
    self.KillStreakSlot["KillCouunterBack"].archived = true;
    self.KillStreakSlot["KillCouunterBack"].hidewheninmenu = 1;
    self.KillStreakSlot["KillCouunterBack"].hidewheninkillcam = 1;
    self.KillStreakSlot["KillCouunterBack"] setshader("white", 2, 65);
    
    self.KillStreakSlot["OneShader"] = newClientHudElem(self);
    self.KillStreakSlot["OneShader"].x = 619;
    self.KillStreakSlot["OneShader"].y = 394;
    self.KillStreakSlot["OneShader"].alignx = "RIGHT";
    self.KillStreakSlot["OneShader"].aligny = "BOTTOM";
    self.KillStreakSlot["OneShader"].horzalign = "fullscreen";
    self.KillStreakSlot["OneShader"].vertalign = "fullscreen";
    self.KillStreakSlot["OneShader"].alpha = 1;
    self.KillStreakSlot["OneShader"].sort = 0;
    self.KillStreakSlot["OneShader"].color = (1,1,1);
    self.KillStreakSlot["OneShader"].archived = true;
    self.KillStreakSlot["OneShader"].hidewheninmenu = 1;
    self.KillStreakSlot["OneShader"].hidewheninkillcam = 1;
    
    self.KillStreakSlot["TwoShader"] = newClientHudElem(self);
    self.KillStreakSlot["TwoShader"].x = 625;
    self.KillStreakSlot["TwoShader"].y = 374;
    self.KillStreakSlot["TwoShader"].alignx = "RIGHT";
    self.KillStreakSlot["TwoShader"].aligny = "BOTTOM";
    self.KillStreakSlot["TwoShader"].horzalign = "fullscreen";
    self.KillStreakSlot["TwoShader"].vertalign = "fullscreen";
    self.KillStreakSlot["TwoShader"].alpha = 1;
    self.KillStreakSlot["TwoShader"].sort = -1;
    self.KillStreakSlot["TwoShader"].color = (1,1,1);
    self.KillStreakSlot["TwoShader"].archived = true;
    self.KillStreakSlot["TwoShader"].hidewheninmenu = 1;
    self.KillStreakSlot["TwoShader"].hidewheninkillcam = 1;
    
    self.KillStreakSlot["ThreeShader"] = newClientHudElem(self);
    self.KillStreakSlot["ThreeShader"].x = 619;
    self.KillStreakSlot["ThreeShader"].y = 344;
    self.KillStreakSlot["ThreeShader"].alignx = "RIGHT";
    self.KillStreakSlot["ThreeShader"].aligny = "BOTTOM";
    self.KillStreakSlot["ThreeShader"].horzalign = "fullscreen";
    self.KillStreakSlot["ThreeShader"].vertalign = "fullscreen";
    self.KillStreakSlot["ThreeShader"].alpha = 1;
    self.KillStreakSlot["ThreeShader"].sort = -1;
    self.KillStreakSlot["ThreeShader"].color = (1,1,1);
    self.KillStreakSlot["ThreeShader"].archived = true;
    self.KillStreakSlot["ThreeShader"].hidewheninmenu = 1;
    self.KillStreakSlot["ThreeShader"].hidewheninkillcam = 1;
    
    self.streakstage = 0;
    self thread RefreshIcons();
    
    while(1) {
    	if(isdefined(self.KillStreakSlot["KillCouunterBar"])) {
    		self.KillStreakSlot["KillCouunterBar"] setshader("white", 2, 1);
    		self.KillStreakSlot["KillCouunterBar"] scaleovertime(10, 2, 65);
    		wait 10;
    	}
    	wait .05;
    }
}

RefreshIcons() {
	self endon("disconnect");
	level endon("end_game");
	
	while(1) {
		self.KillStreakSlot["OneShader"] setshader("zom_hud_icon_buildable_woof_speaker", 17, 17);
		self.KillStreakSlot["TwoShader"] setshader("hud_ks_m32", 30, 30);
		self.KillStreakSlot["ThreeShader"] setshader("zom_hud_icon_buildable_tower_satellite", 17, 17);
		self waittill("spawned_player");
	}
}




















































