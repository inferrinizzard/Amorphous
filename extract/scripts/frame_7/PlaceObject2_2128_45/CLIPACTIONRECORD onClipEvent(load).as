onClipEvent(load){
   if(_name == "InkTrail")
   {
      mommy = true;
   }
   else
   {
      mommy = false;
      this.lineStyle(6,0,100);
      hostObject = eval("_root." + _name.slice(0,_name.length - 5));
      _X = 0;
      _Y = 0;
      notset = true;
      if(eval(hostObject) != undefined)
      {
         this.moveTo(hostObject._x,hostObject._y);
      }
   }
}
