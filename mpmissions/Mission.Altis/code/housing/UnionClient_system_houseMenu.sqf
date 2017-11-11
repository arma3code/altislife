/*

	Filename: 	UnionClient_system_houseMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
params [
	["_curTarget",ObjNull,[ObjNull]],
	["_message","",[""]]
];
if (isNull _curTarget) exitWith {}; //Bad target
if (ISPSIDE(east)) exitWith {};
if (dialog) exitWith {};

createDialog "UnionDialogPlayerInteraction";
waitUntil {!isNull (findDisplay 37400)};

private _Btn1 = CONTROL(37400,37402);
private _Btn2 = CONTROL(37400,37403);
private _Btn3 = CONTROL(37400,37404);
private _Btn4 = CONTROL(37400,37405);
private _Btn5 = CONTROL(37400,37406);
private _Btn6Half = CONTROL(37400,37407);
private _Jtime = CONTROL(37400,37408);
private _Btn6 = CONTROL(37400,37409);
private _Btn7 = CONTROL(37400,37410);
private _Btn8 = CONTROL(37400,37411);
private _Btn9 = CONTROL(37400,37412);
private _Btn10 = CONTROL(37400,37413);
private _Btn11 = CONTROL(37400,37414);
private _Btn12 = CONTROL(37400,37415);

{
	_x ctrlShow false;
} forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn6Half,_Jtime,_Btn7,_Btn8,_Btn9,_Btn10,_Btn11,_Btn12];

life_pInact_curTarget = _curTarget;

switch (true) do { 
	case (ISPSIDE(west)) : {
		_Btn1 ctrlSetText localize "STR_House_Raid_Owner";
		_Btn1 buttonSetAction "[life_pInact_curTarget] call UnionClient_system_copHouseOwner;";
		_Btn1 ctrlShow true;
		
		_Btn2 ctrlSetText localize "STR_pInAct_BreakDown";
		_Btn2 buttonSetAction "[life_pInact_curTarget] spawn UnionClient_system_copBreakDoor; closeDialog 0;";
		_Btn2 ctrlShow true;
	
		private _door = [_curTarget] call UnionClient_system_nearestDoor;
		if (EQUAL(_door,0)) then {_Btn2 ctrlEnable false};
	
		_Btn5 ctrlSetText "Обыск ресурсов";
		_Btn5 buttonSetAction "[life_pInact_curTarget] spawn UnionClient_system_raidHouse; closeDialog 0;";
		_Btn5 ctrlShow true;			
		
		_Btn6 ctrlSetText "Обыск снаряги";
		_Btn6 buttonSetAction "[life_pInact_curTarget] spawn UnionClient_system_raidHouseWeapon; closeDialog 0;";
		_Btn6 ctrlShow true;
		
		if (_curTarget GVAR ["locked",false]) then {
			_Btn4 ctrlSetText localize "STR_pInAct_UnlockStorage";
			_Btn5 ctrlEnable false;
			_Btn6 ctrlEnable false;
		} else {
			_Btn4 ctrlSetText localize "STR_pInAct_LockStorage";
		};
		_Btn4 buttonSetAction "[life_pInact_curTarget] call UnionClient_system_lockHouse; closeDialog 0;";
		_Btn4 ctrlShow true;
	
		if !(_curTarget in life_vehicles) then {_Btn4 ctrlEnable false; _Btn5 ctrlEnable false; _Btn6 ctrlEnable false;}
	}; 	
	default { 
		if (!(_curTarget in (life_vehicles + life_tempHouses)) OR isNil {_curTarget GVAR "house_owner"}) then {
			if (_curTarget in life_vehicles) then {life_vehicles = life_vehicles - [_curTarget]};
			if (_curTarget in life_tempHouses) then {life_tempHouses = life_tempHouses - [_curTarget]};
			
			_Btn1 ctrlSetText localize "STR_pInAct_BuyHouse";
			_Btn1 buttonSetAction "[life_pInact_curTarget] spawn UnionClient_system_buyHouse;";
			_Btn1 ctrlShow true;
			
			if (!isNil {_curTarget GVAR "house_owner"}) then {
				_Btn1 ctrlEnable false;
			};
		} else {
			private _numberCrates = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _curTarget,"numberCrates");
			if (EQUAL(_numberCrates,0)) then {
				_Btn1 ctrlSetText localize "STR_pInAct_SellGarage";
				_Btn1 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn UnionClient_system_sellHouse;";
				_Btn1 ctrlShow true;
				
				if (((_curTarget GVAR "house_owner") select 0) != (steamid)) then {
					_Btn1 ctrlEnable false;
				};
				
				_Btn2 ctrlSetText localize "STR_pInAct_AccessGarage";
				_Btn2 buttonSetAction "closeDialog 0; [life_pInact_curTarget,""Car""] spawn UnionClient_garage_HouseMenu;";
				_Btn2 ctrlShow true;
				
				_Btn3 ctrlSetText localize "STR_pInAct_StoreVeh";
				_Btn3 buttonSetAction "closeDialog 0; [true] spawn UnionClient_system_storeVehicle;";
				_Btn3 ctrlShow true;
			} else {
				_Btn1 ctrlSetText localize "STR_pInAct_SellHouse";
				_Btn1 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn UnionClient_system_sellHouse;";
				_Btn1 ctrlShow true;
	
				if (isNull (_curTarget GVAR ["lightSource",ObjNull])) then {
					_Btn2 ctrlSetText localize "STR_pInAct_LightsOn";
				} else {
					_Btn2 ctrlSetText localize "STR_pInAct_LightsOff";
				};
	
				_Btn2 buttonSetAction "[life_pInact_curTarget] call UnionClient_system_lightHouseAction; closeDialog 0;";
				_Btn2 ctrlShow true;
	
				_Btn4 ctrlSetText "Добавить слот";
				_Btn4 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn UnionClient_system_houseModAddSlot";
				_Btn4 ctrlShow true;			
				
				_house_box = _curTarget GVAR["house_box",objNull];
				if (!isNull _house_box) then {
					_house_box_slots = _house_box GVAR ["house_box_slots",0];		
					if (_house_box_slots < _numberCrates) then {
						_Btn4 ctrlEnable true;
					} else {
						_Btn4 ctrlEnable false;
					};
				} else {_Btn4 ctrlEnable false;};
	
				if (((_curTarget GVAR "house_owner") select 0) != (steamid)) then {
					_Btn1 ctrlEnable false; _Btn4 ctrlEnable false;
				};
	
				if (_curTarget GVAR ["locked",false]) then {
					_Btn5 ctrlSetText localize "STR_pInAct_UnlockStorage";
				} else {
					_Btn5 ctrlSetText localize "STR_pInAct_LockStorage";
				};

				_Btn5 buttonSetAction "[life_pInact_curTarget] call UnionClient_system_lockHouse; closeDialog 0;";
				_Btn5 ctrlShow true;
	
				private _canGarage = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _curTarget,"canGarage");
				if (EQUAL(_canGarage,1)) then {
					_Btn6 ctrlSetText localize "STR_pInAct_AccessGarage";
					_Btn6 buttonSetAction "closeDialog 0; [life_pInact_curTarget,""Car""] spawn UnionClient_garage_HouseMenu;";
					_Btn6 ctrlShow true;
		
					_Btn7 ctrlSetText localize "STR_pInAct_StoreVeh";
					_Btn7 buttonSetAction "closeDialog 0; [true] spawn UnionClient_system_storeVehicle;";
					_Btn7 ctrlShow true;
				};
	
				if !(_curTarget in (life_vehicles + life_tempHouses)) then {
					_Btn2 ctrlEnable false;
					_Btn5 ctrlEnable false;
					_Btn6 ctrlEnable false;
					_Btn7 ctrlEnable false;
				};
			};
		};
	}; 
};

if !(EQUAL(_message,"")) then {
	systemChat format ["%1",_message];
};