onClipEvent(load){
   if(_name != "Bounty" && _global.gameMode != "Practice")
   {
      this.addProperty(bounty,getBounty,setBounty);
      _visible = false;
      framesExisted = 0;
      pointTextFormat = new TextFormat();
      pointTextFormat.font = "Cooper Black";
      pointTextFormat.color = 0;
      pointTextFormat.size = 20;
      pointTextFormat.align = "left";
      _root.createTextField(_name + "Text",_global.capDepth++,this._x,this._y,100,35);
      pointText = eval("_root." + _name + "Text");
      pointText.embedFonts = true;
      pointText.selectable = false;
   }
   else if(_global.gameMode == "Practice")
   {
      removeMovieClip(this);
   }
}
