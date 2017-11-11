/*
	
	Filename: 	UnionClient_system_makeHimBlind.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];

if (isNull _unit OR (player distance _unit > 3) OR (EQUAL(player,_unit)) OR !isPlayer _unit) exitWith {}; //Not valid
if (_unit GVAR ["isBlind",false]) exitWith {};
if !(GVAR_RESTRAINED(_unit)) exitWith {};

if( ([player] call UnionClient_system_isSafeZone) && !(ISPSIDE(west))) exitWith {hint localize "STR_NOTF_GreenZone"}; 
if( ([player] call UnionClient_system_isShopNear) && !(ISPSIDE(west))) exitWith {hint localize "STR_NOTF_ShopNear"};
if (!("extItem_headBag" in (magazines player)) && !(ISPSIDE(west))) exitWith {hint localize "STR_NOTF_DontHaveItem"};
	
player say3D "blind";
["extItem_headBag"] call UnionClient_system_removeItem;
[player,steamid] remoteExec ["UnionClient_system_blinded",_unit];