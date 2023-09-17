onClipEvent(load){
   if(_global.RewardTab("Armor") != null)
   {
      armorTab = eval(_global.RewardTab("Armor"));
      if(armorTab.charge != 300)
      {
         _parent._visible = false;
      }
   }
   else
   {
      _parent._visible = false;
   }
}
