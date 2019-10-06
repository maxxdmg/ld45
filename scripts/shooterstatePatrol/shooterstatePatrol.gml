/// @desc shooterstatePatrolV()

// move toward captain
if (!instance_exists(captain)) {
	// throw gun
	instance_create_layer(x, y, "Items", obj_gun);
	state = SHOOTERSTATE.FLEE;
} else {
	var xTo = captain.x + captainOffsetX;
	var yTo = captain.y + captainOffsetY;
	handleMovement(moveSpeed, point_direction(x, y, xTo, yTo));
}


if (image_index > walk_cycle_end) image_index = walk_cycle_start;

var sightRange = 200;
var ooze = collision_circle(x, y, sightRange, obj_ooze, 0, 1);

if (ooze) {
	state = SHOOTERSTATE.ATTACK;
}
