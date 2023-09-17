onClipEvent(load){
   _global.InspectingAward = null;
   AwardsListing = new Array("First Gloople","First Stickie","First Biter","First Meltie","First Clutter","First Inkie","First Oozle","First Fuzzle","First Sharp","First Frostie","First Torchie","First Amalgam","First Gray","First Grinder","First Horror","First Void Eater","First Queen","First Razor Queen","Splat a Glom","x2 Combo","x3 Combo","x4 Combo","x5 Combo","x6 Combo","x7 Combo","x8 Combo","Practice 10 min","20pt Swing","50pt Swing","75pt Swing","100pt Swing","150pt Swing","200pt Swing","300pt Swing","Clear Short Nest","Clear Normal Nest","Clear Long Nest","10 Deaths","25 Deaths","50 Deaths","100 Deaths","Died 5 Ways","Died 10 Ways","Died 15 Ways","5 min Playtime","10 min Playtime","20 min Playtime","30 min Playtime","45 min Playtime","60 min Playtime","90 min Playtime","Score 100","Score 200","Score 350","Score 500","Score 750","Score 1000","Score 1500","Score 2000","Score 2500","Score 3000","Survive 1 min","Survive 2 min","Survive 3 min","Survive 4 min","Survive 5 min","Survive 7 min","Survive 10 min","Kill 1000 Glooples","Kill 100 Stickies","Kill 70 Biters","Kill 50 Melties","Kill 50 Clutters","Kill 30 Inkies","Kill 15 Oozles","Kill 20 Fuzzles","Kill 10 Sharps","Kill 6 Frosties","Kill 6 Torchies","Kill 5 Grays","Kill 15 Amalgams","Kill 4 Grinders","Kill 3 Horrors","Kill 3 Void Eaters","Kill 3 Queens","Kill 2 Razor Queens","2 minute Pause","Next Song 5 Times","Jackpot","Ambush","30 Secs Without Swinging","Push Clutter","Blind Kill","Fling Sharp","Sharp as Weapon","Shave Fuzzle 3 Times","Smother 10 Fires","5 Queen Misses","10 Straight Combos","4 Color Splats","Perfect Run","Clutter at Finish","Survive Blackout","Survive Ice","Survive Explosion","Survive Fire","30 Bumps","Bogged by Clutters","Stuck 1 Minute","50 Sparks");
   x = 0;
   while(x < AwardsListing.length)
   {
      ShadowName = "Sd " + AwardsListing[x];
      WorkingShadow = null;
      _parent.attachMovie("Award Shadow",ShadowName,x + 202);
      WorkingShadow = eval("_parent." + ShadowName);
      row = int(x / 17);
      with(WorkingShadow)
      {
         _xscale = 40;
         _yscale = 40;
         _x = 15 + (x - row * 17) * 30;
         _y = 30 + row * 50;
         if(row == 6)
         {
            _x += 135;
         }
      }
      x++;
   }
   x = 0;
   while(x < _global.Awards.length)
   {
      if(_global.SearchArray(AwardsListing,_global.Awards[x]) == null)
      {
         _global.Awards.splice(x,1);
      }
      x++;
   }
}
