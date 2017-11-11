/*
	Filename: 	fn_initHouses.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

    Description:
    Initalizes house setup when player joins the server.
*/
private _count = (["SELECT COUNT(*) FROM houses WHERE owned='1'",2] call DB_fnc_asyncCall) select 0;

for [{_x=0},{_x<=_count},{_x=_x+10}] do {
//                                      0           1           2                3            4
    private _query = format ["SELECT houses.id, houses.pid, houses.classname, houses.pos, players.name FROM houses INNER JOIN players WHERE houses.owned='1' AND houses.pid = players.playerid LIMIT %1,10",_x];
    private _queryResult = [_query,2,true] call DB_fnc_asyncCall;
	diag_log format ["OK fn_initHouses:_queryResult = %1",_queryResult];
    if (count _queryResult isEqualTo 0) exitWith {};
	{
	    private _position = call compile format ["%1",_x select 3];
        private _house = nearestObject [_position, _x select 2];
        _house setVariable ["house_owner",[_x select 1,_x select 4],true];
        _house setVariable ["house_id",_x select 0,true];
        _house setVariable ["locked",true,true]; //Lock up all the stuff.
    } forEach _queryResult;
};