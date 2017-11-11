#define true 1
#define false 0
/*

	class:
	variable = имя переменной
	displayName = название из стрингтейбл
	price = цена
	side = фракция
	buyable = продается в магазине лицензий
	gang = лицензия группировки

*/
class LifeCfgLicenses {
	class civdriver {
		variable = "driver";
		displayName = "STR_License_Driver";
		price = 500;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class rebdriver {
		variable = "driver";
		displayName = "STR_License_Driver";
		price = 500;
		side = "reb";
		buyable = true;
		gang = false;
	};

	class civboat {
		variable = "boat";
		displayName = "STR_License_Boat";
		price = 500;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class rebboat {
		variable = "boat";
		displayName = "STR_License_Boat";
		price = 500;
		side = "reb";
		buyable = true;
		gang = false;
	};

	class civair {
		variable = "air";
		displayName = "STR_License_Pilot";
		price = 3000;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class rebair {
		variable = "air";
		displayName = "STR_License_Pilot";
		price = 3000;
		side = "reb";
		buyable = true;
		gang = false;
	};

	class civtruck {
		variable = "truck";
		displayName = "STR_License_Truck";
		price = 2000;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class rebtruck {
		variable = "truck";
		displayName = "STR_License_Truck";
		price = 2000;
		side = "reb";
		buyable = true;
		gang = false;
	};

	class civgun {
		variable = "gun";
		displayName = "STR_License_Firearm";
		price = 7500;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class rebgun {
		variable = "gun";
		displayName = "STR_License_Firearm";
		price = 7500;
		side = "reb";
		buyable = true;
		gang = false;
	};

	class civhome {
		variable = "home";
		displayName = "STR_License_Home";
		price = 10000;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class rebhome {
		variable = "home";
		displayName = "STR_License_Home";
		price = 10000;
		side = "reb";
		buyable = true;
		gang = false;
	};

	class civdive {
		variable = "dive";
		displayName = "STR_License_Diving";
		price = 500;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class rebdive {
		variable = "dive";
		displayName = "STR_License_Diving";
		price = 500;
		side = "reb";
		buyable = true;
		gang = false;
	};

	class slavery {
		variable = "slavery";
		displayName = "STR_License_Slaver";
		price = 15000;
		side = "reb";
		buyable = true;
		gang = false;
	};

	class mafia {
		variable = "mafia";
		displayName = "STR_License_Mafioso";
		price = 15000;
		side = "civ";
		buyable = true;
		gang = false;
	};

	//civ licenses

