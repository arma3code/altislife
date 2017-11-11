/*

	Filename: 	UnionClient_system_getCombatVehicle.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (EQUAL((lbCurSel 5902),-1)) exitWith {};
private _cfgClass = CONTROL_DATA(5902);

if (!isClass (missionConfigFile >> "LifeCfgBattleVehicles" >> _cfgClass)) exitWith {};

private _exit = false;
private _side = M_CONFIG(getText,"LifeCfgBattleVehicles",_cfgClass,"side");
if !(EQUAL(_side,"")) then {
	private _playerSide = [playerSide] call UnionClient_system_convertSide;
	if !(EQUAL(_side,_playerSide)) then {
		_exit = true;
	};
};
if (_exit) exitWith {hint "Для вашей фракции недоступна эта техника"};

private _conditions = M_CONFIG(getText,"LifeCfgBattleVehicles",_cfgClass,"conditions");
if !([_conditions] call UnionClient_system_conditionsCheck) exitWith {
	hint format ["%1",M_CONFIG(getText,"LifeCfgBattleVehicles",_cfgClass,"conditionsMessage")];
};

private _className = M_CONFIG(getText,"LifeCfgBattleVehicles",_cfgClass,"vehicleClass");
private _vehicleInfo = [_className] call UnionClient_system_fetchVehInfo;
private _action = [
	format["Вы действительно хотите достать %1?",_vehicleInfo select 3],
	"Боевая техника",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;
if (!isNil "_action" && {!_action}) exitWith {};

private _nearVehicles = nearestObjects[getMarkerPos life_combatVehMarker,["LandVehicle","Air","Ship"],10];
if (count _nearVehicles > 0) exitWith {
	hint "Место занято!";
};

private _maximum = M_CONFIG(getNumber,"LifeCfgBattleVehicles",_cfgClass,"maximum");
[player,_cfgClass,life_combatVehMarker,_maximum] remoteExec ["TON_fnc_combatVehicleReq",RSERV];
hint "Отправлен запрос...";
closeDialog 0;