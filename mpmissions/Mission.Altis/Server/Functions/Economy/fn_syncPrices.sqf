#include "\UnionServer\script_macros.hpp"
/*
    File: fn_syncPrices.sqf
    Author: Derek Benson
    Description:
    refreshes the SQL database with the new sell prices

private["_market", "_query", "_price", "_name", "_goods","_endtime", "_syncRate"];

if (dynamic_market isEqualTo 1) then {
    [] call TON_fnc_loadPrices;
};

if (dynamic_market isEqualTo 1 && dynamic_market_persistence isEqualTo 1) then {
    while {true} do {
        diag_log format["Sync prices at uptime: %1",round(time/60)];
        _market = missionNamespace getVariable "MarketPrices";

        if (isNil "_market") then {
            [] call TON_fnc_loadPrices;
            _market = missionNamespace getVariable "MarketPrices";
        };

        _goods = [];

        {
            if ((_x select 1) != 0) then {
                _name = format["%1MarketGoodPrice",(_x select 0)];
                _price = missionNamespace getVariable _name;
                _goods pushBack [(_price select 0),(_price select 2)];
            };
        } forEach _market;

        {
            _name = (_x select 0);
            _price = (_x select 1);
            _query = format["UPDATE economy SET sellprice=%1 WHERE resource='%2'",_price,_name];

            [_query,1] call DB_fnc_asyncCall;

        } forEach _goods;

        _endtime = end_time;
        _diff = _endtime - time;
        _syncRate = sync_rate;
        if (_diff > _syncRate || time > _endtime+5) then {
            sleep (_syncRate);
        } else {
            sleep (_diff - 5);
        };
    };
};

diag_log "---------------Resource checker---------------";

{
    private _query = format ["SELECT resource, sellprice, buyprice, legal FROM economy"];
    private _resourceQuery = [_query,2,true] call DB_fnc_asyncCall;
    diag_log format ["CHECKING %1",_x];
    if (count _resourceQuery isEqualTo 0) then {diag_log format ["THERE IS NO RESOURCE %1",_x]};
}
forEach _resourceArray;

private _resourcesFromDB = ["apple","coco","banana","anana","peach","salema_fried","ornate_fried","copper_r","copper_tape","royalcp","weppart","shrimp_s","cocomilk","cigar","arwater","marijuana","glass","salt_r","allup","mackerel_fried","sugarp","oilp","bronzep","mullet_fried","gasp","petrol","amberp","exhibit","bottles","goat_fried","iron_r","diamondc","cement","ammonia","tuna_fried","catshark_fried","pearlp","coffeep","coquinap","sheep_fried","rooster_fried","jewelry","hen_fried","obsidp","bottledwhiskey","bottledbeer","leather_r","allucan","cacaop","woodbp","olivep","royalcf","dish","sofa","shark","artpartp","opiump","heroinp","blackdp","woodrp","methp","cocainep","uraniump","weppartp","bottledshine","uraniumc","turtle","roma","goldbar","wood"];
*//*
private _resourceArray = ["apple","coco","banana","anana","peach","salema_fried","ornate_fried","copper_r","copper_tape","royalcp","weppart","shrimp_s","cocomilk","cigar","arwater","marijuana","glass","salt_r","mackerel_fried","oilp","mullet_fried","gasp","petrol","exhibit","bottles","goat_fried","iron_r","diamondc","wood","cement","ammonia","tuna_fried","catshark_fried","coffeep","sheep_fried","rooster_fried","jewelry","hen_fried","bottledwhiskey","bottledbeer","leather_r","cacaop","woodbp","olivep","dish","shark","opiump","heroinp","woodrp","methp","cocainep","uraniump","bottledshine","uraniumc","turtle","roma","goldbar"];
_arr = [];
{
    private _string = getText(missionConfigFile >> "LifeCfgVirtualItems" >> _x >> "displayName");
    _loca = localize _string;
    _arr pushback _loca;

}
forEach _resourceArray;
diag_log _arr;*/