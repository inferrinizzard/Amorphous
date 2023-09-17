on(press){
   if(_quality == "LOW")
   {
      _quality = "MEDIUM";
   }
   else if(_quality == "MEDIUM")
   {
      _quality = "HIGH";
   }
   else if(_quality == "HIGH")
   {
      _quality = "BEST";
   }
   _parent.QualitySetting.text = _quality;
}
