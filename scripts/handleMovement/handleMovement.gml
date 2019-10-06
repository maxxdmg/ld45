/// @desc handleMovement(len, dir)
var spd = argument0;
var dir = argument1;
 
var xtarg = x+lengthdir_x(spd,dir);
var ytarg = y+lengthdir_y(spd,dir);

if (!collision_circle(xtarg, ytarg, 3, obj_fence, 0, 1) && !collision_circle(xtarg, ytarg, 3, obj_fencevert, 0, 1)){
    x = xtarg;
    y = ytarg;
}