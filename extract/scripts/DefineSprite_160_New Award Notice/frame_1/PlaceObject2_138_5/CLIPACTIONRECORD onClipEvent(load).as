onClipEvent(load){
   whiteFormat = new TextFormat();
   whiteFormat.font = "Cooper Black";
   whiteFormat.color = 16777215;
   whiteFormat.size = 14;
   whiteFormat.align = "left";
   this.createTextField("whiteText",1,0,0,300,this._height);
   whiteText.embedFonts = true;
   whiteText.selectable = false;
}
