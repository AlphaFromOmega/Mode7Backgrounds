/// @description ?
change = 0;
true_y = 0;


hspd = ((depth % 2) ? -1 : 1);
wave_x_base = ((depth % 2) ? -1 : 1);
wave_x_multi = 7;

wave_x_i = wave_x_multi;
wave_x = wave_x_base * wave_x_multi;
amp_x = 50;

change_amount = y div sprite_get_height(image_index) * -wave_x;