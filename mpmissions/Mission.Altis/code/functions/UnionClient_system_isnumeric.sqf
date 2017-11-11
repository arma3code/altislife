/*

	Filename: 	UnionClient_system_isnumeric.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_valid","_value","_compare"];
_value = _this select 0;
_valid = ["0","1","2","3","4","5","6","7","8","9"];
_array = [_value] call UnionClient_kron_StrToArray;
_return = true;

{
	if(_x in _valid) then	
	{}
	else
	{
		_return = false;
	};
} foreach _array;
_return;