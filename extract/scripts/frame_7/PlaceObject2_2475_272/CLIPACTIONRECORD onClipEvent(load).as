onClipEvent(load){
   if(_name == "RazorMaw")
   {
      stop();
   }
   else
   {
      this.addProperty("task",this.getTask,this.setTask);
      mommyQueen = eval("_root." + _name.slice(0,_name.length - 3));
      started = false;
      pause = 0;
      stop();
   }
}
