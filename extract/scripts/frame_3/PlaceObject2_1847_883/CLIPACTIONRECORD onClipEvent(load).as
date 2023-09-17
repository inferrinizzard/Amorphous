onClipEvent(load){
   if(_name != "Blackout")
   {
      framesExisted = 0;
      Blink = false;
      Fade = true;
      if(_name.slice(_name.length - 6) == "Bright")
      {
         Blink = true;
      }
      if(_name.slice(_name.length - 3) == "Dim")
      {
         Fade = false;
      }
      if(_name.slice(0,4) == "Work")
      {
         _alpha = 60;
      }
   }
}
