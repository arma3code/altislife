/*

	Filename: 	UnionClient_ltd_mainMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (EQUAL(life_ltdData,[])) exitWith {hint "У вас нет фирмы"};
disableSerialization;
createDialog "UnionDialogLtdMain";
waitUntil {!isNull (findDisplay 7300)};
ctrlSetText [7301, M_CONFIG(getText,"LifeCfgPadSkins",life_myPadSkinID,"image")];

private _status = CONTROL(7300,7302);

life_ltdData params ["_id", "_owner", "_name", "_bank", "_info", "_licenses"];

_status ctrlSetStructuredText parseText format ["<t color='%1'><t size='3'>%2</t><br/><br/><br/><t size='1'>Баланс: $%3<br/><br/><br/>В разработке...</t>
</t>",GVAR_PRNS ['GUI_V3_TXT_HTML','#000000'],_name,[_bank] call UnionClient_system_numberText];