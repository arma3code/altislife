/*

	Filename: 	UnionClient_system_weaponShopBuySell.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 38403),-1)) exitWith {titleText [localize "STR_Shop_Weapon_NoSelect","PLAIN"]};

private _num = ctrlText 38406;
if !([_num] call UnionClient_system_isnumber) exitWith {titleText ["Укажите количество в цифровом формате, а не символьном","PLAIN"]};

_num = parseNumber(_num);
if (_num <= 0) exitWith {};

private _item = CONTROL_DATA(38403);
private _itemInfo = [_item] call UnionClient_system_itemDetails;
if (EQUAL(_itemInfo,[])) exitWith {};

if (GVAR_UINS["Weapon_Shop_Filter",0] == 1) then {
	private _playerItems = [] call UnionClient_system_getPlayerItems;
	private _indexP = [_item,_playerItems] call UnionClient_system_index;
	if (_num > ((_playerItems select _indexP) select 1)) exitWith {titleText ["У вас нет такого количества предметов в инвентаре","PLAIN"]};

	private _moneyCount = 0;
	private _sellCount = 0;
	for "_x" from 1 to _num do {
		if ([_item] call UnionClient_system_removeItem) then {
			_moneyCount = _moneyCount + 0;
			_sellCount = _sellCount + 1;
		};
	};
	if (_sellCount > 0) then {
		["cash","add",_moneyCount,"weaponShopBuySell"] call UnionClient_system_myCash;
		player say3D "caching";

		titleText [format[localize "STR_Shop_Weapon_SoldFew",_itemInfo select 1,[_moneyCount] call UnionClient_system_numberText,_sellCount,_num],"PLAIN"];
		[nil,(GVAR_UINS["Weapon_Shop_Filter",0])] call UnionClient_system_weaponShopFilter; //Update the menu.
	} else {titleText ["Не удалось продать","PLAIN"]};
} else {
	private _priceMulti = CONTROL_VALUE(38403);
	private _price = round (M_CONFIG(getNumber,"LifeCfgItems",_item,"price") / _priceMulti);
	if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call UnionClient_system_discount};
	if ((_price * _num) > CASH) exitWith {titleText [localize "STR_NOTF_NotEnoughMoney","PLAIN"]};

	private _buyCount = 0;
	private _moneyCount = 0;

	for "_x" from 1 to _num do {
		if ([_item] call UnionClient_system_addItem) then {
			_buyCount = _buyCount + 1;
			_moneyCount = _moneyCount + _price;
			format ["Buy %1 [$%2]",_buyCount,_moneyCount] call UnionClient_system_log;
		};
	};
	if (_buyCount > 0) then {
		["cash","take",_moneyCount,"weaponShopBuySell"] call UnionClient_system_myCash;
		player say3D "caching";
		titleText [format[localize "STR_Shop_Weapon_BoughtItems",_itemInfo select 1,[_moneyCount] call UnionClient_system_numberText,_buyCount,_num],"PLAIN"];
	} else {titleText ["Не удалось купить","PLAIN"]};
};

ctrlSetText[601,format["Наличность: $%1       ",[CASH] call UnionClient_system_numberText]];

true