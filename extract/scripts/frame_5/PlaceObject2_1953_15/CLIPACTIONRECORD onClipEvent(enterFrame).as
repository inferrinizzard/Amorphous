onClipEvent(enterFrame){
   framesRunning++;
   if(tipText != null)
   {
      infoText.text = tipText;
      showingCreds = false;
      infoText.setTextFormat(infoTextFormat);
      if(_alpha < 100)
      {
         _alpha = _alpha + 25;
      }
   }
   else if(showingCreds == false)
   {
      if(_alpha > 0)
      {
         _alpha = _alpha - 25;
      }
      else
      {
         infoText.text = "";
         if(int(framesRunning / 10) == framesRunning / 10)
         {
            showingCreds = true;
         }
      }
   }
   else
   {
      if(timeRemaining == 0 && infoText.text == "")
      {
         switch(currentCred)
         {
            case 1:
               infoText.text = "Designed, Coded, Drawn and Animated by\rCaleb Rhodes\rinnocuousGames@gmail.com";
               break;
            case 2:
               infoText.text = "Music excerpted from\rRevolution Void\r(check them out at Jamendo.com)";
               break;
            case 3:
               infoText.text = "Sound Effects by\rJanus Professional\r(and other misc. sounds)";
               break;
            case 4:
               infoText.text = "Play Tested by\rReid Pletcher\rZak Killian";
         }
         currentCred++;
         if(currentCred == 5)
         {
            currentCred = 1;
         }
         infoText.setTextFormat(credTextFormat);
         timeRemaining = 180;
      }
      else if(timeRemaining > 8)
      {
         if(_alpha < 100)
         {
            _alpha = _alpha + 25;
         }
      }
      else if(timeRemaining > 0)
      {
         if(_alpha > 0)
         {
            _alpha = _alpha - 25;
         }
      }
      else
      {
         infoText.text = "";
         showingCreds = false;
      }
      if(timeRemaining > 0)
      {
         timeRemaining--;
      }
   }
}
