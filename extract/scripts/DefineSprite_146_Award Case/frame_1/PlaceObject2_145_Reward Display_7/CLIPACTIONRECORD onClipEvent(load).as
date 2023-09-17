onClipEvent(load){
   awardCTextFormat = new TextFormat();
   awardCTextFormat.font = "Cooper Black";
   awardCTextFormat.color = 0;
   awardCTextFormat.size = 14;
   awardCTextFormat.align = "right";
   this.createTextField("awardCount",1,0,0,30,10);
   awardCount.embedFonts = true;
   awardCount.wordWrap = false;
   awardCount.selectable = false;
   awardCount.text = String(_global.Awards.length);
   awardCount.setTextFormat(AwardCTextFormat);
}
