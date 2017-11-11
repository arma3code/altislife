#define true 1
#define false 0

/*
	TODO

	НУЖНО ВЫБРАТЬ КРАСИВЫЕ МЕСТА ГДЕ БУДУТ ЭТИ САМЫЕ КРУГИ
*/

class LifeCfgArcheology {

	conditions = ""; //условия необходимые для БОНУСА при добыче ресурсов (подумать что)
	zonesCount = 5; //сколько зон спаунится за раз при нажатии на initItem
	initItem = "extItem_metalDetector"; //предмет, который запускает всю херню
	workItem = "Extremo_Tool_Shovel"; //предмет, которым надо ДОБЫВАТЬ (лопата в нашем случае)
	spawnItem[] = {"plp_cts_WeathCrateBigBrown"}; //предмет, который появляется на месте раскопки "EXT_ArcObject_Vase"

	class ArcheologyItems {
		class plp_cts_WeathCrateBigBrown {
			items[] = {
				{ {"FRITH_ruin_vestia_lite_tar","FRITH_ruin_vestia_tar"}, 3 },
				{ {"FRITH_ruin_modhat_ltrpntred","FRITH_ruin_modhat_fabdes"}, 4 },
				{ {"U_FRITH_RUIN_TSH_cry","U_FRITH_RUIN_TSH_blk_drj","U_FRITH_RUIN_TSH_wht_zap"}, 5 }
			};
			virtualItems[] = {
				{ { {"uraniumc",1} }, 2 },
				{ { {"cocainep",3}, {"methp",3}, {"heroinp",3} }, 20 },
				{ { {"bottledwhiskey",4}, {"jewelry",4}, {"bottledbeer",4}, {"bottledshine",4} }, 30 },
				{ { {"copper_tape",5}, {"iron_r",5}, {"copper_r",5}, {"bottles",5}, {"oilp",5}, {"gasp",5}, {"cement",5}, {"diamondc",5}, {"petrol",5}, {"salt_r",5}, {"cigar",5}, {"marijuana",5} }, 40 },
				{ { {"money",10000} }, 50 },
				{ { {"money",7000} }, 60 },
				{ { {"money",3000} }, 70 },
				{ { {"money",2000} }, 80 },
				{ { {"money",1000} }, 90 },
				{ { {"money",500} }, 100 }
			};
			recipes[] = {
				{ {"ItemJuiceMultifruit"}, 2 }
			};
		};
	};

	class ArcheologyZones {
		class Altis {
			class arch_z1 {
				position[] = {6161.44,13633.7,0}; //центр окружности
				radius = 100; //радиус окружности
				count = 3; //кол-во раскопок в одном маркере
			};
			class arch_z_2: arch_z1 {
				position[] = {4324.44,18971.8,0};
			};
			class arch_z_3: arch_z1 {
				position[] = {7690.3,20293,0};
			};
			class arch_z_4: arch_z1 {
				position[] = {11869.4,17704.9,0};
			};
			class arch_z_5: arch_z1 {
				position[] = {11089.4,21483.2,0};
			};
			class arch_z_6: arch_z1 {
				position[] = {10126.1,8651.04,0};
			};
			class arch_z_7: arch_z1 {
				position[] = {18660.6,8984,0};
			};
			class arch_z_8: arch_z1 {
				position[] = {18335.3,11798,0};
			};
			class arch_z_9: arch_z1 {
				position[] = {6510,21518,0};
			};
			class arch_z_10: arch_z1 {
				position[] = {6490,17400,0};
			};
			class arch_z_11: arch_z1 {
				position[] = {8037,15178,0};
			};
			class arch_z_12: arch_z1 {
				position[] = {11097,15329,0};
			};
			class arch_z_13: arch_z1 {
				position[] = {13220.9,21529,0};
			};
			class arch_z_14: arch_z1 {
				position[] = {6386,20331,0};
			};
			class arch_z_15: arch_z1 {
				position[] = {6262,11164.5,0};
			};
			class arch_z_16: arch_z1 {
				position[] = {4196,10633,0};
			};
			class arch_z_17: arch_z1 {
				position[] = {8687,10757,0};
			};
			class arch_z_18: arch_z1 {
				position[] = {10418.1,7863.78,0};
			};
			class arch_z_19: arch_z1 {
				position[] = {12400,8177,0};
			};
			class arch_z_20: arch_z1 {
				position[] = {11174,9727.1,0};
			};
			class arch_z_21: arch_z1 {
				position[] = {13560,15579,0};
			};
			class arch_z_22: arch_z1 {
				position[] = {13885,20386,0};
			};
			class arch_z_23: arch_z1 {
				position[] = {15518.8,19974,0};
			};
			class arch_z_24: arch_z1 {
				position[] = {16641.6,18550.9,0};
			};
			class arch_z_25: arch_z1 {
				position[] = {19759.3,16128,0};
			};
			class arch_z_26: arch_z1 {
				position[] = {17288,17634,0};
			};
			class arch_z_27: arch_z1 {
				position[] = {18631.5,17647.5,0};
			};
			class arch_z_28: arch_z1 {
				position[] = {20049.4,14398.9,0};
			};
			class arch_z_29: arch_z1 {
				position[] = {21066,13820,0};
			};
			class arch_z_30: arch_z1 {
				position[] = {20554.2,13125.1,0};
			};
			class arch_z_31: arch_z1 {
				position[] = {16562,10804,0};
			};
			class arch_z_32: arch_z1 {
				position[] = {17267.6,9652.25,0};
			};
			class arch_z_33: arch_z1 {
				position[] = {20881,8323,0};
			};
			class arch_z_34: arch_z1 {
				position[] = {19678.4,9829.61,0};
			};
			class arch_z_35: arch_z1 {
				position[] = {20800.4,10976.6,0};
			};
			class arch_z_36: arch_z1 {
				position[] = {18068,13931,0};
			};
			class arch_z_37: arch_z1 {
				position[] = {23485.8,16604.7,0};
			};
			class arch_z_38: arch_z1 {
				position[] = {22808.4,17603.1,0};
			};
			class arch_z_39: arch_z1 {
				position[] = {22886.3,21984.9,0};
			};
			class arch_z_40: arch_z1 {
				position[] = {23842.4,22758.8,0};
			};
			class arch_z_41: arch_z1 {
				position[] = {25135,23061,0};
			};
			class arch_z_42: arch_z1 {
				position[] = {26240,22508,0};
			};
			class arch_z_43: arch_z1 {
				position[] = {24611,19689,0};
			};
			class arch_z_44: arch_z1 {
				position[] = {27765,21918,0};
			};
			class arch_z_45: arch_z1 {
				position[] = {26576,24165,0};
			};
		};

		class kerama {};
	};
};