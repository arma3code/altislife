/*

	Filename: 	UnionClient_system_logout.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _deathmax = param [0,false,[false]];
disableSerialization;
player allowDamage false;
//disableUserInput true;
showChat false;
hintSilent "";

closeDialog 0;
[] call UnionClient_session_updateRequest; //call our silent sync.

private _camera = "camera" camCreate [position player select 0, (position player select 1) + 0.5, (position player select 2) + 0.5];
_camera cameraEffect ["External","BACK"];
_camera camPrepareFOV 0.7;
_camera camPrepareTarget (position player);
_camera camCommitPrepared 0;

private _text = "";
if (_deathmax) then {
	_text = "<t size='1.3' color='#ccff00'>У вас закончились жизни,<br/>%1!</t><br/><br/><t size='0.6'>Возвращайтесь после бури!</t>";
} else {
	cutText ["","BLACK",6];
	_text = "<t size='1.3' color='#ccff00'>До новых встреч,<br/>%1!</t><br/><br/><t size='0.6'>Идет сохранение данных на сервере...</t>";
};

[format[_text,name player],0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;

0 fadeSound 1;
0 fadeMusic 1;
0 fadeRadio 1;
0 fadeSpeech 1;

_camera camSetPos [position player select 0, (position player select 1) + 20, 50];
_camera camSetTarget (position player);
_camera camCommit 8;

waitUntil { camCommitted _camera };

showChat true;
//disableUserInput false;
["",0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;
["Aborted",true,false] call BIS_fnc_endMission;