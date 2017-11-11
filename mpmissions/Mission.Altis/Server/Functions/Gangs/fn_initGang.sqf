/*

	Filename: 	fn_initGang.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/

private _ratingQuery = ["SELECT id FROM gangs WHERE active='1' AND warpoints !='0' ORDER BY warpoints DESC LIMIT 10",2,true] call DB_fnc_asyncCall;
server_gangsRating = _ratingQuery;
publicVariable "server_gangsRating";
///////////////////////////
private _count = (["SELECT COUNT(*) FROM gangsContainers WHERE slots !='0' AND active='1'",2] call DB_fnc_asyncCall) select 0;
for [{_x=0},{_x<=_count},{_x=_x+10}] do {
	private _query = format ["SELECT class, inventory, trunk, slots FROM gangsContainers WHERE slots !='0' AND active='1' LIMIT %1,10",_x];
	private _queryResult = [_query,2,true] call DB_fnc_asyncCall;
	diag_log format ["OK fn_initGangs:_queryResult = %1",_queryResult];

	if (count _queryResult isEqualTo 0) exitWith {};

		{
		//private _obj = missionNameSpace getVariable [format["%1_trunk",_x select 0],objNull];
		_obj = getText(missionConfigFile >> "LifeCfgTrunks" >> _x select 0 >> "object");
		_obj = missionNameSpace getVariable [_obj,objNull];

		if !(isNull _obj) then {
    	private _inv = [_x select 1] call DB_fnc_mresToArray;
    	if (_inv isEqualType "") then {_inv = call compile format ["%1", _inv];};
		private _trunk = [_x select 2] call DB_fnc_mresToArray;
    	if (_trunk isEqualType "") then {_trunk = call compile format ["%1", _trunk];};
    	_obj setVariable ["VarDB",_x select 0,true];
	    _obj setVariable ["Trunk",_trunk,true];
	    _obj setVariable ["inventory",_inv,true];
		_obj setVariable ["locked",true,true]; //Lock up all the stuff.
	    _obj setVariable ["slots",_x select 3,true];
    	};
    	} forEach _queryResult;
};

