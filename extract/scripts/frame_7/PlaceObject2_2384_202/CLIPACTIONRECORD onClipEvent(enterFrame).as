onClipEvent(enterFrame){
   if(_name != "HeroHead")
   {
      if(speed != 0)
      {
         if(_currentframe == 30)
         {
            duplicateMovieClip(_root.BloodPrint,_name + "print" + prints,16384 + _global.backgroundDepth++);
            with(eval("_root." + _name + "print" + prints))
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
               gotoAndStop(6);
            }
            prints++;
         }
         _Y = _Y - speed * Math.cos(_rotation * 0.017453292519943295);
         _X = _X + speed * Math.sin(_rotation * 0.017453292519943295);
         if(framesAtSpeed >= flyRange)
         {
            speed -= 0.5;
            framesAtSpeed = 0;
         }
         framesAtSpeed++;
      }
      else
      {
         stop();
      }
   }
}
