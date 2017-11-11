/*
	
	Filename: 	UnionClient_gangs_Offline.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 3800)) then {
	if !(createDialog "UnionDialogGangOffline") exitWith {};
};

private _ownerID = grpPlayer GVAR["gang_owner",""];
if (EQUAL(_ownerID,"")) exitWith {closeDialog 0;}; //Bad juju
if !(EQUAL(_ownerID,steamid)) exitWith {closeDialog 0};

private _gangName = GANG_NAME;

(CONTROL(3800,3801)) ctrlSetText format ["%1 (Оффлайн)",_gangName];

private _members = CONTROL(3800,3802);
lbClear _members;

_members lbAdd "Получение списка...";

[[player,grpPlayer,playerSide],"getOffline","TON",false] call UnionClient_system_hcExec;