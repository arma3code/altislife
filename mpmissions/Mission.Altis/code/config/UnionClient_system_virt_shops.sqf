/*

	Filename: 	UnionClient_system_virt_shops.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\..\script_macros.hpp"
private _shop = _this select 0;

switch (_shop) do {
	case "market": {[localize "STR_MF_FoodMarket",["apple","peach","bottles","leather_r","hen_fried","rooster_fried","goat_fried","sheep_fried","olivep","coco","anana","banana","arwater","coffeep","cocomilk","dish","cacaop"]]};		
	case "wongs": {["Wong's Food Cart",["turtle","shark"]]};
	case "heroin": {[localize "STR_MF_DrugDealer",["cocainep","heroinp","marijuana","methp","opiump"]]};
	case "oil": {["Oil Trader",["oilp","petrol"]]};
	case "fishmarket": {[localize "STR_MF_FishMarket",["salema_fried", "ornate_fried", "mackerel_fried", "tuna_fried", "mullet_fried", "catshark_fried", "shrimp_s", "royalcp"]]};
	case "glass": {["Altis Glass Dealer",["glass","bottles"]]};
	case "iron": {["Altis Industrial Trader",["iron_r","copper_r","copper_tape"]]};
	case "diamond": {[localize "STR_MF_DiamondShop",["diamondc","jewelry"]]};
	case "salt": {[localize "STR_MF_SaltShop",["salt_r"]]};
	case "cement": {[localize "STR_MF_CementShop",["cement"]]};
	case "gold": {[localize "STR_MF_GoldShop",["goldbar"]]};
	case "uranium": {[localize "STR_MF_UranShop",["uraniump","uraniumc"]]};		
	case "bar": {[localize "STR_MF_BarTT",["bottledbeer","bottledwhiskey"]]};
	case "alcotrade": {[localize "STR_MF_AlcoShop",["bottledbeer","bottledwhiskey","roma"]]};
	case "medmarijuana": {[localize "STR_MF_MedMarjShop",["marijuana"]]};
	case "speakeasy": {[localize "STR_MF_NomadsBase",["bottledwhiskey","bottledbeer","bottledshine","cigar"]]};
	case "wood": {[localize "STR_MF_WoodShop",["wood","woodbp","woodrp"]]};
	case "gas": {[localize "STR_MF_GasShop",["gasp","ammonia"]]};
	case "artmarket": {[localize "STR_MF_ArtifactsShop",["weppart","exhibit"]]};
	
	case "tanoa_export": {[localize "STR_MF_TanoaExportShop",["sugarp","allup","sofa","royalcf","allucan"]]};
	case "tanoa_values": {[localize "STR_MF_TanoaValuesShop",["amberp","pearlp","artpartp"]]};
	case "tanoa_blackdiamond": {[localize "STR_MF_BlackDiamondShop",["blackdp"]]};
	case "tanoa_bronze": {[localize "STR_MF_BronzeShop",["bronzep"]]};
	case "tanoa_coquina": {[localize "STR_MF_CoquinaShop",["coquinap"]]};
	case "tanoa_obsid": {[localize "STR_MF_ObsidShop",["obsidp"]]};
	case "tanoa_weppart": {[localize "STR_MF_WeapPartShop",["weppartp"]]};
};