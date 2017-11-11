/*

	Filename: 	UnionClient_system_vehicleActions.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};

_vehicle removeAction AID_CED;
_vehicle removeAction AID_CEP;
_vehicle removeAction AID_CEX;

AID_CED = _vehicle addAction [localize "STR_pAct_DriverSeat",UnionClient_system_copEnter,"driver",200,false,false,"",' isNull objectParent _this && (locked _target) != 0  && !life_inwarzone', 4];
AID_CEP = _vehicle addAction [localize "STR_pAct_PassengerSeat",UnionClient_system_copEnter,"passenger",100,false,false,"",' isNull objectParent _this && (locked _target) != 0  && !life_inwarzone', 4];
AID_CEX = _vehicle addAction [localize "STR_pAct_GoOut",UnionClient_system_copEnter,"exit",100,false,false,"",' !isNull objectParent _this && (locked _target) == 2 && !life_inwarzone'];