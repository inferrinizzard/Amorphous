onClipEvent(load){
   function SearchArray(ArraytoSearch, ItemtoFind)
   {
      x = 0;
      while(x < ArraytoSearch.length)
      {
         if(ArraytoSearch[x] == ItemtoFind)
         {
            return x;
         }
         x++;
      }
      return null;
   }
   this.addProperty("ChildCounter",this.getChildCounter,this.setChildCounter);
   noBoss = false;
   noBossTime = 0;
   musicSwitches = 0;
   ChildCounter = 0;
   _global.framesElapsed = 0;
   _global.QueenRevive = false;
   _global.Enemies = new Array();
   _global.Hazards = new Array();
   _global.activeEnemies = new Array();
   _global.backgroundDepth = 50;
   _global.markDepth = 1000;
   _global.effectDepth = 2000;
   _global.baddieDepth = 3000;
   _global.heroDepth = 4000;
   _global.capDepth = 5000;
   if(_global.floorMode == "Random")
   {
      _root.attachMovie("Backdrop" + (int(Math.random() * 8) + 2),"Backdrop",_global.backgroundDepth++);
   }
   else
   {
      _root.attachMovie("Backdrop1","Backdrop",_global.backgroundDepth++);
   }
   with(_root.Backdrop)
   {
      _x = 275;
      _y = 200;
   }
   if(_global.Rematch)
   {
      _global.activeEnemies.push("RazorQueen");
   }
}
