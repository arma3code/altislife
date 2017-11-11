/*
	
	Filename: 	UnionClient_gestures_danceMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
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

_Btn1 ctrlSetText "Ivan";
_Btn1 buttonSetAction "[""cl3_duoivan""] spawn UnionClient_gestures_danceAction; closeDialog 0;";

_Btn2 ctrlSetText "Stefan";
_Btn2 buttonSetAction "[""cl3_stephan""] spawn UnionClient_gestures_danceAction; closeDialog 0;";

_Btn3 ctrlSetText "Stefan V";
_Btn3 buttonSetAction "[""cl3_duostephan""] spawn UnionClient_gestures_danceAction; closeDialog 0;";

_Btn4 ctrlSetText "Night Club";
_Btn4 buttonSetAction "[""cl3_nightclubdance""] spawn UnionClient_gestures_danceAction; closeDialog 0;";

_Btn5 ctrlSetText "DubStep";
_Btn5 buttonSetAction "[""cl3_dubstepdance""] spawn UnionClient_gestures_danceAction; closeDialog 0;";

_Btn6 ctrlSetText "DubStep Pop";
_Btn6 buttonSetAction "[""cl3_dubsteppop""] spawn UnionClient_gestures_danceAction; closeDialog 0;";

_Btn7 ctrlSetText "Hip Hop";
_Btn7 buttonSetAction "[""cl3_hiphopdance""] spawn UnionClient_gestures_danceAction; closeDialog 0;";

_Btn8 ctrlSetText "Crazy Drunk";
_Btn8 buttonSetAction "[""cl3_crazydrunkdance""] spawn UnionClient_gestures_danceAction; closeDialog 0;";

_Btn9 ctrlSetText "Robot";
_Btn9 buttonSetAction "[""cl3_robotdance""] spawn UnionClient_gestures_danceAction; closeDialog 0;";

_Btn10 ctrlSetText "Russian";
_Btn10 buttonSetAction "[""cl3_russiandance""] spawn UnionClient_gestures_danceAction; closeDialog 0;";

if (life_dance) then {
	_Btn1 ctrlEnable false;
	_Btn2 ctrlEnable false;
	_Btn3 ctrlEnable false;
	_Btn4 ctrlEnable false;
	_Btn5 ctrlEnable false;
	_Btn6 ctrlEnable false;
	_Btn7 ctrlEnable false;
	_Btn8 ctrlEnable false;
	_Btn9 ctrlEnable false;
	_Btn10 ctrlEnable false;
};

_Btn11 ctrlSetText localize "STR_pInAct_Cancel";
_Btn11 buttonSetAction "[] call UnionClient_system_animDo; closeDialog 0;";

_Btn6Half ctrlShow false;
_Jtime ctrlShow false;
_Btn12 ctrlShow false;