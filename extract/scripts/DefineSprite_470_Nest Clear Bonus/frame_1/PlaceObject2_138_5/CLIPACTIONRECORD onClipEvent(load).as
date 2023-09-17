onClipEvent(load){
   ClearTextFormat = new TextFormat();
   ClearTextFormat.font = "Cooper Black";
   ClearTextFormat.color = 0;
   ClearTextFormat.size = 26;
   ClearTextFormat.align = "center";
   this.createTextField("ClearText",1,0,0,this._width,this._height);
   ClearText.embedFonts = true;
   ClearText.selectable = false;
   ClearText.text = interval * 20;
   ClearText.setTextFormat(ClearTextFormat);
   totalSparkles = int(Math.random() * 40) + 20;
   x = 10;
   while(x <= totalSparkles)
   {
      _root.attachMovie("Sparkle","Sparky" + x,7100 + x);
      MySparkle = eval("_root.Sparky" + x);
      with(MySparkle)
      {
         _x = this._parent._x + int(Math.random() * 280) - 140;
         _y = this._parent._y + int(Math.random() * 40) - 20;
      }
      SparkleColor = new Color(eval("_root.Sparky" + x));
      Colorswitcher = int(Math.random() * 3) + 1;
      switch(Colorswitcher)
      {
         case 1:
            SparkleColor.setRGB(3384627);
            break;
         case 2:
            SparkleColor.setRGB(7459441);
            break;
         case 3:
            SparkleColor.setRGB(16777215);
      }
      x++;
   }
}
