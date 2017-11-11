/*

	Filename: 	UnionClient_system_changeFraction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_action","_price"];

if (!isNil {grpPlayer GVAR "gang_name"}) exitWith {hint "Прежде покиньте вашу банду"};

switch(playerSide) do {
	case civilian: {
		//if (count(life_haveCredit) != 0) exitWith {hint "Вы не можете сменить фракцию, так как у вас есть активный кредит."};
		_price = 1000000;
		_action = [
			format["Вы собираетесь вступить в повстанческий отряд и отказаться от гражданства. Вступительный взнос составляет $%1. После перехода вы сразу покинете остров и сможете вернуться только как повстанец.", [_price] call UnionClient_system_numberText],
			"Сопротивление",
			localize "STR_Global_Yes",
			localize "STR_Global_No"
		] call BIS_fnc_guiMessage;

		if (_action) then {
			if (BANK < _price) exitWith {hint "У вас недостаточно средств на банковском счете."};
			life_fractionInUse = true;
			[player,steamid,playerSide,_price] remoteExecCall ["TON_fnc_changeFraction",RSERV];
		} else {
			hint "Сопротивление потеряло надежду без вас...";
		};
	};
	case independent: {
		_price = 50000;
		_action = [
			format["Вы собираетесь вернуть себе гражданство и покинуть сопротивление. Новый паспорт обойдется вам в $%1. После перехода вы сразу покинете остров и сможете вернуться только как гражданин острова.", [_price] call UnionClient_system_numberText],
			"Гражданство",
			localize "STR_Global_Yes",
			localize "STR_Global_No"
		] call BIS_fnc_guiMessage;

		if (_action) then {
			if (BANK < _price) exitWith {hint "У вас недостаточно средств на банковском счете."};
			life_fractionInUse = true;
			[player,steamid,playerSide,_price] remoteExecCall ["TON_fnc_changeFraction",RSERV];
		} else {
			hint "Сопротивление будет жить!";
		};
	};
};
