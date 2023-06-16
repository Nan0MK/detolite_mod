minetest.register_craft({
    type = "shaped",
    output = "det_mod:detolite_raw 4",
    recipe = {
        {"default:clay_lump", "det_mod:detolite_dust", "default:clay_lump"},
        {"det_mod:detolite_dust", "default:diamond", "det_mod:detolite_dust"},
        {"default:clay_lump", "det_mod:detolite_dust", "default:clay_lump"}
    }
})

minetest.register_craft({
    type = "cooking",
    output = "det_mod:detolite_item",
    recipe = "det_mod:detolite_raw",
    cooktime = 8,
})

minetest.register_craft({
    type = "shaped",
    output = "det_mod:tool_rod 2",
    recipe = {
        {"", "default:steel_ingot", ""},
        {"default:steel_ingot", "default:stick", "default:steel_ingot"},
        {"", "default:steel_ingot", ""}
    }
})

minetest.register_craft({
    type = "shaped",
    output = "det_mod:detolite_pickaxe",
    recipe = {
        {"det_mod:detolite_item", "det_mod:detolite_item", "det_mod:detolite_item"},
        {"", "det_mod:tool_rod", "det_mod:detolite_item"},
        {"det_mod:tool_rod", "", "det_mod:detolite_item"}
    }
})

minetest.register_craft({
    type = "shaped",
    output = "det_mod:detolite_block",
    recipe = {
        {"det_mod:detolite_item", "det_mod:detolite_item", "det_mod:detolite_item"},
        {"det_mod:detolite_item", "det_mod:detolite_item", "det_mod:detolite_item"},
        {"det_mod:detolite_item", "det_mod:detolite_item", "det_mod:detolite_item"}
    }
})

minetest.register_craft({
    type = "shaped",
    output = "det_mod:refined_detolite_dust 3",
    recipe = {
        {"", "det_mod:detolite_slag", ""},
        {"det_mod:detolite_slag", "det_mod:detolite_dust", "det_mod:detolite_slag"},
        {"", "det_mod:detolite_slag", ""}
    }
})

minetest.register_craft({
    type = "shapeless",
    output = "det_mod:detolite_item 9",
    recipe = {"det_mod:detolite_block"},
})

minetest.register_craft({
    type = "cooking",
    output = "det_mod:detolite_slag", "det_mod:adonite_dust",
    recipe = "det_mod:detolite_dust",
    cooktime = 5,
})

minetest.register_craft({
    type = "cooking",
    output = "det_mod:adonite_dust",
    recipe = "det_mod:detolite_slag",
    cooktime = 5,
})