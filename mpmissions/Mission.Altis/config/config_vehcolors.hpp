class LifeCfgVehMaterials {
	class glossy {
		material = "\ivory_data\data\glossy";
		displayName = "Глянцевый";
		conditions = "";
	};
	class metallic {
		material = "\ivory_data\data\metallic";
		displayName = "Металлик";
		conditions = "";
	};
	class matte {
		material = "\ivory_data\data\matte";
		displayName = "Матовый";
		conditions = "(call life_donator) > 0";
	};
	class chrome {
		material = "\ivory_data\data\chrome";
		displayName = "Хром";
		conditions = "(call life_donator) > 0";
	};
};

class LifeCfgVehTextures {
	//C_Offroad_01_F
	class ffrd_r {
		displayName = "Красный";
		texture[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"};
	};
	class ffrd_y {
		displayName = "Желтый";
		texture[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"};
	};
	class ffrd_w {
		displayName = "Белый";
		texture[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"};
	};
	class ffrd_b {
		displayName = "Синий";
		texture[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"};
	};
	class ffrd_br {
		displayName = "Темно-красный";
		texture[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"};
	};
	class ffrd_bw {
		displayName = "Сине-белый";
		texture[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"};
	};
	class ffrd_sb {
		displayName = "VIP Стикеры";
		texture[] = {"\union_textures\vip1\offroad_blau_sickerbomb.paa"};
	};
	class ffrd_cop {
		displayName = "Полиция";
		texture[] = {"\union_textures\police_offroad.paa"};
	};
	class rgb_cy {
		displayName = "Кислотно-желтый";
		texture[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
	};
	class ffrd_med {
		displayName = "Скорая";
		texture[] = {"\union_textures\medic\notarzt_offroad.paa"};
	};
	class ffrd_v1 {
		displayName = "VIP 1";
		texture[] = {"\union_textures\vip\TRG_AMC_offroad1_ex.paa"};
	};
	class ffrd_7n {
		displayName = "7новостей";
		texture[] = {"\union_textures\7news\offroad_01_ext_base02_co.paa"};
	};
	class ffrd_ro {
		displayName = "Ржавчина";
		texture[] = {"\union_textures\vip1\civ_offroad_rost.paa"};
	};
	class ffrd_bear {
		displayName = "Медведь";
		texture[] = {"\union_textures\vip1\bear_offroad.paa"};
	};
	class ffrd_2l {
		displayName = "Две полоски";
		texture[] = {"\union_textures\vip1\CIV_OFF1.paa"};
	};
	class ffrd_gv {
		displayName = "GTA V";
		texture[] = {"\union_textures\vip2\offroad_gta5.paa"};
	};

	//C_Offroad_01_repair_F
	class ffrd_r_m1 {
		displayName = "МЧС - Механик";
		texture[] = {"\a3\soft_f_bootcamp\offroad_01\Data\offroad_01_ext_repair_civ_co.paa"};
	};
	class ffrd_r_m2 {
		displayName = "МЧС - Медик";
		texture[] = {"\union_textures\medic\notarzt_offroad.paa"};
	};

	//B_G_Offroad_01_F
	class ffrd_bg_r {
		displayName = "Повстанческий";
		texture[] = {"\A3\soft_F_gamma\Offroad_01\Data\offroad_01_ext_ig01_co.paa"};
	};
	class ffrd_bg_rv {
		displayName = "VIP Повстанческий";
		texture[] = {"\union_textures\vip1\offroad_reb.paa"};
	};

	//B_Quadbike_01_F
	class qdbk_cop {
		displayName = "Полиция";
		texture[] = {"\union_textures\quad_police_co2.paa"};
	};
	class qdbk_reb {
		displayName = "Зеленый камуфляж";
		texture[] = {"\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"};
	};
	class qdbk_b {
		displayName = "Черный";
		texture[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"};
	};
	class qdbk_bl {
		displayName = "Синий";
		texture[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"};
	};
	class qdbk_r {
		displayName = "Красный";
		texture[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"};
	};
	class qdbk_w {
		displayName = "Белый";
		texture[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"};
	};
	class qdbk_g {
		displayName = "Зеленый";
		texture[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"};
	};
	class qdbk_cm {
		displayName = "Камуфляж";
		texture[] = {"\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"};
	};

	//C_Hatchback_01_F
	class htchb_bs {
		displayName = "Бежевый";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"};
	};
	class htchb_g {
		displayName = "Зеленый";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"};
	};
	class htchb_bl {
		displayName = "Синий";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"};
	};
	class htchb_bbl {
		displayName = "Темно-синий";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"};
	};
	class htchb_y {
		displayName = "Желтый";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"};
	};
	class htchb_w {
		displayName = "Белый";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"};
	};
	class htchb_gr {
		displayName = "Серый";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"};
	};
	class htchb_b {
		displayName = "Черный";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"};
	};

	//C_Hatchback_01_sport_F
	class htchbs_r {
		displayName = "Красный";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"};
	};
	class htchbs_br {
		displayName = "Темно-красный";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"};
	};
	class htchbs_o {
		displayName = "Оранжевый";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"};
	};
	class htchbs_bw {
		displayName = "Черно-белый";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"};
	};
	class htchbs_t {
		displayName = "Tan";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"};
	};
	class htchbs_g {
		displayName = "Зеленый";
		texture[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"};
	};
	class htchbs_cop {
		displayName = "Полиция";
		texture[] = {"\union_textures\police_hatchback.paa"};
	};
	class htchbs_va {
		displayName = "Vip Art";
		texture[] = {"\union_textures\vip\asiimov_hatchback_textures.paa"};
	};
	class htchbs_vme {
		displayName = "Vip Monster Energy";
		texture[] = {"\union_textures\vip\limousine_sport_monster.paa"};
	};
	class htchbs_h {
		displayName = "Халк";
		texture[] = {"\union_textures\vip2\hatchback_hulk.paa"};
	};
	class htchbs_s {
		displayName = "Симпсоны";
		texture[] = {"\union_textures\vip2\hatchback_simpsons.paa"};
	};

