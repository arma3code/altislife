/*

	Filename: 	UnionClient_system_freeInteractionMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _curTarget = param [0,ObjNull,[ObjNull]];
if (isNull _curTarget) exitWith {};
if (!isPlayer _curTarget) exitWith {};
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

_Btn1 ctrlSetText "Выставить счет";
_Btn1 buttonSetAction "[life_pInact_curTarget] call UnionClient_tickets_Action";

{
	_x ctrlShow false;
} forEach [_Btn2,_Btn3,_Btn4,_Btn5,_Btn6Half,_Jtime,_Btn6,_Btn7,_Btn8,_Btn9,_Btn10,_Btn11,_Btn12];