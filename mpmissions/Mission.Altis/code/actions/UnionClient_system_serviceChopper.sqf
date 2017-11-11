/*
	
	Filename: 	UnionClient_system_serviceChopper.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
private["_search","_ui","_progress","_cP","_pgText","_title","_point","_progress_rscLayer"];
if(life_action_inUse) exitWith {hint localize "STR_NOTF_Action"};
_point = _this select 3;
_search = nearestObjects[getMarkerPos _point, ["Air"],10];
if(EQUAL(_search,[])) exitWith {hint localize "STR_Service_Chopper_NoAir"};
if(CASH < 100) exitWith {hint localize "STR_Serive_Chopper_NotEnough"};
["cash","take",100] call UnionClient_system_myCash;
call UnionClient_actions_inUse;

_title = localize "STR_Service_Chopper_Servicing";
_cP = 0;
titleText[_title,"PLAIN"];

while {true} do {
	uiSleep  0.2;
	_cP = _cP + 0.01;
	[_cP,"repair"] call UnionClient_system_progressBar;
	if(_cP >= 1 OR (call UnionClient_system_isInterrupted)) exitWith {};
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call UnionClient_system_isInterrupted) exitWith {titleText[localize "STR_NOTF_ActionCancel","PLAIN"]};

if(!alive (_search select 0) || (_search select 0) distance air_sp > 15) exitWith {hint localize "STR_Service_Chopper_Missing"};
if(!local (_search select 0)) then {
	[(_search select 0),1] remoteExecCall ["UnionClient_system_setFuel",(_search select 0)];
} else {
	(_search select 0) setFuel 1;
};
(_search select 0) setDamage 0;
titleText [localize "STR_Service_Chopper_Done","PLAIN"];