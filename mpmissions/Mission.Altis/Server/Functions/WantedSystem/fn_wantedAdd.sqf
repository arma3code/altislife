/*
    File: fn_wantedAdd.sqf
    Author: Bryan "Tonic" Boardwine"
    Database Persistence By: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm

    Description:
    Adds or appends a unit to the wanted list.
*/
private ["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name","_pastCrimes","_query","_queryResult"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if (_uid isEqualTo "" || _type isEqualTo "" || _name isEqualTo "") exitWith {}; //Bad data passed.

//What is the crime?
switch (_type) do
{
    case "187V": {_type = ["187V",30000]};
	case "187": {_type = ["187",75000]};
    case "187C": {_type = ["187C",100000]};
    case "187I": {_type = ["187I",50000]};
    case "187W": {_type = ["187W",125000]};
	case "187E": {_type = ["187E",200000]};

    case "188C": {_type = ["188C",150000]};
    case "188I": {_type = ["188I",150000]};
    case "188W": {_type = ["188W",150000]};
    case "188E": {_type = ["188E",150000]};

    case "901": {_type = ["901",150000]};
    case "261": {_type = ["261",30000]};
    case "261A": {_type = ["261A",15000]};
    case "215": {_type = ["215",20000]};
    case "213": {_type = ["213",9000]};
    case "211A": {_type = ["211A",15000]};
    case "211": {_type = ["211",65000]};
    case "207": {_type = ["207",24000]};
    case "207A": {_type = ["207A",12000]};
    case "487": {_type = ["487",50000]};
    case "488": {_type = ["488",9000]};
    case "480": {_type = ["480",36000]};

    case "481": {_type = ["481",50000]};
    case "482": {_type = ["482",60000]};
    case "483": {_type = ["483",45000]};
    case "459": {_type = ["459",30000]};
    case "459P": {_type = ["459P",60000]};
    case "390": {_type = ["390",15000]};
    case "666": {_type = ["666",10000]};
	case "236": {_type = ["236",250000]};
    case "120S": {_type = ["120S",5000]};
    case "120H": {_type = ["120H",8000]};
    default {_type = [];};
};

if (_type isEqualTo []) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if !(_customBounty isEqualTo -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.

_query = format ["SELECT wantedID FROM wanted WHERE wantedID='%1'",_uid];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
_val = [_type select 1] call DB_fnc_numberSafe;
_number = _type select 0;

if !(count _queryResult isEqualTo 0) then
{
    _crime = format ["SELECT wantedCrimes, wantedBounty FROM wanted WHERE wantedID='%1'",_uid];
    _crimeresult = [_crime,2] call DB_fnc_asyncCall;
    _pastcrimess = [_crimeresult select 0] call DB_fnc_mresToArray;
    if (_pastcrimess isEqualType "") then {_pastcrimess = call compile format ["%1", _pastcrimess];};
    _pastCrimes = _pastcrimess;
    _pastCrimes pushBack _number;
    _pastCrimes = [_pastCrimes] call DB_fnc_mresArray;
    _query = format ["UPDATE wanted SET wantedCrimes = '%1', wantedBounty = wantedBounty + '%2', active = '1' WHERE wantedID='%3'",_pastCrimes,_val,_uid];
    [_query,1] call DB_fnc_asyncCall;
} else {
    _crimes = [_type select 0];
    _crimes = [_crimes] call DB_fnc_mresArray;
    _query = format ["INSERT INTO wanted (wantedID, wantedName, wantedCrimes, wantedBounty, active) VALUES('%1', '%2', '%3', '%4', '1')",_uid,_name,_crimes,_val];
    [_query,1] call DB_fnc_asyncCall;
};
