"Passenger" by Erin Hoffman-John

Include Vorple by Juhana Leinonen.
Include Vorple Screen Effects by Juhana Leinonen.

Release along with the "Vorple" interpreter.
Release along with style sheet "passenger.css".

When play begins, say "In the beginning there is infinite possibility. We all begin in darkness; without light there is no time, only waiting.[paragraph break][italic type]In this game, you [bold type]type words[roman type][italic type] using your keyboard. If you'd like a hint, type [bold type]hint[roman type][italic type] and press enter. For a list of commands, type [bold type]commands."

Commanding is an action applying to nothing. Understand "commands" or "command" as commanding. Instead of commanding:
	say "There are lots of commands. Some of the important ones for this game are:[paragraph break][bold type]inventory[roman type] - check what you're carrying;[line break][bold type]take (thing)[roman type] - try to pick something up (also 'get' or 'pick up');[line break][bold type]look at (thing)[roman type] - inspect something - sometimes things are hidden!;[line break][bold type]go (place)[roman type] - move in a direction (north, south, east west), or into something (such as a cave);[line break][bold type]hint[roman type] - get a hint about how to solve one of the puzzles;[line break]".
	
Hinting is an action applying to nothing. Understand "hint" as hinting. Instead of hinting:
	if Intro is true:
		say "You're just getting started! Try [bold type]look at light[roman type] to look at the lights. You can also look at the darkness, the stars, or the horizon here.";
	otherwise:
		say "This is the elaborate hint system.".

Definition: a container is empty if the number of things in it is zero.
Definition: a container is full if the number of things in it is greater than four.

Emptiness is a room. The description is "A vast darkness extends in all directions. Distantly, blurry motes of light seem to float on the horizon -- or it might be a trick of your eyes. [paragraph break][if intro is false]A glowing portal leads to another world.[else] There are no obvious exits."

Some stars is a backdrop. It is in the Emptiness, Island North, Island Center, Island South, Island East, and Island West. Understand "stars" or "star" or "sky" as the stars. The description is "Whirling galaxies and winking stars extend as far as you can see." Instead of tasting the stars: say "You open your mouth and imagine that you can taste the ancient stars. Kind of metallic."

Horizon is a backdrop. It is in the Emptiness, Island North, Island Center, Island South, Island East, and Island West. The description is "The darkness beyond is limitless." Instead of tasting the horizon: say "Faintly choclatey."

A thing is either discovered or undiscovered. A thing is usually discovered.

Beckoning is an action applying to one thing. Understand "beckon [something]" as beckoning.

A light is a thing in Emptiness. It is scenery. Understand "motes" as a light. The description is "Tiny motes of light float just at the edges of your vision. It's hard to tell if they're there at all.".

A darkness is a thing in Emptiness. It is scenery. The description is "Darkness extends in all directions, the beginning of all things.". Instead of tasting the darkness: say "Faintly choclatey."

Instead of touching a light:
	if Intro is true:
		if BeckonCount is 0:
			say "The lights are far too far away to touch.";
		else if BeckonCount is 1:
			say "One of the lights is a bit closer, but still too far away to touch.";
		else if BeckonCount is 2:
			say "The light is almost close enough to touch, but when you stretch out your arm, it dances away from your fingertips.";
		else:
			say "You stretch out your hand and brush the light with your fingertips.[paragraph break]The light shimmers close, weaves one little loop around you, then gathers at your feet. It pools upward, forming a cup, and finally a vessel.";
			now a vessel is in Emptiness;
			now the description of a light is "Tiny lights are still visible in the distance, but you'll be unable to summon more until this vessel is completed.";
	else:
		say "You stretch out your hand toward the distant lights, but nothing happens.".

Instead of taking a light:
	if BeckonCount is less than 2: 
		say "The lights are small and elusive. They might respond to [bold type]beckon[roman type]ing.";
	else:
		try touching a light.
		
Instead of pulling a light, say "How would you pull something you can't touch?".

