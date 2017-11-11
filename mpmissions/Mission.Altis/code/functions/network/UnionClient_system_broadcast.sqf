/*

	Filename: 	UnionClient_system_broadcast.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\..\script_macros.hpp"
params [
	["_type",0,[[],0]],
	["_message","",[""]],
	["_localize",false,[false]],
	["_arr",[],[[]]]
];

if (EQUAL(_message,"")) exitwith {};

private _msg = if (_localize) then {
	switch (count _arr) do {
		case 0: {localize _message};
		case 1: {format[localize _message,_arr select 0]};
		case 2: {format[localize _message,_arr select 0, _arr select 1]};
		case 3: {format[localize _message,_arr select 0, _arr select 1, _arr select 2]};
		case 4: {format[localize _message,_arr select 0, _arr select 1, _arr select 2, _arr select 3]};
		case 5: {format[localize _message,_arr select 0, _arr select 1, _arr select 2, _arr select 3, _arr select 4]};
	};
} else {_message};

if (_type isEqualType []) then {
	{
		switch (_x) do {
			case 0: {systemChat _msg};
			case 1: {hint format["%1", _msg]};
			case 2: {titleText[format["%1",_msg],"PLAIN"]};
		};
	} forEach _type;
} else {
	switch (_type) do {
		case 0: {systemChat _msg};
		case 1: {hint format["%1", _msg]};
		case 2: {titleText[format["%1",_msg],"PLAIN"]};
	};
};