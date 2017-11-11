/*

	Filename: 	UnionClient_system_houseBankMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _curTarget = param [0,ObjNull,[ObjNull]];
if (isNull _curTarget) exitWith {}; //Bad target
if (playerSide != west) exitWith {};
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

_Btn1 ctrlSetText localize "STR_pInAct_Repair";
_Btn1 buttonSetAction "[life_pInact_curTarget] spawn UnionClient_system_repairDoor; closeDialog 0;";

_Btn2 ctrlSetText localize "STR_pInAct_CloseOpen";
_Btn2 buttonSetAction "[life_pInact_curTarget] call UnionClient_system_doorAnimate; closeDialog 0;";

_Btn3 ctrlShow false;
_Btn4 ctrlShow false;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn6Half ctrlShow false;
_Jtime ctrlShow false;
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;
_Btn10 ctrlShow false;
_Btn11 ctrlShow false;
_Btn12 ctrlShow false;