/*

	Filename: 	UnionClient_system_setPlayerLvl.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_leader",ObjNull,[ObjNull]],
	["_mode",0,[0]]
];
private _error = false;
private _msg = "";

switch (_mode) do {
	case 0: {
		switch (playerSide) do {
			case independent: {
				if (EQUAL(life_reblevel,1)) then {
					_error = true;
					_msg = "Уровень не может быть меньше 1";
				} else {
					life_reblevel = life_reblevel - 1;
					player SVAR ["lvl",life_reblevel,true];
					_msg = format["Уровень %1 понижен до %2",GVAR_RNAME(player),life_reblevel];
				};
			};
			case civilian: {
				if (EQUAL(life_civlevel,1)) then {
					_error = true;
					_msg = "Уровень не может быть меньше 1";
				} else {
					life_civlevel = life_civlevel - 1;
					player SVAR ["lvl",life_civlevel,true];
					_msg = format["Уровень %1 понижен до %2",GVAR_RNAME(player),life_civlevel];
				};
			};
			case west: {
				if (EQUAL(life_coplevel,1)) then {
					_error = true;
					_msg = "Уровень не может быть меньше 1";
				} else {
					life_coplevel = life_coplevel - 1;
					player SVAR ["copLevel",life_coplevel,true];
					_msg = format["Уровень %1 понижен до %2",GVAR_RNAME(player),life_coplevel];
				};
			};
			case east: {
				if (EQUAL(life_mediclevel,1)) then {
					_error = true;
					_msg = "Уровень не может быть меньше 1";
				} else {
					life_mediclevel = life_mediclevel - 1;
					player SVAR ["medrank",life_mediclevel,true];
					_msg = format["Уровень %1 понижен до %2",GVAR_RNAME(player),life_mediclevel];
				};
			};
		};
	};

	case 1: {
		switch (playerSide) do {
			case independent: {
				if (life_reblevel > 1) then {
					_error = true;
					_msg = "Уровень не может быть выше 2";
				} else {
					life_reblevel = life_reblevel + 1;
					player SVAR ["lvl",life_reblevel,true];
					_msg = format["Уровень %1 повышен до %2",GVAR_RNAME(player),life_reblevel];
				};
			};
			case civilian: {
				if (life_civlevel > 1) then {
					_error = true;
					_msg = "Уровень не может быть выше 2";
				} else {
					life_civlevel = life_civlevel + 1;
					player SVAR ["lvl",life_civlevel,true];
					_msg = format["Уровень %1 повышен до %2",GVAR_RNAME(player),life_civlevel];
				};
			};
			case west: {
				if (life_coplevel > 27) then {
					_error = true;
					_msg = "Уровень не может быть выше 28";
				} else {
					life_coplevel = life_coplevel + 1;
					player SVAR["copLevel",life_coplevel,true];
					_msg = format["Уровень %1 повышен до %2",GVAR_RNAME(player),life_coplevel];
				};
			};
			case east: {
				if (life_mediclevel > 5) then {
					_error = true;
					_msg = "Уровень не может быть выше 6";
				} else {
					life_mediclevel = life_mediclevel + 1;
					player SVAR["medrank",life_mediclevel,true];
					_msg = format["Уровень %1 повышен до %2",GVAR_RNAME(player),life_mediclevel];
				};
			};
		};
	};
};

if !(_error) then {
	switch(playerSide) do {
		case civilian: {[13] call UnionClient_session_updatePartial};
		case independent: {[14] call UnionClient_session_updatePartial};
		case west: {[17] call UnionClient_session_updatePartial};
		case east: {[19] call UnionClient_session_updatePartial};
	};
	[] call UnionClient_system_setTag;
};

[1,_msg] remoteExecCall ["UnionClient_system_broadcast",_leader];
[] remoteExec ["UnionClient_gangs_Menu",_leader];