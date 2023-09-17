onClipEvent(enterFrame){
   if(!_global.pause)
   {
      if(!dead)
      {
         while(!dead)
         {
            if(_global.HeroAction == "attacking")
            {
               if(_root.HeroSlashin._currentframe > 4 && _root.HeroSlashin._currentframe < 14)
               {
                  if(_root.HeroSwing.hittest(_parent._x,_parent._y,true))
                  {
                     _global.MakeNoise("Ricochet Noise");
                     TraceName = _parent._name + "Trace" + myEffects++;
                     _root.attachMovie("Bullet Trace",TraceName,_global.effectDepth++);
                     with(eval("_root." + TraceName))
                     {
                        _x = freePointX;
                        _y = freePointY;
                        _rotation = this._parent._rotation;
                        _yscale = travelled;
                     }
                     freePointX = _parent._x;
                     freePointY = _parent._y;
                     travelled = 0;
                     toMyX = hitTarget._x - _parent._x;
                     toMyY = hitTarget._y - _parent._y;
                     deflectDir = (- Math.atan2(toMyX,toMyY)) / 0.017453292519943295;
                     _parent._rotation = deflectDir;
                     mySparks = int(Math.random() * 6) + 6;
                     x = 1;
                     while(x <= mySparks)
                     {
                        sparkName = "bulletSpark" + myEffects++;
                        _root.attachMovie("Spark",sparkName,_global.capDepth++);
                        with(eval("_root." + sparkName))
                        {
                           _x = this._parent._x;
                           _y = this._parent._y;
                           _rotation = deflectDir + int(Math.random() * 20) - 10;
                        }
                        sparkColor = new Color(eval("_root." + sparkName));
                        sparkColor.setRGB(16777215);
                        x++;
                     }
                     _parent._rotation += int(Math.random() * 30) - 15;
                     deflectSteps = int(Math.random() * 15) + 5;
                     ricochet = true;
                  }
               }
            }
            if(_root.HeroPointer.hitTest(_parent._x,_parent._y,true))
            {
               TraceName = _parent._name + "Trace" + myEffects++;
               _root.attachMovie("Bullet Trace",TraceName,_global.effectDepth++);
               with(eval("_root." + TraceName))
               {
                  _x = freePointX;
                  _y = freePointY;
                  _rotation = this._parent._rotation;
                  _yscale = travelled;
               }
               _global.justHit = _parent;
               dead = true;
            }
            x = 0;
            while(x < _global.Enemies.length)
            {
               if(_global.Enemies[x] != _name)
               {
                  hitTarget = eval("_root." + _global.Enemies[x]);
                  targ = hitTarget._name.slice(0,4);
                  clawhit = null;
                  if(targ == "Quee")
                  {
                     qClaw = eval("_root." + hitTarget._name + "ClawL");
                     if(qClaw.hitTest(_parent._x,_parent._y,true))
                     {
                        clawhit = qClaw;
                     }
                     qClaw = eval("_root." + hitTarget._name + "ClawR");
                     if(qClaw.hitTest(_parent._x,_parent._y,true))
                     {
                        clawhit = qClaw;
                     }
                  }
                  if(targ == "Razo")
                  {
                     qClaw = eval("_root." + hitTarget._name + "FClawL");
                     if(qClaw.hitTest(_parent._x,_parent._y,true))
                     {
                        clawhit = qClaw;
                     }
                     qClaw = eval("_root." + hitTarget._name + "FClawR");
                     if(qClaw.hitTest(_parent._x,_parent._y,true))
                     {
                        clawhit = qClaw;
                     }
                     qClaw = eval("_root." + hitTarget._name + "DClawL");
                     if(qClaw.hitTest(_parent._x,_parent._y,true))
                     {
                        clawhit = qClaw;
                     }
                     qClaw = eval("_root." + hitTarget._name + "DClawR");
                     if(qClaw.hitTest(_parent._x,_parent._y,true))
                     {
                        clawhit = qClaw;
                     }
                     qClaw = eval("_root." + hitTarget._name + "Blade");
                     if(qClaw.hitTest(_parent._x,_parent._y,true))
                     {
                        clawhit = qClaw;
                     }
                  }
                  if(clawhit != null)
                  {
                     _global.MakeNoise("Ricochet Noise");
                     TraceName = _parent._name + "Trace" + myEffects++;
                     _root.attachMovie("Bullet Trace",TraceName,_global.effectDepth++);
                     with(eval("_root." + TraceName))
                     {
                        _x = freePointX;
                        _y = freePointY;
                        _rotation = this._parent._rotation;
                        _yscale = travelled;
                     }
                     freePointX = _parent._x;
                     freePointY = _parent._y;
                     travelled = 0;
                     toMyX = clawhit._x - _parent._x;
                     toMyY = clawhit._y - _parent._y;
                     deflectDir = (- Math.atan2(toMyX,toMyY)) / 0.017453292519943295;
                     _parent._rotation = deflectDir;
                     mySparks = int(Math.random() * 6) + 6;
                     x = 1;
                     while(x <= mySparks)
                     {
                        sparkName = "bulletSpark" + myEffects++;
                        _root.attachMovie("Spark",sparkName,_global.capDepth++);
                        with(eval("_root." + sparkName))
                        {
                           _x = this._parent._x;
                           _y = this._parent._y;
                           _rotation = deflectDir + int(Math.random() * 20) - 10;
                        }
                        sparkColor = new Color(eval("_root." + sparkName));
                        sparkColor.setRGB(16777215);
                        x++;
                     }
                     _parent._rotation += int(Math.random() * 30) - 15;
                     deflectSteps = int(Math.random() * 15) + 5;
                     ricochet = true;
                  }
                  if(hitTarget.hitTest(_parent._x,_parent._y,true))
                  {
                     if(targ == "Grin" || targ == "Horr" && hitTarget.action != "collect" || hitTarget.spines || targ == "Gray" && hitTarget.action == "gaurd")
                     {
                        _global.MakeNoise("Ricochet Noise");
                        if(targ == "Horr" || targ == "Shar")
                        {
                           hitTarget._rotation = _parent._rotation;
                        }
                        TraceName = _parent._name + "Trace" + myEffects++;
                        _root.attachMovie("Bullet Trace",TraceName,_global.effectDepth++);
                        with(eval("_root." + TraceName))
                        {
                           _x = freePointX;
                           _y = freePointY;
                           _rotation = this._parent._rotation;
                           _yscale = travelled;
                        }
                        freePointX = _parent._x;
                        freePointY = _parent._y;
                        travelled = 0;
                        toMyX = hitTarget._x - _parent._x;
                        toMyY = hitTarget._y - _parent._y;
                        deflectDir = (- Math.atan2(toMyX,toMyY)) / 0.017453292519943295;
                        _parent._rotation = deflectDir;
                        mySparks = int(Math.random() * 6) + 6;
                        x = 1;
                        while(x <= mySparks)
                        {
                           sparkName = "bulletSpark" + myEffects++;
                           _root.attachMovie("Spark",sparkName,_global.capDepth++);
                           with(eval("_root." + sparkName))
                           {
                              _x = this._parent._x;
                              _y = this._parent._y;
                              _rotation = deflectDir + int(Math.random() * 20) - 10;
                           }
                           sparkColor = new Color(eval("_root." + sparkName));
                           sparkColor.setRGB(16777215);
                           x++;
                        }
                        _parent._rotation += int(Math.random() * 30) - 15;
                        deflectSteps = int(Math.random() * 15) + 5;
                        ricochet = true;
                        _root.myBoxGun.ineffective = true;
                     }
                     else
                     {
                        TraceName = _parent._name + "Trace" + myEffects++;
                        _root.attachMovie("Bullet Trace",TraceName,_global.effectDepth++);
                        with(eval("_root." + TraceName))
                        {
                           _x = freePointX;
                           _y = freePointY;
                           _rotation = this._parent._rotation;
                           _yscale = travelled;
                        }
                        _parent.exploded = true;
                        hitTarget.killedBy = _parent;
                        dead = true;
                     }
                  }
               }
               x++;
            }
            x = 0;
            while(x < _global.Hazards.length)
            {
               targetHazard = eval("_root." + _global.Hazards[x]);
               if(targetHazard.hitTest(_parent._x,_parent._y,true))
               {
                  if(targetHazard._name.slice(0,5) == "Razor")
                  {
                     _global.MakeNoise("Ricochet Noise");
                     TraceName = _parent._name + "Trace" + myEffects++;
                     _root.attachMovie("Bullet Trace",TraceName,_global.effectDepth++);
                     with(eval("_root." + TraceName))
                     {
                        _x = freePointX;
                        _y = freePointY;
                        _rotation = this._parent._rotation;
                        _yscale = travelled;
                     }
                     freePointX = _parent._x;
                     freePointY = _parent._y;
                     travelled = 0;
                     toMyX = targetHazard._x - _parent._x;
                     toMyY = targetHazard._y - _parent._y;
                     deflectDir = (- Math.atan2(toMyX,toMyY)) / 0.017453292519943295;
                     _parent._rotation = deflectDir;
                     mySparks = int(Math.random() * 6) + 6;
                     x = 1;
                     while(x <= mySparks)
                     {
                        sparkName = "bulletSpark" + myEffects++;
                        _root.attachMovie("Spark",sparkName,_global.capDepth++);
                        with(eval("_root." + sparkName))
                        {
                           _x = this._parent._x;
                           _y = this._parent._y;
                           _rotation = deflectDir + int(Math.random() * 20) - 10;
                        }
                        sparkColor = new Color(eval("_root." + sparkName));
                        sparkColor.setRGB(16777215);
                        x++;
                     }
                     _parent._rotation += int(Math.random() * 30) - 15;
                     deflectSteps = int(Math.random() * 15) + 5;
                     ricochet = true;
                     targetHazard.Health--;
                  }
               }
               x++;
            }
            if(!dead)
            {
               _parent._y -= 10 * Math.cos(_parent._rotation * 0.017453292519943295);
               _parent._x += 10 * Math.sin(_parent._rotation * 0.017453292519943295);
               travelled += 10;
               if(_parent._y <= -6 || _parent._x <= -6 || _parent._y >= 406 || _parent._x >= 556)
               {
                  TraceName = _parent._name + "Trace" + myEffects++;
                  _root.attachMovie("Bullet Trace",TraceName,_global.effectDepth++);
                  with(eval("_root." + TraceName))
                  {
                     _x = freePointX;
                     _y = freePointY;
                     _rotation = this._parent._rotation;
                     _yscale = travelled;
                  }
                  dead = true;
               }
               if(ricochet)
               {
                  deflectSteps--;
                  if(deflectSteps <= 0)
                  {
                     TraceName = _parent._name + "Trace" + myEffects++;
                     _root.attachMovie("Bullet Trace",TraceName,_global.effectDepth++);
                     with(eval("_root." + TraceName))
                     {
                        _x = freePointX;
                        _y = freePointY;
                        _rotation = this._parent._rotation;
                        _yscale = travelled;
                     }
                     x = 1;
                     while(x < 3)
                     {
                        DirtName = "BulletDirt" + myEffects++;
                        duplicateMovieClip(_root.GroundDirt,DirtName,16384 + _global.effectDepth++);
                        with(eval("_root." + DirtName))
                        {
                           _x = this._parent._x;
                           _y = this._parent._y;
                           _rotation = int(Math.random() * 360) - 180;
                        }
                        x++;
                     }
                     dead = true;
                  }
               }
            }
         }
      }
      else
      {
         if(deflectSteps > 5)
         {
            deflectSteps = 5;
         }
         if(deflectSteps > -2)
         {
            deflectSteps--;
         }
         else
         {
            _parent.removeMovieClip();
         }
      }
   }
}
