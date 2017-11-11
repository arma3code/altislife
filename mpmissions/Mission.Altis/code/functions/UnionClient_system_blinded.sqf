/*
	
	Filename: 	UnionClient_system_blinded.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_unit","_strippedItems","_hg","_gg","_who"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_who = [_this,1,"",[""]] call BIS_fnc_param;

if (player GVAR ["isBlind",false]) exitWith {};

player say3D "blind";
player SVAR ["isBlind",true,true];

titleText ["Вам надели мешок на голову!","PLAIN"];
systemChat format ["Игрок с ID %1 надел вам мешок на голову. Запомните этот ID на случай нарушений правил сервера",_who];	

titleCut ["", "BLACK FADED", 9999999];

_hg = PHEADGEAR;
_gg = PGOOGLES;
_strippedItems = [];
removeHeadgear player;
removeGoggles player;
player addHeadgear "mgsr_headbag";

_playerItems = items player;
{
	switch (_x) do {
		case "ItemMap": {
			player unassignItem _x;
			player removeItem _x;
			_strippedItems set [(count _strippedItems), _x];
		};
		case "ItemCompass": {
			player unassignItem _x;
			player removeItem _x;
			_strippedItems set [(count _strippedItems), _x];
		}; 
		case "ItemGPS": {
			player unassignItem _x;
			player removeItem _x;
			_strippedItems set [(count _strippedItems), _x];
		}; 
	};
} forEach _playerItems;

while {player GVAR ["isBlind",false]} do {	
	if (LSDEAD(player) OR !(GVAR_RESTRAINED(player))) exitWith {};
	uiSleep 1;
};

[player,"isBlind"] call UnionClient_system_clearGlobalVar;

{
	player addItem _x;
	player assignItem _x;
} forEach (_strippedItems);

removeHeadgear player;
player addHeadgear _hg;
player addGoggles _gg;

titleCut ["", "BLACK IN", 8];
player say3D "blind";