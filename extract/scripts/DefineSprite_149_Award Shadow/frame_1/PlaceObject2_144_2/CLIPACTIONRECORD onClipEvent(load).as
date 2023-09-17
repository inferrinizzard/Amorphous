onClipEvent(load){
   myAward = null;
   Acquired = false;
   onMe = 0;
   myBindingBox = null;
   AwardIsNew = false;
   myComm = _parent._name.slice(3);
   homeDepth = _parent.getDepth();
   if(_global.SearchArray(_global.Awards,myComm) != null)
   {
      Acquired = true;
   }
   myBindingBox = _parent.getBounds(_root);
}
