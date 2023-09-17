onClipEvent(load){
   throughOnce = false;
   _alpha = 0;
   if(int(Math.random() * 2) == 0)
   {
      attachMovie("innocuous Logo1","myLogo",1);
   }
   else
   {
      attachMovie("innocuous Logo2","myLogo",1);
   }
   myLogo.stop();
}
