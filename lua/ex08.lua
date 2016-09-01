
int lua_hello(lua_State* L) {
        const char* name = luaL_checkstring(L, 1);
        printf("hello %s\n", name);
}
