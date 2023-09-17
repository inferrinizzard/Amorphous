onClipEvent(unload){
   _global.Enemies.splice(_root.SpawnPoint.SearchArray(_global.Enemies,_parent._name),1);
}
