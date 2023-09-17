onClipEvent(enterFrame){
   if(_name != "SlickTag" && !_global.pause)
   {
      if(eval(hostObject) == undefined)
      {
         removeMovieClip(this);
      }
      _X = hostObject._x;
      _Y = hostObject._y;
      if(framesExisted == 0)
      {
         if(hostObject._name != "HeroPointer")
         {
            if(hostObject._name.slice(0,5) != "Frost")
            {
               hostSpeed = hostObject.speed;
               hostObject.speed = 3;
            }
            if(hostObject.fuzz < 1)
            {
               hostTurnSpeed = hostObject.turnSpeed;
               hostObject.turnSpeed = 0;
            }
         }
         else
         {
            hostObject.turnMode = false;
         }
      }
      if(framesExisted == 1)
      {
         duplicateMovieClip(_root.InkTrail,_name + "Trail",16384 + _global.effectDepth++);
      }
      if(framesExisted >= 60)
      {
         if(hostObject._name != "HeroPointer")
         {
            if(hostObject._name.slice(0,5) != "Frost")
            {
               hostObject.speed = hostSpeed;
            }
            if(hostObject.fuzz < 1)
            {
               hostObject.turnSpeed = hostTurnSpeed;
            }
         }
         else
         {
            hostObject.turnMode = true;
         }
         removeMovieClip(this);
      }
      framesExisted++;
   }
}
