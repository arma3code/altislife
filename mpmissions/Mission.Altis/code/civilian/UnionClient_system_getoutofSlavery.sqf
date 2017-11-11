/*
	
	Filename: 	UnionClient_system_getoutofSlavery.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (life_inv_cotton == 20) then {
	[false,"cotton",20] call UnionClient_system_handleInv;
	[player,"slave"] call UnionClient_system_clearGlobalVar;	
	life_slave = false;
	player setPos (getMarkerPos "jail_release_civ");
	[8] call UnionClient_session_updatePartial;
	hint "Вы обрели свободу! Долой кандалы!";
} else {
	hint "Вам нужно ровно 20 единиц хлопка. Ни больше ни меньше!";
};
