# lua_async_mt
Wrapper for lua_async to use it as a minetest mod.
Executed the event loop every globalstep.

See https://github.com/EliasFleckenstein03/lua_async for API documentation.

## Utility functions

### `lua_async.mt_validate_objs([obj1, obj2, ...])`
Must be called from an async function.
Validates all Minetest ObjectRefs passed as arguments, meaning it checks if they have been removed (in the case of luaentities) or left the game (in the case of players). If one of the refs is not valid, the current thread dies - essentially meaning _this function never returns_ if one of the ObjectRefs is not valid. An error is raised if arguments are given to this function that are not ObjectRefs at all.
