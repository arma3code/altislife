/*

	Filename: 	UnionClient_effects_Position.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _markers = LIFE_SETTINGSWORLD(getArray,worldName,"life_posWhite");
if (EQUAL(_markers,[])) exitWith {};

private["_pos1","_pos2","_dist","_jumper"];
while {true} do {
	_pos1 = getPosATL player;
	uiSleep 1;
	_pos2 = getPosATL player;
	if (NOTINVEH(player)) then {
		if ((_pos2 select 2 ) > 10) exitWith {};
		_dist = _pos1 distance2D _pos2;
		if (_dist > 40) then {
			if (FETCH_CONST(life_adminlevel) > 0) exitWith {};
			_jumper = true;
			{
				if ((_pos2 distance (getMarkerPos (_x select 0)) < (_x select 1)) OR (_pos1 distance (getMarkerPos (_x select 0)) < (_x select 1))) exitWith {
					_jumper = false;
				};
			} forEach _markers;
			if (_jumper) then {
				_pos1 = [round (_pos1 select 0),round (_pos1 select 1),round (_pos1 select 2)];
				_pos2 = [round (_pos2 select 0),round (_pos2 select 1),round (_pos2 select 2)];
				_dist = round(_pos1 distance2D _pos2);
				["TELEPORT",format["Moved from %1 to %2 --> (%3 m) for 1 sec || %4 (%5)",_pos1,_pos2,_dist,GVAR_RNAME(player),steamid]] remoteExecCall ["TON_fnc_customLog",RSERV];
			};
		};
	};
};