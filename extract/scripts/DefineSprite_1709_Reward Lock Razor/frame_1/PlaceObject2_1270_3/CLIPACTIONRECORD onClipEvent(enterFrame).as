onClipEvent(enterFrame){
   if(_parent._currentframe == 2 && !flyOff)
   {
      listTo = int(Math.random() * 5) - 2;
      speed = -4;
      x = 1;
      while(x <= 15)
      {
         sparkleName = "Spark" + x;
         _parent._parent.attachMovie("Sparkle",sparkleName,3000 + x);
         MySparkle = eval("_parent._parent." + sparkleName);
         with(MySparkle)
         {
            _x = this._parent._x + int(Math.random() * 40) - 20;
            _y = this._parent._y + int(Math.random() * 40) - 20;
         }
         SparkleColor = new Color(MySparkle);
         Colorswitcher = int(Math.random() * 3) + 1;
         switch(Colorswitcher)
         {
            case 1:
               SparkleColor.setRGB(0);
               break;
            case 2:
               SparkleColor.setRGB(4348275);
               break;
            case 3:
               SparkleColor.setRGB(16777215);
         }
         x++;
      }
      flyOff = true;
   }
   if(flyOff)
   {
      _parent._y += speed;
      _parent._x += listTo;
      _parent._rotation += twist;
      if(speed < -0.2)
      {
         speed += 0.2;
      }
      else if(speed < 0)
      {
         speed = 0;
      }
      else
      {
         speed += 0.2;
      }
      if(flyFor > 0)
      {
         flyFor--;
      }
      else
      {
         _parent.removeMovieClip();
      }
   }
}
