print("This is from init.lua")

--Load the files
local default_path = minetest.get_modpath("det_mod")
dofile(default_path.."/register.lua")
dofile(default_path.."/recipes.lua")
dofile(default_path.."/machine.lua")