/// @desc Update clock

totalTime++;
seconds = totalTime mod 60;
minutes = totalTime div 60;

// update difficulty

if ((seconds == 20 || seconds == 40 || seconds == 59) && obj_controller.mode != MODES.IMPOSSIBLE) {
	obj_controller.mode++;
}



// update clock
if (seconds < 10) {
	seconds = "0" + string(seconds);
} else seconds = string(seconds);

if (minutes < 10) {
	minutes = "0" + string(minutes);
} else minutes = string(minutes);

updateTime = 1;
