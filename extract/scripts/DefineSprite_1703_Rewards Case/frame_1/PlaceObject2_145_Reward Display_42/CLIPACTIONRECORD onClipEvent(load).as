onClipEvent(load){
   nowShowing = null;
   lettersUp = 0;
   rewardTextFormat = new TextFormat();
   rewardTextFormat.font = "Cooper Black";
   rewardTextFormat.color = 16777215;
   rewardTextFormat.size = 10;
   rewardTextFormat.align = "left";
   this.createTextField("rewardText",1,0,0,323,100);
   rewardText.embedFonts = true;
   rewardText.wordWrap = true;
   rewardText.selectable = false;
}
