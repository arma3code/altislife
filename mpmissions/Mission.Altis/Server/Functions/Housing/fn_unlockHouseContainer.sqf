/*
	Filename: 	fn_unlockHouseContainer.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

    Description:
    Update inventory "y" in container
	
	_house,_housePos,_houseClass,houses.trunk, houses.inventory, houses.slots
	
*/
private _house = [_this,0,objNull,[objNull]] call BIS_fnc_param;
private _unit = [_this,1,objNull,[objNull]] call BIS_fnc_param;

if (isNull _house OR isNull _unit) exitWith {};

private _id = owner _unit;
private _housePos = getPosATL _house;
private _houseClass = typeOf _house;

_query = format ["SELECT trunk, inventory, slots FROM houses WHERE pos='%1' AND classname='%2'",_housePos,_houseClass];
private _containers = [_query,2] call DB_fnc_asyncCall;
if (_containers isEqualTo []) exitWith {diag_log format ["ERROR fn_unlockHouseContainer:_containers = %1",_containers]};
private _trunk = [_containers select 0] call DB_fnc_mresToArray;
if (_trunk isEqualType "") then {_trunk = call compile format ["%1", _trunk];};
private _inv = [_containers select 1] call DB_fnc_mresToArray;
if (_inv isEqualType "") then {_inv = call compile format ["%1", _inv];};

[_trunk,_inv,_containers select 2,_house,_housePos,_houseClass] remoteExecCall ["UnionClient_system_houseContainer",_id];
diag_log format ["OK fn_unlockHouseContainer:_containers = %1",[_trunk,_inv,_containers select 2,_house,_housePos,_houseClass]];