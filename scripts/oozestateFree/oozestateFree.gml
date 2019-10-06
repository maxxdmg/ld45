/// @desc oozestateFree()

var hSpeed = right - left;
var vSpeed = up - down;

// handle moving
if (hSpeed != 0 || vSpeed != 0) {
	var len = moveSpeed + 5;
	var dir = point_direction(x, y, x + len * hSpeed, y - len * vSpeed);
	handleMovement(len, dir);
}

// handle reach
if (reach) {
	state = OOZESTATE.REACH;
	
	// make grabber
	with (instance_create_layer(x, y, "Ooze", obj_grabber)) {
		direction = other.direction;
		image_angle = point_direction(x, y, mouse_x, mouse_y);
	}
	
	return;
}