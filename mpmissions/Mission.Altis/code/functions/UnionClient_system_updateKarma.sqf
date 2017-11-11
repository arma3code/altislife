/*

	Filename: 	UnionClient_system_updateKarma.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
private ["_modifier","_amount"];
_modifier = [_this,0,"",[""]] call BIS_fnc_param;
_amount = [_this,1,0,[0]] call BIS_fnc_param;

switch (_modifier) do {
	case "up": {life_karma = life_karma + _amount};
	case "down": {life_karma = life_karma - _amount};
};

if (life_karma < 0) then {life_karma = 0};
player setVariable ["karma",life_karma,true];
[18] call UnionClient_session_updatePartial;