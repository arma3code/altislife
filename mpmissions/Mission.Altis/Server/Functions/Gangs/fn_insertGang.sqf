#include "\UnionServer\script_macros.hpp"
/*
    File: fn_insertGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Inserts the gang into the database.
*/
params [
    ["_ownerID",objNull,[objNull]],
    ["_uid","",[""]],
    ["_gangName","",[""]],
	["_side",sideUnknown,[civilian]],
	["_name","",[""]]
];

private _group = group _ownerID;

if (isNull _ownerID || _uid isEqualTo "" || _gangName isEqualTo "" || _side isEqualTo sideUnknown) exitWith {}; //Fail

_checkside = switch(_side) do{
	case civilian: {"civ"};
	case west: {"cop"};
	case independent: {"reb"};
	case east: {"med"};
};

_ownerID = owner _ownerID;
_gangName = [_gangName] call DB_fnc_mresString;
private _query = format ["SELECT id FROM gangs WHERE name='%1' AND active='1' AND side='%2'",_gangName,_checkside];

private _queryResult = [_query,2] call DB_fnc_asyncCall;

//Check to see if the gang name already exists.
if (!(count _queryResult isEqualTo 0)) exitWith {
    [1,"Существует уже банда создана с тем же именем, пожалуйста, выберите другое имя."] remoteExecCall ["UnionClient_system_broadcast",_ownerID];
    life_action_gangInUse = nil;
    _ownerID publicVariableClient "life_action_gangInUse";
};

_query = format ["SELECT id FROM gangs WHERE members LIKE '%2%1%2' AND side='%3' AND active='1'",_uid,"%",_checkside];

_queryResult = [_query,2] call DB_fnc_asyncCall;

//Check to see if this person already owns or belongs to a gang.
if (!(count _queryResult isEqualTo 0)) exitWith {
    [1,"У вас уже есть банда, пробуйте перезайти или ливните с старой."] remoteExecCall ["UnionClient_system_broadcast",_ownerID];
    life_action_gangInUse = nil;
    _ownerID publicVariableClient "life_action_gangInUse";
};

//Check to see if a gang with that name already exists but is inactive.
_query = format ["SELECT id, active FROM gangs WHERE name='%1' AND active='0'",_gangName];

private _array = [];
_array pushBack [_uid,_name];

_queryResult = [_query,2,true] call DB_fnc_asyncCall;
private _gangMembers = [_array] call DB_fnc_mresArray;

if (!(count _queryResult isEqualTo 0)) then {
    _query = format ["UPDATE gangs SET active='1', owner='%1',members='%2' WHERE id='%3'",_uid,_gangMembers,(_queryResult select 0)];
} else {
    _query = format ["INSERT INTO gangs (owner, name, members, side, info, deputy, license) VALUES('%1','%2','%3','%4','""[]""','-1','-1')",_uid,_gangName,_gangMembers,_checkside];
};

_queryResult = [_query,1] call DB_fnc_asyncCall;

_group setVariable ["gang_name",_gangName,true];
_group setVariable ["gang_owner",_uid,true];
_group setVariable ["gang_deputy","-1",true];
_group setVariable ["gang_bank",0,true];
_group setVariable ["gang_maxMembers",8,true];
_group setVariable ["gang_membersCount",1,true];
_group setVariable ["gang_members",_array,true];
_group setVariable ["gang_info",[],true];
_group setVariable ["gang_side",_side,true];
_group setVariable ["gang_license","-1",true];
_group setVariable ["gang_warpoints",0,true];
[_group] remoteExecCall ["UnionClient_gangs_Created",_ownerID];

uiSleep 0.35;
_query = format ["SELECT id FROM gangs WHERE owner='%1' AND active='1' AND side='%2'",_uid,_checkside];

_queryResult = [_query,2,true] call DB_fnc_asyncCall;

_group setVariable ["gang_id",(_queryResult select 0 select 0),true];
