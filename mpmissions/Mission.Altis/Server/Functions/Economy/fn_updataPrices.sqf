#include "\UnionServer\script_macros.hpp"
private _tickTime = diag_tickTime;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "--------------------------------------- Starting UpdataPrices --------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";
private _count	   = ( ["SELECT COUNT(*) FROM economy", 2] call DB_fnc_asyncCall) select 0;
private _randomids = [];
//Система рандомных событий, события должны располагаться в возр. порядке
private _rand = round (random 100);
private _eventArr = [];
private _positive = true;
switch(true) do
{
	case (_rand <= 5): //5% шанс
	{
		[0,"AAN News: Из-за несогласованных действий правительства Алтиса цены на нефть уменьшились."] remoteExecCall ["UnionClient_system_broadcast",-2];
		_eventArr = ["petrol","oilp"];
		_positive = false;
	};
	case (_rand <= 6): //6% шанс
	{
		[0,"AAN News: В связи с недавним убийством главы наркокартеля, цены на наркотики пошли вверх."] remoteExecCall ["UnionClient_system_broadcast",-2];
		_eventArr = ["cocainep","methp","heroinp","opiump"];
		_positive = true;
	};
	case (_rand <= 10): //10% шанс
	{
		[0,"AAN News: В связи с недавним решением правительства построить новые дома на острове Стратис, цены на строительные материалы пошли вверх."] remoteExecCall ["UnionClient_system_broadcast",-2];
		_eventArr = ["wood","cement","glass","iron_r"];
		_positive = true;
	};
};
diag_log _eventArr;
for "_i" from 1 to 5 do {_randomids pushback floor random _count};
diag_log _randomids;
for [{_x = 0}, {_x <= _count}, {_x = _x + 10}] do {
	private _query	     = format ["SELECT resource, sellprice, buyprice, minprice, maxprice, factor, selled, id FROM economy LIMIT %1,10", _x];
	private _queryResult = [_query, 2, true] call DB_fnc_asyncCall;
	// diag_log format ["OK fn_updataprices:_queryResult = %1", _queryResult];

	if (count _queryResult isEqualTo 0) exitWith {};

	{
		private _resource     = _x select 0;
		private _sellPrice    = _x select 1;
		private _buyPrice     = _x select 2;
		private _minPrice     = _x select 3;
		private _maxPrice     = _x select 4;
		private _factor	      = _x select 5;
		private _amount	      = _x select 6;
		private _resID	      = _x select 7;
		private _NewSellPrice = 0;


		if (_sellPrice > 0 && _amount > 0 && !(_resource in _eventArr)) then {
				if ((_sellPrice - (_amount * (_sellPrice / 2000) * _factor)) > _minPrice) then {// CASE #1
				  _NewSellPrice = round(_sellPrice - (_amount * (_sellPrice / 2000) * _factor));
				  diag_log format ["CASE #1 - Resource = '%1' NewSellPrice = '%2' OldSellPrice = '%3'", _resource, _NewSellPrice, _sellPrice];
				  private _handle = [format ["UPDATE economy SET selled='0', sellprice='%2' WHERE resource='%1'", _resource, _NewSellPrice], 1] call DB_fnc_asyncCall;
					} else {// CASE #2
						_NewSellPrice = round(_minPrice);
						diag_log format ["CASE #2 - Resource = '%1' NewSellPrice = '%2' OldSellPrice = '%3'", _resource, _NewSellPrice, _sellPrice];
						private _handle = [format ["UPDATE economy SET selled='0', sellprice='%2' WHERE resource='%1'", _resource, _NewSellPrice], 1] call DB_fnc_asyncCall;
					};
				 } else {
					if (_resID in _randomids && !(_resource in _eventArr)) then {
						//if (count allPlayers < 10) exitWith {diag_log "CASE #0 NOT ENOUGH PLAYERS"};
						_amount = (count allPlayers + 100);
						if ((_sellPrice + (_amount * (_sellPrice / 1500) * _factor)) < _maxPrice) then {// CASE #3
							_NewSellPrice = round(_sellPrice + (_amount * (_sellPrice / 1500) * _factor));
							diag_log format ["CASE #3 - Resource = '%1' NewSellPrice = '%2' OldSellPrice = '%3'", _resource, _NewSellPrice, _sellPrice];
							private _handle = [format ["UPDATE economy SET sellprice='%2' WHERE resource='%1'", _resource, _NewSellPrice], 1] call DB_fnc_asyncCall;
							} else {// CASE #4
								_NewSellPrice = round(_maxPrice);
								diag_log format ["CASE #4 - Resource = '%1' NewSellPrice = '%2' OldSellPrice = %3", _resource, _NewSellPrice, _sellPrice];
								private _handle = [format ["UPDATE economy SET sellprice='%2' WHERE resource='%1'", _resource, _NewSellPrice], 1] call DB_fnc_asyncCall;
							};
						   } else {
							if (_resource in _eventArr) then {
								if (_positive) then {// CASE #5
									_NewSellPrice = round(_sellPrice + (400 * (_sellPrice / 1500) * _factor));
									diag_log format ["CASE #5 - Resource = '%1' NewSellPrice = '%2' OldSellPrice = '%3'", _resource, _NewSellPrice, _sellPrice];
									private _handle = [format ["UPDATE economy SET sellprice='%2' WHERE resource='%1'", _resource, _NewSellPrice], 1] call DB_fnc_asyncCall;
								} else {// CASE #4
									_NewSellPrice = round(_sellPrice - (400 * (_sellPrice / 2000) * _factor));
									diag_log format ["CASE #6 - Resource = '%1' NewSellPrice = '%2' OldSellPrice = %3", _resource, _NewSellPrice, _sellPrice];
									private _handle = [format ["UPDATE economy SET sellprice='%2' WHERE resource='%1'", _resource, _NewSellPrice], 1] call DB_fnc_asyncCall;
							};
						};
					};
				};
				} forEach _queryResult;
			};
[] spawn TON_fnc_loadPrices;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["               End of Updating Prices process :: Total Execution Time %1 seconds ", (diag_tickTime) - _tickTime];
diag_log "----------------------------------------------------------------------------------------------------";