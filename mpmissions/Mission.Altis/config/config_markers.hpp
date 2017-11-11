/*

	LifeCfgMapCheckBoxes

	Менять можно только titleTXT и markersArray (из LifeCfgMapMarkers)
	Чекбоксы без titleTXT будут скрываться

*/

class LifeCfgMapCheckBoxes {
	class EMM_cb_0 {
		titleID = 1130;
		checkboxID = 1140;
		titleTXT = "Зоны добычи";
		markersArray = "gather";
	};
	class EMM_cb_1 {
		titleID = 1131;
		checkboxID = 1141;
		titleTXT = "Переработка";
		markersArray = "process";
	};
	class EMM_cb_2 {
		titleID = 1132;
		checkboxID = 1142;
		titleTXT = "Продажа ресурсов";
		markersArray = "virshop";
	};
	class EMM_cb_3 {
		titleID = 1133;
		checkboxID = 1143;
		titleTXT = "Магазины оружия";
		markersArray = "weapshop";
	};
	class EMM_cb_4 {
		titleID = 1134;
		checkboxID = 1144;
		titleTXT = "Магазины предметов";
		markersArray = "itemshop";
	};
	class EMM_cb_5 {
		titleID = 1135;
		checkboxID = 1145;
		titleTXT = "Магазины одежды";
		markersArray = "clothshop";
	};
	class EMM_cb_6 {
		titleID = 1136;
		checkboxID = 1146;
		titleTXT = "Магазины техники";
		markersArray = "vehsop";
	};
	class EMM_cb_7 {
		titleID = 1137;
		checkboxID = 1147;
		titleTXT = "Услуги";
		markersArray = "service";
	};
	class EMM_cb_8 {
		titleID = 1138;
		checkboxID = 1148;
		titleTXT = "Города / Базы";
		markersArray = "base";
	};
	class EMM_cb_9 {
		titleID = 1139;
		checkboxID = 1149;
		titleTXT = "Гаражи";
		markersArray = "gar";
	};
	class EMM_cb_10 {
		titleID = 1150;
		checkboxID = 1160;
		titleTXT = "ДП";
		markersArray = "dp";
	};
	class EMM_cb_11 {
		titleID = 1151;
		checkboxID = 1161;
		titleTXT = "Прочее";
		markersArray = "other";
	};
};

