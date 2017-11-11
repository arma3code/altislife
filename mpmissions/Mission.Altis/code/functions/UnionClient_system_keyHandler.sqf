/*

	Filename: 	UnionClient_system_keyHandler.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
params ["_ctrl","_code","_shift","_ctrlKey","_alt"];
private _handled = false;
private _cursorTarget = cursorObject;

if ([] call UnionClient_system_isInputBlocked && {!(_code in [15,207])}) exitWith {true};
if (_code in (actionKeys "NextChannel" + actionKeys "PrevChannel")) exitWith {true};
if (_code in (actionKeys "TacticalView" + actionKeys "SelectAll" + actionKeys "forceCommandingMode" + [11,14,59,60,61,62,63,64,65,66,67,68,36])) exitWith {true};

private _interactionKey = if (EQUAL((actionKeys "User10"),[])) then {219} else {(actionKeys "User10") select 0};
private _mapKey = (actionKeys "ShowMap") select 0;
private _interruptionKeys = [17,30,31,32];

if (life_action_inUse) exitWith {
	if (!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if (!(EQUAL((actionKeys "User10"),[])) && {(inputAction "User10" > 0)}) exitWith {
	if(!life_action_inUse) then {
		_cursorTarget spawn  {
			private _handle = [_this] spawn UnionClient_system_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

private ["_veh","_locked"];

switch (true) do {
	//Map Key
	case (EQUAL(_code,_mapKey)): {
		switch (playerSide) do {
			case west: {if(!visibleMap) then {[] spawn UnionClient_system_groupMarkers;}};
			case east: {if(!visibleMap) then {[] spawn UnionClient_system_medicMarkers;}};
			case civilian: {if(!visibleMap) then {[] spawn UnionClient_system_groupMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn UnionClient_system_groupMarkers;}};
		};
		if (!visibleMap) then {
			[] spawn UnionClient_markers_menuShow;
		};
	};

	case (EQUAL(_code,74)): {
		if(_shift) then {
			_handled = true;
			["SHIFTMINUS",format["%1 (%2) use shift minus endmission",GVAR_RNAME(player),steamid]] remoteExecCall ["TON_fnc_customLog",RSERV];
			[] spawn {
			   hint "Вы замороженны на 15 сек за Shift минус";
			   disableUserInput true;
			   uiSleep 15;
			   disableUserInput false;
			   hint "Вы разморожены";
			};
		};
	};
	case (EQUAL(_code,57)): {
		if (_shift && !_ctrlKey) then {
			_handled = true;
			if (NOTINVEH(player) && !dialog && !life_is_processing && !life_is_arrested && isNull life_DraggedBody) then {
				[] spawn UnionClient_actions_jump;
			};
		};
	};
	//Holster / recall weapon.
	case (EQUAL(_code,35)): {
		if (_shift && !_ctrlKey && !(EQUAL(CURWEAPON,""))) then {
			_handled = true;
			life_curWep_h = CURWEAPON;
			player action ["SwitchWeapon",player,player,100];
			player switchcamera cameraView;
		};

		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {!(EQUAL(life_curWep_h,""))} && {life_curWep_h in [RIFLE,PISTOL,LAUNCHER]}) then {
			_handled = true;
			player selectWeapon life_curWep_h;
		};
	};

	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case (EQUAL(_code,_interactionKey)): {
		if (!life_action_inUse) then {
			_cursorTarget spawn {
				private _handle = [_this] spawn UnionClient_system_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};

	//Restraining (Shift + R)
	case (EQUAL(_code,19)): {
		if(_shift) then {
			_handled = true;
			switch(true) do {
				case (EQUAL(playerSide,west)): {
					if(!isNull _cursorTarget && {_cursorTarget isKindOf "Man"} && {isPlayer _cursorTarget} && {LSALIVE(_cursorTarget)} && {_cursorTarget distance player < 3.5} && {!(_cursorTarget GVAR ["restrained",false])} && {speed _cursorTarget < 1}) then {
						[_cursorTarget] call UnionClient_system_restrainAction;
					};
				};

				case (EQUAL(playerSide,east) && {life_medicLevel > 4}): {
					if (!isNull _cursorTarget && {_cursorTarget isKindOf "Man"} && {isPlayer _cursorTarget} && {LSALIVE(_cursorTarget)} && {_cursorTarget distance player < 3.5} && {!(_cursorTarget GVAR ["restrained",false])} && {speed _cursorTarget < 1}) then {
						[_cursorTarget] call UnionClient_system_restrainAction;
					};
				};

				case (playerSide in [civilian,independent]): {
					if(!isNull _cursorTarget && {_cursorTarget isKindOf "Man"} && {isPlayer _cursorTarget} && {LSALIVE(_cursorTarget)} && {_cursorTarget distance player < 3.5} && {!(_cursorTarget GVAR ["restrained",false])} && {speed _cursorTarget < 1} && {(_cursorTarget GVAR ["knoked",false]) OR (_cursorTarget GVAR ["tazed",false]) OR (_cursorTarget GVAR ["surrender",false])}) then {
						if (["extItem_ducttape"] call UnionClient_system_removeItem) then {
							[_cursorTarget] call UnionClient_system_restrainAction;
						} else {hint "Вам нечем связать свою жертву. Попробуйте клейкую ленту, к примеру..."};
					};
				};
			};
		};
	};

	//Knock out, this is experimental && yeah...
	case (EQUAL(_code,34)): {
		if(_shift) then {
			_handled = true;
			if (!isNull _cursorTarget && {!(EQUAL(playerSide,east))} && {_cursorTarget isKindOf "Man"} && {isPlayer _cursorTarget} && {LSALIVE(_cursorTarget)} && {_cursorTarget distance player < 4} && {speed _cursorTarget < 1}) then {
				if (!(_cursorTarget GVAR ["knoked",false]) && (EQUAL(CURWEAPON,RIFLE) OR EQUAL(CURWEAPON,PISTOL)) && !(EQUAL(CURWEAPON,"")) && !life_knockout) then {
					[_cursorTarget] spawn UnionClient_system_knockoutAction;
				};
			};
		};

		if (!_shift && !_alt && !_ctrlKey && EQUAL(playerSide,west) && !(NOTINVEH(player))) then {[] call UnionClient_system_copOpener;};
	};

	//T Key (Trunk)
	case (EQUAL(_code,20)): {
		if(!_alt && !_ctrlKey && !_shift) then {
			_handled = true;
			[] spawn UnionClient_system_openInventory;
		};
	};

	//L Key?
	case (EQUAL(_code,38)): {
		if(_shift && playerSide in [west,east]) then {
			_handled = true;
			if(!(NOTINVEH(player)) && {(typeOf (objectParent player)) in (LIFE_SETTINGS(getArray,"life_vehiclesWithLights"))}) then {
				if (EQUAL(playerSide,west)) then {[objectParent player] call UnionClient_system_sirenLights} else {[objectParent player] call UnionClient_system_medicSirenLights};
			};
		};
		if(!_alt && !_ctrlKey) then {[] call UnionClient_system_radar;};
	};

	//Y Player Menu
	case (EQUAL(_code,21)): {
		if(!_alt && !_ctrlKey && !dialog && !life_is_processing) then {
			[] spawn UnionClient_pad_openMain;
			_handled = true;
		};
	};

	//F Key
	case (EQUAL(_code,33)): {
		if(_shift && {playerSide in [west,east]} && {!(NOTINVEH(player))} && {EQUAL((driver objectParent player),player)} && {!life_siren_active}) then {
			_handled = true;
			[] spawn {
				life_siren_active = true;
				uiSleep 3;
				life_siren_active = false;
			};
			_veh = objectParent player;
			if (_veh GVAR ["siren",false]) then	{
				titleText ["Вы выключили сирену", "PLAIN"];
				[_veh,"siren"] call UnionClient_system_clearGlobalVar;
			} else {
				_veh SVAR ["siren",true,true];
				titleText ["Вы включили сирену", "PLAIN"];
				if (EQUAL(playerSide,west)) then {
					[_veh] remoteExec ["UnionClient_system_copSiren",RCLIENT];
				} else {
					[_veh] remoteExec ["UnionClient_system_medicSiren",RCLIENT];
				};
			};
		};
	};

	//U Key
	case (EQUAL(_code,22)): {
		if(!_alt && !_ctrlKey) then {
			_handled = true;
			private["_pkpz_kavala","_pkpz_atira","_locked_kpz"];
			_pkpz_kavala = nearestObject [[3295.19,12435.9,0],"Land_Cargo_House_V1_F"];
			_pkpz_atira = nearestObject [[15273.9,17444.2,0],"Land_Cargo_House_V1_F"];

			if(_cursorTarget in [_pkpz_kavala,_pkpz_atira] && {player distance _cursorTarget < 10} && {EQUAL(playerSide,west)}) exitWith {
				_locked_kpz = _cursorTarget GVAR [format["bis_disabled_Door_1"],0];

				if(_locked_kpz == 0) then {
					_cursorTarget SVAR ["bis_disabled_Door_1",1,true];
					_cursorTarget animate [format["door_1_rot"],0];
					systemChat "КПЗ заркыто";
				} else {
					_cursorTarget SVAR ["bis_disabled_Door_1",0,true];
					_cursorTarget animate [format["door_1_rot"],1];
					systemChat "КПЗ открыто";
				};
			};

			if (((typeOf _cursorTarget) == LIFE_SETTINGS(getText,"life_trunkClass")) && {player distance _cursorTarget < 5}) exitWith {
				private _gTrunk = _cursorTarget;
				private _gTrunkCfgClass = _gTrunk GVAR ["varDB",""];
				if (EQUAL(_gTrunkCfgClass,"")) exitWith {};

				private _trunkSide = M_CONFIG(getText,"LifeCfgTrunks",_gTrunkCfgClass,"side");
				private _flag = [playerSide] call UnionClient_system_convertSide;
				if !(EQUAL(_flag,_trunkSide)) exitWith {};

				private _conditions = M_CONFIG(getText,"LifeCfgTrunks",_gTrunkCfgClass,"conditions");
				if !([_conditions] call UnionClient_system_conditionsCheck) exitWith {};

				if (_gTrunk GVAR ["locked",false]) then {
					[_gTrunk,"locked"] call UnionClient_system_clearGlobalVar;
					if (EQUAL((typeOf _gTrunk),"Metal_Locker_F")) then {
						if ((_gTrunk animationPhase 'Metal_Locker_Rotation') < 0.5) then {_gTrunk animate ["Metal_Locker_Rotation", 1]};
					};
					hint "Контейнер банды открыт";
				} else {
					_gTrunk SVAR ["locked",true,true];
					if (EQUAL((typeOf _gTrunk),"Metal_Locker_F")) then {
						if ((_gTrunk animationPhase 'Metal_Locker_Rotation') >= 0.5) then {_gTrunk animate ["Metal_Locker_Rotation", 0]};
					};
					hint "Контейнер банды закрыт";
				};
			};

			if(NOTINVEH(player)) then {
				_veh = _cursorTarget;
			} else {
				_veh = objectParent player;
			};

			if(_veh isKindOf "House_F") then {
				if((_veh in life_vehicles OR _veh in life_tempHouses) && player distance _veh < 15) then {
					private _door = [_veh] call UnionClient_system_nearestDoor;
					if(EQUAL(_door,0)) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh GVAR [format["bis_disabled_Door_%1",_door],0];
					if(EQUAL(_locked,0)) then {
						_veh SVAR [format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					} else {
						_veh SVAR [format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 8) then {
					if(EQUAL(_locked,2)) then {
						if(local _veh) then {
							[_veh,0] call UnionClient_system_lockVehicle;
						} else {
							[_veh,0] remoteExecCall ["UnionClient_system_lockVehicle",_veh];
						};
						systemChat localize "STR_MISC_VehUnlock";
						player say3D "unlock";
					} else {
						if(local _veh) then {
							[_veh,2] call UnionClient_system_lockVehicle;
						} else {
							[_veh,2] remoteExecCall ["UnionClient_system_lockVehicle",_veh];
						};
						systemChat localize "STR_MISC_VehLock";
						player say3D "car_lock";
					};
				};
			};
		};
	};

	case (EQUAL(_code,62)): {
		if(_alt && !_shift) then {
			[1,format["Сервер: %1 нажал ALT+F4! Возможно, что для релога во время RP (Сообщите Админу)",GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",RCLIENT];
			_handled = true;
			if (!isnull (findDisplay 602)) then {
				[] call UnionClient_system_saveGear;
			};
		};
    };

    case (EQUAL(_code,15)): {
		if(_alt && !_shift) then {
			//[0,format["Сервер: %1 нажал ALT+TAB! Возможно, что для релога во время RP (Сообщите Админу)",GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",RCLIENT];
			_handled = true;
			if (!isnull (findDisplay 602)) then {
				[] call UnionClient_system_saveGear;
			};
		};
    };

    case (EQUAL(_code,211)): {
		if(_ctrlKey && _alt)  then {
			[1,format["Сервер: %1 нажал CTRL + ALT + DEL!  Возможно, что для релога во время RP (Сообщите Админу)",GVAR_RNAME(player)]] remoteExecCall ["UnionClient_system_broadcast",RCLIENT];
			_handled = true;
			if (!isnull (findDisplay 602)) then {
				[] call UnionClient_system_saveGear;
			};
		};
    };

	//shift+v сдаться
	case (EQUAL(_code,47)): {
		if (_shift) then {
			_handled = true;
			if (NOTINVEH(player) && !life_is_processing && !life_action_inUse && isNull life_DraggedBody) then {
				if (player GVAR ["surrender",false]) then {
					[player,"surrender"] call UnionClient_system_clearGlobalVar;
					systemChat "Вы опустили руки";
				} else {
					[] spawn UnionClient_system_surrender;
					systemChat "Вы сдались и закинули руки за голову! Нажмите Shift+V, чтобы опустить руки.";
				};
			};

		};
	};

	//Dance menu(Shift + Num 1)
	case (EQUAL(_code,79)): {
		if(_shift) then {
			_handled = true;
			if (NOTINVEH(player) && !dialog && !life_is_processing && !life_is_arrested && isNull life_DraggedBody) then {
				[] spawn UnionClient_gestures_danceMenu;
			};
		};
	};

	//Gesture menu(Shift + Num 2)
	case (EQUAL(_code,80)): {
		if(_shift) then {
			_handled = true;
			if (NOTINVEH(player) && !dialog && !life_is_processing && !life_is_arrested && !life_dance && isNull life_DraggedBody) then {
				[] spawn UnionClient_system_gestureMenu;
			};
		};
	};

	//Gesture menu 2(Shift + Num 3)
	case (EQUAL(_code,81)): {
		if(_shift) then {
			_handled = true;
			if (NOTINVEH(player) && !dialog && !life_is_processing && !life_is_arrested && !life_dance && isNull life_DraggedBody) then {
				[] spawn UnionClient_system_gestureMenuFun;
			};
		};
	};

	//(Shift + Num 4)
	case (EQUAL(_code,75)): {
		if (_shift && !dialog && (life_coplevel > 1)) then {
			[] call UnionClient_vehdatabase_Menu;
			_handled = true;
		};
	};

	//(Shift + Num 5)
	case (EQUAL(_code,76)): {
		if (_shift && !dialog && (life_coplevel > 1 OR life_canUseWarZone OR life_civlevel > 2 OR life_reblevel > 2)) then {
			[] call UnionClient_martiallaw_listWarPoints;
			_handled = true;
		};
	};

	//(Shift + Num 6)
	case (EQUAL(_code,77)): {
		if(_shift && !dialog && (EQUAL(PUNIFORM,"xmas_santa_opfor_uniform")) && (EQUAL(PBACKPACK,"Extremo_santa_backpack")) && (FETCH_CONST(life_donator) > 0)) then {
			if (time - life_santa_delay < 30) exitWith {hint "Не чаще одного раза в 30 секунд..."};
			life_santa_delay = time;
			[player,"SantaSound"] remoteExec ["UnionClient_system_say3D",RCLIENT];
			_handled = true;
		};
	};

	//(Shift + Num 7)
	case (EQUAL(_code,71)): {
		if(_shift && !dialog && life_coplevel > 1) then {
			[] spawn UnionClient_message_copToTargetMenu;
			_handled = true;
		};
	};

	//Shift+End = Faded Sound
	case (EQUAL(_code,207)): {
		if (_shift && !dialog) then {
			[] call UnionClient_system_fadeSound;
			_handled = true;
		};
	};

	//Shift+P = Phone
	case (EQUAL(_code,25)): {
		if (_shift && !dialog) then {
			[0] spawn UnionClient_system_OpenPhone;
			_handled = true;
		};
	};

	//Shift+O = 911 phone
	case (EQUAL(_code,24)): {
		if (_shift && !dialog) then {
			[1] spawn UnionClient_system_OpenPhone;
			_handled = true;
		};
	};

	//Shift+I = Wanted menu
	case (EQUAL(_code,23)): {
		if (_shift && !dialog) then {
			if (playerSide in [west,east]) then {[] spawn UnionClient_system_wantedMenu;};
			_handled = true;
		};
	};

	case (_code in [2,3,4,5,6,7,8,9,10]): {
		_handled = true;
		if (!_shift && NOTINVEH(player) && !dialog && !life_is_processing && !life_dance && isNull life_DraggedBody) then {
			private["_gesture"];
			_gesture = switch (_code) do {
				case 2 : {"CRPTHSHold"};
				case 3 : {"CRPTHSForward"};
				case 4 : {"CRPTHSWarning"};
				case 5 : {"CRPTHSPoint"};
				case 6 : {"cl3_yes"};
				case 7 : {"cl3_no_way"};
				case 8 : {"cl3_thumbs_up"};
				case 9 : {"cl3_thumbs_down"};
				case 10 : {"cl3_clapping"};
				default {"CRPTHSHold"};
			};
			[_gesture] call UnionClient_gestures_playAction;
		};
	};
};

_handled;