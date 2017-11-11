/*
	
	Filename: 	UnionClient_system_buyClothes.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (EQUAL((lbCurSel 3101),-1)) exitWith {titleText[localize "STR_Shop_NoClothes","PLAIN"];};

private _price = 0;
{
	if ((count _x) > 0) then {
		_price = _price + (_x select 1);
	};
} foreach life_clothing_purchase;

if (_price > CASH) exitWith {titleText[localize "STR_Shop_NotEnoughClothes","PLAIN"];};

life_clothing_purchase params ["_uniform","_hat","_glasses","_vest","_backpack"]; //Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)

_price = 0;

//Check uniform purchase.
if (count _uniform > 0) then {
	if ([(_uniform select 0)] call UnionClient_system_addItem) then {
		_price = _price + (_uniform select 1);
	};
};

//Check hat
if (count _hat > 0) then {
	if ([(_hat select 0)] call UnionClient_system_addItem) then {
		_price = _price + (_hat select 1);
	};
};

//Check glasses
if (count _glasses > 0) then {
	if ([(_glasses select 0)] call UnionClient_system_addItem) then {
		_price = _price + (_glasses select 1);
	};
};

//Check Vest
if (count _vest > 0) then {
	if ([(_vest select 0)] call UnionClient_system_addItem) then {
		_price = _price + (_vest select 1);
	};
};

//Check Backpack
if (count _backpack > 0) then {
	if ([(_backpack select 0)] call UnionClient_system_addItem) then {
		_price = _price + (_backpack select 1);
	};
};

life_clothing_purchase = [[],[],[],[],[]];

["cash","take",_price] call UnionClient_system_myCash;
player say3D "caching";
[format["Вы купили снаряжения на $%1",[_price] call UnionClient_system_numberText],"done"] call UnionClient_system_hint;
[] call UnionClient_system_saveGear;
closeDialog 0;