Instead of beckoning a light:
	if Intro is true:
		if BeckonCount is 0:
			say "You gesture invitingly toward the light. It pauses in midair, then, very distinctly, it draws closer.";
			now the description of the light is "One of the little motes of light has drawn closer to you. It could be beckoned even closer.";
			now BeckonCount is 1;
		else if BeckonCount is 1:
			say "You beckon the light closer again. Again it grows still, seeming to watch you. In its stillness it seems suddenly alive.[paragraph break]After a long moment, the light again swings closer to you.";
			now the description of the light is "One of the motes of light is now quite close to you. It isn't close enough to touch, but it looms larger than the others that still twinkle in the distance.";
			now BeckonCount is 2;
		else if BeckonCount is 2:
			say "The light seems less hesitant now, and it's grown larger. Now when you beckon it seems to have been waiting for your gesture, and it immediately floats closer to your hand, near enough to touch.";
			now the description of the light is "One of the motes of light is now very close -- close enough to touch.";
			now BeckonCount is 3;
		else:
			say "You beckon again, but the light is already as close as it will dare to come. It loops around you again, close enough to [bold type]touch[roman type].";
	else:
		say "You beckon the distant lights, but they do not respond. The vessel at your feet pulses grumpily.".

A vessel is a container. The description is "The vessel seems to be made from starglass, bright and translucent. Despite the darkness it seems to radiate a gentle light of its own.[if a vessel is not empty] Nebulous colors swirl within the vessel.[else] The vessel is achingly empty. Perhaps you could search for objects to put inside it."

Instead of taking a vessel, try touching a vessel.

Instead of touching a vessel:
	if a vessel is not full:
		if intro is true:
			say "Your hands pass through the vessel, and there's another bright flash. When it fades, a glowing portal has opened to the east, leading to another world.";
			now intro is false; 
		else:
			say "You grasp the vessel and a gentle electric shock pulses through your body. The glowing portal pulses with it, beckoning you.";
	else:
		say "The colors inside the vessel begin to swirl around each other. They move faster and faster until they begin to blur together. When finally they merge, there is a great flash.";
		say "(There would be a picture of the sonogram here.)";
		end the story.
		
A glowing portal is east of Emptiness and west of Island North. It is a door. 

Island North is a room with printed name "A Grassy Island, North End". The description is "The north end of the island descends into starlight. From the knee-high grasses here one can look out at the infinite stars.[paragraph break]A path south leads to the center of the island."

A shadowy vessel is a thing in island north. Instead of taking a shadowy vessel:
	say "The darkness darkens, and when it brightens again, you are somewhere else.";
	move the player to Emptiness.
Instead of touching a shadowy vessel, try taking a shadowy vessel.
Instead of inserting something into a shadowy vessel:
	say "You reach toward the shadowy vessel, and the world moves.";
	try taking a shadowy vessel.

An alabaster monument is a thing in island north. Instead of taking an alabaster monument, say "It is far too large and heavy to carry.". The description is "An alabaster obelisk rising up from the grass, the monument is inscribed with an infinity knot inlaid with shining garnet tiles. Each tile seems to glow from within, reflecting the light of the stars overhead.".

A garnet tile is a thing. The description is "This blood red stone tile seems to have stored starlight within it; it glows subtly.".

An infinity knot is a thing in island north. It is scenery. The description is "Carved into the alabaster monument, the knot never ends. Your eyes trace it again and again, but it winds in upon itself, lined with star-glittering garnet tiles.".

After examining an alabaster monument for the first time:
	say "As you inspect the monument, one of the tiles falls away from the infinity knot and lands on the ground.";
	now a garnet tile is in the location of the player.

A piece of the infinite is a thing with printed name "a piece of the infinite". Instead of taking infinite, say "The infinite is everywhere." The description is "A faint shade of celestial blue, the piece of the infinite dances around the sides of the vessel."

Instead of inserting the garnet tile into a vessel:
	say "You drop the tile into the vessel.[paragraph break]As the garnet tile descends into the vessel, it seems to slow, and slow, and slow -- and finally stop entirely. Light explodes outward from the inside of the gem, radiating outward until it illuminates the vessel in a near-blinding glow.[paragraph break]There is a piece of the infinite in the vessel now.";
	now a piece of the infinite is in a vessel;
	remove a garnet tile from play;
	if a vessel is full:
		say "[paragraph break]* * *[paragraph break]";
		try taking a vessel.

Island Center is a room with printed name "A Grassy Island, Center". It is south of Island North. The description is "The island rises to its zenith here in the center, marked by a tiny stand of redwood trees. [paragraph break]Worn paths lead north (back to the portal), south, east, and west from here."

Some trees is a supporter in Island Center. It is scenery. The description is "A sudden narrow stand of redwoods erupts out of the ground at the center of the island. On one low slung branch of the nearest tree, you can see a nest made of twigs." 

