onClipEvent(enterFrame){
   if(_name != "Bounty" && _global.gameMode != "Practice" && !_global.pause)
   {
      if(framesExisted < 40)
      {
         if(bounty == 0)
         {
            pointText.removeTextField();
            removeMovieClip(this);
         }
         if(framesExisted == 0)
         {
            leadingChar = bounty.slice(0,1);
            if(leadingChar != "t")
            {
               pointText.text = bounty;
            }
            else
            {
               pointText.text = bounty.slice(1);
            }
            pointText.setTextFormat(pointTextFormat);
            if(leadingChar != "x" && leadingChar != "+" && leadingChar != "t")
            {
               _root.HeroPointer.pointsOnSwing += bounty;
               _root.HeroPointer.killsOnSwing = _root.HeroPointer.killsOnSwing + 1;
               if(gameMode == "Single" && KillsLeft > 0)
               {
                  _global.KillsLeft--;
               }
            }
            else if(leadingChar == "t")
            {
               pointsMade = Number(bounty.slice(1));
               _global.Score += pointsMade;
               if(gameMode == "Single" && KillsLeft > 0)
               {
                  _global.KillsLeft--;
               }
            }
            else if(leadingChar == "x")
            {
               mulNum = Number(bounty.slice(1,2));
               if(mulNum > 8)
               {
                  mulNum = 8;
               }
               switch(mulNum)
               {
                  case 8:
                     _global.GainAward("x8 Combo");
                  case 7:
                     _global.GainAward("x7 Combo");
                  case 6:
                     _global.GainAward("x6 Combo");
                  case 5:
                     _global.GainAward("x5 Combo");
                  case 4:
                     _global.GainAward("x4 Combo");
                  case 3:
                     _global.GainAward("x3 Combo");
                  case 2:
                     _global.GainAward("x2 Combo");
               }
            }
         }
         _Y = _Y - 0.5;
         pointText._x = this._x - 5;
         pointText._y = this._y - 5;
         framesExisted++;
      }
      else
      {
         pointText.removeTextField();
         removeMovieClip(this);
      }
   }
}
