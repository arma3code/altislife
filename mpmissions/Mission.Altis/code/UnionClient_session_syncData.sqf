/*
	
	Filename: 	UnionClient_session_syncData.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
if(isNil "life_session_time") then {life_session_time = false;};
if(life_session_time) exitWith {hint localize "STR_Session_SyncdAlready";};

[] call UnionClient_session_updateRequest;
hint localize "STR_Session_SyncData";
[] spawn {
	life_session_time = true;
	uiSleep (5 * 60);
	life_session_time = false;
};
	