/*

	Filename: 	UnionClient_system_getPassportText.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
[] call UnionClient_system_passportConfig;

private _flag = [playerSide] call UnionClient_system_convertSide;
private _img = format ["<img size='10' color='#FFFFFF' image='%1'/>",M_CONFIG(getText,"LifeCfgPassports",life_myPassportID,"image")];
private _side = M_CONFIG(getText,"LifeCfgPassportsTexts",_flag,"text");
if (life_coplevel in [27,28]) then {
	_side= "<t color='#cc00ff'>Гражданский</t>";
};
if (GVAR_RTITLE(player) == "") then {
	format["%1<br/><br/><t color='#e8c302' size='0.85'>Имя</t><br/><t size='1.5'>%2</t><br/><br/><t color='#e8c302' size='0.85'>Фракция</t><br/><t size='1.2'>%3</t><br/><br/>",_img,GVAR_RNAME(player),_side];
} else {
	format["%1<br/><br/><t color='#e8c302' size='0.85'>Имя</t><br/><t size='1.2' color ='#00fffc'>%2</t><br/><t size='1.5'>%3</t><br/><br/><t color='#e8c302' size='0.85'>Фракция</t><br/><t size='1.2'>%4</t><br/><br/>",_img,GVAR_RTITLE(player),GVAR_RNAME(player),_side];
};