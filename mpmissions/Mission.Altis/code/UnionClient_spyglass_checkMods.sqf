/*

	Filename: 	UnionClient_spyglass_checkMods.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _binConfigPatches = configFile >> "CfgPatches";
private _patchList = getArray (missionConfigFile >> "SpyGlass" >> "SPY_Patches_List");
private _patchListApex = getArray (missionConfigFile >> "SpyGlass" >> "SPY_Apex_Patches_List");
private _patchListJSRS = getArray (missionConfigFile >> "SpyGlass" >> "SPY_JSRS_Patches_List");
private _verCheckArray = getArray (missionConfigFile >> "SpyGlass" >> "SPY_ExtremoMods_List");
private _configPatches = [];
private _error = false;

for "_i" from 0 to count (_binConfigPatches)-1 do {	
	_patchEntry = _binConfigPatches select _i;
	if (isClass _patchEntry) then {
		_configPatches pushBack (configName _patchEntry);
		
		if !((configName _patchEntry) in (_patchList + _patchListApex + _patchListJSRS)) exitWith {
			_error = true;
			format["CheckMods - addon %1 not in white list",configName _patchEntry] call UnionClient_system_log;
			failMission "SpyGlassAddonsNotWhite";
		};
	};
};

if (_error) exitWith {false};

{	
	if !(_x in _configPatches) exitWith {
		_error = true;
		format["CheckMods - addon %1 missed",_x] call UnionClient_system_log;
		failMission "SpyGlassAddonsMissed";
	};
} forEach _patchList;

if (_error) exitWith {false};

{
	private _versionCurrent = getText (configfile >> "CfgPatches" >> (_x select 0) >> "version");	
	if !(EQUAL(_versionCurrent,(_x select 1))) exitWith {
		_error = true;		
		format ["CheckMods - addon outdate: %1 (need: %2, you: %3)",_x select 0,_x select 1,_versionCurrent] call UnionClient_system_log;
		failMission "SpyGlassAddonsVersion";
	};
} forEach _verCheckArray;

if (_error) exitWith {false};

true