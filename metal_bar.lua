-- this code is based on parts of Pipeworks Mod 
-- https://github.com/minetest-mods/pipeworks
-- (C) Vanessa Ezekowitz
-- Licensed under LGPL 2.1

local bar_nodenames = {}

local vti = {4, 3, 2, 1, 6, 5}
local cconnects = {{}, {1}, {1, 2}, {1, 3}, {1, 3, 5}, {1, 2, 3}, {1, 2, 3, 5}, {1, 2, 3, 4}, {1, 2, 3, 4, 5}, {1, 2, 3, 4, 5, 6}}
local bar_selectboxes = {
	{ -0.5,  -0.1,  -0.1,  0.1,  0.1,  0.1 },
	{ -0.1 ,  -0.1,  -0.1, 0.5,  0.1,  0.1 },
	{ -0.1 , -0.5,  -0.1,  0.1,  0.1,  0.1 },
	{ -0.1 ,  -0.1,  -0.1,  0.1, 0.5,  0.1 },
	{ -0.1 ,  -0.1, -0.5,  0.1,  0.1,  0.1 },
	{ -0.1 ,  -0.1,  -0.1,  0.1,  0.1, 0.5 }
}
for index, connects in ipairs(cconnects) do
	local outsel = {}
	
	local jx = 0
	local jy = 0
	local jz = 0
	for _, v in ipairs(connects) do
		if v == 1 or v == 2 then
			jx = jx + 1
		elseif v == 3 or v == 4 then
			jy = jy + 1
		else
			jz = jz + 1
		end
		table.insert(outsel, bar_selectboxes[v])
	end

	if #connects == 1 then
		local v = connects[1]
		v = v-1 + 2*(v%2) -- Opposite side
	end
	
	local groups = {snappy = 3, not_in_creative_inventory = 1}
	local desc = ""
	local name = "avenues:metal_bar_"..index

	if #connects == 0 then
		groups = {snappy = 3, tube = 1}
		desc = "Metal Bar"
	end

	local mesh = "metal_bar_"..index..".obj"

	if index == 1 then
		mesh = "metal_bar_3.obj"
	end

	minetest.register_node(name, {
		description = desc,
		drawtype = "mesh",
		tiles = { "avenues_metal_bar.png" },
		mesh = mesh,
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "facedir",
		selection_box = {
			type = "fixed",
			fixed = outsel
		},
		collision_box = {
			type = "fixed",
			fixed = outsel
		},
		groups = groups,
		sounds = default.node_sound_wood_defaults(),
		walkable = true,
		drop = "avenues:metal_bar_1",
		after_place_node = function(pos)
			scan_for_bar_objects(pos)
		end,
		after_dig_node = function(pos)
			scan_for_bar_objects(pos)
		end
	})
	table.insert(bar_nodenames, name)
end

minetest.register_craft({
	output = "avenues:metal_bar_1",
	recipe = {
		{"default:steel_ingot 2"},
		{"default:steel_ingot 2"},
		{"default:steel_ingot 2"}
	}
})

local bar_table = {[0] = 1, 2, 2, 4, 2, 4, 4, 5, 2, 3, 4, 6, 4, 6, 5, 7, 2, 4, 3, 6, 4, 5, 6, 7, 4, 6, 6, 8, 5, 7, 7, 9, 2, 4, 4, 5, 3, 6, 6, 7, 4, 6, 5, 7, 6, 8, 7, 9, 4, 5, 6, 7, 6, 7, 8, 9, 5, 7, 7, 9, 7, 9, 9, 10}
local bar_table_facedirs = {[0] = 0, 0, 5, 0, 3, 4, 3, 0, 2, 0, 2, 0, 6, 4, 3, 0, 7, 12, 5, 12, 7, 4, 5, 5, 18, 20, 16, 0, 7, 4, 7, 0, 1, 8, 1, 1, 1, 13, 1, 1, 10, 8, 2, 2, 17, 4, 3, 6, 9, 9, 9, 9, 21, 13, 1, 1, 10, 10, 11, 2, 19, 4, 3, 0}
function scan_for_bar_objects(pos)
	autoroute_bars({ x=pos.x-1, y=pos.y  , z=pos.z   })
	autoroute_bars({ x=pos.x+1, y=pos.y  , z=pos.z   })
	autoroute_bars({ x=pos.x  , y=pos.y-1, z=pos.z   })
	autoroute_bars({ x=pos.x  , y=pos.y+1, z=pos.z   })
	autoroute_bars({ x=pos.x  , y=pos.y  , z=pos.z-1 })
	autoroute_bars({ x=pos.x  , y=pos.y  , z=pos.z+1 })
	autoroute_bars(pos)
end
function autoroute_bars(pos)
	local nctr = minetest.get_node(pos)
	if (string.find(nctr.name, "avenues:metal_bar_") == nil) then return end
	local nsurround = scan_bar_surroundings(pos)

	if nsurround == 0 then nsurround = 9 end
	minetest.swap_node(pos, {name = "avenues:metal_bar_"..bar_table[nsurround],
				param2 = bar_table_facedirs[nsurround]})
end

function scan_bar_surroundings(pos)
	local pxm=0
	local pxp=0
	local pym=0
	local pyp=0
	local pzm=0
	local pzp=0

	local nxm = minetest.get_node({ x=pos.x-1, y=pos.y  , z=pos.z   })
	local nxp = minetest.get_node({ x=pos.x+1, y=pos.y  , z=pos.z   })
	local nym = minetest.get_node({ x=pos.x  , y=pos.y-1, z=pos.z   })
	local nyp = minetest.get_node({ x=pos.x  , y=pos.y+1, z=pos.z   })
	local nzm = minetest.get_node({ x=pos.x  , y=pos.y  , z=pos.z-1 })
	local nzp = minetest.get_node({ x=pos.x  , y=pos.y  , z=pos.z+1 })

	--[[if (string.find(nxm.name, "avenues:metal_bar_") ~= nil) then pxm=1 end
	if (string.find(nxp.name, "avenues:metal_bar_") ~= nil) then pxp=1 end
	if (string.find(nym.name, "avenues:metal_bar_") ~= nil) then pym=1 end
	if (string.find(nyp.name, "avenues:metal_bar_") ~= nil) then pyp=1 end
	if (string.find(nzm.name, "avenues:metal_bar_") ~= nil) then pzm=1 end
	if (string.find(nzp.name, "avenues:metal_bar_") ~= nil) then pzp=1 end]]
	if nxm.name ~= "air" then pxm = 1 end
	if nxp.name ~= "air" then pxp = 1 end
	if nym.name ~= "air" then pym = 1 end
	if nyp.name ~= "air" then pyp = 1 end
	if nzm.name ~= "air" then pzm = 1 end
	if nzp.name ~= "air" then pzp = 1 end

	return pxm+8*pxp+2*pym+16*pyp+4*pzm+32*pzp
end