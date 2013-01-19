leaves = {
	{"beech",				"Beech Leaves"},
	{"apple_tree", 			"Apple Tree Leaves"},
	{"oak",					"Oak Leaves"},
	{"sequoia",				"Sequoia Needles"},
	{"birch",				"Birch Leaves"},
	{"palm",				"Palm Leaves"},
	{"spruce",				"Spruce Needles"},
	{"pine",				"Pine Needles"},
	{"willow",				"Willow Leaves"},
	{"rubber_tree",			"Rubber Tree Leaves"},
	{"jungletree_red",		"Jungle Tree Red Leaves"},
	{"jungletree_green",	"Jungle Tree Green Leaves"},
	{"jungletree_yellow",	"Jungle Tree Yellow Leaves"}
	}

for i in ipairs(leaves) do
	local name = leaves[i]
	minetest.register_node("treegen:"..leaves[i][1].."_leaves", {
		description = leaves[i][2],
		drawtype = "allfaces_optional",
		visual_scale = 1.3,
		tiles = { "treegen_"..leaves[i][1].."_leaves.png" },
		paramtype = "light",
		groups = {tree=1, snappy=3, flammable=2},
		sounds = default.node_sound_leaves_defaults(),
	})
	end
	
trees = {
	{"beech",		"Beech",		nil,			nil,			nil	},
	{"apple_tree",	"Apple Tree",	nil,			nil,			nil	},
	{"oak",			"Oak",			"acorn",		"Acorn",		{-0.2, -0.5, -0.2, 0.2, 0, 0.2}	},
	{"sequoia",		"Sequoia",		nil,			nil,			nil	},
	{"birch",		"Birch",		nil,			nil,			nil	},
	{"palm",		"Palm",			"coconut",		"Coconut",		{-0.2, -0.5, -0.2, 0.2, 0, 0.2}	},
	{"spruce",		"Spruce",		"spruce_cone",	"Spruce Cone",	{-0.2, -0.5, -0.2, 0.2, 0, 0.2}	},
	{"pine",		"Pine",			"pine_cone",	"Pine Cone",	{-0.2, -0.5, -0.2, 0.2, 0, 0.2}	},
	{"willow",		"Willow",		nil,			nil,			nil	},
	{"rubber_tree",	"Rubber Tree",	nil,			nil,			nil	},
	{"jungletree",	"Jungle Tree",	nil,			nil,			nil	}
}

for i in ipairs(trees) do
	local treename = trees[i][1]
	local treedesc = trees[i][2]
	local fruit = trees[i][3]
	local fruitdesc = trees[i][4]
	local selbox = trees[i][5]

	minetest.register_node("treegen:"..treename.."_trunk", {
		description = treedesc.." Trunk",
		tiles = {
			"treegen_"..treename.."_top.png",
			"treegen_"..treename.."_top.png",
			"treegen_"..treename..".png"
		},
		is_ground_content = true,
		groups = {tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_node("treegen:"..treename.."_planks", {
		description = treedesc.." Planks",
		tiles = {"treegen_"..treename.."_wood.png"},
		is_ground_content = true,
		groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_node("treegen:"..treename.."_sapling", {
	description = treedesc.." Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"treegen_"..treename.."_sapling.png"},
	inventory_image = "treegen_"..treename.."_sapling.png",
	wield_image = "treegen_"..treename.."_sapling.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1},
	sounds = default.node_sound_defaults(),
	})
	
	if (fruit ~= nil) then
		minetest.register_node("treegen:"..fruit, {
			description = fruitdesc,
			drawtype = "plantlike",
			visual_scale = 0.8,
			tiles = { "treegen_"..fruit..".png" },
			inventory_image = "treegen_"..fruit..".png",
			paramtype = "light",
			sunlight_propagates = true,
			walkable = false,
			selection_box = {
				type = "fixed",
					fixed = selbox
				},
			groups = {fleshy=3,dig_immediate=3,flammable=2},
			sounds = default.node_sound_defaults(),
		})
	end

end

