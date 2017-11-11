/*
		классы civdefault, rebdefault, copdefault & meddefault - должны быть всегда! не удалять!

		title - название
		image = путь к картинке паспорта
		side = для какой фракции
		conditions = условия, необходимые для использования данного паспорта

		LifeCfgPassportsTexts - каким цветом и текстом выдавать фракцию при отображении паспорта
*/
class LifeCfgPassportsTexts {
	class civ {
		text = "<t color='#cc00ff'>Гражданский</t>";
	};
	class reb {
		text = "<t color='#00FF00'>Повстанец</t>";
	};
	class cop {
		text = "<t color='#4ab0ff'>Полиция</t>";
	};
	class med {
		text = "<t color='#ff0000'>МЧС</t>";
	};
};

class LifeCfgPassports {
	//civ
	class civdefault {
		title = "Стандарт";
		image = "\union_passports\data\passport_civ.paa";
		side = "civ";
		conditions = "";
	};
	class civvip1 {
		title = "Криминал";
		image = "\union_passports\data\donate\passport_civ_vip_1.paa";
		side = "civ";
		conditions = "(call life_donator) > 2";
	};
	class civvip2 {
		title = "Работяга";
		image = "\union_passports\data\donate\passport_civ_vip_2.paa";
		side = "civ";
		conditions = "(call life_donator) > 2";
	};
	class civvip3 {
		title = "Цезарь";
		image = "\union_passports\data\donate\passport_civ_vip_3.paa";
		side = "civ";
		conditions = "(call life_donator) > 2";
	};
	class civvip4 {
		title = "Капитан Америка";
		image = "\union_passports\data\donate\passport_civ_vip_4.paa";
		side = "civ";
		conditions = "(call life_donator) > 2";
	};
	class civvip5 {
		title = "Травокур";
		image = "\union_passports\data\donate\passport_civ_vip_5.paa";
		side = "civ";
		conditions = "(call life_donator) > 2";
	};
	class civvip6 {
		title = "Комсомолка";
		image = "\union_passports\data\donate\passport_civ_vip_6.paa";
		side = "civ";
		conditions = "(call life_donator) > 2";
	};
	class civvip7 {
		title = "Фанатка";
		image = "\union_passports\data\donate\passport_civ_vip_7.paa";
		side = "civ";
		conditions = "(call life_donator) > 2";
	};
	class civvip8 {
		title = "Шахтер";
		image = "\union_passports\data\donate\passport_civ_vip_8.paa";
		side = "civ";
		conditions = "(call life_donator) > 2";
	};
	class civvip9 {
		title = "Усач";
		image = "\union_passports\data\donate\passport_civ_vip_9.paa";
		side = "civ";
		conditions = "(call life_donator) > 2";
	};
	class civvip10 {
		title = "На стиле";
		image = "\union_passports\data\donate\passport_civ_vip_10.paa";
		side = "civ";
		conditions = "(call life_donator) > 2";
	};
	class civvip11 {
		title = "Дайте две";
		image = "\union_passports\data\donate\passport_civ_vip_11.paa";
		side = "civ";
		conditions = "(call life_donator) > 2";
	};
	class civvip12 {
		title = "Проблемы?";
		image = "\union_passports\data\donate\passport_civ_vip_12.paa";
		side = "civ";
		conditions = "(call life_donator) > 2";
	};
	class civvip13 {
		title = "Котэ";
		image = "\union_passports\data\donate\passport_civ_vip_13.paa";
		side = "civ";
		conditions = "(call life_donator) > 2";
	};
	class civvip14 {
		title = "Роооок";
		image = "\union_passports\data\donate\passport_civ_vip_14.paa";
		side = "civ";
		conditions = "(call life_donator) > 2";
	};
	class civvip15 {
		title = "Нупазазя";
		image = "\union_passports\data\donate\passport_civ_vip_15.paa";
		side = "civ";
		conditions = "(call life_donator) > 2";
	};
	class civvip16 {
		title = "Упоротый";
		image = "\union_passports\data\donate\passport_civ_vip_16.paa";
		side = "civ";
		conditions = "(call life_donator) > 2";
	};

	//reb

