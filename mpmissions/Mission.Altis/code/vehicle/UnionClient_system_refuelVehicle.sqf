/*

	Filename: 	UnionClient_system_refuelVehicle.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private ["_vehicle","_capacity","_litres","_cost","_level","_tick","_delay"];
if(life_action_inUse) exitWith {hint localize "STR_NOTF_Action"};
if !(NOTINVEH(player)) exitWith { hint "У вас недостаточно длинные руки, чтобы заправляться прямо из машины." };
_vehicle = nearestObjects [(_this select 0), ["Air", "LandVehicle", "Armored"], 20];
if (count _vehicle == 0) exitWith { hint "В радиусе 20 метров нет техники!"; };
_vehicle = _vehicle select 0;

if (isEngineOn _vehicle) exitWith { hint "Выключите двигатель перед началом заправки!" };

_capacity = getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> "fuelCapacity");

_litres = 0;
_cost = 0;
_level = fuel _vehicle;
_delay = 0.5;
if (_vehicle isKindOf "Air") then { _delay = _delay / 3; };

call UnionClient_actions_inUse;

while {_level < 1} do {
	uiSleep _delay;	
	if (player distance (_this select 0) > 5) exitWith {};
	
	_litres = _litres + 1;
	
	_cost = _cost + 3;
	if (BANK < _cost) exitWith {};
	
	_tick = 1 / _capacity;
	_level = _level + _tick;
	if (_level > 1) then { _level = 1; };
	
	hintSilent parseText format["Сеть заправок<br /><t size='1.5' color='#00a8ff'>""АлтисНефтьГаз""</t><br /><br /><t color='#cec25b'>Литров:</t> %1<br/><t color='#cec25b'>Стоимость:</t> $%2<br/><t color='#cec25b'>Заправлено:</t> %3%4", _litres, [_cost] call UnionClient_system_numberText, floor (_level * 100), "%"];
};

hintSilent parseText format["Сеть заправок<br /><t size='1.5' color='#00a8ff'>""АлтисНефтьГаз""</t><br /><br /><t color='#cec25b'>Литров:</t> %1<br/><t color='#cec25b'>Стоимость:</t> $%2<br/><t color='#cec25b'>Заправлено:</t> %3%4<br/><br/><t color='#00FF00'>Заправка закончена</t>", _litres, [_cost] call UnionClient_system_numberText, floor (_level * 100), "%"];

["atm","take",_cost] call UnionClient_system_myCash;
life_tmp_tax = life_tmp_tax + _cost;	

if(!local (_vehicle)) then {	
	[_vehicle,_level] remoteExecCall ["UnionClient_system_setFuel",_vehicle];
} else {
	_vehicle setFuel _level;
};
life_action_inUse = false;