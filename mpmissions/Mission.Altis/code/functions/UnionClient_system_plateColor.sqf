/*

	Filename: 	UnionClient_system_plateColor.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _plate = param [0,000000,[0]];
//private _plateArray = _plate splitString "";
//private _ret = format ["<t color='#FFD700'>%1%2%3</t><t color='#ff6600'>%4%5%6%7</t>",_plateArray select 0, _plateArray select 1, _plateArray select 2, _plateArray select 3, _plateArray select 4, _plateArray select 5,_plateArray select 6];
_ret = format ["<t color='#FFD700'>%1</t>",_plate];
_ret;