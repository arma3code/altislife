/*
	
	Filename: 	UnionClient_system_impoundAction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0,ObjNull,[ObjNull]];
if !([_vehicle] call UnionClient_system_isVehicleKind) exitWith {};
if (player distance _vehicle > 10) exitWith {};
if (!alive _vehicle) exitWith {hint localize "STR_NOTF_VehNotAlive"};

private _vehicleData = _vehicle GVAR ["vehicle_info_owners",[]];
if (EQUAL(_vehicleData,[])) exitWith {deleteVehicle _vehicle}; //Bad vehicle.

private _vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");	
[0,"STR_NOTF_BeingImpounded",true,[(_vehicleData select 0) select 1,_vehicleName]] remoteExecCall ["UnionClient_system_broadcast",RCLIENT];

call UnionClient_actions_inUse;

private _upp = localize "STR_NOTF_Impounding";
private _cP = 0;
private _time = 0.2;
private _cpRate = 0.007;
if (ISPSIDE(west)) then {
	_time = switch (FETCH_CONST(life_donator)) do {
		case 0: {0.2};
		case 1: {0.14};
		case 2: {0.12};
		case 3: {0.1};
		case 4: {0.06};	
	};
};
titleText[_upp,"PLAIN"];
while{true} do {
	uiSleep _time;
	_cP = _cP + _cpRate;
	[_cP,"truck"] call UnionClient_system_progressBar;
	if(_cP >= 1 OR (player distance _vehicle > 10) OR (call UnionClient_system_isInterrupted)) exitWith {};
};
["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call UnionClient_system_isInterrupted) exitWith {};

if (player distance _vehicle > 10) exitWith {hint localize "STR_NOTF_ImpoundingCancelled";};

if (EQUAL((crew _vehicle),[]) OR ((typeOf _vehicle) in ["B_UAV_02_F","B_UGV_01_F","I_UGV_01_F"])) then {	
	private _type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	private _price = switch (true) do {
		case (_vehicle isKindOf "LandVehicle"): {LIFE_SETTINGS(getNumber,"life_impound_car")};
		case (_vehicle isKindOf "Ship"): {LIFE_SETTINGS(getNumber,"life_impound_boat")};
		case (_vehicle isKindOf "Air"): {LIFE_SETTINGS(getNumber,"life_impound_air")};
	};
	
	life_impound_inuse = true;

	[[_vehicle,true,player],"vehicleStore","TON",false] call UnionClient_system_hcExec;

	waitUntil {uiSleep 0.03; !life_impound_inuse};
	if (ISPSIDE(west)) then {
		_price = [_price,1] call UnionClient_system_discount;
	};
	hint format[localize "STR_NOTF_Impounded",_type,_price];
	[0,"STR_NOTF_HasImpounded",true,[GVAR_RNAME(player),(_vehicleData select 0) select 1,_vehicleName]] remoteExecCall ["UnionClient_system_broadcast",RCLIENT];
	["atm","add",_price] call UnionClient_system_myCash;		
} else {
	hint localize "STR_NOTF_ImpoundingCancelled";
};