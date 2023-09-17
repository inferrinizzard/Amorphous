onClipEvent(enterFrame){
   if(_global.InspectingAward != null)
   {
      if(eval(_parent.InfoPlate) == null)
      {
         _parent.attachMovie("Award Info Plate","InfoPlate",1500);
         _parent.InfoPlate._x = 255;
         _parent.InfoPlate._alpha = 20;
         if(_ymouse < 160)
         {
            _parent.InfoPlate._y = 320;
         }
         else
         {
            _parent.InfoPlate._y = 60;
         }
      }
      else if(_parent.InfoPlate._alpha < 100)
      {
         _parent.InfoPlate._alpha += 20;
      }
   }
   else if(eval(_parent.InfoPlate) != null)
   {
      if(_parent.InfoPlate._alpha > 0)
      {
         _parent.InfoPlate._alpha -= 20;
      }
      else
      {
         removeMovieClip(_parent.InfoPlate);
      }
   }
}
