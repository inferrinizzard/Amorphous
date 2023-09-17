onClipEvent(load){
   function CheckColors()
   {
      x = 0;
      while(x <= colorsOnKill.length - 1)
      {
         Gloop = colorsOnKill[x].slice(0,4);
         if(_global.SearchArray(uniqueColors,Gloop) == null)
         {
            uniqueColors.push(Gloop);
         }
         x++;
      }
      if(uniqueColors.length >= 4)
      {
         _global.GainAward("4 Color Splats");
      }
      colorsOnKill = new Array();
      uniqueColors = new Array();
   }
   _visible = false;
   this.addProperty("firesStomped",this.getFiresStomped,this.setFiresStomped);
   this.addProperty("colorsOnKill",this.getColorsOnKill,this.setColorsOnKill);
   this.addProperty("perfectRun",this.getPerfectRun,this.setPerfectRun);
   perfectRun = true;
   firesStomped = 0;
   colorsOnKill = new Array();
   uniqueColors = new Array();
   if(_global.ABind != null)
   {
      _root.attachMovie("Reward Tab","ATab",6401);
      with(_root.ATab)
      {
         _x = 25;
         _y = 20;
      }
   }
   if(_global.SBind != null)
   {
      _root.attachMovie("Reward Tab","STab",6402);
      with(_root.STab)
      {
         _x = 70;
         _y = 20;
      }
   }
   if(_global.DBind != null)
   {
      _root.attachMovie("Reward Tab","DTab",6403);
      with(_root.DTab)
      {
         _x = 115;
         _y = 20;
      }
   }
}
