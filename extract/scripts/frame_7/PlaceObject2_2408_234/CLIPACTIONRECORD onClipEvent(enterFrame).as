onClipEvent(enterFrame){
   if(!_global.showFPS)
   {
      myText._visible = false;
   }
   if(myText.autoSize != "right")
   {
      myText.text = " ";
      myText.type = "dynamic";
      myText.autoSize = "right";
      myText._alpha = 75;
      myText.selectable = false;
      myFormat = new TextFormat();
      myFormat.font = "Arial";
      myFormat.Color = 0;
      myFormat.size = 18;
      myFormat.bold = true;
      myText.setTextFormat(myFormat);
      myText.setNewTextFormat(myFormat);
   }
   FramesThisSecond++;
   ThisSecond = getTimer();
   if(ThisSecond >= LastSecond * 1000 + 1000)
   {
      myText.text = String(FramesThisSecond);
      myText.Color = 16777215;
      FramesThisSecond = 0;
      LastSecond = Math.round(ThisSecond / 1000);
   }
   else
   {
      myText.Color = 0;
   }
}
