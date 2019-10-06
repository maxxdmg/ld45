/// @desc itemstateFree(rad)
/// @arg0 rad

var r = argument0;

if(handleGrabbed(r)) {
	image_speed = 1;
	
	// check if hydrant
	if (hydrant) createWater(random_range(10, 18), x, y, 360 - grabbedDir);
	
	state = ITEMSTATE.GRABBED;
}