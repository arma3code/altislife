/*

	Filename: 	UnionClient_dhl_boxPickUp.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if !(call UnionClient_dhl_check) exitWith {hint localize "STR_DHL_CheckError"};

player playAction "FT_Act_Box_Idle";
life_dhl_box attachTo [player,[-0.2, 0, 0.23],"RightHand"];

AID_DROPBOX = player addAction ["<img image='\union_dhl\data\dhl_logo.paa' /> Положить коробку",UnionClient_dhl_boxPutDown,nil,0,false,true,"",' life_dhl_orderInProgress && life_dhl_box in (attachedObjects player)'];
AID_STOREBOX = player addAction ["<img image='\union_dhl\data\dhl_logo.paa' /> Убрать коробку в фургон",UnionClient_dhl_boxStoreInVehicle,nil,0,false,true,"",' life_dhl_orderInProgress && life_dhl_box in (attachedObjects player) && cursorObject isEqualTo life_dhl_car && player distance life_dhl_car < 5'];

waitUntil {uiSleep 0.03; player forceWalk true; !(EQUAL(CURWEAPON,"")) OR !(NOTINVEH(player)) OR !life_dhl_orderInProgress OR isNull life_dhl_box OR isNull life_dhl_car OR !(life_dhl_box in (attachedObjects player))};

player forceWalk false;

player removeAction AID_DROPBOX;
player removeAction AID_STOREBOX;

if (life_dhl_box in (attachedObjects player)) then {
	[] call UnionClient_dhl_boxPutDown;
};

if (EQUAL(CURWEAPON,"")) then {
	player PlayActionNow "FT_Act_Gesture_Reset";
};