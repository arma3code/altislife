/*

	Filename: 	UnionClient_gangs_BoxMenuFilter.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
private _index = param [1,-1,[0]];
if (EQUAL(_index,-1)) exitWith {systemChat "Bad Data Filter"; closeDialog 0;}; //Bad data passing.

SVAR_UINS["GangBox_Filter",_index];

private _gangBoxGear = CONTROL(4800,4802);
private _playerGear = CONTROL(4800,4803);
private _gangBoxWeight = CONTROL(4800,4804);

lbClear _gangBoxGear;
lbClear _playerGear;

private _gangBoxSlots = life_gang_box GVAR ["slots",0];
private _gangBoxInventory = life_gang_box GVAR ["inventory",[[],0]];

private _playerItems = [] call UnionClient_system_getPlayerItems;

private _containerItems = _gangBoxInventory select 0;
private _currentWeight = _gangBoxInventory select 1;
private _maxWeight = (LIFE_SETTINGS(getNumber,"life_trunkInventoryWeight")) * _gangBoxSlots;

_gangBoxWeight ctrlSetText format[(localize "STR_MISC_Weight")+ " %1/%2",_currentWeight,_maxWeight];

private ["_itemInfo","_good"];
{
	_itemInfo = [_x select 0] call UnionClient_system_itemDetails;
	if (EQUAL(_itemInfo,[])) exitWith {};
	_good = false;

	switch (_index) do {
		case 0: {_good = true};
		case 1: {
			_good = if (EQUAL((_itemInfo select 4),"Equipment")) then {true} else {false};
		};
		case 2: {
			_good = if (EQUAL((_itemInfo select 4),"Weapon")) then {true} else {false};
		};
		case 3: {
			_good = if (EQUAL((_itemInfo select 4),"Magazine") && !(EQUAL((_itemInfo select 5),"UnknownMagazine"))) then {true} else {false};
		};
		case 4: {
			_good = if (EQUAL((_itemInfo select 4),"Item") && ((_itemInfo select 5) in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"])) then {true} else {false};
		};
		case 5: {
			_good = if (EQUAL((_itemInfo select 4),"Item") && !((_itemInfo select 5) in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"])) then {true} else {false};
		};
	};

	if (_good) then {
		if (_x select 1 > 1) then {
			_playerGear lbAdd format["[%2] %1",_itemInfo select 1,_x select 1];
		} else {
			_playerGear lbAdd format["%1",_itemInfo select 1];
		};
		_playerGear lbSetData[(lbSize _playerGear)-1,_itemInfo select 0];
		_playerGear lbSetPicture[(lbSize _playerGear)-1,_itemInfo select 2];
	};
} foreach _playerItems;

{
	_good = false;
	_itemInfo = [_x select 0] call UnionClient_system_itemDetails;
	if !(EQUAL(_itemInfo,[])) then {
		switch (_index) do {
			case 0: {_good = true};
			case 1: {
				_good = if (EQUAL((_itemInfo select 4),"Equipment")) then {true} else {false};
			};
			case 2: {
				_good = if (EQUAL((_itemInfo select 4),"Weapon")) then {true} else {false};
			};
			case 3: {
				_good = if (EQUAL((_itemInfo select 4),"Magazine") && !(EQUAL((_itemInfo select 5),"UnknownMagazine"))) then {true} else {false};
			};
			case 4: {
				_good = if (EQUAL((_itemInfo select 4),"Item") && ((_itemInfo select 5) in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"])) then {true} else {false};
			};
			case 5: {
				_good = if (EQUAL((_itemInfo select 4),"Item") && !((_itemInfo select 5) in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"])) then {true} else {false};
			};
		};
	};

	if (_good) then	{
		if(_x select 1 > 1) then {
			_gangBoxGear lbAdd format["[%2] %1",_itemInfo select 1,_x select 1];
		} else {
			_gangBoxGear lbAdd format["%1",_itemInfo select 1];
		};
		_gangBoxGear lbSetData[(lbSize _gangBoxGear)-1,_itemInfo select 0];
		_gangBoxGear lbSetPicture[(lbSize _gangBoxGear)-1,_itemInfo select 2];
	};
} foreach _containerItems;

lbSort [_playerGear,"ASC"];
lbSort [_gangBoxGear,"ASC"];

_playerGear lbSetCurSel 0;
_gangBoxGear lbSetCurSel 0;