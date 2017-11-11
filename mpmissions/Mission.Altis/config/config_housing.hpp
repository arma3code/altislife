#define true 1
#define false 0

/*
	price - Стоимость дома
	numberCrates - Кол-во возможных слотов (0 - ГАРАЖ)
	restrictedPos[] - Черный список позиций в доме
	canGarage - Добавляем обычному дому с ящиками возможность гаража
	garageSpawnPos[] - worldToModel позиция спауна техники
	garageSpawnDir - насколько повернуть градусов относительно позиции дома
	garageBlacklists[] - дома, которым запрещено иметь гараж (координаты)
*/

class LifeCfgHousing {
	class Altis {
		class Land_i_House_Big_02_V1_F {
			price = 465000;
			numberCrates = 3;
			restrictedPos[] = {0,1,2,3,4};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {2,0,3.5};
			conditions = "";
		};

		class Land_i_House_Big_02_V2_F : Land_i_House_Big_02_V1_F{};
		class Land_i_House_Big_02_V3_F : Land_i_House_Big_02_V1_F{};

		class Land_i_House_Big_01_V1_F {
			price = 660000;
			numberCrates = 4;
			restrictedPos[] = {2,3};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {0,-2,3.8};
			conditions = "";
		};

		class Land_i_House_Big_01_V2_F : Land_i_House_Big_01_V1_F{};
		class Land_i_House_Big_01_V3_F : Land_i_House_Big_01_V1_F{};

		class Land_i_House_Small_01_V1_F {
			price = 315000;
			numberCrates = 2;
			restrictedPos[] = {};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {-1.5,0,2};
			conditions = "";
		};

		class Land_i_House_Small_01_V2_F : Land_i_House_Small_01_V1_F{};
		class Land_i_House_Small_01_V3_F : Land_i_House_Small_01_V1_F{};

		class Land_i_House_Small_02_V1_F {
			price = 300150;
			numberCrates = 2;
			restrictedPos[] = {};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {2,0,2.4};
			conditions = "";
		};

		class Land_i_House_Small_02_V2_F : Land_i_House_Small_02_V1_F{};
		class Land_i_House_Small_02_V3_F : Land_i_House_Small_02_V1_F{};

		class Land_i_House_Small_03_V1_F {
			price = 375000;
			numberCrates = 3;
			restrictedPos[] = {0,2,3,4};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {-3.3,1,2.5};
			conditions = "";
		};

		class Land_i_Stone_HouseSmall_V1_F {
			price = 225000;
			numberCrates = 1;
			restrictedPos[] = {0,1,3,4};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {0.90,2.3,4};
			conditions = "";
		};

		class Land_i_Stone_HouseSmall_V2_F : Land_i_Stone_HouseSmall_V1_F{};
		class Land_i_Stone_HouseSmall_V3_F : Land_i_Stone_HouseSmall_V1_F{};

		class EXT_Land_em_mansion_01_reversed {
			price = 2000000;
			numberCrates = 6;
			restrictedPos[] = {0,1,2,5,6,7,8,9,10};
			canGarage = true;
			garageSpawnPos[] = {-20,-2,-4};
			garageSpawnDir = 180;
			garageBlacklists[] = {};
			lightPos[] = {0,0,2};
			conditions = "";
		};

		//Garages
		class Land_i_Garage_V1_F {
			price = 150000;
			numberCrates = 0;
			restrictedPos[] = {};
			canGarage = true;
			garageSpawnPos[] = {-11.5,0,0};
			garageSpawnDir = 90;
			garageBlacklists[] = {};
			lightPos[] = {};
			conditions = "";
		};

		class Land_i_Garage_V2_F : Land_i_Garage_V1_F{};
	};

	/*class Tanoa {
		// Houses with Garages
		class Land_GarageShelter_01_F {
			price = 500000;
			numberCrates = 1;
			restrictedPos[] = {0,1,2,3,4,6};
			canGarage = true;
			garageSpawnPos[] = {0.241684,-5.72266,-1.46744};
			garageSpawnDir = 90;
			garageBlacklists[] = {{10998,9698.24,-0.219376}};
			lightPos[] = {0,0,2};
			conditions = "";
		};

		class Land_House_Big_02_F {
			price = 10000000;
			numberCrates = 4;
			restrictedPos[] = {0,1,2,3,4,6,7,9,10,11,12,13};
			canGarage = true;
			garageSpawnPos[] = {12.8365,0.414551,-1.81252};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {0,0,2};
			conditions = "";
		};

		// Houses without Garages
		class Land_House_Big_01_F {
			price = 600000;
			numberCrates = 3;
			restrictedPos[] = {0,2,3,4,5,6,7,9,10,11,12};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {-1,2,2};
			conditions = "";
		};

		class Land_House_Small_02_F {
			price = 450000;
			numberCrates = 2;
			restrictedPos[] = {0,1,2,3,6,7,8};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {-2,0,2.4};
			conditions = "";
		};

		class Land_House_Small_03_F: Land_House_Small_02_F {
			restrictedPos[] = {0,1,2,3,5,6,7,8,9};
		};

		class Land_House_Small_04_F: Land_House_Small_02_F {
			restrictedPos[] = {0,1,2,3,4,6};
		};

		class Land_House_Small_05_F: Land_House_Small_02_F {
			restrictedPos[] = {0,2,4,5};
		};

		class Land_House_Small_06_F: Land_House_Small_02_F {
			restrictedPos[] = {0,2,3,5,6,7,8};
		};

		class Land_Slum_01_F {
			price = 350000;
			numberCrates = 1;
			restrictedPos[] = {0,2,3,4,5,6,7};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {1.5,0,3.2};
			conditions = "";
		};

		class Land_Shed_05_F: Land_Slum_01_F {
			restrictedPos[] = {0,1,2,3,5};
		};

		class Land_Slum_03_F {
			price = 800000;
			numberCrates = 4;
			restrictedPos[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,15,16,17,18,19,20,21,22,23,24,25};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {1,2,3};
			conditions = "";
		};

		class EXT_Land_em_mansion_01_reversed {
			price = 100000;
			numberCrates = 6;
			restrictedPos[] = {0,1,2,5,6,7,8,9,10};
			canGarage = true;
			garageSpawnPos[] = {-20,-2,-4};
			garageSpawnDir = 180;
			garageBlacklists[] = {};
			lightPos[] = {0,0,2};
			conditions = "(call life_adminlevel) > 0";
		};
	};*/
	class kerama {};
};