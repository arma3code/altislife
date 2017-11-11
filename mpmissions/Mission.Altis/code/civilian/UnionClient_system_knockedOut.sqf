/*

	Filename: 	UnionClient_system_knockedOut.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
private _who = [_this,1,"",[""]] call BIS_fnc_param;
if (isNull _target) exitWith {};
if (_target != player) exitWith {};
if (_who == "") exitWith {};

titleText ["Вас сбили с ног!","PLAIN"];
systemChat format ["Вас сбил с ног игрок с ID %1. Запомните этот ID на случай нарушений правил сервера",_who];	

player say3D "kick";
[player,"knoked",true] call CBA_fnc_setVarNet;
disableUserInput true;

["CL3_anim_Knockout1In"] call UnionClient_system_animDo;
uiSleep 8;

[player,"knoked"] call UnionClient_system_clearGlobalVar;
[player,"robbed"] call UnionClient_system_clearGlobalVar;
disableUserInput false;