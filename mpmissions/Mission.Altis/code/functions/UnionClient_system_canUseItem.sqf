/*

	Filename: 	UnionClient_system_canUseItem.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _item = param [0,"",[""]];
if (EQUAL(_item,"")) exitWith {false};
private _canUse = true;

if (_item in LIFE_SETTINGS(getArray,"life_onlyVipItems")) then {
	if (FETCH_CONST(life_donator) > 0) then {
		_canUse = true;
	} else {
		switch (playerSide) do {
			case civilian : {
				_canUse = if (life_civlevel > 2) then {true} else {false};
			};
			case independent : {
				_canUse = if (life_reblevel > 2) then {true} else {false};
			};
			case west : {
				_canUse = true;
			};
			default {_canUse = false};
		};
	};
};

if (_item in LIFE_SETTINGS(getArray,"life_girlsClothes")) then {
	if !(life_isGirl) then {
		_canUse = false;
	};
};

_canUse;