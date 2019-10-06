enum MODES {
	BABY,
	EASY,
	NORMAL,
	MODERATE,
	HARD,
	VERYHARD,
	IMPOSSIBLE
}
mode = MODES.EASY

spawnrates[0] = [50, 50, 0, 0, 0, 0, 0];
spawnrates[1] = [20, 30, 40, 10, 0, 0, 0];
spawnrates[2] = [0, 20, 40, 40, 0, 0, 0];
spawnrates[3] = [0, 0, 30, 70, 0, 0, 0];
spawnrates[4] = [0, 0, 10, 30, 60, 0, 0];
spawnrates[5] = [0, 0, 0, 20, 40, 40, 0];
spawnrates[6] = [0, 0, 0, 0, 40, 50, 10];
spawnrates[7] = [0, 0, 0, 0, 0, 60, 40];

spawntimes = [-1, 300, 250, 150, 100, 75, 50, 20];
spawnDelay = spawntimes[mode];
