/*
	
	Filename: 	UnionClient_system_storeVehicle.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_nearVehicles","_vehicle","_sp","_ishouse","_trunkData","_typeV","_action","_illegal","_index","_fromAction","_point"];

_ishouse = param [0,false,[false,objNull]];
_fromAction = param [3,["",""],[]];
_sp = [_fromAction,0,"",[""]] call BIS_fnc_param;
_typeV = [_fromAction,1,"",[""]] call BIS_fnc_param;

if (typeName _ishouse == "OBJECT") then {
	_point = _ishouse;
} else {_point = cursorObject};

if (_sp == "") then {
	_sp = "none"; 
	_typeV = "Car";
};

if !(NOTINVEH(player)) then {
	_vehicle = objectParent player;
} else {
	_nearVehicles = nearestObjects[getPosATL _point,["LandVehicle","Air","Ship"],30]; //Fetch vehicles within 30m.
	if(count _nearVehicles > 0) then {
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehData = _x GVAR ["vehicle_info_owners",[]];
			if(count _vehData  > 0) then {
				_vehOwner = (_vehData select 0) select 0;
				if (EQUAL(steamid,_vehOwner)) exitWith {
					_vehicle = _x;
				};
			};
		} foreach _nearVehicles;
	};
};

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_NoNPC"};
if(isNull _vehicle) exitWith {};

private _donatVehLastFire = _vehicle GVAR "donatVehLastFire";
if (!isNil "_donatVehLastFire" && {typeOf _vehicle in server_donat_vehicles} && {(time - _donatVehLastFire)  < 1200}) exitWith {
	hint format ["Вы стреляли из боевой техники %1 минут(ы) назад. Убрать ее можно будет через %2 минут(ы)", round ((time - _donatVehLastFire) / 60), round ((1200 - (time - _donatVehLastFire))/60)];
};

if !(EQUAL(crew _vehicle,[])) exitWith {hint "В технике кто-то есть."};

_type = switch(true) do {
	case (_vehicle isKindOf "LandVehicle"): {"Car"};
	case (_vehicle isKindOf "Air"): {"Air"};		
	case (_vehicle isKindOf "Ship"): {"Ship"};		
};

if (_typeV != _type) exitWith { hint format ["Вы пытаетесь поставить в гараж технику класса %1, но гараж расчитан на технику класса %2. Найдите гараж соответствующего формата",_type,_typeV]; };

_trunkData = _vehicle GVAR ["Trunk",[[],0]];
if (typeName _ishouse != "OBJECT" && count (_trunkData select 0) != 0) exitWith {hint "В ваш частный гараж не поместится груженная техника. Отгоните ее в общественный гараж или освободите багажник."};

_illegal = false;
{
	_index = [_x select 0,life_illegal_items] call UnionClient_system_index;
	if(_index != -1) exitWith {_illegal = true;};
} foreach (_trunkData select 0);


if (_illegal) then {
	_action = [
	format["У вас в багажнике есть нелегальные ресурсы, которые больше не сохраняются в гараже! Вы уверены, что хотите поставить технику в гараж?"],
	"Внимание!",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
	] call BIS_fnc_guiMessage;
	
	if (_action) then {
		[[_vehicle,false,player,_sp],"vehicleStore","TON",false] call UnionClient_system_hcExec;
		hint localize "STR_Garage_Store_Server";
		life_garage_store = true;
	};

} else {	
	[[_vehicle,false,player,_sp],"vehicleStore","TON",false] call UnionClient_system_hcExec;
	hint localize "STR_Garage_Store_Server";
	life_garage_store = true;
};