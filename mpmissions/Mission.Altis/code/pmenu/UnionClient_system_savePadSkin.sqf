/*
	
	Filename: 	UnionClient_system_savePadSkin.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
if (EQUAL((lbCurSel 2973),-1)) exitWith {hint "Вы не выбрали цвет"};
life_myPadSkinID = CONTROL_DATA(2973);
ctrlSetText [2903, M_CONFIG(getText,"LifeCfgPadSkins",life_myPadSkinID,"image")];