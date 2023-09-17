onClipEvent(load){
   stop();
   onMe = false;
   _global.AwardDatabaseLoaded = false;
   myTipText = "View and read about each of the Awards you have collected thus far";
   if(_global.AwardDatabaseLoaded == false)
   {
      _global.AwardTrait = function(Comm, Trait)
      {
         switch(Comm)
         {
            case "First Amalgam":
               switch(Trait)
               {
                  case "Title":
                     return "Immunology";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Awarded for splatting an Amalgam.  This is really just the tip of the iceberg.";
               }
               break;
            case "First Biter":
               switch(Trait)
               {
                  case "Title":
                     return "Self Preservation";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Awarded for splatting a Biter.  Get it before it gets you, I always say.";
               }
               break;
            case "First Clutter":
               switch(Trait)
               {
                  case "Title":
                     return "Replication";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Awarded for splatting a Clutter.  Oh good, now there\'s more of them.  And they\'re little chickens.";
               }
               break;
            case "First Frostie":
               switch(Trait)
               {
                  case "Title":
                     return "Cold Front";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Awarded for splatting a Frostie.  When you take out a Frostie you know what you\'ll be doing with the next couple seconds.";
               }
               break;
            case "First Fuzzle":
               switch(Trait)
               {
                  case "Title":
                     return "Hairball";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Awarded for splatting a Fuzzle.  Definitely not as cute bald.  Well, that and the huge teeth.";
               }
               break;
            case "First Gloople":
               switch(Trait)
               {
                  case "Title":
                     return "Participation";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Awarded for splatting a Gloople.  I\'m pretty sure my cat could have gotten this one.";
               }
               break;
            case "First Gray":
               switch(Trait)
               {
                  case "Title":
                     return "Armor Piercer";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Awarded for splatting a Gray.  This one rates pretty high on the \'distract you so that something else can kill you\' list.";
               }
               break;
            case "First Grinder":
               switch(Trait)
               {
                  case "Title":
                     return "Excavation";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Awarded for splatting a Grinder.  Takes a serious commitment.  That said, at 100 bounty...";
               }
               break;
            case "First Horror":
               switch(Trait)
               {
                  case "Title":
                     return "Bravery";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Awarded for splatting a Horror.  Fear is the mind killer.  Also little spinny bladey things.";
               }
               break;
            case "First Inkie":
               switch(Trait)
               {
                  case "Title":
                     return "Black Mark";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Awarded for splatting an Inkie.  Bonus points if you thought of Rorschach and saw a pony.";
               }
               break;
            case "First Meltie":
               switch(Trait)
               {
                  case "Title":
                     return "Mixed Blessing";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Awarded for splatting a Meltie.  Honestly things get much worse for everyone after you kill them.";
               }
               break;
            case "First Oozle":
               switch(Trait)
               {
                  case "Title":
                     return "Three Licks";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Awarded for splatting an Oozle.  How many times do you have to get swallowed up after two slashes before you decide to walk around behind it?";
               }
               break;
            case "First Queen":
               switch(Trait)
               {
                  case "Title":
                     return "Red Queen";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Awarded for splatting a Queen.  Impressive feat to kill one of these terrors.  Also, quite satisfying to squish the little red bugs.";
               }
               break;
            case "First Razor Queen":
               switch(Trait)
               {
                  case "Title":
                     return "Epic";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Awarded for splatting a Razor Queen.  You are now entitled to boast to your friends that you beat the Boss of the game.  Ignore looks of confused skepticism.";
               }
               break;
            case "First Sharp":
               switch(Trait)
               {
                  case "Title":
                     return "Opportunist";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Awarded for splatting a Sharp.  Harder than it looks.  Okay, no, it looks pretty hard.";
               }
               break;
            case "First Stickie":
               switch(Trait)
               {
                  case "Title":
                     return "Lemony";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Awarded for splatting a Stickie.  Just makes you wanna take a shower doesn\'t it.";
               }
               break;
            case "First Torchie":
               switch(Trait)
               {
                  case "Title":
                     return "Defuse";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Awarded for splatting a Torchie.  And you did it without ending up as chunky salsa.";
               }
               break;
            case "First Void Eater":
               switch(Trait)
               {
                  case "Title":
                     return "Enforced Gravity";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Awarded for splatting a Void Eater.  Tell me THAT didn\'t get your attention.";
               }
               break;
            case "Splat a Glom":
               switch(Trait)
               {
                  case "Title":
                     return "Preventative Measures";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Awarded for splatting a pair of Glooples while glomming together.  Sure, the score is crappy, but you probably saved yourself some heartache later.";
               }
               break;
            case "Kill 2 Razor Queens":
               switch(Trait)
               {
                  case "Title":
                     return "Merciless";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Career";
                  case "Description":
                     return "Awarded for splatting 2 Razor Queens.  Anyone can stumble through something impressive once.  Consider this proof of your awesomeness.";
               }
               break;
            case "Kill 4 Grinders":
               switch(Trait)
               {
                  case "Title":
                     return "Fault Line";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Career";
                  case "Description":
                     return "Awarded for splatting 4 Grinders.  Making a habit of killing Grinders shows one of two things: high score aspirations or suicidal tendencies.";
               }
               break;
            case "Kill 3 Queens":
               switch(Trait)
               {
                  case "Title":
                     return "Queensbane";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Career";
                  case "Description":
                     return "Awarded for splatting 3 Queens.  Cat-like reflexes, iron concentration and a healthy dose of luck to boot.  That, or you\'re just that leet.";
               }
               break;
            case "Kill 3 Void Eaters":
               switch(Trait)
               {
                  case "Title":
                     return "Physics Defied";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Career";
                  case "Description":
                     return "Awarded for splatting 3 Void Eaters.  You are either very lucky or very unlucky, not sure which.";
               }
               break;
            case "Kill 5 Grays":
               switch(Trait)
               {
                  case "Title":
                     return "Dismantler";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Career";
                  case "Description":
                     return "Awarded for splatting 5 Grays.  Perhapse you should think about taking care of those Oozles a little earlier.";
               }
               break;
            case "Kill 3 Horrors":
               switch(Trait)
               {
                  case "Title":
                     return "No Fear";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Career";
                  case "Description":
                     return "Awarded for splatting 3 Horrors.  The horror.  The HORROR.";
               }
               break;
            case "Kill 6 Torchies":
               switch(Trait)
               {
                  case "Title":
                     return "Bomb Squad";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Career";
                  case "Description":
                     return "Awarded for splatting 6 Torchies.  See?  Stickies are good for something.  Avoiding huge explosions for example.";
               }
               break;
            case "Kill 6 Frosties":
               switch(Trait)
               {
                  case "Title":
                     return "Anti-Freeze";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Career";
                  case "Description":
                     return "Awarded for splatting 6 Frosties.  I\'m assuming that by now you are an excellent mouse-wiggler. Hmm... doesn\'t sound quite right...";
               }
               break;
            case "Kill 10 Sharps":
               switch(Trait)
               {
                  case "Title":
                     return "Patience";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Career";
                  case "Description":
                     return "Awarded for splatting 10 Sharps.  Seriously, I\'d just throw them off the screen.";
               }
               break;
            case "Kill 15 Amalgams":
               switch(Trait)
               {
                  case "Title":
                     return "Purifier";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Career";
                  case "Description":
                     return "Awarded for splatting 15 Amalgams.  Annoying, no?  The correct response at this point to one of these showing up is an audible groan.";
               }
               break;
            case "Kill 15 Oozles":
               switch(Trait)
               {
                  case "Title":
                     return "Size Matters";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Career";
                  case "Description":
                     return "Awarded for splatting 15 Oozles.  Yes yes, you can kill something very slow and plodding.";
               }
               break;
            case "Kill 20 Fuzzles":
               switch(Trait)
               {
                  case "Title":
                     return "Tribble";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Career";
                  case "Description":
                     return "Awarded for splatting 20 Fuzzles.  You think that was fun, imagine if the little sword guy was allergic.";
               }
               break;
            case "Kill 30 Inkies":
               switch(Trait)
               {
                  case "Title":
                     return "Paint It Black";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Career";
                  case "Description":
                     return "Awarded for splatting 30 Inkies.  Does anyone seriously have FOND memories of the slip \'n slide?  Anyone?  All I remember is pneumonia and fleshwounds.";
               }
               break;
            case "Kill 50 Melties":
               switch(Trait)
               {
                  case "Title":
                     return "HazMat";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Career";
                  case "Description":
                     return "Awarded for splatting 50 Melties.  The good news: the defensive value of Melties is near unequalled.  The bad news: after splatting this many, you sometimes forget not to walk straight into the acid like an idiot.";
               }
               break;
            case "Kill 70 Biters":
               switch(Trait)
               {
                  case "Title":
                     return "Tooth Collector";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Career";
                  case "Description":
                     return "Awarded for splatting 70 Biters.  These little guys still kill you more than anything else don\'t they?";
               }
               break;
            case "Kill 50 Clutters":
               switch(Trait)
               {
                  case "Title":
                     return "Litterbug";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Career";
                  case "Description":
                     return "Awarded for splatting 50 Clutters.  Only the adult Clutters counted for this award.  Otherwise it would have been too easy.  Also the name wouldn\'t have made much sense.";
               }
               break;
            case "Kill 100 Stickies":
               switch(Trait)
               {
                  case "Title":
                     return "Custard";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Career";
                  case "Description":
                     return "Awarded for splatting 100 Stickies.  Mmmm... custard....";
               }
               break;
            case "Kill 1000 Glooples":
               switch(Trait)
               {
                  case "Title":
                     return "Exterminator";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Career";
                  case "Description":
                     return "Awarded for splatting 1000 Glooples.  At this point it should become clear that these are the most dangerous glooples in the game.  Tell me the \'Ooomph!\' noise doesn\'t strike a sense of impending doom in your heart.";
               }
               break;
            case "x2 Combo":
               switch(Trait)
               {
                  case "Title":
                     return "Good Combo";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Combo";
                  case "Description":
                     return "Awarded for splatting 2 glooples in a single swing.  Oh good job.  You probably did this on accident.";
               }
               break;
            case "x3 Combo":
               switch(Trait)
               {
                  case "Title":
                     return "Nice Combo";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Combo";
                  case "Description":
                     return "Awarded for splatting 3 glooples in a single swing.  If you want to score high, I suggest you make this a habit.  Multipliers FTW.";
               }
               break;
            case "x4 Combo":
               switch(Trait)
               {
                  case "Title":
                     return "Sweet Combo";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Combo";
                  case "Description":
                     return "Awarded for splatting 4 glooples in a single swing.  Starting to rack up the big-boy points.";
               }
               break;
            case "x5 Combo":
               switch(Trait)
               {
                  case "Title":
                     return "Awesome Combo";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Combo";
                  case "Description":
                     return "Awarded for splatting 5 glooples in a single swing.  Nice shot.  Only slightly less awesome is the \'three baby clutters and two green glooples\' combo, but hey, you still get the award.";
               }
               break;
            case "x6 Combo":
               switch(Trait)
               {
                  case "Title":
                     return "Sick Combo";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Combo";
                  case "Description":
                     return "Awarded for splatting 6 glooples in a single swing.  Now that\'s a great swing.  Opportunity knocked, and you slashed the crap out of it.";
               }
               break;
            case "x7 Combo":
               switch(Trait)
               {
                  case "Title":
                     return "Incredible Combo";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Combo";
                  case "Description":
                     return "Awarded for splatting 7 glooples in a single swing.  Even if you died right after this swing, you can mark that try down in the \'victory\' column.";
               }
               break;
            case "x8 Combo":
               switch(Trait)
               {
                  case "Title":
                     return "Unbelievable Combo";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Combo";
                  case "Description":
                     return "Awarded for splatting 8 glooples in a single swing.  What the... how do you even FIT eight glooples in one swing arc??  You cheated somehow didn\'t you... don\'t lie to me.";
               }
               break;
            case "20pt Swing":
               switch(Trait)
               {
                  case "Title":
                     return "Solid Swing";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Points";
                  case "Description":
                     return "Awarded for splatting 20 bounty worth of glooples in a single swing.  This should really be more of a staple than a ringing achievement.";
               }
               break;
            case "50pt Swing":
               switch(Trait)
               {
                  case "Title":
                     return "Big Swing";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Points";
                  case "Description":
                     return "Awarded for splatting 50 bounty worth of glooples in a single swing.  Pretty respectable whack there.";
               }
               break;
            case "75pt Swing":
               switch(Trait)
               {
                  case "Title":
                     return "Great Swing";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Points";
                  case "Description":
                     return "Awarded for splatting 75 bounty worth of glooples in a single swing.  One high point gloople and a couple extras in there as multiplier padding, and voila.";
               }
               break;
            case "100pt Swing":
               switch(Trait)
               {
                  case "Title":
                     return "Huge Swing";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Points";
                  case "Description":
                     return "Awarded for splatting 100 bounty worth of glooples in a single swing.  This swing alone gets you the first Score award.  That\'s a mighty fine swing.";
               }
               break;
            case "150pt Swing":
               switch(Trait)
               {
                  case "Title":
                     return "Massive Swing";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Points";
                  case "Description":
                     return "Awarded for splatting 150 bounty worth of glooples in a single swing.  A single-swing score like that shows some pretty deft tactics.  Either that or blind luck, but we\'ll go with the tactics thing.";
               }
               break;
            case "200pt Swing":
               switch(Trait)
               {
                  case "Title":
                     return "Brutal Swing";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Points";
                  case "Description":
                     return "Awarded for splatting 200 bounty worth of glooples in a single swing.  It\'s clear you have a very solid grasp of the scoring mechanisms in this game.  Now you just have to fight the urge to try and set up EVERY swing like this, or spend a lot of time restarting.";
               }
               break;
            case "300pt Swing":
               switch(Trait)
               {
                  case "Title":
                     return "Killer Swing";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Points";
                  case "Description":
                     return "Awarded for splatting 300 bounty worth of glooples in a single swing.  Now that\'s how you use a preposterously out-of-scale sword.  Cloud who.";
               }
               break;
            case "Score 100":
               switch(Trait)
               {
                  case "Title":
                     return "Novice";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Score";
                  case "Description":
                     return "Awarded for reaching a score of 100 in any mode.  Well it\'s a start.";
               }
               break;
            case "Score 200":
               switch(Trait)
               {
                  case "Title":
                     return "Apprentice";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Score";
                  case "Description":
                     return "Awarded for reaching a score of 200 in any mode.  Ah, Grasshoppa... you have much to learn.";
               }
               break;
            case "Score 350":
               switch(Trait)
               {
                  case "Title":
                     return "Hunter";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Score";
                  case "Description":
                     return "Awarded for reaching a score of 350 in any mode.  That number only seems high because you have no point of comparison.";
               }
               break;
            case "Score 500":
               switch(Trait)
               {
                  case "Title":
                     return "Warrior";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Score";
                  case "Description":
                     return "Awarded for reaching a score of 500 in any mode.  You\'re getting pretty good at this aren\'t you?";
               }
               break;
            case "Score 750":
               switch(Trait)
               {
                  case "Title":
                     return "Adept";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Score";
                  case "Description":
                     return "Awarded for reaching a score of 750 in any mode.  That\'s 10 times better than 75!!  ....what?";
               }
               break;
            case "Score 1000":
               switch(Trait)
               {
                  case "Title":
                     return "Expert";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Score";
                  case "Description":
                     return "Awarded for reaching a score of 1000 in any mode.  You have now distinguished yourself from the low scoring rabble.";
               }
               break;
            case "Score 1500":
               switch(Trait)
               {
                  case "Title":
                     return "Champion";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Score";
                  case "Description":
                     return "Awarded for reaching a score of 1500 in any mode.  Your little-ball-of-goo splattering skills are beginning to pay the bills.  Figuratively speaking.";
               }
               break;
            case "Score 2000":
               switch(Trait)
               {
                  case "Title":
                     return "Elite";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Score";
                  case "Description":
                     return "Awarded for reaching a score of 2000 in any mode.  Very impressive score.  Almost justifies how much time you\'ve spent playing with this doesn\'t it?";
               }
               break;
            case "Score 2500":
               switch(Trait)
               {
                  case "Title":
                     return "Hero";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Score";
                  case "Description":
                     return "Awarded for reaching a score of 2500 in any mode.  Wow that\'s a high score.  You\'re kind of a freak aren\'t you?";
               }
               break;
            case "Score 3000":
               switch(Trait)
               {
                  case "Title":
                     return "Legend";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Score";
                  case "Description":
                     return "Awarded for reaching a score of 3000 in any mode.  Holy crap, what are you a freakin\' Jedi?";
               }
               break;
            case "Jackpot":
               switch(Trait)
               {
                  case "Title":
                     return "Jackpot!";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Lucky";
                  case "Description":
                     return "Awarded for scoring a triple 7 score.  Big money, big money, no whammy, no whammy, STOP!";
               }
               break;
            case "Survive 1 min":
               switch(Trait)
               {
                  case "Title":
                     return "Alertness";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Survival";
                  case "Description":
                     return "Awarded for surviving 1 minute in Bounty Run mode.  Not really success so much as a lack of complete and utter failure.";
               }
               break;
            case "Survive 2 min":
               switch(Trait)
               {
                  case "Title":
                     return "Danger Sense";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Survival";
                  case "Description":
                     return "Awarded for surviving 2 minutes in Bounty Run mode.  You\'ve managed to move out of the way of danger a couple of times.  Go team go.";
               }
               break;
            case "Survive 3 min":
               switch(Trait)
               {
                  case "Title":
                     return "Threat Assessment";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Survival";
                  case "Description":
                     return "Awarded for surviving 3 minutes in Bounty Run mode.  Assuming you aren\'t a sissy and have your difficulty ramp on slow, then that\'s actually pretty good.  Otherwise, well... you\'re a sissy.";
               }
               break;
            case "Survive 4 min":
               switch(Trait)
               {
                  case "Title":
                     return "Sharp Reflexes";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Survival";
                  case "Description":
                     return "Awarded for surviving 4 minutes in Bounty Run mode.  Oh come on, it\'s only fun when it\'s hectic.";
               }
               break;
            case "Survive 5 min":
               switch(Trait)
               {
                  case "Title":
                     return "Keen Instincts";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Survival";
                  case "Description":
                     return "Awarded for surviving 5 minutes in Bounty Run mode.  Be honest, you lucked out a couple of times to make it this long didn\'t you?";
               }
               break;
            case "Survive 7 min":
               switch(Trait)
               {
                  case "Title":
                     return "Nerves of Steel";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Survival";
                  case "Description":
                     return "Awarded for surviving 7 minutes in Bounty Run mode.  It\'s about here that the panic attacks start to set in.  Hopefully you aren\'t playing in public so that you don\'t startle people when you spazz out.";
               }
               break;
            case "Survive 10 min":
               switch(Trait)
               {
                  case "Title":
                     return "Untouchable";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Survival";
                  case "Description":
                     return "Awarded for surviving 10 minutes in Bounty Run mode.  I can only assume that you\'ve reached some kind of ninth-level-zen-state to keep it going for a whole ten minutes.  There is no fear - there is only the Force";
               }
               break;
            case "Clear Long Nest":
               switch(Trait)
               {
                  case "Title":
                     return "Bragging Rights";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Clear";
                  case "Description":
                     return "Awarded for clearing a Huge Single Nest.  Roses are red.  Violets are blue.  All of my base are belong to you.";
               }
               break;
            case "Clear Normal Nest":
               switch(Trait)
               {
                  case "Title":
                     return "Mad Skills";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Clear";
                  case "Description":
                     return "Awarded for clearing a Big Single Nest.  Your name shall strike terror into the hearts of Glooples for ages to come.  If they had hearts.  Okay, into their goo, then.";
               }
               break;
            case "Clear Short Nest":
               switch(Trait)
               {
                  case "Title":
                     return "Victory!";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Clear";
                  case "Description":
                     return "Awarded for clearing a Small Single Nest.  That\'s two hundred less little multi-colored blobby things menacing your screen.  Well done.";
               }
               break;
            case "Clutter at Finish":
               switch(Trait)
               {
                  case "Title":
                     return "Purple Heart";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Heart";
                  case "Description":
                     return "Awarded for clearing a nest with a clutter still attached.  Look!  You have a new friend!  I think it likes you.";
               }
               break;
            case "Perfect Run":
               switch(Trait)
               {
                  case "Title":
                     return "Badass";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Skill";
                  case "Description":
                     return "Awarded for clearing a nest without a single error.  In other words, perfect.  Not a bump, not a slip, not a mistake.  Yeah, read the award... you\'re a Badass.  Incidentally, if you did this on any nest other than Small, I am humbled by your awesome.";
               }
               break;
            case "10 Deaths":
               switch(Trait)
               {
                  case "Title":
                     return "Persistant";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Deaths";
                  case "Description":
                     return "Awarded for being killed 10 times.  If at first you don\'t succeed... respawn.";
               }
               break;
            case "25 Deaths":
               switch(Trait)
               {
                  case "Title":
                     return "Determined";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Deaths";
                  case "Description":
                     return "Awarded for being killed 25 times.  \'It\'s okay, I had another guy!\'";
               }
               break;
            case "50 Deaths":
               switch(Trait)
               {
                  case "Title":
                     return "Dedicated";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Deaths";
                  case "Description":
                     return "Awarded for being killed 50 times.  Somewhere there\'s a tiny little graveyard full of your failures.";
               }
               break;
            case "100 Deaths":
               switch(Trait)
               {
                  case "Title":
                     return "Tireless";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Deaths";
                  case "Description":
                     return "Awarded for being killed 100 times.  At some point you have to wonder where all these little giant-sword wielding bald guys are coming from.";
               }
               break;
            case "Died 5 Ways":
               switch(Trait)
               {
                  case "Title":
                     return "Bloodletter";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Deaths";
                  case "Description":
                     return "Awarded for being killed 5 different ways.  Variety is the spice of life.  Also, apparently, horrible messy death.";
               }
               break;
            case "Died 10 Ways":
               switch(Trait)
               {
                  case "Title":
                     return "Gorehound";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Deaths";
                  case "Description":
                     return "Awarded for being killed 10 different ways.  Burned, bisected, bitten, melted, impaled, shattered, mauled and beheaded.  And your insurance premiums are probably none-too-pretty either.";
               }
               break;
            case "Died 15 Ways":
               switch(Trait)
               {
                  case "Title":
                     return "Splatterbait";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Deaths";
                  case "Description":
                     return "Awarded for being killed 15 different ways.  Congratulations, you\'ve been dispatched pretty much every possible way.  Great job kindof.";
               }
               break;
            case "Ambush":
               switch(Trait)
               {
                  case "Title":
                     return "Unfortunate";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Deaths";
                  case "Description":
                     return "Awarded for being killed by a Biter as it leaps from offscreen.  On the bright side, you got this award!";
               }
               break;
            case "5 min Playtime":
               switch(Trait)
               {
                  case "Title":
                     return "Test Drive";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Time";
                  case "Description":
                     return "Awarded for playing the game 5 minutes total.  No one can say you didn\'t give it a fair shake.";
               }
               break;
            case "10 min Playtime":
               switch(Trait)
               {
                  case "Title":
                     return "Kinda Fun";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Time";
                  case "Description":
                     return "Awarded for playing the game 10 minutes total.  Yeah, you know you like it.";
               }
               break;
            case "20 min Playtime":
               switch(Trait)
               {
                  case "Title":
                     return "Casual Interest";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Time";
                  case "Description":
                     return "Awarded for playing the game 20 minutes total.  Admit it.  You like it.";
               }
               break;
            case "30 min Playtime":
               switch(Trait)
               {
                  case "Title":
                     return "Spare Time";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Time";
                  case "Description":
                     return "Awarded for playing the game 30 minutes total.  Well if there are awards to collect, that\'s kinda cool...";
               }
               break;
            case "45 min Playtime":
               switch(Trait)
               {
                  case "Title":
                     return "Commitment";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Time";
                  case "Description":
                     return "Awarded for playing the game 45 minutes total.  See now you\'re trying to see everything.  You\'re mine now.";
               }
               break;
            case "60 min Playtime":
               switch(Trait)
               {
                  case "Title":
                     return "Addiction";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Time";
                  case "Description":
                     return "Awarded for playing the game an hour total.  This is the point at which you should be worried about how much you\'ve played this little game.";
               }
               break;
            case "90 min Playtime":
               switch(Trait)
               {
                  case "Title":
                     return "Completionist";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Time";
                  case "Description":
                     return "Awarded for playing the game an hour and a half total.  You won\'t be happy until you have everything, will you?";
               }
               break;
            case "Practice 10 min":
               switch(Trait)
               {
                  case "Title":
                     return "Academic";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Time";
                  case "Description":
                     return "Awarded for spending 10 minutes total in Practice mode.  The pen is mightier than the sword.  Except in this game.  Cuz there\'s no pen.  And the sword is really big.";
               }
               break;
            case "2 minute Pause":
               switch(Trait)
               {
                  case "Title":
                     return "Absentee";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Time";
                  case "Description":
                     return "Awarded for pausing for 2 full minutes.  I hope you washed your hands.";
               }
               break;
            case "Next Song 5 Times":
               switch(Trait)
               {
                  case "Title":
                     return "Picky";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Time";
                  case "Description":
                     return "Awarded for changing to a new song 5 times in one play.  What are you looking for?  More cowbell?";
               }
               break;
            case "Smother 10 Fires":
               switch(Trait)
               {
                  case "Title":
                     return "Firefighter";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Skill";
                  case "Description":
                     return "Awarded for putting out 10 little Torchie fires.  Either you actually read the tips (yeah... right) or you stumbled across this on accident.  Either way, Smokey the Bear thanks you.";
               }
               break;
            case "30 Secs Without Swinging":
               switch(Trait)
               {
                  case "Title":
                     return "Pacifist";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Time";
                  case "Description":
                     return "Awarded for not swinging for 30 seconds.  Why were you doing this?  Did you fall asleep?  Have you played so much that you were just seeing how long you could go?  Or did you suspect that there was an award for this?  ...I\'m on to you.";
               }
               break;
            case "Survive Blackout":
               switch(Trait)
               {
                  case "Title":
                     return "Blindsight";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Survival";
                  case "Description":
                     return "Awarded for surviving being blinded by an Inkie.  Tends to be one of those \'move the mouse around randomly and hope for the best\' situations.";
               }
               break;
            case "Survive Fire":
               switch(Trait)
               {
                  case "Title":
                     return "Burn Ward";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Survival";
                  case "Description":
                     return "Awarded for being lit on fire and managing to survive.  You DO read the tips!!  I\'m so proud of you.  Also, I must admit that I find nothing quite so hilarious as the little dude scampering around on fire.";
               }
               break;
            case "Survive Ice":
               switch(Trait)
               {
                  case "Title":
                     return "Frostbitten";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Survival";
                  case "Description":
                     return "Awarded for breaking out of Frostie ice before being killed.  Hypothermia apparently not a big issue when your life expectancy is around three minutes.";
               }
               break;
            case "Survive Explosion":
               switch(Trait)
               {
                  case "Title":
                     return "Demolition";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Survival";
                  case "Description":
                     return "Awarded for surviving an explosion.  Bonus points if you actually SAW the explosion about to happen and ran for the hills, rather than the much more likely \'Holy Cow What Happened\' scenario.";
               }
               break;
            case "Blind Kill":
               switch(Trait)
               {
                  case "Title":
                     return "Zen Master";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Skill";
                  case "Description":
                     return "Awarded for getting a kill while blinded.  Zatoichi would be proud.  ...too obscure?  He\'s a fictional blind japanese swordsman.  Now that I\'ve explained it it\'s much less cool a reference.";
               }
               break;
            case "Fling Sharp":
               switch(Trait)
               {
                  case "Title":
                     return "Passive Aggressive";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Skill";
                  case "Description":
                     return "Awarded for knocking a sharp out of bounds.  They say Coward, I say Effective Threat Management.  Tomato, Tomahto.";
               }
               break;
            case "Sharp as Weapon":
               switch(Trait)
               {
                  case "Title":
                     return "Guerilla Tactics";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Skill";
                  case "Description":
                     return "Awarded for knocking a sharp into another gloople.  Fight fire with fire.  And fight little blobs with other sharp, pointy blobs.";
               }
               break;
            case "10 Straight Combos":
               switch(Trait)
               {
                  case "Title":
                     return "Blade Master";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Skill";
                  case "Description":
                     return "Awarded for scoring 10 consecutive combo kills.  Precise, efficient and deadly.  Without a single wasted swing, you have proved that your kung-fu is indeed strong.";
               }
               break;
            case "5 Queen Misses":
               switch(Trait)
               {
                  case "Title":
                     return "Duelist";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Skill";
                  case "Description":
                     return "Awarded for dodging or deflecting 5 of a Queen\'s attacks.  Admittedly a protracted battle is not really what you want with a Queen, but the bob and weave, parry and thrust technique certainly makes for a good show.";
               }
               break;
            case "Push Clutter":
               switch(Trait)
               {
                  case "Title":
                     return "Bully";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Skill";
                  case "Description":
                     return "Awarded for forcing a Clutter out of the play area without swinging.  You\'re mean.";
               }
               break;
            case "Shave Fuzzle 3 Times":
               switch(Trait)
               {
                  case "Title":
                     return "Clean Shave";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Skill";
                  case "Description":
                     return "Awarded for shaving off all one Fuzzle\'s fuzz three times.  Seriously, you couldn\'t spare ONE more swing in there somewhere?";
               }
               break;
            case "4 Color Splats":
               switch(Trait)
               {
                  case "Title":
                     return "Impressionist";
                  case "Medal":
                     return "Gold";
                  case "Ribbon":
                     return "Skill";
                  case "Description":
                     return "Awarded for splatting 4 different types of Glooples in a single swing.  Not just instant abstract art, but also one of the toughest achievements in the whole game.  Congratulations.";
               }
               break;
            case "30 Bumps":
               switch(Trait)
               {
                  case "Title":
                     return "Accident Prone";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Hazard";
                  case "Description":
                     return "Awarded for getting bumped 30 times.  Maybe you should consider actually moving out of the way from time to time.  Just a thought.";
               }
               break;
            case "50 Sparks":
               switch(Trait)
               {
                  case "Title":
                     return "Till It Breaks";
                  case "Medal":
                     return "Silver";
                  case "Ribbon":
                     return "Hazard";
                  case "Description":
                     return "Awarded for sparking against a hard target 50 times.  Surprisingly, the Splatmaster 3000\'s warranty excludes beating it against giant homicidal boulders and swatting metallic spikey balls with it.  Not exactly comprehensive coverage.";
               }
               break;
            case "Bogged by Clutters":
               switch(Trait)
               {
                  case "Title":
                     return "Friendly";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Hazard";
                  case "Description":
                     return "Awarded for being completely bogged down in clutters.  It\'s good to feel loved.  Suffocation, not as good.";
               }
               break;
            case "Stuck 1 Minute":
               switch(Trait)
               {
                  case "Title":
                     return "Dirty Job";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "Hazard";
                  case "Description":
                     return "Awarded for spending a total minute stuck in Stickie goo.  You\'ll be finding Gloople snot in strange places for weeks now.  And for that lovely visual image, you\'re welcome.";
               }
               break;
            default:
               switch(Trait)
               {
                  case "Title":
                     return "Unknown";
                  case "Medal":
                     return "Bronze";
                  case "Ribbon":
                     return "First";
                  case "Description":
                     return "Award Identifier Unknown";
               }
         }
         return null;
      };
      _global.AwardDatabaseLoaded = true;
   }
}
