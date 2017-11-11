/*
	Filename: 	fn_getOffline.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
*/
private _unit = param [0,objNull];
private _group = param [1,grpNull];
private _pside = param [2,"civ"];

private _ownerID = _group getVariable ["gang_owner",""];
private _groupName = _group getVariable ["gang_name",""];

//private _query = format ["SELECT members FROM gangs WHERE active='1' AND side='%1' AND owner = '%2' AND name = '%3'",_pside,_ownerID,_groupName];

//private _queryResult = [_query,2] call DB_fnc_asyncCall;

//_queryResult = _queryResult call DB_fnc_mresToArray;
//if (_queryResult isEqualType "") then {_queryResult = call compile format ["%1", _queryResult];};

[_group getVariable ["gang_members",[[]]]] remoteExecCall ["UnionClient_gangs_OfflineList",_unit];

//_group setVariable ["gang_members",_queryResult,true];