/// @desc personstateGrabbed()

// handle grabbed object unexistant
if(!instance_exists(grabObject)) {
	instance_destroy();
	return;
}

// follow ooze
tarx = grabObject.x + lengthdir_x(grabbedDist - 5, grabbedDir);
tary = grabObject.y + lengthdir_y(grabbedDist - 5, grabbedDir);

x = tarx;
y = tary;