	class rebdefault {
		title = "Стандарт";
		image = "\union_passports\data\passport_reb.paa";
		side = "reb";
		conditions = "";
	};
	class rebvip1 {
		title = "Криминал";
		image = "\union_passports\data\donate\passport_reb_vip_1.paa";
		side = "reb";
		conditions = "(call life_donator) > 2";
	};
	class rebvip2 {
		title = "Цезарь";
		image = "\union_passports\data\donate\passport_reb_vip_2.paa";
		side = "reb";
		conditions = "(call life_donator) > 2";
	};
	class rebvip3 {
		title = "Пабло Эскобар";
		image = "\union_passports\data\donate\passport_reb_vip_3.paa";
		side = "reb";
		conditions = "(call life_donator) > 2";
	};
	class rebvip4 {
		title = "Че Гевара";
		image = "\union_passports\data\donate\passport_reb_vip_4.paa";
		side = "reb";
		conditions = "(call life_donator) > 2";
	};
	class rebvip5 {
		title = "Капитан Америка";
		image = "\union_passports\data\donate\passport_reb_vip_5.paa";
		side = "reb";
		conditions = "(call life_donator) > 2";
	};
	class rebvip6 {
		title = "Травокур";
		image = "\union_passports\data\donate\passport_reb_vip_6.paa";
		side = "reb";
		conditions = "(call life_donator) > 2";
	};
	class rebvip7 {
		title = "Команданто";
		image = "\union_passports\data\donate\passport_reb_vip_7.paa";
		side = "reb";
		conditions = "(call life_donator) > 2";
	};
	class rebvip8 {
		title = "Фанатка";
		image = "\union_passports\data\donate\passport_reb_vip_8.paa";
		side = "reb";
		conditions = "(call life_donator) > 2";
	};
	class rebvip9 {
		title = "Комсомолка";
		image = "\union_passports\data\donate\passport_reb_vip_9.paa";
		side = "reb";
		conditions = "(call life_donator) > 2";
	};
	class rebvip10 {
		title = "Наемник";
		image = "\union_passports\data\donate\passport_reb_vip_10.paa";
		side = "reb";
		conditions = "(call life_donator) > 2";
	};
	class rebvip11 {
		title = "Упоротый";
		image = "\union_passports\data\donate\passport_reb_vip_11.paa";
		side = "reb";
		conditions = "(call life_donator) > 2";
	};
	class rebvip12 {
		title = "Нупазазя";
		image = "\union_passports\data\donate\passport_reb_vip_12.paa";
		side = "reb";
		conditions = "(call life_donator) > 2";
	};
	class rebvip13 {
		title = "Роооок";
		image = "\union_passports\data\donate\passport_reb_vip_13.paa";
		side = "reb";
		conditions = "(call life_donator) > 2";
	};
	class rebvip14 {
		title = "Котэ";
		image = "\union_passports\data\donate\passport_reb_vip_14.paa";
		side = "reb";
		conditions = "(call life_donator) > 2";
	};
	class rebvip15 {
		title = "Проблемы?";
		image = "\union_passports\data\donate\passport_reb_vip_15.paa";
		side = "reb";
		conditions = "(call life_donator) > 2";
	};

	//civ gang
	class gov {
		title = "Губернатор";
		image = "\union_passports\data\gov\passport_gover.paa";
		side = "civ";
		conditions = "life_gov";
	};
	class premier {
		title = "Премьер-министр";
		image = "\union_passports\data\gov\passport_pm.paa";
		side = "civ";
		conditions = "life_gov";
	};
	class senator {
		title = "Губернатор";
		image = "\union_passports\data\gov\passport_sen.paa";
		side = "civ";
		conditions = "license_civ_sen";
	};
	class taxi {
		title = "Такси";
		image = "\union_passports\data\gov\passport_taxi.paa";
		side = "civ";
		conditions = "license_civ_taxi";
	};
	class press {
		title = "7NEWS";
		image = "\union_passports\data\gov\passport_press.paa";
		side = "civ";
		conditions = "license_civ_press";
	};
	class led {
		title = "LED";
		image = "\union_passports\data\gov\passport_led.paa";
		side = "civ";
		conditions = "license_civ_led";
	};
	class vl {
		title = "VL";
		image = "\union_passports\data\prem\passport_vl.paa";
		side = "civ";
		conditions = "license_civ_vl";
	};
	class ira {
		title = "IRA";
		image = "\union_passports\data\prem\passport_ira.paa";
		side = "civ";
		conditions = "license_civ_ira";
	};
	class fb {
		title = "FB";
		image = "\union_passports\data\prem\passport_fb.paa";
		side = "civ";
		conditions = "license_civ_fb";
	};
	class faj {
		title = "FAJ";
		image = "\union_passports\data\prem\passport_faj.paa";
		side = "civ";
		conditions = "license_civ_ccp";
	};
	class ics {
		title = "ICS";
		image = "\union_passports\data\prem\passport_ics.paa";
		side = "civ";
		conditions = "license_civ_ics";
	};
	class bst {
		title = "BST";
		image = "\union_passports\data\prem\passport_bst.paa";
		side = "civ";
		conditions = "license_civ_bst";
	};
	class bf {
		title = "BHS";
		image = "\union_passports\data\prem\passport_bhs.paa";
		side = "civ";
		conditions = "license_civ_bf";
	};
	class mfo {
		title = "ST";
		image = "\union_passports\data\prem\passport_mfo.paa";
		side = "reb";
		conditions = "license_reb_mfo";
	};

