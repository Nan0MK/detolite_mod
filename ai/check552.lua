local function is_center_of_water(pos)
    -- Get the minimum and maximum corners of the area
    local minp = { x = pos.x - 2, y = pos.y - 1, z = pos.z - 2 }
    local maxp = { x = pos.x + 2, y = pos.y, z = pos.z + 2 }
    -- Find all the water nodes in the area
    local water_nodes = minetest.find_nodes_in_area(minp, maxp, { "default:water_source", "default:water_flowing" })
    -- Check if there are exactly 50 water nodes (5x5x2)
    if #water_nodes == 50 then
        -- Check if the CatalystNode is in the center
        local center_node = minetest.get_node(pos)
        if center_node.name == "mymod:catalystnode" then
            return true
        end
    end
    return false
end

local function spawn_crystalnodes(pos)
    -- Get the minimum and maximum corners of the area
    local minp = { x = pos.x - 2, y = pos.y - 1, z = pos.z - 2 }
    local maxp = { x = pos.x + 2, y = pos.y, z = pos.z + 2 }
    -- Find all the water nodes in the area
    local water_nodes = minetest.find_nodes_in_area(minp, maxp, { "default:water_source", "default:water_flowing" })
    -- Loop through the water nodes and replace them with CrystalNodes randomly
    for _, water_pos in ipairs(water_nodes) do
        -- Generate a random number between 0 and 1
        local rand = math.random()
        -- If the number is less than some probability (e.g. 0.1), replace the water node with a CrystalNode
        if rand < 0.1 then
            minetest.set_node(water_pos, { name = "mymod:crystalnode" })
        end
    end
end

local function turn_to_stone(pos)
    -- Replace the CatalystNode with stone
    minetest.set_node(pos, { name = "default:stone" })
end


-- Register a globalstep callback that runs every server step (usually every 0.1 seconds)
minetest.register_globalstep(function(dtime)
    -- Find all the CatalystNodes in the world
    local catalyst_nodes = minetest.find_nodes_in_area({ x = -31000, y = -31000, z = -31000 }, { x = 31000, y = 31000,
        z = 31000 }, { "mymod:catalystnode" })
    -- Loop through the CatalystNodes and check if they are in the center of water
    for _, catalyst_pos in ipairs(catalyst_nodes) do
        if is_center_of_water(catalyst_pos) then
            -- Schedule the spawning function to run after some time (e.g. every second)
            minetest.after(1.0, spawn_crystalnodes, catalyst_pos)
            -- Schedule the turning function to run after some time (e.g. after 10 seconds)
            minetest.after(10.0, turn_to_stone, catalyst_pos)
        end
    end
end)
