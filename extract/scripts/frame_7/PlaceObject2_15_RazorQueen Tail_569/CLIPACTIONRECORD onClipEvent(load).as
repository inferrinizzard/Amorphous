onClipEvent(load){
   mommy = false;
   if(_name == "RazorTail")
   {
      mommy = true;
      stop();
   }
   else
   {
      this.addProperty("action",this.getAction,this.setAction);
      killedBy = null;
      beenDead = 0;
      action = "none";
      turnSpeed = 6;
      speedBoost = 0;
      sLoc = 0;
      stretch = 10;
      swipeFrames = 0;
      stop();
      mommyQueen = eval("_root." + _name.slice(0,_name.length - 5));
      gotoAndStop(1);
      moveDirection = _rotation;
      SegNumber = Number(_name.slice(_name.length - 1,_name.length));
      if(SegNumber == 1)
      {
         Anchor = mommyQueen;
      }
      else
      {
         Anchor = eval("_root." + mommyQueen._name + "Tail" + (SegNumber - 1));
      }
      if(SegNumber < 4)
      {
         duplicateMovieClip(_root.RazorTail,mommyQueen._name + "Tail" + (SegNumber + 1),16384 + _global.baddieDepth++);
         nextSeg = eval("_root." + mommyQueen._name + "Tail" + (SegNumber + 1));
         with(nextSeg)
         {
            _y = this._y - 10 * Math.cos((this._rotation - 180) * 0.017453292519943295);
            _x = this._x + 10 * Math.sin((this._rotation - 180) * 0.017453292519943295);
            _rotation = this._rotation;
         }
      }
      if(SegNumber == 4)
      {
         duplicateMovieClip(_root.RazorBlade,mommyQueen._name + "Blade",16384 + _global.baddieDepth++);
         myBlade = eval("_root." + mommyQueen._name + "Blade");
         with(myBlade)
         {
            _y = this._y - 10 * Math.cos((this._rotation - 180) * 0.017453292519943295);
            _x = this._x + 10 * Math.sin((this._rotation - 180) * 0.017453292519943295);
            _rotation = this._rotation;
         }
      }
   }
}
