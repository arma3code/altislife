/*

	Filename: 	UnionClient_init_actions.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
switch (playerSide) do {
	case civilian: {
		player addAction["<img image='\union_pack\icons\ui\s_icon_passport.paa' /> Показать паспорт",UnionClient_system_showPassport,"",0,false,false,"",' !isNull cursorObject && {player distance cursorObject < 3.5} && {isPlayer cursorObject} && {alive cursorObject} && {cursorObject isKindOf "Man"} '];

		player addAction["<img image='\union_pack\icons\ui\s_icon_key.paa' /> Сорвать тюремный номер с заключенного",UnionClient_system_removeLegcuffs,"",0,false,false,"",'!isNull cursorObject && {"extItem_prisonKey" in (magazines player)} && {player distance cursorObject < 3.5} && {isPlayer cursorObject} && {cursorObject getVariable ["isArrested",false]}'];
	};

	case independent: {
		player addAction["<img image='\union_pack\icons\ui\s_icon_passport.paa' /> Показать паспорт",UnionClient_system_showPassport,"",0,false,false,"",' !isNull cursorObject && {player distance cursorObject < 3.5} && {isPlayer cursorObject} && {alive cursorObject} && {cursorObject isKindOf "Man"} '];

		player addAction["<img image='\union_pack\icons\ui\s_icon_key.paa' /> Сорвать тюремный номер с заключенного",UnionClient_system_removeLegcuffs,"",0,false,false,"",'!isNull cursorObject && {"extItem_prisonKey" in (magazines player) }&& {player distance cursorObject < 3.5} && {isPlayer cursorObject} && {cursorObject getVariable ["isArrested",false]}'];
	};

	case west: {
		player addAction["<img image='\union_pack\icons\ui\s_icon_passport.paa' /> Показать жетон",UnionClient_system_showPassport,"",0,false,false,"",'!isNull cursorObject && {player distance cursorObject < 3.5} && {isPlayer cursorObject} && {alive cursorObject} && {cursorObject isKindOf "Man"}'];

		player addAction["Обыскать инвентарь",UnionClient_system_lootInvSearch,"",0,false,false,"",'!isNull cursorObject && {cursorObject distance player < 3} && {(typeOf cursorObject) == "Box_Wps_F"}'];

		player addAction["Алкотест",{[player] remoteExecCall ["UnionClient_system_breathalyzer",cursorObject]},"",0,false,false,"",'!isNull cursorObject && {cursorObject distance player < 3} && {cursorObject getVariable ["restrained",false]} '];
	};

	case east: {
		player addAction["<img image='\union_pack\icons\ui\s_icon_passport.paa' /> Показать жетон",UnionClient_system_showPassport,"",0,false,false,"",'!isNull cursorObject && {player distance cursorObject < 3.5} && {isPlayer cursorObject} && {alive cursorObject} && {cursorObject isKindOf "Man"}'];
		player addAction["Закопать грешника",{_this spawn UnionClient_dmg_HideBody;},"",0,false,false,"",'!isNull cursorObject && {player distance cursorObject < 3.5} && {!alive cursorObject} && {cursorObject isKindOf "Man"}'];
	};
};

player addAction["<img image='\union_pack\icons\ui\s_icon_stop.paa' /> Отменить эскорт",UnionClient_system_stopEscortingAction,"",0,false,false,"",'count attachedObjects player > 0 && (isNull objectParent player) && isNull life_DraggedBody && isNull life_dhl_box'];

player addAction["<img image='\union_pack\icons\ui\s_icon_box.paa' /> Инвентарь",UnionClient_system_openInventory,"",0,false,false,"",'!isNull cursorObject && {cursorObject distance player < 3} && {(typeOf cursorObject) == "Box_Wps_F"} && {isNull objectParent player}'];

player addAction["Посмотреть номер",UnionClient_system_seePlate,"",0,false,false,"",'!isNull cursorTarget && player distance cursorTarget < 300 && ((cursorTarget isKindOf "LandVehicle")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && alive cursorTarget'];
