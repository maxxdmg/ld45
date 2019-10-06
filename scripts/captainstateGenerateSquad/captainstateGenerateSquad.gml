/// @desc captainstateGenerateSquad()

var squadCount = 0;
var mode = obj_controller.mode;
var spawnrates = obj_controller.spawnrates;
var len = array_length_1d(spawnrates[mode]);
// get squad spawn count based on spawn rates
var rand = random_range(0, 99);
var curr = 0;
for (var i=0; i < len; i++) {
	var zz = spawnrates[mode];
	if ((rand >= curr) && (rand < curr + zz[i])) {
		squadCount = i;
		break;
	}
	curr += zz[i];
}

// build squad randomly w/ known squad count
var squad_spots = array_create(squadCount * 2, 0);
var count = 0;
for (var i=0; i<squadCount; i++) {
	for (var j=-1; j<2; j++) {
		for (var k=-1; k<2; k++) {
			if (!(j == 0 && k == 0) && !valueExists(squad_spots, j, k)) {
				new_spotx = j;
				new_spoty = k;
				squad_spots[count] = new_spotx;
				squad_spots[count+1] = new_spoty;
				count += 2;
				
			} 
		}
	}
}

var i = 0;
var new_spotx = -1;
var new_spoty = -1;
while (i < squadCount) {
		new_spotx = squad_spots[i];
		new_spoty = squad_spots[i+1];
		// create next squad shooter
		with(instance_create_layer(x + 100 * new_spotx, y + 100 * new_spoty, "Persons", obj_shooter)) {
			captain = other;
			captainOffsetX = 120 * new_spotx + random_range(-5, 5);
			captainOffsetY = 120 * new_spoty + random_range(-5, 5);
		}		
		i += 2;
}

state = CAPTAINSTATE.GENERATE_PATH;