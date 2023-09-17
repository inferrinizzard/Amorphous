onClipEvent(load){
   mommy = false;
   if(_name == "OilMark")
   {
      mommy = true;
   }
   else
   {
      _visible = false;
      framesSitting = 0;
      this.addProperty("onFire",this.getOnFire,this.setOnFire);
      onFire = false;
      daddySplat = eval("_root." + _name.slice(0,_name.length - 7));
      daddySplat.marker = this;
      _rotation = daddySplat._rotation;
      _global.Hazards.push(_name);
   }
}
