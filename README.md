# lua_async_mt
Wrapper for lua_async to use it as a minetest mod.
Executed the event loop every globalstep.

See https://github.com/EliasFleckenstein03/lua_async for API documentation.

## Utility functions

### `lua_async.mt_validate_objs([obj1, obj2, ...])`
Must be called from an async function.
Validates all Minetest ObjectRefs passed as arguments, meaning it checks if they have been removed (in the case of luaentities) or left the game (in the case of players). If one of the refs is not valid, the current thread dies - essentially meaning _this function never returns_ if one of the ObjectRefs is not valid. An error is raised if an arguments are given to this function that is not ObjectRefs at all.
Since ObjectRefs may turn into dangling ones after a `yield` (which includes `await`, `sleep` or other functions that may pause the current thread) it is recommended you revalidate your ObjectRef every time after calling a function that may potentially pause to later resume in a different globalstep either this way (if you want to just stop execution of the current thread in case your ObjectRef is invalid, which is often the case) or by validating them manually using `obj:is_player() or obj:get_luaentity()`.
