/*

	Filename: 	UnionClient_system_weaponShopSelection.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_control",controlNull,[controlNull]],
	["_index",-1,[0]]
];
if (isNull _control OR EQUAL(_index,-1)) exitWith {closeDialog 0;}; //Bad data

private _priceTag = CONTROL(38400,38404);
private _magsList = CONTROL(38400,38407);
private _magsCount = CONTROL(38400,38408);
private _magsButton = CONTROL(38400,38409);
private _magsBG = CONTROL(38400,38410);

_magsList ctrlShow false;
_magsCount ctrlShow false;
_magsButton ctrlShow false;
_magsBG ctrlShow false;

private _item = CONTROL_DATAI(_control,_index);
private _itemInfo = [_item] call UnionClient_system_itemDetails;

[_item,_itemInfo select 4] spawn UnionClient_system_shopBoxWeaponRotate;

private _infoDesc = if !(EQUAL((_itemInfo select 3),"")) then {
	format ["<br/><br/>%1",_itemInfo select 3];
} else {""};

if ((GVAR_UINS["Weapon_Shop_Filter",0]) == 1) then {
	_priceTag ctrlSetStructuredText parseText format ["<t size='0.85' color='%3'>Цена: <t color='#3f6b00'>$%1</t>%2</t>",0,_infoDesc,GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];
} else {
	private _priceMulti = CONTROL_VALUEI(_control,_index);
	private _price = round (M_CONFIG(getNumber,"LifeCfgItems",_item,"price") / _priceMulti);
	if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call UnionClient_system_discount};

	if (_price > CASH) then {
		_priceTag ctrlSetStructuredText parseText format ["<t size='0.85' color='%4'>Цена: <t color='#ff0000'>$%1</t><br/>Не хватает: <t color='#3f6b00'>$%2</t>%3</t>",[_price] call UnionClient_system_numberText,[_price - CASH] call UnionClient_system_numberText,_infoDesc,GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];
	} else{
		_priceTag ctrlSetStructuredText parseText format ["<t size='0.85' color='%3'>Цена: <t color='#3f6b00'>$%1</t>%2</t>",[_price] call UnionClient_system_numberText,_infoDesc,GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];
	};

	if (count (_itemInfo select 7) > 0 && !(_item in LIFE_SETTINGS(getArray,"life_gatherTools"))) then {
		_magsList ctrlShow true;
		_magsCount ctrlShow true;
		_magsButton ctrlShow true;
		_magsBG ctrlShow true;
		lbClear _magsList;

		private ["_magPrice","_magInfo","_conditions"];
		{
			if (isClass(missionConfigFile >> "LifeCfgItems" >> _x)) then {
				_conditions = M_CONFIG(getText,"LifeCfgItems",_x,"conditions");
				if !([_conditions] call UnionClient_system_conditionsCheck) exitWith {};
				_magPrice = round (M_CONFIG(getNumber,"LifeCfgItems",_x,"price") / _priceMulti);
				if (_magPrice > 0) then {
					if (FETCH_CONST(life_donator) > 0) then {_magPrice = [_magPrice] call UnionClient_system_discount};
					_magInfo = [_x] call UnionClient_system_itemDetails;
					_magsList lbAdd format["%1",_magInfo select 1];
					_magsList lbSetTextRight [(lbSize _magsList)-1, format["  $%1", [_magPrice] call UnionClient_system_numberText]];
					_magsList lbSetData[(lbSize _magsList)-1,_magInfo select 0];
					_magsList lbSetValue[(lbSize _magsList)-1,_priceMulti];
					_magsList lbSetPicture[(lbSize _magsList)-1,_magInfo select 2];
				};
			};
		} forEach (_itemInfo select 7);
	};
};