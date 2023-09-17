onClipEvent(load){
   ricochet = false;
   deflectSteps = 0;
   dead = false;
   myEffects = 0;
   _parent.addProperty("exploded",this.getExploded,this.setExploded);
   _parent.exploded = false;
   _parent.addProperty("slug",this.getSlug,this.setSlug);
   _parent.slug = true;
   _parent.addProperty("tool",this.getTool,this.setTool);
   _parent.tool = true;
   freePointX = _parent._x;
   freePointY = _parent._y;
   travelled = 0;
}
