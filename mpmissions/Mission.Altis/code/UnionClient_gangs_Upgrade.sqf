/*

	Filename: 	UnionClient_gangs_Upgrade.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _maxMembers = grpPlayer GVAR ["gang_maxMembers",5];
private _gangLicense = grpPlayer GVAR ["gang_license","-1"];

private _slotLimit = if (EQUAL(_gangLicense,"-1")) then {
	LIFE_SETTINGS(getNumber,"life_gangSlotLimit")
} else {
	LIFE_SETTINGS(getNumber,"life_gangSlotLimitPrem")
};

if (_maxMembers >= _slotLimit) exitWith {hint "Вы достигли максимального количества слотов в группировке"};
private _slotUpgrade = _maxMembers + 5;
private _upgradePrice = round(_slotUpgrade * (LIFE_SETTINGS(getNumber,"life_gangUpgradeBase")) / (LIFE_SETTINGS(getNumber,"life_gangUpgradeMultipler")));

private _action = [
	format[(localize "STR_GNOTF_MaxMemberMSG") + "<br/><br/>" + (localize "STR_GNOTF_CurrentMax") + "<br/>" + (localize "STR_GNOTF_UpgradeMax") + "<br/>" + (localize "STR_GNOTF_Price")+ " <t color='#8cff9b'>$%3</t>",_maxMembers,_slotUpgrade,[_upgradePrice] call UnionClient_system_numberText],
	localize "STR_Gang_UpgradeMax",
	localize "STR_Global_Buy",
	localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
	if(BANK < _upgradePrice) exitWith {
		hint parseText format[
			(localize "STR_GNOTF_NotEoughMoney_2") + "<br/><br/>" + (localize "STR_GNOTF_Current") + " <t color='#8cff9b'>$%1</t><br/>" + (localize "STR_GNOTF_Lacking") + " <t color='#FF0000'>$%2</t>",
			[BANK] call UnionClient_system_numberText,
			[_upgradePrice - BANK] call UnionClient_system_numberText
		];
	};	
	["atm","take",_upgradePrice] call UnionClient_system_myCash;
	grpPlayer SVAR ["gang_maxMembers",_slotUpgrade,true];
	hint parseText format[localize "STR_GNOTF_UpgradeSuccess",_maxMembers,_slotUpgrade,[_upgradePrice] call UnionClient_system_numberText];

	[[2,grpPlayer,playerSide,steamid],"updateGang"] call UnionClient_system_hcExec;
} else {
	hint localize "STR_GNOTF_UpgradeCancel";
};

[] spawn UnionClient_gangs_Menu;