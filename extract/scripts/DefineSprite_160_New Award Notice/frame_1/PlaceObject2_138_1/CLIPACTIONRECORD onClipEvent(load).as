onClipEvent(load){
   blackFormat = new TextFormat();
   blackFormat.font = "Cooper Black";
   blackFormat.color = 0;
   blackFormat.size = 16;
   blackFormat.align = "left";
   this.createTextField("blackText",1,0,0,300,this._height);
   blackText.embedFonts = true;
   blackText.selectable = false;
}
