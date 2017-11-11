/*

	Filename: 	UnionClient_system_weaponShopFilter.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _index = param [1,-1,[0]];
private _shop = GVAR_UINS ["Weapon_Shop",""];
if (EQUAL(_index,-1) OR (EQUAL(_shop,""))) exitWith {systemChat "Bad Data Filter"; closeDialog 0;}; //Bad data passing.
if !(isClass(missionConfigFile >> "LifeCfgWeaponShops" >>_shop)) exitWith {systemChat "Bad Data Filter"; closeDialog 0;};

SVAR_UINS ["Weapon_Shop_Filter",_index];

private _itemList = CONTROL(38400,38403);
lbClear _itemList;

(CONTROL(38400,38407)) ctrlShow false;
(CONTROL(38400,38408)) ctrlShow false;
(CONTROL(38400,38409)) ctrlShow false;
(CONTROL(38400,38410)) ctrlShow false;

(CONTROL(38400,38404)) ctrlSetStructuredText parseText "";

private ["_price","_itemInfo"];
switch (_index) do {
	case 0: {
		{
			if (isClass(missionConfigFile >> "LifeCfgItems" >> _x select 0)) then {
				_price = M_CONFIG(getNumber,"LifeCfgItems",_x select 0,"price");
				if (_price > 0 && ([_x select 2] call UnionClient_system_conditionsCheck)) then {
					_itemInfo = [_x select 0] call UnionClient_system_itemDetails;
					_price = round (_price / (_x select 1));
					if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call UnionClient_system_discount};

					_itemList lbAdd format["%1",_itemInfo select 1];
					_itemList lbSetTextRight [(lbSize _itemList)-1, format["  $%1", [_price] call UnionClient_system_numberText]];
					_itemList lbSetValue[(lbSize _itemList)-1,_x select 1];
					_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
					_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
				};
			};
		} foreach (M_CONFIG(getArray,"LifeCfgWeaponShops",_shop,"items"));

		(CONTROL(38400,38405)) ctrlSetText localize "STR_Global_Buy";
	};

	case 1: {
		private _config = [];
		private _listedItems = [];

		if (primaryWeapon player != "") then {_config pushBack primaryWeapon player};
		if (secondaryWeapon player != "") then {_config pushBack secondaryWeapon player};
		if (handgunWeapon player != "") then {_config pushBack handgunWeapon player};

		_config = _config + primaryWeaponItems player;
		_config = _config + (assignedItems player);
		_config = _config + (uniformItems player);
		_config = _config + (vestItems player);
		_config = _config + (backPackItems player);

		(CONTROL(38400,38405)) ctrlSetText localize "STR_Global_Sell";
		{
			if (!(_x in _listedItems) && !(EQUAL(_x,""))) then
			{
				_itemInfo = [_x] call UnionClient_system_itemDetails;
				_listedItems pushBack _x;

				_itemCount = {_x == (_itemInfo select 0)} count _config;
				if (_itemCount > 1) then {
					_itemList lbAdd format["[%2] %1",_itemInfo select 1,_itemCount];
				} else {
					_itemList lbAdd format["%1",_itemInfo select 1];
				};
				_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
				_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
			};
		} foreach _config;
	};
};

if (isNil {_this select 0}) then {_itemList lbSetCurSel 0};