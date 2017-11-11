/*
	
	Filename: 	UnionClient_surgery_SetFace.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (EQUAL(FETCH_CONST(life_donator),0)) exitWith {titleText[localize "STR_SURGERY_NewFaceVIP","PLAIN"]};
disableSerialization;
life_myIdentity = CONTROL_DATA(5402);
if !(EQUAL(face player,life_myIdentity)) then {
	if (CASH < 5000) exitWith {titleText[localize "STR_ATM_NotEnoughCash","PLAIN"]};
	[player,life_myIdentity] remoteExec ["setFace",RANY,netId player];
	["cash","take",5000,"setFace"] call UnionClient_system_myCash;
	titleText[localize "STR_SURGERY_NewFaceDone","PLAIN"];
	closeDialog 0;
};