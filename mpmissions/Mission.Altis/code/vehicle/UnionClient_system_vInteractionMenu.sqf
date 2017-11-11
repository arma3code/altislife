/*
	
	Filename: 	UnionClient_system_vInteractionMenu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _curTarget = param [0,ObjNull,[ObjNull]];
if (isNull _curTarget) exitWith {}; //Bad target
if !([_curTarget] call UnionClient_system_isVehicleKind) exitWith {};
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

life_vInact_curTarget = _curTarget;

//Set Repair Action
_Btn1 ctrlSetText localize "STR_vInAct_Repair";
_Btn1 buttonSetAction "[life_vInact_curTarget] spawn UnionClient_system_repairTruck; closeDialog 0;";

if("extItem_ItemRepairKit" in (items player) && (damage _curTarget < 1)) then {_Btn1 ctrlEnable true} else {_Btn1 ctrlEnable false};

switch (true) do { 
	case (ISPSIDE(west)) : {
		_Btn2 ctrlSetText localize "STR_vInAct_Registration";
		_Btn2 buttonSetAction "[life_vInact_curTarget] spawn UnionClient_system_searchVehAction; closeDialog 0;";
		
		_Btn3 ctrlSetText localize "STR_vInAct_SearchVehicle";
		_Btn3 buttonSetAction "[life_vInact_curTarget] spawn UnionClient_system_vehInvSearch;";
		
		_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
		_Btn4 buttonSetAction "[life_vInact_curTarget] spawn UnionClient_system_pulloutAction; closeDialog 0;";
		if (EQUAL(crew _curTarget,[])) then {_Btn4 ctrlEnable false};
		
		_Btn5 ctrlSetText localize "STR_vInAct_Impound";
		_Btn5 buttonSetAction "[life_vInact_curTarget] spawn UnionClient_system_impoundAction; closeDialog 0;";

		_Btn6 ctrlSetText localize "STR_vInAct_ImpoundParking";
		_Btn6 buttonSetAction "[life_vInact_curTarget] spawn UnionClient_parking_CopMenu;";
		//_Btn6 ctrlEnable false;
		
		if (_curTarget isKindOf "Ship") then {
			_Btn7 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn7 buttonSetAction "[] spawn UnionClient_system_pushObject; closeDialog 0;";
			if (_curTarget isKindOf "Ship" && {local _curTarget} && {EQUAL(crew _curTarget,[])}) then {_Btn7 ctrlEnable true} else {_Btn7 ctrlEnable false};
		} else {
			if (typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
				_Btn7 ctrlSetText localize "STR_vInAct_GetInKart";
				_Btn7 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
				if (EQUAL(crew _curTarget,[]) && {canMove _curTarget} && {EQUAL(locked _curTarget,0)}) then {_Btn7 ctrlEnable true} else {_Btn7 ctrlEnable false};
			} else {
				_Btn7 ctrlSetText localize "STR_vInAct_Unflip";
				_Btn7 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
				
				if (EQUAL(crew _curTarget,[])) then {_Btn7 ctrlEnable true} else {_Btn7 ctrlEnable false};
			};
		};

		_Btn8 ctrlSetText "Уничтожить";
		_Btn8 buttonSetAction "[life_vInact_curTarget] spawn UnionClient_vehicles_destroyAction; closeDialog 0;";
		if (life_coplevel < 6) then {_Btn8 ctrlEnable false};
		
		_Btn6Half ctrlShow false;
		_Jtime ctrlShow false;			
		_Btn9 ctrlShow False;
		_Btn10 ctrlShow False;
		_Btn11 ctrlShow False;
		_Btn12 ctrlShow False;

	}; 
	case (ISPSIDE(east)) : {
		_Btn2 ctrlSetText localize "STR_vInAct_Registration";
		_Btn2 buttonSetAction "[life_vInact_curTarget] spawn UnionClient_system_searchVehAction; closeDialog 0;";
		
		_Btn3 ctrlSetText localize "STR_vInAct_PullOut";
		_Btn3 buttonSetAction "[life_vInact_curTarget] spawn UnionClient_system_pulloutAction; closeDialog 0;";
		if (EQUAL(crew _curTarget,[])) then {_Btn3 ctrlEnable false};
		
		_Btn4 ctrlSetText localize "STR_vInAct_Impound";
		_Btn4 buttonSetAction "[life_vInact_curTarget] spawn UnionClient_system_impoundAction; closeDialog 0;";	
		
		
		if (_curTarget isKindOf "Ship") then {
			_Btn5 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn5 buttonSetAction "[] spawn UnionClient_system_pushObject; closeDialog 0;";
			if (_curTarget isKindOf "Ship" && {local _curTarget} && {EQUAL(crew _curTarget,[])}) then { _Btn5 ctrlEnable true} else {_Btn5 ctrlEnable false};
		} else {
			if ((typeOf _curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
				_Btn5 ctrlSetText localize "STR_vInAct_GetInKart";
				_Btn5 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
				if (EQUAL(crew _curTarget,[]) && {canMove _curTarget} && {EQUAL(locked _curTarget,0)}) then {_Btn5 ctrlEnable true} else {_Btn5 ctrlEnable false};
			} else {
				_Btn5 ctrlSetText localize "STR_vInAct_Unflip";
				_Btn5 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
				if (EQUAL(crew _curTarget,[])) then {_Btn5 ctrlEnable true} else {_Btn5 ctrlEnable false};
			};
		};
		
		_Btn6 ctrlSetText "Модификации";
		_Btn6 buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn UnionClient_adac_Menu;";
		
		_Btn7 ctrlSetText "Вытащить трупы";
		_Btn7 buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn UnionClient_system_deadMoveOut;";
		
		_Btn6Half ctrlShow false;
		_Jtime ctrlShow false;	
		_Btn8 ctrlShow False;
		_Btn9 ctrlShow False;
		_Btn10 ctrlShow False;
		_Btn11 ctrlShow False;
		_Btn12 ctrlShow False;
	}; 
	default {
		private _vehData = _curTarget GVAR ["vehicle_info_owners",[]];
		private _vehOwner = (_vehData select 0) select 0;

		_Btn2 ctrlSetText localize "STR_vInAct_Registration";
		_Btn2 buttonSetAction "[life_vInact_curTarget] spawn UnionClient_system_searchVehAction; closeDialog 0;";
		
		if (_curTarget isKindOf "Ship") then {
			_Btn3 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn3 buttonSetAction "[] spawn UnionClient_system_pushObject; closeDialog 0;";
			if (_curTarget isKindOf "Ship" && {local _curTarget} && {EQUAL(crew _curTarget,[])}) then {_Btn3 ctrlEnable true} else {_Btn3 ctrlEnable false};
		} else {
			if ((typeOf _curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
				_Btn3 ctrlSetText localize "STR_vInAct_GetInKart";
				_Btn3 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
				if (EQUAL(crew _curTarget,[]) && {canMove _curTarget} && {EQUAL(locked _curTarget,0)}) then {_Btn3 ctrlEnable true} else {_Btn3 ctrlEnable false};
			} else {
				_Btn3 ctrlSetText localize "STR_vInAct_Unflip";
				_Btn3 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
				if (EQUAL(crew _curTarget,[]) && {_curTarget in life_vehicles}) then {_Btn3 ctrlEnable true} else {_Btn3 ctrlEnable false};
			};
		};
		
		if (EQUAL((typeOf _curTarget),"O_Truck_03_device_F")) then {
			_Btn4 ctrlSetText localize "STR_vInAct_DeviceMine";
			_Btn4 buttonSetAction "[life_vInact_curTarget] spawn UnionClient_system_deviceMine; closeDialog 0;";
			if (!isNil {(_curTarget GVAR "mining")} && !(_curTarget in life_vehicles)) then {_Btn4 ctrlEnable false} else {_Btn4 ctrlEnable true};
		} else {
			_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
			_Btn4 buttonSetAction "[life_vInact_curTarget] spawn UnionClient_system_pulloutAction; closeDialog 0;";
			if (EQUAL(steamid,_vehOwner) OR (_curTarget in life_vehicles) OR (!(canMove _curTarget)) OR !(EQUAL(crew _curTarget,[])) && (_curTarget getHitPointDamage "HitLFWheel" > 0.65) && (_curTarget getHitPointDamage "HitRFWheel" > 0.65)) then {_Btn4 ctrlEnable true} else {_Btn4 ctrlEnable false};
		};
		
		if (("extItem_lockpick" in (magazines player)) && !(_curTarget in life_vehicles)) then {
			_Btn5 ctrlSetText "Взломать технику";
			_Btn5 buttonSetAction "[life_vInact_curTarget] spawn UnionClient_system_lockpick; closeDialog 0;";
		} else {_Btn5 ctrlShow false};
				
		_Btn6 ctrlShow false;
		_Btn6Half ctrlShow false;
		_Jtime ctrlShow false;	
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow False;
		_Btn9 ctrlShow False;
		_Btn10 ctrlShow False;
		_Btn11 ctrlShow False;
		_Btn12 ctrlShow False;
	}; 
};