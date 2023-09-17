onClipEvent(load){
   if(_global.gameMode != "Practice")
   {
      lastScore = 0;
      sinceChanged = 0;
      _visible = false;
      updateQue = new Array();
      updateDelay = 0;
      myEffects = 0;
      scoreTextFormat = new TextFormat();
      scoreTextFormat.font = "Cooper Black";
      scoreTextFormat.color = 0;
      scoreTextFormat.size = 26;
      scoreTextFormat.align = "left";
      _root.createTextField("scoreText",7000,this._x,this._y,100,25);
      scoreText = _root.scoreText;
      scoreText.embedFonts = true;
      scoreText.selectable = false;
   }
}
