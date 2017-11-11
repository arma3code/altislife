#include "\UnionServer\script_macros.hpp"
/*
    File: fn_queryRequest.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Handles the incoming request and sends an asynchronous query
    request to the database.

    Return:
    ARRAY - If array has 0 elements it should be handled as an error in client-side files.
    STRING - The request had invalid handles or an unknown error and is logged to the RPT.
*/
private ["_uid","_side","_query","_queryResult","_tickTime","_tmp","_queryS"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_ownerID = [_this,2,objNull,[objNull]] call BIS_fnc_param;

if (isNull _ownerID) exitWith {};
_ownerID = owner _ownerID;

_query = switch (_side) do {
    //                           0       1      2     3          4           5           6            7          8          9       10     11       12          13         14      15      16       17
    case west: {format ["SELECT playerid, name, cash, bankacc, adminlevel, donorlevel, cop_licenses, coplevel, gear, Epoint, recipes, config, indicators, logout_pos, karma, deaths, servermap, dcash  FROM players WHERE playerid='%1'",_uid];};
    //                           0       1      2     3          4           5           6            7          8          9       10      11		 12		     13		    14      15      16       17
    case east: {format ["SELECT playerid, name, cash, bankacc, adminlevel, donorlevel, med_licenses, mediclevel, gear, Epoint, recipes, config, indicators, logout_pos, karma, deaths, servermap, dcash FROM players WHERE playerid='%1'",_uid];};
    //                                 	0       1      2     3          4           5           6            7          8          9     10         11         12  		13        14      15      16       17  		18		19			20			21
    case independent: {format ["SELECT playerid, name, cash, bankacc, adminlevel, donorlevel, reb_licenses, reblevel, gear, Epoint, recipes, config, indicators, logout_pos, karma, deaths, servermap, dcash, arrested, jail_time, first_time, slave FROM players WHERE playerid='%1'",_uid];};
    //                                0       1      2     3          4           5           6           7         8          9     10         11         12  		13        14      15      16       17  		18		19			20			21		22
    case civilian: {format ["SELECT playerid, name, cash, bankacc, adminlevel, donorlevel, civ_licenses, civlevel, gear, Epoint, recipes, config, indicators, logout_pos, karma, deaths, servermap, dcash, arrested, jail_time, first_time, slave, credit FROM players WHERE playerid='%1'",_uid];};

};

_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Client Query Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["Result: %1",_queryResult];
    diag_log "------------------------------------------------";
};

if (_queryResult isEqualType "") exitWith {
    [] remoteExecCall ["UnionClient_session_insertPlayerInfo",_ownerID];
};

if (_queryResult isEqualTo []) exitWith {
    [] remoteExecCall ["UnionClient_session_insertPlayerInfo",_ownerID];
};

//BANK CASH
_queryResult set[2,[_queryResult select 2] call DB_fnc_numberSafe];
_queryResult set[3,[_queryResult select 3] call DB_fnc_numberSafe];

//admin
_queryResult set[4,call compile format ["%1",_queryResult select 4]];
//vip
_queryResult set[5,call compile format ["%1",_queryResult select 5]];

//Parse licenses (Always index 6)
_new = [(_queryResult select 6)] call DB_fnc_mresToArray;
if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
_queryResult set[6,_new];

//Convert tinyint to boolean
_old = _queryResult select 6;
for "_i" from 0 to (count _old)-1 do {
    _data = _old select _i;
    _old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
};
_queryResult set[6,_old];

//coplevel civlevel medlevel reblevel
_queryResult set[7,call compile format ["%1",_queryResult select 7]];

//Ger
_new = [(_queryResult select 8)] call DB_fnc_mresToArray;
if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
_queryResult set[8,_new];

