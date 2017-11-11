/*
	
	Filename: 	UnionClient_system_houseModAddSlot.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _house = param [0,Objnull,[Objnull]];
if (isNull _house) exitWith {closeDialog 0};

private _house_box = _house GVAR ["house_box",objNull];
if (isNull _house_box) exitWith {hint "Хранилище закрыто. Отоприте его перед добавлением слотов.";closeDialog 0};

private _house_box_slots = _house_box GVAR ["house_box_slots",0];
private _numberCrates = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"numberCrates");

private _valToPay = 30000;

private _action = [
	parseText format ["Кол-во слотов в хранилище: %1 из %2<br/><br/>Вы уверены, что хотите добавить еще один слот? Это обойдется вам в $%3",_house_box_slots,_numberCrates,[_valToPay] call UnionClient_system_numberText],
	"Добавление слота",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	if (BANK < _valToPay) exitWith {hint "У вас нет необходимой суммы на банковском счете"};
	["atm","take",_valToPay] call UnionClient_system_myCash;
	_house_box_slots = _house_box_slots + 1;
	_house_box SVAR ["house_box_slots",_house_box_slots,true];
	
	[[_house,_house_box_slots,player],"updateHouseSlots"] call UnionClient_system_hcExec;

	closeDialog 0;
};