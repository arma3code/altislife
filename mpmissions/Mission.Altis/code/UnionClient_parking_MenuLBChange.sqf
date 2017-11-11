/*

	Filename: 	UnionClient_parking_MenuLBChange.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
params ["_control","_index"];

private _dataArr = _control lbData _index;
_dataArr = call compile format["%1",_dataArr];
_dataArr params ["_plate","_parking"];

ctrlShow[5703,true];
ctrlShow[5704,true];

(CONTROL(5700,5703)) ctrlSetStructuredText parseText format[
	"<t size='0.95' color='%4'>" + 
	"Номер:" + " %1<br/>" +	
	"Примечание:" + " %2<br/>" +
	"Сумма штрафа:" + " $%3" +
	"</t>",
	_plate,	
	_parking select 1,
	[_parking select 0] call UnionClient_system_numberText,
	GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']
];