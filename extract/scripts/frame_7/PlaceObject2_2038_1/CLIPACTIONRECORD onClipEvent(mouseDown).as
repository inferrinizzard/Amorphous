onClipEvent(mouseDown){
   if(_name != "PointMark" && !_global.pause)
   {
      if(_global.HeroAction == "none" && (_global.ClearTime == 0 || _global.gameMode != "Single"))
      {
         if(clutters.length < 3 || int(Math.random() * 10) + 1 > clutters.length)
         {
            _global.HeroAction = "attacking";
            if(_global.RazorGlaiveEquipped)
            {
               duplicateMovieClip(_root.HeroSlashRazor,"HeroSlashin",16384 + _global.heroDepth++);
            }
            else
            {
               duplicateMovieClip(_root.HeroSlash,"HeroSlashin",16384 + _global.heroDepth++);
            }
            with(_root.HeroSlashin)
            {
               _x = this._x;
               _y = this._y;
               _rotation = this._rotation;
            }
            _global.MakeNoise("Swing");
            passiveTime = 0;
            if(eval(_root.HeroWalkin) != undefined)
            {
               removeMovieClip(_root.HeroWalkin);
            }
         }
         else
         {
            _global.justHit = this;
         }
      }
   }
}
