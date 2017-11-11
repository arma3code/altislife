/*
	
	Filename: 	UnionClient_system_escortAction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit) exitWith {};
if (!isPlayer _unit OR (player distance _unit > 3)) exitWith {};
if !(NOTATTACHED(_unit)) exitWith {hint localize "STR_NOTF_EscortError"};
if !(EQUAL((attachedObjects player),[])) exitWith {hint localize "STR_NOTF_EscortError"};

_unit attachTo [player,[0.1,1.1,0]];
player reveal _unit;