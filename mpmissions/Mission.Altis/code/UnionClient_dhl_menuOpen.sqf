/*

	Filename: 	UnionClient_dhl_menuOpen.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if !(call UnionClient_dhl_check) exitWith {hint localize "STR_DHL_CheckError"};
if !(ISPSIDE(civilian)) exitWith {hint "Работа в DHL доступна только гражданам"};
private _spawnPointPos = getMarkerPos (LIFE_SETTINGS(getText,"life_dhl_office"));
if (life_dhl_car distance _spawnPointPos < 30) exitWith {hint "Покиньте точку выдачи!"};

disableSerialization;
createDialog "UnionDialogDhl";
waitUntil {!isNull (findDisplay 5800)};

private _dpPoints = LIFE_SETTINGSWORLD(getArray,worldName,"life_dp_points");

private _info = CONTROL(5800,5801);
private _startPoint = CONTROL(5800,5802);
private _finishPoint = CONTROL(5800,5803);

_info ctrlSetStructuredText parseText format ["<t size='0.9' color='%1'>Выберите начальную и конечную точку доставки заказа.<br/>Снизу вам отобразится сумма, которую вы получите за доставку посылки.</t>",GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];

lbClear _startPoint;
lbClear _finishPoint;

private "_dp";
{
	_dp = [_x,"_"," "] call UnionClient_kron_Replace;
	_startPoint lbAdd format ["%1",toUpper(_dp)];
	_startPoint lbSetData [(lbSize _startPoint)-1,_x];
	_finishPoint lbAdd format ["%1",toUpper(_dp)];
	_finishPoint lbSetData [(lbSize _finishPoint)-1,_x];
} forEach _dpPoints;

_startPoint lbSetCurSel 0;
_finishPoint lbSetCurSel 1;