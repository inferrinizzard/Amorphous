onClipEvent(load){
   if(_name == "Splat3")
   {
      stop();
   }
   else
   {
      this.addProperty("marker",this.getMarker,this.setMarker);
      marker = null;
   }
}
