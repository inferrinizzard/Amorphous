onClipEvent(load){
   myReward = _parent._name.slice(0,-6);
   onMe = false;
   tipFocus = false;
   _parent.attachMovie("Reward Icon " + myReward,"myIcon",3);
   _parent.myIcon._xscale = 130;
   _parent.myIcon._yscale = 130;
   if(_global.SearchArray(_global.RewardsUnlocked,myReward) != null)
   {
      _parent.myIcon.gotoAndStop(1);
      if(_global.ABind == myReward)
      {
         _parent._parent.attachMovie("Key Bound Reticle","ABindRing",1050);
         with(_parent._parent.ABindRing)
         {
            _x = this._parent._x;
            _y = this._parent._y;
         }
      }
      else if(_global.SBind == myReward)
      {
         _parent._parent.attachMovie("Key Bound Reticle","SBindRing",1051);
         with(_parent._parent.SBindRing)
         {
            _x = this._parent._x;
            _y = this._parent._y;
         }
      }
      else if(_global.DBind == myReward)
      {
         _parent._parent.attachMovie("Key Bound Reticle","DBindRing",1052);
         with(_parent._parent.DBindRing)
         {
            _x = this._parent._x;
            _y = this._parent._y;
         }
      }
   }
   else
   {
      _parent.myIcon.gotoAndStop(3);
      lockName = myReward + "lock";
      if(myReward == "Glaive")
      {
         _parent._parent.attachMovie("Reward Lock Razor",lockName,_parent._parent.lockDepths++);
      }
      else
      {
         _parent._parent.attachMovie("Reward Lock",lockName,_parent._parent.lockDepths++);
      }
      myLock = eval("_parent._parent." + lockName);
      with(myLock)
      {
         _y = this._parent._y - 12;
         _x = this._parent._x;
      }
   }
   switch(myReward)
   {
      case "Sprint":
         myInfoText = " SPRINT - Through intensive physical training and stamina exercises, this ability will allow for short bursts of much faster movement.  While in use, Sprint will allow you to manuever quickly and even offeset some hazards which may normally impede travel.  Use caution, however, as Sprinting is exhausting and you must find opportunities to rest and regain your endurance.";
         break;
      case "Grenade":
         myInfoText = " GRENADE - A high-explosive concussive grenade which creates a powerful pressure wave upon detonation, causing severe trauma to any target within it\'s damage radius.  Note that while extremely potent, these types of concussive weapons carry a high risk of unforunate accident: be sure to stay clear of the blast and give it a good throw.";
         break;
      case "Choker":
         myInfoText = " INHIBITOR - A more high-tech product of the anti-gloople R&D department, the Gloople Nest Coordination Inhibitor, or Choker as it is sometimes referred, sends out confined-band directional electrostatic pulses.  These pulses confuse the communicative abilities of the Gloople nest on the whole, and prevents them from effectively coordinating an attack.  In short, this device reduces the amount of Glooples which are able to attack for a brief time.";
         break;
      case "Teleport":
         myInfoText = " TELEPORTER - Cutting edge technology, the Teleporter is a two-part system.  The primary unit is a deployable recieving pad which, once placed on the ground, will build up and hold a charge.  When ready, the user activates a small homing device on his person, and is instantaneously translocated back to the pad\'s location.  Side-effects such as nausea, nosebleeds and temporary amnesia are common.";
         break;
      case "Lure":
         myInfoText = " LURE - Experimentation into the biology of the Gloople and behavior of the nest has lead the R&D department to develop this small gas-grenade.  Once thrown, it will begin to emit a powerful enzymatic pheremone which will overpower any other stimuli the nest may be responding to.  Any Glooples in the area will turn their hostilities toward this device.  However, some more advanced Glooples may not be fooled, and the lure\'s chemical payload is limited.";
         break;
      case "Mason":
         myInfoText = " INSTANT WALL - Also called the Mason Bomb, the Instant Wall is a high powered explosive packed with nitrogen-reactive liquid state epoxy polymers.  The explosive device disperses these resins with a shaped charge, which harden very rapidly when exposed to open air.  The resulting barricade is very solid and proves an effective barrier against nearly any kind of assault.";
         break;
      case "BoxGun":
         myInfoText = " BOX GUN - The S.C.A.E.R (Self-Contained Autonomous Emplacement Rifle) is a man-portable, deployable support sentry programmed to track and destroy Glooples.  Once placed, the SCAER will entrench itself and begin rendering suppressive fire on any targets in it\'s field of view.  Typically the 50 caliber rounds fired by this turret are enough to pacify any target, but beware exceptionally hard targets which may cause ricochets.";
         break;
      case "Spike":
         myInfoText = " REPULSOR - Utilizing principles of pressure wave density and psuedomagnetics, the Repulsor Stake is able to isolate the specific buoyancy of Gloople Plasm in air and generate a field of radiating compression waves at this specific frequency.  While operating, Glooples will be expelled from the center of the effect, providing a bubble of safety for the user, who will remain unaffected.";
         break;
      case "Drone":
         myInfoText = " SAW DRONE - Affectionately referred to as the Chopper, the Saw Drone is an airborne robotic attack unit compact enough to be man-portable.  Once activated and thrown, the Chopper snaps open and begins flying under it\'s own power.  A Saw Drone is able to acquire targets and differentiate friendlies from hostiles mid-combat.  However, because of it\'s extremely deadly nature, a wise user keeps as clear as possible.";
         break;
      case "Armor":
         myInfoText = " REACTIVE ARMOR - A combination of shaped microcharges and fractal-flechette ceramic plates form the Reactive Armor\'s fundamental structure.  The only model of ablative armor designed to be infantry-borne, this protective skin responds to deadly impacts with a powerful explosion and a shower of ceramic shrapnel, while creating a captured pocket of air within, leaving the wearer completely unscathed.  Obviously, this only works once.";
         break;
      case "Hazard Suit":
         myInfoText = " HAZARD SUIT - Second cousin to both the SCUBA suit and stealth suit, the Hazard Suit uses a contained power pack to operate a powerful lattice of disruptive current-yielding microfibre woven into a thick protective body suit.  While charged, the suit responds to potentially dangerous conditions by a combination of electromagnetic current, insulative coating and atmospheric filtration.  The last word in material hazard evasion.";
         break;
      case "Glaive":
         myInfoText = " RAZOR GLAIVE - With specimens of the rare Razor Queen to work with, this piece of biografted hardware was the next logical step in anti-gloople warfare.  Sculped directly from the claw bones of the great Razor Queen, this blade is incredibly durable and razor sharp.  The only major flaw in this design is it\'s overwhelming heft.  Take caution, while it is remarkably destructive, this sword can be a considerable burden.";
   }
   myBindingBox = _parent.getBounds(_root);
}
