//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float pixel_width;
uniform float pixel_height;

uniform int image_width;
uniform int image_height;

uniform float phase_x;
uniform float wavelength_x;
uniform float amplitude_x;

uniform float phase_y;
uniform float wavelength_y;
uniform float amplitude_y;

void main()
{
	vec2 texcoord = v_vTexcoord;
	vec4 color = v_vColour;
	
	float translate_x = sin(phase_x - (texcoord.y * wavelength_x));
	translate_x *= pixel_width * amplitude_x;
	
	float translate_y = sin(phase_y - (texcoord.y * wavelength_y));
	translate_y *= pixel_height * amplitude_y;
	
	texcoord.x += translate_x;
	texcoord.y += translate_y;
	
	//Tile the graphic
	float img_x = pixel_width * float(image_width) - pixel_width;
	float img_y = pixel_height * float(image_height) - pixel_height;
	
	texcoord.x = mod(texcoord.x, float(1));
	texcoord.y = mod(texcoord.y, float(1));
	
    gl_FragColor = color * texture2D( gm_BaseTexture, texcoord );
}