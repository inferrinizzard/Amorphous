onClipEvent(enterFrame){
   if(_name != "HeroSpiked")
   {
      if(_currentframe == 15)
      {
         stop();
      }
      else
      {
         _Y = _Y - 3 * Math.cos(_rotation * 0.017453292519943295);
         _X = _X + 3 * Math.sin(_rotation * 0.017453292519943295);
      }
   }
}
