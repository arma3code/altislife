/*

	Filename: 	UnionClient_spyglass_menuCheck.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
disableSerialization;

private _displays = [
	[3030,"BIS_configviewer_display"],["RscDisplayMultiplayer","RscDisplayMultiplayer"],[162,"RscDisplayFieldManual"],["RscDisplayRemoteMissions","RscDisplayRemoteMissions"],[316000,"RscDisplayDebugPublic"],[125,"RscDisplayEditDiaryRecord"],
	[69,"UnknownDisplay"],[19,"UnknownDisplay"],[71,"UnknownDisplay"],[45,"UnknownDisplay"],[132,"UnknownDisplay"],[32,"UnknownDisplay"],[165,"RscDisplayPublishMission"],[2727,"RscDisplayLocWeaponInfo"],
	["RscDisplayMovieInterrupt","RscDisplayMovieInterrupt"],[157,"UnknownDisplay"],[30,"UnknownDisplay"],["RscDisplayArsenal","RscDisplayArsenal"],[166,"RscDisplayPublishMissionSelectTags"],[167,"RscDisplayFileSelect"]
];

private _detection = false;
private _timeStamp = 0;

private["_display"];
while {true} do {
	{
		_targetDisplay = _x select 0;
		_targetName = _x select 1;
		switch(typeName _targetDisplay) do {
			case (typeName ""): {if(!isNull (GVAR_UINS [_targetDisplay,displayNull])) exitWith {_detection = true;};};
			default {if(!isNull (findDisplay _targetDisplay)) exitWith {_detection = true;};};
		};

		if(_detection) exitWith {
			[steamid,0,format["Menu Based Hack D-%1",_targetDisplay],format["MenuBasedHack_%1 - %2",_targetName,_targetDisplay]] remoteExecCall ["TON_fnc_rcon",RSERV];
		};
	} foreach _displays;

	if(_detection) exitWith {};

	/* A very old menu that can cause false-positives so we close it */
	if(!isNull (findDisplay 129)) then {
		closeDialog 0;
	};

	if(!isNull (findDisplay 148)) then {
		uiSleep 0.5;
		if((lbSize 104)-1 > 3) exitWith {
			closeDialog 0;
			[steamid,0,"Menu Based Hack D-148", "findDisplay 148"] remoteExecCall ["TON_fnc_rcon",RSERV];
		};
	};

	_display = findDisplay 54;
	if(!isNull _display) then {
		{
			if (_x && !isNull _display) exitWith {
				closeDialog 0;
				[steamid,0,"Menu Based Hack D-54","MenuBasedHack_RscDisplayInsertMarker"] remoteExecCall ["TON_fnc_rcon",RSERV];
			};
		} forEach [
			(toLower ctrlText (_display displayCtrl 1001) != toLower localize "STR_A3_RscDisplayInsertMarker_Title"),
			{if (buttonAction (_display displayCtrl _x) != "") exitWith {true}; false} forEach [1,2]
		];
	};

	_display = findDisplay 131;
	if(!isNull _display) then {
		//These shouldn't be here...
		(_display displayCtrl 102) ctrlRemoveAllEventHandlers "LBDblClick";
		(_display displayCtrl 102) ctrlRemoveAllEventHandlers "LBSelChanged";

		{
			if (_x && !isNull _display) exitWith {
				closeDialog 0;
				[steamid,0,"Menu Based Hack D-131","MenuBasedHack_RscDisplayConfigureAction"] remoteExecCall ["TON_fnc_rcon",RSERV];
			};
		} forEach [
			(toLower ctrlText (_display displayCtrl 1000) != toLower localize "STR_A3_RscDisplayConfigureAction_Title"),
			{if (buttonAction (_display displayCtrl _x) != "") exitWith {true}; false} forEach [1,104,105,106,107,108,109]
		];
	};

	_display = findDisplay 163;
	if(!isNull _display) then {
		(_display displayCtrl 101) ctrlRemoveAllEventHandlers "LBDblClick";
		(_display displayCtrl 101) ctrlRemoveAllEventHandlers "LBSelChanged";

		{
			if (_x && !isNull _display) exitWith {
				closeDialog 0;
				[steamid,0,"Menu Based Hack D-163","MenuBasedHack_RscDisplayControlSchemes"] remoteExecCall ["TON_fnc_rcon",RSERV];
			};
		} forEach [
			(toLower ctrlText (_display displayCtrl 1000) != toLower localize "STR_DISP_OPTIONS_SCHEME"),
			{if (buttonAction (_display displayCtrl _x) != "") exitWith {true}; false} forEach [1,2]
		];
	};

	/* We'll just move the no-recoil check into this thread. */
	if((unitRecoilCoefficient player) > -1  && (unitRecoilCoefficient player) < 1) then {
		["CHEATS",[format["unitRecoilCoefficient %1",unitRecoilCoefficient player]],profileName,steamid] remoteExecCall ["TON_fnc_customLog",RSERV];
		[steamid,0,"Menu Based Recoil Hack ","No_recoil_hack"] remoteExecCall ["TON_fnc_rcon",RSERV];
	};

	/*
		Display Validator
		Loops through and makes sure none of the displays were modified..

		Checks every 10 minutes.
	*/
	if (((time - _timeStamp) > 600) OR (EQUAL(_timeStamp,0))) then {
		if (true) exitWith {};
		_timeStamp = time;
		{
			_onLoad = getText(configFile >> (_x select 0) >> "onLoad");
			_onUnload = getText(configFile >> (_x select 0) >> "onUnload");
			if(_onLoad != (_x select 1) OR _onUnload != (_x select 2)) exitWith {
				failMission "SpyGlassAddons";
			};
		} foreach [
			["RscDisplayMainMap","[""onLoad"",_this,""RscDiary"",'GUI'] call  (uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDiary"",'GUI'] call  (uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayMain","[""onLoad"",_this,""RscDisplayMain"",'GUI'] call compile preprocessfilelinenumbers ""union_config\scripts\initDisplay.sqf"",[""onUnload"",_this,""RscDisplayMain"",'GUI'] call compile preprocessfilelinenumbers ""union_config\scripts\initDisplay.sqf"""],
			["RscDisplayGetReady","[""onLoad"",_this,""RscDiary"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDiary"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayInventory","[""onLoad"",_this,""RscDisplayInventory"",'IGUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayInventory"",'IGUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayLoadMission","[""onLoad"",_this,""RscDisplayLoading"",'3DENDisplaysTemp'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayLoading"",'3DENDisplaysTemp'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayInterrupt","[""onLoad"",_this,""RscDisplayInterrupt"",'3DENDisplaysTemp'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayInterrupt"",'3DENDisplaysTemp'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayOptionsVideo","[""onLoad"",_this,""RscDisplayOptionsVideo"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptionsVideo"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayOptions","[""onLoad"",_this,""RscDisplayOptions"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptions"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayAVTerminal","[""onLoad"",_this,""RscDisplayAVTerminal"",'IGUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayAVTerminal"",'IGUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayConfigureAction","[""onLoad"",_this,""RscDisplayConfigureAction"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayConfigureAction"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayConfigureControllers","[""onLoad"",_this,""RscDisplayConfigureControllers"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayConfigureControllers"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayControlSchemes","[""onLoad"",_this,""RscDisplayControlSchemes"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayControlSchemes"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayCustomizeController","[""onLoad"",_this,""RscDisplayCustomizeController"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayCustomizeController"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayDebriefing","[""onLoad"",_this,""RscDisplayDebriefing"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayDebriefing"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayDiary","[""onLoad"",_this,""RscDiary"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDiary"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayGameOptions","[""onLoad"",_this,""RscDisplayGameOptions"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayGameOptions"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayJoystickSchemes","[""onLoad"",_this,""RscDisplayJoystickSchemes"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayJoystickSchemes"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayLoading","[""onLoad"",_this,""RscDisplayLoading"",'3DENDisplaysTemp'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayLoading"",'3DENDisplaysTemp'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayMicSensitivityOptions","[""onLoad"",_this,""RscDisplayMicSensitivityOptions"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayMicSensitivityOptions"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayOptionsAudio","[""onLoad"",_this,""RscDisplayOptionsAudio"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptionsAudio"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayOptionsLayout","[""onLoad"",_this,""RscDisplayOptionsLayout"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptionsLayout"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayStart","[2] call compile preprocessfilelinenumbers gettext (configfile >> 'CfgFunctions' >> 'init'); ['onLoad',_this,'RscDisplayLoading','Loading'] call (uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayLoading"",'3DENDisplaysTemp'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
			["RscDisplayInsertMarker","[""onLoad"",_this,""RscDisplayInsertMarker"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayInsertMarker"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"]
		];
	};

	uiSleep 3;
};