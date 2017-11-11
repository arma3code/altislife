/*

	Filename: 	UnionClient_pad_openStatus.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 7200)) then {
	createDialog "UnionDialogPadStatus";
	waitUntil {!isNull (findDisplay 7200)};
	ctrlSetText [7201, M_CONFIG(getText,"LifeCfgPadSkins",life_myPadSkinID,"image")];
};

private _inv = CONTROL(7200,7212); 
private _invI = CONTROL(7200,7210); 
private _lic = CONTROL(7200,7208);
private _near = CONTROL(7200,7205);
private _near_i = CONTROL(7200,7214);
private _mstatus = CONTROL(7200,7203);
private _expoints = CONTROL(7200,7218);
private _struct = "";

lbClear _inv;
lbClear _invI;
lbClear _lic;
lbClear _near;
lbClear _near_i;

[_inv] call UnionClient_gui_ListVirtualItems;

private _playerItems = [] call UnionClient_system_getPlayerItems;
private "_itemInfo";
{
	_itemInfo = [_x select 0] call UnionClient_system_itemDetails;
	if !(EQUAL(_itemInfo,[])) then {
		if (_x select 1 > 1) then {
			_invI lbAdd format["[%2] %1",_itemInfo select 1,_x select 1];
		} else {
			_invI lbAdd format["%1",_itemInfo select 1];
		};
		_invI lbSetData[(lbSize _invI)-1,_itemInfo select 0];
		_invI lbSetPicture[(lbSize _invI)-1,_itemInfo select 2];
	};
} foreach _playerItems;

private _side = [playerSide] call UnionClient_system_convertSide;
{	
	if (LICENSE_VALUE(configName _x,_side)) then {
		_lic lbAdd format["%1",localize (getText(_x >> "displayName"))];
	};
} forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "LifeCfgLicenses"));

private _near_units = [];
{ 
	if (player distance _x < 10) then {
		_near_units pushBack _x;
	};
} foreach playableUnits;

private "_indexInIds";
{
	_indexInIds = [(getPlayerUID _x),life_ids] call UnionClient_system_index;
	if (!isNull _x && alive _x && player distance _x < 10 && {_x != player} && {GVAR_RNAME(_x) != ""} && {!(EQUAL(_indexInIds,-1)) OR (_x in (units grpPlayer))}) then {
		_near lbAdd format["%1 - %2",GVAR_RNAME(_x), side _x];
		_near lbSetData [(lbSize _near)-1,str(_x)];
		_near_i lbAdd format["%1 - %2",GVAR_RNAME(_x), side _x];
		_near_i lbSetData [(lbSize _near)-1,str(_x)];
	};
} foreach _near_units;

if (DCASH > 0) then {
	_mstatus ctrlSetStructuredText parseText format["<img size='0.9' image='\union_pad\icons\icon-money-dcash.paa'/> <t size='0.85'>$%1</t><br/><img size='0.9' image='\union_pad\icons\icon-money-cash.paa'/> <t size='0.85'>$%2</t><br/><img size='0.9' image='\union_pad\icons\icon-money-bank.paa'/> <t size='0.85px'>$%3</t>",[DCASH] call UnionClient_system_numberText, [CASH] call UnionClient_system_numberText, [BANK] call UnionClient_system_numberText];
} else {
	_mstatus ctrlSetStructuredText parseText format["<img size='1' image='\union_pad\icons\icon-money-cash.paa'/> <t size='0.85'>$%1</t><br/><img size='0.9' image='\union_pad\icons\icon-money-bank.paa'/> <t size='0.85px'>$%2</t>",[CASH] call UnionClient_system_numberText, [BANK] call UnionClient_system_numberText];
};

if (FETCH_CONST(life_donator) > 0) then {
	_expoints ctrlSetStructuredText parseText format["<img size='1' image='\union_pad\icons\icon-vip.paa'/> <t size='0.85px'>" + localize "STR_PM_CurVipLvl" + "</t>",FETCH_CONST(life_donator)];
};

ctrlSetText[7211,format[localize "STR_PM_CurWeight", life_carryWeight, life_maxWeight]];