/// @description ?
shader_set(sh_osolate);
var shader_params;

shader_params = shader_get_uniform(sh_osolate, "pixel_width");
shader_set_uniform_f(shader_params, texture_get_texel_width(sprite_get_texture(sprite_index, image_index)));
shader_params = shader_get_uniform(sh_osolate, "pixel_height");
shader_set_uniform_f(shader_params, texture_get_texel_height(sprite_get_texture(sprite_index, image_index)));

shader_params = shader_get_uniform(sh_osolate, "image_width");
shader_set_uniform_f(shader_params, texture_get_width(sprite_get_texture(sprite_index, image_index)));
shader_params = shader_get_uniform(sh_osolate, "image_height");
shader_set_uniform_f(shader_params, texture_get_height(sprite_get_texture(sprite_index, image_index)));

shader_params = shader_get_uniform(sh_osolate, "wavelength_x");
shader_set_uniform_f(shader_params, wave_x);
shader_params = shader_get_uniform(sh_osolate, "amplitude_x");
shader_set_uniform_f(shader_params, amp_x);

var base_x = x;
var base_y = y;

for (var i = 0; i < room_width div sprite_width + 2; i++)
{
	for (var j = 0; j < room_height div sprite_height + 2; j++)
	{
		x = base_x + (i - 1) * sprite_width;
		y = base_y + (j - 1) * sprite_height;
		shader_params = shader_get_uniform(sh_osolate, "phase_x");
		shader_set_uniform_f(shader_params, (j * -wave_x + change/100));
		draw_self();
	}
}
shader_reset();