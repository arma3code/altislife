/*

	Filename: 	UnionClient_system_getCombatVehicleMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 5900)) then {
	createDialog "UnionDialogBattleVeh";
	waitUntil {!isNull (findDisplay 5900)};
};

private _control = CONTROL(5900,5902);
lbClear _control;

life_combatVehMarker = _this select 3;
private _flag = [playerSide] call UnionClient_system_convertSide;

private "_vehicleInfo";
{
	_vehicleInfo = [getText(_x >> "vehicleClass")] call UnionClient_system_fetchVehInfo;
	if !(EQUAL(_vehicleInfo,[])) then {
		_control lbAdd format["%1",_vehicleInfo select 3];
		_control lbSetData [(lbSize _control)-1,configName _x];
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgBattleVehicles"));