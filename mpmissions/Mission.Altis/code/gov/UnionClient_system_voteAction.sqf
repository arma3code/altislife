/*
	
	Filename: 	UnionClient_system_voteAction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_unitID"];
_unitID = CONTROL_DATA(3301);
if(isNil "_unitID") exitwith {};
if(_unitID == "") exitWith {};

[_unitID,steamid,player] remoteExec ["TON_fnc_vote",RSERV];

hint "Ваш бюллетень оправлен на рассмотрение...";
closeDialog 0;