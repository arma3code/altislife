/*

	Filename: 	UnionClient_system_catchFish.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _boat = objectParent player;
if (EQUAL((driver _boat),player)) exitWith { hint localize "STR_NOTF_PassengerSeat"};
private _zone = "";
{
	if(player distance (getMarkerPos _x) < 75) exitWith {_zone = _x;};
} foreach ["fish_1","fish_2"];

if (EQUAL(_zone,"")) exitWith {hint localize "STR_NOTF_ProfFishing"};

private _val = 1;
private _gather = "";
private _side = [];

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["fish_1"]): {_gather = "shrimp"; _val = 2; _side = [civilian]};
	case (_zone in ["fish_2"]): {_gather = "shark"; _side = [civilian,independent]};
	default {""};
};

if !(playerSide in _side) exitWith {hint localize "STR_NOTF_GatherNotForYourSide"};
if (EQUAL(_gather,"")) exitWith {};

private _error = false;
private _itogo = 0;
private _time = switch (FETCH_CONST(life_donator)) do {
	case 0: {0.35};
	case 1: {0.3};
	case 2: {0.25};
	case 3: {0.2};
	case 4: {0.1};
};

if (FETCH_CONST(life_donator) > 0) then {ADD(_val,1)};

private _itemName = ITEM_NAME(_gather);
private _upp = format[localize "STR_NOTF_Gathering",_itemName];

hint localize "STR_NOTF_GatherBoatStop";

private["_cp","_diff"];
while {life_carryWeight < life_maxWeight} do {
	if (life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
	life_action_gathering = true;

	//Setup our progress bar.
	disableSerialization;	
	_cP = 0;
	
	call UnionClient_actions_inUse;
				
	_diff = [_gather,_val,life_carryWeight,life_maxWeight] call UnionClient_system_calWeightDiff;
	if (EQUAL(_diff,0)) exitWith {hint localize "STR_NOTF_InvFull";};	
	titleText[_upp,"PLAIN"];
	while {true} do {		
		uiSleep _time;
		_cP = _cP + 0.035;		
		[_cP,"gather"] call UnionClient_system_progressBar;
		if ((call UnionClient_system_isInterrupted) OR (NOTINVEH(player)) OR (isEngineOn _boat) OR (EQUAL((driver _boat),player))) exitWith {_error = true};
		if (_cP >= 1) exitWith {};
	};
	
	if(_error) exitWith {titleText[localize "STR_NOTF_GatheringCancel","PLAIN"];};
		
	if ([true,_gather,_diff] call UnionClient_system_handleInv) then {
		_itogo  = _itogo + _val;		
		titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_itogo],"PLAIN"];
	};

	life_action_gathering = false;
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;
uiSleep 2;
life_action_inUse = false;
life_action_gathering = false;