/// @desc shooterstateFree(rad)
/// @arg0 rad

var r = argument0;

image_index = 0;

if(handleGrabbed(r)) {
	image_index = walk_cycle_end;
	image_speed = 1;
	createBlood(random_range(5, 15), x, y, 360 - grabbedDir);
	state = SHOOTERSTATE.GRABBED;
}