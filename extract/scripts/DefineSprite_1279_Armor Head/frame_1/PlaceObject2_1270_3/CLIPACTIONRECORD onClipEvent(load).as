onClipEvent(load){
   if(_global.RewardTab("Armor") != null)
   {
      armorTab = eval(_global.RewardTab("Armor"));
      if(armorTab.charge != 300)
      {
         _parent._visible = false;
      }
      else if(_global.RewardTab("Hazard Suit") != null)
      {
         suitTab = eval(_global.RewardTab("Hazard Suit"));
         if(suitTab.charge > 1)
         {
            _parent.gotoAndStop(2);
            _parent._visible = true;
         }
         else
         {
            _parent._visible = true;
            _parent.gotoAndStop(1);
         }
      }
      else
      {
         _parent._visible = true;
         _parent.gotoAndStop(1);
      }
   }
   else
   {
      _parent._visible = false;
   }
}
