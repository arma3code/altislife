/*

	Filename: 	UnionClient_system_slotSpin.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\..\script_macros.hpp"
private["_slot","_slot1","_slot2","_slot3","_winnings","_slotcash","_betamt","_display","_slotPic1","_slotPic2","_slotPic3","_bet1","_bet2","_bet3","_bet4","_number"];
_betamt = [_this,0,1,[0]] call BIS_fnc_param;
if (CASH < _betamt) exitWith {hint format[localize "STR_NOTF_SlotNeedMoney",_betamt]};

["cash","take",_betamt] call UnionClient_system_myCash;
disableSerialization;

_slotPic1 = CONTROL(5780,5771);
_slotPic2 = CONTROL(5780,5772);
_slotPic3 = CONTROL(5780,5773);

_bet1 = CONTROL(5780,5778);
_bet2 = CONTROL(5780,5779);
_bet3 = CONTROL(5780,5781);
_bet4 = CONTROL(5780,5782);

_bet1 ctrlEnable false;
_bet2 ctrlEnable false;
_bet3 ctrlEnable false;
_bet4 ctrlEnable false;

call UnionClient_actions_inUse;

_a = 0;
player say3D "spin";
while{_a =_a + 1; _a < 15} do {
	_number = ceil(random 7);
	uiSleep .03;
	_slotPic1 ctrlSetText format["\union_pack\pictures\slot\slot_%1.paa",_number];
	_number = ceil(random 7);
	uiSleep .03;
	_slotPic2 ctrlSetText format["\union_pack\pictures\slot\slot_%1.paa",_number];
	_number = ceil(random 7);
	uiSleep .03;
	_slotPic3 ctrlSetText format["\union_pack\pictures\slot\slot_%1.paa",_number];
};

_number = ceil(random 7);
_slotPic1 ctrlSetText format["\union_pack\pictures\slot\slot_%1.paa",_number];
_slot1 = _number;

uiSleep 0.3;

_number = ceil(random 7);
_slotPic2 ctrlSetText format["\union_pack\pictures\slot\slot_%1.paa",_number];
_slot2 = _number;

uiSleep 0.3;

_number = ceil(random 7);
_slotPic3 ctrlSetText format["\union_pack\pictures\slot\slot_%1.paa",_number];
_slot3 = _number;

uiSleep 0.3;

_slot = parseNumber format["%1%2%3",_slot1,_slot2,_slot3];

_winnings  = 0;

//3 in a row
if (EQUAL(_slot1,_slot2) && EQUAL(_slot2,_slot3)) then {
	_winnings = _betamt * 5;
};

//2 in a row
if (EQUAL(_winnings,0)) then {
	if (EQUAL(_slot1,_slot2) OR EQUAL(_slot2,_slot3)) then {
		_winnings = _betamt * 3;
	};
};

if(_winnings > 0) then {
	player say3D "win";
	["cash","add",_winnings] call UnionClient_system_myCash;	
	hint parseText format[localize "STR_NOTF_SlotWin",[_winnings] call UnionClient_system_numberText];		
};

_bet1 ctrlEnable true;
_bet2 ctrlEnable true;
_bet3 ctrlEnable true;
_bet4 ctrlEnable true;
life_action_inUse = false;