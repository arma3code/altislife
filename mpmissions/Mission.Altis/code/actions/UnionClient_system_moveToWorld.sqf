/*

	Filename: 	UnionClient_system_moveToWorld.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (true) exitWith {hint "Аэропорт прикрыли пока"};
private _price = 25000;
private _newMap = switch (worldName) do {
	case "Altis": {"Tanoa"};
	case "Tanoa": {"Altis"};
	default {""};
};

if (EQUAL(_newMap,"")) exitWith {};

/*private _myDLS = getDLCs 1;
if !(395180 in _myDLS) exitWith {
	hint localize "STR_NOTF_ApexNeed";
	openDLCPage 395180;
};*/

private _action = [
	format[localize "STR_NOTF_PlayerTransferAsk",worldName,_newMap,[_price] call UnionClient_system_numberText,worldName,_newMap],
	localize "STR_NOTF_PlayerTransferTitle",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	if (CASH < _price) exitWith {hint localize "STR_ATM_NotEnoughCash"};
	["cash","take",_price] call UnionClient_system_myCash;

	//disableSerialization;
	//player allowDamage false;
	//disableUserInput true;
	showChat false;
	hintSilent "";

	[] call UnionClient_session_updateRequest;
	[steamid,_newMap,player] remoteExec ["TON_fnc_changePlayerServerMap",RSERV];
	hint localize "STR_NOTF_SendingData";

	waitUntil {life_playerTrasnferDone};
	hintSilent "";

	private _camera = "camera" camCreate [position player select 0, (position player select 1) + 0.5, 0.5];
	_camera cameraEffect ["External","BACK"];
	_camera camPrepareFOV 0.7;
	_camera camPrepareTarget player;
	_camera camCommitPrepared 0;

	cutText ["","BLACK",6];

	[format[localize "STR_NOTF_LogOutText",name player],0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;

	_camera camSetPos [position player select 0, (position player select 1) + 10, 70];
	_camera camSetTarget player;
	_camera camCommit 8;

	waitUntil { camCommitted _camera };

	showChat true;
	disableUserInput false;
	["",0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;
	["Aborted",true,false] call BIS_fnc_endMission;
};