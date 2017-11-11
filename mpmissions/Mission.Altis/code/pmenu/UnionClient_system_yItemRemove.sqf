/*
	
	Filename: 	UnionClient_system_yItemRemove.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _data = CONTROL_DATA(7212);
private _value = ctrlText 7213;

if !(NOTINVEH(player)) exitWith {titleText["You cannot remove an item when you are in a vehicle.","PLAIN"]};

if (EQUAL(_data,"")) exitWith {hint "You didn't select anything to remove.";};
if !([_value] call UnionClient_system_isnumber) exitWith {hint "You didn't enter an actual number format."};
if (parseNumber(_value) <= 0) exitWith {hint "You need to enter an actual amount you want to remove."};

private _ind = [_data,life_illegal_items] call UnionClient_system_index;

if (!(EQUAL(_ind,-1)) && ([west,getPos player,100] call UnionClient_system_nearUnits)) exitWith {
	titleText["This is an illegal item and cops are near by, you cannot dispose of the evidence","PLAIN"];
};

if !([false,_data,(parseNumber _value)] call UnionClient_system_handleInv) exitWith {hint "Couldn't remove that much of that item, maybe you don't have that amount?"};
hint format["Вы выкинули %1 %2 из своего инвентаря.",(parseNumber _value), ITEM_NAME(_data)];
	
[] spawn UnionClient_pad_openStatus;