onClipEvent(load){
   if(_name == "Splat2")
   {
      stop();
   }
   else
   {
      this.addProperty("marker",this.getMarker,this.setMarker);
      marker = null;
   }
}
