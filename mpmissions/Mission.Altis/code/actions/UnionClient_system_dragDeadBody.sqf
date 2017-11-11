/*

	Filename: 	UnionClient_system_dragDeadBody.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (EQUAL(RIFLE,"")) then {player addWeapon "EXT_FakePrimaryWeapon"};
player selectWeapon RIFLE;
life_DraggedBody = param [0,ObjNull,[ObjNull]];
if (isNull life_DraggedBody) exitWith {};
if (!(life_DraggedBody isKindOf "CAManBase") OR (player distance life_DraggedBody > 5) OR life_DraggedBody == player) exitWith {life_DraggedBody = ObjNull};

if (!isNil {life_DraggedBody GVAR "draggedBy"}) exitWith {life_DraggedBody = ObjNull};
[life_DraggedBody,"draggedBy",player] call CBA_fnc_setVarNet;

life_DraggedBody setPosASL (getPosASL player vectorAdd (vectorDir player));
life_DraggedBody setDir (getDir player + 180);
[life_DraggedBody,"AinjPfalMstpSnonWrflDnon_carried_Up"] remoteExecCall ["UnionClient_system_animSync",RCLIENT];
["AcinPknlMstpSnonWnonDnon_AcinPercMrunSnonWnonDnon"] call UnionClient_system_animDo;

uiSleep 15;

[life_DraggedBody,"AinjPfalMstpSnonWnonDf_carried_dead"] remoteExecCall ["UnionClient_system_animSync",RCLIENT];
["AcinPercMstpSnonWnonDnon"] call UnionClient_system_animDo;

life_DraggedBody attachTo [player, [0.1,-0.1,-1.25], "LeftShoulder"];

life_actions_drag = player addAction["<img image='\union_pack\icons\ui\s_icon_stop.paa' /> " + localize "STR_pAct_DropDraggedBody",UnionClient_system_dropDeadBody,"",0,false,false];

[] spawn {
	while{true} do {
		if (!(NOTINVEH(player)) OR !alive life_DraggedBody OR (call UnionClient_system_isInterrupted)) exitWith {[] call UnionClient_system_dropDeadBody};
		uiSleep 0.3;
	};
};