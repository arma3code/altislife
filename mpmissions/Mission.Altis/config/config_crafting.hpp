#define true 1
#define false 0
/*
	CLASS:
		variable = имя переменной (для сохранения в базе (recipe_%1) и проверки активна ли)
		displayName = название рецепта (LOCALIZED)
		finalItem = итоговый предмет (class из LifeCfgVirtualItems или игровой предмет)
		virtualMats = массив виртуальных предметов-материалов (class из LifeCfgVirtualItems)
		inventoryMats = массив игровых предметов-материалов
		sides = массив сторон, которым доступен рецепт
		category = категория (class из LifeCfgRecipesCategories)
		buyable = продается ли в магазине рецептов
		price = цена рецепта
		vip = уровень випки, необходимый для рецепта
		conditions = необходимые условия для крафта
		conditionsMessage = сообщение, выдаваемое при false у conditions
*/
class LifeCfgRecipes {
	//Ресурсы
	class lumber {
		variable = "lumber";
		displayName = "STR_Item_Lumber";
		finalItem = "lumber";
		virtualMats[] = {
			{ "wood", 10 }
		};
		inventoryMats[] = {};
		sides[] = {"civ"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "";
		conditionsMessage = "";
	};

	class plastic {
		variable = "plastic";
		displayName = "STR_Item_Plastic";
		finalItem = "plastic";
		virtualMats[] = {
			{ "bottles", 5 }
		};
		inventoryMats[] = {};
		sides[] = {"civ"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "";
		conditionsMessage = "";
	};

	class metal {
		variable = "metal";
		displayName = "STR_Item_Metal";
		finalItem = "metal";
		virtualMats[] = {
			{ "iron_r", 10 }
		};
		inventoryMats[] = {};
		sides[] = {"civ"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "";
		conditionsMessage = "";
	};

	class cloth {
		variable = "cloth";
		displayName = "STR_Item_Cloth";
		finalItem = "cloth";
		virtualMats[] = {
			{ "cotton", 10 }
		};
		inventoryMats[] = {};
		sides[] = {"civ"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "";
		conditionsMessage = "";
	};

	class lens {
		variable = "lens";
		displayName = "STR_Item_Lens";
		finalItem = "lens";
		virtualMats[] = {
			{ "glass", 10 }
		};
		inventoryMats[] = {};
		sides[] = {"civ"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "";
		conditionsMessage = "";
	};

