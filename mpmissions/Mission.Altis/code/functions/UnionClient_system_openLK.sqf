/*

	Filename: 	UnionClient_system_openLK.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
disableSerialization;
if(isNull (findDisplay 4600)) then {
	if !(createDialog "UnionDialogLK") exitWith {};
};

ctrlSetText [4601, M_CONFIG(getText,"LifeCfgPadSkins",life_myPadSkinID,"image")];

(CONTROL(4600,4602)) ctrlSetStructuredText parseText format["<t size='2' align='center' color='#d5ab04'>Внимание!</t><t size='0.9' color='#FFFFFF'><br /><br />Для удобства управления вашим персонажем и доступа к другим услугам, мы ввели Личный кабинет для всех игроков Union RP. Перейдите по ссылке ниже, авторизуйтесь через steam-аккаунт и получите доступ к данным своего персонажа, информации о сервере, услугам и многому другому.<br /><br /><br /><a href='http://lk.unionrp.ru/' size='1.6' underline='true' color='#83dbff' align='center'>lk.unionrp.ru</t>"];