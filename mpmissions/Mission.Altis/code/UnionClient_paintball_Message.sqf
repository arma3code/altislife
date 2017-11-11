/*

	Filename: 	UnionClient_paintball_Message.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if !(player GVAR ["inPBfight",false]) exitWith {};
params [
	["_type","",[""]],
	["_name","",[""]]
];

if (EQUAL(_name,"") OR EQUAL(_type,"")) exitWith {};

switch (_type) do {
	case "in" : {
		[format["<t size='1' color='#ffffff'><t color='#2add00'>%1</t> вступил в бой!</t>",_name],0,0.2,3,0,0,1488] spawn BIS_fnc_dynamicText;
	};
	case "out" : {
		[format["<t size='1' color='#ffffff'><t color='#dd0000'>%1</t> покинул поле сражения!</t>",_name],0,0.2,3,0,0,1488] spawn BIS_fnc_dynamicText;
	}; 
	case "dead" : {
		[format["<t size='1' color='#ffffff'><t color='#fff600'>%1</t> был убит и выбыл из игры!</t>",_name],0,0.7,2,0,0,1488] spawn BIS_fnc_dynamicText;
	}; 
	default {};
};