--ITEMS
minetest.register_craftitem("det_mod:detolite_item",{
    description = "Detolite",
    inventory_image = "detolite.png"
})

minetest.register_craftitem("det_mod:detolite_dust",{
    description = "Detolite dust",
    inventory_image = "detolite_dust.png"
})

minetest.register_craftitem("det_mod:detolite_raw",{
    description = "Raw Detolite",
    inventory_image = "detolite_raw.png"
})

minetest.register_craftitem("det_mod:tool_rod",{
    description = "Tool Rod",
    inventory_image = "tool_rod.png"
})

minetest.register_craftitem("det_mod:detolite_slag",{
    description = "Detolite Slag",
    inventory_image = "detolite_slag.png"
})

minetest.register_craftitem("det_mod:adonite_dust",{
    description = "Adonite Dust",
    inventory_image = "adonite_dust.png"
})

minetest.register_craftitem("det_mod:refined_detolite_dust",{
    description = "Refined Detolite Dust",
    inventory_image = "refined_detolite_dust.png"
})
--ITEMS

--TOOLS
minetest.register_tool("det_mod:detolite_pickaxe",{
    description = "Detolite Pickaxe",
    inventory_image = "detolite_pick.png",
    tool_capabilities = {
        full_punch_interval = 1.7,
        max_drop_level = 5,
        groupcaps = {
            cracky = {
                maxlevel = 5,
                uses = 1,
                times = {[1]=1.60, [2]=1.20, [3]=0.80 }
            },
        },
        damage_groups = {fleshy=2},
    },
    sound = {breaks = "default_tool_breaks"},
    groups = {pickaxe = 1},
})
--TOOLS

--BLOCKS
minetest.register_node("det_mod:detolite_ore", {
    description = "Detolite Ore", 
    tiles = {{name="detolite_ore_all.png", align_style='world', scale=4}},
    drop = {
		max_items = 2,
		items = {
			{items = {"det_mod:detolite_item"}, rarity = 50},
			{items = {"det_mod:detolite_dust"}, rarity = 3},
		}
	},
    groups = {cracky = 2}
})

minetest.register_node("det_mod:detolite_block", {
    description = "Detolite Block", 
    tiles = {"detolite_block.png"},
    groups = {cracky = 3}
})
--BLOCKS