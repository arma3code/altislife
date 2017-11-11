/*

    Filename:   UnionClient_martiallaw_getWarPointCoord.sqf
    Project:    Union Altis Life RPG
    Author:     Merrick & Affect
    Steam:      76561198006439083 & 76561198053094990
    Web:        http://unionrp.ru/

*/
#include "..\script_macros.hpp"
setpointcoord = {
	private _xc = format["%1",round(_this select 0)];
	private _yc = format["%1",round(_this select 1)];
	onMapSingleClick "";
	openMap [false, false];
	createDialog "UnionDialogAddWarpoint";
	waitUntil {!isNull (findDisplay 4400)};
	ctrlSetText [4404, format["%1",_xc]];
	ctrlSetText [4405, format["%1",_yc]];
	hint "Точка выбрана";
};

openMap [true, false];
onMapSingleClick "_pos call setpointcoord";
hint "Кликните на карте место, где будет создана точка военного положения";