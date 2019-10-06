/// @desc personstateTired()

if (staminaDelay < catchBreathTime) {
	staminaDelay++;
} else {
	state = PERSONSTATE.FLEE;
}