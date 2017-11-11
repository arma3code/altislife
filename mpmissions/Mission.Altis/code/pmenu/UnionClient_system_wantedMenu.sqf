/*
	
	Filename: 	UnionClient_system_wantedMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
if(isNull (findDisplay 2400)) then {
	if !(createDialog "UnionDialogWanted") exitWith {};
};

ctrlSetText[2406, M_CONFIG(getText,"LifeCfgPadSkins",life_myPadSkinID,"image")];
ctrlSetText[2404,"Соединение с базой данных..."];

lbClear CONTROL(2400,2401);

if (life_coplevel < 6 && (FETCH_CONST(life_adminlevel) == 0)) then {
	ctrlShow[2405,false];
};

[[player],"wantedFetch","TON",false] call UnionClient_system_hcExec;