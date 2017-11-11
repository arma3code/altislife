/*

	Filename: 	UnionClient_system_lightHouseAction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};

if(isNull (_house GVAR ["lightSource",ObjNull])) then {
	[_house,true] remoteExecCall ["UnionClient_system_lightHouse",RCLIENT];
} else {	
	[_house,false] remoteExecCall ["UnionClient_system_lightHouse",RCLIENT];
};