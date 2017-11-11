/*

	Filename: 	UnionClient_dmg_Agony.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params [
	["_unit",ObjNull,[ObjNull]],
	["_source",ObjNull,[ObjNull]],
	["_instigator",ObjNull,[ObjNull]],
	["_projectile","",[""]]
];

if (isNull _unit) exitWith {};
if (isNull _source && isNull _instigator && NOTINVEH(_unit)) exitWith {"DMG - Agony - Source and Instigator is NULL" call UnionClient_system_log};
if (LSINCAP(_unit)) exitWith {"DMG - Agony - Already Incap" call UnionClient_system_log};
if (LSDEAD(_unit)) exitWith {"DMG - Agony - Already Dead" call UnionClient_system_log};

format["DMG - Agony - IN - Source:  %1 - Instigator: %2",_source,_instigator] call UnionClient_system_log; //логируем кто отправил в агонию

life_agonyStartTime = time;
_unit setUnconscious true;
if (visibleMap) then {openMap false};
if (!isNull life_DraggedBody) then {[] call UnionClient_system_dropDeadBody};
if !(NOTINVEH(_unit)) then {
	private _vehicle = objectParent _unit;
	if (EQUAL((driver _vehicle),_unit)) then {_vehicle engineOn false};

	if (typeOf _vehicle in (LIFE_SETTINGS(getArray,"life_med_ejectFrom"))) then {
		_unit action ["Eject",_vehicle];
	};

	if (EQUAL((gunner _vehicle),_unit)) then {
		_unit action ["Eject",_vehicle];
	};

	[_unit] call UnionClient_system_setDeadState;
};

["all"] call UnionClient_system_removeBuff;
[] call UnionClient_hud_hide;
[] call UnionClient_effects_Terminate;

[_unit,"restrained"] call UnionClient_system_clearGlobalVar;

_unit SVAR ["tf_unable_to_use_radio",true];
[_unit,"medicStatus",-1] call CBA_fnc_setVarNet;
[_unit,"lifeState","INCAPACITATED"] call CBA_fnc_setVarNet;

disableSerialization;
if (!isNull (findDisplay 49)) then {(findDisplay 49) closeDisplay 0} else {closeDialog 0};

[_unit] spawn UnionClient_system_deathScreen;

_unit spawn {
	while {!isTouchingGround _this && (LSINCAP(_this)) && !(LSDEAD(_this))} do {
		_this setOxygenRemaining 1;
		uiSleep 1;
	};
};

if (EQUAL(_source,_unit) OR (isNull _source && isNull _instigator)) exitWith {[{_this call UnionClient_system_deathScreenSetKiller}, [], 1] call CBA_fnc_waitAndExecute;};

private _killer = switch (true) do {
	case (_instigator isKindOf "CAManBase" && isPlayer _instigator) : {_instigator};
	case (_source isKindOf "CAManBase" && isPlayer _source) : {_source};
	default {objNull};
};

if (isNull _killer) exitWith {"DMG - Agony - Killer is Null" call UnionClient_system_log}; //убит ботом

private _killerName = GVAR_RNAME(_killer);
if (EQUAL(_killerName,"")) then {_killerName = "БезИмени"};
private _killerPID = getPlayerUID _killer;

format["DMG - Agony - Killer: %1 - PID: %2",_killerName,_killerPID] call UnionClient_system_log;

switch (true) do {
	//убит копом
	case (EQUAL((side _killer),west) && {!(EQUAL(playerSide,west))} && {alive _killer}): {
		[[_unit,_killer,steamid,playerSide],"wantedKilledbyCop"] call UnionClient_system_hcExec;
		///[[_unit,_killer,true],"wantedBounty"] call UnionClient_system_hcExec;
	};

	//убит граджанским или повстанцем
	case ((side _killer) in [civilian,independent] && {alive _killer} && {!(EQUAL(steamid,_killerPID))}): {
		if ([_unit] call UnionClient_system_isSafeZone OR [_killer] call UnionClient_system_isSafeZone) then {
			//[_killerPID,_killerName,1440,"Save Zone killing","SafeZoneFire"] remoteExecCall ["TON_fnc_rcon",RSERV];
			[_killer,1] remoteExecCall ["UnionClient_system_punishment",_killer];
			//180 минут
		};
		if !(EQUAL(_killerPID,"")) then {
			private _type = switch (playerSide) do {
				case civilian: {"187C"};
				case independent: {"187I"};
				case west: {"187W"};
				case east: {"187E"};
			};
			[[_killerPID,_killerName,_type],"wantedAdd"] call UnionClient_system_hcExec;
		};
	};
};

if (!(EQUAL(_killerPID,"")) && !(EQUAL(steamid,_killerPID))) then {
	//titleText [format["Вас убил человек с PID %1. Сохраните данные, если считаете это нарушением",_killerPID],"PLAIN"];
	//hint format["Вас убил человек с PID %1. Сохраните данные, если считаете это нарушением",_killerPID];
	["AGONY",format["%1 (%2) killed %3 (%4) from distance %6 meters with (%7)",_killerName,_killerPID,GVAR_RNAME(_unit),steamid,round(_unit distance _killer),_projectile]] remoteExecCall ["TON_fnc_customLog",RSERV];
};

[{_this call UnionClient_system_deathScreenSetKiller}, [_killerPID], 1] call CBA_fnc_waitAndExecute;