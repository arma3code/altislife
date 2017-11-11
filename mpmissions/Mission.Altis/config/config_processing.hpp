#define true 1
#define false 0

/*
	class НАЗВАНИЕ
		displayName = отображаемое имя (localize)
		finalItem = что получаем на выходе (класс в LifeCfgVirtualItems)
		virtualMats = массив необходмых предметов
		license = необходимая для производства лицензя (класс в LifeCfgLicenses)
		side = фракция (на карте можно убрать проверку)
		conditions = условия, необходмые для переработки ресурса
		conditionsMessage = сообщение, выдаваемое при несоблюдении условий выше
*/

class LifeCfgProcessing {
	class heroin {
		displayName = "STR_Process_Heroin";
		finalItem = "heroinp";
		virtualMats[] = {
			{ "heroinu", 1 }
		};
		license = "heroin";
		side = "reb";
		conditions = "";
		conditionsMessage = "";
	};	
};