onClipEvent(load){
   mommy = false;
   gotoSpotX = null;
   gotoSpotY = null;
   if(_name == "GrayTip")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("lancing",this.getLancing,null);
      killedBy = null;
      lancing = true;
      bowing = false;
      reeling = false;
      speed = 8;
      framesExisted = 0;
      tendrilBits = 0;
      buildAtY = _Y - speed * Math.cos(_rotation * 0.017453292519943295);
      buildAtX = _X + speed * Math.sin(_rotation * 0.017453292519943295);
      daddyGray = eval("_root." + _name.slice(0,_name.length - 3));
      bankName = daddyGray._name;
      heroSpeared = null;
      gotoAndStop(1);
   }
}
