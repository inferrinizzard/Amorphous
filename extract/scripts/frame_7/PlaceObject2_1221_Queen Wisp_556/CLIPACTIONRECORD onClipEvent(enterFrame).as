onClipEvent(enterFrame){
   if(_name != "QueenWisp" && !_global.pause)
   {
      if(_currentframe < 56)
      {
         play();
      }
      if(eval(mommyQueen) == undefined)
      {
         removeMovieClip(this);
      }
      _rotation = mommyQueen._rotation + whereOnSkin;
      _X = mommyQueen._x + 10 * Math.sin(_rotation * 0.017453292519943295);
      _Y = mommyQueen._y - 10 * Math.cos(_rotation * 0.017453292519943295);
      if(_currentframe == 56)
      {
         mommyQueen.wisps--;
         removeMovieClip(this);
      }
   }
   else
   {
      stop();
   }
}
