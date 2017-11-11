/*

	Filename: 	UnionClient_spyglass_initSpy.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if(isServer && !hasInterface) exitWith {}; //Server doesn't need to know.

CONST(W_O_O_K_I_E_ANTI_ANTI_HAX,"false");
CONST(W_O_O_K_I_E_FUD_ANTI_ANTI_HAX,"false");
CONST(E_X_T_A_S_Y_ANTI_ANTI_HAX,"false");
CONST(E_X_T_A_S_Y_Pro_RE,"false");
CONST(E_X_T_A_S_Y_Car_RE,"false");
CONST(DO_NUKE,"false");
CONST(JxMxE_spunkveh,"false");
CONST(JxMxE_spunkveh2,"false");
CONST(JxMxE_spunkair,"false");
CONST(JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE,"false");
CONST(JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE_OLD,"false");
CONST(JJJJ_MMMM___EEEEEEE_SPAWN_VEH,"false");
CONST(JJJJ_MMMM___EEEEEEE_SPAWN_WEAPON,"false");

SVAR_UINS["RscDisplayRemoteMissions",displayNull]; //For Spy-Glass..
SVAR_UINS["RscDisplayMultiplayer",displayNull];

//Check for copy-pasters of Dev-Con styled execution.
//Because I am nice, add these to the following below to allow CBA; "CBA_CREDITS_CONT_C","CBA_CREDITS_M_P
private["_children","_allowedChildren"];
_children = [configFile >> "RscDisplayMPInterrupt" >> "controls",0] call BIS_fnc_returnChildren;
_allowedChildren = ["Title","MissionTitle","PlayersName","ButtonCancel","ButtonSAVE","ButtonSkip","ButtonRespawn","ButtonOptions",
"ButtonVideo","ButtonAudio","ButtonControls","ButtonGame","ButtonTutorialHints","ButtonAbort","DebugConsole",
"Version","TraffLight","Feedback","MessageBox","CBA_Credits_Cont_C","CBA_CREDITS_M_P","cba_help_credits"];

{
	if(!((configName _x) in _allowedChildren)) exitWith {
		[steamid,0,"Modified MPInterrupt",format["Modified MPInterrupt: %1",configName _x]] remoteExecCall ["TON_fnc_rcon",RSERV];
	};
} foreach _children;

/* Forgot to include this but this is also also a popular method for "unreleased" stuff */
if(getText(configFile >> "CfgFunctions" >> "init") != "A3\functions_f\initFunctions.sqf") then {
	[steamid,0,"Modified Functions Init","Modified Functions Init"] remoteExecCall ["TON_fnc_rcon",RSERV];
};

[] spawn UnionClient_spyglass_cmdMenuCheck;
[] spawn UnionClient_spyglass_menuCheck;