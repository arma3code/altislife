/*

	Filename: 	UnionClient_gangs_Leave.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if (steamid == (grpPlayer GVAR "gang_owner")) exitWith {hint localize "STR_GNOTF_LeaderLeave"};
private _action = [
	format["Вы действительно хотите покинуть банду %1?",GANG_NAME],
	"Выход из банды",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	closeDialog 0;
	hint "Выходим из банды. Подождите...";
	//////фикс киков, если убирать тут - то убрать в инвайтах и в ините убрать переменную gang_members
	_membersCount = grpPlayer getVariable ["gang_members",[[]]];
	_membersNew = [];
	{
	    if ((_x select 0) != steamid) then {
		    _membersNew pushBack _x
		};
	} forEach _membersCount;
	grpPlayer setVariable["gang_members",_membersNew,true];
	/////////////////////
	if (grpPlayer GVAR["gang_deputy","-1"] == steamid) then {
		[grpPlayer,"gang_deputy"] call UnionClient_system_clearGlobalVar;
		[[4,grpPlayer,playerSide,steamid],"updateGang"] call UnionClient_system_hcExec;
	};

	[[5,grpPlayer,playerSide,steamid],"updateGang"] call UnionClient_system_hcExec;

	switch (playerSide) do {
		case civilian: {
			[player] joinSilent (createGroup civilian);
		};
		case independent: {
			[player] joinSilent (createGroup independent);
		};
		case west: {
			[player] joinSilent (createGroup west);
		};
		case east: {
			[player] joinSilent (createGroup east);
		};
	};
	[] call UnionClient_gangs_ClearLicense;
	hint "Вы покинули банду!";
};