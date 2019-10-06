up = keyboard_check_pressed(vk_up);
down = keyboard_check_pressed(vk_down);
enter = keyboard_check_pressed(vk_enter);
var input = down - up;

menu_cursor = (menu_cursor + input) % menu_items;
if (menu_cursor < 0) menu_cursor = 2;

if (enter) {
	if (menu_cursor == 2) { 
		game_end();
	} else if (menu_cursor == 0) {
		room = room0;	
	} else {
		room = gameover
	}
}