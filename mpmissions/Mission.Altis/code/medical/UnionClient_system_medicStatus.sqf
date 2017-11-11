/*

	Filename: 	UnionClient_system_medicStatus.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\..\script_macros.hpp"
private["_medic","_mode"];
_medic = param [0,ObjNull,[ObjNull]];
_mode = param [1,0,[0]];

life_medicstatusby = GVAR_RNAME(_medic);
life_medicstatus = _mode;

[player,"medicStatus",life_medicstatus] call CBA_fnc_setVarNet;
[] remoteExecCall ["UnionClient_system_medicMenu",_medic];

/*

Принято = 1

Перестрелка 2
Военное положение 3
 
Отказ = 0
Красная зона 4
Черный список 5
Розыск 6

*/