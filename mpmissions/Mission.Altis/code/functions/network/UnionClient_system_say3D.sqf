/*

	Filename: 	UnionClient_system_say3D.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\..\script_macros.hpp"
private["_object","_sound"];
_object = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_sound = [_this,1,"",[""]] call BIS_fnc_param;

if(isNull _object OR _sound == "") exitWith {};
if (_object distance player > 10) exitWith {};

_object say3D _sound;