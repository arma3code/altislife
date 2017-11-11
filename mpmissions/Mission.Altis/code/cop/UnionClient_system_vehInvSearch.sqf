/*
	
	Filename: 	UnionClient_system_vehInvSearch.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _vehicle = cursorObject;
if (isNull _vehicle) exitWith {};
if !([_vehicle] call UnionClient_system_isVehicleKind) exitWith {};

private _vehicleInfo = _vehicle GVAR ["Trunk",[[],0]];
if (EQUAL((_vehicleInfo select 0),[])) exitWith {hint localize "STR_Cop_VehEmpty"};

private _value = 0;
private _items = "";

if !([player] call UnionClient_system_checkForSearch) then {
	{		
		_items = _items + str (_x select 1) + " x " + (ITEM_NAME(_x select 0)) + "<br/>";
	} foreach (_vehicleInfo select 0);

	if !(EQUAL(_items,"")) then {
		hint parseText format["<t color='#FF0000'><t size='1.3'>Содержимое багажника</t></t><br/><br/><t color='#f0e208'>%1</t><br/>Для конфискации нелегала доставьте груз на территорию участка!",_items];
	} else {
		hint "Багажник пуст";
	};
} else {
	private["_var","_val","_index"];
	{
		_var = _x select 0;
		_val = _x select 1;
	
		_index = [_var,life_illegal_items] call UnionClient_system_index;
		if !(EQUAL(_index,-1)) then {			
			ADD(_value,(_val * ((life_illegal_items select _index) select 1)));
		};
	} foreach (_vehicleInfo select 0);

	if(_value > 0) then {		
		[0,"STR_NOTF_VehContraband",true,[[_value] call UnionClient_system_numberText]] remoteExecCall ["UnionClient_system_broadcast",RCLIENT];		
		private _gangID = grpPlayer GVAR ["gang_id",-1];
		if (EQUAL(_gangID,life_westGangId)) then {
			private _gFund = grpPlayer GVAR ["gang_bank",-1];
			if (EQUAL(_gFund,-1)) then {
				["atm","add",_value] call UnionClient_system_myCash;
				hint "Не удалось определить баланс группы. Начислено на банковский счет. Сообщите админу!";
			} else {				
				ADD(_gFund,_value);
				grpPlayer SVAR ["gang_bank",_gFund,true];			
				
				[[1,grpPlayer,playerSide,steamid],"updateGang"] call UnionClient_system_hcExec;				
			};
		} else {
			["atm","add",_value] call UnionClient_system_myCash;
		};
		[_vehicle] call UnionClient_system_clearVehicleTrunk;
	} else {
		hint localize "STR_Cop_NoIllegalVeh";
	};
};