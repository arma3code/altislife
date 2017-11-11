/*

	Filename: 	UnionClient_system_knockoutAction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if (isNull _target) exitWith {};
if (!isPlayer _target) exitWith {};
if (player distance _target > 4) exitWith {};
if (([player] call UnionClient_system_isShopNear) && (playerside != west)) exitWith {hint "Нельзя сбивать с ног рядом с продавцами"};
life_knockout = true;
["CL3_anim_PunchRandom"] call UnionClient_system_animDo;

uiSleep 0.5;
player say3D "kick";

[_target,steamid] remoteExec ["UnionClient_system_knockedOut",_target];
uiSleep 3;
life_knockout = false;