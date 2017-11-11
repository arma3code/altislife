/*
	
	Filename: 	UnionClient_system_animSync.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_unit",ObjNull,[Objnull]],
	["_anim","",[""]],
	["_isSwitchMove",true,[true]],
	["_isPlayMove",true,[true]]
];

if (isNull _unit) exitWith {};

if (_isSwitchMove) then {_unit switchMove _anim};
if (_isPlayMove) then {_unit playMove _anim};