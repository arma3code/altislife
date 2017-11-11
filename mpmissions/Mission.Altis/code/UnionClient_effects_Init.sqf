/*

	Filename: 	UnionClient_effects_Init.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
private _lastSync = time;
while {true} do {
	//не наркоман ли ты случаем?
	if (isNull LIFE_HANDLE_DRUGS && {life_drug_light OR life_drug_hard}) then {
		LIFE_HANDLE_DRUGS = [] spawn UnionClient_effects_Drugs;
	};

	//паспорта и взломанные дома
	if (isNull LIFE_HANDLE_TEMPVARS && {(count life_ids > 0) OR (count life_tempHouses > 0)}) then {
		LIFE_HANDLE_TEMPVARS = [] spawn UnionClient_effects_TempVars;
	};

	//если не полная жизнь
	if (isNull LIFE_HANDLE_DMG && {damage player > 0.25}) then {
		LIFE_HANDLE_DMG = [] spawn UnionClient_effects_Dmg;
	};

	//болеем ли мы
	if (isNull LIFE_HANDLE_SICK && {life_sickness}) then {
		LIFE_HANDLE_SICK = [] spawn UnionClient_effects_Sick;
	};

	//бухлишко
	if (isNull LIFE_HANDLE_DRUNK && {life_drink > 0}) then {
		LIFE_HANDLE_DRUNK = [] spawn UnionClient_effects_Drunk;
	};

	//еда и вода
	if (isNull LIFE_HANDLE_FOODWATER && {FETCH_CONST(life_adminlevel) < 1}) then {
		LIFE_HANDLE_FOODWATER = [] spawn UnionClient_effects_FoodWater;
	};

	//рюкзак и макс вес
	if (isNull LIFE_HANDLE_WEIGHT) then {
		LIFE_HANDLE_WEIGHT = [] spawn UnionClient_effects_Weight;
	};

	//пвп режим
	if (life_pvp && isNull LIFE_HANDLE_PVP) then {
		LIFE_HANDLE_PVP = [] spawn UnionClient_effects_PvP;
	};

	//внутри зоны боя
	if (isNull LIFE_HANDLE_WARZONES && {life_inwarzone OR !(EQUAL(server_warzones,[]))}) then {
		LIFE_HANDLE_WARZONES = [] spawn UnionClient_effects_WarZones;
	};

	//позиция
	if (isNull LIFE_HANDLE_POSITION) then {
		LIFE_HANDLE_POSITION = [] spawn UnionClient_effects_Position;
	};

	//TeamSpeak
	if (isNull LIFE_HANDLE_TEAMSPEAK && {!server_ddos_ts}) then {
		LIFE_HANDLE_TEAMSPEAK = [] spawn UnionClient_effects_TeamSpeak;
	};

	//houses
	if (count life_tempHouses > 0) then {
		{
			if (player distance (_x) > 50) then {
				life_tempHouses set [_forEachIndex,-1];
				hint "Вы далеко отошли от взломанного дома и потеряли ключи";
			}
		} forEach life_tempHouses;
		life_tempHouses = life_tempHouses - [-1];
	};


	if (time - _lastSync > 15*60) then {
		[] call UnionClient_session_updateRequest;
		life_PadIsPowerOn = false;
		hint "Автоматическое сохранение. Следующее сохранение через 15 минут.";
		_lastSync = time;
	};

	uiSleep 2;
};