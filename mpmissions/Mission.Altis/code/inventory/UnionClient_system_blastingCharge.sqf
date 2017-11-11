/*

	Filename: 	UnionClient_system_blastingCharge.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _vault = param [0,ObjNull,[ObjNull]];
if (isNull _vault) exitWith {}; //Bad object

private _minCops = LIFE_SETTINGS(getNumber,"life_cop_min") * 2;
if (west countSide playableUnits < _minCops) exitWith {hint format[localize "STR_Civ_NotEnoughCops",_minCops]};
if (typeOf _vault != LIFE_SETTINGS(getText,"life_vaultBoxClass")) exitWith {hint localize "STR_ISTR_Blast_VaultOnly"};
if (_vault GVAR ["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
if (_vault GVAR ["safe_open",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen"};

if !(["extItem_blastingcharge"] call UnionClient_system_removeItem) exitWith {hint "В инвентаре нет необходимых предметов"};

_vault SVAR ["chargeplaced",true,true];
[0,"STR_ISTR_Blast_Placed"] remoteExecCall ["UnionClient_system_broadcast",west];
hint localize "STR_ISTR_Blast_KeepOff";
private _handle = [] spawn UnionClient_system_demoChargeTimer;
[] remoteExec ["UnionClient_system_demoChargeTimer",west];

waitUntil {scriptDone _handle};
uiSleep 0.9;
if !(fed_bank GVAR ["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_Disarmed"};

private _bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
[fed_bank,"chargeplaced"] call UnionClient_system_clearGlobalVar;
fed_bank SVAR ["safe_open",true,true];

hint localize "STR_ISTR_Blast_Opened";