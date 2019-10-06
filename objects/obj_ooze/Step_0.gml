right = keyboard_check(ord("D"));
left =  keyboard_check(ord("A"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));

switch (state) {
	case OOZESTATE.FREE:
		oozestateFree();
		break;
	case OOZESTATE.REACH:
		oozestateReach();
		break;
	case OOZESTATE.RECOIL:
		oozestateRecoil();
		break;
	case OOZESTATE.DEATH:
		if (sprite_index == spr_ooze) {
			sprite_index = spr_death;
			image_index = 0;
			image_speed = 1;
			createOoze(20, x, y, 0);
			createOoze(20, x, y, 90);
			createOoze(20, x, y, 180);
			createOoze(20, x, y, 270);
		}
}