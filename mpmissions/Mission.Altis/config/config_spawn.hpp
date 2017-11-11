/*

	displayName = Отображаемое название
	spawnMarker = имя маркера на карте
	icon = полный путь к иконке
	conditions = требования, необходимые для спауна на этой точке (не забыть (life_firstTime OR life_newLife))

*/
class LifeCfgSpawnPoints {
	class Altis {
		class Civ {
			class GovBase {
				displayName = "Усадьба Губернатора";
				spawnMarker = "gov_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && (life_gov OR license_civ_sen)";
			};
			class Bst {
				displayName = "Бастион";
				spawnMarker = "base_bst";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_civ_bst";
			};
			class Kavala {
				displayName = "Кавала";
				spawnMarker = "civ_spawn_1";
				icon = "\union_pack\icons\city.paa";
				conditions = "life_firstTime OR life_newLife";
			};
			class Pirgos {
				displayName = "Пиргос";
				spawnMarker = "civ_spawn_2";
				icon = "\union_pack\icons\city.paa";
				conditions = "life_firstTime OR life_newLife";
			};
			class Atira {
				displayName = "Атира";
				spawnMarker = "civ_spawn_3";
				icon = "\union_pack\icons\city.paa";
				conditions = "life_firstTime OR life_newLife";
			};
			class Sofia {
				displayName = "София";
				spawnMarker = "civ_spawn_4";
				icon = "\union_pack\icons\city.paa";
				conditions = "life_firstTime OR life_newLife";
			};

			class Vl {
				displayName = "База VL";
				spawnMarker = "vl_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_civ_vl";
			};

			class Press {
				displayName = "База 7новостей";
				spawnMarker = "press_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_civ_press";
			};
			class Taxi {
				displayName = "Таксопарк";
				spawnMarker = "taxi_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_civ_taxi";
			};

			class Led {
				displayName = "Офис Прокурора";
				spawnMarker = "led_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_civ_led";
			};
			class Ira {
				displayName = "База IRA";
				spawnMarker = "ira_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_civ_ira";
			};
			class Fb {
				displayName = "База FB";
				spawnMarker = "fb_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_civ_fb";
			};
			class bf_base_spawn {
				displayName = "База BHS";
				spawnMarker = "bf_base_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_civ_bf";
			};
			class Faj {
				displayName = "База FAJ";
				spawnMarker = "ccp_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_civ_ccp";
			};


		};
		class Reb {
			class Capital {
				displayName = "Столица повстанцев";
				spawnMarker = "reb_city_spawn_1";
				icon = "\union_pack\icons\rebel.paa";
				conditions = "life_firstTime OR life_newLife";
			};
			class Base1 {
				displayName = "База повстанцев 1";
				spawnMarker = "reb_spawn_1";
				icon = "\union_pack\icons\rebel.paa";
				conditions = "life_firstTime OR life_newLife";
			};
			class Base2 {
				displayName = "База повстанцев 2";
				spawnMarker = "reb_spawn_2";
				icon = "\union_pack\icons\rebel.paa";
				conditions = "life_firstTime OR life_newLife";
			};
			class Base3 {
				displayName = "База повстанцев 3";
				spawnMarker = "reb_spawn_3";
				icon = "\union_pack\icons\rebel.paa";
				conditions = "life_firstTime OR life_newLife";
			};

			class Sdr {
				displayName = "База Saint Patrick";
				spawnMarker = "sdr_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_reb_sdr";
			};
			class Mfo {
				displayName = "База STELS";
				spawnMarker = "mfo_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_reb_mfo";
			};
			/*class SdrEast {
				displayName = "База SDR Восток";
				spawnMarker = "sdr_east_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_reb_sdr";
			};
			class SdrNorth {
				displayName = "База SDR Север";
				spawnMarker = "sdr_north_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_reb_sdr";
			};*/

			/*class AffSouth {
				displayName = "База AFF Юг";
				spawnMarker = "aff_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_reb_aff";
			};
			class AffNorth {
				displayName = "База AFF Север";
				spawnMarker = "aff2_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_reb_aff";
			};*/

			class Aff {
				displayName = "База 14К";
				spawnMarker = "aff_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_reb_aff";
			};
			class Nsb {
				displayName = "База KSK";
				spawnMarker = "nsb_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_reb_nsb";
			};

			/*class NsbSouth {
				displayName = "База NSB Юг";
				spawnMarker = "nsb_spawn_south";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_reb_nsb";
			};*/

