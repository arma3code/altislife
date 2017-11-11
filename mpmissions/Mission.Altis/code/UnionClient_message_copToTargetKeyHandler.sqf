/*

	Filename: 	UnionClient_message_copToTargetKeyHandler.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params ["_ctrl","_code","_shift","_ctrlKey","_alt"];
if (isNull (GVAR_UINS ["ExtremoRscMouseTarget",displayNull])) exitWith {false};

private _handled = false;
private _targetKey = 20; //T
private _exitKey = 1; //Esc

switch (true) do {
	case (EQUAL(_code,_targetKey)): {
		_handled = true;
		["ExtremoRscMouseTarget"] call UnionClient_gui_DestroyRscLayer;
		life_uiTarget = cursorObject;		
		[] spawn UnionClient_message_copToTargetSendMenu;
		"CopToTargetKeyHandler - life_uiTarget is target and close ExtremoRscMouseTarget" call UnionClient_system_log;
	};
	case (EQUAL(_code,_exitKey)): {
		_handled = true;
		["ExtremoRscMouseTarget"] call UnionClient_gui_DestroyRscLayer;
		"CopToTargetKeyHandler - close ExtremoRscMouseTarget" call UnionClient_system_log;
	};
};

_handled