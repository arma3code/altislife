/*
	
	Filename: 	UnionClient_gangs_OpenInfoMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if(isNull (findDisplay 4200)) then {
	if !(createDialog "UnionDialogMyGangAddInfo") exitWith {};
};

private _gangInfo = grpPlayer GVAR ["gang_info",[]];

if (count _gangInfo == 2) then {
	ctrlSetText [4201,(_gangInfo select 0)];
	ctrlSetText [4202,(_gangInfo select 1)];
};