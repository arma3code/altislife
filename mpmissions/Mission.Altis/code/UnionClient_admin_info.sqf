/*
	
	Filename: 	UnionClient_admin_info.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
params ["_atmMoney","_cashMoney","_donatorLvl","_licenses","_unit"];
private _pvpText = if (_unit GVAR ["pvp",false]) then {"Да"} else {"Нет"};
private _playerLicenses = CONTROL(2900,2904);
private _playerInfo = CONTROL(2900,2903);

_playerInfo ctrlSetStructuredText parseText format["
Имя: %1<br/>
Банк: %2<br/>
Наличность: %3<br/>
Уровень доната: %4<br/>
PVP режим: %5<br/>
UID: %6<br/>
Отдача: %7<br/>",
GVAR_RNAME(_unit),[_atmMoney] call UnionClient_system_numberText,[_cashMoney] call UnionClient_system_numberText,_donatorLvl,_pvpText,getPlayerUID _unit,unitRecoilCoefficient _unit];

lbClear _playerLicenses;
{
	_playerLicenses lbAdd (localize (M_CONFIG(getText,"LifeCfgLicenses",_x,"displayName")));
} foreach _licenses;