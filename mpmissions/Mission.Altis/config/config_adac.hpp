#define true 1
#define false 0

class LifeCfgAdac {
	class C_Van_01_transport_F {
		boxes = 1;
		nitro = false;
		textures[] = {
			{ "vtt_w", "" },
			{ "vtt_r", "" }
		};
		materials[] = {};
	};
	class C_Offroad_01_F {
		boxes = 1;
		nitro = true;
		textures[] = {
			{ "ffrd_r", "" },
			{ "ffrd_y", "" },
			{ "ffrd_w", "" },
			{ "ffrd_b", "" },
			{ "ffrd_br", "" },
			{ "ffrd_bw", "" },
			{ "ffrd_sb", "(call life_donator) > 0" },
			{ "rgb_cy", "" },
			{ "ffrd_v1", "(call life_donator) > 0" },
			{ "ffrd_ro", "(call life_donator) > 0" },
			{ "ffrd_bear", "(call life_donator) > 0" },
			{ "ffrd_2l", "(call life_donator) > 0" },
			{ "ffrd_gv", "(call life_donator) > 0" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class C_Hatchback_01_sport_F {
		boxes = 0;
		nitro = true;
		textures[] = {
			{ "htchbs_r", "" },
			{ "htchbs_br", "" },
			{ "htchbs_o", "" },
			{ "htchbs_bw", "" },
			{ "htchbs_t", "" },
			{ "htchbs_g", "" },
			{ "htchbs_va", "" },
			{ "htchbs_vme", "" },
			{ "htchbs_h", "" },
			{ "htchbs_s", "" }
		};
		materials[] = {"glossy","matte","metallic"};
	};
	class C_Hatchback_01_F {
		boxes = 0;
		nitro = true;
		textures[] = {
			{ "htchb_bs", "" },
			{ "htchb_g", "" },
			{ "htchb_bl", "" },
			{ "htchb_bbl", "" },
			{ "htchb_y", "" },
			{ "htchb_w", "" },
			{ "htchb_gr", "" },
			{ "htchb_b", "" }
		};
		materials[] = {"glossy","matte","metallic"};
	};
	class C_SUV_01_F {
		boxes = 0;
		nitro = true;
		textures[] = {
			{ "suv_br", "" },
			{ "suv_b", "" },
			{ "suv_s", "" },
			{ "suv_o", "" },
			{ "suv_vx6", "(call life_donator) > 0" },
			{ "suv_vd", "(call life_donator) > 0" },
			{ "suv_vnc", "(call life_donator) > 0" },
			{ "suv_vo", "(call life_donator) > 0" },
			{ "suv_vs", "(call life_donator) > 0" },
			{ "suv_vpm", "(call life_donator) > 0" },
			{ "suv_vme", "(call life_donator) > 0" },
			{ "suv_vgr", "(call life_donator) > 0" },
			{ "suv_vsw", "(call life_donator) > 0" },
			{ "suv_vcx", "(call life_donator) > 0" },
			{ "suv_vfs", "(call life_donator) > 0" },
			{ "suv_vme2", "(call life_donator) > 0" }
		};
		materials[] = {"glossy","matte","metallic"};
	};

	class B_Heli_Light_01_F {
		boxes = 0;
		nitro = false;
		textures[] = {
			{ "humm_bl", "" },
			{ "humm_r", "" },
			{ "humm_vme", "(call life_donator) > 0" },
			{ "humm_bln", "" },
			{ "humm_llp", "" },
			{ "humm_fr", "" },
			{ "humm_bj", "" },
			{ "humm_rl", "" },
			{ "humm_sn", "" },
			{ "humm_vrn", "" },
			{ "humm_wv", "" },
			{ "humm_reb", "" }
		};
		materials[] = {};
	};

	class C_Heli_Light_01_civil_F {
		boxes = 0;
		nitro = false;
		textures[] = {
			{ "humm_bln", "" },
			{ "humm_reb", "" },
			{ "humm_llp", "" },
			{ "humm_fr", "" },
			{ "humm_gra", "" },
			{ "humm_bj", "" },
			{ "humm_lg", "" },
			{ "humm_shd", "" },
			{ "humm_shr", "" },
			{ "humm_rl", "(call life_donator) > 0" },
			{ "humm_sn", "(call life_donator) > 0" },
			{ "humm_vrn", "" },
			{ "humm_wsp", "(call life_donator) > 0" },
			{ "humm_wv", "" }
		};
		materials[] = {};
	};

	class O_MRAP_02_F {
		boxes = 0;
		nitro = true;
		textures[] = {};
		materials[] = {};
	};
	class I_MRAP_03_F: O_MRAP_02_F {};
	class B_MRAP_01_F: O_MRAP_02_F {};
	
	class I_Truck_02_transport_F {
		boxes = 2;
		nitro = false;
		textures[] = {
			{ "itcc_or", "" },
			{ "itc_cm", "" }
		};
		materials[] = {};
	};
	
	class I_Truck_02_covered_F {
		boxes = 2;
		nitro = false;
		textures[] = {};
		materials[] = {};
	};
	class O_Truck_03_transport_F: I_Truck_02_covered_F {};
	class O_Truck_03_covered_F: I_Truck_02_covered_F {};

	class I_Truck_02_covered_CIV_F {
		boxes = 2;
		nitro = false;
		textures[] = {
			{"itcc_or", "" },
			{"itcc_r", "(call life_donator) > 0" },
			{"itcc_s", "(call life_donator) > 0" },
			{"itcc_w", "(call life_donator) > 0" },
			{"itcc_y", "(call life_donator) > 0" }
		};
		materials[] = {};
	};

	class B_Truck_01_transport_F {
		boxes = 3;
		nitro = false;
		textures[] = {};
		materials[] = {};
	};
	class B_Truck_01_covered_F: B_Truck_01_transport_F {};

	class Mrshounka_megane_rs_2015_noir {
		boxes = 0;
		nitro = true;
		textures[] = {
			{ "shnk_w", "" },
			{ "shnk_r", "" },
			{ "shnk_bbl", "" },
			{ "shnk_gr", "" },
			{ "shnk_y", "" },
			{ "shnk_bbr", "" },
			{ "shnk_o", "" },
			{ "shnk_rs", "" },
			{ "shnk_vi", "" },
			{ "shnk_bl", "" },
			{ "shnk_blr", "" },
			{ "shnk_g", "" },
			{ "shnk_blg", "" },
			{ "shnk_b", "" },
			{ "shnk_vr", "(call life_donator) > 0" },
			{ "shnk_vg", "(call life_donator) > 0" },
			{ "shnk_vbl", "(call life_donator) > 0" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class Mrshounka_raptor2_civ {
		boxes = 0;
		nitro = true;
		textures[] = {
			{ "shnk_w", "" },
			{ "shnk_r", "" },
			{ "shnk_bbl", "" },
			{ "shnk_gr", "" },
			{ "shnk_y", "" },
			{ "shnk_bbr", "" },
			{ "shnk_o", "" },
			{ "shnk_rs", "" },
			{ "shnk_vi", "" },
			{ "shnk_bl", "" },
			{ "shnk_blr", "" },
			{ "shnk_g", "" },
			{ "shnk_blg", "" },
			{ "shnk_b", "" },
			{ "shnk_vfc", "(call life_donator) > 0" },
			{ "shnk_vuc", "(call life_donator) > 0" },
			{ "shnk_vdc", "(call life_donator) > 0" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};

	class shounka_a3_mantgs_2_in {
		boxes = 0;
		nitro = false;
		textures[] = {
			{ "shnk_w", "" },
			{ "shnk_r", "" },
			{ "shnk_bbl", "" },
			{ "shnk_gr", "" },
			{ "shnk_y", "" },
			{ "shnk_bbr", "" },
			{ "shnk_o", "" },
			{ "shnk_rs", "" },
			{ "shnk_vi", "" },
			{ "shnk_bl", "" },
			{ "shnk_blr", "" },
			{ "shnk_g", "" },
			{ "shnk_blg", "" },
			{ "shnk_b", "" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class shounka_a3_renaultmagnum_f: shounka_a3_mantgs_2_in {};
	class ext_Jonzie_Tanker_Truck: shounka_a3_mantgs_2_in {};
	class ext_Jonzie_Box_Truck: shounka_a3_mantgs_2_in {};
	class ext_Jonzie_Tow_Truck: shounka_a3_mantgs_2_in {};
	class ext_Jonzie_Flat_Bed: shounka_a3_mantgs_2_in {};
	class ext_Jonzie_Log_Truck: shounka_a3_mantgs_2_in {};

	class Mrshounka_hummer_civ {
		boxes = 0;
		nitro = true;
		textures[] = {
			{ "shnk_w", "" },
			{ "shnk_r", "" },
			{ "shnk_bbl", "" },
			{ "shnk_gr", "" },
			{ "shnk_y", "" },			
			{ "shnk_o", "" },
			{ "shnk_rs", "" },
			{ "shnk_vi", "" },
			{ "shnk_bl", "" },
			{ "shnk_blr", "" },
			{ "shnk_g", "" },
			{ "shnk_blg", "" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class Mrshounka_Vandura_civ: Mrshounka_hummer_civ {};

	class shounka_a3_spr_civ {
		boxes = 0;
		nitro = true;
		textures[] = {
			{ "shnk_w", "" },
			{ "shnk_r", "" },
			{ "shnk_bbl", "" },
			{ "shnk_gr", "" },
			{ "shnk_y", "" },
			{ "shnk_bbr", "" },
			{ "shnk_o", "" },
			{ "shnk_rs", "" },
			{ "shnk_vi", "" },
			{ "shnk_bl", "" },
			{ "shnk_blr", "" },
			{ "shnk_g", "" },
			{ "shnk_blg", "" },
			{ "shnk_b", "" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};	
	class Mrshounka_a3_smart_civ: shounka_a3_spr_civ {};	
	class Mrshounka_r5_civ: shounka_a3_spr_civ {};	
	class Mrshounka_twingo_p: shounka_a3_spr_civ {};	
	class shounka_a3_cliors_civ: shounka_a3_spr_civ {};	
	class Mrshounka_a3_ds3_civ: shounka_a3_spr_civ {};	
	class shounka_a3_ds4_civ: shounka_a3_spr_civ {};	
	class Mrshounka_c4_p_civ: shounka_a3_spr_civ {};
	class Mrshounka_207_civ: shounka_a3_spr_civ {};	
	class Mrshounka_a3_308_civ: shounka_a3_spr_civ {};		
	class Mrshounka_a3_308_rcz: shounka_a3_spr_civ {};		
	class shounka_a3_peugeot508_civ: shounka_a3_spr_civ {};		
	class Mrshounka_a3_gtr_civ: shounka_a3_spr_civ {};		
	class Mrshounka_cayenne_p_civ: shounka_a3_spr_civ {};		
	class Mrshounka_rs4_civ: shounka_a3_spr_civ {};		
	class shounka_rs6: shounka_a3_spr_civ {};		
	class Mrshounka_a3_dodge15_civ: shounka_a3_spr_civ {};		
	class shounka_avalanche: shounka_a3_spr_civ {};		
	class Mrshounka_ducati_p: shounka_a3_spr_civ {};		
	class Mrshounka_evox_civ: shounka_a3_spr_civ {};		
	class mrshounka_92_civ: shounka_a3_spr_civ {};		
	class Mrshounka_mustang_civ: shounka_a3_spr_civ {};		
	class Mrshounka_jeep_blinde_noir: shounka_a3_spr_civ {};		
	class shounka_gt: shounka_a3_spr_civ {};		
	class Mrshounka_cherokee_noir: shounka_a3_spr_civ {};		
	class mrshounka_huracan_c: shounka_a3_spr_civ {};		
	class Mrshounka_veneno_c: shounka_a3_spr_civ {};		
	class shounka_f430_spider: shounka_a3_spr_civ {};		
	class Mrshounka_Alfa_Romeo_civ: shounka_a3_spr_civ {};		
	class Mrshounka_bmwm1_civ: shounka_a3_spr_civ {};		
	class Mrshounka_mercedes_190_p_civ: shounka_a3_spr_civ {};		
	class Mrshounka_bmwm6_civ: shounka_a3_spr_civ {};		
	class shounka_clk: shounka_a3_spr_civ {};		
	class Mrshounka_c63_2015_civ: shounka_a3_spr_civ {};		
	class shounka_porsche911: shounka_a3_spr_civ {};		
	class Mrshounka_Bowler_c: shounka_a3_spr_civ {};		
	class Mrshounka_golfvi_civ: shounka_a3_spr_civ {};		
	class Mrshounka_Volkswagen_Touareg_civ: shounka_a3_spr_civ {};		
	class Mrshounka_yamaha_p: shounka_a3_spr_civ {};		
	class shounka_a3_rs5_civ: shounka_a3_spr_civ {};		
	class Mrshounka_agera_p: shounka_a3_spr_civ {};		
	class shounka_h2: shounka_a3_spr_civ {};		
	class Mrshounka_lincoln_civ: shounka_a3_spr_civ {};		
	class Mrshounka_lykan_c: shounka_a3_spr_civ {};		
	
	class ext_Jonzie_Mini_Cooper: shounka_a3_spr_civ {};		
	class ext_Jonzie_Mini_Cooper_R_spec: shounka_a3_spr_civ {};		
	class ext_Jonzie_STI: shounka_a3_spr_civ {};		
	class ext_Jonzie_30CSL: shounka_a3_spr_civ {};		
	class ext_Jonzie_Datsun_Z432: shounka_a3_spr_civ {};		
	class ext_Jonzie_XB: shounka_a3_spr_civ {};		
	class ext_ivory_rs4: shounka_a3_spr_civ {};		
	class ext_ivory_c: shounka_a3_spr_civ {};		
	class ext_ivory_veyron: shounka_a3_spr_civ {};		
	class ext_ivory_e36: shounka_a3_spr_civ {};		
	class ext_ivory_m3: shounka_a3_spr_civ {};		
	class ext_ivory_isf: shounka_a3_spr_civ {};		
	class ext_ivory_lfa: shounka_a3_spr_civ {};		
	class ext_ivory_elise: shounka_a3_spr_civ {};		
	class ext_ivory_f1: shounka_a3_spr_civ {};		
	class ext_ivory_mp4: shounka_a3_spr_civ {};		
	class ext_ivory_190e: shounka_a3_spr_civ {};		
	class ext_ivory_evox: shounka_a3_spr_civ {};		
	class ext_ivory_r34: shounka_a3_spr_civ {};		
	class ext_ivory_gt500: shounka_a3_spr_civ {};		
	class ext_ivory_wrx: shounka_a3_spr_civ {};		
	class ext_ivory_supra: shounka_a3_spr_civ {};		

	class SIG_SuperBee {
		boxes = 0;
		nitro = true;
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

	class C_Offroad_02_unarmed_F {
		boxes = 1;
		nitro = true;
		textures[] = {
			{"codu_w", "" },
			{"codu_r", "" },
			{"codu_o", "" },
			{"codu_bl", "" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
};