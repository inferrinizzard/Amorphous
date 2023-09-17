onClipEvent(load){
   killTextFormat = new TextFormat();
   killTextFormat.font = "Cooper Black";
   killTextFormat.color = 0;
   killTextFormat.size = 24;
   killTextFormat.align = "center";
   this.createTextField("killText",1,0,0,this._width,this._height);
   killText.embedFonts = true;
   killText.selectable = false;
}
