/*
	
	Filename: 	UnionClient_system_dropDeadBody.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (isNull life_DraggedBody) exitWith {};

detach life_DraggedBody;
player removeWeapon "EXT_FakePrimaryWeapon";
if (NOTINVEH(player) && !(call UnionClient_system_isInterrupted)) then {	
	[] call UnionClient_system_animDo;
};

[life_DraggedBody,"draggedBy"] call UnionClient_system_clearGlobalVar;
[life_DraggedBody,"unconsciousrevivedefault"] remoteExecCall ["UnionClient_system_animSync",RCLIENT];

life_DraggedBody = ObjNull;

player removeAction life_actions_drag;