/*

	Filename: 	UnionClient_credit_requestReturned.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_credit","_creditReturn","_retC","_haveCredit","_mode"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
_credit = [_this,1,0,[0]] call BIS_fnc_param;
_haveCredit = [_this,2,[],[[]]] call BIS_fnc_param;

switch(_mode) do
{
	case 1: {
		if ((_haveCredit select 2) == (steamid)) then {
			["atm","add",_credit,"creditDone"] call UnionClient_system_myCash;
			life_haveCredit = _haveCredit;
			hint format["Вам выдан кредит в размере $%1\n\nС учетом комиссии вам необходимо будет вернуть $%2 через 7 дней!",[_credit] call UnionClient_system_numberText,[life_haveCredit select 3] call UnionClient_system_numberText];		
		} else {
			hint "Что-то пошло не так...";
		};
	};
	
	case 0: {		
		["atm","take",_credit,"creditDone"] call UnionClient_system_myCash;
		life_haveCredit = [];
		hint format["С вашего банковского счета списано $%1 и вы более не имеете кредитную задолженность.",[_credit] call UnionClient_system_numberText];		
	};
};

life_creditInUse = false;
[] spawn UnionClient_pad_openStatus;