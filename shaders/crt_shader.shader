shader_type canvas_item;

void fragment()
{
	vec4 screen_colour = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0);

	vec4 scan_mult = vec4(0, 0, 0, 1);
	vec4 red_mult = vec4(1, 0, 0, 1);
	vec4 green_mult = vec4(0, 1, 0, 1);
	vec4 blue_mult = vec4(0, 0, 1, 1);

	ivec2 frag = ivec2(int(FRAGCOORD.x), int(FRAGCOORD.y));

	if (frag.x % 4 == 0)
	{
		COLOR = screen_colour * scan_mult;
	}
	else
	{
		int column = frag.x / 4;
		int shift = column % 2;

		if ((frag.y + shift) % 4 == 0)
		{
			COLOR = screen_colour * scan_mult;
		}
		else
		{
			if (frag.x % 4 == 1)
			{
				COLOR = screen_colour * red_mult;
			}
			else if (frag.x % 4 == 2)
			{
				COLOR = screen_colour * green_mult;
			}
			else
			{
				COLOR = screen_colour * blue_mult;
			}
		}
	}
}