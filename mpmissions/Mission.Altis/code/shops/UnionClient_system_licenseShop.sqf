/*
	
	Filename: 	UnionClient_system_licenseShop.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 5546)) then {
	createDialog "UnionDialogLicenseShop";
	waitUntil {!isNull (findDisplay 5546)};
};

private _listbox = CONTROL(5546,55126);
private _mylic = CONTROL(5546,55131);
lbClear _listbox;
lbClear _mylic;

private _flag = [playerSide] call UnionClient_system_convertSide;
ctrlSetText [601,format["Наличность: $%1       ",[CASH] call UnionClient_system_numberText]];

private "_price";
{
	if !(LICENSE_VALUE(configName _x,_flag)) then {
		_price = getNumber(_x >> "price");
		if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call UnionClient_system_discount};
		_listbox lbAdd format["%1 ($%2)",localize (getText(_x >> "displayName")),[_price] call UnionClient_system_numberText];
		_listbox lbSetData [(lbSize _listbox) - 1,configName _x];
	} else {
		_mylic lbAdd format["%1",localize (getText(_x >> "displayName"))];
		_mylic lbSetData [(lbSize _mylic) - 1,configName _x];
	};
} foreach (format ["(getText(_x >> 'side') isEqualTo '%1') && (getNumber(_x >> 'buyable') isEqualTo 1)",_flag] configClasses (missionConfigFile >> "LifeCfgLicenses"));