	//reb gang

	class arg {
		title = "ARG";
		image = "\union_passports\data\prem\passport_arg.paa";
		side = "reb";
		conditions = "license_reb_arg";
	};

	class aff {
		title = "14K";
		image = "\14k_pack\uniform\logo.paa";
		side = "reb";
		conditions = "license_reb_aff";
	};

	class sdr {
		title = "SP";
		image = "\union_passports\data\donate\passport_reb_vip_14.paa";
		side = "reb";
		conditions = "license_reb_sdr";
	};

	class nsb {
		title = "KSK";
		image = "\union_passports\data\prem\passport_nsb.paa";
		side = "reb";
		conditions = "license_reb_nsb";
	};

	class mc {
		title = "W";
		image = "\union_passports\data\prem\passport_mc.paa";
		side = "reb";
		conditions = "license_reb_mc";
	};

	class rfa {
		title = "MF";
		image = "\union_passports\data\prem\passport_rfa.paa";
		side = "reb";
		conditions = "license_reb_rfa";
	};

	class cds {
		title = "CDS";
		image = "\union_passports\data\prem\passport_cds.paa";
		side = "reb";
		conditions = "license_reb_la";
	};

	class fsg {
		title = "FSG";
		image = "\union_passports\data\prem\passport_fsg.paa";
		side = "reb";
		conditions = "license_reb_fsg";
	};

	//west

	class copdefault {
		title = "Полицейский";
		image = "\union_passports\data\gov\passport_police.paa";
		side = "cop";
		conditions = "";
	};
	class academy {
		title = "Кадет";
		image = "\union_passports\data\gov\passport_academy.paa";
		side = "cop";
		conditions = "life_coplevel == 1";
	};
	class sheriff {
		title = "Шериф";
		image = "\union_passports\data\gov\passport_sheriff.paa";
		side = "cop";
		conditions = "life_coplevel == 20";
	};
	class detective {
		title = "Детектив";
		image = "\union_passports\data\gov\passport_detective.paa";
		side = "cop";
		conditions = "life_coplevel == 21";
	};
	class dea {
		title = "DEA";
		image = "\union_passports\data\gov\passport_dea.paa";
		side = "cop";
		conditions = "life_coplevel == 22";
	};
	class swat {
		title = "SWAT";
		image = "\union_passports\data\gov\passport_swat.paa";
		side = "cop";
		conditions = "life_coplevel == 23";
	};
	class cia {
		title = "CIA";
		image = "\union_passports\data\gov\passport_cia.paa";
		side = "cop";
		conditions = "life_coplevel in [27,28]";
	};

	//medic
	class meddefault {
		title = "Медик";
		image = "\union_passports\data\gov\passport_medic.paa";
		side = "med";
		conditions = "";
	};

	//special
	class rebskull {
		title = "Головорез";
		image = "\union_passports\data\passport_skull.paa";
		side = "reb";
		conditions = "((group player) getVariable [""gang_id"",-1]) isEqualTo (server_gangsRating select 0 select 0)";
	};
	class seasonOneWinner {
		title = "BG Season 1 Winner";
		image = "\union_passports\data\passport_season1.paa";
		side = "reb";
		conditions = "((group player) getVariable [""gang_license"",-1]) isEqualTo ""aff""";
	};
	class civskull: rebskull {
		side = "civ";
	};
	//CIA
	class ciaciv {
		title = "Гражданский";
		image = "\union_passports\data\passport_civ.paa";
		side = "cop";
		conditions = "life_coplevel in [27,28]";
	};
};