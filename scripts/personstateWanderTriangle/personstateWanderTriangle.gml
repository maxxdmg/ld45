/// @desc personStateWanderTriangle()


// handle flee
if (handleDetect(80)) {
	state = PERSONSTATE.FLEE;
	return;
}

// handle movement
if (image_index > walk_cycle_end) image_index = walk_cycle_start;

var len = moveSpeed / 2;
var dir = point_direction(x, y, tarx, tary);
handleMovement(len, dir);

var dist = point_distance(x, y, tarx, tary);
if (dist < 5) {
	direction += 120;
	len = 50;
	
	tarx = x + lengthdir_x(len, direction);
	tary = y + lengthdir_y(len, direction);

}