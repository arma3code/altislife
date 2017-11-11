/*
	
	Filename: 	UnionClient_atm_openMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private["_display","_text","_units","_type","_west","_east","_civ","_ind"];
if(!life_use_atm) exitWith {hint localize "STR_Shop_ATMRobbed";};
disableSerialization;
if(!dialog) then {
	if !(createDialog "UnionDialogAtm") exitWith {};
};
waitUntil {!isnull (findDisplay 2700)};

_display = findDisplay 2700;
_text = _display displayCtrl 2701;
_units = _display displayCtrl 2703;

_text ctrlSetStructuredText parseText format["<t size ='1.1'><img size='1.7' image='\union_pack\icons\bank.paa'/> $%1<br/><img size='1.7' image='\union_pack\icons\cash.paa'/> $%2</t>",[BANK] call UnionClient_system_numberText,[CASH] call UnionClient_system_numberText];

lbClear _units;
		
_west = [];
_east = [];
_civ = [];
_ind = [];

{	
	if (alive _x && {LSALIVE(_x)} && {_x != player} && {GVAR_RNAME(_x) != ""}) then {
		switch(side _x) do {
			case west: {_west pushBack _x};
			case civilian: {_civ pushBack _x};
			case east: {_east pushBack _x};
			case independent: {_ind pushBack _x};
		};
	}
} forEach playableUnits;

{
	_type = "Коп";
	_units lbAdd format["[%2] %1",GVAR_RNAME(_x),_type];
	_units lbSetColor [(lbSize _units)-1,[0,0.588,1,1]];
	_units lbSetData [(lbSize _units)-1,str(_x)];			
} forEach _west;

{
	_type = "МЧС";
	_units lbAdd format["[%2] %1",GVAR_RNAME(_x),_type];
	_units lbSetColor [(lbSize _units)-1,[1,0,0,1]];
	_units lbSetData [(lbSize _units)-1,str(_x)];
} forEach _east;

{
	_type = "Повст";
	_units lbAdd format["[%2] %1",GVAR_RNAME(_x),_type];
	_units lbSetColor [(lbSize _units)-1,[0,1,0,1]];
	_units lbSetData [(lbSize _units)-1,str(_x)];
} forEach _ind;

{
	_type = "Гражд";
	_units lbAdd format["[%2] %1",GVAR_RNAME(_x),_type];
	_units lbSetColor [(lbSize _units)-1,[0.902,0.553,1,1]];
	_units lbSetData [(lbSize _units)-1,str(_x)];
} forEach _civ;

//lbSetCurSel [2703,0];

if (isNil {(grpPlayer GVAR "gang_bank")}) then {
	(CONTROL(2700,2705)) ctrlEnable false;
} else {
	private _ownerID = grpPlayer GVAR ["gang_owner",""];
	if (EQUAL(_ownerID,steamid)) then {
		(CONTROL(2700,2705)) ctrlEnable true;
	} else {
		(CONTROL(2700,2705)) ctrlEnable false;
	};
};