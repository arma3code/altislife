/*
	
	Filename: 	UnionClient_system_colorVehicle.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_vehicle",Objnull,[Objnull]],
	["_color","",[""]],
	["_global",true,[true]]
];

format["VehicleColor - This: %1",_this] call UnionClient_system_log;

if (isNull _vehicle OR (EQUAL(_color,""))) exitWith {};
if (!alive _vehicle) exitWith {};

if !(isClass (missionConfigFile >> "LifeCfgVehTextures" >> _color)) exitWith {};

{
	if !(EQUAL(_x,"")) then {
		if (_global) then {
			_vehicle setObjectTextureGlobal [_forEachIndex,_x];
		} else {
			_vehicle setObjectTexture [_forEachIndex,_x];
		};
	};
} forEach (M_CONFIG(getArray,"LifeCfgVehTextures",_color,"texture"));

if (local _vehicle) then {
	_vehicle SVAR ["Life_VEH_color",_color,true];	
};