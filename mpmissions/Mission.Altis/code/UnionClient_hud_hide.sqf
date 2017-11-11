/*

	Filename: 	UnionClient_hud_hide.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
private _ui = GVAR_UINS ["playerHUD",displayNull];
if (isNull _ui) exitWith {};

["playerHUD"] call UnionClient_gui_DestroyRscLayer;
if (!isNull LIFE_HANDLE_HUD) then {terminate LIFE_HANDLE_HUD};