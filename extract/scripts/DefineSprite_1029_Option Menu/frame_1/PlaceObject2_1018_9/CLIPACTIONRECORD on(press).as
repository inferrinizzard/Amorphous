on(press){
   if(_quality == "BEST")
   {
      _quality = "HIGH";
   }
   else if(_quality == "HIGH")
   {
      _quality = "MEDIUM";
   }
   else if(_quality == "MEDIUM")
   {
      _quality = "LOW";
   }
   _parent.QualitySetting.text = _quality;
}
