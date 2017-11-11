/*
	
	Filename: 	UnionClient_system_repairDoor.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_building","_doors","_door","_cP","_cpRate","_ui","_title","_titleText","_progress_rscLayer"];
_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "You are not looking at a house door."};
_doors = 1;
_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "NumberOfDoors");

_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};
if(EQUAL(_door,0)) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
if((_building GVAR [format["bis_disabled_Door_%1",_door],0]) == 1) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};
call UnionClient_actions_inUse;

closeDialog 0;
//Setup the progress bar
disableSerialization;
_title = localize "STR_Cop_RepairingDoor";
_cP = 0;

switch (typeOf _building) do {
	case "Land_Dome_Big_F": {_cpRate = 0.008;};
	case "Land_Research_house_V1_F": {_cpRate = 0.005;};	
	default {_cpRate = 0.08;}
};
titleText[_title,"PLAIN"];
while {true} do {
	_cP = _cP + _cpRate;
	[_cP,"repair"] call UnionClient_system_progressBar;	
	if (_cP >= 1 OR life_interrupted OR (call UnionClient_system_isInterrupted)) exitWith {};
	call UnionClient_animation_kneelWork;
	uiSleep 0.26;	
};

life_action_inUse = false;
["life_progress"] call UnionClient_gui_DestroyRscLayer;

if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};

["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call UnionClient_system_animDo;

if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]};

_building animate [format["door_%1_rot",_door],0];
_building SVAR [format["bis_disabled_Door_%1",_door],1,true]; //Unlock the door.