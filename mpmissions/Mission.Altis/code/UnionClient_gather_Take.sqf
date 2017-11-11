/*

	Filename: 	UnionClient_gather_Take.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (life_action_gathering) exitWith {hint "Вы заняты добычей"};
if (life_action_inUse) exitWith {hint "Вы заняты"};
private _item = param [0,objNull,[objNull]];
private _gather = param [1,"",[""]];
if (isNull _item) exitWith {};
if (EQUAL(_gather,"")) exitWith {};

private _curValue = _item GVAR ["resourceValue",0];
if (_curValue <= 0) exitWith {deleteVehicle _item};

if (time - (_item GVAR ["resourceTime",0]) > 60) exitWith {hint "У объекта закончился срок годности"; deleteVehicle _item};

_diff = [_gather,_curValue,life_carryWeight,life_maxWeight] call UnionClient_system_calWeightDiff;
if (EQUAL(_diff,0)) exitWith {hint localize "STR_NOTF_InvFull";};  

call UnionClient_actions_inUse;
if ([true,_gather,_diff] call UnionClient_system_handleInv) then {	
	[format[localize "STR_NOTF_Gather_Success",ITEM_NAME(_gather),_diff]] spawn UnionClient_gui_Notification;
	_item SVAR ["resourceValue",(_curValue - _diff)];
	if (_curValue - _diff <= 0) then {deleteVehicle _item};
	player playAction "PutDown";
} else {
	hint localize "STR_NOTF_InvFull";
};
life_action_inUse = false;