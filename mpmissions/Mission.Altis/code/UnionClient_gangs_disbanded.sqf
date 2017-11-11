/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Notifies members that the gang has been disbanded.
*/
private["_group"];
_group = [_this,0,grpNull,[grpNull]] call BIS_fnc_param;
if(isNull _group) exitWith {}; //Fail horn please.
if(!isNull (findDisplay 2620)) then {closedialog 2620};
hint localize "STR_GNOTF_DisbandWarn_2";
switch (playerside) do {
	case civilian: {[player] joinSilent (createGroup civilian);};
	case independent: {[player] joinSilent (createGroup independent);};
	case west: {[player] joinSilent (createGroup west);};
	case east: {[player] joinSilent (createGroup west);};
};
[] call UnionClient_gangs_ClearLicense;
if(count units _group == 0) then {
	deleteGroup _group;
};
