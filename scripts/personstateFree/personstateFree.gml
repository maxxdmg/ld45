/// @desc personstateFree(rad)
/// @arg0 rad

var r = argument0;

image_index = image_index % walk_cycle_end;
image_speed = 1;

// handle getting grabbed
if(handleGrabbed(r)) {
	// make blood splatter
	createBlood(random_range(5, 15), x, y, 360 - grabbedDir);
	
	state = PERSONSTATE.GRABBED;
}