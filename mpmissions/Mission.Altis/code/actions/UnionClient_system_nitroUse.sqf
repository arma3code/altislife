/*
	
	Filename: 	UnionClient_system_nitroUse.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (NOTINVEH(player)) exitWith {hint localize "STR_NOTF_NotInVeh"};
private _vehicle = objectParent player;
private _adacNitroUsed = _vehicle GVAR ["adacNitroUsed",-1];
if (EQUAL(_adacNitroUsed,-1)) exitWith {hint localize "STR_NOTF_VehNitroError"};
if (_adacNitroUsed > 0 && {(time - _adacNitroUsed) < 600}) exitWith {hint localize "STR_NOTF_VehNitroCD"};
if ((speed _vehicle) <= 20) exitWith {hint localize "STR_NOTF_VehNitroSpeed"};
if (fuel _vehicle < 0.5) exitWith {hint localize "STR_NOTF_VehNitroFuel"};

[_vehicle,"adacNitroUsed",time] call CBA_fnc_setVarNet;

titleText[localize "STR_NOTF_VehNitroUsed","PLAIN"];
player say3D "action_nitro";

private _vel = velocity _vehicle;  
private _dir = direction _vehicle;  
private _speed = 40;
_vehicle setVelocity [(_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed), (_vel select 2)];

if(!local _vehicle) then {	
	[_vehicle,(fuel _vehicle) - 0.5] remoteExecCall ["UnionClient_system_setFuel",_vehicle];
} else {
	_vehicle setFuel ((fuel _vehicle) - 0.5);
};