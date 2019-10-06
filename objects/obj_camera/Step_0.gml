xTo = tarx;
yTo = tary;

tarx = toFollow.x;
tary = toFollow.y;

x += (xTo - x);
y += (yTo - y);

x = clamp(x, view_w, room_width - view_w);
y = clamp(y, view_h, room_height - view_h);

camera_set_view_pos(cam, x - view_w, y - view_h); // update camera view