A nest is a container. The description is "This nest was well maintained at one time, but its occupants have migrated elsewhere." Instead of taking a nest, say "The owners might return next season, and you wouldn't want to take their house.".

A feather is a thing in a nest. The description is "It's a long, slim red feather, grey at the tip. It looks like it came from a sparrow of some kind."

Hope is a thing with printed name "hope for the future". Instead of taking hope, say "You take hope, and more remains to fill it in the vessel." The description is "A faint shade of rose pink, the light of hope for the future flits around inside the vessel."

Instead of inserting the feather into a vessel:
	say "You drop the feather into the vessel.[paragraph break]As the feather slips down past the edge of the starglass, it dissolves into a shadow that then inverts itself into light.[paragraph break]There is some hope in the vessel now.";
	now a hope is in a vessel;
	remove a feather from play;
	if a vessel is full:
		say "[paragraph break]* * *[paragraph break]";
		try taking a vessel.

After examining some trees:
	now a nest is on the trees.
	
Island East is a room with printed name "A Grassy Island, East End". It is east of Island Center. The description is "Sheltered from the star winds, this end of the island has a twilight tranquility. A gazebo looks out into the stars, surrounded by carefully manicured grass. [paragraph break]A path leads west back to the center of the island from here."

A gazebo is a thing in Island East. It is scenery. The description is "Spotlessly painted and cleaned, this gleaming white gazebo has been painstakingly cared for. The only thing marring the perfection of this end of the island is a mound of dirt a few feet away from the gazebo's base.".

A mound of dirt is a container. The description is "There is a pile of soil upturned in the otherwise immaculate grass, as if someone intended to plant something here." Instead of taking a mound of dirt, say "You pick up a handful of dirt, but it just sifts through your fingers."

After examining a gazebo:
	now a mound of dirt is in Island East.

A pedestal is a supporter in Island East.  Instead of taking a pedestal, say "You nudge at it, but it is too heavy to move."

A cloisonne pot is a container on a pedestal. The description is "[if a cloisonne pot is empty]The pot is elaborately painted in red and gold enamel with a polished copper rim. The porcelain inside is now empty except for a dusting of dirt. It seems stuffy and suffocating.[otherwise]The exquisitely painted pot contains a bonsai plant. Both are beautiful, but the plant seems to be straining at its confines.".

Instead of inserting a cloisonne pot into a vessel, say "The pot won't fit into the vessel. You'd have to drop and break it to make any of it fit.".

Some cloisonne shards is a thing. Understand "shard" as shards. The description is "These fragments were once a beautiful cloisonne pot."

A tattered bonsai is a thing. The description is "This battered plant looks as though it has been violently dropped inside a hard object.".

Instead of dropping a cloisonne pot:
	say "You tip your hand over and drop the cloisonne pot from a respectable height. It smashes into the ground quite satisfactorily, leaving only a handful of shards.";
	now some cloisonne shards is in the location of the player;
	if a plant is in the cloisonne pot:
		remove a bonsai plant from play;
		now a tattered bonsai is in the location of the player;
	remove a cloisonne pot from play.

A bonsai plant is a thing in a cloisonne pot. The description is "[if a bonsai plant is inside a cloisonne pot]This bonsai juniper has delicate leaves and an elegantly curving trunk. Its roots rise out of its small pot of soil, lifting it, straining against the lacquered sides.[otherwise]The bonsai has been removed from its confining pot. Its roots reach outward from the soil, searching for security and nutrients.".

Instead of inserting a bonsai plant into a vessel, say "You wouldn't want to put something living into the vessel.".

A relinquished control is a thing with printed name "some relinquished control". Instead of taking control, say "Once you've released control into the vessel, you can't take it back again." The description is "Relinquished contol spins joyfully inside the vessel."

Instead of inserting the cloisonne shards into a vessel:
	say "You drop the cloisonne shards into the vessel.[paragraph break]As the shards fall into the vessel, they whirl apart from each other in a wild release, then flash into pure light.[paragraph break]Control has been relinquished into the vessel now.";
	now a relinquished control is in a vessel;
	remove some cloisonne shards from play;
	if a vessel is full:
		say "[paragraph break]* * *[paragraph break]";
		try taking a vessel.

A planted bonsai is a thing. The description is "The bonsai seems to be luxuriantly stretching its roots into the rich soil. The cloisonne pot looks quite empty and possibly a touch annoyed." Instead of taking a planted bonsai, say "After going to all the trouble of planting it, it'd be a shame to rip it out of the ground.".

