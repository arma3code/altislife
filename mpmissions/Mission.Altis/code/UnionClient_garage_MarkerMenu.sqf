/*

	Filename: 	UnionClient_garage_MarkerMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _spawnPos = [(_this select 3),0,"",[""]] call BIS_fnc_param;
private _type = [(_this select 3),1,"",[""]] call BIS_fnc_param;

if ((time - life_garage_timer) < 10) exitWith {hint "Гараж закрыт на обед. Зайдите еще раз через 10 секунд."};

life_garage_timer = time;
life_garage_sp = _spawnPos;
life_garage_sp_name = _spawnPos;
life_garage_type = _type;
life_garage_isHouse = false;

[[steamid,playerSide,_type,player],"getVehicles","TON",false] call UnionClient_system_hcExec;

createDialog "UnionDialogImpound";
disableSerialization;
waitUntil {!isNull (findDisplay 2800)};
ctrlSetText[2802,(localize "STR_ANOTF_QueryGarage")];
ctrlShow[2803,false];
ctrlShow[2812,false];
ctrlShow[2813,false];
ctrlShow[2814,false];