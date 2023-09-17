onClipEvent(load){
   mommy = false;
   if(_name == "AcidMark")
   {
      mommy = true;
   }
   else
   {
      _visible = false;
      framesSitting = 0;
      daddySplat = eval("_root." + _name.slice(0,_name.length - 8));
      daddySplat.marker = this;
      _rotation = daddySplat._rotation;
      _global.Hazards.push(_name);
   }
}
