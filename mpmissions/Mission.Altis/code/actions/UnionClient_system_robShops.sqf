/*
	
	Filename: 	UnionClient_system_robShops.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _shop = param [0,ObjNull,[ObjNull]];
if (life_action_inUse) exitWith {};
if (call UnionClient_system_isInterrupted) exitWith {};
if !(NOTINVEH(player)) exitWith {};	
if !(playerSide in [civilian,independent]) exitWith {};
if (west countSide playableUnits < LIFE_SETTINGS(getNumber,"life_cop_min_illegal")) exitWith {hint format [localize "STR_Civ_NotEnoughCops",LIFE_SETTINGS(getNumber,"life_cop_min_illegal")]};
if (player distance _shop > 5) exitWith { hint format [localize "STR_NOTF_DistanceToTarger",5]};
if (_shop GVAR ["robinprogress",false]) exitWith {hint localize "STR_NOTF_ShopRobInProgress"};
if (_shop GVAR ["shopRobbed",false]) exitWith {hint localize "STR_NOTF_ShopRobbedAlrd"};
if (EQUAL(CURWEAPON,"") OR EQUAL(CURWEAPON,"Binocular") OR (["Extremo_Sign",CURWEAPON] call UnionClient_system_xString)) exitWith {hint "И чего я должен испугаться?! Вали отсюда!"};

private _kassa = 1000 + round(random 5000);

[_shop,"robinprogress",true] call CBA_fnc_setVarNet;
call UnionClient_actions_inUse;
private _chance = random(100);

private _shopcoordX = format ["%1",round (((getpos _shop) select 0) / 100)];
private _shopcoordY = format ["%1",round (((getpos _shop) select 1) / 100)];
private _shopcoord = format["%1",_shopcoordX + "-" + _shopcoordY];

if (_chance >= 50) then {
	hint localize "STR_NOTF_ShopRobCopsCall"; 	
	[1,format["!!! Магазин (координаты: %1) обносится криминальными элементами !!!", _shopcoord]] remoteExecCall ["UnionClient_system_broadcast",west];
};

private _mrkstring = format ["wrgMarker%1", random(1000)];
private _marker = createMarker [_mrkstring, position player]; //by ehno: Place a Marker on the map
_marker setMarkerColor "ColorRed";
_marker setMarkerText "!!! Идет ограбление !!!";
_marker setMarkerType "mil_warning";

disableSerialization;
titleText[localize "STR_NOTF_ShopRobStay","PLAIN"];
private _cP = 0;
while{true} do {
	uiSleep 1;
	_cP = _cP + 0.01;
	[_cP,"criminal"] call UnionClient_system_progressBar;	  
	if (_cP >= 1 OR (player distance _shop > 5.1) OR (call UnionClient_system_isInterrupted)) exitWith {};
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;
life_action_inUse = false;

deleteMarker _marker;

[_shop,"robinprogress"] call UnionClient_system_clearGlobalVar;

if (call UnionClient_system_isInterrupted) exitWith {titleText[localize "STR_NOTF_ActionCancel","PLAIN"]};
   
if (player distance _shop > 5.1) exitWith {
	hint localize "STR_NOTF_ShopRobInWanted";
	[[steamid,GVAR_RNAME(player),"211A"],"wantedAdd"] call UnionClient_system_hcExec;
};
   
titleText[format[localize "STR_NOTF_ShopRobDone",[_kassa] call UnionClient_system_numberText],"PLAIN"];
["cash","add",_kassa] call UnionClient_system_myCash;
[[steamid,GVAR_RNAME(player),"211"],"wantedAdd"] call UnionClient_system_hcExec;
[_shop,"shopRobbed",true] call CBA_fnc_setVarNet;