/*

	Filename: 	UnionClient_system_buyLicense.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (EQUAL((lbCurSel 55126),-1)) exitWith {hint localize "STR_Global_NoSelection"};
private _type = CONTROL_DATA(55126);

if (!isClass (missionConfigFile >> "LifeCfgLicenses" >> _type)) exitWith {closeDialog 0}; //Bad entry?

private _price = M_CONFIG(getNumber,"LifeCfgLicenses",_type,"price");
if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call UnionClient_system_discount};
if (CASH < _price) exitWith {hint format[localize "STR_NOTF_NE_1",[_price] call UnionClient_system_numberText,/*_license select 1*/"лицензии"];};

["cash","take",_price,"buyLicense"] call UnionClient_system_myCash;
hint format[localize "STR_NOTF_B_1",localize M_CONFIG(getText,"LifeCfgLicenses",_type,"displayName"),[_price] call UnionClient_system_numberText];

private _sideFlag = M_CONFIG(getText,"LifeCfgLicenses",_type,"side");
SVAR_MNS [LICENSE_VARNAME(_type,_sideFlag),true];

[2] call UnionClient_session_updatePartial;
[] spawn UnionClient_system_licenseShop;