Planting is an action applying to one thing. Understand "plant [something]" as planting. Instead of planting something:
	if the player is not in Island East:
		say "There is nowhere to plant anything here.";
	otherwise if a mound of dirt is not in Island East:
		say "You could rip up the grass to plant the bonsai, but that might be destructive. You need some dirt to plant it in. Maybe you can find some around here.";
	otherwise if the noun is a plant:
		if the plant is in the cloisonne pot:
			say "You can't really plant it while it's in the pot.";
		otherwise if the player has the plant:
			say "You kneel down next to the mound of dirt and carefully plant the bonsai in it.  [paragraph break]When its roots are securely planted, you stand and brush the dirt from your hands.";
			now a planted bonsai is in Island East;
			remove the plant from play;
			remove a mound of dirt from play;
	otherwise:
		say "That doesn't seem like an appropriate thing to plant.".

Island South is a room with printed name "A Grassy Island, South End". It is south of Island Center. The description is "A mirror for the north end of the island, the south end too rolls downward and gradually vanishes into darkness. The grasses here rise and fall in gentle hummocks. [paragraph break][if a hummock is undiscovered]A path leads north back to the center of the island from here. [else]A narrow trace leads down into a subterranean cave, while another path leads north, back to the center of the island."

Instead of going down from Island South:
	if a hummock is undiscovered:
		say "You can't go that way.";
	else:
		move the player to Underground.

Underground is a room with printed name "A Grassy Island, Subterranean Cave". It is down of Island South. The description is "Light filters down from the grass-fringed opening of the tunnel. Soil and packed dirt give way to rock as the cave winds to the north. [paragraph break]A path leads north, deeper into the cave, from here, or you can go up exit the cave.". Instead of going south from underground, try going up.

Underground deeper is a room with printed name "A Grassy Island, Subterranean Cave". It is north of Underground. The description is "The cave ends here in a rounded wall. A fox has made its nest here. [paragraph break]The only way out is south, back to the cave's entrance."

A growling fox is an animal in underground deeper. The description is "You have cornered a female fox. She crouches, snarling, protecting the pups behind her."

After examining a fox for the first time, now some fox pups is in underground deeper. 

Some fox pups is an animal. The description is "A group of five young pups huddles behind the fox mother. One fox is bright-eyed and sharp; another is rotund; another seems to be missing one eye; the fourth is unremarkable; and the last has a quiet intelligence.". Instead of taking the fox pups, try examining the fox pups.

A granite pebble is a thing. The description is "This mottled stone came from the wall of a cave.".

Unconditional love is a thing with printed name "unconditional love". Instead of taking love, say "You think about the fox pups, and you love them." The description is "A brave scarlet light streaks desperately back and forth inside the vessel."

Instead of inserting a granite pebble into a vessel:
	say "You drop the pebble into the vessel.[paragraph break]The pebble bounces wildly off the sides of the vessel, unpredictable. With each bounce it gains a bit of speed, until finally it is flying, streaking.[paragraph break]A determined unconditional love bounces around the vessel now.";
	now unconditional love is in a vessel;
	remove a granite pebble from play;
	if a vessel is full:
		say "[paragraph break]* * *[paragraph break]";
		try taking a vessel.

After examining a fox pups for the first time:
	say "As you peer closely at the pups, the mother fox snarls viciously again and hops at you, dislodging a pebble from the wall beside her.";
	now a granite pebble is in underground deeper.

A hummock is a thing in Island South. It is scenery and undiscovered. Understand "grasses" and "hummocks" as hummock. The description is "As you part the fragrant grasses of one of the hummocks, you discover a tunnel leading down into a cave.".

A cave is a thing. The description is "A gap between the grass hummocks reveals a tunnel that leads down into the underground." Understand "tunnel" as cave. Instead of entering a cave, try going down. 

After examining a hummock:
	now a hummock is discovered;
	now a cave is in Island South.

Island West is a room with printed name "A Grassy Island, West End". It is west of Island Center. The description is "The ground rises here into an angled precipice of stacked stone that looks out into the sky. Perched on the edge of the precipice is a brass telescope, trained on a distant blue planet.[paragraph break]A path leads east back to the center of the island from here.".

A brass telescope is a container in Island West. The description is "A long tube of brass punctuated by focusing rings is pointed at a tiny blue dot in the distant sky. Within the telescope is a series of lenses.". Instead of using a telescope, try searching a telescope.

