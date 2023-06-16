local function register_chest(name, desc, texture0,texture1,texture2,texture3,texture4,texture5)
    minetest.register_node("det_mod:detolite_bin", {
        description = desc,
        tiles = {texture0,texture1,texture2,texture3,texture4,texture5},
        paramtype2 = "facedir",
        groups = {cracky = 3},

        --On Construct Inventory
        on_construct = function(pos)
            local meta = minetest.get_meta(pos)
            meta:set_string("formspec", "size[12,10]"..
                "list[current_name;main;0,0;4,5;]"..
                "list[current_name;other;4,0;4,5;]"..
                "list[current_name;again;8,0;4,5;]"..
                "list[current_player;main;2,6;8,4;]")
            local inv = meta:get_inventory()
            inv:set_size("main", 32)
            inv:set_size("other", 32)
            inv:set_size("again", 32)
        end,

        --On Rightclick Inventory
        on_rightclick = function(pos, node, player, itemstack, pointed_thing)
            local player_name = player:get_player_name()
            minetest.show_formspec(player_name, "det_mod:detolite_bin",
                "size[12,10]"..
                "list[nodemeta:".. pos.x .. "," .. pos.y .. "," .. pos.z .. ";main;0,0;4,5;]"..
                "list[nodemeta:".. pos.x .. "," .. pos.y .. "," .. pos.z .. ";other;4,0;4,5;]"..
                "list[nodemeta:".. pos.x .. "," .. pos.y .. "," .. pos.z .. ";again;8,0;4,5;]"..
                "list[current_player;main;2,6;8,4;]allow_put:true")
        end,

        allow_metadata_inventory_put = function(pos, listname, index, stack, player)
            return stack:get_count()
        end,

        on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
            minetest.log("action", player:get_player_name()..
                " moves stuff in chest at "..minetest.pos_to_string(pos))
        end,
        on_metadata_inventory_put = function(pos, listname, index, stack, player)
            minetest.log("action", player:get_player_name()..
                " moves "..stack:get_name()..
                " to chest at "..minetest.pos_to_string(pos))
        end,
        on_metadata_inventory_take = function(pos, listname, index, stack, player)
            minetest.log("action", player:get_player_name()..
                " takes "..stack:get_name()..
                " from chest at "..minetest.pos_to_string(pos))
        end,
    })
end

register_chest("det_mod:detolite_bin", "Detolite Bin", "bin_top.png","bin_bottom.png","bin_side.png","bin_side.png","bin_side.png","bin_front.png")

--tiles = {
--    "texture0.png", -- for the sides
--    "texture0.png", -- for the bottom
--    "texture1.png", -- for the top
--    "texture0.png", -- for the front
--    "texture0.png", -- for the back
--}





minetest.register_node("det_mod:test_machine", {
    description = "Test Machine",
    tiles = {"machine_top.png"},
    groups = {cracky = 3},

    -- Set up the node's inventory
    on_construct = function(pos)
        local meta = minetest.get_meta(pos)
        local inv = meta:get_inventory()
        inv:set_size("input", 2)
        inv:set_size("output", 1)
    end,

    -- Handle right-clicks on the node
    on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        local meta = minetest.get_meta(pos)
        local inv = meta:get_inventory()
        local input0 = inv:get_stack("input", 1)
        local input1 = inv:get_stack("input", 2)
        local output = inv:get_stack("output", 1)

        -- Check if the input slots contain the correct items
        if input0:get_name() == "default:dirt" and input1:get_name() == "default:coal" and input0:get_count() >= 1 and input1:get_count() >= 2 then
            -- Wait 1.5 seconds
            minetest.after(1.5, function()
                -- Remove 1 input0 and 2 input1 from the inventory
                input0:take_item(1)
                input1:take_item(2)
                inv:set_stack("input", 1, input0)
                inv:set_stack("input", 2, input1)
                -- Add 1 output0 to the output slot
            output:add_item(ItemStack("default:diamond"))
            inv:set_stack("output", 1, output)
        end)
    else
        minetest.chat_send_player(player:get_player_name(), "Not enough items to make the output")
    end
end,
-- Allow the player to access the node's inventory
allow_metadata_inventory_put = function(pos, listname, index, stack, player)
    return stack:get_count()
end,
allow_metadata_inventory_take = function(pos, listname, index, stack, player)
    return stack:get_count()
end
})