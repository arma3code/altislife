/*

	Filename: 	UnionClient_garage_getVehicle.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 2802),-1)) exitWith {hint localize "STR_Global_NoSelection"};
private _dataArr = CONTROL_DATA(2802);
private _dataArr = call compile format["%1",_dataArr];
private _vehicle = _dataArr select 0;
private _vid = CONTROL_VALUE(2802);

if (isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if (_vehicle in ["quiet_audi_r8_plus_spawn_couleur_blanche_ingame_f","Burnes_MK10_1"]) exitWith {hint "Данный вид техники объявлен опасным для жизни и их нельзя использовать на острове."};

if (_vehicle in (LIFE_SETTINGS(getArray,"life_vShop_trucks")) && {life_garage_isHouse}) exitWith {hint "Грузовой транспорт нельзя достать из частного гаража."};

private _classParents = [(configfile >> "CfgVehicles" >> _vehicle),true] call BIS_fnc_returnParents;
if (server_ddos_air && {"Air" in _classParents}) exitWith {hint "На острове наблюдаются магнитные бури. Воздушная техника временно недоступна"};

private _basePrice = _dataArr select 6;
private _retrievePrice = if (EQUAL(_basePrice,0)) then {500} else {round (_basePrice * 0.02)};
if (playerSide in [west,east]) then {_retrievePrice = 500};

if (BANK < _retrievePrice) exitWith {hint format[(localize "STR_Garage_CashError"),[_retrievePrice] call UnionClient_system_numberText];};

if (life_garage_sp isEqualType []) then {
	[[_vid,steamid,life_garage_sp select 0,player,_retrievePrice,life_garage_sp select 1,life_garage_sp_name],"spawnVehicle","TON",false] call UnionClient_system_hcExec;
} else {
	[[_vid,steamid,(getMarkerPos life_garage_sp),player,_retrievePrice,markerDir life_garage_sp,life_garage_sp_name],"spawnVehicle","TON",false] call UnionClient_system_hcExec;
};

closeDialog 0;
hint localize "STR_Garage_SpawningVeh";
["atm","take",_retrievePrice] call UnionClient_system_myCash;