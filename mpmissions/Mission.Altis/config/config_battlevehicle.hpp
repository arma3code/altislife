/*

	Выдача боевой техники (для копов или кого угодно на рестарт)

	class уникальная_переменная {
		vehicleClass = "B_Heli_Transport_01_F"; //класс техники
		color = ""; //цвет, если он есть (из LifeCfgVehTextures)
		side = "cop"; //фракция ("" если не нужно проверять)
		conditions = "life_coplevel > 10"; //условие
		conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 11+"; //сообщение, выдаваемое при несоблюдении
		maximum = 1; //сколько единиц техники можно достать за 1 рестарт
	}

*/

class LifeCfgBattleVehicles {
	class cop_gh {
		vehicleClass = "B_Heli_Transport_01_F";
		color = "";
		side = "cop";
		conditions = "life_coplevel > 22";
		conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 23+";
		maximum = 1;
	};
	class cop_hunter: cop_gh {
		vehicleClass = "BOPE_Hunter_NATO";
		conditions = "life_coplevel > 22";
		conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 23+";
		maximum = 5;
	};
	class cop_marsh: cop_gh {
		//vehicleClass = "B_APC_Wheeled_01_cannon_F";
		//color = "apcw_fed";
		vehicleClass = "I_MRAP_03_hmg_F";
		color = "strdh_cop";
	};
	/*class swat_tow {
		vehicleClass = "B_mas_HMMWV_SWAT_TOW";
		color = "";
		side = "cop";
		conditions = "life_coplevel == 23";
		conditionsMessage = "Только для сотрудников S.W.A.T";
		maximum = 3;
	};*/
	/*class interceptor {
		vehicleClass = "interceptor_1";
		color = "";
		side = "";
		conditions = "((group player) getVariable [""gang_license"",""-1""]) isEqualTo ""aff""";
		conditionsMessage = "Только чемпион BattleGround'ов может достать эту технику";
		maximum = 2;
	};*/
};