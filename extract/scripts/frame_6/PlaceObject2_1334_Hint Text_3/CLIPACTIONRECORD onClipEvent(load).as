onClipEvent(load){
   myText = null;
   _global.unbuildTo = null;
   dataTextFormat = new TextFormat();
   dataTextFormat.font = "Cooper Black";
   dataTextFormat.color = 39168;
   dataTextFormat.size = 14;
   dataTextFormat.align = "center";
   this.createTextField("dataText",this.getDepth + 1,0,0,this._width,this._height);
   dataText.embedFonts = true;
   dataText.wordWrap = true;
   dataText.selectable = false;
   if(_global.gameMode !== "Practice")
   {
      rPick = EnemiesSeen.length + 2 + 1;
      hintPick = int(Math.random() * (EnemiesSeen.length + 2) + 1);
      switch(hintPick)
      {
         case 1:
            hintCatagory = "General";
            break;
         case 2:
            hintCatagory = _global.gameMode;
            break;
         default:
            hintCatagory = EnemiesSeen[hintPick - 3];
      }
   }
   else
   {
      rPick = PracticeEnemies.length + 1 + 1;
      hintPick = int(Math.random() * (PracticeEnemies.length + 1) + 1);
      if(hintPick !== 1)
      {
         hintCatagory = PracticeEnemies[hintPick - 2];
      }
      else
      {
         hintCatagory = "General";
      }
   }
   if(_global.ABind != null || _global.SBind != null || _global.DBind != null)
   {
      if(int(Math.random() * rPick) == 0)
      {
         hintCatagory = null;
         if(_global.ABind != null)
         {
            hintCatagory = _global.ABind;
         }
         if(_global.SBind != null && (hintCatagory == null || int(Math.random() * 2) == 1))
         {
            hintCatagory = _global.SBind;
         }
         if(_global.DBind != null && (hintCatagory == null || int(Math.random() * 2) == 1))
         {
            hintCatagory = _global.DBind;
         }
      }
   }
}
