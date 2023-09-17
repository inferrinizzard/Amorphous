onClipEvent(load){
   myText = null;
   dataTextFormat = new TextFormat();
   dataTextFormat.font = "Cooper Black";
   dataTextFormat.color = 39168;
   dataTextFormat.size = 12;
   dataTextFormat.align = "left";
   this.createTextField("dataText",this.getDepth + 1,0,0,this._width,this._height);
   dataText.embedFonts = true;
   dataText.wordWrap = true;
   dataText.selectable = false;
}
