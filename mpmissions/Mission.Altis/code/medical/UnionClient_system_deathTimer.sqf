/*

	Filename: 	UnionClient_system_deathTimer.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_countDown","_time","_timer","_uiDisp","_rscLayer","_marker","_markerName","_warn","_deathTime","_timeToEnd"];
_deathTime = param [0,15,[0]];

if ((ISPSIDE(west) && (west countSide playableUnits) <= LIFE_SETTINGS(getNumber,"life_cop_min")) OR (ISPSIDE(east))) exitWith {
	life_death_markers = [];
	life_death_endtime = 0;
};

disableSerialization;

{
	_marker = createMarkerLocal [format["death_marker_%1",_x select 0],_x select 1];
	_marker setMarkerShapeLocal "ELLIPSE";
	_marker setMarkerSizeLocal [1500,1500];
	_marker setMarkerBrushLocal "Solid";
	_marker setMarkerColorLocal "ColorBlack";

	_warn = createMarkerLocal [format["death_warn_%1",_x select 0],_x select 1];
	_warn setMarkerColorLocal "ColorWhite";
	_warn setMarkerTypeLocal "KIA";
	_warn setMarkerTextLocal "Место смерти! Не входить! Бан 1 час!";
} forEach life_death_markers;

systemchat format ["Запущен таймер правила новой жизни (%1 минут). Вам запрещено появляться на месте смерти!",_deathTime];

_uiDisp = GVAR_UINS ["death_timer",displayNull];
if (isNull _uiDisp) then {
	["death_timer","PLAIN"] call UnionClient_gui_CreateRscLayer;
	_uiDisp = GVAR_UINS ["death_timer",displayNull];
};
_timer = _uiDisp displayCtrl 38303;
_time = time + (_deathTime * 60);

life_death_timer = true;
while {true} do {
	_timeToEnd = _time - time;
	life_death_endtime = round (_timeToEnd/60);
	if (round(_timeToEnd) < 1) exitWith {life_death_timer = false;};
	if (LSNOTALIVE(player) && ((round(_timeToEnd)) > 0)) exitWith {};
	if !(EQUAL(life_death_markers,[])) then {
		{
			if (player distance (_x select 1) < 1500) exitWith {
				life_death_markers = [];
				life_death_endtime = 0;
				[] call UnionClient_session_updateRequest;
				uiSleep 5;
				//[steamid,60,"NewLife Ban","15min cd"] remoteExecCall ["TON_fnc_rcon",RSERV];
				[player,2] call UnionClient_system_punishment;
				//45 минут
				uiSleep 5;
			};
		} forEach life_death_markers;
	};

	_timer ctrlSetText format["Новая жизнь: %1",[_timeToEnd,"MM:SS"] call BIS_fnc_secondsToString];
	uiSleep 1;
};

if !(life_death_timer) then {
	{
		deleteMarkerLocal format["death_marker_%1",_x select 0];
		deleteMarkerLocal format["death_warn_%1",_x select 0];
	} forEach life_death_markers;

	life_death_markers = [];
	life_death_endtime = 0;
};

["death_timer"] call UnionClient_gui_DestroyRscLayer;