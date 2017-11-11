/*

	class default - должен быть всегда!

*/

class LifeCfgPadSkins {
	class default {
		title = "Черный";
		image = "\union_pad\pad_skins\phone_bg1.paa";
		conditions = "";
	};
	class skin1 {
		title = "Белый";
		image = "\union_pad\pad_skins\phone_bg2.paa";
		conditions = "";
	};
	class skin2 {
		title = "Градиент";
		image = "\union_pad\pad_skins\phone_bg3.paa";
		conditions = "";
	};
	class skin3 {
		title = "Урбан";
		image = "\union_pad\pad_skins\phone_bg4.paa";
		conditions = "";
	};
	class skin4 {
		title = "Узор";
		image = "\union_pad\pad_skins\phone_bg5.paa";
		conditions = "";
	};
	class skin5 {
		title = "Небесная листва";
		image = "\union_pad\pad_skins\phone_bg6.paa";
		conditions = "";
	};
	class skin6 {
		title = "Вулканический камень";
		image = "\union_pad\pad_skins\phone_bg7.paa";
		conditions = "";
	};
	class space {
		title = "Ареал";
		image = "\union_pad\pad_skins\phone_bg8.paa";
		conditions = "(call life_donator) > 0";
	};
	class crystal {
		title = "Кристаллы";
		image = "\union_pad\pad_skins\phone_bg9.paa";
		conditions = "(call life_donator) > 0";
	};
	class stickbomb {
		title = "Железная дорога";
		image = "\union_pad\pad_skins\phone_bg10.paa";
		conditions = "(call life_donator) > 0";
	};
	class sexy {
		title = "Зимние горы";
		image = "\union_pad\pad_skins\phone_bg11.paa";
		conditions = "(call life_donator) > 0";
	};
	class crysis {
		title = "Лето";
		image = "\union_pad\pad_skins\phone_bg12.paa";
		conditions = "(call life_donator) > 0";
	};
	class darksouls {
		title = "Starwars";
		image = "\union_pad\pad_skins\phone_bg13.paa";
		conditions = "(call life_donator) > 0";
	};
	class darkness {
		title = "Причал";
		image = "\union_pad\pad_skins\phone_bg14.paa";
		conditions = "(call life_donator) > 0";
	};
	class fallout {
		title = "Город";
		image = "\union_pad\pad_skins\phone_bg15.paa";
		conditions = "(call life_donator) > 0";
	};
	class dota {
		title = "Озеро";
		image = "\union_pad\pad_skins\phone_bg16.paa";
		conditions = "(call life_donator) > 0";
	};
	class diablo {
		title = "Водопад";
		image = "\union_pad\pad_skins\phone_bg17.paa";
		conditions = "(call life_donator) > 0";
	};
};

class LifeCfgPadIcons {
	class ButtonStatus {
		tooltip = "STR_PM_Status";
		image = "\union_pad\pad_icons\pad_icons_status.paa";
		action = "closeDialog 0; [0] spawn UnionClient_pad_openStatus";
		conditions = "";
	};

	class ButtonPhone {
		tooltip = "STR_PM_CellPhone";
		image = "\union_pad\pad_icons\pad_icons_phone.paa";
		action = "closeDialog 0; [0] spawn UnionClient_system_OpenPhone";
		conditions = "";
	};

	class ButtonHeal {
		tooltip = "STR_PM_Healing";
		image = "\union_pad\pad_icons\pad_icons_fhelp.paa";
		action = "closeDialog 0; [] spawn UnionClient_system_healMenu";
		conditions = "";
	};

	class ButtonGang {
		tooltip = "STR_PM_MyGang";
		image = "\union_pad\pad_icons\pad_icons_gang.paa";
		action = "if (isNil {(group player) getVariable ""gang_owner""}) then {closeDialog 0; [] spawn UnionClient_gangs_MenuCreat} else {closeDialog 0; [] spawn UnionClient_gangs_Menu}";
		//conditions = "!(playerSide isEqualTo east)";
		conditions = "";
	};

	/*class ButtonBusiness {
		tooltip = "STR_PM_MyBusiness";
		image = "\union_pad\pad_icons\pad_icons_ltd.paa";
		action = "closeDialog 0; if (life_ltdData isEqualTo []) then {[] spawn UnionClient_ltd_regMenu} else {[] spawn UnionClient_ltd_mainMenu}";
		conditions = "playerSide isEqualTo civilian";
	};*/

	class ButtonKeys {
		tooltip = "STR_PM_KeyChain";
		image = "\union_pad\pad_icons\pad_icons_keys.paa";
		action = "closeDialog 0; createDialog ""UnionDialogKeyManagement""";
		conditions = "";
	};

	class ButtonCraft {
		tooltip = "STR_PM_Craft";
		image = "\union_pad\pad_icons\pad_icons_craft.paa";
		action = "closeDialog 0; createDialog ""UnionDialogCraft""";
		conditions = "";
	};

	class ButtonCrime {
		tooltip = "STR_PM_WantedList";
		image = "\union_pad\pad_icons\pad_icons_crime.paa";
		action = "closeDialog 0; [] spawn UnionClient_system_wantedMenu";
		conditions = "playerSide isEqualTo west";
	};

	class ButtonMedic {
		tooltip = "STR_PM_MedicMenu";
		image = "\union_pad\pad_icons\pad_icons_doctor.paa";
		action = "closeDialog 0; [] spawn UnionClient_system_medicMenuRequest";
		conditions = "playerSide isEqualTo east";
	};

	class ButtonGov {
		tooltip = "STR_PM_GoverMenu";
		image = "\union_pad\pad_icons\pad_icons_gover.paa";
		action = "closeDialog 0; [] spawn UnionClient_system_openGovMenu";
		conditions = "";
	};

	class ButtonLk {
		tooltip = "STR_PM_LKMenu";
		image = "\union_pad\pad_icons\pad_icons_lk.paa";
		action = "closeDialog 0; [] spawn UnionClient_system_openLK";
		conditions = "";
	};

	class ButtonSettings {
		tooltip = "STR_SM_Title";
		image = "\union_pad\pad_icons\pad_icons_settings.paa";
		action = "closeDialog 0; [] spawn UnionClient_system_settingsMenu";
		conditions = "";
	};

	class ButtonSave {
		tooltip = "STR_PM_SyncData";
		image = "\union_pad\pad_icons\pad_icons_save.paa";
		action = "[] call UnionClient_session_syncData";
		conditions = "";
	};

	class ButtonAdmin {
		tooltip = "STR_PM_AdminMenu";
		image = "\union_pad\pad_icons\pad_icons_admin.paa";
		action = "closeDialog 0; [] spawn UnionClient_admin_Menu";
		conditions = "(call life_adminlevel) > 0";
	};
};