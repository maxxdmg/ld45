/// @desc oozestateReach()

var dir = point_direction(x, y, mouse_x, mouse_y);

// handle grabber hitting max arm length
if (obj_grabber.numArms >= reachLength) {
	
	// shift grabber one more time
	with(obj_grabber) {		
		// shift the grabber to next spot
		x = x + lengthdir_x(sprite_width / 2, dir);
		y = y + lengthdir_y(sprite_height / 2, dir);
	}
	
	state = OOZESTATE.RECOIL;
	return;

// make arm
} else {
	var newArm = instance_create_layer(obj_grabber.x, obj_grabber.y, "Ooze", obj_arm);
	
	// init new arm like a linked list
	newArm.prevArm = obj_grabber.prevArm;
	newArm.direction = dir;
	newArm.image_angle = dir;
	
	with(obj_grabber) {
		prevArm = newArm;
		numArms += 1;
		
		// shift the grabber to next spot
		x = x + lengthdir_x(sprite_width / 2, dir);
		y = y + lengthdir_y(sprite_height / 2, dir);
	}
	
}