	class nails {
		variable = "nails";
		displayName = "STR_Item_Nails";
		finalItem = "nails";
		virtualMats[] = {
			{ "allup", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "";
		conditionsMessage = "";
	};

	class artpartp {
		variable = "artpartp";
		displayName = "STR_Item_ArtifactP";
		finalItem = "artpartp";
		virtualMats[] = {
			{ "artpart", 20 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "";
		conditionsMessage = "";
	};

	class allucan {
		variable = "allucan";
		displayName = "STR_Item_AluminumCans";
		finalItem = "allucan";
		virtualMats[] = {
			{ "allup", 5 }
		};
		inventoryMats[] = {};
		sides[] = {"civ"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "";
		conditionsMessage = "";
	};

	class salema {
		variable = "salema";
		displayName = "STR_Item_SalemaMeat_Fried";
		finalItem = "salema_fried";
		virtualMats[] = {
			{ "salema", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class ornate {
		variable = "ornate";
		displayName = "STR_Item_OrnateMeat_Fried";
		finalItem = "ornate_fried";
		virtualMats[] = {
			{ "ornate", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class mackerel {
		variable = "mackerel";
		displayName = "STR_Item_MackerelMeat_Fried";
		finalItem = "mackerel_fried";
		virtualMats[] = {
			{ "mackerel", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class tuna {
		variable = "tuna";
		displayName = "STR_Item_TunaMeat_Fried";
		finalItem = "tuna_fried";
		virtualMats[] = {
			{ "tuna", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class mullet {
		variable = "mullet";
		displayName = "STR_Item_MulletMeat_Fried";
		finalItem = "mullet_fried";
		virtualMats[] = {
			{ "mullet", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class catshark {
		variable = "catshark";
		displayName = "STR_Item_CatSharkMeat_Fried";
		finalItem = "catshark_fried";
		virtualMats[] = {
			{ "catshark", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class hen {
		variable = "hen";
		displayName = "STR_Item_FriedChicken";
		finalItem = "hen_fried";
		virtualMats[] = {
			{ "hen_raw", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class rooster {
		variable = "rooster";
		displayName = "STR_Item_FriedRooster";
		finalItem = "rooster_fried";
		virtualMats[] = {
			{ "rooster_raw", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class goat {
		variable = "goat";
		displayName = "STR_Item_FriedGoat";
		finalItem = "goat_fried";
		virtualMats[] = {
			{ "goat_raw", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class sheep {
		variable = "sheep";
		displayName = "STR_Item_FriedSheep";
		finalItem = "sheep_fried";
		virtualMats[] = {
			{ "sheep_raw", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class olivec {
		variable = "olivec";
		displayName = "STR_Item_OliveC";
		finalItem = "olivec";
		virtualMats[] = {
			{ "olive", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "";
		conditionsMessage = "";
	};

	class cocomilk {
		variable = "cocomilk";
		displayName = "STR_Item_CoconutMilk";
		finalItem = "cocomilk";
		virtualMats[] = {
			{ "coco", 3 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "";
		conditionsMessage = "";
	};

	class royalcf {
		variable = "royalcf";
		displayName = "STR_Item_FrozenCrab";
		finalItem = "royalcf";
		virtualMats[] = {
			{ "royalcp", 3 },
			{ "allucan", 1 },
			{ "arwater", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "resources";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "";
		conditionsMessage = "";
	};

	//еда

	class ItemSalema {
		variable = "ItemSalema";
		displayName = "STR_Item_SalemaMeat_Fried";
		finalItem = "extItem_FishC";
		virtualMats[] = {
			{ "salema", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "food";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class ItemOrnate {
		variable = "ItemOrnate";
		displayName = "STR_Item_OrnateMeat_Fried";
		finalItem = "extItem_FishC";
		virtualMats[] = {
			{ "ornate", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "food";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class ItemMackerel {
		variable = "ItemMackerel";
		displayName = "STR_Item_MackerelMeat_Fried";
		finalItem = "extItem_FishC";
		virtualMats[] = {
			{ "mackerel", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "food";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class ItemTuna {
		variable = "ItemTuna";
		displayName = "STR_Item_TunaMeat_Fried";
		finalItem = "extItem_FishC";
		virtualMats[] = {
			{ "tuna", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "food";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class ItemMullet {
		variable = "ItemMullet";
		displayName = "STR_Item_MulletMeat_Fried";
		finalItem = "extItem_FishC";
		virtualMats[] = {
			{ "mullet", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "food";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class ItemCatshark {
		variable = "ItemCatshark";
		displayName = "STR_Item_CatSharkMeat_Fried";
		finalItem = "extItem_FishC";
		virtualMats[] = {
			{ "catshark", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "food";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class ItemHen {
		variable = "ItemHen";
		displayName = "STR_Item_FriedChicken";
		finalItem = "extItem_MeatC";
		virtualMats[] = {
			{ "hen_raw", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "food";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class ItemRooster {
		variable = "ItemRooster";
		displayName = "STR_Item_FriedRooster";
		finalItem = "extItem_MeatC";
		virtualMats[] = {
			{ "rooster_raw", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "food";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class ItemGoat {
		variable = "ItemGoat";
		displayName = "STR_Item_FriedGoat";
		finalItem = "extItem_MeatC";
		virtualMats[] = {
			{ "goat_raw", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "food";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class ItemSheep {
		variable = "ItemSheep";
		displayName = "STR_Item_FriedSheep";
		finalItem = "extItem_MeatC";
		virtualMats[] = {
			{ "sheep_raw", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb"};
		category = "food";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "[getPosATL player, 5] call UnionClient_system_isFireNear";
		conditionsMessage = "Нужен источник огня в радиусе 5м";
	};

	class ItemJuiceApple {
		variable = "ItemJuiceApple";
		displayName = "STR_Item_AppleJuice";
		finalItem = "extItem_Juice";
		virtualMats[] = {
			{ "apple", 3 }
		};
		inventoryMats[] = {
			{ "extItem_bottle_empty", 1 }
		};
		sides[] = {"civ","reb"};
		category = "food";
		buyable = true;
		price = 500;
		vip = 1;
		conditions = "";
		conditionsMessage = "";
	};
	class ItemJuicePeach {
		variable = "ItemJuicePeach";
		displayName = "STR_Item_PeachJuice";
		finalItem = "extItem_Juice";
		virtualMats[] = {
			{ "peach", 3 }
		};
		inventoryMats[] = {
			{ "extItem_bottle_empty", 1 }
		};
		sides[] = {"civ","reb"};
		category = "food";
		buyable = true;
		price = 500;
		vip = 1;
		conditions = "";
		conditionsMessage = "";
	};

	class ItemJuiceMultifruit {
		variable = "ItemJuiceMultifruit";
		displayName = "STR_Item_MultifruitJuice";
		finalItem = "extItem_Juice";
		virtualMats[] = {
			{ "apple", 2 },
			{ "peach", 2 }
		};
		inventoryMats[] = {
			{ "extItem_bottle_empty", 1 }
		};
		sides[] = {"civ","reb"};
		category = "food";
		buyable = false;
		price = 500;
		vip = 0;
		conditions = "";
		conditionsMessage = "";
	};

	class ItemApple {
		variable = "ItemApple";
		displayName = "STR_Item_Apple";
		finalItem = "extItem_Apple";
		virtualMats[] = {
			{ "apple", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb","cop","med"};
		category = "food";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "";
		conditionsMessage = "";
	};
	class ItemPeach {
		variable = "ItemPeach";
		displayName = "STR_Item_Peach";
		finalItem = "extItem_Peach";
		virtualMats[] = {
			{ "peach", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb","cop","med"};
		category = "food";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "";
		conditionsMessage = "";
	};
	class ItemBanana {
		variable = "ItemBanana";
		displayName = "STR_Item_Banana";
		finalItem = "extItem_Banana";
		virtualMats[] = {
			{ "banana", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb","cop","med"};
		category = "food";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "";
		conditionsMessage = "";
	};
	class ItemPineApple {
		variable = "ItemPineApple";
		displayName = "STR_Item_Pineapple";
		finalItem = "extItem_PineApple";
		virtualMats[] = {
			{ "anana", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb","cop","med"};
		category = "food";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "";
		conditionsMessage = "";
	};
	class ItemCoconut {
		variable = "ItemCoconut";
		displayName = "STR_Item_Coconut";
		finalItem = "extItem_Coconut";
		virtualMats[] = {
			{ "coco", 1 }
		};
		inventoryMats[] = {};
		sides[] = {"civ","reb","cop","med"};
		category = "food";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "";
		conditionsMessage = "";
	};

	// медицина
	class ItemJet {
		variable = "ItemJet";
		displayName = "STR_Item_Jet";
		finalItem = "extItem_ItemJet";
		virtualMats[] = {
			{ "methp", 2 }
		};
		inventoryMats[] = {};
		sides[] = {"reb"};
		category = "medicine";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "";
		conditionsMessage = "";
	};
	class ItemPsycho {
		variable = "ItemPsycho";
		displayName = "STR_Item_Psycho";
		finalItem = "extItem_ItemPsycho";
		virtualMats[] = {
			{ "methp", 2 }
		};
		inventoryMats[] = {};
		sides[] = {"reb"};
		category = "medicine";
		buyable = true;
		price = 500;
		vip = 1;
		conditions = "";
		conditionsMessage = "";
	};
	class ItemTurbo {
		variable = "ItemTurbo";
		displayName = "STR_Item_Turbo";
		finalItem = "extItem_ItemTurbo";
		virtualMats[] = {
			{ "cannabis", 10 }
		};
		inventoryMats[] = {};
		sides[] = {"civ"};
		category = "medicine";
		buyable = true;
		price = 500;
		vip = 1;
		conditions = "";
		conditionsMessage = "";
	};
	class ItemCampFire {
		variable = "ItemCampFire";
		displayName = "STR_Item_FirePlace";
		finalItem = "extItem_campFire";
		virtualMats[] = {};
		inventoryMats[] = {
			{ "extItem_woodenLog", 1 },
			{ "extItem_matches", 1 }
		};
		sides[] = {"civ","reb","med","cop"};
		category = "items";
		buyable = true;
		price = 500;
		vip = 0;
		conditions = "";
		conditionsMessage = "";
	};
};

class LifeCfgRecipesCategories {
	class resources {
		displayName = "STR_CRAFT_FILTER_Resources";
	};
	class food {
		displayName = "STR_CRAFT_FILTER_Food";
	};
	class medicine {
		displayName = "STR_CRAFT_FILTER_Medical";
	};
	class items {
		displayName = "STR_CRAFT_FILTER_Item";
	};
};