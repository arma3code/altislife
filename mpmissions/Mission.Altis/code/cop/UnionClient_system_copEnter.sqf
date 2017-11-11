/*

	Filename: 	UnionClient_system_copEnter.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _position = _this select 3;

switch (_position) do {
	case "driver": {
		cursorObject lock false;
		player action ["getInDriver", cursorObject];
		cursorObject lock true;
	};
	case "passenger": {
		cursorObject lock false;
		player action ["getInCargo", cursorObject];
		cursorObject lock true;
	};
	case "gunner": {
		cursorObject lock false;
		player action ["getIngunner", cursorObject];
		cursorObject lock true;
	};
	case "exit": {
		private _veh = objectParent player;
		_veh lock false;
		player action ["getOut", _veh];
		_veh lock true;
	};
};