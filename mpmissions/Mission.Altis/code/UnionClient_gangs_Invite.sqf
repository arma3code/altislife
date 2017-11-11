/*

	Filename: 	UnionClient_gangs_Invite.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params [
	["_name","",[""]],
	["_group",grpNull,[grpNull]],
	["_leader",ObjNull,[ObjNull]]
];

if (EQUAL(_name,"") OR isNull _group) exitWith {}; //Fail horn anyone?
if (!isNil {grpPlayer getVariable "gang_name"}) exitWith {hint "Вы уже в группировке"};

private _gangName = _group getVariable "gang_name";
private _action = [
	format[localize "STR_GNOTF_InviteMSG",_name,_gangName],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[player] join _group;
	//////фикс инвайтов, если убирать тут - то убрать в кике и в ините убрать переменную gang_members
	private _members = _group getVariable ["gang_members",[[]]];
	private _array = [steamid,profilename];
	_members pushBack _array;
	_group setVariable["gang_members",_members,true];
	//////////////////////////
	[[6,_group,playerSide,steamid],"updateGang"] call UnionClient_system_hcExec;

	private _gangLicense = _group GVAR ["gang_license","-1"];
	if !(EQUAL(_gangLicense,"-1")) then {
		["GANGS",[format["Joined premium-gang %1 (license %3). Invite was sent by %2",_gangName,_name,_gangLicense]],GVAR_RNAME(player),steamid] remoteExecCall ["TON_fnc_customLog",RSERV];
	};
	[] remoteExec ["UnionClient_gangs_Menu",_leader];
} else {
	hint "Вы отменили приглашение";
};