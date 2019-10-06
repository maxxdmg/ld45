/// @desc Update clock

totalTime++;
seconds = totalTime mod 60;
minutes = totalTime div 60;

if (seconds < 10) {
	seconds = "0" + string(seconds);
} else seconds = string(seconds);

if (minutes < 10) {
	minutes = "0" + string(minutes);
} else minutes = string(minutes);

updateTime = 1;