	//C_SUV_01_F
	class suv_br {
		displayName = "Темно-красный";
		texture[] = {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"};
	};
	class suv_b {
		displayName = "Черный";
		texture[] = {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"};
	};
	class suv_s {
		displayName = "Серебряный";
		texture[] = {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"};
	};
	class suv_o {
		displayName = "Оранжевый";
		texture[] = {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"};
	};
	class suv_cop {
		displayName = "Полиция";
		texture[] = {"\union_textures\police_suv.paa"};
	};
	class suv_vx6 {
		displayName = "VIP BMW X6";
		texture[] = {"\union_textures\vip\X6_suv.paa"};
	};
	class suv_vd {
		displayName = "VIP пончики";
		texture[] = {"\union_textures\vip\donut_suv_textures.paa"};
	};
	class suv_vnc {
		displayName = "VIP NyanCat";
		texture[] = {"\union_textures\vip\nyan_suv.paa"};
	};
	class suv_vo {
		displayName = "VIP океан";
		texture[] = {"\union_textures\vip1\suv_1.paa"};
	};
	class suv_vs {
		displayName = "VIP космос";
		texture[] = {"\union_textures\vip1\suv_universe.paa"};
	};
	class suv_vpm {
		displayName = "VIP PacMan";
		texture[] = {"\union_textures\vip1\suvPacMan.paa"};
	};
	class suv_vme {
		displayName = "VIP Monster Energy";
		texture[] = {"\union_textures\vip1\suv_Monster_energy_block.paa"};
	};
	class suv_vgr {
		displayName = "VIP Ghostrider";
		texture[] = {"\union_textures\vip1\suv_Ghostrider.paa"};
	};
	class suv_vsw {
		displayName = "VIP Star Wars";
		texture[] = {"\union_textures\vip1\suv_starwarscar.paa"};
	};
	class suv_vcx {
		displayName = "VIP Comix";
		texture[] = {"\union_textures\vip2\suv_comix.paa"};
	};
	class suv_vfs {
		displayName = "VIP Fire Skull";
		texture[] = {"\union_textures\vip2\suv_fireskull.paa"};
	};
	class suv_vme2 {
		displayName = "VIP Monster Energy 2";
		texture[] = {"\union_textures\vip2\suv_monsterenergy.paa"};
	};

	//C_Van_01_transport_F
	//C_Van_01_box_F
	class vtt_w {
		displayName = "Белый";
		texture[] = {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"};
	};
	class vtt_r {
		displayName = "Красный";
		texture[] = {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"};
	};

	//O_MRAP_02_F
	//O_MRAP_02_hmg_F
	class mrp_g {
		displayName = "Зеленый";
		texture[] = {"a3\soft_f\MRAP_02\data\mrap_02_ext_01_co.paa","a3\soft_f\MRAP_02\data\mrap_02_ext_02_co.paa"};
	};
	class mrp_med {
		displayName = "Медик";
		texture[] = {"\union_textures\medic\ifrit_medic2_front.paa","\union_textures\medic\ifrit_medic2_hinten.paa"};
	};
	class mrp_cg {
		displayName = "Гражданские банды";
		texture[] = {"\union_textures\ifrit_civ_1.paa","\union_textures\ifrit_civ_2.paa","\union_textures\ifrit_civ_2.paa"};
	};
	class mrp_ur {
		displayName = "Urban";
		texture[] = {"\union_textures\vip1\ifrit_urban_1.paa","\union_textures\vip1\ifrit_urban_2.paa"};
	};
	class mrp_lz {
		displayName = "LosZetas";
		texture[] = {"\union_textures\ifrit_lzc_1.paa","\union_textures\ifrit_lzc_2.paa"};
	};
	class mrp_amc {
		displayName = "AMC";
		texture[] = {"\union_textures\amc\old_amc_ifrit_1.paa","\union_textures\amc\old_amc_ifrit_2.paa"};
	};
	class mrp_sdr {
		displayName = "SDR";
		texture[] = {"\sdr_pack\vehicleTextures\ifrit1.paa","\sdr_pack\vehicleTextures\ifrit2.paa"};
	};
	class mrp_aff {
		displayName = "AFF";
		texture[] = {"\union_textures\isf\ifrit_isf_1.paa","\union_textures\isf\ifrit_isf_2.paa"};
	};
	class mrp_dnd {
		displayName = "EC";
		texture[] = {"\ec_pack\vehicles\ifrit_1.paa","\ec_pack\vehicles\ifrit_2.paa"};
	};
	class mrp_arg {
		displayName = "ARG";
		texture[] = {"\arg_grk_pack\vehs\ifrit_1.paa","\arg_grk_pack\vehs\ifrit_2.paa"};
	};
	class mrp_fb {
		displayName = "FB";
		texture[] = {"\fb_pack\vehicles\ifrit\ifrit_1.paa","\fb_pack\vehicles\ifrit\ifrit_2.paa"};
	};
	class mrp_swat {
		displayName = "SWAT";
		texture[] = {"\union_textures\swat\swat_ifrit_0.paa","\union_textures\swat\swat_ifrit_1.paa"};
	};
	class mrp_dea {
		displayName = "DEA";
		texture[] = {"\union_veh_t\data\dea\dea_ifrit1.paa","\union_veh_t\data\dea\dea_ifrit2.paa"};
	};
	class mrp_7n {
		displayName = "7NEWS";
		texture[] = {"\union_textures\7news\mrap_02_ext_01_co.paa","\union_textures\7news\mrap_02_ext_02_co.paa"};
	};
	class mrp_vl {
		displayName = "VL";
		texture[] = {"\vl_pack\VehTextures\ifrit1.paa","\vl_pack\VehTextures\ifrit2.paa"};
	};
	class mrp_mc {
		displayName = "W";
		texture[] = {"\vet_mc_pack\O_MRAP_02_F\MRAP_02_ext_01_CO.paa","\vet_mc_pack\O_MRAP_02_F\MRAP_02_ext_02_CO.paa"};
	};
	class mrp_vrs {
		displayName = "VRS";
		texture[] = {"\extk_pack\vehicles\extk_ifrit1.paa","\extk_pack\vehicles\extk_ifrit2.paa"};
	};
	class mrp_rfa {
		displayName = "RFA";
		texture[] = {"\rfa_packJW\data\vehicl\RFA_ifrit_before.paa","\rfa_packJW\data\vehicl\RFA_ifrit_back.paa"};
	};
	class mrp_muj {
		displayName = "M";
		texture[] = {"\mujahedi_pack\ifrit\muj_ifrit_01.paa","\mujahedi_pack\ifrit\muj_ifrit_02.paa"};
	};
	class mrp_nsb {
		displayName = "NSB";
		texture[] = {"\nsb_pack\vech\IFRIT_1.paa","\nsb_pack\vech\IFRIT_2.paa"};
	};
	class mrp_7th {
		displayName = "7th";
		texture[] = {"\un_pack\Veh\ifrit_01.paa","\un_pack\Veh\ifrit_02.paa"};
	};
	class mrp_ira {
		displayName = "IRA";
		texture[] = {"\ira_pack\vehicles\ira_ifrit_1.paa","\ira_pack\vehicles\ira_ifrit_2.paa"};
	};
	class mrp_ccp {
		displayName = "FAJ";
		texture[] = {"\cccp_pack\vehicles\ifrit0.paa","\cccp_pack\vehicles\ifrit1.paa"};
	};
	class mrp_ics {
		displayName = "ICS";
		texture[] = {"\ics_pack\veh\ics_ifrit_1.paa","\ics_pack\veh\ics_ifrit_2.paa"};
	};
	class mrp_la {
		displayName = "CDS";
		texture[] = {"\la_pack\veh\la_ifrit_1.paa","\la_pack\veh\la_ifrit_2.paa"};
	};
	class mrp_bst {
		displayName = "BST";
		texture[] = {"\bastion_pack\ifrit\mrap_02_ext_01_co.paa","\bastion_pack\ifrit\mrap_02_ext_02_co.paa"};
	};
	class mrp_fsg {
		displayName = "FSG";
		texture[] = {"\fsg_pack\vehs\ifrit_1.paa","\fsg_pack\vehs\ifrit_2.paa"};
	};

