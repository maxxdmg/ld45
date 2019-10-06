enum PERSONSTATE {
	WANDER_TRIANGLE,
	WANDER_SQUARE,
	TIRED,
	FLEE,
	HIDE,
	GRABBED
}

state = PERSONSTATE.WANDER_TRIANGLE;
initState = PERSONSTATE.WANDER_TRIANGLE;


direction = 120;
tarx = x + lengthdir_x(50, direction);
tary = y + lengthdir_y(50, direction);


moveSpeed = 3;
grabRadius = 4;
grabObject = -1;

staminaDelay = 50;
catchBreathTime = 50;
dissolveTime = 20;

// animation stuff
image_speed = 1;
walk_cycle_start = 0;
walk_cycle_end = 6;