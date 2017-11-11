/*

	Filename: 	fn_vehicleAdacRecolor.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
/*
params [
    ["_vehicle",objNull,[objNull]],
    ["_color","",""],Эта херь когда-то работала, но я хз что за формат у  _vehicle поэтому - так.
	"_plate","_uid"
];*/

private _vehicle = param [0];
private _color = param [1];

if (isNull _vehicle) exitWith {diag_log "repaintVehicle canceled!";};

_dbInfo = _vehicle getVariable ["dbInfo",[]];
if (count _dbInfo isEqualTo 0) exitWith {};
private _uid = _dbInfo select 0;
private _plate = _dbInfo select 1;
[format ["UPDATE vehicles SET color='%1' WHERE plate='%2' AND pid='%3'",_color,_plate,_uid],1] call DB_fnc_asyncCall;