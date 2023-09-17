onClipEvent(load){
   this.addProperty("viewingAt",this.getViewingAt,this.setViewingAt);
   viewingAt = 1;
   startingY = _Y;
   TipTextFormat = new TextFormat();
   TipTextFormat.font = "Cooper Black";
   TipTextFormat.color = 16777215;
   TipTextFormat.size = 14;
   TipTextFormat.align = "center";
   if(_global.TipsSeen.length == 0)
   {
      attachMovie("Hint Text","Tip0",1);
      Tip0.createTextField("tipText",1,0,0,Tip0._width,Tip0._height);
      Tip0.tipText.embedFonts = true;
      Tip0.tipText.wordWrap = true;
      Tip0.tipText.selectable = false;
      Tip0.tipText.text = "Start a game to see gameplay tips";
      Tip0.tipText.setTextFormat(TipTextFormat);
      Tip0.tipText._width -= 1;
   }
   else
   {
      x = 0;
      while(x < TipsSeen.length)
      {
         attachMovie("Hint Text","Tip" + x,x + 1);
         currentTip = eval("Tip" + x);
         with(currentTip)
         {
            _height = 150;
            _y = 0 + 150 * x;
            createTextField("tipText",1,0,0,_width,_height);
            tipText.embedFonts = true;
            tipText.wordWrap = true;
            tipText.selectable = false;
            tipText.text = _global.TipsSeen[x];
            tipText.setTextFormat(TipTextFormat);
            tipText._width -= 1;
         }
         x++;
      }
   }
}
