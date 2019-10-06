
if (room == room0) {
	if (spawnDelay < 0) {
		var targetSpawn = instance_furthest(obj_ooze.x, obj_ooze.y, obj_spawner);
		createCaptain(targetSpawn.x, targetSpawn.y);
		spawnDelay = spawntimes[mode];
	} else {
		spawnDelay--;
	}
}

