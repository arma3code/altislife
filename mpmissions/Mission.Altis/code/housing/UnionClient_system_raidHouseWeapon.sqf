/*
	
	Filename: 	UnionClient_system_raidHouseWeapon.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _house = param [0,ObjNull,[ObjNull]];
if (isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if (isNil {(_house GVAR "house_owner")}) exitWith {hint localize "STR_House_Raid_NoOwner"};
if (life_coplevel < 8) exitWith {hint "Конфисковывать оружие могут только офицеры"};

private _uid = (_house GVAR "house_owner") select 0;
if (!([_uid] call UnionClient_system_isUIDActive)) exitWith {hint localize "STR_House_Raid_OwnerOff"};

private _house_box = _house GVAR["house_box",objNull];
if (isNull _house_box) exitWith {hint "Ящик не найден"};

if ([_house_box] call UnionClient_system_isTrunkInUse) exitWith {hint localize "STR_MISC_VehInvUse"};

private _houseInv = _house_box GVAR ["house_box_inventory",[[],0]];
if (EQUAL((_houseInv select 0),[])) exitWith {hint localize "STR_House_Raid_Nothing"};
if (_house GVAR ["inRaid",false]) exitWith {hint "Уже идет обыск...";};

call UnionClient_actions_inUse;
_house SVAR ["inRaid",true,true];

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

if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};

if (player distance _house > 13) exitWith {titleText[localize "STR_House_Raid_TooFar","PLAIN"]};

private _houseInv = _houseInv select 0;
private _reward = 0;
{
	private _itemPrice = M_CONFIG(getNumber,"LifeCfgItems",_x select 0,"price");
	if (_itemPrice > 0) then {
		_reward = _reward + ( (round(_itemPrice / 4)) * (_x select 1) );	
	};
} forEach _houseInv;

if (_reward > 0) then {
	private _gangID = grpPlayer GVAR ["gang_id",-1];
	if (EQUAL(_gangID,life_westGangId)) then {
		private _gFund = grpPlayer GVAR ["gang_bank",-1];
		if (EQUAL(_gFund,-1)) then {
			["atm","add",_reward] call UnionClient_system_myCash;
			hint "Не удалось определить баланс группы. Начислено на банковский счет. Сообщите админу!";
		} else {			
			grpPlayer SVAR ["gang_bank",(_gFund + _reward),true];
			[[1,grpPlayer,playerSide,steamid],"updateGang"] call UnionClient_system_hcExec;
		};
	} else {
		["atm","add",_reward] call UnionClient_system_myCash;
	};	

	_house_box SVAR ["house_box_inventory",[[],0],true];	
	
	[[_house_box,player],"updateHouseContainers"] call UnionClient_system_hcExec;

	[0,"STR_House_WeaponRaid_Successful",true,[[_reward] call UnionClient_system_numberText]] remoteExecCall ["UnionClient_system_broadcast",RCLIENT];
} else {
	hint localize "STR_House_WeaponRaid_NoIllegal";
};