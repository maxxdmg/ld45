enum CAPTAINSTATE {
	GENERATE_PATH,
	GENERATE_SQUAD,
	LEAD,
	ATTACK,
	GRABBED
}

state = CAPTAINSTATE.GENERATE_SQUAD;
initState = state;

tarx = 0;
tary = 0;

moveSpeed = 2;
grabRadius = 4;
grabObject = -1;

direction = 120;

tarx = x + lengthdir_x(50, direction);
tary = y + lengthdir_y(50, direction);
bulletDelay = 50;
pathDelay = 50;


// animation stuff
image_speed = 1;
walk_cycle_start = 0;
walk_cycle_end = 6;