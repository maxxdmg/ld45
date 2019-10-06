/// @desc personStateWanderSquare()


// handle flee
if (handleDetect(50)) {
	state = PERSONSTATE.FLEE;
	return;
}

// handle movement
if (image_index > walk_cycle_end) image_index = walk_cycle_start;

var len = moveSpeed;
var dir = point_direction(x, y, tarx, tary);
handleMovement(len, dir);

var dist = point_distance(x, y, tarx, tary);
if (dist < 5) {
	direction = (direction + 90) % 360;
	len = 50;
	
	switch(direction) {	
		case 90:
			tarx = x + lengthdir_x(0, direction);
			tary = y + lengthdir_y(len, direction);
			break;
		case 180:
				tarx = x + lengthdir_x(len, direction);
				tary = y + lengthdir_y(0, direction);	
			break;
		case 270:
			tarx = x + lengthdir_x(0, direction);
			tary = y + lengthdir_y(len, direction);
			break;
		case 0:
			tarx = x + lengthdir_x(len, direction);
			tary = y + lengthdir_y(0, direction);
			break;
		
	}

}