/*

	Filename: 	UnionClient_system_virt_sell.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {};
if (EQUAL((lbCurSel 2402),-1)) exitWith {};

call UnionClient_actions_inUse;

private _type = CONTROL_DATA(2402);
if (EQUAL(life_shop_type,"bar") && (_type in ["bottledwhiskey","bottledbeer"])) exitWith {
	hint "Бар не покупает алкогольную продукцию. Скупщик находится южнее Кавалы, рядом с поселком Атанос";
	life_action_inUse = false;
};

private _index = [_type,sell_array] call UnionClient_system_index;
if (EQUAL(_index,-1)) exitWith {life_action_inUse = false};

if ((time - life_vshop_timer) < 3) exitWith {hint "Вы слишком быстро нажимаете на кнопку ПРОДАТЬ! Рекомендуем указывать нужное кол-во при продаже одинаковых предметов, вместо нажатия кнопки сто раз!"; life_action_inUse = false};
life_vshop_timer = time;

private _amount = ctrlText 2403;
if !([_amount] call UnionClient_system_isnumber) exitWith {hint localize "STR_Shop_Virt_NoNum"; life_action_inUse = false};
_amount = parseNumber (_amount);

private _sellall = param [0,false,[true]];
if (_sellall) then {_amount = ITEM_VALUE(_type)};
if (_amount > ITEM_VALUE(_type)) exitWith {hint localize "STR_Shop_Virt_NotEnough"; life_action_inUse = false};

private _legal = [_type,life_illegal_items] call UnionClient_system_index;
private _price = (((sell_array select _index) select 1) * _amount);
if ((FETCH_CONST(life_donator) > 0) && (playerSide in [civilian,independent])) then {_price = [_price,1] call UnionClient_system_discount};
if (life_is_arrested) then {_price = round _price/2};

if ([false,_type,_amount] call UnionClient_system_handleInv) then {
	if (EQUAL(_legal,-1)) then {
		private _tax = round (_price * (server_tax/100));
		ADD(life_tmp_tax,_tax);
		SUB(_price,_tax);
		_index = [_type,life_tmp_selled] call UnionClient_system_index;
		if (EQUAL(_index,-1)) then {
			life_tmp_selled pushBack [_type,_amount];
		} else {
			_tmpamount = ((life_tmp_selled select _index) select 1) + _amount;
			life_tmp_selled set [_index,[_type,_tmpamount]];
		};

		hint format[localize "STR_Shop_Virt_SellItem_Tax",_amount,ITEM_NAME(_type),[_price] call UnionClient_system_numberText,server_tax,"%",_tax];
		["cash","add",_price,"virtItemSell"] call UnionClient_system_myCash;
	} else {
		hint format[localize "STR_Shop_Virt_SellItem",_amount,ITEM_NAME(_type),[_price] call UnionClient_system_numberText];
		["dcash","add",_price,"virtItemSellillegal"] call UnionClient_system_myCash;
	};
	[] call UnionClient_system_virt_update;
};

if ((life_shop_type in ["heroin","uranium"]) && !(EQUAL(_legal,-1))) then {
	private["_array","_ind","_val"];
	_array = life_shop_npc GVAR ["sellers",[]];
	_ind = [steamid,_array] call UnionClient_system_index;
	if !(EQUAL(_ind,-1)) then {
		_val = (_array select _ind) select 2;
		ADD(_val,_price);
		_array set[_ind,[steamid,GVAR_RNAME(player),_val]];
		life_shop_npc SVAR ["sellers",_array,true];
	} else {
		_array pushBack [steamid,GVAR_RNAME(player),_price];
		life_shop_npc SVAR ["sellers",_array,true];
	};
};

[] call UnionClient_system_saveGear;
life_action_inUse = false;