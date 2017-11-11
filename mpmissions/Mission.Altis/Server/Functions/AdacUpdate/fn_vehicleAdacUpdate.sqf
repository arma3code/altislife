/*

	Filename: 	fn_vehicleAdacUpdate.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
	Тюнинг:
	Формат [["boxes",3],["nitro"]]
*/

#include "\UnionServer\script_macros.hpp"
params [
    ["_vehicle",objNull,[objNull]],
    ["_config",[],[[]]],
	"_plate","_uid"
];

if (isNull _vehicle) exitWith {}; //NULL

_dbInfo = _vehicle getVariable ["dbInfo",[]];
if (count _dbInfo isEqualTo 0) exitWith {};
_uid = _dbInfo select 0;
_plate = _dbInfo select 1;
[format ["UPDATE vehicles SET tuning_data='%3' WHERE pid='%1' AND plate='%2'",_uid,_plate,_config],1] call DB_fnc_asyncCall;