			class Arg {
				displayName = "База ARG";
				spawnMarker = "arg_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_reb_arg";
			};
			class Nomads {
				displayName = "База NOMADS";
				spawnMarker = "nmd_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_reb_nmd";
			};
			class Mc {
				displayName = "База W";
				spawnMarker = "mc_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_reb_mc";
			};
			class Rfa {
				displayName = "База MF";
				spawnMarker = "rfa_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_reb_rfa";
			};
			class Fsg {
				displayName = "База FSG";
				spawnMarker = "fsg_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_reb_fsg";
			};
		};
		class Cop {
			class Kavala {
				displayName = "Кавала";
				spawnMarker = "cop_spawn_1";
				icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
				conditions = "";
			};
			class Pirgos {
				displayName = "Пиргос";
				spawnMarker = "cop_spawn_2";
				icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
				conditions = "";
			};
			class Atira {
				displayName = "Атира";
				spawnMarker = "cop_spawn_3";
				icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
				conditions = "";
			};
			class AirBase {
				displayName = "Воздушный патруль";
				spawnMarker = "cop_spawn_4";
				icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
				conditions = "";
			};
			class Sofia {
				displayName = "КПП София";
				spawnMarker = "cop_spawn_5";
				icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
				conditions = "";
			};
			class Prison {
				displayName = "Тюрьма";
				spawnMarker = "cop_spawn_6";
				icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
				conditions = "";
			};
			class Opr {
				displayName = "ОФис OPR";
				spawnMarker = "opr_spawn";
				icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
				conditions = "life_coplevel == 19";
			};
		};
		class Med {
			class Kavala {
				displayName = "Кавала";
				spawnMarker = "medic_spawn_1";
				icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
				conditions = "";
			};
			class Atira {
				displayName = "Атира";
				spawnMarker = "medic_spawn_2";
				icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
				conditions = "";
			};
			class Pirgos {
				displayName = "Пиргос";
				spawnMarker = "medic_spawn_3";
				icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
				conditions = "";
			};
			class Sofia {
				displayName = "София";
				spawnMarker = "medic_spawn_4";
				icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
				conditions = "";
			};
		};
	};
	class kerama {
		class Civ {
			class Georgetown {
				displayName = "Джорджтаун";
				spawnMarker = "civ_spawn_1";
				icon = "\union_pack\icons\base.paa";
				conditions = "life_firstTime OR life_newLife";
			};
			class Lifou {
				displayName = "Лифоу";
				spawnMarker = "civ_spawn_2";
				icon = "\union_pack\icons\base.paa";
				conditions = "life_firstTime OR life_newLife";
			};
			class LaRochelle {
				displayName = "Ла-Рошель";
				spawnMarker = "civ_spawn_3";
				icon = "\union_pack\icons\base.paa";
				conditions = "life_firstTime OR life_newLife";
			};
			class Oumere {
				displayName = "Оумере";
				spawnMarker = "civ_spawn_4";
				icon = "\union_pack\icons\base.paa";
				conditions = "life_firstTime OR life_newLife";
			};

			class Press {
				displayName = "База 7новостей";
				spawnMarker = "press_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_civ_press";
			};
			class Taxi {
				displayName = "Таксопарк";
				spawnMarker = "taxi_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_civ_taxi";
			};
		};
		class Reb {
			class Lindzhihaven {
				displayName = "Линджихавен";
				spawnMarker = "reb_spawn_1";
				icon = "\union_pack\icons\rebel.paa";
				conditions = "life_firstTime OR life_newLife";
			};
			class Tuvanaka {
				displayName = "Туванака";
				spawnMarker = "reb_spawn_2";
				icon = "\union_pack\icons\rebel.paa";
				conditions = "life_firstTime OR life_newLife";
			};
			class Katkoula {
				displayName = "Каткоула";
				spawnMarker = "reb_spawn_3";
				icon = "\union_pack\icons\rebel.paa";
				conditions = "life_firstTime OR life_newLife";
			};
			class Nsb {
				displayName = "База NSB";
				spawnMarker = "nsb_spawn";
				icon = "\union_pack\icons\base.paa";
				conditions = "(life_firstTime OR life_newLife) && license_reb_nsb";
			};
		};
		class Cop {
			class Julien {
				displayName = "Сен Жюльен";
				spawnMarker = "cop_spawn_1";
				icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
				conditions = "";
			};
			class Airport {
				displayName = "Аэропорт Багам";
				spawnMarker = "cop_spawn_2";
				icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
				conditions = "";
			};
			class Oumere {
				displayName = "Оумере";
				spawnMarker = "cop_spawn_3";
				icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
				conditions = "";
			};
			class Prison {
				displayName = "Тюрьма";
				spawnMarker = "cop_spawn_prison";
				icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
				conditions = "";
			};
			class CiaBase {
				displayName = "База CIA";
				spawnMarker = "cia_spawn";
				icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
				conditions = "life_coplevel == 26";
			};
		};
		class Med {
			class Georgetown {
				displayName = "Джорджтаун";
				spawnMarker = "medic_spawn_1";
				icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
				conditions = "";
			};
			class Vagalala {
				displayName = "Вагалала";
				spawnMarker = "medic_spawn_2";
				icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
				conditions = "";
			};
			class Lindzhihaven {
				displayName = "Линджихавен";
				spawnMarker = "medic_spawn_3";
				icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
				conditions = "";
			};
		};
	};
};