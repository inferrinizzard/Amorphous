onClipEvent(enterFrame){
   if(myText == null)
   {
      switch(_global.selectedGloople)
      {
         case "Gloople":
            myText = "  The Gloople, or Green Gloople, is by far the most common and simplest type of Gloople.  Normally the first encountered, and the first sign of a Gloople infestation.  Glooples are composed of a thick, celluloid membrane which contains a highly complex gelatinous mass of enzymes, proteins, synaptic fibers and numerous other fluid components.  Glooples are hydraulic organisms and rely on internal pressurization to maintain living functions, although unlike most organisms they are alcohol rather than water-based.\r\r  The Green Gloople is a worker of sorts and is ";
            myText += "normally found absorbing either small bits of food or burrowing out the chambers or tunnels of the nest (again by absorbing small bits of impediment and carrying them away).  The normal Gloople has very little intelligence, able only to follow the simplest directives of the nest.  They are of generally very little threat, and posses no means of inflicting harm on a human as the membranes which surround them are only able to absorb small objects.  However, a Gloople is seldom if ever alone, and upon encountering one be wary of other, more hazardous varieties which ";
            myText += "are sure to be nearby.\r\r  As very simple but massive organisms, Glooples are capable of a kind of reverse mitosis - combining by mutual absorption to create a larger and more complex organism.";
            break;
         case "Stickie":
            myText = "  Stickies possess much of the same composition as Green Glooples, and very little additional behavioral functionality.  They possess a much thinner outer membrane and a thick, viscous binding agent in their organic plasm.  When a Stickie comes in contact with anything solid, they burst and release this adhesive goo.  This acts as both a defensive measure to obstruct threats to the nest, and as a tool to aid more deadly Glooples in catching prey.\r\r  Stickie goo is a very effective substance at restricting movement and also has insulative properties.  The goo, ";
            myText += "however, like most Gloople composition, breaks down after only a short time due to open-air exposure and friction, and is in no way permanent.  Behaviorally, the Nest simply directs the closest Stickie toward whatever it wishes to gum up - the Stickies have very little ability to make fine adjustments to their course of travel and lack any sort of observational skills.";
            break;
         case "Biter":
            myText = "  Regardless of how deep one gets into a Gloople nest, one of the most dangerous Glooples will always be the Biter.  Neither rare nor passive in any sense, the Biter is the primary hunting mechanism of a Gloople nest.\r\r  Very similar to Green Glooples in organic composition, the Biters are equipped with much more complex and well developed synaptic fiber clusters and the ability to grow shaped, keratinous protrusions connected to the central mass by sinuous tensile strands.  The \"teeth\" calcify within the body of the Biter over only a few hours, so those that are";
            myText += " broken away are quickly replaced.  Biters have thicker and more durable outer membranes suited to anchoring it\'s teeth while biting.  Because of this tougher membrane, Biters are unable to absorb small matter into their bodies, but their greater musculature does allow them to make short distance lunges in an attempt to snag or pin down prey.\r\r  Due to their physiology and role in the nest, Biters are very aggressive and very persistent at pursuing prey or threats to the nest.  The vast majority of human injuries are due to these Glooples.  In addition, some experts speculate ";
            myText += "that because of their similarly rudimentary organic composition to that of a common Green Gloople, it may be possible that they are also capable of reverse mitosis.";
            break;
         case "Meltie":
            myText = "  All Gloople\'s internal organic compounds are slightly acidic, though most at only a very minor level.  Melties, however, possess an extremely voracious acid within their bodies, held back by only a thin protective membrane.  Though they are more complex organisms than the common Gloople, they are incapable of complex behavior, presumably due to the fact that their synaptic and biomechanical components require such specific and extensive protective coatings and structures to be able to function within the deadly acid that composes their fluids.\r\r  Like Stickies,";
            myText += "the Meltie\'s behavior patterns are primarily to move toward whatever threat or target the nest has identified.  Melties are not particularly rare, and their highly caustic fluids are more than potent enough to be fatal to any human, and as such they are a great threat to any venturing into a nest.  However, very few other Glooples are as well-protected from this acid as the Meltie itself is, and as such a burst Meltie can cause havoc among other Glooples as readily as it can human intruders.\r\r  In any case, extreme caution is advised anywhere in the vicinity of one of these ";
            myText += "acid \"bombs\", and the appearance of one should always garner caution and one\'s full attention.";
            break;
         case "Sharp":
            myText = "  Sharps are generally found to be a defensive tool of the nest rather than a function of hunting or utility.  This Gloople has the ability to both shape and harden it\'s outer membrane in response to it\'s surroundings, and is one of the more externally aware and perceptive Glooples to be discovered.  When threatened or approaching a threat, the Sharp coils internal threads of sinuous tissue and thrusts these out against it\'s outer membrane causing spiny protrusions.  At the same time, it\'s skin is hardened into a shell-like enamel which produces several spear shaped points.";
            myText += "\r\r  The Sharp responds in this way to any dangerous stimuli it encounters, and while in this form is very durable.  Once the hazard is no longer present, the Sharp returns to it\'s usual shape.  Sharps are fairly agile and will continue to follow and attempted to skewer any threat they can identify until destroyed or driven away.";
            break;
         case "Inkie":
            myText = "  Like Stickies, Inkies are designed to travel toward a target and burst themselves by contact, rupturing their fragile outer membranes to release the fluid contents of their bodies.  Unlike Stickies, however, Inkies are composed of a substance very similar to petrol.  The resulting area after an Inkie has burst is left extremely slick and difficult to move dexterously through.\r\r  In addition, while all Glooples are somewhat flammable due to the alcohol base of their liquid components, Inkies are especially so, and their ink, if ignited will burn for an extended ";
            myText += "period or may even combust if adequately compressed.  Any Inkie within the proximity of open flame should be carefully avoided.";
            break;
         case "Clutter":
            myText = "  Simple organisms are noted for their ability to reproduce by self-duplication, normally in the form of mitosis.  However, most Glooples do not exhibit this trait.  The Clutter, however, has the ability to produce similar organisms to itself at an alarming rate and even uses them as a method of bringing down threats to the nest.  A Clutter is a veritable duplicate factory, and is in the constant stages of bearing small versions of itself within it\'s body.  These \"babies\" develop very rapidly within the protective confines of their parent Gloople, and upon completion";
            myText += " are projected at foes from a distance.\r\r  Clutter spawn are considerably sticky after being freshly jettisoned from the bodies of fully grown Clutters, and tend to stick to and impair an intruding threat to the nest.  Baby Clutters cling well and their bulk and weight will eventually burden down an opponent, particularly if several siblings are attached as well.  Even if shaken free, these infant Glooples begin a process of very rapid growth and can reach full size and adulthood in mere moments - where they can then produce spawn of their own.\r\r  Even if destroyed, an ";
            myText += "adult Clutter is a threat.  As it\'s outer membrane is breached, any developed spawn within it\'s body are freed to immediately begin growth into adults.  In addition, Clutters are cautious and observant enough to try and stay out of reach of any potential threats.";
            break;
         case "Fuzzle":
            myText = "  A peculiarity among Glooples, the Fuzzle is possibly the least like any other Gloople that has been previously observed.  The Fuzzle\'s outer membrane is extremely thick, more like a tough hide than the filmy membrane of it\'s relatives.  Additionally, the Fuzzle grows a thick coat of fur around the whole of it\'s body, which gives it additional protection from harm.  These elements make the Fuzzle exceptionally tough compared to other Glooples of it\'s size.\r\r  This durability is matched by a much more advanced mandible, which mimics the jaw of a more typical creature, complete with ";
            myText += "teeth.  Fuzzles are capable of longer-distance lunges and more precise movements than it\'s simpler cousin, the Biter.  Even mutual hazards such as pools of acid, open flame and damage from other hostile Glooples cannot immediately dissuade a Fuzzle from it\'s prey.\r\r  Even more alarming is that, as it is wounded and it\'s coat is damaged, the Fuzzle will attempt to avoid any further threats for a short time.  This allows it\'s exceptionally high metabolic rate to regrow it\'s coat in only a matter of moments, restoring any lost durability it may have suffered.\r\r  An extremely ";
            myText += "dangerous Gloople and a much more advanced hunting machine than it\'s predecessor, Fuzzles should be dealt with quickly and carefully.";
            break;
         case "Oozle":
            myText = "  The result of the peculiar quality of reverse-mitosis which Glooples exhibit, the Oozle is the compounding of two compatible common Glooples into a single, much larger and more complex organism.  The Oozle, firstly, is of adequate size to absorb threats as large as humans.  Thus, their behavior is also somewhat altered in that they are able to actively pursue such a target in an attempt to simply come in contact with and absorb it.\r\r  Because the Oozle is much more massive and it\'s external membrane is much thicker than it\'s smaller components, much more trauma is required to ";
            myText += "the Oozle\'s outer skin in order to breach it.  The Oozle\'s lumbering mass is generally not disturbed by much of any type of damage to it\'s body - even that which is significant to do it harm.  Therefore, it is wise for any attempting to attack this brute to do so from behind, as it\'s large size also adversely affects it\'s movement speed.";
            break;
         case "Grinder":
            myText = "  Grinders are more similar to their much smaller relatives than it may first appear.  This Gloople secretes from it\'s outer membrane an extremely powerful adhesive which slowly solidifies to a mineral hardness.  The Grinder uses this sticky secretion to collect various pieces of rock loosened or dug out during the excavation of the nest.  These fragments of stone collect and compress into tight layers as more of the thick adhesive seeps around the cracks and collects more stone. Once the Grinder has reached a certain density, it ceases to produce the organic glue and actively ";
            myText += "facilitates the continued compacting of it\'s stony shell by constantly rolling through rock beds.\r\r  At this stage, the Grinder begins to heat up greatly at it\'s core, and this intense heat in addition to the tight compression of the inner layers of stone causes the deepest layers to become slightly molten and gain the ability to shift with the momentum of the Grinder.\r\r  Not particularly aggressive, the Grinders in a nest are generally used to bash apart any obstructions during the construction of a nest, or to simply crush anything which might threaten the nest.  Though not ";
            myText += " particularly fast, a Grinder\'s speed can be surprising, and it\'s incredibly hard shell makes it all but invulnerable to harm while the stone is intact.  The best course of action is generally to move out of the way as soon as possible.";
            break;
         case "Torchie":
            myText = "  Torchies have developed a much purer composition of their alcohol-based organic fluids than any other known variety of Gloople, as well as a very effective method of utilizing this quality.  A Torchie\'s outer skin is considerably more flame resistant than it\'s cousins and indeed vents a constant flow of the flammable liquid through pores in this membrane.  The Torchie is then able to trigger a sudden and volatile chemical reaction in a gland on it\'s surface which combusts and sheathes the organism in flame.\r\r  So \"armed\", the Torchie is then able to spread this flame to anything ";
            myText += "remotely flammable by spreading it\'s burning liquid onto touched surfaces.  The constant flow of fuel around the surface of the Torchie keeps the flame lit with fair consistency, although the fire has been observed to go out after an extended period of time.  Once lit, the Torchie\'s behavior patterns seem to focus on coming in contact with as much matter as possible and spreading any existing fires.  Once extinguished, however, it appears that the ignition gland becomes exhausted after a single use, and the Gloople must either flee or find an alternate source of ignition to re-light ";
            myText += "itself.\r\r  It has been unfortunately observed that breaching a Torchie\'s outer skin while it is alight has the cataclysmic result of igniting the Gloople\'s entire payload at once, and such action is strongly discouraged.";
            break;
         case "Frostie":
            myText = "  A biological mystery, the Frostie is a strange and very dangerous result of a nest\'s development.  This gloople produces in large quantities an extremely highly compressed, low-density fluid which it stores in a layer of insulated cells just inside it\'s outer membrane.  This fluid leaks constantly from the porous skin of the Frostie and creates a thin layer of frozen water vapor around the organism.  Like many other breeds of Gloople, the Frostie\'s purpose in existence is to come in direct contact with a threat or predatory target of the nest and breach itself.  In doing so, the ";
            myText += "Frostie\'s stores of super cooled fluid are released violently in a cloud of freezing vapor.  The result is a thick coating of solid ice around everything in the area.\r\r  Some quality of the Frostie, possibly the fact that it is surrounded in a constantly-shifting area of frost, makes it the fastest moving Gloople to be currently observed.  These hazards are difficult to avoid, and there does not seem to be any completely safe way of disposing of them without being at least somewhat effected by their dramatic detonation.  Caution and advanced preparation are advised to any ";
            myText += "with intentions of damaging one of these bizarre organisms.";
            break;
         case "Gray":
            myText = "  Further mutual absorption of the common Gloople seems to lend a progressively more developed and sinister organism.  The Gray maintains the advantages of size, but it\'s additional density and cellular complexity gives it a much harder and still quite mutable outer membrane, which it uses in both a defensive and offensive capacity.\r\r  Just as resilient as it\'s simpler cousin the Oozle, the Grey gains considerable traits of perception and stimulus response.  When directly threatened, the Gray hardens it\'s outer skin into an almost steel-strong shell that appears to be impenetrable.";
            myText += "  In this form, while the Gloople is unable of any type of locomotion, any type of attack is ineffective against it.  The Gray has also developed this quality into a weapon, by extending a long thread of it\'s substance and hardening it\'s tip into this same metallic structure, the Gloople thrusts forward a lance capable of impaling it\'s enemies from a distance with deadly accuracy.\r\r  With this organism\'s exceptional defensive ability and long-reaching offensive potential, those looking to deal with it by force would be well advised to seek an opportunity during which the Gray would be ";
            myText += "unable to quickly react in order to strike successfully.";
            break;
         case "VoidEater":
            myText = "  An incredible organism that seems to bend the rules of biology and physics alike, the Void Eater is a phenomenal threat to any intruder into a Gloople nest.  Apparently with the compounding and compression of numerous already-dense simple organisms, the final product gains the uncanny ability to manipulate gravitational fields on a frightening scale.  One could not even begin to guess at the physiology of such an organism, and a sample has never been recovered for study (if such study would even be possible).\r\r  What is known is that the Void Eater is able to produce powerful ";
            myText += "gravity wells by further compressing it\'s form into a tiny point, thus drawing any and all nearby objects toward it.  When any such object approaches within the vicinity of the Void Eater, the organism is capable of creating an incredibly destructive shockwave by rapidly compressing and decompressing it\'s mass.  This shockwave decimates anything nearby with explosive force in an instant.  How any prospective attacker would even approach this creature is questionable.\r\r  In addition to this, it has been reported that in a truly baffling show of force, the Void Eater is able to use ";
            myText += "a moment to collect and compress local particles and then project this incredibly dense material in a type of \"density stream\" which would draw in and obliterate any nearby matter.  Avoid at all costs.";
            break;
         case "Amalgam":
            myText = "  An occasional mutation within the genetic structure of the common Gloople has been observed to cause the development of this type of cellulophagic aberration, which has been labeled the Amalgam.  This organism seems to be as much a threat to the nest that spawned it as it is to any human intruders, although the nest still seems to be able to direct it against any foes which present themselves.  The Amalgam has a constantly mutating structure and in fact is a maelstrom of self-consuming and self dividing cells.\r\r  When this mass comes in contact with any external organic mass, such as";
            myText += " another Gloople or a human intruder, it immediately and very rapidly breaks down each and every cell to it\'s most basic components and integrates the biomass into it\'s own, growing in size but not complexity.  As the Amalgam consumes and grows to a certain size, it spontaneously divides into two identical organisms, which then continue on their quest to rampantly consume any available living matter.  Because the Amalgam, unlike any other known Gloople, is a decentralized organism and possesses no discernable anatomical or physiological parts, it is very difficult to destroy.  Even ";
            myText += " massive trauma only destroys some of the organisms cells, and will sometimes cause the sudden separation of a smaller Amalgam from the main mass.  Fortunately, the Amalgam can only consume living things of it\'s own size or smaller.";
            break;
         case "Horror":
            myText = "  Reverse mitosis, normally observed between common Glooples, lends much more dangerous organisms.  Biters, an already very dangerous Gloople, are clearly capable of this feat as well, and doing so produces one of the deadliest Glooples ever cataloged - the Horror.  With increased mass, more developed behavior and an unmatched arsenal of biological weaponry, the Horror is a nightmare to any human attempting to confront it.  While a Biter is generally able to expose only a few of it\'s keratinous teeth at any time, the Horror can expose and utilize a huge number of these sharp extrusions ";
            myText += "all at once.\r\r  Constantly surrounded by rapidly rotating tracks of these teeth, the Horror needs to do little more than drive itself into most foes to shred them into unrecognizable ribbons.  Unfortunately, this terror is able to release a row of these teeth at will and allow them to fly at deadly velocity away from it\'s body to bury into any unprepared opponent.  What\'s worse, these loosed teeth are seeded with a powerful genetic spore which, if buried into the mass of a common Gloople, triggers a rapid mutation of that organism into a Biter.\r\r  The Horror is also capable of a sort";
            myText += " of controlled division, during which it casts out a group of subordinate toothy disks at it\'s prey which then return and recombine into the creature.  Use all available measures to prevent such a creature from forming.";
            break;
         case "Queen":
            myText = "  Once a nest reaches a certain size and maturity, through a process not well understood, a single Queen forms.  This organism exhibits much more complex behavioral patterns and perception than other Glooples.  It is not clear if the Queen actually directs the actions of the nest or is simply an extension of the nest as a whole.\r\r  The Queen\'s biology is also exceptional in that she is possessed of a pair of extremely large blade-like limbs which are most often drug behind her as she moves.  However, when threatened the queen is able to make deft swipes and lunges with these lethal ";
            myText += "instruments with precision enough to match the most skilled of human equivalents.  The chitinous construction of these blades is iron-hard yet light enough to be very quickly swung.\r\r  In addition to this swordsmanship, the Queen constantly produces and releases small larva when she is threatened.  If these larva come in contact with a viable Gloople host, they infest and lie dormant inside until the host is destroyed or travels outside of the influence of the Queen.  Should the Queen be destroyed while one of these larval pods remains within her reach, a chemical signal is received ";
            myText += "and the pupa bursts violently free of it\'s host and develops with incredible alacrity into a battle-ready duplicate of the felled Queen.  Engaging a Queen in combat is incredibly dangerous.";
            break;
         case "RazorQueen":
            myText = "  Very rarely, a nest that reaches a level of maturity in which a Queen is born will have an unusually high concentration of Biters among it\'s populous.  Through a specific mutation due to the prevalence of Biter genes in the nest, a Razor Queen, or Biter Queen, may be born.  An organism of remarkable complexity and elegant lethality, such an aberrant queen is an almost insurmountable opponent.\r\r The Razor Queen seems to combine properties of several other types of Glooples.  Like a Queen, her primary method of attack and defense are";
            myText += " pairs of massive bladed limbs which she wields in much the same way, raking and slashing at potential enemies.  Like Biters, she constantly produces a hard, keratinous material at an extremely high rate which she uses to form various projectiles, and sheds the excess as teeth from her body.  Worse, she appears to be able to use an advanced form of the Queen\'s larva-producing ability to create subordinate organisms adorned with these bladelike spines.\r\r";
            myText += " The Razor Queen is extremely well protected, and opportunities for attack are rare.  The Razor Queen is the most dangerous enemy one could potentially face in any nest.";
      }
      dataText.text = myText;
      dataText.setTextFormat(dataTextFormat);
      dataText._width -= 1;
   }
}
