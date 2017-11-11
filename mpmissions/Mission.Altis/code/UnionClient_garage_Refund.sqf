/*

	Filename: 	UnionClient_garage_Refund.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
	
*/
private["_price","_unit"];
_price = _this select 0;
_unit = _this select 1;
if(_unit != player) exitWith {};

["atm","add",_price] call UnionClient_system_myCash;