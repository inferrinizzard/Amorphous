onClipEvent(enterFrame){
   if(_name != "AcidBubble" && !_global.pause)
   {
      play();
      if(_currentframe == 20)
      {
         bubbleRotation = int(Math.random() * 359) - 180;
         PopName = "_root." + this._name + "Pop" + _currentframe;
         duplicateMovieClip(eval("_root.Splat" + String(random(3) + 1)),this._name + "Pop" + _currentframe,16384 + _global.effectDepth++);
         setProperty(PopName, _rotation, bubbleRotation);
         setProperty(PopName, _X, this._x);
         setProperty(PopName, _Y, this._y);
         setProperty(PopName, _xscale, 30);
         setProperty(PopName, _yscale, 30);
         PopColor = new Color(eval(PopName));
         PopColor.setRGB(15898925);
         removeMovieClip(this);
      }
   }
   else
   {
      stop();
   }
}
