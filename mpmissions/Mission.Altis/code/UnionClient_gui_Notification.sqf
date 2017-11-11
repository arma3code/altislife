/*

	Filename: 	UnionClient_gui_Notification.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _messageText = param [0,"",[""]];
if (EQUAL(_messageText,"")) exitWith {};
disableSerialization;
private _ui = GVAR_UINS ["ExtremoNotification",displayNull];
if (isNull _ui) then {
	["ExtremoNotification","PLAIN",1,false] call UnionClient_gui_CreateRscLayer;
	_ui = GVAR_UINS ["ExtremoNotification",displayNull];
};

private _messageID = switch (true) do {
	case (!life_message1): {1};
	case (!life_message2): {2};
	case (!life_message3): {3};
	case (!life_message4): {4};
	case (!life_message5): {5};
	default {0}; 
};

if (EQUAL(_messageID,0)) exitWith {
	uiSleep 5;
	[_messageText] spawn UnionClient_gui_Notification;
};

private _var = format["life_message%1",_messageID];
SVAR_MNS [_var,true];

private _message = _ui displayCtrl (24500 + _messageID);

private _xOut = 0.990934 * safezoneW + safezoneX;
private _xIn = 0.744123 * safezoneW + safezoneX;
private _messagePositionY = ((ctrlPosition _message) select 1);

private _rollTime = 0.5;

_message ctrlSetStructuredText parseText format ["<t size='1' align='right'>%1</t>",_messageText];
_message ctrlSetPosition [_xIn,_messagePositionY];
_message ctrlCommit _rollTime;
uiSleep 3;
_message ctrlSetPosition [_xOut,_messagePositionY];
_message ctrlCommit _rollTime;
uiSleep _rollTime;
SVAR_MNS [_var,false];