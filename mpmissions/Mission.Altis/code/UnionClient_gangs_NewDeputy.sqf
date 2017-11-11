/*
	
	Filename: 	UnionClient_gangs_NewDeputy.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;

if (EQUAL((lbCurSel 2621),-1)) exitWith {hint localize "STR_GNOTF_TransferSelect"};
private _unit = call compile format["%1",CONTROL_DATA(2621)];
if (isNull _unit) exitWith {};
if (EQUAL(_unit,player)) exitWith {hint localize "STR_GNOTF_TransferSelf"};

private _action = [
	format["Вы собираетесь назначить заместителем %1 (или разжаловать, если он уже ваш заместитель) . Вы уверены в этом?",GVAR_RNAME(_unit)],
	"Назначение заместителя",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	private _unitID = getPlayerUID _unit;
	if (EQUAL(_unitID,"")) exitWith {hint "Bad UID?"}; //Unlikely?	
	private _msg = "";
	if (grpPlayer GVAR ["gang_deputy","-1"] == _unitID) then {		
		[grpPlayer,"gang_deputy"] call UnionClient_system_clearGlobalVar;
		_msg = format ["%1 снял вас с должности заместителя",GVAR_RNAME(player)];
	} else {		
		[grpPlayer,"gang_deputy",_unitID] call CBA_fnc_setVarNet;
		_msg = format ["%1 назначил вас заместителем",GVAR_RNAME(player)];
	};

	[[4,grpPlayer,playerSide,_unitID],"updateGang"] call UnionClient_system_hcExec;

	[1,_msg] remoteExecCall ["UnionClient_system_broadcast",_unit];
} else {
	hint "Операция отменена";
};

[] spawn UnionClient_gangs_Menu;