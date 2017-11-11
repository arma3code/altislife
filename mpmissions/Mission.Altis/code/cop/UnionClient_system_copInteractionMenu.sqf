/*

	Filename: 	UnionClient_system_copInteractionMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _curTarget = param [0,ObjNull,[ObjNull]];
if (isNull _curTarget) exitWith {}; //Bad target
if (!isPlayer _curTarget && side _curTarget in [civilian,independent]) exitWith {}; //Bad side check?
if (dialog) exitWith {};

createDialog "UnionDialogPlayerInteraction";
waitUntil {!isNull (findDisplay 37400)};

private _Btn1 = CONTROL(37400,37402);
private _Btn2 = CONTROL(37400,37403);
private _Btn3 = CONTROL(37400,37404);
private _Btn4 = CONTROL(37400,37405);
private _Btn5 = CONTROL(37400,37406);
private _Btn6Half = CONTROL(37400,37407);
private _Jtime = CONTROL(37400,37408);
private _Btn6 = CONTROL(37400,37409);
private _Btn7 = CONTROL(37400,37410);
private _Btn8 = CONTROL(37400,37411);
private _Btn9 = CONTROL(37400,37412);
private _Btn10 = CONTROL(37400,37413);
private _Btn11 = CONTROL(37400,37414);
private _Btn12 = CONTROL(37400,37415);

life_pInact_curTarget = _curTarget;

//Set Unrestrain Button
_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
_Btn1 buttonSetAction "[life_pInact_curTarget] call UnionClient_system_unrestrain; closeDialog 0;";

//Set Check Licenses Button
_Btn2 ctrlSetText localize "STR_pInAct_checkLicenses";
_Btn2 buttonSetAction "[player] remoteExecCall [""UnionClient_system_licenseCheck"",life_pInact_curTarget]";

//Set Search Button
_Btn3 ctrlSetText localize "STR_pInAct_SearchPlayer";
_Btn3 buttonSetAction "[life_pInact_curTarget] spawn UnionClient_system_searchAction; closeDialog 0;";

//Set Escort Button
if (NOTATTACHED(_curTarget)) then {
	_Btn4 ctrlSetText localize "STR_pInAct_Escort";
	_Btn4 buttonSetAction "[life_pInact_curTarget] call UnionClient_system_escortAction; closeDialog 0;";
} else {
	_Btn4 ctrlSetText localize "STR_pInAct_StopEscort";
	_Btn4 buttonSetAction "[life_pInact_curTarget] call UnionClient_system_stopEscorting; closeDialog 0;";
};

//Set Ticket Button
_Btn5 ctrlSetText localize "STR_pInAct_TicketBtn";
_Btn5 buttonSetAction "[life_pInact_curTarget] call UnionClient_system_ticketAction;";

//ДОСВИДАНИЯ
_Btn6Half ctrlSetText localize "STR_pInAct_Arrest";
_Btn6Half buttonSetAction "[life_pInact_curTarget] call UnionClient_system_arrestAction;closeDialog 0;";

//Check that you are near a place to jail them.
if !([player] call UnionClient_system_checkForSearch) then {
	_Btn6Half ctrlEnable false;
	_Jtime ctrlEnable false;
};

_Btn7 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn7 buttonSetAction "[life_pInact_curTarget] call UnionClient_system_putInCar;";

_Btn8 ctrlSetText "Изъять оружие";
_Btn8 buttonSetAction "[life_pInact_curTarget] call UnionClient_system_removeWeaponAction; closeDialog 0;";

_Btn9 ctrlSetText "Забрать телефон";
_Btn9 buttonSetAction "[life_pInact_curTarget] call UnionClient_system_dropRadio; closeDialog 0;";

if(_curTarget GVAR["isBlind",false]) then {
    _Btn10 ctrlSetText "Снять мешок";
    _Btn10 buttonSetAction "[life_pInact_curTarget] call UnionClient_system_makeHimUnBlind; closeDialog 0;";
} else {
    _Btn10 ctrlSetText "Надеть мешок";
    _Btn10 buttonSetAction "[life_pInact_curTarget] call UnionClient_system_makeHimBlind; closeDialog 0;";
};

_Btn11 ctrlSetText "Паспорт";
_Btn11 buttonSetAction "[player] remoteExecCall [""UnionClient_system_showPassportTo"",life_pInact_curTarget]; closeDialog 0";

_Btn6 ctrlShow false;
_Btn12 ctrlShow false;