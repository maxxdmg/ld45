/// @desc handleGrabbed(grabbing_radius)
/// @arg0 grabbing_radius

var r = argument0;
var g = -1;
var ret = 0;
var ooze = collision_circle(x, y, r, obj_ooze, 0, 1);
var person = collision_circle(x, y, r, obj_person, 0, 1);
var shooter = collision_circle(x, y, r, obj_shooter, 0, 1);
var item = collision_circle(x, y, r, obj_item, 0, 1);

// handle ooze collision
if (ooze) {
	g = ooze;
	ret = 1;

// handle oozed person collision
} else if (person) {
	if (person.state == PERSONSTATE.GRABBED) {
		g = person;
		ret = 1;
	}

// handle oozed item collision
} else if (item) {
	if (item.state == ITEMSTATE.GRABBED) {
		g = item;
		ret = 1;
	}
// handle oozed shooter collision
} else if (shooter) {
	if (shooter.state == SHOOTERSTATE.GRABBED) {
		g = shooter;
		ret = 1;
	}
}

// handle grabbed true
if (ret) {
	obj_gui.points += 10;
	grabObject = g;
	grabbedDist = point_distance(x, y, g.x, g.y);
	grabbedDir = point_direction(x, y, g.x, g.y) + 180;
}

return ret;
