onClipEvent(enterFrame){
   if(_parent.displayShow == null)
   {
      if(_global.RewardsUnlocked.length > 0)
      {
         if(_global.Awards.length > 54)
         {
            _parent.displayShow = "Clicking on an unlocked Reward will assign it the next open Equip slot.  Clicking on an Equipped Reward will free that slot.  If all slots are full, the A slot will be reassigned to the Reward you click.  You may also mouse over the Reward you wish to assign and press the key you wish to assign it to.";
         }
         else
         {
            _parent.displayShow = "Click on an unlocked Reward to equip it.  Clicking on a Reward you already have equipped will unequip it.  Equipped Rewards will be brought with you into battle - each one is unique and offers different advantages.";
         }
      }
      else
      {
         _parent.displayShow = "By gaining Awards in Single Nest or Bounty Run mode, you will earn Reward Keys.  Use these Keys in the Rewards Case to unlock new tools and abilities to give you the edge in combat.";
      }
   }
   if(nowShowing != _parent.displayShow)
   {
      nowShowing = _parent.displayShow;
      lettersUp = 0;
   }
   if(lettersUp < nowShowing.length - 2)
   {
      lettersUp += 2;
      rewardText.text = nowShowing.slice(0,lettersUp);
      rewardText.setTextFormat(rewardTextFormat);
      rewardText._width = 323;
   }
   else if(lettersUp != nowShowing.length)
   {
      lettersUp = nowShowing.length;
      rewardText.text = nowShowing;
      rewardText.setTextFormat(rewardTextFormat);
      rewardText._width = 323;
   }
}