	class oil {
		variable = "oil";
		displayName = "STR_License_Oil";
		price = 3500;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class medmarijuana {
		variable = "medmarijuana";
		displayName = "STR_License_Marijuana";
		price = 10000;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class diamond {
		variable = "diamond";
		displayName = "STR_License_Diamond";
		price = 5000;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class salt {
		variable = "salt";
		displayName = "STR_License_Salt";
		price = 3500;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class sand {
		variable = "sand";
		displayName = "STR_License_Sand";
		price = 3500;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class iron {
		variable = "iron";
		displayName = "STR_License_Iron";
		price = 3500;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class copper {
		variable = "copper";
		displayName = "STR_License_Copper";
		price = 3500;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class cement {
		variable = "cement";
		displayName = "STR_License_Cement";
		price = 3500;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class liquor {
		variable = "liquor";
		displayName = "STR_License_Brewing";
		price = 10000;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class stiller {
		variable = "stiller";
		displayName = "STR_License_Distillery";
		price = 5000;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class bottler {
		variable = "bottler";
		displayName = "STR_License_BottlingAlco";
		price = 10000;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class tobacco {
		variable = "tobacco";
		displayName = "STR_License_Cigars";
		price = 10000;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class gas {
		variable = "gas";
		displayName = "STR_License_Gas";
		price = 5000;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class fish {
		variable = "fish";
		displayName = "STR_License_Seafood";
		price = 3500;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class tcitizen {
		variable = "tcitizen";
		displayName = "STR_License_CitizenTanoa";
		price = 100000;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class food {
		variable = "food";
		displayName = "STR_License_Food";
		price = 5000;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class apprentice {
		variable = "apprentice";
		displayName = "STR_License_Journeyman";
		price = 5000;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class wood {
		variable = "wood";
		displayName = "STR_License_Woodworking";
		price = 5000;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class metal {
		variable = "metal";
		displayName = "STR_License_Metallurgist";
		price = 5000;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class confectioner {
		variable = "confectioner";
		displayName = "STR_License_Confectioner";
		price = 5000;
		side = "civ";
		buyable = true;
		gang = false;
	};

	class furniture {
		variable = "furniture";
		displayName = "STR_License_Furniture";
		price = 5000;
		side = "civ";
		buyable = true;
		gang = false;
	};

	//reb licenses

	class uranium {
		variable = "uranium";
		displayName = "STR_License_Uranium";
		price = 30000;
		side = "reb";
		buyable = true;
		gang = false;
	};

	class cocaine {
		variable = "coke";
		displayName = "STR_License_Cocaine";
		price = 10000;
		side = "reb";
		buyable = true;
		gang = false;
	};

	class heroin {
		variable = "heroin";
		displayName = "STR_License_Heroin";
		price = 10000;
		side = "reb";
		buyable = true;
		gang = false;
	};

	class meth {
		variable = "meth";
		displayName = "STR_License_Meth";
		price = 7000;
		side = "reb";
		buyable = true;
		gang = false;
	};

	class marijuana {
		variable = "marijuana";
		displayName = "STR_License_Marijuana";
		price = 10000;
		side = "reb";
		buyable = true;
		gang = false;
	};

	class rarewood {
		variable = "rarewood";
		displayName = "STR_License_RareWood";
		price = 5000;
		side = "reb";
		buyable = true;
		gang = false;
	};

	class bdiamond {
		variable = "bdiamond";
		displayName = "STR_License_BlackDiamonds";
		price = 5000;
		side = "reb";
		buyable = true;
		gang = false;
	};

	class opium {
		variable = "opium";
		displayName = "STR_License_Opium";
		price = 5000;
		side = "reb";
		buyable = true;
		gang = false;
	};

	class weapon {
		variable = "weapon";
		displayName = "STR_License_Gunsmith";
		price = 5000;
		side = "reb";
		buyable = true;
		gang = false;
	};

	class rum {
		variable = "rum";
		displayName = "STR_License_Rum";
		price = 5000;
		side = "reb";
		buyable = true;
		gang = false;
	};

	class rarefish {
		variable = "rarefish";
		displayName = "STR_License_RareSeafood";
		price = 5000;
		side = "reb";
		buyable = true;
		gang = false;
	};


	//reb gangs

	class sdr {
		variable = "sdr";
		displayName = "STR_License_SDR";
		price = 0;
		side = "reb";
		buyable = false;
		gang = true;
	};

	class aff {// 14K
		variable = "aff";
		displayName = "STR_License_AFF";
		price = 0;
		side = "reb";
		buyable = false;
		gang = true;
	};

	class bf {
		variable = "bf";
		displayName = "STR_License_bf";
		price = 0;
		side = "civ";
		buyable = false;
		gang = true;
	};

	class mfo {
		variable = "mfo";
		displayName = "STR_License_MFO";
		price = 0;
		side = "reb";
		buyable = false;
		gang = true;
	};

	class arg {
		variable = "arg";
		displayName = "STR_License_ARG";
		price = 0;
		side = "reb";
		buyable = false;
		gang = true;
	};

	class nmd {
		variable = "nmd";
		displayName = "STR_License_NMD";
		price = 0;
		side = "reb";
		buyable = false;
		gang = true;
	};

	class nsb {
		variable = "nsb";
		displayName = "STR_License_NSB";
		price = 0;
		side = "reb";
		buyable = false;
		gang = true;
	};

	class mc {
		variable = "mc";
		displayName = "STR_License_MC";
		price = 0;
		side = "reb";
		buyable = false;
		gang = true;
	};

	class rfa {
		variable = "rfa";
		displayName = "STR_License_RFA";
		price = 0;
		side = "reb";
		buyable = false;
		gang = true;
	};

	class la {
		variable = "la";
		displayName = "STR_License_LA";
		price = 0;
		side = "reb";
		buyable = false;
		gang = true;
	};

	class fsg {
		variable = "fsg";
		displayName = "STR_License_FSG";
		price = 0;
		side = "reb";
		buyable = false;
		gang = true;
	};

	//civ gangs

	class vl {
		variable = "vl";
		displayName = "STR_License_VL";
		price = 0;
		side = "civ";
		buyable = false;
		gang = true;
	};

	class press {
		variable = "press";
		displayName = "STR_License_Journalist";
		price = 0;
		side = "civ";
		buyable = false;
		gang = true;
	};

	class taxi {
		variable = "taxi";
		displayName = "STR_License_Taxi";
		price = 0;
		side = "civ";
		buyable = false;
		gang = true;
	};

	class led {
		variable = "led";
		displayName = "STR_License_Prosecutor";
		price = 0;
		side = "civ";
		buyable = false;
		gang = true;
	};

	class ira {
		variable = "ira";
		displayName = "STR_License_IRA";
		price = 0;
		side = "civ";
		buyable = false;
		gang = true;
	};

	class fb {
		variable = "fb";
		displayName = "STR_License_FB";
		price = 0;
		side = "civ";
		buyable = false;
		gang = true;
	};

	class ccp {
		variable = "ccp";
		displayName = "STR_License_CCP";
		price = 0;
		side = "civ";
		buyable = false;
		gang = true;
	};

	class ics {
		variable = "ics";
		displayName = "STR_License_ICS";
		price = 0;
		side = "civ";
		buyable = false;
		gang = true;
	};

	class sen {
		variable = "sen";
		displayName = "STR_License_SEN";
		price = 0;
		side = "civ";
		buyable = false;
		gang = true;
	};

	class bst {
		variable = "bst";
		displayName = "STR_License_BST";
		price = 0;
		side = "civ";
		buyable = false;
		gang = true;
	};
};