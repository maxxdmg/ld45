/// @desc personstateGrabbed()

// handle grabbed object unexistant
if(!instance_exists(grabObject)) {
	createOoze(random_range(7, 10), x, y, 360 - grabbedDir);
	instance_destroy();
	return;
}

// follow ooze
tarx = grabObject.x + lengthdir_x(grabbedDist, grabbedDir);
tary = grabObject.y + lengthdir_y(grabbedDist, grabbedDir);

x = tarx;
y = tary;
