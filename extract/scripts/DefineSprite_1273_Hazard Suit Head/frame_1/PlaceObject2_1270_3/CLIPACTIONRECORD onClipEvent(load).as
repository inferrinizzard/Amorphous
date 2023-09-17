onClipEvent(load){
   if(_global.RewardTab("Hazard Suit") != null)
   {
      suitTab = eval(_global.RewardTab("Hazard Suit"));
      if(suitTab.charge == 1)
      {
         _parent._visible = false;
      }
      else
      {
         _parent._visible = true;
      }
   }
   else
   {
      _parent._visible = false;
   }
   if(_global.RewardTab("Armor") != null)
   {
      armorTab = eval(_global.RewardTab("Armor"));
      if(armorTab.charge == 300)
      {
         _parent._visible = false;
      }
   }
   if(_root._currentframe != 7)
   {
      _parent._visible = false;
   }
}
