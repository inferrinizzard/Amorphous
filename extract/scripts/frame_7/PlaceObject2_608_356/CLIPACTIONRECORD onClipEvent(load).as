onClipEvent(load){
   mommy = false;
   justBounced = 0;
   if(_name == "Gloople")
   {
      mommy = true;
      stop();
   }
   this.addProperty("speed",this.getSpeed,this.setSpeed);
   this.addProperty("turnSpeed",this.getTurnSpeed,this.setTurnSpeed);
   this.addProperty("killedBy",this.getKilledBy,this.setKilledBy);
   killedBy = null;
   speed = 3;
   switch(_X)
   {
      case - 5:
         if(_Y < 200)
         {
            if(int(Math.random() * 3) + 1 == 1)
            {
               gotoSpotX = int(Math.random() * 550) + 1;
               gotoSpotY = 405;
            }
            else
            {
               gotoSpotX = 555;
               gotoSpotY = int(Math.random() * 400) + 1;
            }
         }
         else if(int(Math.random() * 3) + 1 == 1)
         {
            gotoSpotX = int(Math.random() * 550) + 1;
            gotoSpotY = - 5;
         }
         else
         {
            gotoSpotX = 555;
            gotoSpotY = int(Math.random() * 400) + 1;
         }
         break;
      case 555:
         if(_Y < 200)
         {
            if(int(Math.random() * 3) + 1 == 1)
            {
               gotoSpotX = int(Math.random() * 550) + 1;
               gotoSpotY = 405;
            }
            else
            {
               gotoSpotX = - 5;
               gotoSpotY = int(Math.random() * 400) + 1;
            }
         }
         else if(int(Math.random() * 3) + 1 == 1)
         {
            gotoSpotX = int(Math.random() * 550) + 1;
            gotoSpotY = - 5;
         }
         else
         {
            gotoSpotX = - 5;
            gotoSpotY = int(Math.random() * 400) + 1;
         }
         break;
      default:
         if(_Y == -5)
         {
            if(_X < 275)
            {
               if(int(Math.random() * 3) + 1 == 1)
               {
                  gotoSpotX = 555;
                  gotoSpotY = int(Math.random() * 400) + 1;
               }
               else
               {
                  gotoSpotX = int(Math.random() * 550) + 1;
                  gotoSpotY = 405;
               }
            }
            else if(int(Math.random() * 3) + 1 == 1)
            {
               gotoSpotX = - 5;
               gotoSpotY = int(Math.random() * 400) + 1;
            }
            else
            {
               gotoSpotX = int(Math.random() * 500) + 1;
               gotoSpotY = 405;
            }
         }
         else if(_X < 275)
         {
            if(int(Math.random() * 3) + 1 == 1)
            {
               gotoSpotX = 555;
               gotoSpotY = int(Math.random() * 400) + 1;
            }
            else
            {
               gotoSpotX = int(Math.random() * 550) + 1;
               gotoSpotY = - 5;
            }
         }
         else if(int(Math.random() * 3) + 1 == 1)
         {
            gotoSpotX = - 5;
            gotoSpotY = int(Math.random() * 400) + 1;
         }
         else
         {
            gotoSpotX = int(Math.random() * 500) + 1;
            gotoSpotY = - 5;
         }
   }
}
