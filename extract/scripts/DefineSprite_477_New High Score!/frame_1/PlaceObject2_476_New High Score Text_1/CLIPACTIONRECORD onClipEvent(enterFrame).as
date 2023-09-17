onClipEvent(enterFrame){
   if(framesExisted < 180)
   {
      if(int(Math.random() * 10) == 1)
      {
         _root.attachMovie("Firework","Work" + Fireworks,7050 + Fireworks);
         MyFirework = eval("_root.Work" + Fireworks);
         with(MyFirework)
         {
            _rotation = int(Math.random() * 60) - 30;
            _x = this._parent._x + int(Math.random() * 200) - 100;
            _y = this._parent._y + int(Math.random() * 50) - 25;
         }
         Fireworks++;
      }
   }
   framesExisted++;
}
