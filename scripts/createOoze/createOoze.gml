/// createOoze(droplets, xposition, yposition, dir)
/// @arg0 droplets
/// @arg1 xposition
/// @arg2 yposition
/// @arg3 dir

var droplets = argument0;
var xx = argument1;
var yy = argument2;
var dir = argument3;

for (var i=0; i<droplets; i++) {
	
	with(instance_create_layer(xx, yy, "gore", obj_oozedroplets)) {
		direction = dir + random_range(-10, 10);
		speed = random_range(7, 15);
		friction = 0.4;
	}
	
}