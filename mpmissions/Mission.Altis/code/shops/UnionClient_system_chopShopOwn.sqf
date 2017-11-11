/*
	
	Filename: 	UnionClient_system_chopShopOwn.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _control = CONTROL(39400,39402);
private _vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
private _nearVehicles = nearestObjects [getMarkerPos life_chopShop,["LandVehicle","Truck","Air"],25];
_vehicle = _nearVehicles select _vehicle;

closeDialog 0;

if (isNull _vehicle) exitWith {};

if (["B_mas_HMMWV",(typeOf _vehicle)] call BIS_fnc_inString) exitWith {hint "Перебивка военной техники невозможна"};

if (typeOf _vehicle in ["PMC_Offroad_Armed","B_APC_Wheeled_01_cannon_F","B_G_Offroad_01_armed_F","B_Heli_Transport_01_F"]) exitWith {hint "Ты знаешь, я даже за большие деньги не буду связываться с боевой техникой федералов. Могу только пустить на лом, чтобы побыстрее избавиться!"};

if (typeOf _vehicle in ["SIG_SuperBee","SIG_SuperBeeY","SIG_SuperBeeB","SIG_SuperBeeL","SIG_SuperBeeM","SIG_SuperBeeG","SIG_Roadrunner","SIG_Hubcaps","SIG_Magnums","SIG_Hcode"]) exitWith {hint "Эти раритетные авто совсем недавно завезли на остров, поэтому необходимых для перебивки деталей нет. Но всегда можно продать эту малышку на лом..."};

if (typeOf _vehicle in ["max_bike","nomads_bike","shounka_harley_a3","shounka_harley_a3_bleu","shounka_harley_a3_lolz","shounka_harley_a3_noir","shounka_harley_a3_rouge","xarley"]) exitWith {hint "Не хватало мне только проблем с байкерами... Давай просто пустим это на лом и концы в воду"};

if (EQUAL((typeOf _vehicle),"B_mas_UH60M_VRS")) exitWith {hint "Не хватало мне только проблем с VRS... Давай просто пустим это на лом и концы в воду"};
if (EQUAL((typeOf _vehicle),"quiet_sub2015_noir_f")) exitWith {hint "Не хватало мне только проблем с ICS... Давай просто пустим это на лом и концы в воду"};

if !(isClass (missionConfigFile >> "LifeCfgVehicles" >> typeOf _vehicle)) exitWith {hint "У техники нет стоимости и серийного номера. Ее нельзя перебить."};
private _basePrice = M_CONFIG(getNumber,"LifeCfgVehicles",typeOf _vehicle,"price");
if (_basePrice <= 0) exitWith {hint "У техники нет стоимости и серийного номера. Ее нельзя перебить."};

private "_price";
private _vehicleSide = _vehicle GVAR["tf_side",sideUnknown];
if (EQUAL(_vehicleSide,west)) then {
	_price = round (_basePrice * 5); //цена перебивки
} else {
	_price = round (_basePrice + (_basePrice*0.15)); //цена перебивки
};
if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call UnionClient_system_discount};

if (CASH < _price) exitWith {hint "У вас недостаточно наличности, необходимой для перебивки номеров этого транспорта"};
	
private _check = false;
{if(player distance _x < 1000 && side _x == west) then { _check = true; };} forEach playableUnits; 
if(_check) exitWith {hint "Дружище, у тебя копы на хвосте! Избавься от них, иначе я не успею перебить номера на движке!"};


private _upp = format["Перебиваем %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")];
private _cP = 0;
titleText[_upp,"PLAIN"];
while{true} do {
	uiSleep 0.2;
	_cP = _cP + 0.003;
	[_cP,"criminal"] call UnionClient_system_progressBar;	
	if(_cP >= 1 OR (call UnionClient_system_isInterrupted) OR !(NOTINVEH(player)) OR life_interrupted OR player distance (getMarkerPos life_chopShop) > 10) exitWith {};	
};

["life_progress"] call UnionClient_gui_DestroyRscLayer;

if (call UnionClient_system_isInterrupted) exitWith {life_interrupted = false};

if (life_interrupted OR !(NOTINVEH(player)) OR player distance (getMarkerPos life_chopShop) > 10) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};
if (CASH < _price) exitWith { hint "У вас недостаточно наличности, необходимой для перебивки номеров этого авто";};

call UnionClient_actions_inUse;
[player,_vehicle,_price,steamid,GVAR_RNAME(player),playerSide] remoteExecCall ["TON_fnc_chopShopOwn",RSERV];