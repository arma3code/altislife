/*
    File: fn_updateRequest.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Updates ALL player information in the database.
    Information gets passed here from the client side file: core\session\fn_updateRequest.sqf
*/
private ["_uid","_side","_cash","_bank","_licenses","_gear","_stats","_arrest","_alive","_position","_query","_thread","_indicators","_config","_craft","_dcash","_tmptax","_selled"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_cash = [_this,2,0,[0]] call BIS_fnc_param;
_bank = [_this,3,5000,[0]] call BIS_fnc_param;
_licenses = [_this,4,[],[[]]] call BIS_fnc_param;
_gear = [_this,5,[],[[]]] call BIS_fnc_param;
_tmptax = [_this,6,0,[0]] call BIS_fnc_param;
_selled = [_this,7,[],[[]]] call BIS_fnc_param;
_config = [_this,8,[],[[]]] call BIS_fnc_param;
_indicators = [_this,9,[],[[]]] call BIS_fnc_param;
_craft = [_this,10,[],[[]]] call BIS_fnc_param;
_dcash = [_this,11,0,[0]] call BIS_fnc_param;
_deaths = [_this,12,0,[0]] call BIS_fnc_param;

//Get to those error checks.
if (_uid isEqualTo "") exitWith {};

//Parse and setup some data.
_gear = [_gear] call DB_fnc_mresArray;
_indicators = [_indicators] call DB_fnc_mresArray;
_cash = [_cash] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;
_dcash = [_dcash] call DB_fnc_numberSafe;

//Does something license related but I can't remember I only know it's important?
for "_i" from 0 to count(_licenses)-1 do {
    _bool = [(_licenses select _i) select 1] call DB_fnc_bool;
    _licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

_licenses = [_licenses] call DB_fnc_mresArray;

for "_i" from 0 to count(_config)-1 do {
    _bool = [(_config select _i) select 1] call DB_fnc_bool;
    _config set[_i,[(_config select _i) select 0,_bool]];
};

_config = [_config] call DB_fnc_mresArray;

for "_i" from 0 to count(_craft)-1 do {
    _bool = [(_craft select _i) select 1] call DB_fnc_bool;
    _craft set[_i,[(_craft select _i) select 0,_bool]];
};

_craft = [_craft] call DB_fnc_mresArray;

switch (_side) do {
//                                                                                                                                                                                              1     2     3      4       5        6     7          8       9
    case west: {_query = format ["UPDATE players SET cash='%2', bankacc='%3', cop_licenses='%4', gear='%5', indicators='%6', config='%7', recipes='%8', deaths='%9' WHERE playerid='%1'",_uid,_cash,_bank,_licenses,_gear,_indicators,_config,_craft,_deaths];};
//
    case east: {_query = format ["UPDATE players SET cash='%2', bankacc='%3', med_licenses='%4', gear='%5', indicators='%6', config='%7', recipes='%8', deaths='%9' WHERE playerid='%1'",_uid,_cash,_bank,_licenses,_gear,_indicators,_config,_craft,_deaths];};
//                                                                                                                                                                                                              1     2      3       4       5     6         7        8       9     10
    case civilian: {_query = format ["UPDATE players SET cash='%2', bankacc='%3', civ_licenses='%4', gear='%5', indicators='%6', config='%7', recipes='%8', dcash='%9', deaths='%10' WHERE playerid='%1'",_uid,_cash,_bank,_licenses,_gear,_indicators,_config,_craft,_dcash,_deaths];};
//                                                                                                                                                                                                    1     2     3       4       5        6      7          8       9
    case independent: {_query = format ["UPDATE players SET cash='%2', bankacc='%3', reb_licenses='%4', gear='%5', indicators='%6', config='%7', recipes='%8', deaths='%9', dcash='%10' WHERE playerid='%1'",_uid,_cash,_bank,_licenses,_gear,_indicators,_config,_craft,_deaths,_dcash];};

};

_queryResult = [_query,1] call DB_fnc_asyncCall;

if !(_selled isEqualTo []) then {
    for "_i" from 0 to count(_selled)-1 do {
	   [format ["UPDATE economy SET selled=selled+'%2' WHERE resource='%1'",(_selled select _i) select 0,(_selled select _i) select 1],1] call DB_fnc_asyncCall;
	   uiSleep 0.03;
	};
};

if (_tmptax > 0) then {
	[format ["UPDATE rules SET serverbank=serverbank+'%1'",_tmptax],1] call DB_fnc_asyncCall;
};