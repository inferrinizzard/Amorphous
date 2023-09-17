onClipEvent(load){
   BRHSTextFormat = new TextFormat();
   BRHSTextFormat.font = "Cooper Black";
   BRHSTextFormat.color = 39168;
   BRHSTextFormat.size = 18;
   BRHSTextFormat.align = "center";
   this.createTextField("BRHSText",1,0,0,this._width,this._height);
   BRHSText.embedFonts = true;
   BRHSText.selectable = false;
}
