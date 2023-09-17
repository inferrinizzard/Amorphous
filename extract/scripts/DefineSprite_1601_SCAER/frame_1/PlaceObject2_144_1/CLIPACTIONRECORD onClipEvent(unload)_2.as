onClipEvent(unload){
   if(!_parent.exploded)
   {
      _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_parent._name),1);
   }
}
