/*

	Filename: 	UnionClient_ltd_regMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if !(EQUAL(life_ltdData,[])) exitWith {hint "У вас уже есть фирма"};
disableSerialization;
createDialog "UnionDialogRegisterLTD";
waitUntil {!isNull (findDisplay 7100)};

private _info = CONTROL(7100,7101);

_info ctrlSetStructuredText parseText format ["<t size='0.85' color='%1'>При регистрации вы должны внести в уставной капитал сумму в размере <t color='#3b7200'>$100,000</t><br/><br/>После регистрации фирмы вам необходимо будет получить лицензию на ту или иную деятельность. Для этого обратитесь в приемную сената</t>",GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];