onClipEvent(load){
   SongTextFormat = new TextFormat();
   SongTextFormat.font = "Cooper Black";
   SongTextFormat.color = 0;
   SongTextFormat.size = 18;
   SongTextFormat.align = "left";
   this.createTextField("SongText",1,0,0,this._width,this._height);
   SongText.embedFonts = true;
   SongText.selectable = false;
}
