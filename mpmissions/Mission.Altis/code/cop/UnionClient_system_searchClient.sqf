/*
	
	Filename: 	UnionClient_system_searchClient.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _cop = param [0,Objnull,[objNull]];
if (isNull _cop) exitWith {};

private _inv = [];
private "_val";
{	
	_val = ITEM_VALUE(_x select 0);
	if (_val > 0) then {
		_inv pushBack [_x select 0,_val];
		[false,(_x select 0),_val] call UnionClient_system_handleInv;
	};
} foreach life_illegal_items;

private _dcash = 0;
if (DCASH > 0) then {
	_dcash = DCASH;	
	["dcash","drop",DCASH,"searchIllegalbyCop"] call UnionClient_system_myCash;
};

life_tempHouses = [];
[player,_inv,_dcash] remoteExecCall ["UnionClient_system_copSearch",_cop];