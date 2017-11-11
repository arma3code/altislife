/*

	Filename: 	UnionClient_adac_Setup.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

	Формат [["boxes",3],["nitro"]]

*/
#include "..\script_macros.hpp"
params [
	["_vehicle",Objnull,[Objnull]],
	["_mode","",[""]],
	["_config","",[""]]
];

if (!isClass (missionConfigFile >> "LifeCfgAdac" >> typeof _vehicle)) exitWith {hint "Для этой техники нет настроек"};

private _trunk = _vehicle GVAR ["Trunk",[[],0]];

if (EQUAL(_mode,"boxes") && (M_CONFIG(getNumber,"LifeCfgAdac",typeOf _vehicle,"boxes") == 0)) exitWith {hint localize "STR_ADAC_VehBoxDisable"};
if (EQUAL(_mode,"nitro") && (M_CONFIG(getNumber,"LifeCfgAdac",typeOf _vehicle,"nitro") == 0)) exitWith {hint localize "STR_ADAC_VehNitroDisable"};
if !(EQUAL((_trunk select 0),[])) exitWith {hint localize "STR_ADAC_VehTrunkNotEmpty"};

private _currentConfig = [];
private _doUpgrade = false;

switch (_mode) do {
	case "boxes": {
		switch (_config) do {
			case "add": {
				private _currentBoxes = _vehicle GVAR ["adacBoxes",0];
				if ((_currentBoxes + 1) > M_CONFIG(getNumber,"LifeCfgAdac",typeOf _vehicle,"boxes")) exitWith {hint localize "STR_ADAC_VehBoxMaxed"};
				if !(["extItem_adacBox"] call UnionClient_system_removeItem) exitWith {hint localize "STR_ADAC_VehItemNeed"};
				_vehicle SVAR ["adacBoxes",_currentBoxes + 1,true];
				hint localize "STR_ADAC_VehBoxDone";
				_doUpgrade = true;
			};
			case "del": {
				private _currentBoxes = _vehicle GVAR ["adacBoxes",0];
				if (EQUAL(_currentBoxes,0)) exitWith {hint localize "STR_ADAC_VehNoBox"};
				if (_currentBoxes <= 1) then {					
					[_vehicle,"adacBoxes"] call UnionClient_system_clearGlobalVar;
				} else {
					_vehicle SVAR ["adacBoxes",_currentBoxes - 1,true];
				};
				hint localize "STR_ADAC_VehBoxRemoved";
				_doUpgrade = true;
			};
		};
	};

	case "nitro": {
		switch (_config) do {
			case "add": {
				if (!isNil {_vehicle GVAR "adacNitroUsed"}) exitWith {hint localize "STR_ADAC_VehNitroAlready"};
				if !(["extItem_adacNitro"] call UnionClient_system_removeItem) exitWith {hint localize "STR_ADAC_VehItemNeed"};
				_vehicle SVAR ["adacNitroUsed",0,true];
				hint localize "STR_ADAC_VehNitroDone";
				_doUpgrade = true;
			};
			case "del": {
				if (isNil {_vehicle GVAR "adacNitroUsed"}) exitWith {hint localize "STR_ADAC_VehNitroAlready"};				
				[_vehicle,"adacNitroUsed"] call UnionClient_system_clearGlobalVar;
				hint localize "STR_ADAC_VehNitroRemoved";
				_doUpgrade = true;
			};
		};
	};
};

if (_doUpgrade) then {	
	[_vehicle,"Trunk"] call UnionClient_system_clearGlobalVar;
	if (!isNil {_vehicle GVAR "adacBoxes"}) then {_currentConfig pushBack ["boxes",_vehicle GVAR ["adacBoxes",0]]};
	if (!isNil {_vehicle GVAR "adacNitroUsed"}) then {_currentConfig pushBack ["nitro"]};
	[_vehicle,_currentConfig] call UnionClient_adac_InitUpgrades;
	[_vehicle,_currentConfig] remoteExecCall ["TON_fnc_vehicleAdacUpdate",RSERV];
	[_vehicle] spawn UnionClient_adac_Menu;
};