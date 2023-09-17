onClipEvent(load){
   mommy = false;
   justBounced = 0;
   if(_name == "Biter")
   {
      mommy = true;
      stop();
   }
   this.addProperty("speed",this.getSpeed,this.setSpeed);
   this.addProperty("turnSpeed",this.getTurnSpeed,this.setTurnSpeed);
   this.addProperty("killedBy",this.getKilledBy,this.setKilledBy);
   this.addProperty("lunging",this.getLunging,null);
   killedBy = null;
   lunging = false;
   speed = 4;
   turnSpeed = 3;
   framesExisted = 0;
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
   delta_x = _X - gotoSpotX;
   delta_y = _Y - gotoSpotY;
   _rotation = (- Math.atan2(delta_x,delta_y)) / 0.017453292519943295;
   if(eval(_root.HeroPointer) == undefined)
   {
      if(_root.SpawnPoint.SearchArray(_global.Enemies,_name) == null)
      {
         _global.Enemies.push(_name);
      }
   }
}
