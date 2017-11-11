private ["_queryResult","_vehicles","_array","_bool","_arrayP"];
_queryResult = [_this,0,[],[[]]] call BIS_fnc_param;

_vehicles = [];

{
    //_array = [_x select 4] call DB_fnc_mresToArray;
    //if (_array isEqualType "") then {_array = call compile format ["%1", _array];};
	_bool = [_x select 5,1] call DB_fnc_bool;
	//_arrayP = [_x select 12] call DB_fnc_mresToArray;
    //if (_arrayP isEqualType "") then {_arrayP = call compile format ["%1", _arrayP];};
    _vehicles PushBack [_x select 1,_x select 2,_x select 7,_x select 3,_x select 4,_bool,_x select 6,_x select 11,_x select 12];
    //classname - color - material - spname - tuning - insure - baseprice - servermap - parking
    //id, classname, color, spname, tuning_data, insure, baseprice ,material, inventory, fuel, gear, servermap, parking
    // 0      1			2		3		4			5		6			7			8	   9	10		11			12
} foreach _queryResult;

diag_log format ["getVehicles _vehicles: %1",_vehicles];