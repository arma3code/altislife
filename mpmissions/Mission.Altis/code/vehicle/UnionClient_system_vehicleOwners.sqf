/*

	Filename: 	UnionClient_system_vehicleOwners.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _data = param [0,[],[[]]];
private _return = "";
{
	_return = _return + format["%1<br/>",_x select 1];
} foreach _data;
_return;