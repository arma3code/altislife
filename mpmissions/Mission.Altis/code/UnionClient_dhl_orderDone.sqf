/*

	Filename: 	UnionClient_dhl_orderDone.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
deleteVehicle life_dhl_box;

[format["DHL_TS2_%1",steamid],"SUCCEEDED",true] call BIS_fnc_taskSetState;
[format["DHL_TS2_%1",steamid]] call BIS_fnc_deleteTask;

private _price = round((life_dhl_startPoint distance2D life_dhl_finishPoint) * LIFE_SETTINGS(getNumber,"life_dhl_price"));
["atm","add",_price] call UnionClient_system_myCash;
[format["Вы заработали на доставке $%1",[_price] call UnionClient_system_numberText],"done"] call UnionClient_system_hint;

"DHL - Order done" call UnionClient_system_log;

life_dhl_startPoint = objNull;
life_dhl_finishPoint = objNull;
life_dhl_box = objNull;
life_dhl_orderInProgress = false;