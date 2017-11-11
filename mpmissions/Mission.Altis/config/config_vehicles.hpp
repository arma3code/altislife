/*

	class {
		vItemSpace = вместительность багажника для виртуальных предметов (0 = нету)
		conditions = условия в формате "true" (пока что не используется)
		price = базовая цена
		textures[] = {
			{"класс из LifeCfgVehTextures", {"флаг маназина техники"}, "conditions для использования этого цвета" }
		};
		materials[] = {классы из LifeCfgVehMaterials};
	};


*/

class LifeCfgVehicles {
	class vet_GAZ_2975_Tiger_special_version {
		vItemSpace = 0;
		conditions = "";
		price = 5000000;
		textures[] = {
			{"shnk_b", {"swat"}, "" }
		};
		materials[] = {"glossy","matte"};
	};
	class I_UGV_01_F {
		vItemSpace = 0;
		conditions = "";
		price = 50000;
		textures[] = {};
		materials[] = {};
	};
	class B_UGV_01_F: I_UGV_01_F {};
	class B_UAV_02_F: I_UGV_01_F {};

	class dbo_CIV_ol_bike {
		vItemSpace = 0;
		conditions = "";
		price = 250;
		textures[] = {};
		materials[] = {};
	};

	class dbo_CIV_new_bike {
		vItemSpace = 0;
		conditions = "";
		price = 300;
		textures[] = {};
		materials[] = {};
	};
	class dbo_CIV_new_bike_R: dbo_CIV_new_bike {};
	class dbo_CIV_new_bike_B: dbo_CIV_new_bike {};

	class C_Kart_01_Blu_F {
		vItemSpace = 0;
		conditions = "";
		price = 2000;
		textures[] = {};
		materials[] = {};
	};
	class C_Kart_01_Fuel_F: C_Kart_01_Blu_F {};
	class C_Kart_01_Red_F: C_Kart_01_Blu_F {};
	class C_Kart_01_Vrana_F: C_Kart_01_Blu_F {};

