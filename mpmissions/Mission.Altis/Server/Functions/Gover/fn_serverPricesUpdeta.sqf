/*
	Filename: 	fn_serverPricesUpdeta.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
*/

for "_i" from 0 to 1 step 0 do {
	private _result = ["SELECT resource, sellprice, buyprice, legal FROM economy",2,true] call DB_fnc_asyncCall;
	if (_result isEqualTo []) exitWith {diag_log "serverPrices []"};
	{
	    if (_x select 1 > 0) then {
		    sell_array pushBack [_x select 0, _x select 1];
	    };

		if (_x select 2 > 0) then {
		    buy_array pushBack [_x select 0, _x select 2];
	    };

	    if (_x select 3 isEqualTo 1) then {
		    private _rew = if (_x select 1 <= 0) then {2} else {round((_x select 1) / 1.4)};
		    life_illegal_items pushBack [_x select 0, _rew];
	    };
	} forEach _result;
	publicVariable "sell_array";
	publicVariable "buy_array";
	publicVariable "life_illegal_items";
	uiSleep (28 * 60);
	[] spawn TON_fnc_updataPrices;
	uiSleep (2 * 60);
};