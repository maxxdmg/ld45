enum SHOOTERSTATE {
	PATROL,
	ATTACK,
	GRABBED,
	FLEE,
	TIRED
}
state = SHOOTERSTATE.PATROL;


captain = -1;
captainOffsetX = 0;
captainOffsetY = 0;
moveSpeed = 4;
grabRadius = 2;
grabObject = -1;
bulletDelay = 25;

staminaDelay = 150;
catchBreathTime = 30;

// animation stuff
image_speed = 1;
walk_cycle_start = 0;
walk_cycle_end = 6;