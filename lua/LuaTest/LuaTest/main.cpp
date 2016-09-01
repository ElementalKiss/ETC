#include <string>
extern "C"
{
#include "lua.hpp"
}

// 함수 정의
int luaHello(lua_State* L) 
{
	int count = 0;
	// luaL_checkstring을 통해 루아에서 넘어온 값을 가져온다.
	// 양수 1은 stack base의 첫 번째 값으로 루아에서 넘어온 첫 인자.
	const char* name = luaL_checkstring(L, 1);
	count++;
	printf("%s\n", name);

	// test 
	name = luaL_checkstring(L, 2);
	count++;
	printf("%s\n", name);
	return count;
}

// 메인
void main()
{
	// 초기화
	lua_State *lua = luaL_newstate();
	luaL_openlibs(lua);
	
	// 루아에서 C함수 사용하기
	// 함수 등록하기
	lua_register(lua, "hello", luaHello);
	// hello.lua에서 읽기
	luaL_dofile(lua, "hello.lua");

	lua_getglobal(lua, "popura");
	if (lua_isfunction(lua, -1) == false) 
	{
		fprintf(stderr, "print is not function\n");
		return;
	}

	// C에서 루아 함수 사용하기
	// 스택 탑 구하기
	int top = lua_gettop(lua);
	lua_getglobal(lua, "popura");
	if (lua_isfunction(lua, -1) == false) 
	{
		return;
	}

	// pcall 에러 핸들러
	int handle = lua_pcall(lua, 0, LUA_MULTRET, 0);

	if (handle) 
	{
		fprintf(stderr, "call error: %s\n", lua_tostring(lua, -1));
		return;
	}

	int ret_cnt = lua_gettop(lua) - top;
	printf("ret_cnt = %d\n", ret_cnt);

	int ret_val1 = 0;
	std::string ret_val2;

	// 스택 탑에서 문자값 가져오기
	ret_val2 = luaL_checkstring(lua, -1);
	// 스택 팝
	lua_pop(lua, 1);
	// 스택 탑에서 숫자값 가져오기
	ret_val1 = static_cast<int>(luaL_checknumber(lua, -1));
	// 스택 팝
	lua_pop(lua, 1);
	
	// 루아에서 가져온 값 출력
	printf("%d, %s", ret_val1, ret_val2.c_str());

	// 루아 닫기
	lua_close(lua);
}