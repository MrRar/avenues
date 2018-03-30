local boxes = {
	{-0.3, -0.3, -0.3, 0.3, 0, 0.9},
	{-0.2, -0.2, -0.2, 0.2, 0, 0.9},
	{-0.2, -0.1, -0.3, 0.2, 0.1, 0.9}
}
for i = 1, 3 do
	minetest.register_node("avenues:street_light_" .. i, {
		description = "Street Light Type " .. i,
		walkable = true,
		tiles = {"avenues_street_light_" .. i .. ".png"},
		groups = {snappy = 1},
		sounds = default.node_sound_stone_defaults(),
		drawtype = "mesh",
		light_source = 14,
		selection_box = {
			type = "fixed",
			fixed = {
				boxes[i]
			},
		},
		node_box = {
			type = "fixed",
			fixed = {
				boxes[i]
			},
		},
		mesh = "street_light_" .. i .. ".obj",
		paramtype2="facedir",
		paramtype = "light",
		sunlight_propagates = true,
	})
end