/*

	Filename: 	UnionClient_system_gestureMenuFun.sqf
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

_Btn1 ctrlSetText localize "STR_GSTR_Bouncer";
_Btn1 buttonSetAction "[""cl3_bouncer""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn2 ctrlSetText localize "STR_GSTR_Pray";
_Btn2 buttonSetAction "[""cl3_bow_pray""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn3 ctrlSetText localize "STR_GSTR_Clapping";
_Btn3 buttonSetAction "[""cl3_clapping""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn4 ctrlSetText localize "STR_GSTR_HandStand";
_Btn4 buttonSetAction "[""cl3_hand_stand""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn5 ctrlSetText localize "STR_GSTR_Muscle";
_Btn5 buttonSetAction "[""cl3_muscle""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn6 ctrlSetText localize "STR_GSTR_PushUps";
_Btn6 buttonSetAction "[""cl3_pushups""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn7 ctrlSetText localize "STR_GSTR_Violin";
_Btn7 buttonSetAction "[""cl3_violin""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn8 ctrlSetText localize "STR_GSTR_Wank";
_Btn8 buttonSetAction "[""cl3_wank""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn9 ctrlSetText localize "STR_GSTR_Wanker";
_Btn9 buttonSetAction "[""cl3_wanker""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn10 ctrlSetText localize "STR_GSTR_ThumbsUp";
_Btn10 buttonSetAction "[""cl3_thumbs_up""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn11 ctrlSetText localize "STR_GSTR_ThumbsDown";
_Btn11 buttonSetAction "[""cl3_thumbs_down""] call UnionClient_gestures_playAction; closeDialog 0;";

_Btn12 ctrlShow false;
_Btn6Half ctrlShow false;
_Jtime ctrlShow false;