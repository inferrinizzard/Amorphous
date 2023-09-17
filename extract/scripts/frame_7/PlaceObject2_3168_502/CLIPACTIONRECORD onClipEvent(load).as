onClipEvent(load){
   if(_name != "VoidPulse")
   {
      framesExisted = 0;
      backdropName = _name + "fakeBackdrop" + _global.backgroundDepth;
      duplicateMovieClip(_root.Backdrop,backdropName,16384 + _global.backgroundDepth++);
      with(eval("_root." + backdropName))
      {
         _xscale = 105;
         _yscale = 105;
      }
      myBackdrop = eval("_root." + backdropName);
      myBackdrop.setMask(this);
   }
}
