var len = spd;
var dir = direction;
handleMovement(len, dir);

// check ooze collision
var item = collision_circle(x, y, hitRange, obj_item, 0, 1);
var ooze = collision_circle(x, y, hitRange, obj_ooze, 0, 1);
var person = collision_circle(x, y, hitRange, obj_person, 0, 1);
var shooter = collision_circle(x, y, hitRange, obj_shooter, 0, 1);
var captain = collision_circle(x, y, hitRange, obj_captain, 0, 1);

// handle ooze collision
if (ooze) {
	// destroy ooze
	ooze.state = OOZESTATE.DEATH;
	return
	
// handle item ooze collision
} else if (item) {
	// destroy oozed item
	if (item.state == ITEMSTATE.GRABBED) {
		createOoze(random_range(7, 10), x, y, 360 - dir);
		instance_destroy(item);
		instance_destroy();
	}
} else if (person) {
	// destroy oozed person
	if (person.state == PERSONSTATE.GRABBED) {
		createOoze(random_range(7, 10), x, y, 360 - dir);
		instance_destroy(person);
		instance_destroy();
	}
} else if (shooter) {
	// destroy oozed shooter
	if (shooter.state == SHOOTERSTATE.GRABBED) {
		createOoze(random_range(7, 10), x, y, 360 - dir);
		instance_destroy(shooter);
		instance_destroy();
	}
} else if (captain) {
	// destroy oozed shooter
	if (captain.state == CAPTAINSTATE.GRABBED) {
		createOoze(random_range(7, 10), x, y, 360 - dir);
		instance_destroy(captain);
		instance_destroy();
	}
}