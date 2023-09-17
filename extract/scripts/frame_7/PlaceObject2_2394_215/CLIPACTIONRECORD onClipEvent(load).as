onClipEvent(load){
   if(_name == "Frozen")
   {
      stop();
   }
   else
   {
      stop();
      framesExisted = 0;
      hostObject = eval("_root." + _name.slice(0,_name.length - 6));
      hostName = hostObject._name;
      numDigs = 0;
      brokeTo = null;
      gimpedHorror = false;
      if(hostName.slice(hostName.length - 4) != Number(hostName.slice(hostName.length - 4)))
      {
         if(hostName.slice(hostName.length - 3) != Number(hostName.slice(hostName.length - 3)))
         {
            if(hostName.slice(hostName.length - 2) != Number(hostName.slice(hostName.length - 2)))
            {
               numDigs = 1;
            }
            else
            {
               numDigs = 2;
            }
         }
         else
         {
            numDigs = 3;
         }
      }
      else
      {
         numDigs = 4;
      }
      hostArch = "_root." + hostName.slice(0,hostName.length - numDigs);
      _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,hostName),1);
      removeMovieClip(hostObject);
      _global.Enemies.push(_name);
      if(hostArch == "_root.Meltie")
      {
         framesExisted = 60;
      }
   }
}
