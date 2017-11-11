/*

	Filename: 	UnionClient_system_packupSpikes.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
#include "..\..\script_macros.hpp"
private["_spikes"];
_spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0;
if (isNil "_spikes") exitWith {};

if (["extItem_MetalWire"] call UnionClient_system_addItem) then {
	titleText[localize "STR_NOTF_SpikeStrip","PLAIN"];
	player removeAction life_action_spikeStripPickup;
	life_action_spikeStripPickup = nil;
	deleteVehicle _spikes;
} else {
	hint localize "STR_NOTF_InvFull";
};