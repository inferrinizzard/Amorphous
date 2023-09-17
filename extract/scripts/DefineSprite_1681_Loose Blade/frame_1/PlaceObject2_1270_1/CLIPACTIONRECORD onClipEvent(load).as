onClipEvent(load){
   Skyward = false;
   buried = false;
   framesStuck = 0;
   speed = int(Math.random() * 5) + 12;
   _parent.stop();
   moveDirection = _parent._rotation;
   if(int(Math.random() * 2) == 0)
   {
      Skyward = true;
   }
   if(Skyward)
   {
      _parent.swapDepths(_global.capDepth++);
   }
}
