/*

	Filename: 	UnionClient_dhl_spawnCarTask.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _spawnPoint = LIFE_SETTINGS(getText,"life_dhl_office");
if (EQUAL(_spawnPoint,"")) exitWith {};

"DHL - Spawn Car Task begin..." call UnionClient_system_log;

private _spawnPointPos = getMarkerPos _spawnPoint;
private _timer = time + 180;
private _taskName = format["DHL_TSPW_%1",steamid];

[_taskName,player,["Садитесь в машину и покиньте точку выдачи! У вас 3 минуты!","Покинуть офис DHL","walk"],life_dhl_car,"ASSIGNED",nil,true,false] call BIS_fnc_setTask;

"DHL - Spawn Car Task waiting..." call UnionClient_system_log;

waitUntil {uiSleep 0.5; life_dhl_car distance _spawnPointPos > 30 OR !alive life_dhl_car OR isNull life_dhl_car OR time >= _timer};

switch (true) do {
	case (!alive life_dhl_car OR time >= _timer) : {[_taskName,"FAILED",true] spawn BIS_fnc_taskSetState; deleteVehicle life_dhl_car};
	case (isNull life_dhl_car) : {[_taskName,"FAILED",true] spawn BIS_fnc_taskSetState;};
	case (life_dhl_car distance _spawnPointPos > 30) : {[_taskName,"SUCCEEDED",true] spawn BIS_fnc_taskSetState};
};

uiSleep 1;

[_taskName] call BIS_fnc_deleteTask;

"DHL - Spawn Car Task done" call UnionClient_system_log;