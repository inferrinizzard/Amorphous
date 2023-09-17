onClipEvent(enterFrame){
   if(_currentframe == 30)
   {
      x = 10;
      while(x <= totalSparkles)
      {
         _root.attachMovie("Sparkle","Spark" + x,7100 + x);
         MySparkle = eval("_root.Spark" + x);
         with(MySparkle)
         {
            _x = this._parent._x + int(Math.random() * 280) - 140;
            _y = this._parent._y + int(Math.random() * 40) - 20;
         }
         SparkleColor = new Color(eval("_root.Spark" + x));
         Colorswitcher = int(Math.random() * 3) + 1;
         switch(Colorswitcher)
         {
            case 1:
               SparkleColor.setRGB(16776960);
               break;
            case 2:
               SparkleColor.setRGB(16306230);
               break;
            case 3:
               SparkleColor.setRGB(16777215);
         }
         x++;
      }
   }
   else if(_currentframe == 31)
   {
      stop();
   }
   framesExisted++;
}
