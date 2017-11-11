/*
	
	Filename: 	UnionClient_actions_chairSiting.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params [
	["_chair",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];

private _cPosPlayer = getPosATL _unit;
private _cPosChair = getPosATL _chair;

[_unit,"crew"] remoteExecCall ["UnionClient_system_animSync",RCLIENT];
_unit setPosATL _cPosChair; 
_unit setDir ((getDir _chair) - 180);
_unit setPosATL [getPosATL _unit select 0, getPosATL _unit select 1,((getPosATL _unit select 2) +1)];

uiSleep 1;

if ((getPosATL _unit) distance _cPosPlayer > 100) then {
	[_unit,"stand"] remoteExecCall ["UnionClient_system_animSync",RCLIENT];
	_unit setPosATL _cPosPlayer;		
};

AID_CHROUT = _unit addAction ["<img image='\union_pack\icons\ui\s_icon_chair.paa' /> Встать со стула",UnionClient_actions_chairSitingUp,"",0,false,false,"",'true'];

waitUntil {uiSleep 0.3; animationState _unit != "crew"};

_unit removeAction AID_CHROUT;