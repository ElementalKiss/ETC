#include <string>
extern "C"
{
#include "lua.hpp"
}

// �Լ� ����
int luaHello(lua_State* L) 
{
	int count = 0;
	// luaL_checkstring�� ���� ��ƿ��� �Ѿ�� ���� �����´�.
	// ��� 1�� stack base�� ù ��° ������ ��ƿ��� �Ѿ�� ù ����.
	const char* name = luaL_checkstring(L, 1);
	count++;
	printf("%s\n", name);

	// test 
	name = luaL_checkstring(L, 2);
	count++;
	printf("%s\n", name);
	return count;
}

// ����
void main()
{
	// �ʱ�ȭ
	lua_State *lua = luaL_newstate();
	luaL_openlibs(lua);
	
	// ��ƿ��� C�Լ� ����ϱ�
	// �Լ� ����ϱ�
	lua_register(lua, "hello", luaHello);
	// hello.lua���� �б�
	luaL_dofile(lua, "hello.lua");

	lua_getglobal(lua, "popura");
	if (lua_isfunction(lua, -1) == false) 
	{
		fprintf(stderr, "print is not function\n");
		return;
	}

	// C���� ��� �Լ� ����ϱ�
	// ���� ž ���ϱ�
	int top = lua_gettop(lua);
	lua_getglobal(lua, "popura");
	if (lua_isfunction(lua, -1) == false) 
	{
		return;
	}

	// pcall ���� �ڵ鷯
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

	// ���� ž���� ���ڰ� ��������
	ret_val2 = luaL_checkstring(lua, -1);
	// ���� ��
	lua_pop(lua, 1);
	// ���� ž���� ���ڰ� ��������
	ret_val1 = static_cast<int>(luaL_checknumber(lua, -1));
	// ���� ��
	lua_pop(lua, 1);
	
	// ��ƿ��� ������ �� ���
	printf("%d, %s", ret_val1, ret_val2.c_str());

	// ��� �ݱ�
	lua_close(lua);
}