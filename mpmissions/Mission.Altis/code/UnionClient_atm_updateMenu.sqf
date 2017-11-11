/*
	
	Filename: 	UnionClient_atm_updateMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_text","_units","_type"];
disableSerialization;

_text = CONTROL(2700,2701);
_units = CONTROL(2700,2703);

_text ctrlSetStructuredText parseText format["<t size ='1.1'><img size='1.7' image='\union_pack\icons\bank.paa'/> $%1<br/><img size='1.7' image='\union_pack\icons\cash.paa'/> $%2</t>",[BANK] call UnionClient_system_numberText,[CASH] call UnionClient_system_numberText];