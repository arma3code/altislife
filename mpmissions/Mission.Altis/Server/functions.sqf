#include "script_macros.hpp"
/*
	Filename: 	functions.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
*/
TON_fnc_customLog =
compileFinal "
		_filename = _this select 0;
		_logentry = _this select 1;
		if (isNil ""_filename"" || isNil ""_logentry"") exitWith {diag_log ""TON_fnc_customLog ERROR something isNil""};
		_filename = format [""%1A3_%2_%3_%4"",""A3CUSTOMLOGS/"", briefingName select [0,10], worldName select [0,10], _filename];
		""armalog"" callExtension format [""2%1|%2"", _filename, _logentry];
";
TON_fnc_index =
compileFinal "
    private [""_item"",""_stack""];
    _item = _this select 0;
    _stack = _this select 1;
    _return = -1;

    {
        if (_item in _x) exitWith {
            _return = _forEachIndex;
        };
    } forEach _stack;

    _return;
";

TON_fnc_player_query =
compileFinal "
    private [""_ret""];
    _ret = _this select 0;
    if (isNull _ret) exitWith {};
    if (isNil ""_ret"") exitWith {};

    [life_atmbank,life_cash,owner player,player,profileNameSteam,getPlayerUID player,playerSide] remoteExecCall [""life_fnc_adminInfo"",_ret];
";
publicVariable "TON_fnc_player_query";
publicVariable "TON_fnc_index";

TON_fnc_isnumber =
compileFinal "
    private [""_valid"",""_array""];
    _valid = [""0"",""1"",""2"",""3"",""4"",""5"",""6"",""7"",""8"",""9""];
    _array = [_this select 0] call KRON_StrToArray;
    _return = true;

    {
        if (!(_x in _valid)) exitWith {
            _return = false;
        };
    } forEach _array;
    _return;
";

publicVariable "TON_fnc_isnumber";

TON_fnc_clientGangKick =
compileFinal "
    private [""_unit"",""_group""];
    _unit = _this select 0;
    _group = _this select 1;
    if (isNil ""_unit"" || isNil ""_group"") exitWith {};
    if (player isEqualTo _unit && (group player) == _group) then {
        life_my_gang = objNull;
		life_PlayerGroup = grpNull;
        [player] joinSilent (createGroup civilian);
        hint ""Вы были исключены из группировки."";
    };
";

publicVariable "TON_fnc_clientGangKick";

TON_fnc_clientGetKey =
compileFinal "
    private [""_vehicle"",""_unit"",""_giver""];
    _vehicle = _this select 0;
    _unit = _this select 1;
    _giver = _this select 2;

    if (player isEqualTo _unit && !(_vehicle in life_vehicles)) then {
        _name = getText(configFile >> ""CfgVehicles"" >> (typeOf _vehicle) >> ""displayName"");
        hint format [""%1 дал вам ключи для %2"",_giver,_name];
        life_vehicles pushBack _vehicle;
        [getPlayerUID player,playerSide,_vehicle,1] remoteExecCall [""TON_fnc_keyManagement"",2];
    };
";

publicVariable "TON_fnc_clientGetKey";

TON_fnc_clientGangLeader =
compileFinal "
    private [""_unit"",""_group""];
    _unit = _this select 0;
    _group = _this select 1;
    if (isNil ""_unit"" || isNil ""_group"") exitWith {};
    if (player isEqualTo _unit && (group player) == _group) then {
        player setRank ""COLONEL"";
        _group selectLeader _unit;
        hint ""Теперь вы лидер группировки."";
    };
";

publicVariable "TON_fnc_clientGangLeader";

TON_fnc_clientGangLeft =
compileFinal "
    private [""_unit"",""_group""];
    _unit = _this select 0;
    _group = _this select 1;
    if (isNil ""_unit"" || isNil ""_group"") exitWith {};
    if (player isEqualTo _unit && (group player) == _group) then {
        life_my_gang = objNull;
        [player] joinSilent (createGroup civilian);
        hint ""Вы покинули группировку."";
    };
";

publicVariable "TON_fnc_clientGangLeft";