class LifeCfgMapMarkers {
	class Altis {
		other[] = {"water_box","water_box_1","water_box_2","water_box_3","water_box_4","water_box_5","water_box_6","water_box_7","water_box_8","water_box_9","water_box_10","water_box_11","water_box_12","water_box_13","water_box_14","water_box_15","water_box_16","water_box_17","water_box_18","water_box_19","water_box_20","water_box_21","water_box_22","water_box_23","water_box_24","water_box_25","water_box_26","atm_marker","atm_marker_1","atm_marker_1_1","atm_marker_1_2","atm_marker_1_3","atm_marker_1_3_1","atm_marker_2","atm_marker_2_1","atm_marker_2_11","atm_marker_2_2_1","atm_marker_2_4","atm_marker_2_5_1","atm_marker_2_7","atm_marker_2_8","atm_marker_3_1","atm_marker_3_2","atm_marker_4","atm_marker_4_2","atm_marker_5_2","atm_marker_5_3_1","atm_marker_5_3_1_2","atm_marker_5_3_1_4","atm_marker_5_3_1_4_2","atm_marker_5_3_1_4_2_1","atm_marker_5_3_1_6","atm_marker_5_3_1_7","atm_marker_5_3_1_8","atm_market_1","atm_market_2","atm_market_3","atm_marker","atm_marker_1","atm_marker_3","atm_marker_5","atm_marker_9","atm_marker_10","atm_marker_11","atm_marker_12","atm_marker_13","atm_marker_14","atm_marker_15","atm_marker_16","atm_marker_17","atm_marker_18","atm_marker_19","atm_marker_20","atm_marker_21","atm_marker_22","atm_marker_23","atm_marker_24","atm_marker_25","atm_marker_26","atm_marker_27","atm_marker_28","atm_marker_29","atm_marker_6","atm_marker_7","atm_marker_8","atm_marker_4","atm_marker_2","speed_mark_1","speed_mark_2","speed_mark_3","speed_mark_4","speed_mark","speed_mark_5","infopanel","infopanel_1","infopanel_2_1","infopanel_2_1_1","infopanel_2","heli_refuel_1","heli_refuel_1_1","slavery_market","uranium1_marker","nuclear_alarm_1"};
		gather[] = {"apple_1","apple_2","apple_3","apple_4","apple_5","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","weed_1","meth_1","rye_1","yeast_1","hops_1","corn_1","tobacco_1","cotton_1","lead_1","iron_1","salt_1","sand_1","diamond_1","oil_1","oil_2","gas_1","rock_1","uranium1_zone","tree_1",
		"fish_1","fish_2","turtle_zone_1","turtle_zone_2","turtle_zone_3","hunt_zone","hunt_zone_mark","fish_zone","fish_zone_1","turtle_1","turtle_2","turtle_3"};
		base[] = {"base_hospital_4","base_7news","base_reb_3","base_fedreserve","base_hospital_1","base_hospital_2","base_cop_3","base_cop_pirgos","base_cop_1","base_kpp_kavala","base_nomads","base_mfo_mark","base_reb_2","base_taxi","base_sdr_2","base_cop_jail","base_cop_2","base_kpp_atira","base_reb_1","base_reb_city","base_hospital_3","base_arg_mark","base_sdr_3","base_aff_mark_1","base_mc","base_sdr_1","base_vl","base_nsb","base_mafia","base_nsb_1","base_rfa","base_ira","base_stels_1","base_prok","base_ccp","base_fb","base_hospital_5","base_aff_mark","base_cop_4","base_cop_5","base_cop_6","gov_spawn","base_bst","base_fsg","base_opr","base_cop_7"};
		process[] = {"process_salt","process_oil_1","process_iron","process_diamond_1","process_weed_1","process_copper_1","process_sand","process_heroin","process_rock","process_alco_2","process_alco_3","process_alco_1","process_oil_2","process_coke","process_meth","process_weed_2","process_gas","process_uran_1","process_cigar","process_uran_2","process_diamond_2","process_copper_2","process_amon","process_fish"};
		virshop[] = {"shopvir_fish","shopvir_dealer_1","shopvir_dealer_2","shopvir_food_1","shopvir_food_2","shopvir_food_3","shopvir_oil","shopvir_salt","shopvir_diamond","shopvir_glass","shopvir_copper","shopvir_food_4","shopvir_cement","shopvir_turtle_1","shopvir_dealer_4","shopvir_turtle_2","shopvir_turtle_3","shopvir_food_5","shopvir_wood","shopvir_dealer_3","shopvir_art","shopvir_gas","shopvir_alco","shopvir_uranium"};
		vehsop[] = {"shopveh_air","shopveh_truck","shopveh_car","shopveh_car_2","shopveh_boat_1","shopveh_car_1","shopveh_air_1","shopveh_truck_1","shopveh_boat_2","shopveh_boat_4","shopveh_car_3","shopveh_car_4","shopveh_air_3","shopveh_air_2","shopveh_car_reb","shopveh_car_vip_1","shopveh_car_vip_2","shopveh_car_vip_4","shopveh_car_vip_5","shopveh_car_vip_3","shopveh_boat_3","chop_shop_1","chop_shop_2","chop_shop_3","chop_shop_4","skyd_1","gangBattleVeh"};
		itemshop[] = {"shopitem_gen_1","shopitem_gen_2","shopitem_gen_3","shopitem_gen_4","shopeda","shopeda_1","shopeda_2","shopeda_3","shopeda_4","shopitem_pharm_1","shopitem_pharm_2","shopitem_pharm_3","shopitem_pharm_4","shopitem_pharm_5","shopbar_1","shop_meetings"};
		weapshop[] = {"shopweap_2","shopweap_3","shopweap_maf_1","shopweap_maf_2","shopweap_maf_3","shopweap_1","shopweap_reb"};
		clothshop[] = {"shopcloth_1","shopcloth_dive_2","shopcloth_2","shopcloth_5","shopcloth_4","shopcloth_dive_1","shopcloth_3","shopcloth_dive_3"};
		dp[] = {"base_dhl","dp_3_marker","dp_7_marker","dp_4_marker","dp_16_marker","dp_17_marker","dp_19_marker","dp_18_marker","dp_13_marker","dp_12_marker","dp_14_marker","dp_15_marker","dp_21_marker","dp_22_marker","dp_24_marker","dp_23_marker","dp_5_marker","dp_10_marker","dp_11_marker","dp_9_marker","dp_8_marker","dp_6_marker","dp_1_marker","dp_2_marker","dp_25_marker","dp_20_marker","cargoDeliver_Kavala","cargoDeliver_Molos","cargoDeliver_Mazi","cargoDeliver_Tonos"};
		gar[] = {"vehgar_2","vehgar_3","vehgar_9","vehgar_10","vehgar_11","vehgar_4","vehgar_1","vehgar_5","vehgar_6","vehgar_7","vehgar_8","civ_ship_1","civ_ship_2","civ_ship_3","reb_ship_1","civ_ship_sofia","reb_ship_base2","civ_ship_4","port_a_t_civ","port_a_t_reb","civ_carpark_1"};
		service[] = {"shoplicense_1","shoplicense_2","shoplicense_3","shoplicense_4","shopcraft_m_1","shopcraft_m_2","shop_maskciv","goreb_mark","goCiv_mark","casino_marker_1","parking_1","a_t_transfer","paintball_zone_marker","paintball_zone1"};
	};
	class kerama {
		other[] = {"atm_marker_1","atm_marker_2","atm_marker_3","atm_marker_4","atm_marker_5","atm_marker_6","atm_marker_7","atm_marker_8","atm_marker_9","atm_marker_10","atm_marker_11","atm_marker_12","atm_marker_13","atm_marker_14","atm_marker_15","atm_marker_16","atm_marker_17","atm_marker_18","atm_marker_19","atm_marker_20","atm_marker_21","atm_marker_22","atm_marker_23","atm_marker_24","atm_marker_25","atm_marker_26","atm_marker_27","atm_marker_28","atm_marker_29","atm_marker_30","atm_marker_31","atm_marker_32","atm_marker_33","atm_marker_34","atm_marker_35","atm_marker_36","atm_marker_37","atm_marker_38","atm_marker_39","atm_marker_40","atm_marker_41","tanoa_slavery_market","s_z_lifoy"};
		gather[] = {"anana_1","anana_2","anana_3","arwater_1","artpart_1","exhibit_1","banana_1","banana_2","bronze_1","bauxites_1","pearl_1","obsid_1","opium_1","coquina_1","blackd_1","amber_1","hunt_zone_1","coco_1","coco_2","royalc_1","coffe_1","woodr_1","olive_1","hunt_marker_1","cacao_1","sugar_1","cotton_1","woodb_1","weppart_1","hunt_zone_tanoa_1","hunt_zone_tanoa_2"};
		base[] = {"base_reb_1","base_reb_2","base_cia","base_hospital_1","base_hospital_2","base_hospital_3","base_hospital_4","base_nsb","base_cop_1","base_cop_2","base_cop_3","base_cop_4","base_taxi","tanoa_gang_area_1","tanoa_gang_area_2","base_7news","base_cop_jail"};
		process[] = {"proc_coquina","proc_weapmaster","proc_bronze","proc_allu","proc_royalc","proc_obsid","proc_blackd","proc_woodbu","proc_amber","proc_food","proc_bronzep","proc_coffee","proc_sofa","proc_opium","proc_roma","proc_woodrp","proc_woodbp"};
		virshop[] = {"shopvir_dealer_1","shopvir_export","shopvir_food_1","shopvir_food_2","shopvir_food_3","shopvir_food_4","shopvir_fish","shopvir_alco","shopvir_arti","shopvir_bronze","shopvir_wood","virtshop_obsid","virtshop_weappart","virtshop_bdiamond","virtshop_coquina","virtshop_value"};
		vehsop[] = {"shopveh_air_1","shopveh_air_2","shopveh_air_3","shopveh_air_4","shopveh_car_1","shopveh_car_2","shopveh_car_3","shopveh_car_4","shopveh_car_5","shopveh_car_6","shopveh_boat_1","shopveh_boat_2","shopveh_boat_3","shopveh_boat_4","shopveh_boat_5","shopveh_boat_6","shopveh_boat_7","shopveh_boat_8","shopveh_boat_9","shopveh_boat_10","shopveh_truck_1","shopveh_truck_2","shopveh_truck_3","shopveh_truck_4","shopveh_truck_5","vip_car_m1_1","vip_car_m1_2","chop_shop_1","chop_shop_3"};
		itemshop[] = {"shopitem_pharm_1","shopitem_pharm_2","shopitem_pharm_3","shopitem_pharm_4","shopitem_gen_1","shopitem_gen_2","shopitem_gen_3","shopitem_gen_4","shopbar_1"};
		weapshop[] = {"shopweap_1","shopweap_2","shopweap_3","shopweap_4","shopweap_5","shopweap_6","shopweap_7"};
		clothshop[] = {"shopcloth_1","shopcloth_2","shopcloth_3","shopcloth_4","shopcloth_dive_1","shopcloth_dive_2","shopcloth_dive_3","shopcloth_dive_4","shopcloth_dive_5","shopcloth_dive_6","shopcloth_dive_7","shopcloth_dive_8"};
		dp[] = {"base_dhl","dp_1_marker","dp_2_marker","dp_3_marker","dp_4_marker","dp_5_marker","dp_6_marker","dp_7_marker","dp_8_marker","dp_9_marker","dp_10_marker","dp_11_marker","dp_12_marker","dp_13_marker","dp_14_marker","dp_15_marker"};
		gar[] = {"vehgar_1","vehgar_2","vehgar_3","vehgar_4","vehgar_5","vehgar_6","vehgar_7","vehgar_8","vehgar_9","vehgar_10","vehgar_11","vehgar_12","tanoa_civ_ship_1","tanoa_civ_ship_2","tanoa_civ_ship_3","tanoa_civ_ship_4","tanoa_civ_ship_5","tanoa_civ_ship_6","tanoa_reb_ship_1","tanoa_reb_ship_2","tanoa_reb_ship_3","tanoa_reb_ship_4"};
		service[] = {"t_transfer","goreb_mark","t_transfer_civ","serice_touragency","shopcraft_m_1","shopcraft_m_2","goCiv_mark","slavery_market","shoplicense_1","shoplicense_2","casino_marker_1"};
	};
};