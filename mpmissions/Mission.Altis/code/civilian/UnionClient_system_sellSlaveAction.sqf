/*
	
	Filename: 	UnionClient_system_sellSlaveAction.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_owner",objNull,[objNull]],
	["_rate",0,[0]]
];
[player,"restrained"] call UnionClient_system_clearGlobalVar;
[player,"slave",true] call CBA_fnc_setVarNet;
life_slave = true;
[8] call UnionClient_session_updatePartial;

cutText ["Вы попали в рабство! Самое время добыть немного хлопка и обрести свободу.","BLACK IN",5];
player setPosATL (getMarkerPos "cotton_1");

if (!isNull _owner) then {
	[player,_rate] remoteExecCall ["UnionClient_system_sellSlaveDone",_owner];
};

[] spawn {
	while {life_slave && LSALIVE(player)} do {
		if (player distance (getMarkerPos "cotton_1") > 30) then	{
			player setPosATL (getMarkerPos "cotton_1");
			hint "Убегать бесполезно. Солнце еще высоко....";
		};
		uiSleep 1;
	};
};