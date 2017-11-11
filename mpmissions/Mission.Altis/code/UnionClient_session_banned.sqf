/*
	
	Filename: 	UnionClient_session_banned.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
(findDisplay 46) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu
["Banned",false,false] call BIS_fnc_endMission;