/*

	Filename: 	UnionClient_admin_mode.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"

if(FETCH_CONST(life_adminlevel) == 0) exitWith {closeDialog 0;};

private _mode = param[0,false,[false]];

life_admin_mode = _mode;

player allowDamage !_mode;


/*
 * player's user actions
 */
switch (life_admin_mode) do {
    case true: {
        if (count life_admin_actions > 0) exitWith {};
        life_respawn_timer = 1;
        life_enableFatigue = false;
        // invisibility mode action
        _img = '';
        if ((uniform player) isEqualTo "U_VirtualMan_F") then {
            _img = "<img image='\A3\ui_f\data\igui\cfg\actions\ico_on_ca.paa' /> ";
        };
        life_admin_actions pushBack (player addAction [
            format["<t color='#ff0000'>%1Невидимость</t>", _img],
            {
                _is_visible = !((uniform player) isEqualTo "U_VirtualMan_F");
                if (_is_visible) then {
                    life_admin_uniform pushBack (uniform player);
                    life_admin_uniform pushBack (uniformItems player);
					life_admin_uniform pushBack (headgear player);
                    removeUniform player;
					removeHeadgear player;
                    player forceAddUniform "U_VirtualMan_F";
					player addHeadgear "H_HelmetO_ViperSP_ghex_F";
                } else {
                    if !((count life_admin_uniform) isEqualTo 3) exitWith { life_admin_uniform = []; };
                    if ((life_admin_uniform select 0) isEqualTo "") exitWith { life_admin_uniform = []; };
                    removeUniform player;
                    player forceAddUniform (life_admin_uniform select 0);
                    {
                        player addItemToUniform _x;
                    } forEach (life_admin_uniform select 1);
					removeHeadgear player;
					player addHeadgear (life_admin_uniform select 2);
                    life_admin_uniform = [];
                };

            },
            "", 0, false, false, "",
            "((call life_adminlevel) > 3) && life_admin_mode"
        ]);

        // delete object action
        life_admin_actions pushBack (player addAction [
            "<t color='#ff0000'>Удалить объект</t>",
            { if (!(isNull cursorTarget) && !(isPlayer cursorTarget)) then { deleteVehicle cursorTarget; } },
            "", 0, false, false, "",
            "((call life_adminlevel) > 3) && life_admin_mode"
        ]);

        // restore object action
        life_admin_actions pushBack (player addAction [
            "<t color='#ff0000'>Восстановить объект</t>",
            {
                if (vehicle player != player) then {
                    (vehicle player) setDamage 0;
                } else {
                    if !(isNull cursorTarget) then {
                        cursorTarget setDamage 0;
                    };
                };
            },
            "", 0, false, false, "",
            "((call life_adminlevel) > 3) && life_admin_mode"
        ]);

		// сесть в машину на водителя
		life_admin_actions pushBack (player addAction [
		"<t color='#ff0000'>Сесть за водителя</t>",
		UnionClient_system_copEnter,"driver",200,false,false,"",
		'!isNull cursorTarget && {((cursorTarget isKindOf "LandVehicle")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship"))} && {(locked cursorTarget) != 0}'
		]);

		// сесть в машину на пассажира
		life_admin_actions pushBack (player addAction [
		"<t color='#ff0000'>Сесть за пассажира</t>",
		UnionClient_system_copEnter,"passenger",200,false,false,"",
		'!isNull cursorTarget && {((cursorTarget isKindOf "LandVehicle")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship"))} && {(locked cursorTarget) != 0}'
		]);

		// Выйти их техники
		life_admin_actions pushBack (player addAction [
		"<t color='#ff0000'>Выйти</t>",
		UnionClient_system_copEnter,"exit",200,false,false,"",
		'(vehicle player != player) && (locked(vehicle player)==2)'
		]);

	   // players nicknames
        ["playersNames", "onEachFrame", {
            {
                if (_x != player && (player distance _x) < viewDistance) then {
                    _color = [1,1,1,1];
                    if (side _x == west) then { _color = [0.5,0.5,1,1]; };
                    _pos = getPosVisual _x;
                    _text = format["%1 [%2]", name _x, round(player distance _x)];
                    drawIcon3D ["", _color, _pos, 0, 0, 0, _text, 0, 0.035, "puristaLight"];
                };
            } forEach playableUnits;
        }] call BIS_fnc_addStackedEventHandler;

        systemChat "Режим администратора включен";
    };
    case false: {
    	life_respawn_timer = 10;
    	life_enableFatigue = true;
        { player removeAction _x; } forEach life_admin_actions;
        life_admin_actions = [];
        ["playersNames", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
        systemChat "Режим администратора отключен";
    };
};

if (life_admin_mode) then
{
    am_admin_openMapEVHID = addMissionEventHandler["Map", {
        if (!life_admin_mode) exitWith {
            removeMissionEventHandler["Map", am_admin_openMapEVHID];
        };
        _map_opened = param[0, false, [false]];

        if (!_map_opened) exitWith {
            removeMissionEventHandler["Draw3D", am_admin_drawMapMarkersEVHID];
            {
                deleteMarkerLocal _x;
            } forEach am_admin_mapplayersMarkersList;
            am_admin_mapplayersMarkersList = nil;
        };

        am_admin_mapplayersMarkersList = [];
        am_admin_mapTrackedPlayers = [];
        am_admin_drawMapMarkersEVHID = addMissionEventHandler["EachFrame", {
            if (!life_admin_mode || !visibleMap) exitWith {
                removeMissionEventHandler["Draw3D", am_admin_drawMapMarkersEVHID];
                {
                    deleteMarkerLocal _x;
                } forEach am_admin_mapplayersMarkersList;
                am_admin_mapplayersMarkersList = nil;
            };

            _tracked_players_count = {
                !(player isEqualTo _x)
            } count playableUnits;

            if (_tracked_players_count != count(am_admin_mapplayersMarkersList)) then {
                { deleteMarkerLocal _x; } count am_admin_mapplayersMarkersList;
                am_admin_mapplayersMarkersList = [];
                {
                    if (!(player isEqualTo _x)) then {
                        am_admin_mapplayersMarkersList pushBack format["player_%1", getPlayerUID _x];
                        am_admin_mapTrackedPlayers pushBack _x;
                        _marker_name = format["player_%1", getPlayerUID _x];
                        createMarkerLocal[_marker_name, position _x];
                        _marker_name setMarkerShapeLocal "ICON";
                        _marker_name setMarkerTypeLocal "mil_start";
                        _marker_name setMarkerSizeLocal [0.6, 0.6];
                        _marker_name setMarkerDirLocal (getDir _x);
                        _marker_color = switch (side _x) do {
                            case (west): { "ColorBlue" };
                            case (independent): { "ColorGreen" };
							case (east): { "ColorRed" };
                            default { "ColorYellow" };
                        };
                        _marker_name setMarkerColorLocal _marker_color;
                        _marker_name setMarkerTextLocal (name _x);
                    };
                } forEach playableUnits;
            };

            {
                _marker_name = format["player_%1", getPlayerUID _x];
                _marker_name setMarkerPosLocal (position _x);
                _marker_name setMarkerDirLocal (getDir _x);

            } forEach am_admin_mapTrackedPlayers;
        }];
    }];
};