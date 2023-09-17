onClipEvent(enterFrame){
   if(_name != "RazorMaw" && !_global.pause)
   {
      play();
      if(eval(mommyQueen) == undefined)
      {
         removeMovieClip(this);
      }
      _rotation = mommyQueen._rotation;
      _X = mommyQueen._x;
      _Y = mommyQueen._y;
      ColPtY = _Y - 20 * Math.cos(_rotation * 0.017453292519943295);
      ColPtX = _X + 20 * Math.sin(_rotation * 0.017453292519943295);
      switch(task)
      {
         case "mite":
            if(!started)
            {
               gotoAndPlay(1);
               started = true;
            }
            else if(_currentframe == 5)
            {
               if(pause == 0)
               {
                  duplicateMovieClip(_root.RazorMite,mommyQueen._name + "Mite" + mommyQueen.miteCounter,16384 + _global.capDepth++);
                  with(eval("_root." + mommyQueen._name + "Mite" + mommyQueen.miteCounter))
                  {
                     _x = ColPtX;
                     _y = ColPtY;
                     _rotation = this._rotation;
                  }
                  mommyQueen.miteCounter = mommyQueen.miteCounter + 1;
                  mommyQueen.mites = mommyQueen.mites + 1;
                  if(mommyQueen.miteCounter == 80)
                  {
                     mommyQueen.miteCounter = 10;
                  }
                  duplicateMovieClip(_root.GroundDirt,this._name + "Spit",16384 + _global.effectDepth++);
                  with(eval("_root." + this._name + "Spit"))
                  {
                     _x = ColPtX;
                     _y = ColPtY;
                     _rotation = this._rotation;
                  }
                  SpitColor = new Color(eval("_root." + this._name + "Spit"));
                  SpitColor.setRGB(3560301);
                  stop();
                  pause++;
               }
               else if(pause > 10)
               {
                  play();
               }
               else
               {
                  stop();
                  pause++;
               }
            }
            else if(_currentframe == 20)
            {
               removeMovieClip(this);
            }
         case "hedgehog":
            if(!started)
            {
               gotoAndPlay(1);
               started = true;
               break;
            }
            if(_currentframe == 5)
            {
               if(pause == 0)
               {
                  duplicateMovieClip(_root.RazorHedgehog,mommyQueen._name + "Hog" + mommyQueen.hogs,16384 + _global.capDepth++);
                  with(eval("_root." + mommyQueen._name + "Hog" + mommyQueen.hogs))
                  {
                     _x = ColPtX;
                     _y = ColPtY;
                     _rotation = this._rotation;
                  }
                  mommyQueen.hogs = mommyQueen.hogs + 1;
                  duplicateMovieClip(_root.GroundDirt,this._name + "Spit",16384 + _global.effectDepth++);
                  with(eval("_root." + this._name + "Spit"))
                  {
                     _x = ColPtX;
                     _y = ColPtY;
                     _rotation = this._rotation;
                  }
                  SpitColor = new Color(eval("_root." + this._name + "Spit"));
                  SpitColor.setRGB(3560301);
                  stop();
                  pause++;
               }
               else if(pause > 15)
               {
                  play();
               }
               else
               {
                  stop();
                  pause++;
               }
               break;
            }
            if(_currentframe == 20)
            {
               removeMovieClip(this);
               break;
            }
            break;
      }
   }
   else
   {
      stop();
   }
}
