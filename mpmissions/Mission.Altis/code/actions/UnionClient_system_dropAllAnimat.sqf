/*

	Filename: 	UnionClient_system_dropAllAnimat.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance","_insz","_progress_rscLayer","_nono"];
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(life_action_inUse) exitWith {};
if ([player] call UnionClient_system_isSafeZone) exitWith {hint localize "STR_NOTF_GreenZone"};
if ([player] call UnionClient_system_isShopNear) exitWith {hint localize "STR_NOTF_ShopNear"};

_title = format["Раздеваем %1",(_curTarget GVAR ["realname",""])];

_nono = false;
_curTarget SVAR ["robbedinv",steamid,true];
disableSerialization;
titleText[_title,"PLAIN"];
call UnionClient_actions_inUse;
_cP = 0;
private _cpRate = 0.01;
while {true} do {
	_cP = _cP + _cpRate;
	[_cP,"criminal"] call UnionClient_system_progressBar;
	if (_cP >= 1 OR life_interrupted OR (call UnionClient_system_isInterrupted)) exitWith {};
	if(_curTarget GVAR ["robbedinv",""] != steamid) exitWith {_nono= true};
	call UnionClient_animation_kneelWork;
	uiSleep 0.26;
};
["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;
if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};
if(_nono) exitWith {hint "Вам помешали"};

if(!alive player OR (player GVAR ["tazed",false]) OR (GVAR_RESTRAINED(player))) exitWith {life_action_inUse = false;life_is_processing = false;};
if(life_interrupted) exitWith {titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_action_inUse = false;
[player] remoteExec ["UnionClient_system_dropAll",_curTarget];