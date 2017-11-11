/*

	Filename: 	UnionClient_system_medicRequest.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\..\script_macros.hpp"
private["_caller","_callerName"];
_caller = param [0,ObjNull,[ObjNull]];
_callerName = param [1,"Unknown Player",[""]];
if (isNull _caller) exitWith {};

player reveal _caller;

["MedicalRequestEmerg",[format[localize "STR_Medic_Request",_callerName]]] call BIS_fnc_showNotification;