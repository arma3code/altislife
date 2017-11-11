/*
	
	Filename: 	UnionClient_system_giveItem.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (EQUAL((lbCurSel 7214),-1)) exitWith {hint "No one was selected!";ctrlShow[7216,true];};
private _unit = call compile format["%1",CONTROL_DATA(7214)];
if (isNil "_unit") exitWith {ctrlShow[7216,true];};
if (isNull _unit) exitWith {ctrlShow[7216,true];};
if (EQUAL(_unit,player)) exitWith {ctrlShow[7216,true];};

if (EQUAL((lbCurSel 7212),-1)) exitWith {hint "You didn't select an item you wanted to give.";ctrlShow[7216,true];};
private _item = CONTROL_DATA(7212);

private _val = ctrlText 7213;
ctrlShow[7216,false];

if !([_val] call UnionClient_system_isnumber) exitWith {hint "You didn't enter an actual number format.";ctrlShow[7216,true];};
if (parseNumber(_val) <= 0) exitWith {hint "You need to enter an actual amount you want to give.";ctrlShow[7216,true];};
if !([false,_item,(parseNumber _val)] call UnionClient_system_handleInv) exitWith {hint "Couldn't give that much of that item, maybe you don't have that amount?";ctrlShow[7216,true];};

[_unit,_val,_item,player] remoteExecCall ["UnionClient_system_receiveItem",_unit];
hint format["Вы передали %1 %2 %3",GVAR_RNAME(_unit),_val,ITEM_NAME(_item)];
[] spawn UnionClient_pad_openStatus;

ctrlShow[7216,true];