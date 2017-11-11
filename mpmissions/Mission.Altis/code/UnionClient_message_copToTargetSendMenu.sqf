/*

	Filename: 	UnionClient_message_copToTargetSendMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if (dialog) exitWith {"CopToTargetSendMenu - dialog is not Null" call UnionClient_system_log};
if (isNull life_uiTarget) exitWith {"CopToTargetSendMenu - life_uiTarget isNull" call UnionClient_system_log};
if !([life_uiTarget] call UnionClient_system_isVehicleKind) exitWith {hint "Цель не является техникой"; "CopToTargetSendMenu - life_uiTarget is not vehicle" call UnionClient_system_log};
if (count (crew life_uiTarget) <= 0) exitWith {hint "В технике никого нет"; "CopToTargetSendMenu - life_uiTarget crew empty" call UnionClient_system_log};

createDialog "UnionDialogCopTargetMessage";
waitUntil {!isNull (findDisplay 7000)};

(CONTROL(7000,7001)) ctrlSetStructuredText parseText format ["<t align='center' size='1.2' color='%2'>Сообщение для<br/>%1</t>",getText(configFile >> "CfgVehicles" >> (typeOf life_uiTarget) >> "displayName"),GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];

private _Btn1 = CONTROL(7000,7002);
private _Btn2 = CONTROL(7000,7003);
private _Btn3 = CONTROL(7000,7004);
private _Btn4 = CONTROL(7000,7005);
private _Btn5 = CONTROL(7000,7006);
private _Btn6 = CONTROL(7000,7007);
private _Btn7 = CONTROL(7000,7008);

_Btn1 ctrlSetText "Стоп + Выход";
_Btn1 buttonSetAction "[player,1] remoteExecCall [""UnionClient_message_copToTargetGetMessage"",crew life_uiTarget]; closeDialog 0; hint ""Сообщение отправлено!""";

_Btn2 ctrlSetText "Стоп + Cидеть";
_Btn2 buttonSetAction "[player,2] remoteExecCall [""UnionClient_message_copToTargetGetMessage"",crew life_uiTarget]; closeDialog 0; hint ""Сообщение отправлено!""";

{
	_x ctrlEnable false;
} forEach [_Btn3,_Btn4,_Btn5,_Btn6,_Btn7];