	class C_Offroad_01_F {
		vItemSpace = 65;
		conditions = "";
		price = 3000;
		textures[] = {
			{"ffrd_r", {"civ","cia"}, "" },
			{"ffrd_y", {"civ","cia"}, "" },
			{"ffrd_w", {"civ","cia"}, "" },
			{"ffrd_b", {"civ","cia"}, "" },
			{"ffrd_br", {"civ","cia"}, "" },
			{"ffrd_bw", {"civ","cia"}, "" },
			{"ffrd_sb", {"civ","reb","cia"}, "(call life_donator) > 0" },
			{"ffrd_cop", {"cop"}, "" },
			{"rgb_cy", {"civ","cia"}, "" },
			{"ffrd_med", {"med"}, "" },
			{"ffrd_v1", {"civ","reb","cia"}, "(call life_donator) > 0" },
			{"ffrd_7n", {"press"}, "" },
			{"ffrd_ro", {"civ","reb","cia"}, "(call life_donator) > 0" },
			{"ffrd_bear", {"civ","reb","cia"}, "(call life_donator) > 0" },
			{"ffrd_2l", {"civ","reb","cia"}, "(call life_donator) > 0" },
			{"ffrd_gv", {"civ","reb","cia"}, "(call life_donator) > 0" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class EXT_W_Offroad_01_F {
		vItemSpace = 65;
		conditions = "";
		price = 3000;
		textures[] = {};
		materials[] = {};
	};
	class C_Offroad_01_repair_F {
		vItemSpace = 65;
		conditions = "";
		price = 15000;
		textures[] = {
			{"ffrd_r_m1", {"med"}, ""},
			{"ffrd_r_m2", {"med"}, "" }
		};
		materials[] = {};
	};
	class B_G_Offroad_01_F {
		vItemSpace = 65;
		conditions = "";
		price = 4000;
		textures[] = {
			{"ffrd_bg_r", {"reb"}, "" },
			{"ffrd_bg_rv", {"reb"}, "(call life_donator) > 0" }
		};
		materials[] = {};
	};
	class B_mas_cars_Hilux_Unarmed {
		vItemSpace = 65;
		conditions = "";
		price = 7000;
		textures[] = {};
		materials[] = {};
	};
	class B_Quadbike_01_F {
		vItemSpace = 25;
		conditions = "";
		price = 500;
		textures[] = {
			{"qdbk_cop", {"cop"}, "" },
			{"qdbk_reb", {"reb"}, "" },
			{"qdbk_b", {"civ"}, "" },
			{"qdbk_bl", {"civ"}, "" },
			{"qdbk_r", {"civ"}, "" },
			{"qdbk_w", {"civ"}, "" },
			{"qdbk_g", {"civ"}, "" },
			{"qdbk_cm", {"reb"}, "" }
		};
		materials[] = {};
	};
	class gac_jsdf_klx {
		vItemSpace = 25;
		conditions = "";
		price = 1000;
		textures[] = {};
		materials[] = {};
	};
	class I_Truck_02_covered_F {
		vItemSpace = 250;
		conditions = "";
		price = 10000;
		textures[] = {
			{"itc_cm", {"reb"}, "" },
			{"itc_cia", {"cia"}, "" }
		};
		materials[] = {};
	};
	class O_Truck_02_covered_F {
		vItemSpace = 250;
		conditions = "";
		price = 10000;
		textures[] = {};
		materials[] = {};
	};
	class I_Truck_02_covered_CIV_F {
		vItemSpace = 250;
		conditions = "";
		price = 10000;
		textures[] = {
			{"itcc_or", {"civ"}, "" },
			{"itcc_r", {"civ"}, "(call life_donator) > 0" },
			{"itcc_s", {"civ"}, "(call life_donator) > 0" },
			{"itcc_w", {"civ"}, "(call life_donator) > 0" },
			{"itcc_y", {"civ"}, "(call life_donator) > 0" }
		};
		materials[] = {};
	};
	class O_Truck_02_fuel_F {
		vItemSpace = 250;
		conditions = "";
		price = 10000;
		textures[] = {};
		materials[] = {};
	};
	class I_Truck_02_transport_F {
		vItemSpace = 200;
		conditions = "";
		price = 7500;
		textures[] = {
			{"itcc_or", {"civ","cia"}, "" },
			{"itc_cia", {"cop"}, "" },
			{"itc_cm", {"reb"}, "" }
		};
		materials[] = {};
	};
	class C_Hatchback_01_F {
		vItemSpace = 40;
		conditions = "";
		price = 2000;
		textures[] = {
			{"htchb_bs", {"civ","cia"}, "" },
			{"htchb_g", {"civ"}, "" },
			{"htchb_bl", {"civ"}, "" },
			{"htchb_bbl", {"civ","cia"}, "" },
			{"htchb_y", {"civ"}, "" },
			{"htchb_w", {"civ"}, "" },
			{"htchb_gr", {"civ","cia"}, "" },
			{"htchb_b", {"civ"}, "" }
		};
		materials[] = {"glossy","matte","metallic"};
	};
	class max_bike {
		vItemSpace = 30;
		conditions = "";
		price = 2500;
		textures[] = {};
		materials[] = {};
	};
	class max_bike_b: max_bike {};
	class max_bike_db: max_bike {};
	class max_bike_dg: max_bike {};
	class max_bike_dr: max_bike {};
	class max_bike_w: max_bike {};

	class nomads_bike {
		vItemSpace = 30;
		conditions = "";
		price = 2500;
		textures[] = {};
		materials[] = {};
	};
	class shounka_harley_a3 {
		vItemSpace = 65;
		conditions = "";
		price = 2500;
		textures[] = {};
		materials[] = {};
	};
	class shounka_harley_a3_bleu: shounka_harley_a3 {};
	class shounka_harley_a3_lolz: shounka_harley_a3 {};
	class shounka_harley_a3_noir: shounka_harley_a3 {};
	class shounka_harley_a3_rouge: shounka_harley_a3 {};
	class xarley: shounka_harley_a3 {};

	class RDS_Lada_Civ_01 {
		vItemSpace = 45;
		conditions = "";
		price = 700;
		textures[] = {};
		materials[] = {};
	};
	class RDS_Lada_Civ_02: RDS_Lada_Civ_01 {};
	class RDS_Lada_Civ_03: RDS_Lada_Civ_01 {};
	class RDS_Lada_Civ_04: RDS_Lada_Civ_01 {};
	class RDS_Lada_Civ_05: RDS_Lada_Civ_01 {};
	class RDS_Lada_Civ_06: RDS_Lada_Civ_01 {};
	class RDS_Lada_Civ_07: RDS_Lada_Civ_01 {};

	class RDS_Gaz24_Civ_01 {
		vItemSpace = 45;
		conditions = "";
		price = 800;
		textures[] = {};
		materials[] = {};
	};
	class RDS_Gaz24_Civ_02: RDS_Gaz24_Civ_01 {};
	class RDS_Gaz24_Civ_03: RDS_Gaz24_Civ_01 {};

	class RDS_Golf4_Civ_01 {
		vItemSpace = 45;
		conditions = "";
		price = 900;
		textures[] = {};
		materials[] = {};
	};
	class RDS_Golf4_Civ_02: RDS_Golf4_Civ_01 {};
	class RDS_Golf4_Civ_03: RDS_Golf4_Civ_01 {};
	class RDS_Golf4_Civ_04: RDS_Golf4_Civ_01 {};
	class RDS_Golf4_Civ_05: RDS_Golf4_Civ_01 {};
	class RDS_Golf4_Civ_06: RDS_Golf4_Civ_01 {};

	class RDS_S1203_Civ_01 {
		vItemSpace = 45;
		conditions = "";
		price = 900;
		textures[] = {};
		materials[] = {};
	};
	class RDS_S1203_Civ_04: RDS_S1203_Civ_01 {};
	class RDS_S1203_Civ_05: RDS_S1203_Civ_01 {};
	class RDS_S1203_Civ_06: RDS_S1203_Civ_01 {};
	class RDS_S1203_Civ_07: RDS_S1203_Civ_01 {};
	class RDS_S1203_Civ_08: RDS_S1203_Civ_01 {};


	class C_Hatchback_01_sport_F {
		vItemSpace = 45;
		conditions = "";
		price = 15000;
		textures[] = {
			{"htchbs_r", {"civ","reb"}, "" },
			{"htchbs_br", {"civ","reb","cia"}, "" },
			{"htchbs_o", {"civ","reb"}, "" },
			{"htchbs_bw", {"civ","reb"}, "" },
			{"htchbs_t", {"civ","reb","cia"}, "" },
			{"htchbs_g", {"civ","reb"}, "" },
			{"htchbs_cop", {"cop"}, "" },
			{"htchbs_va", {"civ","reb","cia"}, "" },
			{"htchbs_vme", {"civ","reb","cia"}, "" },
			{"htchbs_h", {"civ","reb"}, "" },
			{"htchbs_s", {"civ","reb"}, "" }
		};
		materials[] = {"glossy","matte","metallic"};
	};
	class C_Hatchback_01_sport_Taxi {
		vItemSpace = 45;
		conditions = "";
		price = 15000;
		textures[] = {};
		materials[] = {};
	};
	class C_SUV_01_F {
		vItemSpace = 50;
		conditions = "";
		price = 10000;
		textures[] = {
			{"suv_br", {"civ","cia"}, "" },
			{"suv_b", {"civ","cia"}, "" },
			{"suv_s", {"civ"}, "" },
			{"suv_o", {"civ"}, "" },
			{"suv_cop", {"cop"}, "" },
			{"suv_vx6", {"civ","reb","cia"}, "(call life_donator) > 0" },
			{"suv_vd", {"civ","reb","cia"}, "(call life_donator) > 0" },
			{"suv_vnc", {"civ","reb","cia"}, "(call life_donator) > 0" },
			{"suv_vo", {"civ","reb"}, "(call life_donator) > 0" },
			{"suv_vs", {"civ","reb"}, "(call life_donator) > 0" },
			{"suv_vpm", {"civ","reb"}, "(call life_donator) > 0" },
			{"suv_vme", {"civ","reb"}, "(call life_donator) > 0" },
			{"suv_vgr", {"civ","reb"}, "(call life_donator) > 0" },
			{"suv_vsw", {"civ","reb"}, "(call life_donator) > 0" },
			{"suv_vcx", {"civ","reb"}, "(call life_donator) > 0" },
			{"suv_vfs", {"civ","reb"}, "(call life_donator) > 0" },
			{"suv_vme2", {"civ","reb"}, "(call life_donator) > 0" }
		};
		materials[] = {"glossy","matte","metallic"};
	};
	class C_Van_01_transport_F {
		vItemSpace = 100;
		conditions = "";
		price = 5000;
		textures[] = {
			{"vtt_w", {"civ","cia"}, "" },
			{"vtt_r", {"civ","cia"}, "" }
		};
		materials[] = {};
	};
	class C_Van_01_fuel_F {
		vItemSpace = 100;
		conditions = "";
		price = 5000;
		textures[] = {};
		materials[] = {};
	};
	class I_G_Van_01_transport_F {
		vItemSpace = 100;
		conditions = "";
		price = 5000;
		textures[] = {};
		materials[] = {};
	};
	class C_Van_01_box_F {
		vItemSpace = 150;
		conditions = "";
		price = 6000;
		textures[] = {
			{"vtt_w", {"civ"}, "" },
			{"vtt_r", {"civ"}, "" }
		};
		materials[] = {};
	};
	class C_Boat_Civil_01_F {
		vItemSpace = 85;
		conditions = "";
		price = 5000;
		textures[] = {};
		materials[] = {};
	};
	class B_SDV_01_F {
		vItemSpace = 85;
		conditions = "";
		price = 50000;
		textures[] = {};
		materials[] = {};
	};
	class I_SDV_01_F: B_SDV_01_F{};

	class C_Boat_Civil_01_police_F {
		vItemSpace = 85;
		conditions = "";
		price = 16000;
		textures[] = {};
		materials[] = {};
	};
	class C_Boat_Civil_01_rescue_F {
		vItemSpace = 85;
		conditions = "";
		price = 16000;
		textures[] = {};
		materials[] = {};
	};
	class Burnes_MK10_1 {
		vItemSpace = 100;
		conditions = "";
		price = 50000;
		textures[] = {};
		materials[] = {};
	};
	class extremo_lcm {
		vItemSpace = 100;
		conditions = "";
		price = 50000;
		textures[] = {};
		materials[] = {};
	};
	class GeK_Ferry {
		vItemSpace = 1000;
		conditions = "";
		price = 2000000;
		textures[] = {};
		materials[] = {};
	};
	class C_Fishing_Boat_Apex {
		vItemSpace = 800;
		conditions = "";
		price = 50000;
		textures[] = {};
		materials[] = {};
	};
	class Shalllop {
		vItemSpace = 400;
		conditions = "";
		price = 20000;
		textures[] = {};
		materials[] = {};
	};
	class C_Fishing_Boat {
		vItemSpace = 800;
		conditions = "";
		price = 50000;
		textures[] = {};
		materials[] = {};
	};
	class B_Truck_01_box_F {
		vItemSpace = 1200;
		conditions = "";
		price = 200000;
		textures[] = {};
		materials[] = {};
	};
	class B_Truck_01_box_CIV_F {
		vItemSpace = 1200;
		conditions = "";
		price = 200000;
		textures[] = {
			{"hmt_def", {"civ"}, "" },
			{"hmt_bl", {"civ"}, "(call life_donator) > 0" },
			{"hmt_gs", {"civ"}, "(call life_donator) > 0" },
			{"hmt_mh", {"civ"}, "(call life_donator) > 0" },
			{"hmt_or", {"civ"}, "(call life_donator) > 0" },
			{"hmt_pr", {"civ"}, "(call life_donator) > 0" },
			{"hmt_r", {"civ"}, "(call life_donator) > 0" },
			{"hmt_y", {"civ"}, "(call life_donator) > 0" }
		};
		materials[] = {};
	};
	class B_Truck_01_fuel_F {
		vItemSpace = 1200;
		conditions = "";
		price = 200000;
		textures[] = {};
		materials[] = {};
	};
	class B_Truck_01_fuel_CIV_F {
		vItemSpace = 1200;
		conditions = "";
		price = 200000;
		textures[] = {
			{"tfc_def", {"civ"}, "" },
			{"tfc_bl", {"civ"}, "(call life_donator) > 0" },
			{"tfc_gs", {"civ"}, "(call life_donator) > 0" },
			{"tfc_mh", {"civ"}, "(call life_donator) > 0" },
			{"tfc_or", {"civ"}, "(call life_donator) > 0" },
			{"tfc_pr", {"civ"}, "(call life_donator) > 0" },
			{"tfc_r", {"civ"}, "(call life_donator) > 0" },
			{"tfc_y", {"civ"}, "(call life_donator) > 0" }
		};
		materials[] = {};
	};
	class B_Truck_01_mover_F {
		vItemSpace = 400;
		conditions = "";
		price = 50000;
		textures[] = {
			{"hmt_def", {"civ"}, "" },
			{"hmt_bl", {"civ"}, "(call life_donator) > 0" },
			{"hmt_gs", {"civ"}, "(call life_donator) > 0" },
			{"hmt_mh", {"civ"}, "(call life_donator) > 0" },
			{"hmt_or", {"civ"}, "(call life_donator) > 0" },
			{"hmt_pr", {"civ"}, "(call life_donator) > 0" },
			{"hmt_r", {"civ"}, "(call life_donator) > 0" },
			{"hmt_y", {"civ"}, "(call life_donator) > 0" }
		};
		materials[] = {};
	};
	class B_Truck_01_transport_F {
		vItemSpace = 600;
		conditions = "";
		price = 75000;
		textures[] = {};
		materials[] = {};
	};
	class B_Truck_01_covered_F {
		vItemSpace = 600;
		conditions = "";
		price = 75000;
		textures[] = {};
		materials[] = {};
	};
	class I_mas_cars_Ural_fuel {
		vItemSpace = 600;
		conditions = "";
		price = 70000;
		textures[] = {};
		materials[] = {};
	};
	class I_mas_cars_Ural {
		vItemSpace = 400;
		conditions = "";
		price = 30000;
		textures[] = {};
		materials[] = {};
	};
	class I_mas_cars_Ural_open {
		vItemSpace = 400;
		conditions = "";
		price = 25000;
		textures[] = {};
		materials[] = {};
	};
	class BHS_ifrit {
		vItemSpace = 60;
		conditions = "";
		price = 80000;
		textures[] = {};
		materials[] = {"matte","metallic"};
	};
	class B_MRAP_01_F {
		vItemSpace = 65;
		conditions = "";
		price = 60000;
		textures[] = {
			{"bmrp_cia", {"cia"}, "" },
			{"bmrp_ds", {"civ"}, "" }
		};
		materials[] = {};
	};
	class O_MRAP_02_F {
		vItemSpace = 60;
		conditions = "";
		price = 80000;
		textures[] = {
			{"mrp_g", {"reb","rebgang"}, "" },
			{"mrp_med", {"med"}, "" },
			{"mrp_cg", {"civgang"}, "" },
			{"mrp_ur", {"civ","reb"}, "(call life_donator) > 0" },
			{"mrp_amc", {"amcold"}, "" },
			{"mrp_sdr", {"sdr"}, "" },
			{"mrp_aff", {"aff"}, "" },
			{"mrp_arg", {"arg"}, "" },
			{"mrp_fb", {"fb"}, "" },
			{"mrp_swat", {"swat"}, "" },
			{"mrp_dea", {"dea"}, "" },
			{"mrp_7n", {"press"}, "" },
			{"mrp_vl", {"vl"}, "" },
			{"mrp_mc", {"mc"}, "" },
			{"mrp_rfa", {"rfa"}, "" },
			{"mrp_muj", {"muj"}, "" },
			{"mrp_nsb", {"nsb"}, "" },
			{"mrp_7th", {"mfo"}, "" },
			{"mrp_ira", {"ira"}, "" },
			{"mrp_ccp", {"ccp"}, "" },
			{"mrp_ics", {"ics"}, "" },
			{"mrp_la", {"la"}, "" },
			{"mrp_bst", {"bst"}, "" },
			{"mrp_fsg", {"fsg"}, "" }
		};
		materials[] = {};
	};
	class I_MRAP_03_F {
		vItemSpace = 58;
		conditions = "";
		price = 100000;
		textures[] = {
			{"strd_cop", {"cop"}, "" },
			{"strd_aff", {"aff"}, "" },
			{"strd_reb", {"rebgang"}, "" },
			{"strd_wd", {"sdr"}, "" },
			{"strd_rst", {"rst"}, "" },
			{"strd_swt", {"swat"}, "" },
			{"strd_med", {"med"}, "" },
			{"strd_dea", {"dea"}, "" },
			{"strd_nsb", {"nsb"}, "" }
		};
		materials[] = {};
	};

	class B_mas_HMMWV_UNA {
		vItemSpace = 58;
		conditions = "";
		price = 100000;
		textures[] = {
			{ "hmmv_reb", {"rebgang"}, "" },
			{ "hmmv_fed", {"cop","cia"}, "" }
		};
		materials[] = {};
	};
	class B_mas_HMMWV_sdr: B_mas_HMMWV_UNA {textures[] = {};};
	class B_mas_HMMWV_SWAT: B_mas_HMMWV_UNA {textures[] = {};};
	class B_mas_HMMWV_ISF: B_mas_HMMWV_UNA {textures[] = {};};
	class B_mas_HMMWV_noa: B_mas_HMMWV_UNA {textures[] = {};};

	class B_mas_HMMWV_TOW {
		vItemSpace = 58;
		conditions = "";
		price = 200000;
		textures[] = {
			{ "hmmv_reb", {"rebgang"}, "" },
			{ "hmmv_fed", {"cop","cia"}, "" }
		};
		materials[] = {};
	};

	class B_mas_HMMWV_M2 {
		vItemSpace = 58;
		conditions = "";
		price = 200000;
		textures[] = {
			{ "hmmv_reb", {"rebgang","civgang","mfo","vl","g13","arg","la","ccp"}, "" },
			{ "hmmv_fed", {"cop","cia","swat"}, "" },
			{ "hmmv_sdr", {"sdr"}, "" },
			{ "hmmv_fb", {"fb"}, "" },
			{ "hmmv_mc", {"mc"}, "" },
			{ "hmmv_nsb", {"nsb"}, "" }
		};
		materials[] = {};
	};
	class B_mas_HMMWV_ISF_M2: B_mas_HMMWV_M2 {textures[] = {};};
	class B_mas_HMMWV_CCP_M2: B_mas_HMMWV_ISF_M2 {price = 100000;};
	class B_mas_HMMWV_W_M2: B_mas_HMMWV_ISF_M2 {};
	class B_mas_HMMWV_LA_M2: B_mas_HMMWV_ISF_M2 {};
	class B_mas_HMMWV_sdr_M2: B_mas_HMMWV_ISF_M2 {};
	class B_mas_HMMWV_ira_M2: B_mas_HMMWV_ISF_M2 {};
	class B_mas_HMMWV_kra_M2: B_mas_HMMWV_ISF_M2 {};
	class B_mas_HMMWV_VRS_M2: B_mas_HMMWV_ISF_M2 {};
	class B_mas_HMMWV_MUJH_M2: B_mas_HMMWV_ISF_M2 {};
	class B_mas_HMMWV_SWAT_M2: B_mas_HMMWV_ISF_M2 {};
	class B_mas_HMMWV_noa_M2: B_mas_HMMWV_ISF_M2 {};
	class B_mas_HMMWV_RFA_M2: B_mas_HMMWV_ISF_M2 {};
	class B_mas_HMMWV_ICS_M2: B_mas_HMMWV_ISF_M2 {};
	class B_mas_HMMWV_DEA_M2: B_mas_HMMWV_ISF_M2 {};
	class B_mas_HMMWV_FSG_M2: B_mas_HMMWV_ISF_M2 {};
	class B_mas_HMMWV_ARG_M2: B_mas_HMMWV_ISF_M2 {};

	class B_mas_HMMWV_SWAT_TOW: B_mas_HMMWV_ISF_M2 {};
	class B_mas_HMMWV_DEA_TOW: B_mas_HMMWV_ISF_M2 {};

	class UAZ_Rebels {
		vItemSpace = 80;
		conditions = "";
		price = 30000;
		textures[] = {};
		materials[] = {};
	};
	class UAZ_Unarmed: UAZ_Rebels {};
	class UAZ_green: UAZ_Rebels {};
	class UAZ_Hunter_s: UAZ_Rebels {};
	class UAZ_Hunter_g: UAZ_Rebels {};


	class B_mas_cars_LR_Unarmed {
		vItemSpace = 80;
		conditions = "";
		price = 30000;
		textures[] = {};
		materials[] = {};
	};
	class B_Heli_Light_01_F {
		vItemSpace = 90;
		conditions = "";
		price = 200000;
		textures[] = {
			{"humm_cop", {"cop"}, "" },
			{"humm_cia", {"cia"}, "" },
			{"humm_bl", {"civ"}, "" },
			{"humm_r", {"civ"}, "" },
			{"humm_vme", {"civ","reb","cia"}, "(call life_donator) > 0" },
			{"humm_bln", {"civ"}, "" },
			{"humm_llp", {"civ"}, "" },
			{"humm_fr", {"civ"}, "" },
			{"humm_bj", {"civ"}, "" },
			{"humm_rl", {"civ"}, "" },
			{"humm_sn", {"civ"}, "" },
			{"humm_vrn", {"civ"}, "" },
			{"humm_wv", {"civ"}, "" },
			{"humm_reb", {"reb"}, "" },
			{"humm_med", {"med"}, "" },
			{"humm_rg", {"rebgang"}, "" },
			{"humm_sdr", {"sdr"}, "" },
			{"humm_swt", {"swat"}, "" },
			{"humm_rfa", {"rfa"}, "" },
			{"humm_nsb", {"nsb"}, "" },
			{"humm_ics", {"ics"}, "" },
			{"humm_led", {"led"}, "" },
			{"humm_dea", {"dea"}, "" },
			{"humm_fsg", {"fsg"}, "" },
			{"humm_arg", {"arg"}, "" }
		};
		materials[] = {};
	};
	class EC635_Unarmed {
		vItemSpace = 90;
		conditions = "";
		price = 240000;
		textures[] = {};
		materials[] = {};
	};
	class O_Heli_Transport_04_bench_F {
		vItemSpace = 90;
		conditions = "";
		price = 200000;
		textures[] = {
			{"htb_cia", {"cia"}, "" }
		};
		materials[] = {};
	};
	class B_Heli_Transport_01_F {
		vItemSpace = 90;
		conditions = "";
		price = 0;
		textures[] = {};
		materials[] = {};
	};
	class B_mas_UH1Y_UNA_F {
		vItemSpace = 90;
		conditions = "";
		price = 200000;
		textures[] = {
			{ "uh1y_fed", {"cop","cia"}, "" },
			{ "uh1y_reb", {"vl","rebgang","bst"}, "" },
			{ "uh1y_aff", {"aff"}, "" },
			{ "uh1y_fb", {"fb"}, "" },
			{ "uh1y_rfa", {"rfa"}, "" },
			{ "uh1y_muj", {"muj"}, "" },
			{ "uh1y_nsb", {"nsb"}, "" },
			{ "uh1y_ira", {"ira"}, "" },
			{ "uh1y_ics", {"ics"}, "" },
			{ "uh1y_sdr", {"sdr"}, "" },
			{ "uh1y_mc", {"mc"}, "" },
			{ "uh1y_dea", {"dea"}, "" },
			{ "uh1y_la", {"la"}, "" },
			{ "uh1y_arg", {"arg"}, "" },
			{ "uh1y_7th", {"mfo"}, "" },
			{ "uh1y_fsg", {"fsg"}, "" }
		};
		materials[] = {};
	};
	class B_mas_UH60M_SF {
		vItemSpace = 90;
		conditions = "";
		price = 200000;
		textures[] = {};
		materials[] = {};
	};
	class B_mas_UH60M_kra {
		vItemSpace = 90;
		conditions = "";
		price = 200000;
		textures[] = {};
		materials[] = {};
	};
	class B_mas_UH60M_VRS {
		vItemSpace = 90;
		conditions = "";
		price = 200000;
		textures[] = {};
		materials[] = {};
	};
	class ext_Jonzie_Forklift {
		vItemSpace = 0;
		conditions = "";
		price = 10000;
		textures[] = {};
		materials[] = {};
	};
	class I_Heli_light_03_unarmed_F {
		vItemSpace = 90;
		conditions = "";
		price = 200000;
		textures[] = {
			{"hllc_cia", {"cia"}, "" },
			{"hllc_med", {"med"}, "" },
			{"hllc_g", {"civ"}, "" },
			{"hllc_7n", {"press"}, "" },
			{"hllc_rg", {"rebgang"}, "" },
			{"hllc_cop", {"cop"}, "" },
			{"hllc_sdr", {"sdr"}, "" },
			{"hllc_gra", {"mc"}, "" },
			{"hllc_13", {"g13"}, "" },
			{"hllc_arg", {"arg"}, "" },
			{"hllc_swt", {"swat"}, "" },
			{"hllc_nsb", {"nsb"}, "" },
			{"hllc_muj", {"muj"}, "" },
			{"hllc_ics", {"ics"}, "" },
			{"hllc_ccp", {"ccp"}, "" },
			{"hllc_dea", {"dea"}, "" }
		};
		materials[] = {};
	};
	class BOPE_Hunter_NATO {
		vItemSpace = 20;
		conditions = "";
		price = 70000;
		textures[] = {};
		materials[] = {};
	};
	class I_Heli_light_03_VIKA {
		vItemSpace = 90;
		conditions = "";
		price = 200000;
		textures[] = {};
		materials[] = {};
	};
	class C_Heli_Light_01_civil_F {
		vItemSpace = 90;
		conditions = "";
		price = 160000;
		textures[] = {
			{"humm_bln", {"civ"}, "" },
			{"humm_reb", {"reb"}, "" },
			{"humm_llp", {"civ"}, "" },
			{"humm_fr", {"civ"}, "" },
			{"humm_gra", {"civ"}, "" },
			{"humm_bj", {"civ"}, "" },
			{"humm_lg", {"civ"}, "" },
			{"humm_shd", {"civ"}, "" },
			{"humm_shr", {"civ"}, "" },
			{"humm_rl", {"civ","reb"}, "(call life_donator) > 0" },
			{"humm_sn", {"civ","reb"}, "(call life_donator) > 0" },
			{"humm_vrn", {"civ"}, "" },
			{"humm_wsp", {"civ","reb"}, "(call life_donator) > 0" },
			{"humm_wv", {"civ"}, "" },
			{"humm_tx", {"taxi"}, "" }
		};
		materials[] = {};
	};
	class C_Heli_Light_01_civil_Taxi {
		vItemSpace = 90;
		conditions = "";
		price = 2500;
		textures[] = {};
		materials[] = {};
	};
	class O_Heli_Light_02_unarmed_F {
		vItemSpace = 210;
		conditions = "";
		price = 400000;
		textures[] = {
			{"orc_cia", {"cia"}, "" },
			{"orc_wb", {"civ"}, "" },
			{"orc_cm", {"civ","reb"}, "(call life_donator) > 0" },
			{"orc_reb", {"reb"}, "" },
			{"orc_cop", {"cop"}, "" },
			{"orc_med", {"med"}, "" }
		};
		materials[] = {};
	};
	class B_Heli_Transport_03_unarmed_F {
		vItemSpace = 210;
		conditions = "";
		price = 300000;
		textures[] = {
			{"hrn_fed", {"cop","cia","swat"}, "" },
			{"hrn_med", {"med"}, "" }
		};
		materials[] = {};
	};
	class I_Heli_Transport_02_F {
		vItemSpace = 375;
		conditions = "";
		price = 700000;
		textures[] = {
			{ "hltt_bw", {"civ"}, "" },
			{ "hltt_gw", {"reb"}, "" },
			{ "hltt_cia", {"cop"}, "" }
		};
		materials[] = {};
	};
	class O_Heli_Transport_04_covered_F {
		vItemSpace = 375;
		conditions = "";
		price = 800000;
		textures[] = {};
		materials[] = {};
	};
	class O_Heli_Transport_04_box_F {
		vItemSpace = 650;
		conditions = "";
		price = 800000;
		textures[] = {};
		materials[] = {};
	};
	class O_Heli_Transport_04_fuel_F {
		vItemSpace = 650;
		conditions = "";
		price = 800000;
		textures[] = {};
		materials[] = {};
	};
	class I_Plane_Fighter_03_AA_F {
		vItemSpace = 650;
		conditions = "";
		price = 500000;
		textures[] = {};
		materials[] = {};
	};
	class Sab_af_An2 {
		vItemSpace = 650;
		conditions = "";
		price = 250000;
		textures[] = {};
		materials[] = {};
	};
	class Sab_tk_An2: Sab_af_An2 {};
	class sab_ca_An2: Sab_af_An2 {};
	class Sab_ana_An2: Sab_af_An2 {};
	class Sab_yel_An2: Sab_af_An2 {};
	class Sab_fd_An2: Sab_af_An2 {};
	class Sab_cz_An2: Sab_af_An2 {};

	class C_Plane_Civil_01_F {
		vItemSpace = 650;
		conditions = "";
		price = 250000;
		textures[] = {
			{"cpc_wbl", {"civ","reb"}, "(call life_donator) > 0" },
			{"cpc_bly", {"civ","reb"}, "(call life_donator) > 0" },
			{"cpc_gw", {"civ","reb"}, "(call life_donator) > 0" },
			{"cpc_r", {"civ","reb"}, "(call life_donator) > 0" }
		};
		materials[] = {};
	};
	class C_Rubberboat {
		vItemSpace = 45;
		conditions = "";
		price = 1000;
		textures[] = {};
		materials[] = {};
	};
	class ext_sab_boat {
		vItemSpace = 100;
		conditions = "";
		price = 2000;
		textures[] = {
			{"xsb_s", {"civ","reb"}, "" },
			{"xsb_f", {"civ","reb"}, "" },
			{"xsb_v", {"civ","reb"}, "" },
			{"xsb_r", {"civ","reb"}, "" }
		};
		materials[] = {};
	};
	class I_Boat_Transport_01_F {
		vItemSpace = 65;
		conditions = "";
		price = 1000;
		textures[] = {};
		materials[] = {};
	};
	class O_Boat_Armed_01_hmg_F {
		vItemSpace = 175;
		conditions = "";
		price = 60000;
		textures[] = {};
		materials[] = {};
	};
	class B_Boat_Armed_01_minigun_F {
		vItemSpace = 175;
		conditions = "";
		price = 60000;
		textures[] = {};
		materials[] = {};
	};
	class I_Boat_Armed_01_minigun_F {
		vItemSpace = 175;
		conditions = "";
		price = 60000;
		textures[] = {};
		materials[] = {};
	};
	class B_G_Boat_Transport_01_F {
		vItemSpace = 45;
		conditions = "";
		price = 60000;
		textures[] = {};
		materials[] = {};
	};
	class B_Boat_Transport_01_F {
		vItemSpace = 45;
		conditions = "";
		price = 2400;
		textures[] = {};
		materials[] = {};
	};
	class O_Truck_03_transport_F {
		vItemSpace = 400;
		conditions = "";
		price = 20000;
		textures[] = {};
		materials[] = {};
	};
	class O_Truck_03_fuel_F {
		vItemSpace = 600;
		conditions = "";
		price = 80000;
		textures[] = {};
		materials[] = {};
	};
	class O_Truck_03_covered_F {
		vItemSpace = 600;
		conditions = "";
		price = 80000;
		textures[] = {};
		materials[] = {};
	};
	class O_Truck_03_device_F {
		vItemSpace = 700;
		conditions = "";
		price = 200000;
		textures[] = {};
		materials[] = {};
	};
	class shounka_a3_spr_civ {
		vItemSpace = 110;
		conditions = "";
		price = 6500;
		textures[] = {
			{"shnk_w", {"civ","reb","cia"}, "" },
			{"shnk_r", {"civ","reb","cia"}, "" },
			{"shnk_bbl", {"civ","reb"}, "" },
			{"shnk_gr", {"civ","reb"}, "" },
			{"shnk_y", {"civ","reb"}, "" },
			{"shnk_bbr", {"civ","reb","cia"}, "" },
			{"shnk_o", {"civ","reb"}, "" },
			{"shnk_rs", {"civ","reb","cia"}, "" },
			{"shnk_vi", {"civ","reb"}, "" },
			{"shnk_bl", {"civ","reb"}, "" },
			{"shnk_blr", {"civ","reb"}, "" },
			{"shnk_g", {"civ","reb"}, "" },
			{"shnk_blg", {"civ","reb"}, "" },
			{"shnk_b", {"civ","reb","cop","cia"}, "" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class Mrshounka_a3_smart_civ {
		vItemSpace = 50;
		conditions = "";
		price = 20000;
		textures[] = {
			{"shnk_w", {"civ","reb","cia"}, "" },
			{"shnk_r", {"civ","reb","cia"}, "" },
			{"shnk_bbl", {"civ","reb"}, "" },
			{"shnk_gr", {"civ","reb"}, "" },
			{"shnk_y", {"civ","reb"}, "" },
			{"shnk_bbr", {"civ","reb","cia"}, "" },
			{"shnk_o", {"civ","reb"}, "" },
			{"shnk_rs", {"civ","reb","cia"}, "" },
			{"shnk_vi", {"civ","reb"}, "" },
			{"shnk_bl", {"civ","reb"}, "" },
			{"shnk_blr", {"civ","reb"}, "" },
			{"shnk_g", {"civ","reb"}, "" },
			{"shnk_blg", {"civ","reb"}, "" },
			{"shnk_b", {"civ","reb","cop","cia"}, "" },
			{"cxc_1", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_2", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_3", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_4", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_5", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_6", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_7", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_8", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_9", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_10", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_11", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_12", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_13", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_14", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_15", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_16", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_17", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_18", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_19", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_20", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_21", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_22", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_23", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_24", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_25", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_26", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_27", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_28", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_29", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_30", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_31", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_32", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_33", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_34", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_35", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_36", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_37", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_38", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_39", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_40", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_41", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_42", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_43", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_44", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_45", {"civ","reb"}, "(call life_donator) > 0" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class Mrshounka_r5_civ: Mrshounka_a3_smart_civ {
		price = 23350;
	};
	class Mrshounka_twingo_p: Mrshounka_a3_smart_civ {
		price = 26000;
	};
	class shounka_a3_cliors_civ: Mrshounka_a3_smart_civ {
		price = 26000;
	};
	class Mrshounka_a3_ds3_civ: Mrshounka_a3_smart_civ {
		price = 30000;
	};
	class shounka_a3_ds4_civ: Mrshounka_a3_smart_civ {
		price = 32000;
	};
	class Mrshounka_c4_p_civ: Mrshounka_a3_smart_civ {
		price = 35330;
	};
	class Mrshounka_207_civ: Mrshounka_a3_smart_civ {
		price = 24667;
	};
	class GeK_UAZ_3303: Mrshounka_a3_smart_civ {
        vItemSpace = 200;
        price = 4600;
    };
	class GeK_Zil_bleu: Mrshounka_a3_smart_civ {
        vItemSpace = 500;
        price = 27000;
    };
	class Mrshounka_a3_308_civ: Mrshounka_a3_smart_civ {
		price = 32000;
	};
	class Mrshounka_a3_308_rcz: Mrshounka_a3_smart_civ {
		price = 36665;
	};
	class shounka_a3_peugeot508_civ: Mrshounka_a3_smart_civ {
		price = 46620;
	};
	class Mrshounka_a3_gtr_civ: Mrshounka_a3_smart_civ {
		price = 439956;
	};
	class Mrshounka_cayenne_p_civ: Mrshounka_a3_smart_civ {
		price = 266640;
	};
	class Mrshounka_rs4_civ: Mrshounka_a3_smart_civ {
		price = 286638;
	};
	class shounka_rs6: Mrshounka_a3_smart_civ {
		price = 386638;
	};
	class Mrshounka_a3_dodge15_civ: Mrshounka_a3_smart_civ {
		price = 326634;
	};
	class shounka_avalanche: Mrshounka_a3_smart_civ {
		price = 413300;
	};
	class Mrshounka_ducati_p: Mrshounka_a3_smart_civ {
		price = 106656;
	};
	class Mrshounka_evox_civ: Mrshounka_a3_smart_civ {
		price = 56662;
	};
	class mrshounka_92_civ: Mrshounka_a3_smart_civ {
		price = 179982;
	};
	class Mrshounka_mustang_civ: Mrshounka_a3_smart_civ {
		price = 393294;
	};
	class AMG_Charger_12: Mrshounka_a3_smart_civ {
		price = 343294;
	};
	class Mrshounka_jeep_blinde_noir: Mrshounka_a3_smart_civ {
		price = 133300;
	};
	class AMG_Tahoe: Mrshounka_a3_smart_civ {
		price = 150000;
	};
	class AMG_Suburban2015: Mrshounka_a3_smart_civ {
		price = 175000;
	};
	class Faisal_Youkun2015: Mrshounka_a3_smart_civ {
		price = 200000;
	};
	class AMG_Caprice1993: Mrshounka_a3_smart_civ {
		price = 40000;
	};
	class shounka_gt: Mrshounka_a3_smart_civ {
		price = 300000;
	};
	class AMG__MercedesBenz6x6: Mrshounka_a3_smart_civ {
		price = 500000;
	};
	class Mrshounka_cherokee_noir: Mrshounka_a3_smart_civ {
		price = 466620;
		textures[] = {
			{"shnk_w", {"civ","reb","cia"}, "" },
			{"shnk_r", {"civ","reb","cia"}, "" },
			{"shnk_bbl", {"civ","reb"}, "" },
			{"shnk_gr", {"civ","reb"}, "" },
			{"shnk_y", {"civ","reb"}, "" },
			{"shnk_bbr", {"civ","reb","cia"}, "" },
			{"shnk_o", {"civ","reb"}, "" },
			{"shnk_rs", {"civ","reb","cia"}, "" },
			{"shnk_vi", {"civ","reb"}, "" },
			{"shnk_bl", {"civ","reb"}, "" },
			{"shnk_blr", {"civ","reb"}, "" },
			{"shnk_g", {"civ","reb"}, "" },
			{"shnk_blg", {"civ","reb"}, "" },
			{"shnk_b", {"civ","reb","cop","cia"}, "" },
			{"shnk_led", {"led"}, "" },
			{"cxc_1", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_2", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_3", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_4", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_5", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_6", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_7", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_8", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_9", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_10", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_11", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_12", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_13", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_14", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_15", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_16", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_17", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_18", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_19", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_20", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_21", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_22", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_23", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_24", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_25", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_26", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_27", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_28", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_29", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_30", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_31", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_32", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_33", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_34", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_35", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_36", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_37", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_38", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_39", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_40", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_41", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_42", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_43", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_44", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_45", {"civ","reb"}, "(call life_donator) > 0" }
		};
	};
	class mrshounka_huracan_c: Mrshounka_a3_smart_civ {
		price = 1000000;
	};
	class Mrshounka_veneno_c: Mrshounka_a3_smart_civ {
		price = 1466520;
	};
	class shounka_f430_spider: Mrshounka_a3_smart_civ {
		price = 1466520;
	};
	class Mrshounka_Alfa_Romeo_civ: Mrshounka_a3_smart_civ {
		price = 38665;
	};
	class Mrshounka_bmwm1_civ: Mrshounka_a3_smart_civ {
		price = 198000;
	};
	class Mrshounka_mercedes_190_p_civ: Mrshounka_a3_smart_civ {
		price = 198000;
	};
	class Mrshounka_bmwm6_civ: Mrshounka_a3_smart_civ {
		price = 316000;
	};
	class shounka_clk: Mrshounka_a3_smart_civ {
		price = 250000;
	};
	class Mrshounka_c63_2015_civ: Mrshounka_a3_smart_civ {
		price = 450000;
	};
	class shounka_porsche911: Mrshounka_a3_smart_civ {
		price = 200000;
	};
	class Mrshounka_Bowler_c: Mrshounka_a3_smart_civ {
		price = 54000;
	};
	class Mrshounka_golfvi_civ: Mrshounka_a3_smart_civ {
		price = 53000;
	};
	class Mrshounka_Vandura_civ: Mrshounka_a3_smart_civ {
		price = 10000;
	};
	class Mrshounka_Volkswagen_Touareg_civ: Mrshounka_a3_smart_civ {
		price = 250000;
	};
	class Mrshounka_yamaha_p: Mrshounka_a3_smart_civ {
		price = 106656;
	};
	class shounka_a3_rs5_civ: Mrshounka_a3_smart_civ {
		price = 316000;
	};
	class Mrshounka_agera_p: Mrshounka_a3_smart_civ {
		price = 1500000;
	};
	class Mrshounka_hummer_civ: Mrshounka_a3_smart_civ {
		price = 380000;
	};
	class shounka_h2: Mrshounka_a3_smart_civ {
		price = 480000;
	};
	class Mrshounka_lincoln_civ: Mrshounka_a3_smart_civ {
		price = 180000;
	};
	class Mrshounka_lykan_c: Mrshounka_a3_smart_civ {
		price = 1550000;
	};
	class Faisal_MaybachLaundet57: Mrshounka_a3_smart_civ {
		price = 1500000;
	};
	class Mrshounka_megane_rs_2015_noir {
		vItemSpace = 50;
		conditions = "";
		price = 64670;
		textures[] = {
			{"shnk_w", {"civ","reb","cia"}, "" },
			{"shnk_r", {"civ","reb","cia"}, "" },
			{"shnk_bbl", {"civ","reb"}, "" },
			{"shnk_gr", {"civ","reb"}, "" },
			{"shnk_y", {"civ","reb"}, "" },
			{"shnk_bbr", {"civ","reb","cia"}, "" },
			{"shnk_o", {"civ","reb"}, "" },
			{"shnk_rs", {"civ","reb","cia"}, "" },
			{"shnk_vi", {"civ","reb"}, "" },
			{"shnk_bl", {"civ","reb"}, "" },
			{"shnk_blr", {"civ","reb"}, "" },
			{"shnk_g", {"civ","reb"}, "" },
			{"shnk_blg", {"civ","reb"}, "" },
			{"shnk_b", {"civ","reb","cop","cia"}, "" },
			{"shnk_vr", {"civ","reb"}, "(call life_donator) > 0" },
			{"shnk_vg", {"civ","reb"}, "(call life_donator) > 0" },
			{"shnk_vbl", {"civ","reb"}, "(call life_donator) > 0" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class Mrshounka_raptor2_civ {
		vItemSpace = 50;
		conditions = "";
		price = 413300;
		textures[] = {
			{"shnk_w", {"civ","reb","cia"}, "" },
			{"shnk_r", {"civ","reb","cia"}, "" },
			{"shnk_bbl", {"civ","reb"}, "" },
			{"shnk_gr", {"civ","reb"}, "" },
			{"shnk_y", {"civ","reb"}, "" },
			{"shnk_bbr", {"civ","reb","cia"}, "" },
			{"shnk_o", {"civ","reb"}, "" },
			{"shnk_rs", {"civ","reb","cia"}, "" },
			{"shnk_vi", {"civ","reb"}, "" },
			{"shnk_bl", {"civ","reb"}, "" },
			{"shnk_blr", {"civ","reb"}, "" },
			{"shnk_g", {"civ","reb"}, "" },
			{"shnk_blg", {"civ","reb"}, "" },
			{"shnk_b", {"civ","reb","cop","cia"}, "" },
			{"shnk_vfc", {"civ","reb"}, "(call life_donator) > 0" },
			{"shnk_vuc", {"civ","reb"}, "(call life_donator) > 0" },
			{"shnk_vdc", {"civ","reb"}, "(call life_donator) > 0" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};

	class quiet_audi_r8_plus_spawn_couleur_blanche_ingame_f {
		vItemSpace = 50;
		conditions = "";
		price = 1600000;
		textures[] = {};
		materials[] = {};
	};
	class shounka_limo_civ {
		vItemSpace = 50;
		conditions = "";
		price = 2500;
		textures[] = {
			{"shnk_w", {"taxi"}, "" },
			{"shnk_b", {"taxi"}, "" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class shounka_a3_mantgs_2_in {
		vItemSpace = 700;
		conditions = "";
		price = 100000;
		textures[] = {
			{"shnk_w", {"civ","reb","cia"}, "" },
			{"shnk_r", {"civ","reb","cia"}, "" },
			{"shnk_bbl", {"civ","reb"}, "" },
			{"shnk_gr", {"civ","reb"}, "" },
			{"shnk_y", {"civ","reb"}, "" },
			{"shnk_bbr", {"civ","reb","cia"}, "" },
			{"shnk_o", {"civ","reb"}, "" },
			{"shnk_rs", {"civ","reb","cia"}, "" },
			{"shnk_vi", {"civ","reb"}, "" },
			{"shnk_bl", {"civ","reb"}, "" },
			{"shnk_blr", {"civ","reb"}, "" },
			{"shnk_g", {"civ","reb"}, "" },
			{"shnk_blg", {"civ","reb"}, "" },
			{"shnk_b", {"civ","reb","cop","cia"}, "" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class shounka_a3_renaultmagnum_f {
		vItemSpace = 1300;
		conditions = "";
		price = 220000;
		textures[] = {
			{"shnk_w", {"civ","reb","cia"}, "" },
			{"shnk_r", {"civ","reb","cia"}, "" },
			{"shnk_bbl", {"civ","reb"}, "" },
			{"shnk_gr", {"civ","reb"}, "" },
			{"shnk_y", {"civ","reb"}, "" },
			{"shnk_bbr", {"civ","reb","cia"}, "" },
			{"shnk_o", {"civ","reb"}, "" },
			{"shnk_rs", {"civ","reb","cia"}, "" },
			{"shnk_vi", {"civ","reb"}, "" },
			{"shnk_bl", {"civ","reb"}, "" },
			{"shnk_blr", {"civ","reb"}, "" },
			{"shnk_g", {"civ","reb"}, "" },
			{"shnk_blg", {"civ","reb"}, "" },
			{"shnk_b", {"civ","reb","cop","cia"}, "" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class ext_Jonzie_Tanker_Truck {
		vItemSpace = 1300;
		conditions = "";
		price = 260000;
		textures[] = {
			{"shnk_w", {"civ","reb","cia"}, "" },
			{"shnk_r", {"civ","reb","cia"}, "" },
			{"shnk_bbl", {"civ","reb"}, "" },
			{"shnk_gr", {"civ","reb"}, "" },
			{"shnk_y", {"civ","reb"}, "" },
			{"shnk_bbr", {"civ","reb","cia"}, "" },
			{"shnk_o", {"civ","reb"}, "" },
			{"shnk_rs", {"civ","reb","cia"}, "" },
			{"shnk_vi", {"civ","reb"}, "" },
			{"shnk_bl", {"civ","reb"}, "" },
			{"shnk_blr", {"civ","reb"}, "" },
			{"shnk_g", {"civ","reb"}, "" },
			{"shnk_blg", {"civ","reb"}, "" },
			{"shnk_b", {"civ","reb","cop","cia"}, "" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class RDS_Ikarus_Civ_01 {
		vItemSpace = 100;
		conditions = "";
		price = 2500;
		textures[] = {};
		materials[] = {};
	};
	class ext_Jonzie_Box_Truck {
		vItemSpace = 1300;
		conditions = "";
		price = 260000;
		textures[] = {
			{"shnk_w", {"civ","reb","cia"}, "" },
			{"shnk_r", {"civ","reb","cia"}, "" },
			{"shnk_bbl", {"civ","reb"}, "" },
			{"shnk_gr", {"civ","reb"}, "" },
			{"shnk_y", {"civ","reb"}, "" },
			{"shnk_bbr", {"civ","reb","cia"}, "" },
			{"shnk_o", {"civ","reb"}, "" },
			{"shnk_rs", {"civ","reb","cia"}, "" },
			{"shnk_vi", {"civ","reb"}, "" },
			{"shnk_bl", {"civ","reb"}, "" },
			{"shnk_blr", {"civ","reb"}, "" },
			{"shnk_g", {"civ","reb"}, "" },
			{"shnk_blg", {"civ","reb"}, "" },
			{"shnk_b", {"civ","reb","cop","cia"}, "" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class Mrshounka_Vandura_civ_7ch {
		vItemSpace = 50;
		conditions = "";
		price = 10000;
		textures[] = {};
		materials[] = {};
	};
	class quiet_sub2015_noir_f {
		vItemSpace = 50;
		conditions = "";
		price = 200000;
		textures[] = {};
		materials[] = {};
	};
	class Mrshounka_rs4_gend_p_blanc {
		vItemSpace = 50;
		conditions = "";
		price = 65000;
		textures[] = {
			{"shnk_bbr", {"cia"}, "" },
			{"shnk_b", {"cia"}, "" }
		};
		materials[] = {};
	};
	class Mrshounka_agera_gend_p {
		vItemSpace = 50;
		conditions = "";
		price = 100000;
		textures[] = {};
		materials[] = {};
	};
	class atm_C130_J {
		vItemSpace = 50;
		conditions = "";
		price = 300000;
		textures[] = {};
		materials[] = {};
	};
	class shounka_a3_pompier_sprinter {
		vItemSpace = 50;
		conditions = "";
		price = 30000;
		textures[] = {};
		materials[] = {};
	};
	class Mrshounka_Volkswagen_Touareg_mcs {
		vItemSpace = 50;
		conditions = "";
		price = 45000;
		textures[] = {};
		materials[] = {};
	};
	class RDS_S1203_Civ_02 {
		vItemSpace = 50;
		conditions = "";
		price = 50000;
		textures[] = {};
		materials[] = {};
	};
	class O_Truck_02_medical_F {
		vItemSpace = 50;
		conditions = "";
		price = 50000;
		textures[] = {};
		materials[] = {};
	};
	class mercedes_atego_pompier_ingame {
		vItemSpace = 50;
		conditions = "";
		price = 45000;
		textures[] = {};
		materials[] = {};
	};
	class dezkit_b206_ems {
		vItemSpace = 50;
		conditions = "";
		price = 200000;
		textures[] = {
			{"dems_med", {"med"}, "" },
			{"dems_7n", {"press"}, "" }
		};
		materials[] = {};
	};
	class dezkit_b206_news {
		vItemSpace = 50;
		conditions = "";
		price = 60000;
		textures[] = {};
		materials[] = {};
	};
	class dezkit_b206_rescue {
		vItemSpace = 50;
		conditions = "";
		price = 200000;
		textures[] = {};
		materials[] = {};
	};
	class O_Heli_Transport_04_medevac_F {
		vItemSpace = 50;
		conditions = "";
		price = 300000;
		textures[] = {};
		materials[] = {};
	};
	class Mrshounka_a3_308_gend {
		vItemSpace = 50;
		conditions = "";
		price = 16000;
		textures[] = {};
		materials[] = {};
	};
	class Mrshounka_a3_rs_gend {
		vItemSpace = 50;
		conditions = "";
		price = 16000;
		textures[] = {};
		materials[] = {};
	};
	class ivory_wrx_pd_m3 {
		vItemSpace = 50;
		conditions = "";
		price = 18000;
		textures[] = {};
		materials[] = {};
	};
	class ivory_wrx_pd_m2 {
		vItemSpace = 50;
		conditions = "";
		price = 18000;
		textures[] = {};
		materials[] = {};
	};
	class ivory_wrx_pd_m1 {
		vItemSpace = 50;
		conditions = "";
		price = 18000;
		textures[] = {};
		materials[] = {};
	};
	class ivory_m3_pd_M {
		vItemSpace = 50;
		conditions = "";
		price = 18000;
		textures[] = {};
		materials[] = {};
	};
	class ivory_isf_pd_m {
		vItemSpace = 50;
		conditions = "";
		price = 18000;
		textures[] = {};
		materials[] = {};
	};
	class shounka_a3_508gend {
		vItemSpace = 50;
		conditions = "";
		price = 24000;
		textures[] = {};
		materials[] = {};
	};
	class shounka_a3_gendsprinter {
		vItemSpace = 50;
		conditions = "";
		price = 24000;
		textures[] = {};
		materials[] = {};
	};
	class B_mas_HMMWV_M134_des {
		vItemSpace = 15;
		conditions = "";
		price = 400000;
		textures[] = {};
		materials[] = {};
	};
	class Mrshounka_rs_2015_g {
		vItemSpace = 50;
		conditions = "";
		price = 16000;
		textures[] = {};
		materials[] = {};
	};
	class Mrshounka_ducati_police_p {
		vItemSpace = 50;
		conditions = "";
		price = 30000;
		textures[] = {};
		materials[] = {};
	};
	class Mrshounka_bmw_gend {
		vItemSpace = 50;
		conditions = "";
		price = 24000;
		textures[] = {};
		materials[] = {};
	};
	class Mrshounka_evox_gend {
		vItemSpace = 50;
		conditions = "";
		price = 24000;
		textures[] = {};
		materials[] = {};
	};
	class shounka_a3_audiq7_v2_gendarmerie {
		vItemSpace = 50;
		conditions = "";
		price = 24000;
		textures[] = {};
		materials[] = {};
	};
	class shounka_a3_suburbangign {
		vItemSpace = 50;
		conditions = "";
		price = 24000;
		textures[] = {};
		materials[] = {};
	};
	class shounka_a3_brinks_bleufonce {
		vItemSpace = 50;
		conditions = "";
		price = 65000;
		textures[] = {};
		materials[] = {};
	};
	class B_G_Offroad_01_armed_F {
		vItemSpace = 50;
		conditions = "";
		price = 100000;
		textures[] = {
			{"ffrd_bg_r", {"reb","rebgang","aff","sdr"}, "" },
			{"ffrd_cop", {"cop"}, "" }
		};
		materials[] = {};
	};
	class B_mas_cars_Hilux_M2 {
		vItemSpace = 50;
		conditions = "";
		price = 100000;
		textures[] = {};
		materials[] = {};
	};
	class I_mas_cars_UAZ_M2 {
		vItemSpace = 50;
		conditions = "";
		price = 100000;
		textures[] = {};
		materials[] = {};
	};
	class B_mas_cars_LR_M2 {
		vItemSpace = 50;
		conditions = "";
		price = 100000;
		textures[] = {};
		materials[] = {};
	};
	class shounka_a3_brinks_noir {
		vItemSpace = 50;
		conditions = "";
		price = 65000;
		textures[] = {};
		materials[] = {};
	};
	class PMC_Offroad_Transport {
		vItemSpace = 50;
		conditions = "";
		price = 12000;
		textures[] = {};
		materials[] = {};
	};
	class PMC_Offroad_Armed {
		vItemSpace = 50;
		conditions = "";
		price = 100000;
		textures[] = {};
		materials[] = {};
	};
	class SIG_SuperBee {
		vItemSpace = 50;
		conditions = "";
		price = 100000;
		textures[] = {};
		materials[] = {};
	};
	class SIG_SuperBeeY: SIG_SuperBee {};
	class SIG_SuperBeeB: SIG_SuperBee {};
	class SIG_SuperBeeL: SIG_SuperBee {};
	class SIG_SuperBeeM: SIG_SuperBee {};
	class SIG_SuperBeeG: SIG_SuperBee {};
	class SIG_Roadrunner: SIG_SuperBee {};
	class SIG_Hubcaps: SIG_SuperBee {};
	class SIG_Magnums: SIG_SuperBee {};
	class SIG_Hcode: SIG_SuperBee {};


	class jeffery_a3_audiq7_v2_gendarmerie {
		vItemSpace = 50;
		conditions = "";
		price = 16000;
		textures[] = {};
		materials[] = {};
	};
	class Mrjeffery_bmw_gend {
		vItemSpace = 50;
		conditions = "";
		price = 16000;
		textures[] = {};
		materials[] = {};
	};
	class Jeffery_a3_508gend {
		vItemSpace = 50;
		conditions = "";
		price = 16000;
		textures[] = {};
		materials[] = {};
	};
	class C_Offroad_02_unarmed_F {
		vItemSpace = 50;
		conditions = "";
		price = 15000;
		textures[] = {
			{"codu_w", {"civ"}, "" },
			{"codu_r", {"civ"}, "" },
			{"codu_o", {"civ"}, "" },
			{"codu_bl", {"civ"}, "" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class ext_Jonzie_Mini_Cooper {
		vItemSpace = 50;
		conditions = "";
		price = 30000;
		textures[] = {
			{"shnk_w", {"civ","reb","cia"}, "" },
			{"shnk_r", {"civ","reb","cia"}, "" },
			{"shnk_bbl", {"civ","reb"}, "" },
			{"shnk_gr", {"civ","reb"}, "" },
			{"shnk_y", {"civ","reb"}, "" },
			{"shnk_bbr", {"civ","reb","cia"}, "" },
			{"shnk_o", {"civ","reb"}, "" },
			{"shnk_rs", {"civ","reb","cia"}, "" },
			{"shnk_vi", {"civ","reb"}, "" },
			{"shnk_bl", {"civ","reb"}, "" },
			{"shnk_blr", {"civ","reb"}, "" },
			{"shnk_g", {"civ","reb"}, "" },
			{"shnk_blg", {"civ","reb"}, "" },
			{"shnk_b", {"civ","reb","cop","cia"}, "" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class ext_Jonzie_Mini_Cooper_R_spec: ext_Jonzie_Mini_Cooper {
		price = 35000;
	};
	class ext_Jonzie_STI: ext_Jonzie_Mini_Cooper {
		price = 60000;
	};
	class ext_Jonzie_30CSL: ext_Jonzie_Mini_Cooper {
		price = 33000;
	};
	class ext_Jonzie_Datsun_Z432: ext_Jonzie_Mini_Cooper {
		price = 30000;
	};
	class ext_Jonzie_XB: ext_Jonzie_Mini_Cooper {
		price = 60000;
	};

	class ext_Jonzie_Tow_Truck {
		vItemSpace = 0;
		conditions = "";
		price = 80000;
		textures[] = {
			{"shnk_w", {"civ","reb","cia"}, "" },
			{"shnk_r", {"civ","reb","cia"}, "" },
			{"shnk_bbl", {"civ","reb"}, "" },
			{"shnk_gr", {"civ","reb"}, "" },
			{"shnk_y", {"civ","reb"}, "" },
			{"shnk_bbr", {"civ","reb","cia"}, "" },
			{"shnk_o", {"civ","reb"}, "" },
			{"shnk_rs", {"civ","reb","cia"}, "" },
			{"shnk_vi", {"civ","reb"}, "" },
			{"shnk_bl", {"civ","reb"}, "" },
			{"shnk_blr", {"civ","reb"}, "" },
			{"shnk_g", {"civ","reb"}, "" },
			{"shnk_blg", {"civ","reb"}, "" },
			{"shnk_b", {"civ","reb","cop","cia"}, "" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class ext_Jonzie_Flat_Bed: ext_Jonzie_Tow_Truck {};
	class ext_Jonzie_Log_Truck: ext_Jonzie_Tow_Truck {};

	class ext_ivory_rs4 {
		vItemSpace = 50;
		conditions = "";
		price = 286638;
		textures[] = {
			{"shnk_w", {"civ","reb","cia"}, "" },
			{"shnk_r", {"civ","reb","cia"}, "" },
			{"shnk_bbl", {"civ","reb"}, "" },
			{"shnk_gr", {"civ","reb"}, "" },
			{"shnk_y", {"civ","reb"}, "" },
			{"shnk_bbr", {"civ","reb","cia"}, "" },
			{"shnk_o", {"civ","reb"}, "" },
			{"shnk_rs", {"civ","reb","cia"}, "" },
			{"shnk_vi", {"civ","reb"}, "" },
			{"shnk_bl", {"civ","reb"}, "" },
			{"shnk_blr", {"civ","reb"}, "" },
			{"shnk_g", {"civ","reb"}, "" },
			{"shnk_blg", {"civ","reb"}, "" },
			{"shnk_b", {"civ","reb","cop","cia"}, "" },
			{"shnk_bT", {"civ","reb"}, "(call life_donator) > 3" },
			{"cxc_1", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_2", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_3", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_4", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_5", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_6", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_7", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_8", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_9", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_10", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_11", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_12", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_13", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_14", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_15", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_16", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_17", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_18", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_19", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_20", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_21", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_22", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_23", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_24", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_25", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_26", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_27", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_28", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_29", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_30", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_31", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_32", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_33", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_34", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_35", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_36", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_37", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_38", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_39", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_40", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_41", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_42", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_43", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_44", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_45", {"civ","reb"}, "(call life_donator) > 0" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class ext_ivory_c: ext_ivory_rs4 {
		price = 1466520;
	};
	class ext_ivory_veyron: ext_ivory_rs4 {
		price = 1466520;
	};
	class ext_ivory_e36: ext_ivory_rs4 {
		price = 260000;
	};
	class ext_ivory_m3: ext_ivory_rs4 {
		price = 270000;
	};
	class ext_ivory_isf: ext_ivory_rs4 {
		price = 270000;
	};
	class ext_ivory_lfa: ext_ivory_rs4 {
		price = 439950;
	};
	class ext_ivory_elise: ext_ivory_rs4 {
		price = 80000;
	};
	class ext_ivory_f1: ext_ivory_rs4 {
		price = 540000;
	};
	class ext_ivory_mp4: ext_ivory_rs4 {
		price = 440000;
	};
	class ext_ivory_190e: ext_ivory_rs4 {
		price = 32000;
	};
	class ext_ivory_evox: ext_ivory_rs4 {
		price = 56662;
	};
	class ext_ivory_r34: ext_ivory_rs4 {
		price = 425000;
	};
	class ext_ivory_gt500: ext_ivory_rs4 {
		price = 393294;
		textures[] = {
			{"shnk_w", {"civ","reb","cia"}, "" },
			{"shnk_r", {"civ","reb","cia"}, "" },
			{"shnk_bbl", {"civ","reb"}, "" },
			{"shnk_gr", {"civ","reb"}, "" },
			{"shnk_y", {"civ","reb"}, "" },
			{"shnk_bbr", {"civ","reb","cia"}, "" },
			{"shnk_o", {"civ","reb"}, "" },
			{"shnk_rs", {"civ","reb","cia"}, "" },
			{"shnk_vi", {"civ","reb"}, "" },
			{"shnk_bl", {"civ","reb"}, "" },
			{"shnk_blr", {"civ","reb"}, "" },
			{"shnk_g", {"civ","reb"}, "" },
			{"shnk_blg", {"civ","reb"}, "" },
			{"shnk_b", {"civ","reb","cop","cia"}, "" },
			{"shnk_bT", {"civ","reb"}, "(call life_donator) > 3" },
			{"ivgt_rw", {"civ","reb"}, "(call life_donator) > 0" },
			{"ivgt_bg", {"civ","reb"}, "(call life_donator) > 0" },
			{"ivgt_gb", {"civ","reb"}, "(call life_donator) > 0" },
			{"ivgt_wb", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_1", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_2", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_3", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_4", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_5", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_6", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_7", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_8", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_9", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_10", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_11", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_12", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_13", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_14", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_15", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_16", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_17", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_18", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_19", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_20", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_21", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_22", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_23", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_24", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_25", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_26", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_27", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_28", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_29", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_30", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_31", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_32", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_33", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_34", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_35", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_36", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_37", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_38", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_39", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_40", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_41", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_42", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_43", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_44", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_45", {"civ","reb"}, "(call life_donator) > 0" }
		};
	};
	class ext_ivory_wrx: ext_ivory_rs4 {
		price = 60000;
		textures[] = {
			{"shnk_w", {"civ","reb","cia"}, "" },
			{"shnk_r", {"civ","reb","cia"}, "" },
			{"shnk_bbl", {"civ","reb"}, "" },
			{"shnk_gr", {"civ","reb"}, "" },
			{"shnk_y", {"civ","reb"}, "" },
			{"shnk_bbr", {"civ","reb","cia"}, "" },
			{"shnk_o", {"civ","reb"}, "" },
			{"shnk_rs", {"civ","reb","cia"}, "" },
			{"shnk_vi", {"civ","reb"}, "" },
			{"shnk_bl", {"civ","reb"}, "" },
			{"shnk_blr", {"civ","reb"}, "" },
			{"shnk_g", {"civ","reb"}, "" },
			{"shnk_blg", {"civ","reb"}, "" },
			{"shnk_b", {"civ","reb","cop","cia"}, "" },
			{"shnk_bT", {"civ","reb"}, "(call life_donator) > 3" },
			{"cxc_1", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_2", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_3", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_4", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_5", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_6", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_7", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_8", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_9", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_10", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_11", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_12", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_13", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_14", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_15", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_16", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_17", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_18", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_19", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_20", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_21", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_22", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_23", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_24", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_25", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_26", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_27", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_28", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_29", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_30", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_31", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_32", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_33", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_34", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_35", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_36", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_37", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_38", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_39", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_40", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_41", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_42", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_43", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_44", {"civ","reb"}, "(call life_donator) > 0" },
			{"cxc_45", {"civ","reb"}, "(call life_donator) > 0" },
			{"wrx_ira", {"ira"}, "" }
		};
	};
	class ext_ivory_supra: ext_ivory_rs4 {
		price = 400000;
	};
	class ext_ivory_rs4_taxi {
		vItemSpace = 50;
		conditions = "";
		price = 2500;
		textures[] = {};
		materials[] = {};
	};
	class TM_Porsche_911_Black {
		vItemSpace = 50;
		conditions = "";
		price = 60000;
		textures[] = {};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class Quiet_c65amg_noir_f {
		vItemSpace = 50;
		conditions = "";
		price = 45000;
		textures[] = {};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class ext_ivory_190e_taxi {
		vItemSpace = 50;
		conditions = "";
		price = 2500;
		textures[] = {};
		materials[] = {};
	};
	class O_mas_BTR60 {
		vItemSpace = 0;
		conditions = "";
		price = 100000;
		textures[] = {};
		materials[] = {};
	};
	class B_APC_Wheeled_01_cannon_F {
		vItemSpace = 0;
		conditions = "";
		price = 0;
		textures[] = {
			{"apcw_fed", {"cop","cia","dea"}, "" },
			{"apcw_civ", {"civ"}, "" }
		};
		materials[] = {};
	};
	class O_MRAP_02_hmg_F {
		vItemSpace = 0;
		conditions = "";
		price = 0;
		textures[] = {
			{"mrp_g", {"reb"}, "" },
			{"mrp_cg", {"civ"}, "" }
		};
		materials[] = {};
	};

	//LED
	class Altmerion_bmw_prok {
		vItemSpace = 50;
		conditions = "";
		price = 24000;
		textures[] = {};
		materials[] = {};
	};

	class Mrshounka_corbillard_c_bleufonce {
		vItemSpace = 50;
		conditions = "";
		price = 75000;
		textures[] = {};
		materials[] = {};
	};

	class ext_ivory_rs4_police {
		vItemSpace = 50;
		conditions = "";
		price = 25000;
		textures[] = {};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class ext_ivory_isf_police: ext_ivory_rs4_police {
		price = 25000;
	};
	class ext_ivory_m3_police: ext_ivory_rs4_police {
		price = 25000;
	};
	class ext_ivory_evox_police: ext_ivory_rs4_police {
		price = 23000;
	};
	class ext_ivory_wrx_police: ext_ivory_rs4_police {
		price = 23000;
	};
	class Faisal_Youkun2015_PD: ext_ivory_rs4_police {
		price = 23000;
	};
	class FaisalAlYahya_CVPI_police: ext_ivory_rs4_police {
		price = 23000;
	};
	class AMG_TahoePolice: ext_ivory_rs4_police {
		price = 23000;
	};
	class C_Van_01_box_F_EXT_DHL {
		vItemSpace = 0;
		conditions = "";
		price = 0;
		textures[] = {};
		materials[] = {};
	};
};