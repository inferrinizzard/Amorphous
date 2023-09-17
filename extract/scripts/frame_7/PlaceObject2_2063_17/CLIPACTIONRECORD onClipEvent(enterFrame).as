onClipEvent(enterFrame){
   if(_global.gameMode != "practice")
   {
      if(!HeroKilled && (_global.ClearTime < 110 || _global.gameMode != "Single") && !_global.pause)
      {
         if(_global.Score > lastScore)
         {
            scoreText.text = String(_global.Score);
            scoreText.setTextFormat(scoreTextFormat);
            scoreText._alpha = 100;
            updateQue.push(_global.Score - lastScore);
            lastScore = _global.Score;
            sinceChanged = 0;
            if(_global.Score >= 3000)
            {
               _global.GainAward("Score 3000");
            }
            if(_global.Score >= 2500)
            {
               _global.GainAward("Score 2500");
            }
            if(_global.Score >= 2000)
            {
               _global.GainAward("Score 2000");
            }
            if(_global.Score >= 1500)
            {
               _global.GainAward("Score 1500");
            }
            if(_global.Score >= 1000)
            {
               _global.GainAward("Score 1000");
            }
            if(_global.Score >= 750)
            {
               _global.GainAward("Score 750");
            }
            if(_global.Score >= 500)
            {
               _global.GainAward("Score 500");
            }
            if(_global.Score >= 350)
            {
               _global.GainAward("Score 350");
            }
            if(_global.Score >= 200)
            {
               _global.GainAward("Score 200");
            }
            if(_global.Score >= 100)
            {
               _global.GainAward("Score 100");
            }
            if(_global.Score == 777)
            {
               _global.GainAward("Jackpot");
            }
         }
         else if(sinceChanged > 60 && (_global.KillsLeft > 0 || _global.gameMode != "Single"))
         {
            if(scoreText._alpha > 0)
            {
               scoreText._alpha--;
            }
         }
         else
         {
            sinceChanged++;
         }
         if(updateDelay == 0 && updateQue.length > 0)
         {
            pointsMade = updateQue.shift();
            updateName = "bountyUpdate" + myEffects++;
            duplicateMovieClip(_root.Bounty,updateName,16384 + _global.markDepth++);
            setProperty("_root." + updateName, _X, this._x - 20);
            setProperty("_root." + updateName, _Y, this._y);
            BountyObject = eval("_root." + updateName);
            BountyObject.bounty = "+" + String(pointsMade);
            updateDelay = 20;
         }
         else if(updateDelay > 0)
         {
            updateDelay--;
         }
      }
      else
      {
         scoreText._alpha = 100;
      }
      dist_x = _X - _root.HeroPointer._x;
      dist_y = _Y - _root.HeroPointer._y;
      if(Math.sqrt(dist_x * dist_x + dist_y * dist_y) < 50 && scoreText._alpha > 50)
      {
         scoreText._alpha = 50;
      }
   }
}
