/// @descu Menu setup

menu_w = display_get_gui_width();
menu_h = display_get_gui_height();
menu_margin = 256;

menu_x = menu_w - 16;
menu_y = menu_h - menu_margin;
menu_itemh = font_get_size(menu) * 2;
menu_choice = -1;

title = "GAME OVER";
credits = "Made by Maxdmg for Ludum Dare 45"
m = ["play again?", "quit"];
menu_items = 2;
menu_cursor = 0;

up = 0;
down = 0;