//Parse data for specific side.
switch (_side) do {
    case west: {
        //EPOINT
        _queryResult set[9,[_queryResult select 9] call DB_fnc_numberSafe];
        //craft info
        _new = [(_queryResult select 10)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[10,_new];
        _old = _queryResult select 10;
        for "_i" from 0 to (count _old)-1 do {
            _data = _old select _i;
            _old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
        };
        _queryResult set[10,_old];
        //life_config_array
        _new = [(_queryResult select 11)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[11,_new];
        _old = _queryResult select 11;
        for "_i" from 0 to (count _old)-1 do {
            _data = _old select _i;
            _old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
        };
        _queryResult set[11,_old];
        //Indicators
        _new = [(_queryResult select 12)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[12,_new];
        //logout_pos
        _new = [(_queryResult select 13)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[13,_new];
        //karma
        _queryResult set[14,[_queryResult select 14] call DB_fnc_numberSafe];
        //deaths
        _queryResult set[15,[_queryResult select 15] call DB_fnc_numberSafe];
        //serverMap
        _queryResult set[16,[_queryResult select 16]];
        //dirtycash
        _queryResult set[17,[_queryResult select 17] call DB_fnc_numberSafe];
		//Gang
		_gangData = [_uid,"cop"] spawn TON_fnc_queryPlayerGang;
        waitUntil{scriptDone _gangData};
        _queryResult pushBack (missionNamespace getVariable [format ["gang_%1",_uid],[]]);
    };

    case east: {
        //EPOINT
        _queryResult set[9,[_queryResult select 9] call DB_fnc_numberSafe];
        //craft info
        _new = [(_queryResult select 10)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[10,_new];
        _old = _queryResult select 10;
        for "_i" from 0 to (count _old)-1 do {
            _data = _old select _i;
            _old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
        };
        _queryResult set[10,_old];
        //life_config_array
        _new = [(_queryResult select 11)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[11,_new];
        _old = _queryResult select 11;
        for "_i" from 0 to (count _old)-1 do {
            _data = _old select _i;
            _old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
        };
        _queryResult set[11,_old];
        //Indicators
        _new = [(_queryResult select 12)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[12,_new];
        //logout_pos
        _new = [(_queryResult select 13)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[13,_new];
        //karma
        _queryResult set[14,[_queryResult select 14] call DB_fnc_numberSafe];
        //deaths
        _queryResult set[15,[_queryResult select 15] call DB_fnc_numberSafe];
        //serverMap
        _queryResult set[16,[_queryResult select 16]];
        //dirtycash
        _queryResult set[17,[_queryResult select 17] call DB_fnc_numberSafe];
		//Gang
		_gangData = [_uid,"med"] spawn TON_fnc_queryPlayerGang;
        waitUntil{scriptDone _gangData};
        _queryResult pushBack (missionNamespace getVariable [format ["gang_%1",_uid],[]]);
    };

    case independent: {
        //EPOINT
        _queryResult set[9,[_queryResult select 9] call DB_fnc_numberSafe];
        //craft info
        _new = [(_queryResult select 10)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[10,_new];
        _old = _queryResult select 10;
        for "_i" from 0 to (count _old)-1 do {
            _data = _old select _i;
            _old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
        };
        _queryResult set[10,_old];
        //life_config_array
        _new = [(_queryResult select 11)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[11,_new];
        _old = _queryResult select 11;
        for "_i" from 0 to (count _old)-1 do {
            _data = _old select _i;
            _old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
        };
        _queryResult set[11,_old];
        //Indicators
        _new = [(_queryResult select 12)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[12,_new];
        //logout_pos
        _new = [(_queryResult select 13)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[13,_new];
        //karma
        _queryResult set[14,[_queryResult select 14] call DB_fnc_numberSafe];
        //deaths
        _queryResult set[15,[_queryResult select 15] call DB_fnc_numberSafe];
        //serverMap
        _queryResult set[16,[_queryResult select 16]];
        //dirtycash
        _queryResult set[17,[_queryResult select 17] call DB_fnc_numberSafe];
        //arrested
        _queryResult set[18,([_queryResult select 18,1] call DB_fnc_bool)];
        //jail_time
        _queryResult set[19,[_queryResult select 19] call DB_fnc_numberSafe];
        //first time
        _queryResult set[20,([_queryResult select 20,1] call DB_fnc_bool)];
        //slave
        _queryResult set[21,([_queryResult select 21,1] call DB_fnc_bool)];

		_houseData = _uid spawn TON_fnc_fetchPlayerHouses;
        waitUntil {scriptDone _houseData};
        _queryResult pushBack (missionNamespace getVariable [format ["houses_%1",_uid],[]]);

        _gangData = [_uid,"reb"] spawn TON_fnc_queryPlayerGang;
        waitUntil{scriptDone _gangData};
        _queryResult pushBack (missionNamespace getVariable [format ["gang_%1",_uid],[]]);
    };

    case civilian: {
        //EPOINT
        _queryResult set[9,[_queryResult select 9] call DB_fnc_numberSafe];
        //craft info
        _new = [(_queryResult select 10)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[10,_new];
        _old = _queryResult select 10;
        for "_i" from 0 to (count _old)-1 do {
            _data = _old select _i;
            _old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
        };
        _queryResult set[10,_old];
        //life_config_array
        _new = [(_queryResult select 11)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[11,_new];
        _old = _queryResult select 11;
        for "_i" from 0 to (count _old)-1 do {
            _data = _old select _i;
            _old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
        };
        _queryResult set[11,_old];
        //Indicators
        _new = [(_queryResult select 12)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[12,_new];
        //logout_pos
        _new = [(_queryResult select 13)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[13,_new];
        //karma
        _queryResult set[14,[_queryResult select 14] call DB_fnc_numberSafe];
        //deaths
        _queryResult set[15,[_queryResult select 15] call DB_fnc_numberSafe];
        //serverMap
        _queryResult set[16,[_queryResult select 16]];
        //dirtycash
        _queryResult set[17,[_queryResult select 17] call DB_fnc_numberSafe];
        //arrested
        _queryResult set[18,([_queryResult select 18,1] call DB_fnc_bool)];
        //jail_time
        _queryResult set[19,[_queryResult select 19] call DB_fnc_numberSafe];
        //first time
        _queryResult set[20,([_queryResult select 20,1] call DB_fnc_bool)];
        //slave
        _queryResult set[21,([_queryResult select 21,1] call DB_fnc_bool)];
        //credit
        _new = [(_queryResult select 22)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[22,_new];
		//houses
        _houseData = _uid spawn TON_fnc_fetchPlayerHouses;
        waitUntil {scriptDone _houseData};
        _queryResult pushBack (missionNamespace getVariable [format ["houses_%1",_uid],[]]);

        _gangData = [_uid,"civ"] spawn TON_fnc_queryPlayerGang;
        waitUntil{scriptDone _gangData};
        _queryResult pushBack (missionNamespace getVariable [format ["gang_%1",_uid],[]]);

    };

};


_keyArr = missionNamespace getVariable [format ["%1_KEYS_%2",_uid,_side],[]];
_queryResult set[25,_keyArr];
private _lootsave = format ["%1_loot",_uid];
_lootsave addPublicVariableEventHandler {
    private _variab = (_this select 0);
    private _items = (_this select 1);
    private _steam = _variab splitString  "";
    _steam deleteAt 22;
    _steam deleteAt 21;
    _steam deleteAt 20;
    _steam deleteAt 19;
    _steam deleteAt 18;
    _steam deleteAt 17;
    _steam = _steam joinString "";
    _items = [_items] call DB_fnc_mresArray;
    _queryS = format ["UPDATE players SET gear='%1' WHERE playerid='%2'",_items,_steam];
    [_queryS,1] call DB_fnc_asyncCall;
};
_queryResult remoteExec ["UnionClient_session_requestReceived",_ownerID];
