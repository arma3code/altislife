/*
	
	Filename: 	UnionClient_system_sellHouseDone.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_house","_price","_index","_house_box","_numOfDoors"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_price = [_this,1,0,[0]] call BIS_fnc_param;

if(isNull _house) exitWith {hint "Ошибка. Обратитесь к администратору."};

[_house,"locked"] call UnionClient_system_clearGlobalVar;
private _markerID = round ((getPosATL _house) select 0);
deleteMarkerLocal format["house_%1",_markerID];

_index = life_vehicles find _house;
if(_index != -1) then {
	life_vehicles set[_index,-1];
	life_vehicles = life_vehicles - [-1];
};
////houses.pos, houses.classname
{   
	if ((_x select 0) isEqualTo ([_house] call UnionClient_system_getHousePos)) then {
		life_houses set[_forEachIndex,-1];	
	};
} forEach life_houses;
life_houses = life_houses - [-1];
life_houses_count = life_houses_count - 1;
	
_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
for "_i" from 1 to _numOfDoors do {
	_house SVAR[format["bis_disabled_Door_%1",_i],0,true];
};

_house_box = _house GVAR ["house_box",objNull];
if (!isNull _house_box) then {
	deleteVehicle _house_box;
};

[_house,"house_owner"] call UnionClient_system_clearGlobalVar;
[_house,"house_sold"] call UnionClient_system_clearGlobalVar;

_house SVAR ["house_forSell",true,true];

["atm","add",_price,"sellHouse"] call UnionClient_system_myCash;	
hint format["Дом успешно продан за $%1!",[_price] call UnionClient_system_numberText];