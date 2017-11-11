/*

	Filename: 	UnionClient_system_initHouseMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _house = param [0,ObjNull,[ObjNull]];
if (isNull _house OR ISPSIDE(east) OR dialog) exitWith {}; //Bad target

if ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _house OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _house) exitWith {
	[_house] spawn UnionClient_system_houseBankMenu;
};

if (player distance _house > 12) exitWith {};
if (!isClass (missionConfigFile >> "LifeCfgHousing" >> worldName >> typeOf _house)) exitWith {};

if (!isNil {_house GVAR "house_owner"} OR (!isNil {_house GVAR "house_forSell"})) then {
	[_house] spawn UnionClient_system_houseMenu;
} else {
	systemChat "У дома не прописан владелец. Отправка запроса в базу данных...";

	[[_house,player,playerSide],"reqHouseInfo","TON",false] call UnionClient_system_hcExec;
};