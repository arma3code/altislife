/*

	Filename: 	UnionClient_adac_Menu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _vehicle = param [0,Objnull,[Objnull]];
if (isNull _vehicle) exitWith {};
private _cargoDeliver = _vehicle GVAR ["cargoDeliver",[]];
if (!(EQUAL(_cargoDeliver,[]))) exitWith {hint "У техники взят заказ на доставку"};
private _dbInfo = _vehicle GVAR ["dbInfo",[]];
if (EQUAL(_dbInfo,[])) exitWith {hint "Техника в аренде"};

if (!isClass (missionConfigFile >> "LifeCfgAdac" >> typeof _vehicle)) exitWith {hint "Для этой техники нет настроек"};

disableSerialization;
if (isNull (findDisplay 3700)) then {
	createDialog "UnionDialogAdac";
	waitUntil {!isNull (findDisplay 3700)};
};

ctrlSetText [3711, M_CONFIG(getText,"LifeCfgPadSkins",life_myPadSkinID,"image")];

adac_vehicleToUpgrade = _vehicle;

private _title = CONTROL(3700,3701);
_title ctrlSetText format[localize "STR_ADAC_Title",(getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"))];

private _boxestitle = CONTROL(3700,3703);
private _boxesAddButton = CONTROL(3700,3704);
private _boxesRemoveButton = CONTROL(3700,3705);
private _nitroTitle = CONTROL(3700,3706);
private _nitrobutton = CONTROL(3700,3707);
private _colorTitle = CONTROL(3700,3708);
private _colorSelect = CONTROL(3700,3709);
private _colorButton = CONTROL(3700,3710);

private _materialTitle = CONTROL(3700,3712);
private _materialSelect = CONTROL(3700,3713);
private _materialButton = CONTROL(3700,3714);

private _maxBoxes = M_CONFIG(getNumber,"LifeCfgAdac",typeOf _vehicle,"boxes");

private "_boxesInfo";
if (EQUAL(_maxBoxes,0)) then {
	_boxesAddButton ctrlEnable false;
	_boxesRemoveButton ctrlEnable false;
	_boxesInfo = localize "STR_ADAC_BoxesCant" + "<br/>";
} else {
	_boxesAddButton buttonSetAction "[adac_vehicleToUpgrade,""boxes"",""add""] call UnionClient_adac_Setup";
	_boxesRemoveButton buttonSetAction "[adac_vehicleToUpgrade,""boxes"",""del""] call UnionClient_adac_Setup";

	if (_vehicle GVAR ["adacBoxes",0] >= _maxBoxes) then {
		_boxesAddButton ctrlEnable false;
		_boxesRemoveButton ctrlEnable true;
	} else {
		_boxesAddButton ctrlEnable true;
		_boxesRemoveButton ctrlEnable false;
	};

	_boxesInfo = format[localize "STR_ADAC_BoxesCount" +"<br/>",_vehicle GVAR ["adacBoxes",0],_maxBoxes];
};

//можно ли поставить нитро:
private _canNitro = M_CONFIG(getNumber,"LifeCfgAdac",typeOf _vehicle,"nitro");
private "_nitroInfo";
if (EQUAL(_canNitro,1)) then {
	_nitrobutton ctrlEnable true;
	if (!isNil {_vehicle GVAR "adacNitroUsed"}) then {
		_nitrobutton buttonSetAction "[adac_vehicleToUpgrade,""nitro"",""del""] call UnionClient_adac_Setup";
		_nitrobutton ctrlSetText localize "STR_ADAC_NitroRemove";
		_nitroInfo = localize "STR_ADAC_NitroAlreadySet" + "<br/>";
	} else {
		_nitrobutton buttonSetAction "[adac_vehicleToUpgrade,""nitro"",""add""] call UnionClient_adac_Setup";
		_nitrobutton ctrlSetText localize "STR_ADAC_NitroSet";
		_nitroInfo = localize "STR_ADAC_NitroAvialable" + "<br/>";
	};
} else {
	_nitrobutton ctrlEnable false;
	_nitroInfo = localize "STR_ADAC_NitroCantBe" + "<br/>";
};

private _allowedColors = M_CONFIG(getArray,"LifeCfgAdac",typeOf _vehicle,"textures");
if (EQUAL(_allowedColors,[])) then {
	_colorTitle ctrlEnable false;
	_colorSelect ctrlEnable false;
	_colorButton ctrlEnable false;
} else {
	lbClear _colorSelect;
	{
		if (isClass (missionConfigFile >> "LifeCfgVehTextures" >> _x select 0)) then {
			_colorSelect lbAdd format["%1",M_CONFIG(getText,"LifeCfgVehTextures",_x select 0,"displayName")];
			_colorSelect lbSetData [(lbSize _colorSelect)-1,_x select 0];
		};
	} forEach _allowedColors;
	_colorTitle ctrlEnable true;
	_colorSelect ctrlEnable true;
	_colorButton ctrlEnable true;
};


private _allowedMaterials = M_CONFIG(getArray,"LifeCfgAdac",typeOf _vehicle,"materials");
if (EQUAL(_allowedMaterials,[])) then {
	_materialTitle ctrlEnable false;
	_materialSelect ctrlEnable false;
	_materialButton ctrlEnable false;
} else {
	lbClear _materialSelect;
	{
		if (isClass (missionConfigFile >> "LifeCfgVehMaterials" >> _x)) then {
			_materialSelect lbAdd format["%1",M_CONFIG(getText,"LifeCfgVehMaterials",_x,"displayName")];
			_materialSelect lbSetData [(lbSize _materialSelect)-1,_x];
		};
	} forEach _allowedMaterials;
	_materialTitle ctrlEnable true;
	_materialSelect ctrlEnable true;
	_materialButton ctrlEnable true;
};

(CONTROL(3700,3702)) ctrlSetStructuredText parseText ("<t size='1.1'><t color='#53b21a'>" + localize "STR_ADAC_UpgradesList" + "</t></t><br/><br/>" + _boxesInfo + _nitroInfo);