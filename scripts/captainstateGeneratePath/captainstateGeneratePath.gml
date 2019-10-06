/// @desc captainstateGeneratePath()

if (pathDelay < 0) {
	pathDelay = 50;
	state = CAPTAINSTATE.LEAD;
	return;
}

tarx = obj_ooze.x;
tary = obj_ooze.y;
pathDelay--;