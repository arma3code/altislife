/*

	Filename: 	UnionClient_system_discount.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_price",0,[0]],
	["_type",0,[0]]
];

private _ret = _price;

switch (true) do {
	case (ISPSIDE(west)) : {
		switch (_type) do {
			case 0 : { //минус к цене
				_ret = switch (FETCH_CONST(life_donator)) do {
					case 0: {_price};
					case 1: {round(_price - (_price * 0.3))};
					case 2: {round(_price - (_price * 0.4))};
					case 3: {round(_price - (_price * 0.5))};
					case 4: {round(_price - (_price * 0.7))};
				};
			};
			case 1 : { //плюс к сумме
				_ret = switch (FETCH_CONST(life_donator)) do {
					case 0: {_price};
					case 1: {round(_price + (_price* 0.2))};
					case 2: {round(_price + (_price* 0.3))};
					case 3: {round(_price + (_price* 0.4))};
					case 4: {round(_price + (_price* 0.6))};
				};
			};
			default {}; 
		};
	}; 
	case (playerSide in [civilian,independent]) : {
		switch (_type) do {
			case 0 : { //минус к цене
				_ret = switch (FETCH_CONST(life_donator)) do {
					case 0: {_price};
					case 1: {round(_price - (_price * 0.2))}; //20%
					case 2: {round(_price - (_price * 0.3))}; //30% etc
					case 3: {round(_price - (_price * 0.4))};
					case 4: {round(_price - (_price * 0.6))};
				};
			};
			case 1 : { //плюс к сумме
				_ret = switch (FETCH_CONST(life_donator)) do {
					case 0: {_price};
					case 1: {round(_price + (_price* 0.05))};
					case 2: {round(_price + (_price* 0.07))};
					case 3: {round(_price + (_price* 0.1))};
					case 4: {round(_price + (_price* 0.15))};
				};
			};
			default {}; 
		};
	}; 
	default {}; 
};

_ret;