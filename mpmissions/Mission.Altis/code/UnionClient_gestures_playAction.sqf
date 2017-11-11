/*

	Filename: 	UnionClient_gestures_playAction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\script_macros.hpp"
private _gesture = param [0,"",[""]];

if (_gesture in ["CRPTHSForward", "CRPTHSStop", "CRPTHSRegroup", "CRPTHSEngage", "CRPTHSPoint", "CRPTHSHold", "CRPTHSWarning"] && {((ANIMSTATE) select [0, 12]) in ["amovpercmstp", "amovpercmwlk", "amovpercmtac"]} && {weaponLowered player} ) then {
	_gesture = format ["%1StandLowered", _gesture];
};

player playAction _gesture;