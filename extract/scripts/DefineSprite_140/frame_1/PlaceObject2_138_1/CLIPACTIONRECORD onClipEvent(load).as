onClipEvent(load){
   loadingTextFormat = new TextFormat();
   loadingTextFormat.font = "Cooper Black";
   loadingTextFormat.color = 16777215;
   loadingTextFormat.size = 24;
   loadingTextFormat.align = "right";
   this.createTextField("loadingText",1,0,0,this._width,this._height);
   loadingText.embedFonts = true;
   loadingText.selectable = false;
}
