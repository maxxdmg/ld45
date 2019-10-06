/// @desc captainstateLead()

var dist = point_distance(x, y, tarx, tary);
if (dist < 20) {
	state = CAPTAINSTATE.GENERATE_PATH;
	return
} else {
	var dir = point_direction(x, y, tarx, tary);
	handleMovement(moveSpeed, dir);
}


if (image_index > walk_cycle_end) image_index = walk_cycle_start;

var sightRange = 200;
var ooze = collision_circle(x, y, sightRange, obj_ooze, 0, 1);

if (ooze) {
	state = CAPTAINSTATE.ATTACK;
}
