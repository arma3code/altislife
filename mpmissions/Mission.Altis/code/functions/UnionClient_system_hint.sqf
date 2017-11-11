/*

	Filename: 	UnionClient_system_hint.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\..\script_macros.hpp"
params [
	["_message","",[""]],
	["_type","info",[""]]
];

private _img = switch (_type) do {
	case "info": {"info.paa"};
	case "warning": {"warning.paa"};
	case "news": {"news.paa"};
	case "done": {"done.paa"};
	case "error": {"error.paa"};
	case "money": {"money.paa"};
	case "police": {"police.paa"};
};

private _send = "";

if !(EQUAL(_img,"")) then {
	_send = _send + format["<br/><img size='7' shadow='0' image='\union_pack\icons\messages\%1'/><br/><br/>",_img];
};

_send = _send + format["<t align='left' size='1.2' shadow='2'>%1</t>",_message];

hint parseText _send;
playSound "defaultNotification";