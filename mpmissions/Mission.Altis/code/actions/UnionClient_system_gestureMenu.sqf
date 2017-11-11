/*

	Filename: 	UnionClient_system_gestureMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (dialog) exitWith {};

createDialog "UnionDialogPlayerInteraction";
waitUntil {!isnull (findDisplay 37400)};

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

_Btn1 ctrlSetText localize "STR_GSTR_Forward";
_Btn1 buttonSetAction "[""CRPTHSForward""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn2 ctrlSetText localize "STR_GSTR_Stop";
_Btn2 buttonSetAction "[""CRPTHSStop""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn3 ctrlSetText localize "STR_GSTR_Regroup";
_Btn3 buttonSetAction "[""CRPTHSRegroup""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn4 ctrlSetText localize "STR_GSTR_Engage";
_Btn4 buttonSetAction "[""CRPTHSEngage""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn5 ctrlSetText localize "STR_GSTR_Point";
_Btn5 buttonSetAction "[""CRPTHSPoint""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn6 ctrlSetText localize "STR_GSTR_Hold";
_Btn6 buttonSetAction "[""CRPTHSHold""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn7 ctrlSetText localize "STR_GSTR_Warning";
_Btn7 buttonSetAction "[""CRPTHSWarning""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn8 ctrlSetText localize "STR_GSTR_Yes";
_Btn8 buttonSetAction "[""cl3_yes""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn9 ctrlSetText localize "STR_GSTR_No";
_Btn9 buttonSetAction "[""cl3_no_way""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn10 ctrlSetText localize "STR_GSTR_Finger";
_Btn10 buttonSetAction "[""cl3_middle_finger""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn11 ctrlSetText localize "STR_GSTR_SuckIt";
_Btn11 buttonSetAction "[""cl3_suck_it""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn12 ctrlShow false;
_Btn6Half ctrlShow false;
_Jtime ctrlShow false;