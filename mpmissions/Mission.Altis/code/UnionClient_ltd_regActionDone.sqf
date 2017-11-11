/*

	Filename: 	UnionClient_ltd_regActionDone.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params [
	["_done",false,[true]],
	["_message",[],["",[]]]
];

disableSerialization;
life_action_inUse = false;

if (_done) then {
	["atm","take",100000] call UnionClient_system_myCash;
	if (_message isEqualType []) then {life_ltdData = _message};	
	hint format["Поздравляем! Вы стали владельцем фирмы ""%1""",life_ltdData select 2];	
	closeDialog 0;
} else {
	(CONTROL(7100,7103)) ctrlEnable true;
	if (_message isEqualType "") then {hint _message};
};