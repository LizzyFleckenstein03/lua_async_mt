local path = minetest.get_modpath(minetest.get_current_modname()) .. "/src"

dofile(path .. "/init.lua")(path, true)

minetest.register_globalstep(function(dtime)
	lua_async.step(dtime)
end)

function lua_async.mt_validate_objs(...)
	for _, ref in ipairs {...} do
		if not ref:is_player() and not ref:get_luaentity() then
			lua_async.kill_thread()
		end
	end
end
