/*
	Filename: 	fn_updateHouseSlots.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
*/
params [
    ["_house",Objnull,[Objnull]],
    ["_slots",0,[0]],
    ["_unit",objNull,[objNull]]
];
if (isNull _house || isNull _unit) exitWith {};

private _id = owner _unit;
private _housePos = getPosATL _house;
private _houseClass = typeOf _house;

private _query = format ["UPDATE houses SET slots='%1' WHERE owned='1' AND pos='%2' AND classname='%3'",_slots,_housePos,_houseClass];
[_query,1] call DB_fnc_asyncCall;

[format ["Вы увеличили количество слотов до %1",_slots],"done"] remoteExecCall ["UnionClient_system_hint",_id];
