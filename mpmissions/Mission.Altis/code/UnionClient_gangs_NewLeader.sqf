/*
	
	Filename: 	UnionClient_gangs_NewLeader.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 2621),-1)) exitWith {hint localize "STR_GNOTF_TransferSelect"};
private _unit = call compile format["%1",CONTROL_DATA(2621)];
if (isNull _unit) exitWith {}; //Bad unit?
if (EQUAL(_unit,player)) exitWith {hint localize "STR_GNOTF_TransferSelf"};

private _unitID = getPlayerUID _unit;

if (grpPlayer GVAR ["gang_deputy","-1"] == _unitID) exitWith {hint "Нельзя передать лидера заместителю. Назначатье замом другого или сниите текущего с должности";}; 

private _action = [
	format[localize "STR_GNOTF_TransferMSG",GVAR_RNAME(_unit)],
	localize "STR_Gang_Transfer",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {	
	if (EQUAL(_unitID,"")) exitWith {hint "Bad UID?"};	
	grpPlayer selectLeader _unit;
	grpPlayer SVAR ["gang_owner",_unitID,true];
	[_unit,grpPlayer] remoteExecCall ["UnionClient_gangs_NewLeaderClient",_unit];

	[[grpPlayer,playerSide,steamid,_unitID,GVAR_RNAME(player),GVAR_RNAME(_unit)],"newGangLeader"] call UnionClient_system_hcExec;

	[] spawn UnionClient_gangs_Menu;
} else {
	hint localize "STR_GNOTF_TransferCancel";
};