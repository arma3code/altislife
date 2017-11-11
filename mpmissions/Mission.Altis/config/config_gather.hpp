#define true 1
#define false 0

class LifeCfgGather {
	class apple {
		amount = 2;
		tool = "Extremo_Tool_Hoe";
		sides[] = {};
		zones[] = {"apple_1","apple_2","apple_3","apple_4","apple_5"};
		zoneSize = 35;
		model = "acd_C_Sacks_goods_F";
		device = true;
		conditions = "";
		conditionsMessage = "";
	};
	class peach: apple {
		zones[] = {"peaches_1","peaches_2","peaches_3","peaches_4"};
		model = "acd_C_Sacks_goods_F";
	};
	class anana: apple {
		zones[] = {"anana_1","anana_2","anana_3"};
		model = "acd_C_Sacks_goods_F";
	};
	class banana: apple {
		zones[] = {"banana_1","banana_2"};
		model = "acd_C_Sacks_goods_F";
	};
	class coco: apple {
		zones[] = {"coco_1","coco_2"};
		model = "acd_C_Sacks_goods_F";
	};

	class rye {
		amount = 1;
		tool = "Extremo_Tool_Hoe";
		sides[] = {"civ"};
		zones[] = {"rye_1"};
		zoneSize = 35;
		model = "plp_ctm_Sack";
		device = true;
		conditions = "";
		conditionsMessage = "";
	};
	class yeast: rye {
		zones[] = {"yeast_1"};
	};
	class cacao: rye {
		zones[] = {"cacao_1"};
	};
	class hops: rye {
		zones[] = {"hops_1"};
	};
	class cornmeal: rye {
		zones[] = {"corn_1"};
	};
	class tobacco: rye {
		zones[] = {"tobacco_1"};
	};
	class salt: rye {
		tool = "Extremo_Tool_Shovel";
		zones[] = {"salt_1"};
	};
	class sand: rye {
		tool = "Extremo_Tool_Shovel";
		zones[] = {"sand_1"};
	};
	class exhibit: rye {
		tool = "Extremo_Tool_Shovel";
		zones[] = {"exhibit_1"};
		model = "plp_cts_WeathCrateMediumWorn";
		device = false;
	};
	class cotton: rye {
		zones[] = {"cotton_1"};
		model = "A3L_Cotton";
		conditions = "life_slave";
		conditionsMessage = "Добывать хлопок могут только рабы. Продайте себя белому господину и возвращайтесь в кандалах";
		device = false;
	};
	class coffee: rye {
		amount = 2;
		zones[] = {"coffe_1"};
	};
	class woodb: rye {
		amount = 2;
		tool = "Extremo_Tool_Axe";
		zones[] = {"woodb_1"};
		zoneSize = 200;
		model = "Land_WoodPile_F";
		device = false;
	};
	class olive: rye {
		amount = 2;
		zones[] = {"olive_1"};
		model = "Land_WoodPile_F";
	};
	class sugar: rye {
		zones[] = {"sugar_1"};
	};
	class amber: rye {
		tool = "Extremo_Tool_Shovel";
		zones[] = {"amber_1"};
		model = "plp_cts_WeathCrateMediumWorn";
	};
	class pearl: rye {
		tool = "Extremo_Tool_Shovel";
		zones[] = {"pearl_1"};
	};
	class coquina: pearl {
		zones[] = {"coquina_1"};
	};
	class arwater: pearl {
		zones[] = {"arwater_1"};
		model = "Land_CanisterPlastic_F";
	};
	class weppart: pearl {
		zones[] = {"weppart_1"};
		model = "plp_cts_WeathCrateMediumWorn";
		device = false;
	};

	class copperore: rye {
		tool = "Extremo_Tool_PickAxe";
		zones[] = {"lead_1"};
		model = "A3L_Normal_Rock_L";
	};
	class ironore: copperore {
		zones[] = {"iron_1"};
		model = "A3L_Bits_Rock_L_Iron";
	};
	class diamond: copperore {
		zones[] = {"diamond_1"};
		model = "A3L_Bits_Rock_L_Diamond";
	};
	class oilu: copperore {
		zones[] = {"oil_1","oil_2"};
		model = "Land_MetalBarrel_F";
	};
	class gasu: copperore {
		zones[] = {"gas_1"};
		model = "Land_GasTank_01_khaki_F";
	};
	class rock: copperore {
		zones[] = {"rock_1","rock_prison"};
		model = "A3L_Normal_Rock_L";
		sides[] = {"reb","civ"};
	};
	class bauxites: copperore {
		zones[] = {"bauxites_1"};
		model = "A3L_Bits_Rock_L_Iron";
	};
	class bronze: copperore {
		zones[] = {"bronze_1"};
		model = "A3L_Normal_Rock_L";
	};
	class obsid: copperore {
		zones[] = {"obsid_1"};
		model = "A3L_Normal_Rock_L";
	};




	class heroinu {
		amount = 1;
		tool = "Extremo_Tool_Hoe";
		sides[] = {"reb"};
		zones[] = {"heroin_1"};
		zoneSize = 35;
		model = "plp_ctm_Sack";
		device = true;
		conditions = "";
		conditionsMessage = "";
	};
	class cocaine: heroinu {
		zones[] = {"cocaine_1"};
	};
	class methu: heroinu {
		zones[] = {"meth_1"};
		tool = "Extremo_Tool_Shovel";
	};
	class artpart: heroinu {
		zones[] = {"artpart_1"};
		tool = "Extremo_Tool_Shovel";
		model = "plp_cts_WeathCrateMediumWorn";
		device = false;
	};
	class uraniumu: heroinu {
		zones[] = {"uranium1_zone"};
		tool = "Extremo_Tool_PickAxe";
		model = "bv_barrel_bio";
	};
	class blackd: heroinu {
		zones[] = {"blackd_1"};
		tool = "Extremo_Tool_PickAxe";
		model = "A3L_Bits_Rock_L_Diamond";
	};
	class royalc: heroinu {
		zones[] = {"royalc_1"};
		tool = "Extremo_Tool_Shovel";
		model = "Land_FoodContainer_01_F";
		device = false;
	};
	class opium: heroinu {
		zones[] = {"opium_1"};
	};
	class woodr: heroinu {
		amount = 2;
		zones[] = {"woodr_1"};
		zoneSize = 200;
		tool = "Extremo_Tool_Axe";
		model = "Land_WoodPile_F";
		device = false;
	};

	class cannabis {
		amount = 1;
		tool = "Extremo_Tool_Hoe";
		sides[] = {"civ","reb"};
		zones[] = {"weed_1"};
		zoneSize = 35;
		model = "A3L_Cannabis";
		device = true;
		conditions = "playerSide == independent OR (playerSide == civilian && server_mar_legal)";
		conditionsMessage = "Правительство запретило медицинскую марихуану и перевело ее в статус нелегала";
	};
	class wood {
		amount = 2;
		tool = "Extremo_Tool_Axe";
		sides[] = {"civ","reb"};
		zones[] = {"tree_1"};
		zoneSize = 200;
		model = "Land_WoodPile_F";
		device = false;
		conditions = "";
		conditionsMessage = "";
	};
};