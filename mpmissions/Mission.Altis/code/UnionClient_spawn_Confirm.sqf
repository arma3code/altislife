/*

	Filename: 	UnionClient_spawn_Confirm.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_spCfg","_sp","_spawnPos","_text"];
closeDialog 0;

if(count life_spawn_point == 0) then {
	private["_sp","_spCfg"];
	_spCfg = [playerSide] call UnionClient_spawn_PointCfg;
	_sp = _spCfg select 0;

	if(isNil {(call compile format["%1", _sp select 0])}) then {
		if(["Точка отключения",life_spawn_point select 1] call BIS_fnc_inString) then {
			player setPosATL life_logout_position;
		} else {
			player setPosATL (getMarkerPos (_sp select 0));
		};
	} else {
		_spawnPos = (call compile format["%1", _sp select 0]) call BIS_fnc_selectRandom;
		_spawnPos = _spawnPos buildingPos 0;
		player setPosATL _spawnPos;
	};

	_text = format["%2 %1",_sp select 1,localize "STR_Spawn_Spawned"];
} else {
	if(isNil {(call compile format["%1",life_spawn_point select 0])}) then {
		if(["Точка отключения",life_spawn_point select 1] call BIS_fnc_inString) then {
			player setPosATL life_logout_position;
		} else {
			if(["house",life_spawn_point select 0] call BIS_fnc_inString) then {
				private["_bPos","_house","_pos"];
				_house = nearestObjects [getMarkerPos (life_spawn_point select 0),["House_F"],10] select 0;
				_bPos = [_house] call UnionClient_system_getBuildingPositions;

				if(count _bPos == 0) exitWith {
					player setPos (getMarkerPos (life_spawn_point select 0));
				};

				_pos = _bPos call BIS_fnc_selectRandom;
				player setPosATL _pos;
			} else {
				player setPos (getMarkerPos (life_spawn_point select 0));
			};
		};
	} else {
		_spawnPos = (call compile format["%1", life_spawn_point select 0]) call BIS_fnc_selectRandom;
		_spawnPos = _spawnPos buildingPos 0;
		player setPosATL _spawnPos;
	};
	_text = format["%2 %1",life_spawn_point select 1,localize "STR_Spawn_Spawned"];
};

private _camera = "camera" camCreate [position player select 0, (position player select 1) + 50, 100];
_camera cameraEffect ["External","BACK"];
_camera camPrepareFOV 0.5;
_camera camPrepareTarget player;
_camera camCommitPrepared 0;

cutText [_text,"BLACK IN",5];
player say3D "welcome2serv";

_camera camSetTarget player;
_camera camSetPos [position player select 0, position player select 1, 3];
_camera cameraEffect ["Internal","BACK"];
_camera camSetFOV .5;
_camera camCommit 5;

waitUntil {camCommitted _camera};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;

if(life_firstSpawn) then {
	life_firstSpawn = false;
	[] spawn UnionClient_system_welcomeNotification;

	if (life_gov) then {
		[0,format["Губернатор %1 прибыл на остров. All Hail the Governor!",name player]] remoteExecCall ["UnionClient_system_broadcast",RCLIENT];
	} else {
		if (GVAR_RTITLE(player) isEqualTo "") then {
			[0,format["%1 прибыл на остров",GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",RCLIENT];
		} else {
			[0,format["%1 %2 прибыл на остров",GVAR_RTITLE(player),GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",RCLIENT];
		};
	};

	life_connected = true;
	[21] call UnionClient_session_updatePartial;
};
[4] call UnionClient_session_updatePartial;
[] call UnionClient_system_updateViewDistance;
setterrainGrid life_grassIndex;
player switchCamera "EXTERNAL";

if (playerSide in [civilian,independent]) then {
	if (life_firstTime) then {
		life_firstTime = false;
		[15] call UnionClient_session_updatePartial;
	};

	if (life_myserver == 0) then {
		[] spawn UnionClient_system_serverLock;
	};
};

[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;