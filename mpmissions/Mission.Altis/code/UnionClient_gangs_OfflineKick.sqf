/*

	Filename: 	UnionClient_gangs_OfflineKick.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 3802),-1)) exitWith {hint localize "STR_GNOTF_SelectKick"};

private _ownerID = grpPlayer GVAR ["gang_owner",""];
if (EQUAL(_ownerID,"")) exitWith {closeDialog 0};
if !(EQUAL(_ownerID,steamid)) exitWith {closeDialog 0};

private _uid = CONTROL_DATA(3802);
if (EQUAL(_uid,"")) exitWith {hint "UID пуст"};
if ([_uid] call UnionClient_system_isUIDActive) exitWith {hint "Игрок в сети. Удалите его стандартным способом"};

private _gangDeputy = grpPlayer GVAR ["gang_deputy","-1"];
private _updateGang = false;

if (EQUAL(_uid,_gangDeputy)) then {
	_updateGang = true;
	[grpPlayer,"gang_deputy"] call UnionClient_system_clearGlobalVar;
};

[[player,grpPlayer,playerSide,_uid,_updateGang],"kickOffline"] call UnionClient_system_hcExec;
