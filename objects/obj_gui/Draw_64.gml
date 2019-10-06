/// @desc draw gui

if (room == room0) {
	var mode = obj_controller.mode;

	switch (mode) {
		case 0:
			mode = "BABY"
			break;
		case 1:
			mode = "EASY"
			break;
		case 2:
			mode = "NORMAL"
			break;
		case 3:
			mode = "MODERATE"
			break;
		case 4:
			mode = "HARD"
			break;
		case 5:
			mode = "VERY HARD"
			break;
		case 6:
			mode = "IMPOSSIBLE"
			break;
	}

	var blur = 3;
	var cam = view_camera[0];
	var view_w = camera_get_view_width(cam) * 0.25;
	var view_h = camera_get_view_height(cam) * 0.125;

	if (updateTime) {
		alarm[0] = 1 * room_speed;
		updateTime = 0;
	}

	draw_set_font(font);

	// draw time and difficulty
	gpu_set_blendmode(bm_add);
	draw_text_ext_color(view_w - blur, view_h - blur, minutes + ":" + seconds, 10, 10000, c_red, c_red, c_red, c_red, 0.75);
	draw_text_ext_color(view_w + blur, view_h + blur, minutes + ":" + seconds, 10, 10000, c_blue, c_blue, c_blue, c_blue, 0.75);
	draw_text_ext_color(view_w, view_h, minutes + ":" + seconds, 10, 10000, c_white, c_white, c_white, c_white, 1);

	draw_text_ext_color(view_w + 225 - blur, view_h - blur, mode, 10, 10000, c_red, c_red, c_red, c_red, 0.75);
	draw_text_ext_color(view_w + 225 + blur, view_h + blur, mode, 10, 10000, c_blue, c_blue, c_blue, c_blue, 0.75);
	draw_text_ext_color(view_w + 225, view_h, mode, 10, 10000, c_white, c_white, c_white, c_white, 1);

	draw_text_ext_color(view_w - blur, view_h + 64 - blur, points, 10, 10000, c_red, c_red, c_red, c_red, 0.75);
	draw_text_ext_color(view_w + blur, view_h + 64 + blur, points, 10, 10000, c_blue, c_blue, c_blue, c_blue, 0.75);
	draw_text_ext_color(view_w , view_h + 64, points, 10, 10000, c_white, c_white, c_white, c_white, 1);

	gpu_set_blendmode(bm_normal);
}