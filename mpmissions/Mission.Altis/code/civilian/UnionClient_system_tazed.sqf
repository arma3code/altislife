/*
	
	Filename: 	UnionClient_system_tazed.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_unit",Objnull,[Objnull]],
	["_shooter",Objnull,[Objnull]]
];
if (isNull _unit) exitWith {};
if (isNull _shooter OR LSNOTALIVE(_unit)) exitWith {[_unit,"tazed"] call UnionClient_system_clearGlobalVar};

if (_shooter isKindOf "Man" && alive _unit) then {
	if !(_unit GVAR ["tazed",false]) then {
		private "_obj";
		[_unit,"tazed",true] call CBA_fnc_setVarNet;
		disableUserInput true;
		[_unit] remoteExecCall ["UnionClient_system_tazeSound",RCLIENT];		
		if (NOTINVEH(_unit)) then {
			_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _unit);
			_obj setPosATL (getPosATL _unit);
			[_unit,"AinjPfalMstpSnonWnonDf_carried_fallwc"] remoteExecCall ["UnionClient_system_animSync",RCLIENT];
			_unit attachTo [_obj,[0,0,0]];
		};
		
		if (side _shooter != west) then {
			[[getPlayerUID _shooter,GVAR_RNAME(_shooter),"666"],"wantedAdd"] call UnionClient_system_hcExec;
		};
		systemChat format ["В вас выстрелил из шокера игрок с ID %1. Запомните этот ID на случай нарушений правил сервера",(getPlayerUID _shooter)];
		for "_i" from 1 to 30 do {
			titleText[format["В вас выстрелили из шокера и вы очнетесь через %1 сек.", (31 - _i)],"PLAIN"];
			uiSleep 1;
			if (GVAR_RESTRAINED(_unit)) exitWith {};
		};		
		
		if (NOTINVEH(_unit)) then {
			[_unit,"amovppnemstpsraswrfldnon"] remoteExecCall ["UnionClient_system_animSync",RCLIENT];
			detach _unit;
			deleteVehicle _obj;
		};
		titleText["","PLAIN"];
		[_unit,"tazed"] call UnionClient_system_clearGlobalVar;
		disableUserInput false;
	};
} else {	
	[_unit,"tazed"] call UnionClient_system_clearGlobalVar;
};