onClipEvent(unload){
   if(eval("_root." + _name + "Spiral") != undefined)
   {
      removeMovieClip(eval("_root." + _name + "Spiral"));
   }
}
