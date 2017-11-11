/*

	Filename: 	UnionClient_processing_menu.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _vendor = param [0,ObjNull,[ObjNull]];
private _type = param [3,"",[""]];

if (isNull _vendor OR (EQUAL(_type,"")) OR (player distance _vendor > 10) OR !(NOTINVEH(player))) exitWith {};
if !(EQUAL(CURWEAPON,"")) exitWith {hint "Освободите свои руки, уберите оружие за спину"};

life_process_info = switch (_type) do {
	case "oil": {[[["oilu",1]],"oilp",localize "STR_Process_Oil","oil"]};
	case "petrol": {[[["oilp",1]],"petrol",localize "STR_MF_ResProcOilToGasoline","oil"]};
	case "gas": {[[["gasu",1]],"gasp",localize "STR_MF_ResProcGas","gas"]};
	case "ammonia": {[[["gasp",1]],"ammonia",localize "STR_MF_ResProcAmmonia","gas"]};
	case "shrimp": {[[["shrimp",1]],"shrimp_s",localize "STR_MF_ResProcShrimp","fish"]};
	case "diamond": {[[["diamond",1]],"diamondc",localize "STR_Process_Diamond","diamond"]};
	case "jeweler": {[[["diamondc",1]],"jewelry",localize "STR_MF_ResProcJewelry","diamond"]};
	case "heroin": {[[["heroinu",1]],"heroinp",localize "STR_Process_Heroin","heroin"]};
	case "copper": {[[["copperore",1]],"copper_r",localize "STR_Process_Copper","copper"]};
	case "coppertape": {[[["copper_r",1]],"copper_tape",localize "STR_MF_ResProcCopTapes","copper"]};
	case "iron": {[[["ironore",1]],"iron_r",localize "STR_Process_Iron","iron"]};
	case "sand": {[[["sand",1]],"glass",localize "STR_Process_Sand","sand"]};
	case "salt": {[[["salt",1]],"salt_r",localize "STR_Process_Salt","salt"]};
	case "cocaine": {[[["cocaine",1]],"cocainep",localize "STR_Process_Cocaine","cocaine"]};
	case "meth": {[[["methu",1]],"methp",localize "STR_MF_ResProcMeth","meth"]};
	case "tobacco": {[[["tobacco",1]],"cigar",localize "STR_MF_ResProcCigar","tobacco"]};
	case "marijuana": {[[["cannabis",1]],"marijuana",localize "STR_Process_Marijuana","marijuana"]};
	case "medmarijuana": {[[["cannabis",1]],"marijuana",localize "STR_Process_Marijuana","medmarijuana"]};
	case "cement": {[[["rock",1]],"cement",localize "STR_Process_Cement","cement"]};
	case "uranium": {[[["uraniumu",1]],"uraniump",localize "STR_MF_ResProcUran","uranium"]};
	case "uraniumclean": {[[["uraniump",1]],"uraniumc",localize "STR_MF_ResProcUran2","uranium"]};
	case "glassbottle":{[[["glass",1]],"bottles",localize "STR_MF_ResProcMakeBottles","bottler"]};
	case "bottledshine": {[[["moonshine",1],["bottles",1]],"bottledshine",localize "STR_MF_ResProcMoonshinePour","bottler"]};
	case "bottledbeer": {[[["beerp",1],["bottles",1]],"bottledbeer",localize "STR_MF_ResProcBeerPour","bottler"]};
	case "bottledwhiskey": {[[["whiskey",1],["bottles",1]],"bottledwhiskey",localize "STR_MF_ResProcWhiskeyPour","bottler"]};
	case "mash": {[[["hops",1],["cornmeal",1]],"mash",localize "STR_MF_ProcActMash","stiller"]};
	case "whiskey": {[[["yeast",1],["rye",1]],"whiskey",localize "STR_MF_ProcActWhiskey","stiller"]};
	case "moonshine": {[[["yeast",1],["mash",1]],"moonshine",localize "STR_MF_ProcActMoonshine","stiller"]};
	case "beer": {[[["yeast",1],["hops",1]],"beerp",localize "STR_MF_ResProcBrewery","liquor"]};


	//tanoa
	case "sugar": {[[["sugar",1]],"sugarp","Переработка сахара","food"]};
	case "olive": {[[["olivec",10],["allup",2]],"olivep","Консервирование оливок","food"]};
	case "amber": {[[["amber",1]],"amberp","Переработка янтаря","apprentice"]};
	case "pearl": {[[["pearl",3]],"pearlp","Переработка жемчуга","apprentice"]};
	case "coffee": {[[["coffee",3]],"coffeep","Производство кофе","apprentice"]};
	case "coquinap": {[[["coquina",1]],"coquinap","Опрессовка ракушечника","apprentice"]};
	case "woodbu": {[[["woodb",1]],"woodbu","Переработка черного дерева","wood"]};
	case "woodbp": {[[["woodbu",2]],"woodbp","Распил черного дерева","wood"]};
	case "woodrp": {[[["woodr",2]],"woodrp","Распил красного дерева","rarewood"]};
	case "bdiamond": {[[["blackd",1]],"blackdp","Переработка черного алмаза","bdiamond"]};
	case "allup": {[[["bauxites",1]],"allup","Переработка аллюминия","metal"]};
	case "bronzec": {[[["bronze",1]],"bronzec","Очистка бронзы","metal"]};
	case "bronzep": {[[["bronzec",1]],"bronzep","Производство бронзовой чушки","metal"]};
	case "obsid": {[[["obsid",1]],"obsidp","Переработка обсидиана","metal"]};
	case "opium": {[[["opium",3]],"opiump","Производство опиума","opium"]};
	case "weppartp": {[[["weppart",1]],"weppartp","Очистка фрагмента оружия","weapon"]};
	case "royalcp": {[[["royalc",1]],"royalcp","Переработка краба","rarefish"]};
	case "cacaop": {[[["cacao",3],["sugarp",3]],"cacaop","Производство шоколада","confectioner"]};
	case "dish": {[[["cacaop",3],["sugarp",3],["anana",3],["banana",3]],"dish","Производство торта","confectioner"]};
	case "roma": {[[["sugarp",4],["anana",1],["arwater",1]],"roma","Производство рома","rum"]};
	case "sofa": {[[["woodbp",3],["woodbu",2],["nails",10]],"sofa","Производство мебели","furniture"]};

	default {[]};
};

//Error checking
if (EQUAL(life_process_info,[])) exitWith {};

private _cops = west countSide playableUnits;
private _cop_min_illegal = [] call UnionClient_system_copsForIllegal;

if (_type in ["uranium","uraniumclean"] && _cops < LIFE_SETTINGS(getNumber,"life_cop_min")) exitWith {
	hint format["Для переработки урана необходимо как минимум %1 полицейских на острове.",LIFE_SETTINGS(getNumber,"life_cop_min")];
};

private _index = [life_process_info select 1,life_illegal_items] call UnionClient_system_index;
if (!(EQUAL(_index,-1)) && _cops < _cop_min_illegal) exitWith {
	hint format["Для переработки нелегальных ресурсов необходимо как минимум %1 полицейских на острове.",_cop_min_illegal];
};

private _canProcess = true;
private _gangResource = switch (worldName) do {
	case "Altis": {[mari_processor,coke_processor,heroin_processor,meth_processor,uran_processor,uran_processor_clean]};
	case "Tanoa" : {[]};
	default {[]};
};
if (_vendor in _gangResource) then {
	private _gang = _vendor GVAR ["gangOwner",grpNull];
	if (isNull _gang) exitWith {};

	private _whoCan = _vendor GVAR ["canProcess",[]];
	if (EQUAL(_gang,grpPlayer) OR (steamid in _whoCan)) exitWith {};

	private _gangName = _gang GVAR ["gang_name",""];
	private _gangSide = _gang GVAR ["gang_side",sideUnknown];
	private _gangBank = _gang GVAR ["gang_bank",-1];

	if (EQUAL(_gangName,"")) exitWith {hint "Ошибка получения имени банды. Сообщите админку."};
	if (EQUAL(_gangSide,sideUnknown)) exitWith {hint "Ошибка получения фракции банды. Сообщите админку."};
	if (EQUAL(_gangBank,-1)) exitWith {hint "Ошибка получения баланса банды. Сообщите админку."};

	private _valToPay = if (license_reb_sdr or license_reb_aff OR license_reb_arg OR license_reb_nmd OR license_reb_nsb) then {30000} else {2000};

	private _action = [
		format["Переработчик контролируется группировкой %1. Вы должны заплатить дань или захватить его под свой контроль, чтобы перерабатывать ресурс. Вы согласные заплатить дань в размере $%2?",_gangName,[_valToPay] call UnionClient_system_numberText],
		"Переработчик находится под контролем...",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call BIS_fnc_guiMessage;

	if (_action) then {
		if (BANK < _valToPay) exitWith {_canProcess = false; hint "У вас нет необходимой суммы на банковском счете";};

		_gangBank = _gangBank + _valToPay;
		_gang SVAR ["gang_bank",_gangBank,true];
		["atm","take",_valToPay] call UnionClient_system_myCash;

		[[1,_gang,_gangSide,steamid],"updateGang"] call UnionClient_system_hcExec;

		_whoCan pushBack steamid;
		_vendor SVAR ["canProcess",_whoCan,true];

		hint "Вы оплатили дань и можете перерабатывать ресурс";
	} else {
		_canProcess = false;
		hint "Вы отказались от уплаты дани и не можете перерабатывать";
	};
};

if !(_canProcess) exitWith {titleText["Переработка отменена","PLAIN"];};

private _licenseNeed = life_process_info select 3;
private _sideFlag = M_CONFIG(getText,"LifeCfgLicenses",_licenseNeed,"side");
private _hasLicense = LICENSE_VALUE(_licenseNeed,_sideFlag);

if !(_hasLicense) then {
	private _licenseDisplayname = M_CONFIG(getText,"LifeCfgLicenses",_licenseNeed,"displayName");
	private _licensePrice = M_CONFIG(getNumber,"LifeCfgLicenses",_licenseNeed,"price");
	private _action = [
		format["У вас нет лицензии ""%1"", необходимой для переработки ресурса. Хотите купить ее за $%2 ",localize _licenseDisplayname,[_licensePrice] call UnionClient_system_numberText],
		"Покупка лицензии",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call BIS_fnc_guiMessage;

	if (_action) then {
		if (CASH < _licensePrice) exitWith {
			_canProcess = false;
			hint "У вас недостаточно денег для покупки лицензии";
		};

		["cash","take",_licensePrice] call UnionClient_system_myCash;
		SVAR_MNS [LICENSE_VARNAME(_licenseNeed,_sideFlag),true];

		hint "Вы купили лицензию";
	} else {
		_canProcess = false;
		hint "Покупка лицензии отменена";
	};
};

if !(_canProcess) exitWith {};

if (EQUAL(_type,"meth") && !(EQUAL((uniform player),""))) exitWith {
	hint format["Для варки мета вам необходимо быть в трусах, иначе одежда пропахнет..."];
	if (EQUAL(life_meth_bb,0)) then {
		"SmokeShellRed" createVehicle (getMarkerPos "meth_flash");
		life_meth_bb = 1;
	};
	player say3D "meth_bb";
};

disableSerialization;
if (isNull (findDisplay 5000)) then {
	if !(createDialog "UnionDialogProcessing") exitWith {};
};

private _title = CONTROL(5000,5001);
_title ctrlSetText format ["%1",life_process_info select 2];

[life_process_info] call UnionClient_processing_update;

private _progress = CONTROL(5000,5006);
private _pgText = CONTROL(5000,5007);

_pgText ctrlSetText "";
_progress progressSetPosition 0;

