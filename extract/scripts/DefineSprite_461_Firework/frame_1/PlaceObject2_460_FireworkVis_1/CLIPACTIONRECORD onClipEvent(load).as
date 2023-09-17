onClipEvent(load){
   stop();
   flyframes = 0;
   popframes = 0;
   speed = 3 + int(Math.random() * 3);
   flyTo = int(Math.random() * 20) + 30;
   listTo = int(Math.random() * 3) - 1;
   FireworkColor = new Color(this);
   Colorswitcher = int(Math.random() * 7) + 1;
   switch(Colorswitcher)
   {
      case 1:
         FireworkColor.setRGB(15674384);
         break;
      case 2:
         FireworkColor.setRGB(15855725);
         break;
      case 3:
         FireworkColor.setRGB(5592814);
         break;
      case 4:
         FireworkColor.setRGB(15880683);
         break;
      case 5:
         FireworkColor.setRGB(2744407);
         break;
      case 6:
         FireworkColor.setRGB(16756491);
         break;
      case 7:
         FireworkColor.setRGB(16777215);
   }
   _global.MakeNoise("Fireworklight");
}
