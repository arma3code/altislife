class LifeCfgVehShops {
	class kart_shop {
		side = "civ";
		conditions = "license_civ_driver";
		conditionsMessage = "Необходима лицензия водителя";
		multiplier = 1;
		vehicles[] = {
			{ "C_Kart_01_Blu_F", "" },
			{ "C_Kart_01_Fuel_F", "" },
			{ "C_Kart_01_Red_F", "" },
			{ "C_Kart_01_Vrana_F", "" }
		};
	};

	class med_shop {
		side = "med";
		conditions = "";
		conditionsMessage = "";
		multiplier = 0.06;
		vehicles[] = {
			{ "C_Offroad_01_repair_F", "" },
			//{ "shounka_a3_pompier_sprinter", "life_medicLevel > 1" },
			//{ "mercedes_atego_pompier_ingame", "life_medicLevel > 1" },
			{ "RDS_S1203_Civ_02", "" },
			{ "O_Truck_02_medical_F", "" },
			{ "Mrshounka_Volkswagen_Touareg_mcs", "life_medicLevel > 1" },
			{ "O_MRAP_02_F", "life_medicLevel > 3" },
			{ "I_MRAP_03_F", "life_medicLevel > 4" }
		};
	};

	class med_air_hs {
		side = "med";
		conditions = "";
		conditionsMessage = "";
		multiplier = 0.06;
		vehicles[] = {
			{ "B_Heli_Light_01_F", "" },
			{ "dezkit_b206_ems", "life_medicLevel > 1" },
			{ "dezkit_b206_rescue", "life_medicLevel > 1" },
			{ "I_Heli_light_03_unarmed_F", "life_medicLevel > 2" },
			{ "O_Heli_Light_02_unarmed_F", "life_medicLevel > 3" },
			{ "B_Heli_Transport_03_unarmed_F", "life_medicLevel > 4" }
		};
	};

	class civ_car {
		side = "civ";
		conditions = "license_civ_driver";
		conditionsMessage = "Необходима лицензия водителя";
		multiplier = 1;
		vehicles[] = {
			{ "gac_jsdf_klx", "" },
			{ "B_Quadbike_01_F", "" },
			{ "RDS_Lada_Civ_01", "" },
			{ "RDS_Lada_Civ_02", "" },
			{ "RDS_Lada_Civ_03", "" },
			{ "RDS_Lada_Civ_04", "" },
			{ "RDS_Lada_Civ_06", "" },
			{ "RDS_Lada_Civ_07", "" },
			{ "RDS_Gaz24_Civ_01", "" },
			{ "RDS_Gaz24_Civ_02", "" },
			{ "RDS_Gaz24_Civ_03", "" },
			{ "RDS_Golf4_Civ_06", "" },
			{ "RDS_Golf4_Civ_03", "" },
			{ "RDS_Golf4_Civ_05", "" },
			{ "RDS_Golf4_Civ_01", "" },
			{ "RDS_Golf4_Civ_04", "" },
			{ "RDS_Golf4_Civ_02", "" },
			{ "RDS_S1203_Civ_08", "" },
			{ "RDS_S1203_Civ_05", "" },
			{ "RDS_S1203_Civ_07", "" },
			{ "RDS_S1203_Civ_01", "" },
			{ "RDS_S1203_Civ_06", "" },
			{ "RDS_S1203_Civ_04", "" },
			{ "C_Hatchback_01_F", "" },
			//{ "C_Offroad_01_F", "" },
			{ "C_SUV_01_F", "" },
			{ "C_Van_01_transport_F", "" },
			{ "shounka_a3_spr_civ", "" },
			{ "Mrshounka_a3_smart_civ", "" },
			{ "Mrshounka_r5_civ", "" },
			{ "Mrshounka_twingo_p", "" },
			//{ "shounka_a3_cliors_civ", "" },
			{ "Mrshounka_a3_ds3_civ", "" },
			//{ "shounka_a3_ds4_civ", "" },
			{ "Mrshounka_c4_p_civ", "" },
			//{ "Mrshounka_megane_rs_2015_noir", "" },
			{ "Mrshounka_207_civ", "" },
			{ "Mrshounka_a3_308_civ", "" },
			{ "Mrshounka_a3_308_rcz", "" },
			//{ "shounka_a3_peugeot508_civ", "" },
			{ "Mrshounka_a3_gtr_civ", "" },
			{ "Mrshounka_cayenne_p_civ", "" },
			{ "Mrshounka_rs4_civ", "" },
			{ "Mrshounka_a3_dodge15_civ", "" },
			{ "Mrshounka_ducati_p", "" },
			{ "Mrshounka_evox_civ", "" },
			{ "Mrshounka_Alfa_Romeo_civ", "" },
			{ "Mrshounka_bmwm1_civ", "" },
			{ "Mrshounka_bmwm6_civ", "" },
			{ "Mrshounka_Bowler_c", "" },
			{ "Mrshounka_golfvi_civ", "" },
			{ "Mrshounka_Vandura_civ", "" },
			{ "Mrshounka_Volkswagen_Touareg_civ", "" },
			//{ "Mrshounka_yamaha_p", "" },
			//{ "shounka_a3_rs5_civ", "" },
			{ "Mrshounka_mercedes_190_p_civ", "" },
			{ "shounka_clk", "" },
			{ "shounka_porsche911", "" },
			{ "AMG_Caprice1993", "" },
			{ "ext_Jonzie_Mini_Cooper", "" },
			{ "ext_Jonzie_Mini_Cooper_R_spec", "" },
			{ "ext_Jonzie_STI", "" },
			{ "ext_Jonzie_30CSL", "" },
			{ "ext_Jonzie_Datsun_Z432", "" },
			{ "ext_ivory_rs4", "" },
			{ "ext_ivory_e36", "" },
			{ "ext_ivory_m3", "" },
			{ "ext_ivory_isf", "" },
			{ "ext_ivory_lfa", "" },
			{ "ext_ivory_190e", "" },
			{ "ext_ivory_evox", "" },
			{ "ext_ivory_r34", "" },
			{ "ext_ivory_wrx", "" },
			{ "AMG_Tahoe", "" },
			{ "AMG_Suburban2015", "" },
			{ "Faisal_Youkun2015", "" },
			{ "AMG_Charger_12", "" },
			{ "ext_ivory_supra", "" },

			{ "C_Hatchback_01_sport_F", "(call life_donator) > 0" },
			{ "UAZ_green", "(call life_donator) > 0" },
			{ "UAZ_Hunter_s", "(call life_donator) > 0" },
			{ "UAZ_Hunter_g", "(call life_donator) > 0" },
			{ "B_mas_cars_LR_Unarmed", "(call life_donator) > 0" },
			{ "C_Offroad_02_unarmed_F", "(call life_donator) > 0" },
			{ "ext_Jonzie_XB", "(call life_donator) > 0" }
		};
	};

	class reb_car {
		side = "reb";
		conditions = "license_reb_driver";
		conditionsMessage = "Необходима лицензия водителя";
		multiplier = 1;
		vehicles[] = {
			{ "gac_jsdf_klx", "" },
			{ "B_Quadbike_01_F", "" },
			{ "RDS_Lada_Civ_01", "" },
			{ "RDS_Lada_Civ_02", "" },
			{ "RDS_Lada_Civ_03", "" },
			{ "RDS_Lada_Civ_04", "" },
			{ "RDS_Lada_Civ_06", "" },
			{ "RDS_Lada_Civ_07", "" },
			{ "RDS_Gaz24_Civ_01", "" },
			{ "RDS_Gaz24_Civ_02", "" },
			{ "RDS_Gaz24_Civ_03", "" },
			{ "RDS_Golf4_Civ_06", "" },
			{ "RDS_Golf4_Civ_03", "" },
			{ "RDS_Golf4_Civ_05", "" },
			{ "RDS_Golf4_Civ_01", "" },
			{ "RDS_Golf4_Civ_04", "" },
			{ "RDS_Golf4_Civ_02", "" },
			{ "RDS_S1203_Civ_08", "" },
			{ "RDS_S1203_Civ_05", "" },
			{ "RDS_S1203_Civ_07", "" },
			{ "RDS_S1203_Civ_01", "" },
			{ "RDS_S1203_Civ_06", "" },
			{ "RDS_S1203_Civ_04", "" },
			{ "C_Hatchback_01_F", "" },
			//{ "C_Offroad_01_F", "" },
			{ "C_SUV_01_F", "" },
			{ "C_Van_01_transport_F", "" },
			{ "shounka_a3_spr_civ", "" },
			{ "Mrshounka_a3_smart_civ", "" },
			{ "Mrshounka_r5_civ", "" },
			{ "Mrshounka_twingo_p", "" },
			//{ "shounka_a3_cliors_civ", "" },
			{ "Mrshounka_a3_ds3_civ", "" },
			//{ "shounka_a3_ds4_civ", "" },
			{ "Mrshounka_c4_p_civ", "" },
			//{ "Mrshounka_megane_rs_2015_noir", "" },
			{ "Mrshounka_207_civ", "" },
			{ "Mrshounka_a3_308_civ", "" },
			{ "Mrshounka_a3_308_rcz", "" },
			//{ "shounka_a3_peugeot508_civ", "" },
			{ "Mrshounka_a3_gtr_civ", "" },
			{ "Mrshounka_cayenne_p_civ", "" },
			{ "Mrshounka_rs4_civ", "" },
			{ "Mrshounka_a3_dodge15_civ", "" },
			{ "Mrshounka_ducati_p", "" },
			{ "Mrshounka_evox_civ", "" },
			{ "Mrshounka_Alfa_Romeo_civ", "" },
			{ "Mrshounka_bmwm1_civ", "" },
			{ "Mrshounka_bmwm6_civ", "" },
			{ "Mrshounka_Bowler_c", "" },
			{ "Mrshounka_golfvi_civ", "" },
			{ "Mrshounka_Vandura_civ", "" },
			{ "Mrshounka_Volkswagen_Touareg_civ", "" },
			//{ "Mrshounka_yamaha_p", "" },
			//{ "shounka_a3_rs5_civ", "" },
			{ "Mrshounka_mercedes_190_p_civ", "" },
			{ "shounka_clk", "" },
			{ "shounka_porsche911", "" },
			{ "ext_Jonzie_Mini_Cooper", "" },
			{ "ext_Jonzie_Mini_Cooper_R_spec", "" },
			{ "ext_Jonzie_STI", "" },
			{ "ext_Jonzie_30CSL", "" },
			{ "ext_Jonzie_Datsun_Z432", "" },
			{ "ext_ivory_rs4", "" },
			{ "ext_ivory_e36", "" },
			{ "ext_ivory_m3", "" },
			{ "ext_ivory_isf", "" },
			{ "ext_ivory_lfa", "" },
			{ "ext_ivory_190e", "" },
			{ "ext_ivory_evox", "" },
			{ "ext_ivory_r34", "" },
			{ "ext_ivory_wrx", "" },
			{ "ext_ivory_supra", "" },

			{ "B_mas_cars_Hilux_Unarmed", "(call life_donator) > 0" },
			{ "B_mas_cars_Hilux_M2", "(call life_donator) > 0" },
			{ "UAZ_Unarmed", "(call life_donator) > 0" },
			{ "UAZ_Rebels", "(call life_donator) > 0" },
			{ "B_mas_cars_LR_Unarmed", "(call life_donator) > 0" },
			{ "C_Hatchback_01_sport_F", "(call life_donator) > 0" },
			{ "O_MRAP_02_F", "(call life_donator) > 0" },
			{ "ext_Jonzie_XB", "(call life_donator) > 0" }
		};
	};

	class civ_truck {
		side = "civ";
		conditions = "license_civ_truck";
		conditionsMessage = "Необходима лицензия водителя грузовика";
		multiplier = 1;
		vehicles[] = {
			{ "C_Van_01_box_F", "" },
			{ "GeK_UAZ_3303", "" },
			{ "I_Truck_02_transport_F", "" },
			{ "I_Truck_02_covered_CIV_F", "" },
			{ "GeK_Zil_bleu", "" },
			{ "O_Truck_02_fuel_F", "" },
			{ "B_Truck_01_mover_F", "" },
			{ "B_Truck_01_transport_F", "" },
			{ "B_Truck_01_covered_F", "" },
			{ "O_Truck_03_transport_F", "" },
			{ "O_Truck_03_covered_F", "" },
			{ "O_Truck_03_fuel_F", "" },
			{ "B_Truck_01_box_CIV_F", "" },
			{ "B_Truck_01_fuel_CIV_F", "" },
			//{ "O_Truck_03_device_F", "" },
			//{ "shounka_a3_mantgs_2_in", "" },
			{ "shounka_a3_renaultmagnum_f", "" },
			{ "ext_Jonzie_Tanker_Truck", "" },
			{ "ext_Jonzie_Box_Truck", "" },

			{ "I_mas_cars_Ural", "(call life_donator) > 0" },
			{ "I_mas_cars_Ural_open", "(call life_donator) > 0" },
			{ "I_mas_cars_Ural_fuel", "(call life_donator) > 0" }
		};
	};

	class reb_truck {
		side = "reb";
		conditions = "license_reb_truck";
		conditionsMessage = "Необходима лицензия водителя грузовика";
		multiplier = 1;
		vehicles[] = {
			{ "I_Truck_02_transport_F", "" },
			{ "GeK_UAZ_3303", "" },
			{ "I_Truck_02_covered_F", "" },
			{ "O_Truck_02_fuel_F", "" },
			{ "B_Truck_01_transport_F", "" },
			{ "B_Truck_01_covered_F", "" },
			{ "O_Truck_03_transport_F", "" },
			{ "O_Truck_03_covered_F", "" },
			{ "O_Truck_03_fuel_F", "" },
			{ "B_Truck_01_box_F", "" },
			{ "B_Truck_01_fuel_F", "" },
			//{ "O_Truck_03_device_F", "" },
			//{ "shounka_a3_mantgs_2_in", "" },
			{ "shounka_a3_renaultmagnum_f", "" },

			{ "I_mas_cars_Ural", "(call life_donator) > 0" },
			{ "I_mas_cars_Ural_open", "(call life_donator) > 0" },
			{ "I_mas_cars_Ural_fuel", "(call life_donator) > 0" }
		};
	};

	class civ_air {
		side = "civ";
		conditions = "license_civ_air";
		conditionsMessage = "Необходима лицензия пилота";
		multiplier = 1;
		vehicles[] = {
			{ "C_Heli_Light_01_civil_F", "" },
			{ "B_Heli_Light_01_F", "" },
			{ "O_Heli_Light_02_unarmed_F", "" },
			{ "I_Heli_Transport_02_F", "" },
			{ "O_Heli_Transport_04_covered_F", "" },
			{ "O_Heli_Transport_04_box_F", "" },
			{ "O_Heli_Transport_04_fuel_F", "" }
		};
	};

	class reb_air: civ_air {
		side = "reb";
		conditions = "license_reb_air";
	};

	class vip_civcar {
		side = "civ";
		conditions = "(call life_donator) > 0";
		conditionsMessage = "Необходимо членство в вип-клубе";
		multiplier = 1;
		vehicles[] = {
			{ "SIG_SuperBee", "" },
			{ "SIG_SuperBeeY", "" },
			{ "SIG_SuperBeeB", "" },
			{ "SIG_SuperBeeL", "" },
			{ "SIG_SuperBeeM", "" },
			{ "SIG_SuperBeeG", "" },
			{ "SIG_Roadrunner", "" },
			{ "SIG_Hubcaps", "" },
			{ "SIG_Magnums", "" },
			{ "SIG_Hcode", "" },
			//{ "mrshounka_92_civ", "" },
			{ "Mrshounka_mustang_civ", "" },
			{ "Mrshounka_jeep_blinde_noir", "" },
			{ "Mrshounka_raptor2_civ", "" },
			{ "Mrshounka_cherokee_noir", "" },
			{ "AMG__MercedesBenz6x6", "" },
			{ "mrshounka_huracan_c", "" },
			{ "Mrshounka_veneno_c", "" },
			{ "Mrshounka_agera_p", "" },
			{ "Mrshounka_hummer_civ", "" },
			{ "Mrshounka_lincoln_civ", "" },
			{ "Mrshounka_lykan_c", "" },
			{ "Faisal_MaybachLaundet57", "" },
			{ "shounka_f430_spider", "" },
			{ "shounka_h2", "" },
			{ "shounka_gt", "" },
			{ "Mrshounka_c63_2015_civ", "" },
			{ "shounka_avalanche", "" },
			{ "shounka_rs6", "" },
			{ "ext_ivory_elise", "" },
			{ "ext_ivory_c", "" },
			{ "ext_ivory_veyron", "" },
			{ "ext_ivory_gt500", "" },
			//{ "ext_ivory_f1", "" },
			{ "ext_ivory_mp4", "" }
		};
	};

	class vip_rebcar: vip_civcar {
		side = "reb";
	};

	class civ_ship {
		side = "civ";
		conditions = "license_civ_boat";
		conditionsMessage = "Лицензия моряка";
		multiplier = 1;
		vehicles[] = {
			{ "ext_sab_boat", "" },
			{ "C_Rubberboat", "" },
			{ "C_Boat_Civil_01_F", "" },
			{ "GeK_Ferry", "" },
			{ "Shalllop", "" },
			{ "C_Fishing_Boat", "" },
			{ "B_SDV_01_F", "(call life_donator) > 0" },
			{ "extremo_lcm", "(call life_donator) > 0" }
		};
	};

	class reb_ship {
		side = "reb";
		conditions = "license_reb_boat";
		conditionsMessage = "Лицензия моряка";
		multiplier = 1;
		vehicles[] = {
			{ "ext_sab_boat", "" },
			{ "I_Boat_Transport_01_F", "" },
			{ "C_Boat_Civil_01_F", "" },
			{ "Shalllop", "" },
			{ "C_Fishing_Boat", "" },
			{ "I_SDV_01_F", "(call life_donator) > 0" },
			{ "extremo_lcm", "(call life_donator) > 0" }
		};
	};

	class cop_car {
		side = "cop";
		conditions = "!(life_coplevel in [19,20,21,22,23])";
		conditionsMessage = "Только для сотрудников полиции";
		multiplier = 0.25;
		vehicles[] = {
			{ "EXT_W_Offroad_01_F", "" },
			{ "ivory_wrx_pd_m1", "" },
			{ "Mrshounka_a3_308_gend", "" },
			{ "FaisalAlYahya_CVPI_police", ""},
			{ "Mrshounka_a3_rs_gend", "life_coplevel > 2" },
			{ "ivory_wrx_pd_m2", "life_coplevel > 3" },
			{ "ivory_m3_pd_M", "life_coplevel > 3" },
			{ "ivory_isf_pd_m", "life_coplevel > 3" },
			{ "ext_ivory_evox_police", "life_coplevel > 4" },
			{ "ext_ivory_wrx_police", "life_coplevel > 4" },
			{ "ext_ivory_rs4_police", "life_coplevel > 5" },
			{ "ext_ivory_isf_police", "life_coplevel > 5" },
			{ "ext_ivory_m3_police", "life_coplevel > 5" },
			{ "AMG_TahoePolice", "life_coplevel > 6" },
			{ "Mrshounka_rs_2015_g", "life_coplevel > 5" },
			{ "Mrshounka_bmw_gend", "life_coplevel > 8" },
			{ "Mrshounka_evox_gend", "life_coplevel > 8" },
			{ "shounka_a3_audiq7_v2_gendarmerie", "life_coplevel > 9" },
			//{ "shounka_a3_brinks_bleufonce", "life_coplevel > 9" },
			{ "Faisal_Youkun2015_PD", "life_coplevel > 10" },
			{ "I_MRAP_03_F", "life_coplevel > 10" },
			{ "B_G_Offroad_01_armed_F", "life_coplevel > 10" },

			{ "Mrshounka_Vandura_civ", "life_coplevel == 19" },

			{ "shounka_avalanche", "life_coplevel > 23" },
			{ "ivory_wrx_pd_m3", "life_coplevel > 24" },
			{ "B_mas_HMMWV_M2", "life_coplevel == 24" }
			//{ "B_mas_HMMWV_TOW", "life_coplevel > 24" }
		};
	};

	class swat_car {
		side = "cop";
		conditions = "life_coplevel == 23";
		conditionsMessage = "Только для сотрудников S.W.A.T";
		multiplier = 0.25;
		vehicles[] = {
			{ "vet_GAZ_2975_Tiger_special_version", ""},
			{ "PMC_Offroad_Transport", "" },
			{ "Mrshounka_a3_dodge15_civ", "" },
			{ "Mrshounka_a3_rs_gend", "" },
			{ "shounka_a3_gendsprinter", "" },
			{ "Mrshounka_rs_2015_g", "" },
			{ "shounka_a3_suburbangign", "" },
			{ "O_MRAP_02_F", "" },
			{ "I_MRAP_03_F", "" },
			{ "B_mas_HMMWV_M2", "" }
		};
	};

	class dea_car {
		side = "cop";
		conditions = "life_coplevel == 22";
		conditionsMessage = "Только для сотрудников DEA";
		multiplier = 0.25;
		vehicles[] = {
			{ "I_MRAP_03_F", "" },
			{ "O_MRAP_02_F", "" }
		};
	};

	class crimi_car {
		side = "cop";
		conditions = "life_coplevel in [20,21]";
		conditionsMessage = "Только для SHERIFF и DETECTIVE";
		multiplier = 0.25;
		vehicles[] = {
			{ "Mrjeffery_bmw_gend", "life_coplevel == 20" },
			{ "jeffery_a3_audiq7_v2_gendarmerie", "life_coplevel == 20" },
			{ "Jeffery_a3_508gend", "life_coplevel == 20" },
			{ "shounka_a3_rs5_civ", "life_coplevel == 21" },
			{ "Mrshounka_rs4_civ", "life_coplevel == 21" },
			{ "Mrshounka_evox_civ", "life_coplevel == 21" },
			{ "Mrshounka_a3_308_civ", "life_coplevel == 21" },
			{ "shounka_a3_peugeot508_civ", "life_coplevel == 21" },
			{ "SIG_SuperBeeB", "life_coplevel == 21 && (call life_donator) > 0" },
			{ "Mrshounka_a3_dodge15_civ", "life_coplevel == 21" }
		};
	};

	class dea_air {
		side = "cop";
		conditions = "life_coplevel == 22";
		conditionsMessage = "Только для сотрудников DEA";
		multiplier = 0.25;
		vehicles[] = {
			{ "B_Heli_Light_01_F", "" },
			{ "B_mas_UH1Y_UNA_F", "" }
		};
	};

	class cop_air {
		side = "cop";
		conditions = "";
		conditionsMessage = "";
		multiplier = 0.25;
		vehicles[] = {
			{ "B_Heli_Light_01_F", "life_coplevel > 1" },
			{ "O_Heli_Light_02_unarmed_F", "life_coplevel > 8" },
			{ "B_Heli_Transport_03_unarmed_F", "life_coplevel > 8" },
			{ "I_Heli_light_03_unarmed_F", "life_coplevel > 14" },
			{ "B_mas_UH1Y_UNA_F", "life_coplevel > 22" }
		};
	};

	class swat_air {
		side = "cop";
		conditions = "life_coplevel == 23";
		conditionsMessage = "Только для сотрудников SWAT";
		multiplier = 0.25;
		vehicles[] = {
			{ "B_Heli_Light_01_F", "" },
			{ "I_Heli_light_03_unarmed_F", "" },
			{ "B_Heli_Transport_03_unarmed_F", "" },
			{ "B_mas_UH1Y_UNA_F", "" }
		};
	};

	class cop_air_hq {
		side = "cop";
		conditions = "";
		conditionsMessage = "";
		multiplier = 0.25;
		vehicles[] = {
			{ "atm_C130_J", "life_coplevel > 3" }
		};
	};

	class cop_ship {
		side = "cop";
		conditions = "";
		conditionsMessage = "";
		multiplier = 0.25;
		vehicles[] = {
			{ "B_Boat_Transport_01_F", "life_coplevel > 1" },
			{ "C_Boat_Civil_01_police_F", "life_coplevel > 1" },
			{ "B_Boat_Armed_01_minigun_F", "life_coplevel > 2" },
			{ "B_SDV_01_F", "life_coplevel > 2" }
		};
	};

	class donat_civair {
		side = "civ";
		conditions = "(call life_donator) > 0";
		conditionsMessage = "Необходимо членство в вип-клубе";
		multiplier = 1;
		vehicles[] = {
			{ "I_Plane_Fighter_03_AA_F", "" },
			{ "C_Plane_Civil_01_F", "" }
		};
	};
	class donat_rebair: donat_civair {
		side = "reb";
	};

	class aff_car {
		side = "reb";
		conditions = "license_reb_aff";
		conditionsMessage = "";
		multiplier = 1;
		vehicles[] = {
			{ "B_G_Offroad_01_armed_F", "life_reblevel > 1" },
			{ "O_MRAP_02_F", "life_reblevel > 1" },
			{ "B_mas_HMMWV_ISF", "life_reblevel > 1" },
			{ "B_mas_HMMWV_ISF_M2", "life_reblevel > 1" },
			{ "B_mas_UH1Y_UNA_F", "life_reblevel > 1" }
		};
	};
	class fb_car {
		side = "civ";
		conditions = "license_civ_fb";
		conditionsMessage = "";
		multiplier = 1;
		vehicles[] = {
			{ "O_MRAP_02_F", "" },
			{ "B_mas_HMMWV_M2", "life_civlevel > 1" },
			{ "Mrshounka_corbillard_c_bleufonce", "life_civlevel > 1" },
			{ "B_mas_UH1Y_UNA_F", "life_civlevel > 1" }
		};
	};
	class vl_car {
		side = "civ";
		conditions = "license_civ_vl";
		conditionsMessage = "";
		multiplier = 1;
		vehicles[] = {
			{ "O_MRAP_02_F", "" },
			{ "B_mas_HMMWV_M2", "life_civlevel > 1" },
			{ "B_mas_UH1Y_UNA_F", "life_civlevel > 1" }
		};
	};

	class ira_car {
		side = "civ";
		conditions = "license_civ_ira";
		conditionsMessage = "";
		multiplier = 1;
		vehicles[] = {
			//{ "ext_ivory_wrx", "" },
			{ "O_MRAP_02_F", "" },
			{ "B_mas_HMMWV_ira_M2", "life_civlevel > 1" },
			{ "B_mas_UH1Y_UNA_F", "life_civlevel > 1" }
		};
	};

	class mc_car {
		side = "reb";
		conditions = "license_reb_mc";
		conditionsMessage = "";
		multiplier = 1;
		vehicles[] = {
			//{ "O_MRAP_02_F", "life_reblevel > 1" },
			//{ "B_mas_HMMWV_W_M2", "life_reblevel > 1" },
			//{ "B_mas_UH1Y_UNA_F", "life_reblevel > 1" }
			{ "ext_ivory_wrx", ""}
		};
	};

	class rfa_car {
		side = "reb";
		conditions = "license_reb_rfa";
		conditionsMessage = "";
		multiplier = 1;
		vehicles[] = {
			/*{ "O_MRAP_02_F", "life_reblevel > 1" },
			{ "B_mas_HMMWV_RFA_M2", "life_reblevel > 1" },
			{ "B_Heli_Light_01_F", "life_reblevel > 1" },
			{ "B_mas_UH1Y_UNA_F", "life_reblevel > 2" }*/
		};
	};

	class led_car {
		side = "civ";
		conditions = "license_civ_led";
		conditionsMessage = "";
		multiplier = 0.25;
		vehicles[] = {
			{ "Altmerion_bmw_prok", "" },
			{ "Mrshounka_cherokee_noir", "" },
			{ "B_Heli_Light_01_F", "" }
		};
	};

	class arg_car {
		side = "reb";
		conditions = "license_reb_arg";
		conditionsMessage = "";
		multiplier = 1;
		vehicles[] = {
			{ "B_mas_HMMWV_ARG_M2", "life_reblevel > 1" },
			{ "B_mas_cars_LR_M2", "life_reblevel > 1" },
			{ "O_MRAP_02_F", "life_reblevel > 1" },
			{ "B_Heli_Light_01_F", "life_reblevel > 1" },
			{ "I_Heli_light_03_unarmed_F", "life_reblevel > 1" },
			{ "B_mas_UH1Y_UNA_F", "life_reblevel > 2" }
		};
	};

	class sdr_car : reb_car {
		side = "reb";
		conditions = "license_reb_sdr";
		conditionsMessage = "";
		multiplier = 1;
		/*vehicles[] = {
			{ "B_mas_HMMWV_sdr", "life_reblevel > 1" },
			{ "B_mas_HMMWV_sdr_M2", "life_reblevel > 1" },
			{ "B_G_Offroad_01_armed_F", "life_reblevel > 1" },
			{ "O_MRAP_02_F", "life_reblevel > 1" },
			{ "B_Heli_Light_01_F", "life_reblevel > 1" },
			{ "I_Heli_light_03_unarmed_F", "life_reblevel > 1" },
			{ "B_mas_UH1Y_UNA_F", "life_reblevel > 2" }
		};*/
	};

	class nmd_car {
		side = "reb";
		conditions = "license_reb_nmd";
		conditionsMessage = "";
		multiplier = 1;
		vehicles[] = {
			{ "shounka_harley_a3", "" },
			{ "shounka_harley_a3_bleu", "" },
			{ "shounka_harley_a3_lolz", "" },
			{ "shounka_harley_a3_noir", "" },
			{ "shounka_harley_a3_rouge", "" },
			{ "xarley", "" }
		};
	};

	class press_car {
		side = "civ";
		conditions = "license_civ_press";
		conditionsMessage = "";
		multiplier = 0.25;
		vehicles[] = {
			//{ "C_Offroad_01_F", "" },
			{ "Mrshounka_Vandura_civ_7ch", "" },
			{ "dezkit_b206_ems", "" },
			{ "O_MRAP_02_F", "" }
		};
	};

	class taxi_car {
		side = "civ";
		conditions = "license_civ_taxi";
		conditionsMessage = "";
		multiplier = 1;
		vehicles[] = {
			{ "C_Hatchback_01_sport_Taxi", "" },
			{ "RDS_Ikarus_Civ_01", "" },
			{ "ext_ivory_190e_taxi", "" },
			{ "ext_ivory_rs4_taxi", "" },
			{ "shounka_limo_civ", "" },
			{ "C_Heli_Light_01_civil_Taxi", "" }
		};
	};

	class mfo_car {
		side = "reb";
		conditions = "license_reb_mfo";
		conditionsMessage = "";
		multiplier = 1;
		vehicles[] = {
			/*{ "O_MRAP_02_F", "" },
			{ "B_mas_HMMWV_M2", "" },
			{ "B_mas_UH1Y_UNA_F", "" }*/
		};
	};

	class bf_car {
		side = "civ";
		conditions = "license_civ_bf";
		conditionsMessage = "";
		multiplier = 1;
		vehicles[] = {
			{ "gac_jsdf_klx", "" },
			{ "B_Quadbike_01_F", "" },
			{ "RDS_Lada_Civ_01", "" },
			{ "RDS_Lada_Civ_02", "" },
			{ "RDS_Lada_Civ_03", "" },
			{ "RDS_Lada_Civ_04", "" },
			{ "RDS_Lada_Civ_06", "" },
			{ "RDS_Lada_Civ_07", "" },
			{ "RDS_Gaz24_Civ_01", "" },
			{ "RDS_Gaz24_Civ_02", "" },
			{ "RDS_Gaz24_Civ_03", "" },
			{ "RDS_Golf4_Civ_06", "" },
			{ "RDS_Golf4_Civ_03", "" },
			{ "RDS_Golf4_Civ_05", "" },
			{ "RDS_Golf4_Civ_01", "" },
			{ "RDS_Golf4_Civ_04", "" },
			{ "RDS_Golf4_Civ_02", "" },
			{ "RDS_S1203_Civ_08", "" },
			{ "RDS_S1203_Civ_05", "" },
			{ "RDS_S1203_Civ_07", "" },
			{ "RDS_S1203_Civ_01", "" },
			{ "RDS_S1203_Civ_06", "" },
			{ "RDS_S1203_Civ_04", "" },
			{ "C_Hatchback_01_F", "" },
			//{ "C_Offroad_01_F", "" },
			{ "C_SUV_01_F", "" },
			{ "C_Van_01_transport_F", "" },
			{ "shounka_a3_spr_civ", "" },
			{ "Mrshounka_a3_smart_civ", "" },
			{ "Mrshounka_r5_civ", "" },
			{ "Mrshounka_twingo_p", "" },
			//{ "shounka_a3_cliors_civ", "" },
			{ "Mrshounka_a3_ds3_civ", "" },
			//{ "shounka_a3_ds4_civ", "" },
			{ "Mrshounka_c4_p_civ", "" },
			//{ "Mrshounka_megane_rs_2015_noir", "" },
			{ "Mrshounka_207_civ", "" },
			{ "Mrshounka_a3_308_civ", "" },
			{ "Mrshounka_a3_308_rcz", "" },
			//{ "shounka_a3_peugeot508_civ", "" },
			{ "Mrshounka_a3_gtr_civ", "" },
			{ "Mrshounka_cayenne_p_civ", "" },
			{ "Mrshounka_rs4_civ", "" },
			{ "Mrshounka_a3_dodge15_civ", "" },
			{ "Mrshounka_ducati_p", "" },
			{ "Mrshounka_evox_civ", "" },
			{ "Mrshounka_Alfa_Romeo_civ", "" },
			{ "Mrshounka_bmwm1_civ", "" },
			{ "Mrshounka_bmwm6_civ", "" },
			{ "Mrshounka_Bowler_c", "" },
			{ "Mrshounka_golfvi_civ", "" },
			{ "Mrshounka_Vandura_civ", "" },
			{ "Mrshounka_Volkswagen_Touareg_civ", "" },
			//{ "Mrshounka_yamaha_p", "" },
			//{ "shounka_a3_rs5_civ", "" },
			{ "Mrshounka_mercedes_190_p_civ", "" },
			{ "shounka_clk", "" },
			{ "shounka_porsche911", "" },
			{ "ext_Jonzie_Mini_Cooper", "" },
			{ "ext_Jonzie_Mini_Cooper_R_spec", "" },
			{ "ext_Jonzie_STI", "" },
			{ "ext_Jonzie_30CSL", "" },
			{ "ext_Jonzie_Datsun_Z432", "" },
			{ "ext_ivory_rs4", "" },
			{ "ext_ivory_e36", "" },
			{ "ext_ivory_m3", "" },
			{ "ext_ivory_isf", "" },
			{ "ext_ivory_lfa", "" },
			{ "ext_ivory_190e", "" },
			{ "ext_ivory_evox", "" },
			{ "ext_ivory_r34", "" },
			{ "ext_ivory_wrx", "" },
			{ "ext_ivory_supra", "" },

			{ "C_Hatchback_01_sport_F", "(call life_donator) > 0" },
			{ "UAZ_green", "(call life_donator) > 0" },
			{ "UAZ_Hunter_s", "(call life_donator) > 0" },
			{ "UAZ_Hunter_g", "(call life_donator) > 0" },
			{ "B_mas_cars_LR_Unarmed", "(call life_donator) > 0" },
			{ "C_Offroad_02_unarmed_F", "(call life_donator) > 0" },
			{ "ext_Jonzie_XB", "(call life_donator) > 0" },
			{ "BHS_ifrit", "life_civlevel > 1" },
		    { "B_mas_UH1Y_UNA_F", "life_civlevel > 2" },
			{ "O_Truck_03_device_F", "life_civlevel > 2" },
			{ "B_mas_HMMWV_M2", "life_civlevel > 2" }
		};
	};

	class nsb_car {
		side = "reb";
		conditions = "license_reb_nsb";
		conditionsMessage = "";
		multiplier = 1;
		vehicles[] = {
			//{ "O_MRAP_02_F", "life_reblevel > 1" },
			{ "I_MRAP_03_F", "life_reblevel > 1" },
			//{ "B_mas_HMMWV_M2", "life_reblevel > 1" },
			{ "B_Heli_Light_01_F", "life_reblevel > 1" },
			{ "B_mas_HMMWV_M134_des", "life_reblevel > 2" }
			//{ "I_Heli_light_03_unarmed_F", "life_reblevel > 2" }
		};
	};

	class la_car {
		side = "reb";
		conditions = "license_reb_la";
		conditionsMessage = "";
		multiplier = 1;
		vehicles[] = {
			{ "O_MRAP_02_F", "life_reblevel > 1" },
			{ "B_mas_HMMWV_LA_M2", "life_reblevel > 2" },
			{ "B_mas_UH1Y_UNA_F", "life_reblevel > 1" }
		};
	};

	class ccp_car {
		side = "civ";
		conditions = "license_civ_ccp";
		conditionsMessage = "";
		multiplier = 1;
		vehicles[] = {
			{ "O_MRAP_02_F", "" },
			{ "B_mas_HMMWV_CCP_M2", "" },
			{ "I_Heli_light_03_unarmed_F", "life_civlevel > 1" }
		};
	};

	class ccp_ship {
		side = "civ";
		conditions = "license_civ_ccp";
		conditionsMessage = "";
		multiplier = 0.85;
		vehicles[] = {
			{ "I_Boat_Armed_01_minigun_F", "life_civlevel > 1" }
		};
	};

	class ics_car {
		side = "civ";
		conditions = "license_civ_ics";
		conditionsMessage = "";
		multiplier = 1;
		vehicles[] = {
			{ "O_MRAP_02_F", "" },
			{ "B_Heli_Light_01_F", "" },
			{ "quiet_sub2015_noir_f", "life_civlevel > 1" },
			{ "B_mas_HMMWV_ICS_M2", "life_civlevel > 1" },
			{ "B_mas_UH1Y_UNA_F", "life_civlevel > 1" },
			{ "I_Heli_light_03_unarmed_F", "life_civlevel > 1" }
		};
	};

	class bst_car {
		side = "civ";
		conditions = "license_civ_bst";
		conditionsMessage = "";
		multiplier = 1;
		vehicles[] = {
			{ "O_MRAP_02_F", "" },
			{ "B_mas_UH1Y_UNA_F", "life_civlevel > 1" }
		};
	};

	class fsg_car {
		side = "reb";
		conditions = "license_reb_fsg";
		conditionsMessage = "";
		multiplier = 1;
		vehicles[] = {
			{ "O_MRAP_02_F", "life_reblevel > 1" },
			{ "B_mas_HMMWV_FSG_M2", "life_reblevel > 1" },
			{ "B_Heli_Light_01_F", "life_reblevel > 1" },
			{ "B_mas_UH1Y_UNA_F", "life_reblevel > 2" }
		};
	};
};