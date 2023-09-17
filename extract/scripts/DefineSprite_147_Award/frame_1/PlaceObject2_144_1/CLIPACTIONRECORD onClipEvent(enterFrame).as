onClipEvent(enterFrame){
   if(_parent.comm != null && initialized == false)
   {
      myMedal = "Medal " + _global.awardTrait(_parent.comm,"Medal");
      myRibbon = "Ribbon " + _global.awardTrait(_parent.comm,"Ribbon");
      myDecal = "Dc " + _parent.comm;
      _parent.attachMovie(myMedal,"Medal",3);
      _parent.attachMovie(myRibbon,"Ribbon",1);
      _parent.Ribbon._y = 10;
      _parent.attachMovie(myDecal,"Decal",5);
      initialized = true;
   }
}
