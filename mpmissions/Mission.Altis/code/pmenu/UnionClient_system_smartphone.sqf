/*

	Filename: 	UnionClient_system_smartphone.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private["_display","_units","_type","_data","_rowData","_msg","_west","_east","_civ","_ind","_usecash","_isPhone","_canUse"];
_type = [_this,0,0] call BIS_fnc_param;
_data = [_this,1,0,["",[],0]] call BIS_fnc_param;
_usecash = [_this,2,false,[false]] call BIS_fnc_param;

disableSerialization;
waitUntil {!isNull findDisplay 88888};

ctrlSetText [888907, M_CONFIG(getText,"LifeCfgPadSkins",life_myPadSkinID,"image")];

_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageList = _display displayCtrl 88882;
_cMessageHeader = _display displayCtrl 88886;
_cMessageHeader ctrlSetText format[localize "STR_SMARTPHONE_MESSAGETITLE"];

ctrlEnable[887892,false];

private _isPhone = [] call UnionClient_system_canUsePhone;
private _canUse = if (player GVAR ["tf_unable_to_use_radio",false]) then {false} else {true};

switch (_type) do {
	case 0: {
		lbClear _cPlayerList;

		_west = [];
		_east = [];
		_civ = [];
		_ind = [];

		{
			if (alive _x && {LSALIVE(_x)} && {_x != player} && {GVAR_RNAME(_x) != ""}) then {
				switch(side _x) do {
					case west: {
						if (_x getVariable ["coplevel",0] in [27,28]) then {
							_civ pushBack _x;
						} else {
							_west pushBack _x;
						};
					};
					case civilian: {_civ pushBack _x};
					case east: {_east pushBack _x};
					case independent: {_ind pushBack _x};
				};
			};
		} forEach playableUnits;

		{

			_cPlayerList lbAdd format["%1",GVAR_RNAME(_x)];
			if (_x getVariable ["coplevel",0] in [27,28]) then {
				_cPlayerList lbSetColor [(lbSize _cPlayerList)-1,[0.902,0.553,1,1]];
				} else {
				_cPlayerList lbSetColor [(lbSize _cPlayerList)-1,[0,0.588,1,1]];
				};
			_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
		} forEach _west;

		{
			_cPlayerList lbAdd format["%1",GVAR_RNAME(_x)];
			_cPlayerList lbSetColor [(lbSize _cPlayerList)-1,[1,0,0,1]];
			_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
		} forEach _east;

		{
			_cPlayerList lbAdd format["%1",GVAR_RNAME(_x)];
			_cPlayerList lbSetColor [(lbSize _cPlayerList)-1,[0,1,0,1]];
			_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
		} forEach _ind;

		{
			_cPlayerList lbAdd format["%1",GVAR_RNAME(_x)];
			_cPlayerList lbSetColor [(lbSize _cPlayerList)-1,[0.902,0.553,1,1]];
			_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
		} forEach _civ;

		[[steamid, player, count life_smartphoneCash],"msgRequest","TON",false] call UnionClient_system_hcExec;

		ctrlEnable[887892,false];
	};
	/*case 1: {

		if (_usecash) then {_data = life_smartphoneCash;} else {life_smartphoneCash = _data;};

		{
			_msg = [_x select 2,40] call UnionClient_kron_StrLeft;
			_rowData = [_x select 0, _x select 1, _x select 2, _x select 3];
			_cMessageList lnbAddRow[_x select 3,format["%1 ...",_msg]];
			_cMessageList lnbSetData[[((lnbSize _cMessageList) select 0)-1,0],str(_rowData)];
		} forEach (_data);
	};*/
	case 1:
	{   _msg = [_data select 2,40] call UnionClient_kron_StrLeft;
		_rowData = [_data select 0, _data select 1, _data select 2, _data select 3];
		_cMessageList lnbAddRow[_data select 3,format["%1 ...",_msg]];
		_cMessageList lnbSetData[[((lnbSize _cMessageList) select 0)-1,0],str(_rowData)];
	};

	case 2: {
		ctrlEnable[887892,true];
		life_smartphoneTarget = call compile format["%1",CONTROL_DATA(88881)];
	};

	case 3: {
		lbClear _cMessageList;
		[[player],"cleanupMessages"] call UnionClient_system_hcExec;
	};

	case 4: {
		if (_isPhone) then {
			if !(_canUse) exitWith {hint "Вы не можете пользоваться телефоном со связанными руками"};
			createDialog "UnionDialogSmartphoneTargetMessage";
			ctrlSetText[88886, format["Сообщение для: %1",name life_smartphoneTarget]];
			if(FETCH_CONST(life_adminlevel) < 1) then {
				ctrlShow[888897,false];
			};
		} else {
			hint localize "STR_SMARTPHONE_NoPhone";
		};
	};
};