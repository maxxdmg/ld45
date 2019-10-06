draw_sprite_ext(spr_person, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1); // draw person

// handle draw gun & line of fire
if (state != SHOOTERSTATE.GRABBED && state != SHOOTERSTATE.FLEE && state != SHOOTERSTATE.TIRED) {
	draw_sprite(spr_gun, 0, x + 4, y); // draw gun
	
	// handle draw laser (line of sight)
	if (state == SHOOTERSTATE.ATTACK) {
		draw_line(x, y, obj_ooze.x, obj_ooze.y);
	}
}