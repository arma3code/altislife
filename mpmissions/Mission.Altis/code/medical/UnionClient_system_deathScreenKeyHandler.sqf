/*

	Filename: 	UnionClient_system_deathScreenKeyHandler.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params ["_ctrl","_code","_shift","_ctrlKey","_alt"];
if !(LSINCAP(player)) exitWith {false};

private _handled = false;
private _medicReqKey = (actionKeys "ShowMap") select 0;
private _deathKey = 19; //R
private _resKey = 35; //H

switch (true) do {
	case (EQUAL(_code,_medicReqKey)): {
		_handled = true;
		[player] call UnionClient_system_requestMedic;
	};
	case (EQUAL(_code,_deathKey)): {
		_handled = true;
		if (life_deathScreen_canRespawn) then {
			[player] call UnionClient_dmg_dieInAgony;
		};
	};
	case (EQUAL(_code,_resKey)): {
		if (FETCH_CONST(life_adminlevel) > 0) then {
			_handled = true;
			[player] spawn UnionClient_system_revived;
		};
	};
	case (EQUAL(_code,74)): {
		if(_shift) then {
			_handled = true;
			["SHIFTMINUS",format["%1 (%2) use shift minus endmission in AGONY",GVAR_RNAME(player),steamid]] remoteExecCall ["TON_fnc_customLog",RSERV];
			[] spawn {
			   hint "Вы замороженны на 15 сек за Shift минус";
			   disableUserInput true;
			   uiSleep 15;
			   disableUserInput false;
			   hint "Вы разморожены";
			};
		};
	};
};

_handled