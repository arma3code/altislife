/*

	Filename: 	UnionClient_system_agonyInteractionMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _curTarget = param [0,ObjNull,[ObjNull]];
if (isNull _curTarget) exitWith {}; //Bad target
if !(LSINCAP(_curTarget)) exitWith {};
if (GVAR_RESTRAINED(player)) exitWith {}; //Bad target
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

_Btn1 ctrlSetText "Паспорт";
_Btn1 buttonSetAction "[player] remoteExecCall [""UnionClient_system_showPassportTo"",life_pInact_curTarget]; closeDialog 0";

_Btn2 ctrlSetText "Тащить";
_Btn2 buttonSetAction "[life_pInact_curTarget] spawn UnionClient_system_dragDeadBody; closeDialog 0;";

if (!(NOTATTACHED(life_pInact_curTarget)) OR count attachedObjects player > 0 OR !isNull life_DraggedBody OR !isNil {life_pInact_curTarget GVAR "draggedBy"}) then {
	_Btn2 ctrlEnable false;
};

_Btn3 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn3 buttonSetAction "[life_pInact_curTarget] call UnionClient_system_putInCar; closeDialog 0;";

_Btn4 ctrlSetText "Реанимировать";
_Btn4 buttonSetAction "[life_pInact_curTarget] spawn UnionClient_system_revivePlayer; closeDialog 0;";

_Btn6 ctrlSetText "Ограбить";
_Btn6 buttonSetAction "[life_pInact_curTarget] call UnionClient_system_robAction; closeDialog 0;";

_Btn7 ctrlSetText "Забрать телефон";
_Btn7 buttonSetAction "[life_pInact_curTarget] call UnionClient_system_dropRadio; closeDialog 0;";

_Btn8 ctrlSetText "Забрать снаряжение и ресурсы";
//_Btn8 buttonSetAction "[player] remoteExec [""UnionClient_system_dropAll"",life_pInact_curTarget]; closeDialog 0;";
_Btn8 buttonSetAction "[life_pInact_curTarget] spawn UnionClient_system_dropAllAnimat; closeDialog 0;";
if (playerSide == west) then {
	_Btn6 ctrlEnable false;
};

if (playerSide == east) then {
	_Btn6 ctrlEnable false;
	_Btn7 ctrlEnable false;
	_Btn8 ctrlEnable false;
};

if (playerSide in [civilian,independent]) then {
	_Btn4 ctrlEnable false;
};

_Btn6Half ctrlShow false;
_Jtime ctrlShow false;
_Btn5 ctrlShow False;
_Btn9 ctrlShow False;
_Btn10 ctrlShow False;
_Btn11 ctrlShow False;
_Btn12 ctrlShow False;