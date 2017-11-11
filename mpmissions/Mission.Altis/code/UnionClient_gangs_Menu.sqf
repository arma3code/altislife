/*

	Filename: 	UnionClient_gangs_Menu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
if (life_action_gangInUse) exitWith {};
disableSerialization;
if (isNull (findDisplay 2620)) then {
	if !(createDialog "UnionDialogMyGang") exitWith {};
};

ctrlSetText [2640, M_CONFIG(getText,"LifeCfgPadSkins",life_myPadSkinID,"image")];

private _ownerID = grpPlayer GVAR["gang_owner",""];
if (EQUAL(_ownerID,"")) exitWith {closeDialog 0;};
private _gangDeputy = grpPlayer GVAR ["gang_deputy","-1"];
private _gangName = GANG_NAME;
private _gangBank = grpPlayer GVAR "gang_bank";
private _gangMax = grpPlayer GVAR "gang_maxMembers";
private _gangCount = grpPlayer GVAR "gang_membersCount";
private _gangLicense = grpPlayer GVAR ["gang_license","-1"];
private _gangID = grpPlayer GVAR "gang_id";
private _gangSide = grpPlayer GVAR "gang_side";
private _gangWarpoints = grpPlayer GVAR ["gang_warpoints",0];

private _BtnLvlUp = CONTROL(2620,2627);
private _BtnLvlDwn = CONTROL(2620,2628);
private _BtnLicense = CONTROL(2620,2635);
private _BtnUpgrade = CONTROL(2620,2622);
private _BtnKick = CONTROL(2620,2624);
private _BtnNewLeader = CONTROL(2620,2625);
private _BtnNewDeputy = CONTROL(2620,2637);
private _BtnInvite = CONTROL(2620,2630);
private _MoneyEdit = CONTROL(2620,2633);
private _BtnTakeMoney = CONTROL(2620,2626);
private _BtnDisband = CONTROL(2620,2631);
private _BtnLeave = CONTROL(2620,2636);
private _BtnOffline = CONTROL(2620,2638);

private _GangInfoAdd = CONTROL(2620,2639);

_BtnLvlUp ctrlEnable false; //lvl +
_BtnLvlDwn ctrlEnable false; //lvl -
_BtnLicense ctrlEnable false; //лицуха

_BtnUpgrade ctrlEnable false; //Upgrade
_BtnKick ctrlEnable false; //Kick
_BtnNewLeader ctrlEnable false; //Set New Leader
_BtnNewDeputy ctrlEnable false; //Set New Deputy
_BtnInvite ctrlEnable false; //Invite Player
_BtnTakeMoney ctrlEnable false; //Снять бабки
_MoneyEdit ctrlEnable false; //Снять бабки поле
_BtnDisband ctrlShow false; //Disband Gang
_BtnLeave ctrlShow true; //Leave Gang
_BtnOffline ctrlEnable false; //Leave Gang

_GangInfoAdd ctrlEnable false;

if (EQUAL(_gangDeputy,steamid)) then {
	_BtnUpgrade ctrlEnable true; //Upgrade
	_BtnKick ctrlEnable true; //Kick
	_BtnInvite ctrlEnable true; //Invite Player
	_GangInfoAdd ctrlEnable true; //изменение инфы
};

if (EQUAL(_ownerID,steamid)) then {
	_BtnUpgrade ctrlEnable true; //Upgrade
	_BtnKick ctrlEnable true; //Kick
	_BtnNewLeader ctrlEnable true; //Set New Leader
	_BtnNewDeputy ctrlEnable true; //Set New Deputy
	_BtnInvite ctrlEnable true; //Invite Player
	_BtnTakeMoney ctrlEnable true; //Снять бабки
	_MoneyEdit ctrlEnable true; //Снять бабки поле
	_BtnDisband ctrlShow true; //Disband Gang
	_BtnLeave ctrlShow false; //Leave Gang
	_GangInfoAdd ctrlEnable true; //изменение инфы
};

switch(_gangSide) do {
	case west: {
		if (player GVAR ["copLevel",0] > 1) then {
			_GangInfoAdd ctrlEnable true;
		};
	};
	case civilian: {
		if (player GVAR ["lvl",0] > 1) then {
			_GangInfoAdd ctrlEnable true;
		};
	};
	case independent: {
		if (player GVAR ["lvl",0] > 1) then {
			_GangInfoAdd ctrlEnable true;
		};
	};
	case east: {
		if (player GVAR ["medrank",0] > 1) then {
			_GangInfoAdd ctrlEnable true;
		};
	};
};

if (EQUAL(_gangID,life_westGangId) OR EQUAL(_gangID,life_eastGangId)) then {
	if (EQUAL(_ownerID,steamid) OR (EQUAL(_gangDeputy,steamid))) then {
		_BtnLvlUp ctrlEnable true;
		_BtnLvlDwn ctrlEnable true;
	};
	if !([LIFE_SETTINGS(getText,"life_gangCopCanLeaveCondition")] call UnionClient_system_conditionsCheck) then {_BtnLeave ctrlEnable false};
	if (life_coplevel > 2) then {_GangInfoAdd ctrlEnable true};
	if (life_mediclevel > 2) then {_GangInfoAdd ctrlEnable true};
	_BtnDisband ctrlEnable false;
} else {
	if !(EQUAL(_gangLicense,"-1")) then {
		if (EQUAL(_ownerID,steamid) OR EQUAL(_gangDeputy,steamid)) then {
			SetGangLicense = _gangLicense;
			_BtnLicense ctrlEnable true;
			_BtnLicense buttonSetAction "[SetGangLicense] call UnionClient_gangs_LicenseToPlayer";
		};

		if (EQUAL(_ownerID,steamid)) then {
			_BtnLvlUp ctrlEnable true;
			_BtnLvlDwn ctrlEnable true;
		};
	};
};

if (EQUAL(_ownerID,steamid)) then {
	_BtnOffline ctrlEnable true;
};

(CONTROL(2620,2629)) ctrlSetText _gangName;
(CONTROL(2620,601)) ctrlSetText format[("В сети: %2 из %3  |  Слотов: %4  |  " + localize "STR_GNOTF_Funds") + " $%1  |  WarPoints: %5",[_gangBank] call UnionClient_system_numberText,count(units grpPlayer),_gangCount,_gangMax,_gangWarpoints];

private _members = CONTROL(2620,2621);
lbClear _members;

private "_lvlTitle";
{
	if (GVAR_RNAME(_x) != "") then {
		if (EQUAL(_gangSide,west)) then {
			_lvlTitle = format ["[%1] ",_x GVAR["copLevel",0]];
		} else {
			if (!(EQUAL(_gangLicense,"-1"))) then {
				_lvl = _x GVAR ["lvl",0];
				_lvlTitle = switch (_lvl) do {
					case 1: {"[Кадет] "};
					case 2: {"[Боец] "};
					case 3: {"[Офицер] "};
					default {""};
				};
			} else {_lvlTitle = "";};
		};

		if (EQUAL(_gangSide,east)) then {
			_lvlTitle = format ["[%1] ",_x GVAR["medrank",0]];
		};

		if (EQUAL((getPlayerUID _x),_ownerID)) then {
			_members lbAdd format["%2%1 " +(localize "STR_GNOTF_GangLeader"),(GVAR_RNAME(_x)),_lvlTitle];
			_members lbSetData [(lbSize _members)-1,str(_x)];
		} else {
			if (EQUAL((getPlayerUID _x),_gangDeputy)) then {
				_members lbAdd format["%2%1 (Заместитель)",(GVAR_RNAME(_x)),_lvlTitle];
				_members lbSetData [(lbSize _members)-1,str(_x)];
			} else {
				_members lbAdd format["%2%1",(GVAR_RNAME(_x)),_lvlTitle];
				_members lbSetData [(lbSize _members)-1,str(_x)];
			};
		};
	};
} foreach (units grpPlayer);

private _grpMembers = units grpPlayer;
private _pUnits = playableUnits;

{
	if (_x in _grpMembers OR (EQUAL(side _x,"east1")) && isNil {(group _x) GVAR "gang_id"}) then {
		_pUnits set[_forEachIndex,-1];
	};
} foreach _pUnits;
_pUnits = _pUnits - [-1];

_ctrl = CONTROL(2620,2632);
lbClear _ctrl;
{
	_ctrl lbAdd format["%1",GVAR_RNAME(_x)];
	_ctrl lbSetData [(lbSize _ctrl)-1,str(_x)];
} foreach _pUnits;