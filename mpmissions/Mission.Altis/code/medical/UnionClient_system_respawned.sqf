/*

	Filename: 	UnionClient_system_respawned.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
player SVAR ["tf_unable_to_use_radio",false];
["all"] call UnionClient_system_removeBuff;

if (!isNull life_corpse) then {
	private _containers = nearestObjects [life_corpse,["WeaponHolderSimulated","Box_Wps_F"],5];
	{deleteVehicle _x} foreach _containers;

	if ((EQUAL(playerSide,west) && (west countSide playableUnits) > LIFE_SETTINGS(getNumber,"life_cop_min")) OR (playerSide in [civilian,independent])) then {
		if (life_is_arrested) exitWith {};
		if ([life_corpse,"players_spawn_zone"] call CBA_fnc_getDistance < 700) exitWith {};

		private _markerID = format ["%1_%2",steamid,round(random 9999)];
		life_death_markers pushBack [_markerID,getPos life_corpse];
	};

	deleteVehicle life_corpse;
};

2 fadeSound 1;
cutText ["", "BLACK IN", 1];

if (BANK > 10000 && playerSide in [civilian,independent]) then {
	private _newlifep = switch (playerSide) do {
		case civilian: {5};
		case independent: {4};
	};

	private _price = (BANK * _newlifep) / 100;
	if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call UnionClient_system_discount};

	["atm","take",_price] call UnionClient_system_myCash;
	hint parseText format[" <t size='2.2'><t color='#1dae0e'>Новая жизнь</t></t><br /><br /> Ваше возрождение обошлось вам в $%1 (%2%3 от вашего банковского счета). Цените свою жизнь!", [_price] call UnionClient_system_numberText, _newlifep,"%"];
};

[] call UnionClient_system_updateViewDistance;
[] call UnionClient_session_updateRequest;

if (isNull LIFE_HANDLE_HUD) then {LIFE_HANDLE_HUD = [] spawn UnionClient_hud_init};
if (isNull LIFE_HANDLE_EFFECTS) then {LIFE_HANDLE_EFFECTS = [] spawn UnionClient_effects_Init};

player enableStamina true;
player switchMove "amovpercmstpsnonwnondnon";

ADD(life_deaths,1);
if (life_deaths >= life_deaths_max) then {
	[true] spawn UnionClient_system_logout;
} else {
	[] spawn {
		waitUntil {isnull (findDisplay 38500)};
		[parseText format ["<t align='center' size='1.4'><t font='PuristaBold' size='3' color='#ff0000'>Внимание!<br/><br/></t>Вы умерли <t color='#ffd800'>%1</t> раз(а) из <t color='#ffd800'>%2</t> допустимых.<br/>После достижения лимита вы не сможете зайти до следующей бури.<br/><br/> <t color='#9cff00'>Цените свою жизнь!</t></t>", life_deaths, life_deaths_max],[0,0,1,1], nil, 10, 0.5, 0] spawn BIS_fnc_textTiles;
	};
};

//Bad boy
if (life_is_arrested) exitWith {
	life_is_arrested = false;
	life_death_markers = [];
	life_death_endtime = 0;
	[player,"isArrested"] call UnionClient_system_clearGlobalVar;
	[player,true,life_jail_time] call UnionClient_system_jail;
	[] call UnionClient_session_updateRequest;
	[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;
};

[20] spawn UnionClient_system_DeathTimer;

[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;