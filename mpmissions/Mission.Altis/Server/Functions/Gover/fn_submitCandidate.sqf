/*
	Filename: 	fn_submitCandidate.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
*/

params [
    ["_player",objNull,[objNull]],
	["_invest",0,[0]],
    ["_policy","",[""]]
];

if (isNull _player || _policy isEqualTo "") exitWith {};

private _name = name _player;
private _uid = getPlayerUid _player;

_query = format ["INSERT INTO politics (name,uid,invest,policy,active) VALUES('%1', '%2', '%3', '%4', '1')",_name,_uid,_invest,_policy];

[_query,1] call DB_fnc_asyncCall;

server_candidates pushBack [_uid,_name,_invest,_policy];
publicVariable "server_candidates";