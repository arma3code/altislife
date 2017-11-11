
/*
	Filename: 		fn_battleground.sqf
	Author: 		Merrick
	Description: 	Ждем, создаем вертушку, ломаем ее спавним экшн на ящике
*/
private ["_minPlayers","_sleepStart","_dpARR","_dp","_markerName","_cord","_markerCord","_dpName","_veh","_grp","_wp","_crashpos","_crashrot","_crew","_vehClass","_cheli","_smokeeff","_boxClass","_crate","_bombTimer","_bomb"];
BATTLE_DEBUG = false;

//creates a drop/crash
_minPlayers = getNumber(missionConfigFile >> "LifeCfgWarZones" >> "minPlayersOnServer");
_sleepStart = getNumber(missionConfigFile >> "LifeCfgWarZones" >> "sleepOnServerStart");
if !(BATTLE_DEBUG) then {sleep (_sleepStart * 60);};
waituntil {count playableunits > _minPlayers || BATTLE_DEBUG};
//Get data
_dpARR = [];
{
	_dpARR pushback (configName _x);
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgWarZones" >> "SpawnZones" >> "Altis"));
_dp = _dpARR select 0;

_markerName = getText(missionConfigFile >> "LifeCfgWarZones" >> "SpawnZones" >> "Altis" >> _dp >> "markername");
_cord = selectRandom getArray(missionConfigFile >> "LifeCfgWarZones" >> "SpawnZones" >> "Altis" >> _dp >> "spawnPoints");
_markerCord = getMarkerPos _markerName;
_dpName = toUpper _dp;
//Spawn heli
_veh = [[0,0,0], 180,"I_Heli_light_03_unarmed_F",EAST] call BIS_fnc_spawnVehicle;
_grp = group (_veh select 0);

veh = _veh;

{
	_x disableAI "AUTOTARGET";
	_x disableAI "TARGET";
	_x disableAI "SUPPRESSION";
	removeBackpackGlobal _x;
	removeAllWeapons _x;
} forEach units (_veh select 2);


//Set waypoints
BATTLE_VEHCRASH = false;

_wp = _grp addWaypoint [_cord, 0];
_wp setWaypointType "move";
_wp setWaypointBehaviour "CARELESS";
(_veh select 0) flyInHeight 220;
[_grp,1]setWaypointSpeed "FULL";
_wp setWaypointStatements ['true', "BATTLE_VEHCRASH = true;"];


//Wait for crash & crash
waituntil {BATTLE_VEHCRASH  || (getDammage (_veh select 0) > 0.2)};
(_veh select 0) setDamage 1;

waituntil {(getPos (_veh select 0) select 2) < 1};

_crashpos = getPosATL (veh select 0);
_crashrot = getDir (_veh select 0);
sleep 2;
deleteVehicle (_veh select 0);

["BattleGround",_dpName,(_markerCord select 0),(_markerCord select 1),"BattleGround"] spawn TON_fnc_addWarPoint;//не изменять!

_crew = nearestObjects [_crashpos, ["Man"], 20];
{
if (not alive _x) then {deleteVehicle _x};
} forEach _crew;

////////
_vehClass = getText(missionConfigFile >> "LifeCfgWarZones" >> "vehClass");
////////

_cheli = createVehicle [_vehClass,_crashpos,[], 0, "can_collide"];
_cheli setDir _crashrot;
_cheli setPos [position _cheli select 0,position _cheli select 1, 0.1];
_cheli setVectorUp surfaceNormal position _cheli;
_smokeeff = createVehicle ["test_EmptyObjectForSmoke",_crashpos,[], 0, "can_collide"];
_smokeeff attachTo [_cheli, [0.5, -2, 1] ];

if (BATTLE_DEBUG) then {
	diag_log "###BattlerGround with Helicrash by Merrick###";
	diag_log format ["###Helicrash position: %1",_crashpos];
	diag_log "###End###";
};

[_cheli,"opened",false] call CBA_fnc_setVarNet;
waituntil {_cheli getVariable ["opened",true]};
["vehOpened"] remoteExecCall ["UnionClient_warzones_message",-2];

////////
_boxClass = getText(missionConfigFile >> "LifeCfgWarZones" >> "boxClass");
////////

_crate = createVehicle [_boxClass,position _cheli,[], 5, "FORM"];
crate = _crate;
publicVariable  "crate";
[_crate,"chargePlaced",false] call CBA_fnc_setVarNet;
waituntil {_crate getVariable ["chargePlaced",true]};

////////
_bombTimer = getNumber(missionConfigFile >> "LifeCfgWarZones" >> "bombTimer");
["boxChargePlaced",_bombTimer] remoteExecCall ["UnionClient_warzones_message",-2];
////////

if !(BATTLE_DEBUG) then {sleep (_bombTimer * 60);};
["boxOpened"] remoteExecCall ["UnionClient_warzones_message",-2];
sleep 5;
_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL _crate select 0, getPosATL _crate select 1, (getPosATL _crate select 2)-20];
[
_crate,
"Получить награду",
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
"_this distance _target < 3",
"_caller distance _target < 3",
{},
{},
{[crate] spawn UnionClient_warzones_openBox;},
{},
[],
5,
0,
true,
false
] remoteExec ["BIS_fnc_holdActionAdd",-2,_crate];
[_crate,"priceTaked",false] call CBA_fnc_setVarNet;
waituntil {_crate getVariable ["priceTaked",true]};
deleteVehicle _cheli;
deleteVehicle _smokeeff;
deleteVehicle _crate;
["BattleGround",_dpName,1234,"BattleGround"] spawn TON_fnc_removeWarPoint;//не изменять!