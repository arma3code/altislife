/*
	
	Filename: 	UnionClient_parking_ImpoundAction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (life_impound_inuse) exitWith {hint "Уже идет процесс конфискации"};
disableSerialization;
if (isNull (findDisplay 5500)) exitWith {};
private _vehicle = param [0,ObjNull,[ObjNull]];
if !(_vehicle isKindOf "LandVehicle") exitWith {};
if (player distance _vehicle > 10) exitWith {};
if (!alive _vehicle) exitWith {hint localize "STR_NOTF_VehNotAlive"};

if (EQUAL(worldName,"Tanoa")) exitWith {hint "Конфискация на штрафстоянку доступна пока только на острове Altis"};

private _dbInfo = _vehicle GVAR ["dbInfo",[]];
if (EQUAL(_dbInfo,[])) exitWith {hint "Автомобиль арендован"};

private _parkingCost = parseNumber(ctrlText 5502);
if !([str(_parkingCost)] call UnionClient_system_isnumeric) exitWith {hint localize "STR_ATM_notnumeric"};
if (_parkingCost > 100000) exitWith {hint format["Максимальная сумма не должна превышать $%1",[100000] call UnionClient_system_numberText]};
if (_parkingCost < LIFE_SETTINGS(getNumber,"life_impound_car")) exitwith {hint format["Минимальная сумма состовляет $%1",[LIFE_SETTINGS(getNumber,"life_impound_car")] call UnionClient_system_numberText]};

private _parkingMessage = ctrlText 5503;
if (EQUAL(_parkingMessage,"")) exitWith {hint "Не указана причина конфискации на штрафстоянку"};

closeDialog 0;

private _vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");	

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

if (player distance _vehicle > 10) exitWith {hint localize "STR_NOTF_ImpoundingCancelled"};

if (EQUAL((crew _vehicle),[]) OR ((typeOf _vehicle) in ["B_UAV_02_F","B_UGV_01_F","I_UGV_01_F"])) then {
	life_impound_inuse = true;
	
	[_vehicle,_parkingCost,_parkingMessage,player] remoteExecCall ["TON_fnc_vehicleParkingStore",RSERV];
	hint localize "STR_NOTF_SendingData";
} else {
	hint localize "STR_NOTF_ImpoundingCancelled";
};