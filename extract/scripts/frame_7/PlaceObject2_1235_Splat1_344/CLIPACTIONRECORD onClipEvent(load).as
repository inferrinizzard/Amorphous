onClipEvent(load){
   if(_name == "Splat1")
   {
      stop();
   }
   else
   {
      this.addProperty("marker",this.getMarker,this.setMarker);
      marker = null;
   }
}