Instead of searching a brass telescope:
	say "You train the telescope on the blue planet. Far, far below, you see [one of]a family eating dinner[or]a boy playing fetch with a dog[or]a man holding up a convenience store with a gun[or]a couple shouting at each other[or]a long table of world leaders discussing a conflict[or]a group of women gathering rice[or]a jet fighter blasting across the sky[or]a girl constructing a robot[then at random].".
	
Instead of taking a brass telescope, say "It is bolted to the precipice, probably for stability.".
	
Using is an action applying to one thing. Understand "use [something]" as using. 

A glass lens is a thing in a brass telescope. The description is "This glass lens has been used many times to look down on Earth from here.". 

Faith in humanity is a thing with printed name "faith in humanity". Instead of taking faith, say "A gentle sense of faith in humanity fills you." The description is "A steady golden light pulses its faith in humanity inside the vessel."

Instead of inserting a glass lens into a vessel:
	say "You drop the glass lens into the vessel.[paragraph break]It falls, spinning, into the glowing depths. It spins faster and faster until it becomes a sphere of golden light.[paragraph break]Faith in humanity fills the vessel now.";
	now faith in humanity is in a vessel;
	remove a glass lens from play;
	if a vessel is full:
		say "[paragraph break]* * *[paragraph break]";
		try taking a vessel.
		
Instead of opening a brass telescope:
	if a brass telescope is open:
		say "It's already open.";
	otherwise:
		say "You carefully unscrew the brass cuff at the far end of the telescope.";
		now a brass telescope is open.
		
Instead of closing a brass telescope:
	if a brass telescope is closed:
		say "It's already closed.";
	otherwise:
		say "You carefully screw the brass cuff at the far end of the telescope back down, closing it.";
		now a brass telescope is closed.

[ Enivronmental messages ] 

CountingTurns is a truth state that varies. CountingTurns is false.

TurnCount is a number that varies. TurnCount is 0.

Intro is a truth state that varies. Intro is true.

OpeningCount is a number that varies. OpeningCount is 0.

BeckonCount is a number that varies. BeckonCount is 0.

Every turn:
	if Intro is true:
		now OpeningCount is OpeningCount plus one;
		if OpeningCount is greater than 2:
			if a random chance of 1 in 2 succeeds:
				if BeckonCount is less than 1:
					say "A gentle light glimmers in the distance. You might [bold type]beckon[roman type] it.";
				else if BeckonCount is 1:
					if a random chance of 1 in 10 succeeds:
						say "The light whisks away into the distance.";
						now BeckonCount is 0;
					else:
						say "One of the lights has danced closer, but it still shies away from you. You could try beckoning it closer again.";
				else if BeckonCount is 2:
					say "The gentle light is quite close. You could almost reach out and [bold type]touch[roman type] it, but not quite.";
				else:
					say "The gentle light swings in little figure eights through the air, passing close enough to [bold type]touch[roman type].";
	else:
		if CountingTurns is true:
			now TurnCount is TurnCount plus one;
		if a random chance of 1 in 10 succeeds:
			if Intro is true:
				if BeckonCount is 0:
					say "[italic type]Try beckoning the light. Type: [bold type]beckon light[roman type].";
				else if BeckonCount is less than 3:
					say "[italic type]The light wants to be beckoned some more.[roman type]";
				else:
					say "[italic type]Try touching the light.[roman type]".

[ little text game out conceiving something

An idea, like birth

Beckon - 3 times -- DONE
Invite
Welcome
Nest

Game gradually tells you what verbs you can use by indicating in bold

You find hope in a bird’s  nest (it's a feather) -- DONE
You crawl into a cave and find a fox protecting its litter - the litter is a mix of excellent and limited - you find unconditional love (it's a pebble) -- DONE
You relinquish control by dropping something representing control -- DONE
Bonsai pot that represents control - remove the plant and plant it - drop the pot to break it -- DONE
a garnet tile from an infinity knot on an alabaster statue that makes a piece of the infinite -- DONE
a lens from a telescope that becomes faith in humanity -- DONE


Simple puzzle where you have to collect things and melt them together, and then you get the us

Hope for the future
Faith in humanity
A piece of the infinite
Relinquishing control
Unconditional love

===

We all begin in darkness. Without light there is no time.
(wait three turns)
Eventually, a light beckons. 



notes:
	if there's time, make a light object for the opening
	transfer hint system to something activated actively (type 'hint')
	add a score
	add a wait count to respond to waiting at the beginning of the game with flavor text


]