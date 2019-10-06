/// @desc Draw menu

var blur = 3;
draw_set_font(menu);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

// draw menu items
for (var i=0; i<menu_items; i++) {
	var offset = 2;
	var txt = m[i];
	
	if (menu_cursor == i) {
		gpu_set_blendmode(bm_add);
		draw_text_ext_color(menu_x - blur, menu_y + menu_itemh * i - blur, txt, 10, 10000, c_red, c_red, c_red, c_red, 0.75);
		draw_text_ext_color(menu_x + blur, menu_y + menu_itemh * i + blur, txt, 10, 10000, c_blue, c_blue, c_blue, c_blue, 0.75);
		draw_text_ext_color(menu_x, menu_y + menu_itemh * i, txt, 10, 10000, c_white, c_white, c_white, c_white, 1);
		gpu_set_blendmode(bm_normal);
	} else {
		draw_text_ext_color(menu_x, menu_y + menu_itemh * i, txt, 10, 10000, c_white, c_white, c_white, c_white, 1);		
	}
}

gpu_set_blendmode(bm_add);
draw_text_ext_color(menu_x - 128 - blur, 64 - blur, title, 10, 10000, c_red, c_red, c_red, c_red, 0.75);
draw_text_ext_color(menu_x - 128 + blur, 64 + blur, title, 10, 10000, c_blue, c_blue, c_blue, c_blue, 0.75);
draw_text_ext_color(menu_x - 128, 64, title, 10, 10000, c_white, c_white, c_white, c_white, 1);
gpu_set_blendmode(bm_normal);