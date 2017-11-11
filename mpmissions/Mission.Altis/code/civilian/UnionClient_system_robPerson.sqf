/*
	
	Filename: 	UnionClient_system_robPerson.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_robber",ObjNull,[ObjNull]],
	["_who","",[""]]
];

if (isNull _robber OR (EQUAL(_who,""))) exitWith {};

if (CASH > 0 OR DCASH > 0) then {
	[CASH,DCASH] remoteExecCall ["UnionClient_system_robReceive",_robber];		 
	
	[[getPlayerUID _robber,GVAR_RNAME(_robber),"211"],"wantedAdd"] call UnionClient_system_hcExec;
	
	titleText[format["Вас ограбили на сумму в $%2",_who,[CASH + DCASH] call UnionClient_system_numberText],"PLAIN"];	
	systemChat format ["Вас ограбил игрок с ID %1. Запомните этот ID на случай нарушений правил сервера",_who];	
	
	["cash","drop",CASH,"Robbed"] call UnionClient_system_myCash;
	["dcash","drop",DCASH,"Robbed"] call UnionClient_system_myCash;
} else {	
	[2,"STR_NOTF_RobFail",true,[GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",_robber];
};