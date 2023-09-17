onClipEvent(load){
   if(_name != "PointMark")
   {
      this.addProperty("exploded",this.getExploded,this.setExploded);
      exploded = false;
      this.addProperty("speed",this.getSpeed,this.setSpeed);
      this.addProperty("turnMode",this.getTurnMode,this.setTurnMode);
      this.addProperty("pointsOnSwing",this.getPointsOnSwing,this.setPointsOnSwing);
      this.addProperty("killsOnSwing",this.getKillsOnSwing,this.setKillsOnSwing);
      this.addProperty("clutters",this.getClutters,this.setClutters);
      this.addProperty("frozenFrames",this.getFrozenFrames,this.setFrozenFrames);
      this.addProperty("invincFrames",this.getInvincFrames,this.setInvincFrames);
      pointsOnSwing = 0;
      killsOnSwing = 0;
      consecCombo = 0;
      invincFrames = 0;
      speed = 5;
      topSpeed = 5;
      passiveTime = 0;
      clutters = new Array();
      if(_global.RazorGlaiveEquipped)
      {
         speed = 4;
         topSpeed = 4;
      }
      frozenFrames = 0;
      wiggleTo = "up";
      _global.heroWasX;
      _global.heroWasY;
      _visible = false;
      turnMode = true;
      _global.HeroAction = "none";
      _global.justHit = null;
      _global.Score = 0;
      _global.HeroKilled = false;
   }
   else
   {
      duplicateMovieClip(this,"HeroPointer",16404);
      _root.HeroPointer._x = 222;
      _root.HeroPointer._y = 183;
   }
}
