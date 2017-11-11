/*

	Filename: 	UnionClient_system_dropFishingNet.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\..\script_macros.hpp"
private _boat = objectParent player;
if (EQUAL((driver _boat),player)) exitWith { hint localize "STR_NOTF_PassengerSeat"};
private _fish = (nearestObjects[getPos _boat,["Fish_Base_F"],20]);

life_net_dropped = true;
titleText[localize "STR_NOTF_NetDrop","PLAIN"];
uiSleep 5;
if(EQUAL(_fish,[])) exitWith {titleText[localize "STR_NOTF_NetDropFail","PLAIN"]; life_net_dropped = false;};

private _val = 1;
if (FETCH_CONST(life_donator) > 0) then {ADD(_val,1)};

private["_type","_typeName"];
{	
	switch (true) do {
		case (EQUAL((typeOf _x),"Salema_F")): {_typeName = localize "STR_ANIM_Salema"; _type = "salema";};
		case (EQUAL((typeOf _x),"Ornate_random_F")) : {_typeName = localize "STR_ANIM_Ornate"; _type = "ornate";};
		case (EQUAL((typeOf _x),"Mackerel_F")) : {_typeName = localize "STR_ANIM_Mackerel"; _type = "mackerel";};
		case (EQUAL((typeOf _x),"Tuna_F")) : {_typeName = localize "STR_ANIM_Tuna"; _type = "tuna";};
		case (EQUAL((typeOf _x),"Mullet_F")) : {_typeName = localize "STR_ANIM_Mullet"; _type = "mullet";};
		case (EQUAL((typeOf _x),"CatShark_F")) : {_typeName = localize "STR_ANIM_Catshark"; _type = "catshark";};
		default {_type = "";};
	};		
	
	if ([true,_type,_val] call UnionClient_system_handleInv) then {
		deleteVehicle _x;
		titleText[format[(localize "STR_NOTF_Fishing"),_typeName],"PLAIN"];
	};

	if ((call UnionClient_system_isInterrupted) OR (NOTINVEH(player)) OR (isEngineOn _boat) OR (EQUAL((driver _boat),player)) OR (life_carryWeight >= life_maxWeight)) exitWith {};

	uiSleep 3;
} foreach (_fish);

uiSleep 1.5;
titleText[localize "STR_NOTF_NetUp","PLAIN"];
life_net_dropped = false;