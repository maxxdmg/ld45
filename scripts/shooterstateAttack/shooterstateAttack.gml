/// @desc shooterstateAttack()

var dir = point_direction(x, y, obj_ooze.x, obj_ooze.y);

if (!instance_exists(captain)) {
	// throw gun
	instance_create_layer(x, y, "Items", obj_gun);
	state = SHOOTERSTATE.FLEE;
}


if (bulletDelay < 0) {
	createBullet(dir);
	bulletDelay = 30;
	state = SHOOTERSTATE.PATROL;
} else bulletDelay--;
