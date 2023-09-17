onClipEvent(load){
   formed = false;
   healthWas = 100;
   myEffects = 0;
   _parent.addProperty("killedBy",this.getKilledBy,this.setKilledBy);
   _parent.addProperty("wall",this.getWall,this.setWall);
   _parent.addProperty("Health",this.getHealth,this.setHealth);
   _parent.killedBy = null;
   _parent.wall = true;
   _parent.Health = 100;
   ContactsX = new Array(6);
   ContactsY = new Array(6);
   ContactsY[0] = _parent._y - 20 * Math.cos(_parent._rotation * 0.017453292519943295);
   ContactsX[0] = _parent._x + 20 * Math.sin(_parent._rotation * 0.017453292519943295);
   adjRot = _parent._rotation - 180;
   if(adjRot < -180)
   {
      adjRot += 360;
   }
   ContactsY[1] = _parent._y - 20 * Math.cos(adjRot * 0.017453292519943295);
   ContactsX[1] = _parent._x + 20 * Math.sin(adjRot * 0.017453292519943295);
   adjRot = _parent._rotation + 75;
   if(adjRot > 180)
   {
      adjRot -= 360;
   }
   ContactsY[2] = _parent._y - 75 * Math.cos(adjRot * 0.017453292519943295);
   ContactsX[2] = _parent._x + 75 * Math.sin(adjRot * 0.017453292519943295);
   adjRot = _parent._rotation - 75;
   if(adjRot < -180)
   {
      adjRot += 360;
   }
   ContactsY[3] = _parent._y - 75 * Math.cos(adjRot * 0.017453292519943295);
   ContactsX[3] = _parent._x + 75 * Math.sin(adjRot * 0.017453292519943295);
   adjRot = _parent._rotation + 105;
   if(adjRot > 180)
   {
      adjRot -= 360;
   }
   ContactsY[4] = _parent._y - 75 * Math.cos(adjRot * 0.017453292519943295);
   ContactsX[4] = _parent._x + 75 * Math.sin(adjRot * 0.017453292519943295);
   adjRot = _parent._rotation - 105;
   if(adjRot < -180)
   {
      adjRot += 360;
   }
   ContactsY[5] = _parent._y - 75 * Math.cos(adjRot * 0.017453292519943295);
   ContactsX[5] = _parent._x + 75 * Math.sin(adjRot * 0.017453292519943295);
   _global.MakeNoise("Wall Form");
}
