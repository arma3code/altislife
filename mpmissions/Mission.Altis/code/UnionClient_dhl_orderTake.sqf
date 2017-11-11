/*

	Filename: 	UnionClient_dhl_orderTake.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _startPoint = CONTROL_DATA(5802);
private _finishPoint = CONTROL_DATA(5803);

if (EQUAL(_startPoint,"") OR EQUAL(_finishPoint,"")) exitWith {};
if (EQUAL(_startPoint,_finishPoint)) exitWith {};
if (life_dhl_orderInProgress) exitWith {};

_startPoint = call compile format["%1",_startPoint];
_finishPoint = call compile format["%1",_finishPoint];
if (isNil "_startPoint" OR isNil "_finishPoint") exitWith {};

closeDialog 0;

life_dhl_startPoint = _startPoint;
life_dhl_finishPoint = _finishPoint;

format["DHL - Order Take from %1 to %2",_startPoint,_finishPoint] call UnionClient_system_log;

AID_TFMB = life_dhl_startPoint addAction ["<img image='\union_dhl\data\dhl_logo.paa' /> Получить посылку",UnionClient_dhl_mailBoxGive,nil,0,true,true,"",' life_dhl_orderInProgress && isNull life_dhl_box ', 5];

private _dpStart = [format["%1",life_dhl_startPoint],"_"," "] call UnionClient_kron_Replace;
private _dpEnd = [format["%1",life_dhl_finishPoint],"_"," "] call UnionClient_kron_Replace;
private _price = round((life_dhl_startPoint distance2D life_dhl_finishPoint) * LIFE_SETTINGS(getNumber,"life_dhl_price"));

"DHL - Order Tasks 1 add..." call UnionClient_system_log;

[format["DHL_TS1_%1",steamid],player,[format["Заберите посылку из %1, погрузите ее в фургон и отправляйтесь в %2",toUpper(_dpStart),toUpper(_dpEnd)],format["Заберите посылку в %1",toUpper(_dpStart)],""],life_dhl_startPoint,true,nil,true,false,"map"] call BIS_fnc_setTask;

life_dhl_orderInProgress = true;