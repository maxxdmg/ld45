/// @desc oozestateReh()

// handle grabber back to start
if (obj_grabber.numArms <= 0) {	
	instance_destroy(obj_grabber);
	state = OOZESTATE.FREE;
	return;

// remove arm
} else {
	var prevArm = obj_grabber.prevArm;
	
	// double check there is a previous arm
	if (prevArm < 0) {
		return;
	}
	
	with(obj_grabber) {
		obj_grabber.prevArm = prevArm.prevArm;
		numArms -= 1;
		x = prevArm.x;
		y = prevArm.y;
		instance_destroy(prevArm);
	}	
}