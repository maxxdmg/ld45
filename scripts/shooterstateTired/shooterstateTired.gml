/// @desc shooterstateTired()

if (staminaDelay < catchBreathTime) {
	staminaDelay++;
} else {
	state = SHOOTERSTATE.FLEE;
}