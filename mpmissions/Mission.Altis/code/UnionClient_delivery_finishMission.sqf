/*

	Filename: 	UnionClient_delivery_finishMission.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_control","_vehicle","_nearVehicles","_vehicleName","_cargoDeliver","_fromTitle","_toTitle"];
disableSerialization;
_control = CONTROL(4300,4302);

_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_nearVehicles = nearestObjects [life_depo,["LandVehicle"],25];
_vehicle = _nearVehicles select _vehicle;
_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

closeDialog 0;
if (life_action_inUse) exitWith {};

if(isNull _vehicle) exitWith {};
if(!(_vehicle in life_vehicles)) exitWith {hint "У вас нет ключей от это техники"};

_cargoDeliver = _vehicle GVAR ["cargoDeliver",[]];
if (count _cargoDeliver == 0) exitWith {hint "У вас не взят заказ на доставку"};

_fromTitle = [_cargoDeliver select 0] call UnionClient_system_varToStr;
_toTitle = [_cargoDeliver select 1] call UnionClient_system_varToStr;

if (_cargoDeliver select 1 != str(life_depo)) exitWith {hint format["Вы привезли груз не в то депо! Вам необходимо доставить груз из %1 в %2",_fromTitle,_toTitle]};

titleText[format["Начата разгрузка %1, подождите...",_vehicleName],"PLAIN"];
call UnionClient_actions_inUse;
uiSleep (random 3);
_cargoDeliver = _vehicle GVAR ["cargoDeliver",[]];
if (count _cargoDeliver == 0) exitWith {
	titleText["Техника уже разгружена. Вы пытались сдать груз одновременно с кем-то и получаете бан до разбора!","PLAIN"];
	[steamid,0,"Cargo Deliver Dupe",format["Cargo Deliver Abuse! From: %1 To: %2 Reward: %3",_fromTitle,_toTitle,_cargoDeliver select 2]] remoteExecCall ["TON_fnc_rcon",RSERV];
	["DUPE",[format["Cargo Deliver Abuse! From: %1 To: %2 Reward: %3",_fromTitle,_toTitle,_cargoDeliver select 2]]] remoteExecCall ["TON_fnc_customLog",RSERV];
};

{detach _x;deleteVehicle _x} forEach (attachedObjects _vehicle);
_vehicle lockCargo false;
[_vehicle,"cargoDeliver"] call UnionClient_system_clearGlobalVar;
titleText["Техника разгружена!","PLAIN"];

["cash","add",_cargoDeliver select 2] call UnionClient_system_myCash;
hint format ["Вы успешно доставили груз из %1 в %2! На ваш банковский счет зачислено $%3",_fromTitle,_toTitle,[_cargoDeliver select 2] call UnionClient_system_numberText];
life_action_inUse = false;