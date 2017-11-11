/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_cash","_dcash"];
_cash = [_this,0,0,[0]] call BIS_fnc_param;
_dcash = [_this,1,0,[0]] call BIS_fnc_param;
if(_cash == 0 && _dcash==0) exitWith {titleText[localize "STR_Civ_RobFail","PLAIN"]};

["cash","add",_cash,"robReceive"] call UnionClient_system_myCash;
["dcash","add",_dcash,"robReceive"] call UnionClient_system_myCash;
titleText[format[localize "STR_Civ_Robbed",[_cash+_dcash] call UnionClient_system_numberText],"PLAIN"];

[] spawn {
	if (!(life_use_atm)) exitWith {};
	life_use_atm = false;
	hint "Вы ограбили человека и не сможете 15 минут пользоваться банкоматом";
	uiSleep 900;
	life_use_atm = true;
	hint "Вы снова можете пользоваться банкоматом";
};