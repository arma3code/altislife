/*

	Filename: 	UnionClient_hud_skinMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 6000)) then {
	createDialog "UnionDialogSkinSetup";
	waitUntil {!isNull (findDisplay 6000)};
};

private _strtxt_demo = CONTROL(6000,6001);
private _editbox_demo = CONTROL(6000,6002);
private _text_demo = CONTROL(6000,6003);
private _listBox_demo = CONTROL(6000,6004);
private _skin_select = CONTROL(6000,6005);
private _progressBar = CONTROL(6000,6006);

_strtxt_demo ctrlSetStructuredText parseText format["<t size='1' color='%1'>Lorem ipsum dolor sit amet, consectetur adipiscing elit</t>",GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];

lbClear _listBox_demo;
for "_i" from 0 to 5 do {
	_listBox_demo lbAdd "Lorem ipsum dolor";
};

lbClear _skin_select;
{
	_skin_select lbAdd format["%1",getText(_x >> "displayName")];
	_skin_select lbSetData [(lbSize _skin_select)-1,configName _x];
	if (EQUAL(life_myThemeID,configName _x)) then {
		_skin_select lbSetCurSel ((lbSize _skin_select)-1);
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgThemes"));

_progressBar progressSetPosition 0.5;