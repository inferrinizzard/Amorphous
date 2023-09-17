onClipEvent(load){
   ClearTextFormat = new TextFormat();
   ClearTextFormat.font = "Cooper Black";
   ClearTextFormat.color = 39168;
   ClearTextFormat.size = 26;
   ClearTextFormat.align = "center";
   this.createTextField("ClearText",1,0,0,this._width,this._height);
   ClearText.embedFonts = true;
   ClearText.selectable = false;
   ClearText.text = interval * 20;
   ClearText.setTextFormat(ClearTextFormat);
}
