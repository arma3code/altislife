/*

	Filename: 	UnionClient_hud_init.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
private _ui = GVAR_UINS ["playerHUD",displayNull];
if (isNull _ui) then {
	["playerHUD","PLAIN",1,false] call UnionClient_gui_CreateRscLayer;
	_ui = GVAR_UINS ["playerHUD",displayNull];
};

[] call UnionClient_hud_theme;

[] call UnionClient_hud_skinConfig;
[life_myThemeID] call UnionClient_hud_skinSet;

private _health = _ui displayCtrl 23500;
private _fatig = _ui displayCtrl 23501;
private _food_pb = _ui displayCtrl 23502;
private _food_pb_value = _ui displayCtrl 23507;
private _water_pb = _ui displayCtrl 23503;
private _water_pb_value = _ui displayCtrl 23508;
private _volume_pb = _ui displayCtrl 23504;
private _server = _ui displayCtrl 23505;
private _fps_info = _ui displayCtrl 23506;
private _speak_volume = 0;

private _icon_health = _ui displayCtrl 23509;
private _icon_fatig = _ui displayCtrl 23510;
private _icon_food = _ui displayCtrl 23511;
private _icon_drink = _ui displayCtrl 23512;
private _icon_micro = _ui displayCtrl 23513;

{
	(_ui displayCtrl _x) ctrlSetText life_gui_theme_r;
} forEach [23515,23516,23517,23518,23519];

_icon_health ctrlSetText format ["\union_gui\data\%1\gui_health.paa",life_gui_folder];
_icon_fatig ctrlSetText format ["\union_gui\data\%1\gui_run.paa",life_gui_folder];
_icon_food ctrlSetText format ["\union_gui\data\%1\gui_eat.paa",life_gui_folder];
_icon_drink ctrlSetText format ["\union_gui\data\%1\gui_drink.paa",life_gui_folder];
_icon_micro ctrlSetText format ["\union_gui\data\%1\gui_micro.paa",life_gui_folder];

_health ctrlSetTextColor life_gui_theme_color;
_fatig ctrlSetTextColor life_gui_theme_color;
_food_pb ctrlSetTextColor life_gui_theme_color;
_food_pb_value ctrlSetTextColor life_gui_theme_color;
_water_pb ctrlSetTextColor life_gui_theme_color;
_water_pb_value ctrlSetTextColor life_gui_theme_color;
_volume_pb ctrlSetTextColor life_gui_theme_color;
_server ctrlSetTextColor life_gui_theme_color;
_fps_info ctrlSetTextColor life_gui_theme_color;



while {true} do {
	if (!(EQUAL(_speak_volume,TF_speak_volume_meters))) then {
		_speak_volume = TF_speak_volume_meters;
		switch (TF_speak_volume_meters) do {
			case 5: {
				_volume_pb progressSetPosition 0.25;
			};
			case 20: {
				_volume_pb progressSetPosition 0.5;
			};
			case 60: {
				_volume_pb progressSetPosition 1;
			};
		};
	};
	_server ctrlSetText format ["%1",server_timeText];
	_health ctrlSetText format ["%1%2",round((1 - (damage player)) * 100),"%"];
	_fatig ctrlSetText format ["%1%2",round((1 - (getFatigue player)) * 100),"%"];

	if (life_showFPS) then {
		_fps_info ctrlSetStructuredText parseText format ["<t size='0.85' align='center'>%1 FPS</t>", round diag_fps];
	} else {
		_fps_info ctrlSetStructuredText parseText "";
	};

	_food_pb progressSetPosition (life_hunger/100);
	_food_pb_value ctrlSetText format["%1%2",life_hunger,"%"];
	_water_pb progressSetPosition (life_thirst/100);
	_water_pb_value ctrlSetText format["%1%2",life_thirst,"%"];

	uiSleep 1;
};