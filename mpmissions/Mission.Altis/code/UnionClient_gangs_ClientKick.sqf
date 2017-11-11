/*

	Filename: 	UnionClient_gangs_ClientKick.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params [
	["_leader",ObjNull,[ObjNull]],
	["_grp",grpNull,[grpNull]]
];

if (isNil "_leader" OR isNil "_grp") exitWith {};
//////фикс киков, если убирать тут - то убрать в инвайтах и в ините убрать переменную gang_members
private _members = _grp getVariable ["gang_members",[[]]];
private _membersNew = [];
{
    if ((_x select 0) != steamid) then {_membersNew pushBack _x};
} forEach _members;
_grp setVariable["gang_members",_membersNew,true];
/////////////////////
if (_grp GVAR ["gang_deputy","-1"] == steamid) then {
	[_grp,"gang_deputy"] call UnionClient_system_clearGlobalVar;
	[[4,_grp,playerSide,steamid],"updateGang"] call UnionClient_system_hcExec;
};

[[5,_grp,playerSide,steamid],"updateGang"] call UnionClient_system_hcExec;

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
[] remoteExec ["UnionClient_gangs_Menu",_leader];
hint "Вы были исключены из банды";