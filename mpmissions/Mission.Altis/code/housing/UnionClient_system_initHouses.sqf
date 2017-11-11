/*

	Filename: 	UnionClient_system_initHouses.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _houses = param [0,[],[[]]];
if (EQUAL(_houses,[])) exitWith {systemChat "У вас нет недвижимости"};

systemChat "Загрузка недвижимости...";
//_wait = round(random(8));
//uiSleep _wait;	
//houses.pos, houses.classname, houses.servermap
life_houses_count = count _houses;
{
	if (EQUAL((_x select 2),worldName)) then {
		life_houses pushBack [_x select 0,_x select 1];
	};
} forEach _houses;

private["_house","_houseName","_numOfDoors","_marker","_markerID"];
{	
	_house = nearestObject [_x select 0,_x select 1];
	if (isNull _house) exitWith {hint format["(%1)\n\nПроблема с домом. Сообщите об этом администрации!",_x]};

	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
		
	_house SVAR ["house_owner",[steamid,profileName],true];
	_house SVAR ["locked",true,true];
	[_house,"house_forSell"] call UnionClient_system_clearGlobalVar;
	
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house animate [format["door_%1_rot",_i],0];
		_house SVAR [format["bis_disabled_Door_%1",_i],1,true];		
	};
	
	_markerID = round ((_x select 0) select 0);
	_marker = createMarkerLocal [format["house_%1",_markerID],_x select 0];
	_marker setMarkerTextLocal format["%1",_houseName];
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";

	life_vehicles pushBack _house;
	
} foreach life_houses;

systemChat format ["Загрузка недвижимости на острове %1 завершена. Объектов во владении: %2 (В сумме: %3)",worldName,count life_houses,life_houses_count];