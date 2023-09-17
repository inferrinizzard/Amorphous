onClipEvent(load){
   mommy = false;
   hasMoved = false;
   if(_name == "Stickie")
   {
      mommy = true;
      stop();
   }
   this.addProperty("speed",this.getSpeed,this.setSpeed);
   this.addProperty("turnSpeed",this.getTurnSpeed,this.setTurnSpeed);
   speed = 3;
   if(_root.myLure.luring)
   {
      pathSpotX = _root.myLure._x;
      pathSpotY = _root.myLure._y;
   }
   else if(eval(_root.HeroPointer) != undefined)
   {
      pathSpotX = _root.HeroPointer._x;
      pathSpotY = _root.HeroPointer._y;
   }
   else
   {
      pathSpotX = 275;
      pathSpotY = 200;
   }
   objectHitX = null;
   objectHitY = null;
}
