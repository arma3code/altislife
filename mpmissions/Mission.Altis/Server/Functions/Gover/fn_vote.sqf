/*
	Filename: 	fn_vote.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
*/

_voterid = param[0];
_candidate = param[1];

_query = format ["UPDATE players,politics SET players.voted=1, politics.votecount=politics.votecount+1 WHERE players.playerid = '%1' and politics.uid='%2'",_voterid,_candidate];
[_query,1] call DB_fnc_asyncCall;