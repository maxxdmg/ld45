/// @desc createBullet(dir)

var dir = argument0;

with(instance_create_layer(x, y, "Bullets", obj_bullet)) {
	direction = dir;
}