local materials = {
	asphalt = "Asphalt",
	asphalt_yellow_sripe = "Asphalt Yellow Sripe",
	asphalt_white_sripe = "Asphalt White Sripe",
	concrete = "Concrete"
}
for id, name in pairs(materials) do
	minetest.register_node("avenues:" .. id .. "_half_slope", {
		description = name .. " Half Slope",
		walkable = true,
		tiles = {{name = "avenues_" .. id .. ".png", backface_culling = true}},
		groups = {snappy = 1},
		sounds = default.node_sound_stone_defaults(),
		drawtype = "mesh",
		selection_box = {
			type = "fixed", -- 0.1666
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.3, 0.5},
				{-0.5, -0.5, -0.233, 0.5, -0.166, 0.5},
				{-0.5, -0.5, 0.1, 0.5, 0, 0.5}
			},
		},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.3, 0.5},
				{-0.5, -0.5, -0.233, 0.5, -0.166, 0.5},
				{-0.5, -0.5, 0.1, 0.5, 0, 0.5}
			},
		},
		mesh = "half_slope.obj",
		paramtype2="facedir",
		paramtype = "light",
		sunlight_propagates = true,
	})
	minetest.register_node("avenues:" .. id .. "_half", {
		description = "" .. name .. " Half",
		walkable = true,
		tiles = {{name = "avenues_" .. id .. ".png", backface_culling = true}},
		groups = {snappy = 1},
		sounds = default.node_sound_stone_defaults(),
		drawtype = "mesh",
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5}
			},
		},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5}
			},
		},
		mesh = "half.obj",
		paramtype2="facedir",
		paramtype = "light",
		sunlight_propagates = true,
	})
	minetest.register_node("avenues:" .. id .. "_whole_slope", {
		description = "" .. name .. " Whole Slope",
		walkable = true,
		tiles = {{name = "avenues_" .. id .. ".png", backface_culling = true}},
		groups = {snappy = 1},
		sounds = default.node_sound_stone_defaults(),
		drawtype = "mesh",
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.1666, 0.5},
				{-0.5, -0.5, -0.233, 0.5, 0.333, 0.5},
				{-0.5, -0.5, 0.1, 0.5, 0.5, 0.5}
			},
		},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.1666, 0.5},
				{-0.5, -0.5, -0.233, 0.5, 0.333, 0.5},
				{-0.5, -0.5, 0.1, 0.5, 0.5, 0.5}
			},
		},
		mesh = "whole_slope.obj",
		paramtype2="facedir",
		paramtype = "light",
		sunlight_propagates = true,
	})
	minetest.register_node("avenues:" .. id .. "_whole", {
		description = "" .. name .. " Whole",
		walkable = true,
		tiles = {{name = "avenues_" .. id .. ".png", backface_culling = true}},
		groups = {snappy = 1},
		sounds = default.node_sound_stone_defaults(),
		drawtype = "mesh",
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
			},
		},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
			},
		},
		mesh = "whole.obj",
		paramtype2="facedir",
		paramtype = "light",
		sunlight_propagates = true,
	})
end