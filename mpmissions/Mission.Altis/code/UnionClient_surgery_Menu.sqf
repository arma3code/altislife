/*
	
	Filename: 	UnionClient_surgery_Menu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (server_restartSoon) exitWith {hint "Надвигается буря..."};

disableSerialization;
createDialog "UnionDialogSurgery";
waitUntil {!isNull (findDisplay 5400)};

call UnionClient_surgery_BoxCreate;

_list = CONTROL(5400,5402);
lbClear _list;

{
	if (isNumber (configfile >> "CfgFaces" >> "Man_A3" >> (configName _x) >> "disabled")) then {
		if (EQUAL((getNumber (_x >> "disabled")),0)) then {
			_list lbAdd format["%1",getText (_x >> "displayname")];
			_list lbSetData [(lbSize _list)-1,configName _x];
			_list lbSetTextRight [(lbSize _list)-1, format["  $%1", [5000] call UnionClient_system_numberText]];
		};
	};
} forEach ("true" configClasses (configfile >> "CfgFaces" >> "Man_A3"));


[] spawn {
	while {true} do {
		if (isNull (findDisplay 5400)) exitWith {
			call UnionClient_surgery_BoxDestroy;
		};
		uiSleep 0.1;
	};
};