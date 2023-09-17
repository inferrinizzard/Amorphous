onClipEvent(load){
   this.addProperty("tipText",this.getTipText,this.setTipText);
   tipText = null;
   _alpha = 0;
   showingCreds = false;
   timeRemaining = 0;
   framesRunning = 1;
   currentCred = 1;
   infoTextFormat = new TextFormat();
   infoTextFormat.font = "Cooper Black";
   infoTextFormat.color = 39168;
   infoTextFormat.size = 14;
   infoTextFormat.align = "center";
   credTextFormat = new TextFormat();
   credTextFormat.font = "Cooper Black";
   credTextFormat.color = 16777215;
   credTextFormat.size = 12;
   credTextFormat.align = "center";
   this.createTextField("infoText",this.getDepth + 1,0,0,this._width,this._height);
   infoText.embedFonts = true;
   infoText.wordWrap = true;
   infoText.selectable = false;
}
