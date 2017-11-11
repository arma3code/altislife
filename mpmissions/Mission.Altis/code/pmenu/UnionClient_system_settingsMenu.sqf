/*

	Filename: 	UnionClient_system_settingsMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;

if(isNull (findDisplay 2900)) then {
	if !(createDialog "UnionDialogSettings") exitWith {hint "Something went wrong, the menu won't open?"};
};

private _display = findDisplay 2900;
ctrlSetText[2903, M_CONFIG(getText,"LifeCfgPadSkins",life_myPadSkinID,"image")];

ctrlSetText[2902, format["%1", life_viewDistanceFoot]];
ctrlSetText[2912, format["%1", life_viewDistanceCar]];
ctrlSetText[2922, format["%1", life_viewDistanceAir]];

//Setup Sliders range
{ slidersetRange [_x,100,12000];} foreach [2901,2911,2921];
//Setup Sliders speed
{ (_display displayCtrl _x) sliderSetSpeed [100,100,100]; } foreach [2901,2911,2921];
//Setup Sliders position
{
	sliderSetPosition[_x select 0, _x select 1];
} foreach [[2901,life_viewDistanceFoot],[2911,life_viewDistanceCar],[2921,life_viewDistanceAir]];

private _tags = _display displayCtrl 2970;
private _grass = _display displayCtrl 2972;
private _fps = _display displayCtrl 2975;
private _hud = _display displayCtrl 2979;

private _colorSelect = _display displayCtrl 2973;
private _passSelect = _display displayCtrl 2977;
private _titleSelect = _display displayCtrl 2978;

if (life_tagson) then {
	_tags ctrlSetTextColor [0,1,0,1];
	_tags ctrlSetText "ON";
	_tags buttonSetAction "[LIFE_ID_PlayerTags,""onEachFrame""] call BIS_fnc_removeStackedEventHandler; life_tagson = false; [] call UnionClient_system_settingsMenu;";
} else {
	_tags ctrlSetTextColor [1,0,0,1];
	_tags ctrlSetText "OFF";
	_tags buttonSetAction "LIFE_ID_PlayerTags = [""LIFE_PlayerTags"",""onEachFrame"",""UnionClient_system_playerTags""] call BIS_fnc_addStackedEventHandler; life_tagson = true; [] call UnionClient_system_settingsMenu;";
};

if (EQUAL(life_grassIndex,25)) then {
	_grass ctrlSetTextColor [0,1,0,1];
	_grass ctrlSetText "ON";
	_grass buttonSetAction "life_grassIndex = 50; setterrainGrid life_grassIndex; [] call UnionClient_system_settingsMenu;";
} else {
	_grass ctrlSetTextColor [1,0,0,1];
	_grass ctrlSetText "OFF";
	_grass buttonSetAction "life_grassIndex = 25; setterrainGrid life_grassIndex; [] call UnionClient_system_settingsMenu;";
};

if (life_showFPS) then {
	_fps ctrlSetTextColor [0,1,0,1];
	_fps ctrlSetText "ON";
	_fps buttonSetAction "life_showFPS = false; [] call UnionClient_system_settingsMenu;";
} else {
	_fps ctrlSetTextColor [1,0,0,1];
	_fps ctrlSetText "OFF";
	_fps buttonSetAction "life_showFPS = true; [] call UnionClient_system_settingsMenu;";
};

if (life_showHUD) then {
	_hud ctrlSetTextColor [0,1,0,1];
	_hud ctrlSetText "ON";
	_hud buttonSetAction "life_showHUD = false; ['playerHUD'] call UnionClient_gui_DestroyRscLayer;terminate LIFE_HANDLE_HUD; [] call UnionClient_system_settingsMenu;";
} else {
	_hud ctrlSetTextColor [1,0,0,1];
	_hud ctrlSetText "OFF";
	_hud buttonSetAction "life_showHUD = true; LIFE_HANDLE_HUD = [] spawn UnionClient_hud_init; [] call UnionClient_system_settingsMenu;";
};

//выбор скинов для планшета
[] call UnionClient_system_padSkinConfig;
lbClear _colorSelect;
{
	if ([getText(_x >> "conditions")] call UnionClient_system_conditionsCheck) then {
		_colorSelect lbAdd format["%1",getText(_x >> "title")];
		_colorSelect lbSetData [(lbSize _colorSelect)-1,configName _x];

		if (EQUAL(life_myPadSkinID,configName _x)) then {
			_colorSelect lbSetCurSel ((lbSize _colorSelect)-1);
		};
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgPadSkins"));

//выбор паспортов
[] call UnionClient_system_passportConfig;
lbClear _passSelect;
private _side = [playerSide] call UnionClient_system_convertSide;

{
	if ([getText(_x >> "conditions")] call UnionClient_system_conditionsCheck) then {
		_passSelect lbAdd format["%1",getText(_x >> "title")];
		_passSelect lbSetData [(lbSize _passSelect)-1,configName _x];

		if (EQUAL(life_myPassportID,configName _x)) then {
			_passSelect lbSetCurSel ((lbSize _passSelect)-1);
		};
	};
} forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "LifeCfgPassports"));

//выбор приписки
[] call UnionClient_system_titleConfig;
lbClear _titleSelect;
{
	if ([getText(_x >> "conditions")] call UnionClient_system_conditionsCheck) then {
		_titleSelect lbAdd format["%1",getText(_x >> "title")];
		_titleSelect lbSetData [(lbSize _titleSelect)-1,configName _x];

		if (EQUAL(life_myTitleID,configName _x)) then {
			_titleSelect lbSetCurSel ((lbSize _titleSelect)-1);
		};
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgTitles"));