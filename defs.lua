trees = {
	{beech_model,		"beech",		"Beech",		nil,			nil,			nil	},
	{apple_tree_model,	"apple_tree",	"Apple Tree",	nil,			nil,			nil	},
	{oak_model,			"oak",			"Oak",			"acorn",		"Acorn",		{-0.2, -0.5, -0.2, 0.2, 0, 0.2}	},
	{sequoia_model,		"sequoia",		"Sequoia",		nil,			nil,			nil	},
	{birch_model1,		"birch",		"Birch",		nil,			nil,			nil	},
	{birch_model2,		"birch",		"Birch",		nil,			nil,			nil	},
	{palm_model,		"palm",			"Palm",			"coconut",		"Coconut",		{-0.2, -0.5, -0.2, 0.2, 0, 0.2}	},
	{spruce_model1,		"spruce",		"Spruce",		"spruce_cone",	"Spruce Cone",	{-0.2, -0.5, -0.2, 0.2, 0, 0.2}	},
	{spruce_model2,		"spruce",		"Spruce",		"spruce_cone",	"Spruce Cone",	{-0.2, -0.5, -0.2, 0.2, 0, 0.2}	},
	{pine_model,		"pine",			"Pine",			"pine_cone",	"Pine Cone",	{-0.2, -0.5, -0.2, 0.2, 0, 0.2}	},
	{willow_model,		"willow",		"Willow",		nil,			nil,			nil	}
}

for i in ipairs(trees) do
	local treedef = trees[i][1]
	local treename = trees[i][2]
	local treedesc = trees[i][3]
	local fruit = trees[i][4]
	local fruitdesc = trees[i][5]
	local selbox = trees[i][6]

	minetest.register_node("treegen:"..treename.."_tree", {
		description = treedesc.." Tree",
		tiles = {
			"treegen_"..treename.."_top.png",
			"treegen_"..treename.."_top.png",
			"treegen_"..treename..".png"
		},
		is_ground_content = true,
		groups = {tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_node("treegen:"..treename.."_leaves", {
		description = treedesc.." Leaves",
		drawtype = "allfaces_optional",
		visual_scale = 1.3,
		tiles = { "treegen_"..treename.."_leaves.png" },
		paramtype = "light",
		groups = {tree=1, snappy=3, flammable=2},
		sounds = default.node_sound_leaves_defaults(),
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

minetest.register_craftitem("treegen:tree_spawner_"..i, {
	description = treedesc.." spawner",
	inventory_image = "default_stick.png",
    on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type == "node" then
			local pos = pointed_thing.above
			minetest.env:spawn_tree(pos,treedef)
		end
	end,
})

end


