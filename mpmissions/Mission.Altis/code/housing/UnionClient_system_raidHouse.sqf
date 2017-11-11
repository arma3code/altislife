/*
	
	Filename: 	UnionClient_system_raidHouse.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _house = param [0,ObjNull,[ObjNull]];
if (isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if (isNil {(_house GVAR "house_owner")}) exitWith {hint localize "STR_House_Raid_NoOwner"};
if (life_coplevel < 8) exitWith {hint "Конфисковывать ресурсы могут только офицеры"};

private _uid = (_house GVAR "house_owner") select 0;
if !([_uid] call UnionClient_system_isUIDActive) exitWith {hint localize "STR_House_Raid_OwnerOff"};

private _house_box = _house GVAR["house_box",objNull];
if (isNull _house_box) exitWith {hint "Ящик не найден"};

if ([_house_box] call UnionClient_system_isTrunkInUse) exitWith {hint localize "STR_MISC_VehInvUse"};

private _houseInv = _house_box GVAR ["Trunk",[[],0]];
if (EQUAL((_houseInv select 0),[])) exitWith {hint localize "STR_House_Raid_Nothing"};
if (_house GVAR ["inRaid",false]) exitWith {hint "Уже идет обыск...";};

call UnionClient_actions_inUse;
_house SVAR["inRaid",true,true];

//Setup the progress bar
disableSerialization;
private _title = localize "STR_House_Raid_Searching";
private _cP = 0;
private _cpRate = 0.007;

private _time = switch (FETCH_CONST(life_donator)) do {
	case 0: {0.2};
	case 1: {0.14};
	case 2: {0.12};
	case 3: {0.1};
	case 4: {0.06};	
};
titleText[_title,"PLAIN"];
while {true} do {
	uiSleep _time;
	_cP = _cP + _cpRate;
	[_cP,"police"] call UnionClient_system_progressBar;	
	if (_cP >= 1 OR player distance _house > 13 OR (call UnionClient_system_isInterrupted)) exitWith {};	
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;

[_house,"inRaid"] call UnionClient_system_clearGlobalVar;

if (call UnionClient_system_isInterrupted) exitWith {};

if (player distance _house > 13) exitWith { titleText[localize "STR_House_Raid_TooFar","PLAIN"]};

private _reward = 0;
{
	private _var = _x select 0;
	private _val = _x select 1;
	
	private _index = [_var,life_illegal_items] call UnionClient_system_index;
	if !(EQUAL(_index,-1)) then {		
		_reward = _reward + (_val * ((life_illegal_items select _index) select 1));	
	};
} foreach (_houseInv select 0);

if (_reward > 0) then {
	[0,"STR_House_Raid_Successful",true,[[_reward] call UnionClient_system_numberText]] remoteExecCall ["UnionClient_system_broadcast",RCLIENT];
	private _gangID = grpPlayer GVAR ["gang_id",-1];
	if (EQUAL(_gangID,life_westGangId)) then {
		private _gFund = grpPlayer GVAR ["gang_bank",-1];
		if (EQUAL(_gFund,-1)) then {
			["atm","add",_reward] call UnionClient_system_myCash;
			hint "Не удалось определить баланс группы. Начислено на банковский счет. Сообщите админу!";
		} else {				
			ADD(_gFund,_reward);
			grpPlayer SVAR ["gang_bank",_gFund,true];		
			[[1,grpPlayer,playerSide,steamid],"updateGang"] call UnionClient_system_hcExec;
		};
	} else {
		["atm","add",_reward] call UnionClient_system_myCash;
	};	
	[_house_box] call UnionClient_system_clearVehicleTrunk;
		
	[[_house_box,player],"updateHouseContainers"] call UnionClient_system_hcExec;
} else {
	hint localize "STR_House_Raid_NoIllegal";
};