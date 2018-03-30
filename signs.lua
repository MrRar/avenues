minetest.register_node("avenues:sign_post", {
	description = "Sign Post",
	tiles = {"avenues_sign_post.png"},
	groups = {snappy = 1},
	walkable = true,
	sounds = default.node_sound_stone_defaults(),
	drawtype = "mesh",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.1, -0.5, -0.5, 0.1, 0.5, -0.4}
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1, -0.5, -0.5, 0.1, 0.5, -0.4}
		},
	},
	mesh = "sign_post.obj",
	paramtype2="facedir",
	paramtype = "light",
	sunlight_propagates = true,
})
local signs = {
	stop_sign = "Stop Sign",
	speed_limit_30_sign = "Speed Limit 30 Sign",
	speed_limit_50_sign = "Speed Limit 50 Sign",
	speed_limit_60_sign = "Speed Limit 60 Sign",
	yellow_black_stripes_sign = "Yellow And Black Stripes Sign",
	orange_white_stripes_sign = "Orange And White Stripes Sign",
	road_closed_sign = "Road Closed Sign",
	road_work_ahead_sign = "Road Work Ahead Sign",
	no_parking_sign = "No Parking Sign"
}
for id, name in pairs(signs) do
	minetest.register_node("avenues:" .. id, {
		description = name,
		walkable = true,
		tiles = {"avenues_" .. id .. ".png"},
		backface_culling = true,
		groups = {snappy = 1},
		sounds = default.node_sound_stone_defaults(),
		drawtype = "mesh",
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, 0.5, 0.5, 0.5, 0.4}
			},
		},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, 0.5, 0.5, 0.5, 0.4}
			},
		},
		mesh = "sign.obj",
		paramtype2="facedir",
		paramtype = "light",
		sunlight_propagates = true,
	})
end