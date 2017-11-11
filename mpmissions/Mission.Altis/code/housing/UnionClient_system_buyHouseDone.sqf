/*
	
	Filename: 	UnionClient_system_buyHouseDone.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _house = param [0,ObjNull,[ObjNull]];
private _housePos = param [1,[],[[]]];
if (isNull _house or EQUAL(_housePos,[])) exitWith {hint "Что-то не так с домом"};
if (!isClass (missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf _house)) exitWith {hint "Здание не продается"};

private _price = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"price");
if (BANK < _price) exitWith {hint format [localize "STR_House_NotEnough"]};

[[steamid,_house,player],"addHouse","TON",false] call UnionClient_system_hcExec;

_house SVAR ["house_owner",[steamid,GVAR_RNAME(player)],true];
_house SVAR ["locked",true,true];
[_house,"house_forSell"] call UnionClient_system_clearGlobalVar;

["atm","take",_price,"buyHouse"] call UnionClient_system_myCash;
life_tmp_tax = life_tmp_tax + _price;	
life_vehicles pushBack _house;

//houses.pos, houses.classname
life_houses pushBack [_housePos,typeOf _house];
life_houses_count = life_houses_count + 1;

private _houseName = FETCH_CONFIG2(getText,"CfgVehicles",typeOf _house,"displayName");
private _markerID = round (_housePos select 0);
private _marker = createMarkerLocal [format["house_%1",_markerID],_housePos];
_marker setMarkerTextLocal format["%1",_houseName];
_marker setMarkerColorLocal "ColorBlue";
_marker setMarkerTypeLocal "loc_Lighthouse";
private _numOfDoors = FETCH_CONFIG2(getNumber,"CfgVehicles",typeOf _house,"numberOfDoors");
for "_i" from 1 to _numOfDoors do {
	_house SVAR[format["bis_disabled_Door_%1",_i],1,true];
};
hint "Поздравляем! Вы купили дом!";