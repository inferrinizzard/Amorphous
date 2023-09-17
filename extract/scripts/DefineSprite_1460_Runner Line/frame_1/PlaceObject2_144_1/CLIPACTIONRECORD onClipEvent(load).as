onClipEvent(load){
   _parent.addProperty("aim",this.getAim,this.setAim);
   lifespan = 90;
   _parent.play();
   if(_parent._name.slice(-1) != "s")
   {
      _parent.aim = _parent._rotation;
   }
   else
   {
      lastLine = eval("_root." + _parent._name.slice(0,-1));
      _parent.aim = lastLine.aim;
   }
}
