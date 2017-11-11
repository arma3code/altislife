/*

	Filename: 	UnionClient_garage_SellVehicle.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 2802),-1)) exitWith {hint localize "STR_Global_NoSelection"};
private _data = CONTROL_DATA(2802);
_data = call compile format["%1",_data];
private _vehicle = _data select 0;
private _vid = CONTROL_VALUE(2802);

closeDialog 0;

if (life_action_inUse) exitWith {}; // prevent duping
if (isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if((time - life_action_delay) < 2) exitWith {hint "Слишком часто жмете на кнопку. Подождите";closeDialog 0;};

private _displayName = getText(configFile >> "CfgVehicles" >> (_vehicle) >> "displayName");

private _action = [
	format["Вы уверены, что хотите продать %1?",_displayName],
	"Внимание!",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	call UnionClient_actions_inUse;
	if((time - life_action_delay) < 5) exitWith {hint "Слишком часто жмете на кнопку.Подождите";closeDialog 0;};
	private _basePrice = _data select 6;
	if (EQUAL(_basePrice,0)) exitWith {hint "У техники нет стоимости покупки!"};
	private _price = round (_basePrice - (_basePrice * 0.3));

	hint "Отправлен запрос на продажу техники...";
	[[_vid,steamid,_price,life_garage_type,_vehicle,player,GVAR_RNAME(player),life_last_sold_vid],"vehicleSell"] call UnionClient_system_hcExec;
} else {
	hint "Продажа отменена";
};

life_action_delay = time;
closeDialog 0;