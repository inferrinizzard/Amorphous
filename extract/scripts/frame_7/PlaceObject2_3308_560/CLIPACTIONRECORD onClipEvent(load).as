onClipEvent(load){
   if(_name == "QueenSeed")
   {
      stop();
   }
   else
   {
      this.addProperty("mommyQueen",this.getMommyQueen,this.setMommyQueen);
      stop();
      hostObject = eval("_root." + _name.slice(0,_name.length - 4));
   }
}
