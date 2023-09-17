onClipEvent(enterFrame){
   if(myText == null)
   {
      switch(hintCatagory)
      {
         case "General":
            switch(int(Math.random() * 12) + 1)
            {
               case 1:
                  myText = "Coax troublesome Glooples into moving out of the play area - they\'ll be eliminated from play.  You will not score for them, however, and there are a few Glooples that this won\'t work on.";
                  break;
               case 2:
                  myText = "Be very careful around the edges of the play area, a Gloople may come in from the edges and leave you too little time to get out of the way.";
                  break;
               case 3:
                  myText = "Sometimes it\'s a better idea to just try and stay out of the way for a moment than to swing wildly - that brief second of immobility may be your demise.";
                  break;
               case 4:
                  myText = "Most anything a Gloople can toss at you can be batted away, so if getting out of the way isn\'t an option, take a swing at it.";
                  break;
               case 5:
                  myText = "Avoid swinging at anything too hard to damage - if your weapon bounces off, you\'ll be stunned for a moment.  Make sure your whole swing arc is clear of obstructions.";
                  break;
               case 6:
                  myText = "When you swing the SplatMaster3000, you create a wide killzone in front of you that lasts a tiny bit longer than you may think that it does.  This means you can swing a bit early and let an enemy \"run into\" your swing from outside your actual reach.";
                  break;
               case 7:
                  myText = "To splat a Gloople, make sure you get most of it in your swing arc - just grazing the edge of it won\'t count.";
                  break;
               case 8:
                  myText = "The Spawn Limit option in the Options menu determines the general maximum number of glooples allowed onscreen at a time - this isn\'t an absolute limit, but turning it down will make the game a little easier and run a little better (and vice versa).";
                  break;
               case 9:
                  myText = "Stay aware of where your swing arc is going to be before you attack.  If there\'s a danger you might hit something you need to avoid, try using the corners of the arc instead of the broad part in front of you.";
                  break;
               case 10:
                  myText = "The closer you keep the cursor to the character, the more quickly you\'ll be able to make fine movements, and the more control you\'ll have over your facing and swings.";
                  break;
               case 11:
                  myText = "Most Awards cannot be earned in Practice mode.  You have to pull off the impressive deed when it counts to get the credit.";
                  break;
               case 12:
                  myText = "Every 10 Awards you earn gets you a Reward Key.  With it you can unlock a little something to give you an edge during play.";
            }
            break;
         case "Single":
            switch(int(Math.random() * 3) + 1)
            {
               case 1:
                  myText = "As you near the end of the Nest, there is a chance that you\'ll come across a particularly dangerous Gloople.  This is much more likely the longer your Game Length is set to.";
                  break;
               case 2:
                  myText = "It doesn\'t matter what type of Gloople you splat, each kill counts down the nest by one, so go for the easy targets when you can - they count just as much as the real problem Glooples do.";
                  break;
               case 3:
                  myText = "You don\'t need to try and splat every single Gloople; the ones that get away don\'t count against you in any way and the Glooples will keep coming until you\'ve met the quota.";
            }
            break;
         case "Bounty":
            switch(int(Math.random() * 2) + 1)
            {
               case 1:
                  myText = "Try to catch as many Glooples in a single swing as you can.  Not only will this leave you vulnerable less often, but each additional Gloople acts as a bounty multiplier.";
                  break;
               case 2:
                  myText = "More high point value Glooples in one swing means a higher base value for the multiplier to be applied to.  Three Biters are far more valuable than three Glooples.";
            }
            break;
         case "Sprint":
            switch(int(Math.random() * 2) + 1)
            {
               case 1:
                  myText = "Sprint is very effective but limited.  You\'ll only get a few seconds of speed boost before you have to stop so that it can recharge.  Use it wisely.";
                  break;
               case 2:
                  myText = "Sprint will only recharge while you are standing completely still.  You cannot be swinging, being bumped or anything else.  When you\'re empty, try and look for a safe spot to catch a breather.";
            }
            break;
         case "Grenade":
            switch(int(Math.random() * 2) + 1)
            {
               case 1:
                  myText = "It is entirely possible to catch yourself with a Grenade blast.  Even if you are outside the kill radius, it will still knock you off balance if you are a bit too close.";
                  break;
               case 2:
                  myText = "Like all rewards that you need to toss, how hard you throw is determined by how far the mouse is from the character when you press the Use key.  With lighter objects, like the Grenade, it should land somewhere near where your cursor was.";
            }
            break;
         case "Teleport":
            switch(int(Math.random() * 2) + 1)
            {
               case 1:
                  myText = "The first time you use the Teleporter, you\'ll toss down the TelePad.  Position it well... you can\'t move it again, and it\'s where you\'ll always go when you teleport from then on.";
                  break;
               case 2:
                  myText = "Keep in mind that once the Pad is down, you can teleport at any time... even mid-bump or while swinging - it\'s even possible to start swinging, teleport, and kill something on the other side.";
            }
            break;
         case "Choker":
            switch(int(Math.random() * 2) + 1)
            {
               case 1:
                  myText = "While it may not have any obvious effect, the Inhibitor can be a huge help when you\'re feeling overwhealmed.  It doesn\'t do anythign to the Glooples already out, but it will keep more from showing up for a little while.";
                  break;
               case 2:
                  myText = "More than any other Reward, it makes no difference where you put down the Inhibitor.  It can\'t be damaged or destroyed, and will work until it runs out of battery regardless of where it is.";
            }
            break;
         case "Spike":
            switch(int(Math.random() * 2) + 1)
            {
               case 1:
                  myText = "While the Repulsor Stake can provide you with some easy free shots by holding glooples at bay, pay attention to it while it\'s out.  When the power runs out, the sudden influx of angry glooples can be an unhappy surprise.";
                  break;
               case 2:
                  myText = "Though it doesn\'t affect you, the Repulsor Spike is not completely protected from interruption.  Be careful where you swing; if you catch it in an overzealous swing, it\'ll break.";
            }
            break;
         case "Lure":
            switch(int(Math.random() * 2) + 1)
            {
               case 1:
                  myText = "Just because their attention is elsewhere does not make some glooples less lethal.  When you divert them with the Lure, you still need to be wary that they can hurt you.";
                  break;
               case 2:
                  myText = "When a Lure is out, not only will you not be actively persued by glooples, but you will not even be percieved as a threat.  This means Biters won\'t lunge, nor will any other type direct attack be made against you.";
            }
            break;
         case "Mason":
            switch(int(Math.random() * 2) + 1)
            {
               case 1:
                  myText = "The most important part of using an Instant Wall is figuring out where to place it so that it does you the most good, while still not being too much in the way.  Remember, it blocks you off as well as it does the enemies.";
                  break;
               case 2:
                  myText = "It may seem invulnerable, but an Instant Wall can be broken down eventually, especially if it\'s struck by a lot of heavy hitters.  Be prepared for the possibility that your barricade could be overwhealmed.";
            }
            break;
         case "BoxGun":
            switch(int(Math.random() * 2) + 1)
            {
               case 1:
                  myText = "The SCAER will do it\'s best to avoid hitting you.  However, if you stand right in front of the barrel, or are caught by a ricochet off of a hard target, you could still be shot.";
                  break;
               case 2:
                  myText = "A SCAER holds 30 rounds.  If it runs out of ammo, it will self-destruct to clear the area.  However, it can be destroyed ahead of time by dangerous glooples or even careless sword swings.";
            }
            break;
         case "Drone":
            switch(int(Math.random() * 2) + 1)
            {
               case 1:
                  myText = "While extremely efficient at cutting through glooples, the Saw Drone\'s design gives it only a limited battery life.  Don\'t expect it to last too long.";
                  break;
               case 2:
                  myText = "The Saw Drone will go to some lengths to avoid flying near you, but you should avoid doing silly things like running straight at it.  In a pinch, you can whack it in a desired direction with your sword, though this is not particularly good for it.";
            }
            break;
         case "Hazard Suit":
            switch(int(Math.random() * 2) + 1)
            {
               case 1:
                  myText = "Passive hazards are more or less nullified while in the Hazard Suit.  Keep an eye on it\'s charge gauge, however, because when it runs out of juice, it will fall away and you\'ll be unprotected from there on out.";
                  break;
               case 2:
                  myText = "While the Hazard Suit does nothing to defend against direct attacks, impediments and traps are completely ignored.  Fight without fear of inconveniences, but you still have to keep from walking in front of something really bad.";
            }
            break;
         case "Armor":
            switch(int(Math.random() * 2) + 1)
            {
               case 1:
                  myText = "The Armor is basically an extra life.  It will save you from death once, and only once.  There are however a few things that can still kill you despite the Armor, so be mindful.";
                  break;
               case 2:
                  myText = "The ablative nature of the Reactive Armor means that whatever is in your immediate vicinity when you take that fatal blow will be blown to smithereens.";
            }
            break;
         case "Glaive":
            switch(int(Math.random() * 2) + 1)
            {
               case 1:
                  myText = "The Razor Glaive is excessively powerful.  You\'ll soon find that many opponents that seems exceptionally tough before are now as easly carved through as everything else.";
                  break;
               case 2:
                  myText = "Despite it\'s incredible carnage-potential, the Razor Glaive does have one major flaw:  It is very heavy.  You\'ll find that your move speed is painfully reduced while you have this bruiser equipped.";
            }
            break;
         case "Gloople":
            switch(int(Math.random() * 4) + 1)
            {
               case 1:
                  myText = "Green Glooples can\'t directly hurt you, but letting them bump into you will knock you off balance for a moment and give something worse a chance to strike.";
                  break;
               case 2:
                  myText = "Glooples can stick together and form larger Glooples if you allow them to touch, although it only happens occasionally.";
                  break;
               case 3:
                  myText = "Regular Glooples are subject to more or less all of the same dangers as you are - keep an eye on them when something new shows up.  If it kills the Glooples, it\'ll probably do the same to you!";
                  break;
               case 4:
                  myText = "Green Glooples are plentiful, don\'t put yourself in danger trying to chase one down, and don\'t hesitate to use them as cover between yourself and something dangerous (although it may not do much good.)";
            }
            break;
         case "Biter":
            switch(int(Math.random() * 3) + 1)
            {
               case 1:
                  myText = "Biters are quick, but they can only lunge in a straight line, and they can\'t stop.  Wait for it to pounce, and then either splat it or step out of the way.";
                  break;
               case 2:
                  myText = "A Biter can\'t lunge (or hurt you) if it\'s gummed up in Stickie goo, so use the opportunity to splat it safely, or clean up some other threats.";
                  break;
               case 3:
                  myText = "Although it\'s very rare, Biters can glom together to form a very scary gloople - don\'t let them touch too often.";
            }
            break;
         case "Stickie":
            switch(int(Math.random() * 5) + 1)
            {
               case 1:
                  myText = "Stickies will pop when they touch anything, but they move completely straight so you can\'t steer them into things.  Better to splat them and leave the goo as a trap or protective barrier.";
                  break;
               case 2:
                  myText = "Stickie goo is a great insulator, and though it gums you up and slows you down, it will keep you from catching fire or being stuck in ice.";
                  break;
               case 3:
                  myText = "When a Stickie enters the play field, it always aims for you.  If you stay in one place while there are Stickies around, you\'ll eventually be bogged down.";
                  break;
               case 4:
                  myText = "Big things are just too large and heavy to be slowed down (any more than they are) by Stickie goo, don\'t count an any help there.";
                  break;
               case 5:
                  myText = "Certain Glooples have the ability to shake off Stickie goo more quickly than others, so keep on eye on those that don\'t seem to be affected as long as you\'d hoped.";
            }
            break;
         case "Meltie":
            switch(int(Math.random() * 5) + 1)
            {
               case 1:
                  myText = "While Meltie acid makes short work of a lot of Glooples, there are some who are too well protected to be hurt by it.";
                  break;
               case 2:
                  myText = "Be very careful when splatting a Meltie: just because you hit it doesn\'t mean it can\'t splash toward you.  Take note of the direction things splat when you hit them, and catch Melties on the correct side.";
                  break;
               case 3:
                  myText = "Meltie acid lasts a while, so use them as defensive barriers while you can - most Glooples can\'t cross it safely.";
                  break;
               case 4:
                  myText = "Right when a gloople gets caught in Meltie acid, there\'s a very brief time when it\'s stuck but not quite dissolved when you can still splat it and get the credit.";
                  break;
               case 5:
                  myText = "Melties will gently curve toward you while traveling.  Use this to your advantage and steer them into threats you don\'t want to deal with - or can\'t.";
            }
            break;
         case "Inkie":
            switch(int(Math.random() * 4) + 1)
            {
               case 1:
                  myText = "Don\'t let an Inkie touch you - their thick black goo will blind you for more than long enough to get you killed.";
                  break;
               case 2:
                  myText = "It\'s a good idea to steer clear of Inkie splats.  It won\'t hurt you directly, but it\'ll cause you to slide a short way without any control - it takes a little luck to come out okay.";
                  break;
               case 3:
                  myText = "Inkie ink pools are very flammable, and if lit on fire will create a big, long-burning fire.  Anything caught in the blaze will go up as well.";
                  break;
               case 4:
                  myText = "Under no circumstances should you let an Inkie get anywhere near a fire (don\'t worry about the little flames, though).  If lit before they splat, they detonate and take out everything around them.";
            }
            break;
         case "Clutter":
            switch(int(Math.random() * 7) + 1)
            {
               case 1:
                  myText = "A Clutter will never intentionally get anywhere near you - you\'ll have to take the fight to them.  But don\'t let them get you into trouble trying to chase them down.";
                  break;
               case 2:
                  myText = "Because of the way Clutters avoid you, don\'t be ashamed to just \"push\" them off of the edge of the play area.  It\'s easy, and we all do it.  You don\'t score, but they\'re out of the way.";
                  break;
               case 3:
                  myText = "If you swing immediately after a swing that kills an adult Clutter, you\'ll usually mop up the babies it drops as well (and get a pretty good score for it, as well).  Just don\'t do this at the expense of watching your back.";
                  break;
               case 4:
                  myText = "You can really ignore baby Clutters safely for a while - it takes them a short time to grow up, and until then they aren\'t a threat.  Just make sure you get to them before they reach full size.";
                  break;
               case 5:
                  myText = "Most of the time you\'re better off just stepping out of the way of spit baby Clutters rather than swatting them.  They splat when they hit the ground anyway.  If you do splat them, though, they\'re worth as much as any small Clutter.";
                  break;
               case 6:
                  myText = "If you get a baby Clutter stuck to you, you can shake them off quickly by spinning around in circles as fast as you can.";
                  break;
               case 7:
                  myText = "Having more than one baby Clutter stuck to you is a serious problem because it begins to slow you down a lot, and can sometimes keep you from swinging.  Shake them off as soon as you can.";
            }
            break;
         case "Sharp":
            switch(int(Math.random() * 6) + 1)
            {
               case 1:
                  myText = "You can\'t take a Sharp head-on, with it\'s spines out it\'s pretty much invulnerable.  Get around behind it, and it\'ll let it\'s guard down.";
               case 2:
                  myText = "More often than you\'d like, the best way to deal with a Sharp is just to bat it out of the play area.  You don\'t get credit for it, but you don\'t have to deal with it either.";
                  break;
               case 3:
                  myText = "Sharps are clever enough that, if they see a hazard in front of them, they\'ll put their spines out.  This goes for you, a dangerous pool, or any other Gloople, really.";
                  break;
               case 4:
                  myText = "With their spines out, a Sharp is immune to the effect of any standing hazardous pool.  Don\'t rely on defensively placed goo splats keeping Sharps off your back.";
                  break;
               case 5:
                  myText = "Sharps can splat a lot of glooples, and a well placed swat can send them into some other unpleasantness that you\'d rather not deal with.";
                  break;
               case 6:
                  myText = "Continuously whacking at a Sharp won\'t work - if they take a smack, no matter which way they\'re facing, they\'ll leave their spines out for a few seconds.";
            }
            break;
         case "Grinder":
            switch(int(Math.random() * 4) + 1)
            {
               case 1:
                  myText = "Most of the time the best thing you can do about a Grinder is get out of the way.  On the bright side, they demolish basically anything they roll over.";
                  break;
               case 2:
                  myText = "Grinders try and steer very subtly toward you, so it\'s possible to guide them into other threats (or each other, which is a different matter altogether).";
                  break;
               case 3:
                  myText = "Even if you find a way to weaken a Grinder\'s stony skin enough that you can hurt it, they still take a ton of punishment.  Killing one is an impressive achievement.";
                  break;
               case 4:
                  myText = "Grinders are big, and so is your swing area.  Be very cautious when swinging anywhere around a Grinder - if you hit it at all, you\'ll bounce off and be stunned for a couple of seconds.";
            }
            break;
         case "Fuzzle":
            switch(int(Math.random() * 5) + 1)
            {
               case 1:
                  myText = "Like a Super-biter, a Fuzzle is better in pretty much every way.  Give them your full attention when they show up.";
                  break;
               case 2:
                  myText = "Be persistent when trying to splat a Fuzzle.  If you knock off all of their fur, and then give them a few seconds, they\'ll grow it back and be just as tough as when they started.  Make sure you get that last swing in when you can.";
                  break;
               case 3:
                  myText = "When you\'ve got a Fuzzle down to it\'s skin, it won\'t try and bite you and instead will try to run away for a while.  If you\'re really in trouble, you can use this time to deal with something else - just don\'t take too long.  It\'ll be back.";
                  break;
               case 4:
                  myText = "It\'s easy to tell when a Fuzzle\'s about to lunge, it hunkers down and crawls for a couple of seconds first.  Be careful though, while it\'s getting ready to jump it can adjust it\'s aim very quickly";
                  break;
               case 5:
                  myText = "Fuzzles are even resistant to many of the hazardous splats - they still have an effect, but it\'s not as severe as with other glooples.";
            }
            break;
         case "Torchie":
            switch(int(Math.random() * 5) + 1)
            {
               case 1:
                  myText = "Do not, under any circumstances, attack a Torchie while it\'s on fire - this is instant death, as the little beast will explode and take you with it.";
                  break;
               case 2:
                  myText = "Once a Torchie has gone out, make sure you kill it before it has a chance to get into any flame.  If it does, it will re-light itself and be just as dangerous as before.  You can stomp out the little fires it leaves behind to take out some insurance against this happening.";
                  break;
               case 3:
                  myText = "Torchies light almost anything they bump into on fire.  This is the end of a lot of glooples, but not before they have the chance to spread the fire themselves.  Don\'t touch anything on fire, or you\'ll join them.";
                  break;
               case 4:
                  myText = "As dangerous as they are, a lot of things can extinguish a Torchie and make it an easy target.  Try and use one of these methods if you don\'t feel like waiting for it to go out on it\'s own.";
                  break;
               case 5:
                  myText = "Should you catch fire, you have a few seconds of panicky running about to try and put yourself out.  The same things that put out most fires will work on you (although acid is not recommended).";
            }
            break;
         case "Oozle":
            switch(int(Math.random() * 2) + 1)
            {
               case 1:
                  myText = "Don\'t stand in front of an Oozle while trying to splat it.  While you may get off a swing, you won\'t slow it down, and it\'ll just roll over you while you\'re getting ready to swing again.";
                  break;
               case 2:
                  myText = "It\'s a good idea to take care of Oozles wherever they pop up.  Letting them hang around gives them a chance to glom together with another Green Gloople and make your life harder.";
            }
            break;
         case "Gray":
            switch(int(Math.random() * 3) + 1)
            {
               case 1:
                  myText = "Most of the time it\'s useless to take a swing at a Gray, they can harden into a ball of steel faster than you can get your SplatMaster3000 into them.  You\'ll have to wait for them to concentrate on something else before you get the chance to hurt them.";
                  break;
               case 2:
                  myText = "As lethal as the Gray\'s tendril lance is, it\'s pretty easy to avoid.  Mainly try not to get stunned or staggered while one is around and keep your eye on it, and you should be okay.";
                  break;
               case 3:
                  myText = "If you have a Gray bearing down on you, but need to take a swing, it is possible to deflect it\'s lance with your attack.  Just make sure you time it right.";
            }
            break;
         case "Frostie":
            switch(int(Math.random() * 4) + 1)
            {
               case 1:
                  myText = "The blast of frozen air from a burst Frostie is bigger than the reach of your SplatMaster3000.  If you don\'t want to be frozen at all, just dodge, don\'t swing.";
                  break;
               case 2:
                  myText = "How long you\'re frozen is a direct result of how far you were from the Frostie when it popped.  If it hit you, you\'re in trouble.  If you splatted it from as far away as you could manage, you\'ll be stuck for a couple of seconds at most.";
                  break;
               case 3:
                  myText = "Frostie hit you, and you\'re frozen good?  Try wiggling up and down, you\'ll break it much faster that way.";
                  break;
               case 4:
                  myText = "Anything frozen (including you) can be destroyed by just bumping into it.  On the other hand, you don\'t score for breaking frozen Glooples.";
            }
            break;
         case "Amalgam":
            switch(int(Math.random() * 4) + 1)
            {
               case 1:
                  myText = "Persistence is the key when you have an Amalgam after you.  Keep swinging, and keep in mind that every absorbed Gloople is another swing you have to make.";
                  break;
               case 2:
                  myText = "It\'s not as important to immediately chase down small Amalgam that break off of the big one when you attack it - they can\'t hurt you until they get bigger.";
                  break;
               case 3:
                  myText = "The old \"lure it into moving out of the play area\" trick won\'t work an Amalgam, they stay in the game even if they cross the border.  You have to kill them all.";
                  break;
               case 4:
                  myText = "Every time you land a hit on an Amalgam, you stun it for just about long enough to get another swing in.  You can\'t stand right in front of it, but you can get in quite a few swipes before you\'ll even have to move if you get along side one.";
            }
            break;
         case "VoidEater":
            switch(int(Math.random() * 4) + 1)
            {
               case 1:
                  myText = "With a Void Eater on your hands, your main concern should be staying away from it.  Most of what it does will try and draw you close enough for it to blast you into oblivion, so focus on keeping your distance and wait for your chance.";
                  break;
               case 2:
                  myText = "It\'s very possible that a Void Eater could form right next to you and blast you with a shockwave before you even have a chance to react to it.  The solution?  Don\'t leave Grays hanging around.";
                  break;
               case 3:
                  myText = "A Void Eater\'s density beam has a much more powerful gravity effect than it\'s gravity well.  If you aren\'t well out of the way when it starts, you\'re probably doomed.";
                  break;
               case 4:
                  myText = "You can tell the killzone around a Void Eater by where the Glooples are getting annihilated.";
            }
            break;
         case "Horror":
            switch(int(Math.random() * 5) + 1)
            {
               case 1:
                  myText = "Don\'t try to attack a Horror directly.  Doing so is almost certainly your undoing, as it\'s way to hard for your SplatMaster3000 to damage, and in the time it takes you to recover from the recoil it will have already turned you into kibble.";
                  break;
               case 2:
                  myText = "Horrors move fast enough that you\'ll have enough to do just trying to keep it from mowing you down in your tracks.  Step around the side of it as close as you dare, and you\'ll force it to make a bit of a \"U\" turn and buy yourself a little time.";
                  break;
               case 3:
                  myText = "It\'s basically impossible to know when a Horror is going to fling off a bunch of it\'s deadly little teeth, although it normally reserves this move for when you\'re too far for it to just roll over you and turn you into mulch.  On the other hand, a Horror will never send it\'s disks after you unless you\'re well away from it.";
                  break;
               case 4:
                  myText = "Horror teeth that it flings off of it\'s body aren\'t too hard to dodge, but if you have to you can just bat them out of the air.  Also, keep track of any Green Glooples in the way: if they get hit, they\'ll mutate into a Biter and come after you.";
                  break;
               case 5:
                  myText = "When a Horror sends it\'s disks after you, it becomes a bit more paranoid and makes an effort to keep a little distance from you.  Don\'t let it draw you in long enough for the disks to come back around and slice you in half.";
            }
            break;
         case "Queen":
            switch(int(Math.random() * 6) + 1)
            {
               case 1:
                  myText = "Don\'t let Queen larva hang around.  You can splat them or just step on them, but leaving them alive means that if you manage to outmaneuver the Queen and get that killing blow, another one may pop up right behind her.";
                  break;
               case 2:
                  myText = "If you should kill a Queen and notice a larva still crawling around, get it as fast as you can.  It can\'t spawn a new Queen unless it gets to a Gloople host, and it will be trying it\'s hardest to do just that.";
                  break;
               case 3:
                  myText = "The Queen\'s long reach and ability to lunge makes her very difficult to dodge.  Sometimes your best bet is to swing into her in an attempt to parry.  She\'ll do the same to you, after all.";
                  break;
               case 4:
                  myText = "Because the Queen is cautious and will dodge away any time you make a swipe at her, it\'s possible to bully her around a bit if you need a moment to collect yourself.  Just make sure you don\'t get caught swinging at nothing when she decides to pounce.";
                  break;
               case 5:
                  myText = "It\'s always best to keep your distance when you can while fighting a Queen.  The best time to strike her is during a lunge, and if you get in tight, remember:  She has two huge sharp cutting thingies.  You only have one.";
                  break;
               case 6:
                  myText = "Should you be fighting a Queen and actually bump into one another (usually by way of you both missing one another) you can probably expect to get creamed immediately.  She\'s much quicker at reacting to that sort of situation than you are.";
            }
            break;
         case "RazorQueen":
            switch(int(Math.random() * 10) + 1)
            {
               case 1:
                  myText = "The fact that you\'ve seen a Razor Queen at all should make you proud.  In that \"What the heck is tha-Ow.  I died.\" sort of way";
                  break;
               case 2:
                  myText = "When the Razor Queen digs her claws into the ground, you\'d do well to put some distance between you and her.  She starts to attack at range, and if you can\'t keep your eye on her and do some fancy footwork, you\'re not going to survive it.";
                  break;
               case 3:
                  myText = "Like most things, the quills a Razor Queen launches from her body can be destroyed by slashing them.  However, because this keeps you from moving, it\'s best to only do this if you really need to.";
                  break;
               case 4:
                  myText = "The Razor Queen has five huge blades to your one.  Trying to swing at her when she\'s not left herself open is blatant suicide.";
                  break;
               case 5:
                  myText = "The spiny larva a Razor Queen spawns while she\'s chasing you around will explode if you get near enough, but it takes them a second.  If you step in and then move away, you should be able to get rid of them safely without having to swing.";
                  break;
               case 6:
                  myText = "The digging razor mites that a Razor Queen will spit while dug in are safe from attack while underground.  However, they come up to lunge very predictably, and you should take the opportunity to kill them, lest they circle around and surprise you.";
                  break;
               case 7:
                  myText = "When a Razor Queen spits a spine jack, she lobs it through the air.  As long as you aren\'t nearby when it lands, you can walk safely under it while it\'s airborne.";
                  break;
               case 8:
                  myText = "A spine jack stuck in the ground can really help you survive a Razor Queen\'s bombardment - the quills she launches will break when they hit it, and airborne razor mites will bounce off of it.  Watch carefully though - mites can burrow under it, and the spine jack will break eventually";
                  break;
               case 9:
                  myText = "Like most glooples with distance-covering attacks, a Razor Queen will only lunge if you\'re far enough away for her to need to.";
                  break;
               case 10:
                  myText = "If a Razor Queen has littered the screen with so many spine jacks you can\'t move around well, you can break them down with enough hits.  This takes some time though - make sure you have it to spare.";
            }
      }
      dataText.text = myText;
      dataText.setTextFormat(dataTextFormat);
      dataText._width -= 1;
      if(SearchArray(_global.TipsSeen,myText) == null && myText != null)
      {
         _global.TipsSeen.push(myText);
      }
   }
}