	//B_mas_HMMWV_UNA
	class hmmv_reb {
		displayName = "Повстанческий";
		texture[] = {"\mas_cars\hmmwv\data\hmmwv_body_co.paa"};
	};
	class hmmv_fed {
		displayName = "SWAT/CIA";
		texture[] = {"\union_textures\swat\HMMWV\hmmwv_body_co.paa"};
	};
	class hmmv_sdr {
		displayName = "SDR";
		texture[] = {"\union_textures\sdr\hmmwv\hmmwv_body_co.paa.paa"};
	};
	class hmmv_fb {
		displayName = "FB";
		texture[] = {"\union_textures\amc\hmmwv_body_co.paa"};
	};
	class hmmv_ec {
		displayName = "EC";
		texture[] = {"\ec_pack\vehicles\hmmwv_body_co.paa"};
	};
	class hmmv_mc {
		displayName = "W";
		texture[] = {"\union_textures\mc\hmmwv_body_co.paa"};
	};
	class hmmv_nsb {
		displayName = "NSB";
		texture[] = {"\nsb_pack\vech\hmmwv_body_co.paa"};
	};

	//B_Heli_Light_01_F
	//C_Heli_Light_01_civil_F
	class humm_cop {
		displayName = "Полиция";
		texture[] = {"\union_textures\police_heli.paa"};
	};
	class humm_cia {
		displayName = "CIA";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"};
	};
	class humm_led {
		displayName = "LED";
		texture[] = {"\altmerion_prokuratura\veh\humm.paa"};
	};
	class humm_dea {
		displayName = "DEA";
		texture[] = {"\union_veh_t\data\dea\dea_humming.paa"};
	};
	class humm_bl {
		displayName = "Синий";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"};
	};
	class humm_r {
		displayName = "Красный";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"};
	};
	class humm_vme {
		displayName = "VIP Monster Energy";
		texture[] = {"\union_textures\vip\limousine_sport_monster.paa"};
	};
	class humm_bln {
		displayName = "Синяя линия";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"};
	};
	class humm_llp {
		displayName = "Эллиптический";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"};
	};
	class humm_fr {
		displayName = "Яростный";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"};
	};
	class humm_bj {
		displayName = "Голубые джинсы";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"};
	};
	class humm_rl {
		displayName = "Красная лента";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"};
	};
	class humm_sn {
		displayName = "Закат";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"};
	};
	class humm_vrn {
		displayName = "Ворон";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"};
	};
	class humm_wv {
		displayName = "Голубые волны";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"};
	};
	class humm_reb {
		displayName = "Повстанческий";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"};
	};
	class humm_med {
		displayName = "Скорая";
		texture[] = {"\union_textures\medic\notarzt_hummingbird.paa"};
	};
	class humm_rg {
		displayName = "Повстанческая группировка";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"};
	};
	class humm_sdr {
		displayName = "SDR";
		texture[] = {"\sdr_pack\vehicleTextures\Hemming.paa"};
	};
	class humm_swt {
		displayName = "SWAT";
		texture[] = {"\union_textures\swat\swat_hum.paa"};
	};
	class humm_rfa {
		displayName = "RFA";
		texture[] = {"\rfa_packJW\data\vehicl\RFA_hum.paa"};
	};
	class humm_nsb {
		displayName = "KSK";
		texture[] = {"\ksk\vh\mh-9_ksk.paa"};
	};
	class humm_ec {
		displayName = "EC";
		texture[] = {"\ec_pack\vehicles\mh_9.paa"};
	};
	class humm_ics {
		displayName = "ICS";
		texture[] = {"\ics_pack\veh\ics_humm.paa"};
	};
	class humm_gra {
		displayName = "Серый";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa"};
	};
	class humm_lg {
		displayName = "Светлый";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa"};
	};
	class humm_shd {
		displayName = "Тень";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa"};
	};
	class humm_shr {
		displayName = "Шериф";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"};
	};
	class humm_wsp {
		displayName = "Оса";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa"};
	};
	class humm_tx {
		displayName = "Такси";
		texture[] = {"\union_textures\taxi_heli.paa"};
	};
	class humm_fsg {
		displayName = "FSG";
		texture[] = {"\fsg_pack\vehs\hummingbird.paa"};
	};
	class humm_arg {
		displayName = "ARG";
		texture[] = {"\arg_grk_pack\vehs\hummingbird.paa"};
	};

