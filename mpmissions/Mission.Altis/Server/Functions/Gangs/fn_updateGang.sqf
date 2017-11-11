/*

    Filename:   fn_updateGang.sqf
    Project:    Union Altis Life RPG
    Author:     Merrick & Affect
    Steam:      76561198006439083 & 76561198053094990
    Web:        http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private ["_groupID","_bank","_maxMembers","_members","_query","_owner","_deputy","_gangInfo"];
params [
    ["_mode",0,[0]],
    ["_group",grpNull,[grpNull]],
	["_side",sideUnknown,[civilian]],
    ["_uid","",[""]]
];

if (isNull _group || _side isEqualTo sideUnknown) exitWith {}; //FAIL

_side = switch (_side) do {
	case civilian: {"civ"};
	case west: {"cop"};
	case independent: {"reb"};
	case east: {"med"};
};

_groupID = _group getVariable ["gang_id",-1];
if (_groupID isEqualTo -1) exitWith {diag_log format ["||updateGang||gang_id = %1",_groupID];};

switch (_mode) do {
    case 0: {
		_bank = [(_group getVariable ["gang_bank",0])] call DB_fnc_numberSafe;
        _maxMembers = _group getVariable ["gang_maxMembers",8];
        _members = [(_group getVariable "gang_members")] call DB_fnc_mresArray;
        _owner = _group getVariable ["gang_owner",""];
		_deputy = _group getVariable ["gang_deputy",""];
		_gangInfo = _group getVariable "gang_info";
		diag_log format ["||updateGang 0|| %1 %2 %3 %4 %5 %6",_bank,_maxMembers,_members,_owner,_deputy,_gangInfo]; //Лог о бане
        if (_owner isEqualTo "") exitWith {};
        _query = format ["UPDATE gangs SET bank='%3', maxmembers='%4', owner='%5', deputy='%6', members='%7', info='%8' WHERE id='%1' AND side='%2'",_groupID,_side,_bank,_maxMembers,_owner,_deputy,_members,_gangInfo];
    };

    case 1: {
	    diag_log format ["||updateGang 1|| %1",(_group getVariable ["gang_bank",0])]; //Лог о бане
        _query = format ["UPDATE gangs SET bank='%1' WHERE id='%2' AND side='%3'",([(_group getVariable ["gang_bank",0])] call DB_fnc_numberSafe),_groupID,_side];
    };

    case 2: {
	    _maxMembers = _group getVariable ["gang_maxMembers",8];
		diag_log format ["||updateGang 2|| %1",_maxMembers]; //Лог о бане
        _query = format ["UPDATE gangs SET maxmembers='%1' WHERE id='%2' AND side='%3'",_maxMembers,_groupID,_side];
    };

    case 3: {
        _owner = _group getVariable ["gang_owner",""];
		diag_log format ["||updateGang 3|| %1",_owner]; //Лог о бане
        if (_owner isEqualTo "") exitWith {};
        _query = format ["UPDATE gangs SET owner='%1' WHERE id='%2' AND side='%3'",_owner,_groupID,_side];
    };

    case 4: {
		_deputy = _group getVariable ["gang_deputy",""];
        diag_log format ["||updateGang 4|| %1",_deputy]; //Лог о бане
        if (_deputy isEqualTo "") then {_deputy = "-1";};
        _query = format ["UPDATE gangs SET deputy='%1' WHERE id='%2' AND side='%3'",_deputy,_groupID,_side];
    };

	case 5: {//kick
        _members = _group getVariable ["gang_members",[[]]];
        _members = [_members] call DB_fnc_mresArray;
        diag_log format ["||updateGang 5|| %1",_members]; //Лог о бане
        private _membersCount = _group getVariable ["gang_membersCount",0];
        _group setVariable ["gang_membersCount",(_membersCount - 1),true];
        _query = format ["UPDATE gangs SET members='%1' WHERE id='%2' AND side='%3'",_members,_groupID,_side];
    };

	case 6: {//invite
        _members = _group getVariable ["gang_members",[[]]];
        _members = [_members] call DB_fnc_mresArray;
        private _membersCount = _group getVariable ["gang_membersCount",0];
        _group setVariable ["gang_membersCount",(_membersCount + 1),true];
        diag_log format ["||updateGang 6|| %1",_members]; //Лог о бане
        _query = format ["UPDATE gangs SET members='%1' WHERE id='%2' AND side='%3'",_members,_groupID,_side];
    };

    case 7: {
        _gangInfo = _group getVariable ["gang_info",[]];
        if (_gangInfo isEqualTo []) exitWith {};
        _gangInfo = [_gangInfo] call DB_fnc_mresArray;
        diag_log format ["||updateGang 7|| %1",_gangInfo]; //Лог о бане
        _query = format ["UPDATE gangs SET info='%1' WHERE id='%2' AND side='%3'",_gangInfo,_groupID,_side];
    };
};

if (!isNil "_query") then {
    [_query,1] call DB_fnc_asyncCall;
};
