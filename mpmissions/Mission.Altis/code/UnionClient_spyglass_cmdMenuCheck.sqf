/*

	Filename: 	UnionClient_spyglass_cmdMenuCheck.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_validMenus","_lastMenu"];
_validMenus = [
	"RscMainMenu","RscMoveHigh","#WATCH","#WATCH0","RscWatchDir","RscWatchMoveDir","#GETIN","#RscStatus","RscCallSupport","#ACTION",
	"RscCombatMode","RscFormations","RscTeam","RscSelectTeam","RscReply","#User:BIS_Menu_GroupCommunication","#CUSTOM_RADIO",
	"RscRadio","RscGroupRootMenu","RscMenuReply","RscMenuStatus","","#User:BIS_fnc_addCommMenuItem_menu","RscMenuMove","RscMenuFormations"
];

_lastMenu = "";
while {true} do
{
	waitUntil {uiSleep 1; commandingMenu != _lastMenu};
	_lastMenu = commandingMenu;
	
	if(!(commandingMenu in _validMenus)) then {		
		[[0,1],format["%1 was observed by SPY-GLASS, he/she was trying to access commanding menu:\n\n %2\n\n and that commanding-menu is not known to the system. PLEASE NOTE he/she may not be cheating but the SPY-GLASS found it relavent to report in",profileName,_lastMenu]] remoteExecCall ["UnionClient_system_broadcast",RCLIENT];
		showCommandingMenu "";
	};
};