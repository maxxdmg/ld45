/// @desc valueExists(arr, a, b)
/// @arg0 arr
/// @arg1 a
/// @arg2 b

var arr = argument0;
var a = argument1;
var b = argument2;

var i = 0
while(i<array_length_1d(arr)) {
	if (arr[i] == a && arr[i+1] == b) return 1;
	i+=2;
}

return 0;