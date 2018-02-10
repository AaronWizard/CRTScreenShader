shader_type canvas_item;

void fragment()
{
	COLOR = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0) * vec4(1, 0.4, 0.4, 1);
}