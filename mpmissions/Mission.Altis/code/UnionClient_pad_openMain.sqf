/*

	Filename: 	UnionClient_pad_openMain.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if (LSNOTALIVE(player)) exitWith {}; //Prevent them from opening this for exploits while dead.

createDialog "UnionDialogPadMain";
waitUntil {!isNull (findDisplay 2000)};
ctrlSetText [2001, M_CONFIG(getText,"LifeCfgPadSkins",life_myPadSkinID,"image")];
_display = findDisplay 2000;
if (life_PadIsPowerOn) then
{
	_control = _display displayCtrl 42001;
	_control ctrlSetFade 1;
	_control ctrlCommit 0;
	_control = _display displayCtrl 42002;
	_control ctrlSetFade 1;
	_control ctrlCommit 0;
}
else
{
_control = _display displayCtrl 42001;
_control ctrlSetFade 1;
_control ctrlCommit 0;
};

private _buttons = [
	[2010,2011],
	[2012,2013],
	[2014,2015],
	[2016,2017],
	[2018,2019],
	[2020,2021],

	[2022,2023],
	[2024,2025],
	[2026,2027],
	[2028,2029],
	[2030,2031],
	[2032,2033],

	[2034,2035],
	[2036,2037],
	[2038,2039],
	[2040,2041],
	[2042,2043],
	[2044,2045]
];


{
	ctrlShow [_x select 0,false];
	ctrlShow [_x select 1,false];
} forEach _buttons;

if (life_PadIsPowerOn) then {
private ["_imageID","_buttonID"];
private _index = 0;
{
	if ([getText(_x >> "conditions")] call UnionClient_system_conditionsCheck) then {
		_imageID = CONTROL(2000,((_buttons select _index) select 0));
		_buttonID = CONTROL(2000,((_buttons select _index) select 1));

		_imageID ctrlSetText getText(_x >> "image");
		_buttonID ctrlSetTooltip localize (getText(_x >> "tooltip"));
		_buttonID buttonSetAction getText(_x >> "action");

		_imageID ctrlShow true;
		_buttonID ctrlShow true;

		ADD(_index,1);
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgPadIcons"));
};