	//B_mas_UH1Y_UNA_F
	class uh1y_fed {
		displayName = "Полиция";
		texture[] = {"#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)"};
	};
	class uh1y_reb {
		displayName = "Группировки";
		texture[] = {"mas_eli\UH1Y\data\uh1y_ext_co.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_aff {
		displayName = "AFF";
		texture[] = {"\isf_ita_pack\Vech\data\uh1y_ext_ita_cm.paa","\isf_ita_pack\Vech\data\uh1y_int_ita_co.paa"};
	};
	class uh1y_fb {
		displayName = "FB";
		texture[] = {"\fb_pack\vehicles\uh1y\uh1y_1.paa","\fb_pack\vehicles\uh1y\uh1y_2.paa"};
	};
	class uh1y_rfa {
		displayName = "RFA";
		texture[] = {"\rfa_packJW\data\vehicl\RFA_uh1_co.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_muj {
		displayName = "M";
		texture[] = {"\mujahedi_pack\uh1y\uh1ybody_co.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_nsb {
		displayName = "NSB";
		texture[] = {"\nsb_pack\vech\UH1Y_camo.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_ira {
		displayName = "IRA";
		texture[] = {"\ira_pack\vehicles\ira_uh1y.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_ec {
		displayName = "EC";
		texture[] = {"\ec_pack\vehicles\uh1y.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_ics {
		displayName = "ICS";
		texture[] = {"\ics_pack\veh\ics_uh1y.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_sdr {
		displayName = "SDR";
		texture[] = {"\sdr_pack\vehicleTextures\uh1y.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_mc {
		displayName = "W";
		texture[] = {"\vet_mc_pack\B_mas_UH1Y_UNA_F\uh1y_ext_co.paa","\vet_mc_pack\B_mas_UH1Y_UNA_F\uh1y_int_co.paa"};
	};
	class uh1y_dea {
		displayName = "DEA";
		texture[] = {"\union_veh_t\data\dea\dea_uh1y.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_la {
		displayName = "CDS";
		texture[] = {"\la_pack\veh\uh1y.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_arg {
		displayName = "ARG";
		texture[] = {"\arg_grk_pack\vehs\uh1y.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_7th {
		displayName = "7th";
		texture[] = {"\un_pack\Veh\uh1_UN.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_fsg {
		displayName = "FSH";
		texture[] = {"\fsg_pack\vehs\uh.paa","\fsg_pack\vehs\uh2.paa"};
	};

	//I_Heli_light_03_unarmed_F
	class hllc_cia {
		displayName = "CIA";
		texture[] = {"#(argb,8,8,3)color(0.5,0.5,0.5,0.085)"};
	};
	class hllc_med {
		displayName = "МЧС";
		texture[] = {"\union_textures\medic\notarzt_hellcat.paa"};
	};
	class hllc_g {
		displayName = "Зеленый";
		texture[] = {"\a3\air_f_epb\Heli_Light_03\Data\heli_light_03_base_co.paa"};
	};
	class hllc_7n {
		displayName = "7новостей";
		texture[] = {"\union_textures\press_hellcat.paa"};
	};
	class hllc_rg {
		displayName = "Повстанческая группировка";
		texture[] = {"\a3\air_f_epb\Heli_Light_03\Data\heli_light_03_base_indp_co.paa"};
	};
	class hllc_cop {
		displayName = "Полиция";
		texture[] = {"\union_textures\police_hellcat.paa"};
	};
	class hllc_sdr {
		displayName = "SDR";
		texture[] = {"\sdr_pack\vehicleTextures\Hellcat.paa"};
	};
	class hllc_gra {
		displayName = "W";
		texture[] = {"\union_textures\hellcat_grey.paa"};
	};
	class hllc_13 {
		displayName = "13";
		texture[] = {"\13_pack\data\XX_hellcat_13.paa"};
	};
	class hllc_arg {
		displayName = "ARG";
		texture[] = {"\arg_grk_pack\vehs\hellcat.paa"};
	};
	class hllc_swt {
		displayName = "SWAT";
		texture[] = {"\union_textures\swat\swat_hellcat.paa"};
	};
	class hllc_nsb {
		displayName = "NSB";
		texture[] = {"\nsb_pack\vech\nsb_hellcat.paa"};
	};
	class hllc_muj {
		displayName = "M";
		texture[] = {"\mujahedi_pack\hellcat\heli_light_03_base_co.paa"};
	};
	class hllc_ec {
		displayName = "EC";
		texture[] = {"\ec_pack\vehicles\hellcat.paa"};
	};
	class hllc_ics {
		displayName = "ICS";
		texture[] = {"\ics_pack\veh\ics_hellcat.paa"};
	};
	class hllc_ccp {
		displayName = "FAJ";
		texture[] = {"\cccp_pack\vehicles\hellcat.paa"};
	};
	class hllc_dea {
		displayName = "DEA";
		texture[] = {"\union_veh_t\data\dea\dea_hellcat.paa"};
	};

	//B_Heli_Transport_03_unarmed_F
	class hrn_fed {
		displayName = "Полиция/CIA";
		texture[] = {"\a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext01_black_co.paa","\a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext02_black_co.paa"};
	};
	class hrn_med {
		displayName = "МЧС";
		texture[] = {"\union_textures\medic\huron_ext01.paa","\union_textures\medic\huron_ext02.paa"};
	};

	//I_Heli_Transport_02_F
	class hltt_bw {
		displayName = "Черно-белый";
		texture[] = {"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"};
	};
	class hltt_gw {
		displayName = "Зелено-белый";
		texture[] = {"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"};
	};
	class hltt_cia {
		displayName = "CIA";
		texture[] = {"#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)"};
	};

	//ext_sab_boat
	class xsb_s {
		displayName = "Sailing";
		texture[] = {"\sab_boat\data\texture.paa"};
	};
	class xsb_f {
		displayName = "Fuel";
		texture[] = {"\sab_boat\data\texture2.paa"};
	};
	class xsb_v {
		displayName = "Vrana";
		texture[] = {"\sab_boat\data\texture3.paa"};
	};
	class xsb_r {
		displayName = "Redstone";
		texture[] = {"\sab_boat\data\texture4.paa"};
	};

	//dezkit_b206_ems
	class dems_med {
		displayName = "МЧС";
		texture[] = {"\dezkit_b206\skins\ems1_1.paa","\dezkit_b206\skins\ems1_2.paa"};
	};
	class dems_7n {
		displayName = "Пресса";
		texture[] = {"\dezkit_b206\skins\tv1_1.paa","\dezkit_b206\skins\tv1_2.paa"};
	};

	//B_APC_Wheeled_01_cannon_F
	class apcw_fed {
		displayName = "Полиция";
		texture[] = {"\union_textures\swat\Marshal\m_swat_base.paa","\union_textures\swat\Marshal\m_swat_ads.paa","\union_textures\swat\Marshal\m_swat_tows.paa"};
	};
	class apcw_civ {
		displayName = "Стандарт";
		texture[] = {"\a3\armor_f_beta\APC_Wheeled_01\Data\apc_wheeled_01_base_co.paa"};
	};

	//O_Heli_Light_02_unarmed_F
	class orc_cia {
		displayName = "CIA";
		texture[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"};
	};
	class orc_wb {
		displayName = "Бело-синий";
		texture[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"};
	};
	class orc_cm {
		displayName = "Камуфляж";
		texture[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"};
	};
	class orc_reb {
		displayName = "Повстанческий";
		texture[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"};
	};
	class orc_cop {
		displayName = "Полиция";
		texture[] = {"\union_textures\police_orca.paa"};
	};
	class orc_med {
		displayName = "МЧС";
		texture[] = {"\union_textures\medic\orca_notarzt.paa"};
	};

	//B_MRAP_01_F
	class bmrp_cia {
		displayName = "CIA";
		texture[] = {"\union_textures\cia_front.paa","\union_textures\cia_back.paa"};
	};
	class bmrp_ds {
		displayName = "Пустыный";
		texture[] = {"\a3\soft_f\MRAP_01\Data\mrap_01_base_co.paa"};
	};

	//I_MRAP_03_hmg_F
	class strdh_cop {
		displayName = "Полиция";
		texture[] = {"\union_textures\striders\strider_police.paa","\union_textures\striders\strider_police.paa"};
	};

	//I_MRAP_03_F
	class strd_cop {
		displayName = "Полиция";
		texture[] = {"\union_textures\striders\strider_police.paa"};
	};
	class strd_aff {
		displayName = "AFF";
		texture[] = {"\union_textures\striders\strider_aff.paa"};
	};
	class strd_reb {
		displayName = "Повстанческий";
		texture[] = {"\a3\soft_F_beta\MRAP_03\Data\mrap_03_ext_indp_co.paa"};
	};
	class strd_wd {
		displayName = "Лес";
		texture[] = {"\union_textures\striders\Wald\mrap_03_ext_wd1_co.paa"};
	};
	class strd_rst {
		displayName = "RST";
		texture[] = {"\union_textures\striders\strider_rst.paa"};
	};
	class strd_swt {
		displayName = "SWAT";
		texture[] = {"\union_textures\swat\swat_strider.paa"};
	};
	class strd_med {
		displayName = "МЧС";
		texture[] = {"\union_textures\striders\strider_medic.paa"};
	};
	class strd_dea {
		displayName = "DEA";
		texture[] = {"\union_veh_t\data\dea\dea_strider.paa"};
	};
	class strd_nsb {
		displayName = "KSK";
		texture[] = {"\ksk\vh\strider_ksk.paa"};
	};

	//B_Truck_01_fuel_CIV_F
	class tfc_def {
		displayName = "Стандарт";
		texture[] = {"\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa","\A3\Soft_F_Gamma\Truck_01\Data\truck_01_Fuel_CO.paa"};
	};
	class tfc_bl {
		displayName = "Синий";
		texture[] = {"\union_vehicles\data\hemtt\truck_01_ext_01_blue.paa","\union_vehicles\data\hemtt\truck_01_ext_02_blue.paa","\union_vehicles\data\hemtt\truck_01_ext_03_blue.paa"};
	};
	class tfc_gs {
		displayName = "Газон";
		texture[] = {"\union_vehicles\data\hemtt\truck_01_ext_01_grass.paa","\union_vehicles\data\hemtt\truck_01_ext_02_grass.paa","\union_vehicles\data\hemtt\truck_01_ext_03_grass.paa"};
	};
	class tfc_mh {
		displayName = "Болотный";
		texture[] = {"\union_vehicles\data\hemtt\truck_01_ext_01_marsh.paa","\union_vehicles\data\hemtt\truck_01_ext_02_marsh.paa","\union_vehicles\data\hemtt\truck_01_ext_03_marsh.paa"};
	};
	class tfc_or {
		displayName = "Оранжевый";
		texture[] = {"\union_vehicles\data\hemtt\truck_01_ext_01_orange.paa","\union_vehicles\data\hemtt\truck_01_ext_02_orange.paa","\union_vehicles\data\hemtt\truck_01_ext_03_orange.paa"};
	};
	class tfc_pr {
		displayName = "Фиолетовый";
		texture[] = {"\union_vehicles\data\hemtt\truck_01_ext_01_purple.paa","\union_vehicles\data\hemtt\truck_01_ext_02_purple.paa","\union_vehicles\data\hemtt\truck_01_ext_03_purple.paa"};
	};
	class tfc_r {
		displayName = "Красный";
		texture[] = {"\union_vehicles\data\hemtt\truck_01_ext_01_red.paa","\union_vehicles\data\hemtt\truck_01_ext_02_red.paa","\union_vehicles\data\hemtt\truck_01_ext_03_red.paa"};
	};
	class tfc_y {
		displayName = "Желтый";
		texture[] = {"\union_vehicles\data\hemtt\truck_01_ext_01_yellow.paa","\union_vehicles\data\hemtt\truck_01_ext_02_yellow.paa","\union_vehicles\data\hemtt\truck_01_ext_03_yellow.paa"};
	};

	//B_Truck_01_box_CIV_F
	//B_Truck_01_mover_F
	class hmt_def {
		displayName = "Стандарт";
		texture[] = {"\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa"};
	};
	class hmt_bl {
		displayName = "Синий";
		texture[] = {"\union_vehicles\data\hemtt\truck_01_ext_01_blue.paa","\union_vehicles\data\hemtt\truck_01_ext_02_blue.paa"};
	};
	class hmt_gs {
		displayName = "Газон";
		texture[] = {"\union_vehicles\data\hemtt\truck_01_ext_01_grass.paa","\union_vehicles\data\hemtt\truck_01_ext_02_grass.paa"};
	};
	class hmt_mh {
		displayName = "Болотный";
		texture[] = {"\union_vehicles\data\hemtt\truck_01_ext_01_marsh.paa","\union_vehicles\data\hemtt\truck_01_ext_02_marsh.paa"};
	};
	class hmt_or {
		displayName = "Оранжевый";
		texture[] = {"\union_vehicles\data\hemtt\truck_01_ext_01_orange.paa","\union_vehicles\data\hemtt\truck_01_ext_02_orange.paa"};
	};
	class hmt_pr {
		displayName = "Фиолетовый";
		texture[] = {"\union_vehicles\data\hemtt\truck_01_ext_01_purple.paa","\union_vehicles\data\hemtt\truck_01_ext_02_purple.paa"};
	};
	class hmt_r {
		displayName = "Красный";
		texture[] = {"\union_vehicles\data\hemtt\truck_01_ext_01_red.paa","\union_vehicles\data\hemtt\truck_01_ext_02_red.paa"};
	};
	class hmt_y {
		displayName = "Желтый";
		texture[] = {"\union_vehicles\data\hemtt\truck_01_ext_01_yellow.paa","\union_vehicles\data\hemtt\truck_01_ext_02_yellow.paa"};
	};

	//I_Truck_02_covered_F
	class itc_cm {
		displayName = "Камо";
		texture[] = {"\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_INDP_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_kuz_INDP_co.paa"};
	};
	class itc_cia {
		displayName = "CIA";
		texture[] = {"#(argb,8,8,3)color(0.5,0.5,0.5,0.085)","#(argb,8,8,3)color(0.5,0.5,0.5,0.085)"};
	};

	//I_Truck_02_covered_CIV_F
	class itcc_or {
		displayName = "Оранжевый";
		texture[] = {"\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"};
	};
	class itcc_r {
		displayName = "Красный";
		texture[] = {"\union_vehicles\data\zamak\zk_red_f.paa","\union_vehicles\data\zamak\zk_red_t.paa"};
	};
	class itcc_s {
		displayName = "Небесный";
		texture[] = {"\union_vehicles\data\zamak\zk_sky_f.paa","\union_vehicles\data\zamak\zk_sky_t.paa"};
	};
	class itcc_w {
		displayName = "Белый";
		texture[] = {"\union_vehicles\data\zamak\zk_white_f.paa","\union_vehicles\data\zamak\zk_white_t.paa"};
	};
	class itcc_y {
		displayName = "Желтый";
		texture[] = {"\union_vehicles\data\zamak\zk_yellow_f.paa","\union_vehicles\data\zamak\zk_yellow_t.paa"};
	};

	//O_Heli_Transport_04_bench_F
	class htb_cia {
		displayName = "CIA";
		texture[] = {"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_black_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_black_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_bench_black_CO.paa"};
	};

	//shounka
	class shnk_w {
		displayName = "Белый";
		texture[] = {"shounka_a3_base\couleurs\blanc.paa"};
	};
	class shnk_r {
		displayName = "Красный";
		texture[] = {"shounka_a3_base\couleurs\rouge.paa"};
	};
	class shnk_bbl {
		displayName = "Тёмно-синий";
		texture[] = {"shounka_a3_base\couleurs\bleufonce.paa"};
	};
	class shnk_gr {
		displayName = "Серый";
		texture[] = {"shounka_a3_base\couleurs\gris.paa"};
	};
	class shnk_y {
		displayName = "Желтый";
		texture[] = {"shounka_a3_base\couleurs\jaune.paa"};
	};
	class shnk_bbr {
		displayName = "Тёмно-коричневый";
		texture[] = {"shounka_a3_base\couleurs\noir.paa"};
	};
	class shnk_o {
		displayName = "Оранжевый";
		texture[] = {"shounka_a3_base\couleurs\orange.paa"};
	};
	class shnk_rs {
		displayName = "Розовый";
		texture[] = {"shounka_a3_base\couleurs\rose.paa"};
	};
	class shnk_vi {
		displayName = "Фиолетовый";
		texture[] = {"shounka_a3_base\couleurs\violet.paa"};
	};
	class shnk_bl {
		displayName = "Синий";
		texture[] = {"shounka_a3_base\couleurs\bleu.paa"};
	};
	class shnk_blr {
		displayName = "Тёмно-красный";
		texture[] = {"shounka_a3_base\couleurs\rougefonce.paa"};
	};
	class shnk_g {
		displayName = "Зеленый";
		texture[] = {"shounka_a3_base\couleurs\vert.paa"};
	};
	class shnk_blg {
		displayName = "Тёмно-зеленый";
		texture[] = {"shounka_a3_base\couleurs\vertfonce.paa"};
	};
	class shnk_b {
		displayName = "Чёрный";
		texture[] = {"#(argb,8,8,3)color(0.02,0.02,0.02,1.0,co)"};
	};
	class shnk_bT {
		displayName = "Чёрный (Тонировка)";
		texture[] = {"#(argb,8,8,3)color(0.02,0.02,0.02,1.0,co)","","dkp_gelik_sa\mercedes_g65amg_hq\quiet_vitre_rv\quiet_vitre_toned_full.paa"};
	};
	class shnk_vr {
		displayName = "Красный Extremo rally";
		texture[] = {"shounka_a3_base\couleurs\sport_r.paa"};
	};
	class shnk_vg {
		displayName = "Зеленый Extremo rally";
		texture[] = {"shounka_a3_base\couleurs\sport_g.paa"};
	};
	class shnk_vbl {
		displayName = "Синий Extremo rally";
		texture[] = {"shounka_a3_base\couleurs\sport_b.paa"};
	};
	class shnk_vfc {
		displayName = "Extremo forest camo";
		texture[] = {"shounka_a3_base\couleurs\forest_camo.paa"};
	};
	class shnk_vuc {
		displayName = "Extremo urban camo";
		texture[] = {"shounka_a3_base\couleurs\urban_camo.paa"};
	};
	class shnk_vdc {
		displayName = "Extremo desert camo";
		texture[] = {"shounka_a3_base\couleurs\desert_camo.paa"};
	};
	class shnk_led {
		displayName = "LED";
		texture[] = {"\altmerion_prokuratura\veh\cherokee.paa"};
	};

	//C_Offroad_02_unarmed_F
	class codu_w {
		displayName = "Белый";
		texture[] = {"a3\soft_f_exp\offroad_02\data\offroad_02_ext_white_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_ext_white_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_white_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_white_co.paa"};
	};
	class codu_r {
		displayName = "Красный";
		texture[] = {"a3\soft_f_exp\offroad_02\data\offroad_02_ext_red_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_ext_red_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_red_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_red_co.paa"};
	};
	class codu_o {
		displayName = "Оранжевый";
		texture[] = {"a3\soft_f_exp\offroad_02\data\offroad_02_ext_orange_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_ext_orange_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_orange_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_orange_co.paa"};
	};
	class codu_bl {
		displayName = "Синий";
		texture[] = {"a3\soft_f_exp\offroad_02\data\offroad_02_ext_blue_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_ext_blue_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_blue_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_blue_co.paa"};
	};

	//C_Plane_Civil_01_F
	class cpc_wbl {
		displayName = "Бело-синий";
		texture[] = {"a3\air_f_exp\plane_civil_01\data\btt_ext_01_wave_co.paa","a3\air_f_exp\plane_civil_01\data\btt_ext_02_wave_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_co.paa"};
	};
	class cpc_bly {
		displayName = "Сине-желтый";
		texture[] = {"a3\air_f_exp\plane_civil_01\data\btt_ext_01_racer_co.paa","a3\air_f_exp\plane_civil_01\data\btt_ext_02_racer_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_co.paa"};
	};
	class cpc_gw {
		displayName = "Зелено-белый";
		texture[] = {"a3\air_f_exp\plane_civil_01\data\btt_ext_01_tribal_co.paa","a3\air_f_exp\plane_civil_01\data\btt_ext_02_tribal_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_co.paa"};
	};
	class cpc_r {
		displayName = "Красный";
		texture[] = {"a3\air_f_exp\plane_civil_01\data\btt_ext_01_redline_co.paa","a3\air_f_exp\plane_civil_01\data\btt_ext_02_redline_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_co.paa"};
	};

	//custom
	class cxc_1 {
		displayName = "2017 Aliceblue";
		texture[] = {"\union_veh_t\data\colors\aliceblue.paa"};
	};
	class cxc_2 {
		displayName = "2017 Banana";
		texture[] = {"\union_veh_t\data\colors\banana.paa"};
	};
	class cxc_3 {
		displayName = "2017 Blueviolet";
		texture[] = {"\union_veh_t\data\colors\blueviolet.paa"};
	};
	class cxc_4 {
		displayName = "2017 Brick";
		texture[] = {"\union_veh_t\data\colors\brick.paa"};
	};
	class cxc_5 {
		displayName = "2017 Brown";
		texture[] = {"\union_veh_t\data\colors\brown.paa"};
	};
	class cxc_6 {
		displayName = "2017 Burlywood";
		texture[] = {"\union_veh_t\data\colors\burlywood.paa"};
	};
	class cxc_7 {
		displayName = "2017 Cadmiumorange";
		texture[] = {"\union_veh_t\data\colors\cadmiumorange.paa"};
	};
	class cxc_8 {
		displayName = "2017 Cadmiumyellow";
		texture[] = {"\union_veh_t\data\colors\cadmiumyellow.paa"};
	};
	class cxc_9 {
		displayName = "2017 Carrot";
		texture[] = {"\union_veh_t\data\colors\carrot.paa"};
	};
	class cxc_10 {
		displayName = "2017 Chocolate";
		texture[] = {"\union_veh_t\data\colors\chocolate.paa"};
	};
	class cxc_11 {
		displayName = "2017 Cobalt";
		texture[] = {"\union_veh_t\data\colors\cobalt.paa"};
	};
	class cxc_12 {
		displayName = "2017 Coldgrey";
		texture[] = {"\union_veh_t\data\colors\coldgrey.paa"};
	};
	class cxc_13 {
		displayName = "2017 Coral";
		texture[] = {"\union_veh_t\data\colors\coral.paa"};
	};
	class cxc_14 {
		displayName = "2017 Cyan";
		texture[] = {"\union_veh_t\data\colors\cyan.paa"};
	};
	class cxc_15 {
		displayName = "2017 Darkseagreen";
		texture[] = {"\union_veh_t\data\colors\darkseagreen.paa"};
	};
	class cxc_16 {
		displayName = "2017 Darkslateblue";
		texture[] = {"\union_veh_t\data\colors\darkslateblue.paa"};
	};
	class cxc_17 {
		displayName = "2017 Darkturquoise";
		texture[] = {"\union_veh_t\data\colors\darkturquoise.paa"};
	};
	class cxc_18 {
		displayName = "2017 Darkviolet";
		texture[] = {"\union_veh_t\data\colors\darkviolet.paa"};
	};
	class cxc_19 {
		displayName = "2017 Dodgerblue";
		texture[] = {"\union_veh_t\data\colors\dodgerblue.paa"};
	};
	class cxc_20 {
		displayName = "2017 Emeraldgreen";
		texture[] = {"\union_veh_t\data\colors\emeraldgreen.paa"};
	};
	class cxc_21 {
		displayName = "2017 Flesh";
		texture[] = {"\union_veh_t\data\colors\flesh.paa"};
	};
	class cxc_22 {
		displayName = "2017 Ghostwhite";
		texture[] = {"\union_veh_t\data\colors\ghostwhite.paa"};
	};
	class cxc_23 {
		displayName = "2017 Gold";
		texture[] = {"\union_veh_t\data\colors\gold.paa"};
	};
	class cxc_24 {
		displayName = "2017 Goldenrod";
		texture[] = {"\union_veh_t\data\colors\goldenrod.paa"};
	};
	class cxc_25 {
		displayName = "2017 Indigo";
		texture[] = {"\union_veh_t\data\colors\indigo.paa"};
	};
	class cxc_26 {
		displayName = "2017 Khaki";
		texture[] = {"\union_veh_t\data\colors\khaki.paa"};
	};
	class cxc_27 {
		displayName = "2017 Lightskyblue";
		texture[] = {"\union_veh_t\data\colors\lightskyblue.paa"};
	};
	class cxc_28 {
		displayName = "2017 Limegreen";
		texture[] = {"\union_veh_t\data\colors\limegreen.paa"};
	};
	class cxc_29 {
		displayName = "2017 Melon";
		texture[] = {"\union_veh_t\data\colors\melon.paa"};
	};
	class cxc_30 {
		displayName = "2017 Moccasin";
		texture[] = {"\union_veh_t\data\colors\moccasin.paa"};
	};
	class cxc_31 {
		displayName = "2017 Olive";
		texture[] = {"\union_veh_t\data\colors\olive.paa"};
	};
	class cxc_32 {
		displayName = "2017 Olivedrab";
		texture[] = {"\union_veh_t\data\colors\olivedrab.paa"};
	};
	class cxc_33 {
		displayName = "2017 Orange";
		texture[] = {"\union_veh_t\data\colors\orange.paa"};
	};
	class cxc_34 {
		displayName = "2017 Peacock";
		texture[] = {"\union_veh_t\data\colors\peacock.paa"};
	};
	class cxc_35 {
		displayName = "2017 Purple";
		texture[] = {"\union_veh_t\data\colors\purple.paa"};
	};
	class cxc_36 {
		displayName = "2017 Royalblue";
		texture[] = {"\union_veh_t\data\colors\royalblue.paa"};
	};
	class cxc_37 {
		displayName = "2017 Saddlebrown";
		texture[] = {"\union_veh_t\data\colors\saddlebrown.paa"};
	};
	class cxc_38 {
		displayName = "2017 Sepia";
		texture[] = {"\union_veh_t\data\colors\sepia.paa"};
	};
	class cxc_39 {
		displayName = "2017 Slateblue";
		texture[] = {"\union_veh_t\data\colors\slateblue.paa"};
	};
	class cxc_40 {
		displayName = "2017 Slategray";
		texture[] = {"\union_veh_t\data\colors\slategray.paa"};
	};
	class cxc_41 {
		displayName = "2017 Steelblue";
		texture[] = {"\union_veh_t\data\colors\steelblue.paa"};
	};
	class cxc_42 {
		displayName = "2017 Tan";
		texture[] = {"\union_veh_t\data\colors\tan.paa"};
	};
	class cxc_43 {
		displayName = "2017 Teal";
		texture[] = {"\union_veh_t\data\colors\teal.paa"};
	};
	class cxc_44 {
		displayName = "2017 Tomato";
		texture[] = {"\union_veh_t\data\colors\tomato.paa"};
	};
	class cxc_45 {
		displayName = "2017 Turquoiseblue";
		texture[] = {"\union_veh_t\data\colors\turquoiseblue.paa"};
	};

	//ivory gt500 skins
	class ivgt_rw {
		displayName = "White on red";
		texture[] = {"\ivory_textures\data\gt500\bodyRW.paa"};
	};
	class ivgt_bg {
		displayName = "Gray on black";
		texture[] = {"\ivory_textures\data\gt500\bodyBG.paa"};
	};
	class ivgt_gb {
		displayName = "Black on gray";
		texture[] = {"\ivory_textures\data\gt500\bodyGB.paa"};
	};
	class ivgt_wb {
		displayName = "Blue on white";
		texture[] = {"\ivory_textures\data\gt500\bodyWB.paa"};
	};

	class wrx_ira {
		displayName = "IRA";
		texture[] = {"\ira_pack\vehicles\subaru.paa","","#(argb,8,8,3)color(0,0,0,0.99,CA)","#(argb,8,8,3)color(0,0,0,0.01,CA)"};
	};
};