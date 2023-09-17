onClipEvent(load){
   TimeLeft = 900;
   deadTextFormat = new TextFormat();
   deadTextFormat.font = "Cooper Black";
   deadTextFormat.color = 0;
   deadTextFormat.size = 24;
   deadTextFormat.align = "center";
   this.createTextField("deadText",1,0,0,this._width,this._height);
   deadText.embedFonts = true;
   deadText.selectable = false;
}
