//@function init_mode7(values)
function init_mode7()
{
	
}
//@function mode7_osolate(x, y, change, first_value)
function mode7_h_osolate(_x, _y, _max, _fv)
{
	var _min = _max * -1;
	for (var i = 0; i < sprite_get_height(sprite_index); i++)
	{
		var based_value = i + _fv;
		var adjust = sin(based_value) < 0 ? _min : _max;
		draw_sprite_part(sprite_index, image_index, 0, i, sprite_get_width(sprite_index), 1, _x + sin(based_value / adjust) * adjust, _y + i);
	}
}
//@function mode7_osolate(x, y, max_change, first_value, transparency)
function mode7_h_osolate_dual(_x, _y, _max, _fv, _tra)
{
	var _min = _max * -1;
	if (_tra)
	{
		for (var i = 0; i < sprite_get_height(sprite_index); i++)
		{
			var based_value = i + _fv;
			for (var j = 0; j < 2; j++)
			{
				if (abs(j % 2))
				{
					based_value *= -1;
				}
				var adjust = ((j % 2)) ? _min : _max;
				draw_sprite_part(sprite_index, image_index, 0, i, sprite_get_width(sprite_index), 1, _x + sin(based_value / adjust) * adjust, _y + i);
			}
		}
	}
	else
	{
		for (var i = 0; i < sprite_get_height(sprite_index); i++)
		{
			var based_value = i + _fv;
			if (abs(based_value % 2))
			{
				based_value *= -1;
			}
			var adjust = sin(based_value) < 0 ? _min : _max;
			draw_sprite_part(sprite_index, image_index, 0, i, sprite_get_width(sprite_index), 1, _x + sin(based_value / adjust) * adjust, _y + i);
		}
	}
}