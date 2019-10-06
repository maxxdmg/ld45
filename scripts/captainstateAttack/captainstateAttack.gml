/// @desc captainstateAttack()

var dir = point_direction(x, y, obj_ooze.x, obj_ooze.y);

if (bulletDelay < 0) {
	createBullet(dir);
	bulletDelay = 30;
	state = CAPTAINSTATE.GENERATE_PATH;
} else bulletDelay--;
