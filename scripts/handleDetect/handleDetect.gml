/// @desc handleDetect(detect_radius)
/// @arg0 detect_radius

var r = argument0;
var ooze = collision_circle(x, y, r, obj_ooze, 0, 1);

if (ooze) {
	return 1;
}