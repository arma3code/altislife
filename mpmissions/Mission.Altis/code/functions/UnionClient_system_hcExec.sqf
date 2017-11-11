/*

	Filename: 	UnionClient_system_hcExec.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_vars",[],[[]]],
	["_func","",[""]],
	["_tag","TON",[""]],
	["_call",true,[false]]
];

if (EQUAL(_func,"")) exitWith {"hcExec - function is empty" call UnionClient_system_log};

/*_tag = switch (_tag) do { 
	case "SYS" : {"ExtremoServer_system"}; 
	case "DB" : {"ExtremoServer_database"}; 
	default {""}; 
};*/

if (EQUAL(_tag,"")) exitWith {"hcExec - tag is empty" call UnionClient_system_log};

private ["_function","_target"];
switch (true) do { 
	case (life_HC_isActive) : {
		_function = format ["ExtremoHeadless_system_%1",_func];
		_target = HC_Life;
	}; 
	default {
		_function = format ["%1_fnc_%2",_tag,_func];
		_target = RSERV;
	}; 
};

if (isNil "_function" OR isNil "_target") exitWith {"hcExec - function is nil OR target isNil" call UnionClient_system_log};

if (_call) then {
	_vars remoteExecCall [_function,_target];
	diag_log format ["EXEC CALL: %1 - %2 - %3",_function,_target,_vars];	
} else {
	_vars remoteExec [_function,_target];
	diag_log format ["EXEC: %1 - %2 - %3",_function,_target,_vars];	
};