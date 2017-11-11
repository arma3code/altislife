/*

	Filename: 	UnionClient_system_setPlayerLicense.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params [
	["_admin",ObjNull,[ObjNull]],
	["_mode","",[""]]
];

if (!isClass (missionConfigFile >> "LifeCfgLicenses" >> _mode)) exitWith {hint "Не удалось найти лицензию"}; //Bad entry?

private _side = [playerSide] call UnionClient_system_convertSide;
private _sideLicense = M_CONFIG(getText,"LifeCfgLicenses",_mode,"side");
if !(EQUAL(_side,_sideLicense)) exitWith {hint "Фракция не совпадает"};

private _gangLicense = M_CONFIG(getNumber,"LifeCfgLicenses",_mode,"gang");
if (EQUAL(_gangLicense,0)) exitWith {hint "Похоже, что это не лицензия группировки"};

if !(LICENSE_VALUE(_mode,_sideLicense)) then {
	SVAR_MNS [LICENSE_VARNAME(_mode,_sideLicense),true];	
	hint format["%1 включил вам лицензию ""%1""",GVAR_RNAME(_admin),localize M_CONFIG(getText,"LifeCfgLicenses",_mode,"displayName")];
	[1,format["Вы успешно прописали ""%1"" для %2",localize M_CONFIG(getText,"LifeCfgLicenses",_mode,"displayName"),GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",_admin];
} else {
	SVAR_MNS [LICENSE_VARNAME(_mode,_sideLicense),false];	
	hint format["%1 отключил вам лицензию ""%1""",GVAR_RNAME(_admin),localize M_CONFIG(getText,"LifeCfgLicenses",_mode,"displayName")];
	[1,format["Вы успешно отключили ""%1"" для %2",localize M_CONFIG(getText,"LifeCfgLicenses",_mode,"displayName"),GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",_admin];
};

[] call UnionClient_system_setTag;
[2] call UnionClient_session_updatePartial;