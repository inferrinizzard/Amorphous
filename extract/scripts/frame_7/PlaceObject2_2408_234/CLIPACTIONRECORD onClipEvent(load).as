onClipEvent(load){
   FramesThisSecond = 0;
   ThisSecond = 0;
   LastSecond = 0;
   _visible = false;
   _root.createTextField("FPSText",_global.capDepth++,this._x,this._y,20,10);
   myText = _root.FPSText;
}
