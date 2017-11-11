/*
	
	Filename: 	UnionClient_system_restrainAction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit OR (player distance _unit > 3) OR !isPlayer _unit OR EQUAL(player,_unit)) exitWith {}; //Not valid
if (GVAR_RESTRAINED(_unit)) exitWith {};
if (([player] call UnionClient_system_isSafeZone) && !(playerside in [west,east])) exitWith {hint localize "STR_NOTF_GreenZone"}; 
if (([player] call UnionClient_system_isShopNear) && !(playerside in [west,east])) exitWith {hint localize "STR_NOTF_ShopNear"};
if (_unit GVAR ["inPBfight",false]) exitWith {hint localize "STR_NOTF_PlayerInFight"};
	
private _sound = if (playerSide in [civilian,independent]) then {
	["action_ducttape_0", "action_ducttape_1", "action_ducttape_2"] call BIS_fnc_selectRandom;	
} else {	
	"cuff";
};
	
player say3D _sound;
titleText [localize "STR_NOTF_TargetRestrained","PLAIN"];

[_unit,"restrained",true] call CBA_fnc_setVarNet;
[player,steamid] remoteExec ["UnionClient_system_restrain",_unit];