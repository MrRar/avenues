yellow_interval = 0.5
main_interval = 10
-- green traffic light 1
minetest.register_node("avenues:traffic_light_green_1", {
	description = "faze 1 Green Traffic Light",
	on_timer = function(pos, elapsed)
		local node = minetest.get_node(pos)
		node.name = "avenues:traffic_light_yellow_1"
		minetest.set_node(pos, node)
		local timer = minetest.get_node_timer(pos)
		timer:set(yellow_interval, elapsed - main_interval)
	end,
	walkable = true,
	tiles = {"avenues_traffic_light_green.png"},
	groups = {snappy = 1},
	sounds = default.node_sound_stone_defaults(),
	drawtype = "mesh",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.5, -0.1, 0.2, 0.5, 0.1}
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.5, -0.1, 0.2, 0.5, 0.1}
		},
	},
	light_source=4,
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		local timer = minetest.get_node_timer(pos)
			
		-- green iterval + yellow interval + red interval
		local total_interval = main_interval + yellow_interval + main_interval
		
		local interval = minetest.get_gametime() % total_interval
		timer:set(main_interval, interval)
		scan_for_bar_objects(pos)
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		scan_for_bar_objects(pos)
	end,
	mesh = "traffic_light.obj",
	paramtype2="facedir",
	paramtype = "light",
	sunlight_propagates = true,
})

-- yellow traffic light 1
minetest.register_node("avenues:traffic_light_yellow_1", {
	description = "faze 1 Yellow Traffic Light",
	on_timer = function(pos, elapsed)
		local node = minetest.get_node(pos)
		node.name = "avenues:traffic_light_red_1"
		minetest.set_node(pos, node)
		local timer = minetest.get_node_timer(pos)
		timer:set(main_interval, elapsed - yellow_interval)
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		scan_for_bar_objects(pos)
	end,
	drop = "avenues:traffic_light_green_1",
	walkable = true,
	tiles = {"avenues_traffic_light_yellow.png"},
	groups = {snappy = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_stone_defaults(),
	drawtype = "mesh",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.5, -0.1, 0.2, 0.5, 0.1}
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.5, -0.1, 0.2, 0.5, 0.1}
		},
	},
	light_source=4,
	mesh = "traffic_light.obj",
	paramtype2="facedir",
	paramtype = "light",
	sunlight_propagates = true,
})

-- red traffic light 1
minetest.register_node("avenues:traffic_light_red_1", {
	description = "faze 1 Red Traffic Light",
	on_timer = function(pos, elapsed)
		local node = minetest.get_node(pos)
		node.name = "avenues:traffic_light_green_1"
		minetest.set_node(pos, node)
		local timer = minetest.get_node_timer(pos)
		timer:set(main_interval, elapsed - main_interval)
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		scan_for_bar_objects(pos)
	end,
	walkable = true,
	tiles = {"avenues_traffic_light_red.png"},
	groups = {snappy = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_stone_defaults(),
	drop = "avenues:traffic_light_green_1",
	drawtype = "mesh",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.5, -0.1, 0.2, 0.5, 0.1}
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.5, -0.1, 0.2, 0.5, 0.1}
		},
	},
	light_source=4,
	mesh = "traffic_light.obj",
	paramtype2="facedir",
	paramtype = "light",
	sunlight_propagates = true,
})
-- green traffic light 2
minetest.register_node("avenues:traffic_light_green_2", {
	description = "faze 2 Green Traffic Light",
	on_timer = function(pos, elapsed)
		local node = minetest.get_node(pos)
		node.name = "avenues:traffic_light_yellow_2"
		minetest.set_node(pos, node)
		local timer = minetest.get_node_timer(pos)
		timer:set(yellow_interval, elapsed - main_interval)
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		scan_for_bar_objects(pos)
	end,
	walkable = true,
	tiles = {"avenues_traffic_light_green.png"},
	groups = {snappy = 1, not_in_creative_inventory = 1},
	drop = "avenues:traffic_light_red_2",
	sounds = default.node_sound_stone_defaults(),
	drawtype = "mesh",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.5, -0.1, 0.2, 0.5, 0.1}
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.5, -0.1, 0.2, 0.5, 0.1}
		},
	},
	light_source=4,
	mesh = "traffic_light.obj",
	paramtype2="facedir",
	paramtype = "light",
	sunlight_propagates = true,
})

-- yellow traffic light 2
minetest.register_node("avenues:traffic_light_yellow_2", {
	description = "faze 2 Yellow Traffic Light",
	on_timer = function(pos, elapsed)
		local node = minetest.get_node(pos)
		node.name = "avenues:traffic_light_red_2"
		minetest.set_node(pos, node)
		local timer = minetest.get_node_timer(pos)
		timer:set(main_interval, elapsed - yellow_interval)
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		scan_for_bar_objects(pos)
	end,
	drop = "avenues:traffic_light_red_2",
	walkable = true,
	tiles = {"avenues_traffic_light_yellow.png"},
	groups = {snappy = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_stone_defaults(),
	drawtype = "mesh",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.5, -0.1, 0.2, 0.5, 0.1}
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.5, -0.1, 0.2, 0.5, 0.1}
		},
	},
	light_source=4,
	mesh = "traffic_light.obj",
	paramtype2="facedir",
	paramtype = "light",
	sunlight_propagates = true,
})

-- red traffic light 2
minetest.register_node("avenues:traffic_light_red_2", {
	description = "faze 2 Red Traffic Light",
	on_timer = function(pos, elapsed)
		local node = minetest.get_node(pos)
		node.name = "avenues:traffic_light_green_2"
		minetest.set_node(pos, node)
		local timer = minetest.get_node_timer(pos)
		timer:set(main_interval, elapsed - main_interval)
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		scan_for_bar_objects(pos)
	end,
	walkable = true,
	tiles = {"avenues_traffic_light_red.png"},
	groups = {snappy = 1},
	sounds = default.node_sound_stone_defaults(),
	drop = "avenues:traffic_light_red_2",
	drawtype = "mesh",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.5, -0.1, 0.2, 0.5, 0.1}
		},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.5, -0.1, 0.2, 0.5, 0.1}
		},
	},
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		local timer = minetest.get_node_timer(pos)
			
		-- green iterval + yellow interval + red interval
		local total_interval = main_interval + yellow_interval + main_interval
		
		local interval = minetest.get_gametime() % total_interval
		timer:set(main_interval, interval)
		scan_for_bar_objects(pos)
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		scan_for_bar_objects(pos)
	end,
	light_source=4,
	mesh = "traffic_light.obj",
	paramtype2="facedir",
	paramtype = "light",
	sunlight_propagates = true,
})