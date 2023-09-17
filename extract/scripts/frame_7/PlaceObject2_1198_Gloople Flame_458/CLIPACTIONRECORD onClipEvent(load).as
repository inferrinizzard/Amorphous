onClipEvent(load){
   if(_name == "Flames")
   {
      stop();
   }
   else
   {
      framesExisted = 0;
      TorchieFlame = false;
      hostObject = eval("_root." + _name.slice(0,_name.length - 5));
      if(hostObject._name.slice(0,7) == "Torchie")
      {
         TorchieFlame = true;
      }
      _global.MakeNoise("Lit");
   }
}
