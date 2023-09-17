onClipEvent(load){
   SNHSTextFormat = new TextFormat();
   SNHSTextFormat.font = "Cooper Black";
   SNHSTextFormat.color = 39168;
   SNHSTextFormat.size = 18;
   SNHSTextFormat.align = "center";
   this.createTextField("SNHSText",1,0,0,this._width,this._height);
   SNHSText.embedFonts = true;
   SNHSText.selectable = false;
}
