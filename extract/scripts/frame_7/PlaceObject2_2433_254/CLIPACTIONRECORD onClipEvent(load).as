onClipEvent(load){
   mommy = false;
   if(_name == "RazorQuill")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("killedBy",this.getKilledBy,this.setKilledBy);
      this.addProperty("quill",this.getQuill,null);
      quill = true;
      this.addProperty("claw",this.getClaw,null);
      claw = true;
      killedBy = null;
      framesExisted = 0;
      speed = 0;
      Loose = false;
      _yscale = 40;
      mommyQueen = eval("_root." + _name.slice(0,_name.length - 7));
      myAim = _rotation - mommyQueen._rotation;
      if(myAim > 180)
      {
         myAim -= 360;
      }
      if(myAim < 180)
      {
         myAim += 360;
      }
      if(int(Math.random() * 2) == 1)
      {
         _xscale = -100;
      }
   }
}
