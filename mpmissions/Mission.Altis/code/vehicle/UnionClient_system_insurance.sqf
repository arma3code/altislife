/*

	Filename: 	UnionClient_system_insurance.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\..\script_macros.hpp"
private["_nearVehicles","_vehicle","_price","_action","_type","_sp","_basePrice"];

_sp = [(_this select 3),0,"",[""]] call BIS_fnc_param;
_typeV = [(_this select 3),1,"",[""]] call BIS_fnc_param;

if(_sp == "") exitWith { hint "Ошибка. Не задана точка страхования. Сообщите админу."; };
if(playerSide in [east,west]) exitWith {hint "Служебную технику нельзя страховать. За нее платит государство :)";};

if !(NOTINVEH(player)) then {
	_vehicle = objectParent player;
} else {
	_nearVehicles = nearestObjects[getPosATL player,["LandVehicle","Air"],50];
	if(count _nearVehicles > 0) then {
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehData = _x GVAR ["vehicle_info_owners",[]];
			if(count _vehData  > 0) then
			{
				_vehOwner = (_vehData select 0) select 0;
				if (EQUAL(steamid,_vehOwner)) exitWith {
					_vehicle = _x;
				};
			};
		} foreach _nearVehicles;
	};
};

if(isNil "_vehicle") exitWith {hint "Проверьте, чтобы ваша техника была рядом с гаражом и повторите попытку"};
if(isNull _vehicle) exitWith {};
if(_vehicle GVAR ["isInsured",false]) exitWith { hint "Эта техника уже застрахована"};
if(_vehicle GVAR ["insPrice",0] == 0) exitWith { hint "Эта техника была приобретена до ввода системы страхования и у нее не указана цена покупки. Поэтому мы не можем посчитать сумму страховой выплаты и оказать услугу страхования."};
if(!(_vehicle in life_vehicles)) exitWith {hint "Рядом нет техники, которая принадлежит вам"};

_type = switch(true) do {
	case (_vehicle isKindOf "LandVehicle"): {"Car"};
	case (_vehicle isKindOf "Air"): {"Air"};		
};

if (_typeV != _type) exitWith { hint format ["Вы пытаетесь застраховать технику класса %1 у страховщика класса %2. Найдите страховщика соответствующего формата",_type,_typeV]; };
if (_type == "Air" && playerSide == independent) exitWith { hint "Повстанцы могут страховать только наземную технику!"; };

if (["B_mas_HMMWV",(typeOf _vehicle)] call BIS_fnc_inString) exitWith {hint "Страховка военных хаммеров невозможна"};
if ((typeOf _vehicle) in ["I_MRAP_03_F", "B_MRAP_01_F", "O_MRAP_02_F", "B_G_Offroad_01_armed_F"]) exitWith {hint "Страховка бронированной техники невозможна"};

_basePrice = _vehicle GVAR ["insPrice",0];
if (_basePrice == 0) exitWith {};

_price = round (_basePrice*0.05); //7% от стоимости аренды
if (_type == "Car" && playerSide == independent) then {_price = _price * 2};

_veh_name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
_action = [
	format[localize "STR_Garage_Insur_MSG", _veh_name,[_price] call UnionClient_system_numberText ],
	localize "STR_Garage_Insur_Title",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(BANK < _price) exitWith { hint format["У вас нет необходимой суммы для страхования!\n\nВам необходимо $%1",[_price] call UnionClient_system_numberText]; };
	hint format["Вы застраховали свою технику (%2) за $%1.\n\nЕсли она взорвется в результате ДТП, то вы сможете получить компенсацию в гараже!",[_price] call UnionClient_system_numberText,_veh_name];
	["atm","take",_price,"insuranceDeposit"] call UnionClient_system_myCash;	

	_vehicle SVAR ["isInsured",true,true];	

	closeDialog 0;
};