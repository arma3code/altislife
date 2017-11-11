/*
    File: fn_queryPlayerGang.sqf

    Description:
    Queries to see if the player belongs to any gang.
*/
private ["_query","_queryResult","_members","_info","_tickTime"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,"",[""]] call BIS_fnc_param;
//diag_log format ["queryPlayerGang uid %1 %2",_uid,_side];
//                         0   1        2       3     4        5           6     7        8      9 
//_query = format ["SELECT id, owner, deputy, name, license, maxmembers, bank, members, info, side FROM gangs WHERE active='1' AND side='%3' AND members LIKE '%2%1%2'",_uid,"%",_side];
_query = format ["SELECT id, owner, deputy, name, members, maxmembers, bank, info, license, warpoints FROM gangs WHERE active='1' AND side='%3' AND members LIKE '%2%1%2'",_uid,"%",_side];
//                       0    1      2       3      4          5        6     7       8         10
_queryResult = [_query,2] call DB_fnc_asyncCall;

if (!(_queryResult isEqualTo [])) then {
    _members = [(_queryResult select 4)] call DB_fnc_mresToArray;
	if (_members isEqualType "") then {_members = call compile format ["%1", _members];};
    _queryResult set[4,_members];
	
	_info = [_queryResult select 7] call DB_fnc_mresToArray;
    if (_info isEqualType "") then {_info = call compile format ["%1", _info];};
    _queryResult set[7,_info];
};

missionNamespace setVariable [format ["gang_%1",_uid],_queryResult];
_queryResult;