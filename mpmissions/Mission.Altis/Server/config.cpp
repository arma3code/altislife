class DefaultEventhandlers;
class CfgPatches {
    class UnionServer {
        units[] = {"C_man_1"};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
        fileName = "UnionServer.pbo";
        author = "Tonic";
        pass = "QRpEEC2THz9U3PRe";
    };
};

class CfgFunctions {
    class MySQL_Database {
        tag = "DB";
        class MySQL
        {
            file = "\UnionServer\Functions\MySQL";
            class numberSafe {};
            class mresArray {};
            class queryRequest{};
            class asyncCall{};
            class insertRequest{};
            class updateRequest{};
            class mresToArray {};
            class insertVehicle {};
            class bool {};
            class mresString {};
            class updatePartial {};
        };
    };

    class TON_System {
        tag = "TON";
        class Systems {
            file = "\UnionServer\Functions\Systems";
            class managesc {};
            class cleanup {};
            class huntingZone {};
            class turtleZone {};
            class logit {};
			class rcon {};
			class serverCommand {};
			class RCON_Restart {};
            class spikeStrip {};
            class transferOwnership {};
            class federalUpdate {};
            class clientDisconnect {};
            class cleanupRequest {};
            class setObjVar {};
            class keyManagement {};
            class recupkeyforHC {};
            class handleBlastingCharge {};
            class combatVehicleReq {};
            class changeFraction {};
            class battleground {};
            class changePlayerServerMap	{};

        };

		class Wanted_Sys {
            file = "\UnionServer\Functions\WantedSystem";
            class wantedFetch {};
            class wantedCheck {};
            class wantedPerson {};
            class wantedBounty {};
            class wantedRemove {};
            class wantedAdd {};
            class wantedCrimes {};
            class wantedProfUpdate {};
            class wantedFetchMedic {};
            class wantedKilledbyCop {};
        };

        class Jail_Sys {
            file = "\UnionServer\Functions\Jail";
            class jailSys {};
			class wantedUpdateJailTime {};
        };

        class Credit {
            file = "\UnionServer\Functions\Credit";
            class reqCredit {};
            class repayCredit {};
        };

		class Garage {
            file = "\UnionServer\Functions\Garage";
            class vehicleCreate {};
            class vehicleUpdate {};
			class getVehicles {};
            class chopShopOwn {};
			class chopShopSell {};
			class vehicleDelete {};
			class vehicleStore {};
			class spawnVehicle {};
			class insurancePayRequest {};
			class vehicleSell {};
			class getArrayVeh {};
            class vehicleParkingPay {};
            class vehicleParkingStore {};
            class vehSearch {};
            class changeVehicleServerMap {};
        };

		class Gover {
            file = "\UnionServer\Functions\Gover";
            class serverBank {};
            class submitCandidate {};
            class vote {};
			class serverPricesUpdeta {};
			class serverGovUpdeta {};
			class GetPrices {};
			class GetGovInfo {};
        };

		class Economy {
            file = "\UnionServer\Functions\Economy";
            class adjustPrices {};
            class loadPrices {};
            class syncPrices {};
			class updataPrices {};
        };

		class Taxi {
			file = "\UnionServer\Functions\Taxi";
			class acceptedTaxiCall {};
			class callTaxiDrivers {};
			class goOffDuty {};
			class goOnDuty {};
		};

		class Housing {
            file = "\UnionServer\Functions\Housing";
            class addHouse {};
            class CheckHouse {};
            class fetchPlayerHouses {};
            class initHouses {};
			class reqHouseInfo {};
            class sellHouse {};
			class unlockHouseContainer {};
            class updateHouseContainers {};
			class updateHouseSlots {};
            class updateHouseTrunk {};
        };

        class Gangs {
            file = "\UnionServer\Functions\Gangs";
            class insertGang {};
            class queryPlayerGang {};
            class removeGang {};
            class updateGang {};
			class initGang {};
			class getOffline {};
			class kickOffline {};
			class updateGangTrunks {};
            class updateGangBank {};
            class updateGangWarPoints {};
        };

        class Smartphone {
            file = "\UnionServer\Functions\Smartphone";
            class cleanupMessages {};
            class handleMessages {};
            class msgRequest {};
        };

		class AdacUpdate {
            file = "\UnionServer\Functions\AdacUpdate";
            class vehicleAdacRecolor {};
            class vehicleAdacUpdate {};
            class vehicleAdacRematerial {};
        };

        class WarZon {
            file = "\UnionServer\Functions\WarZon";
            class addWarPoint {};
            class removeWarPoint {};
        };
        class Actions {
            file = "\UnionServer\Functions\Actions";
            class pickupAction {};
        };

    };
};

class CfgVehicles {
    class Car_F;
    class CAManBase;
    class Civilian;
    class Civilian_F : Civilian {
        class EventHandlers;
    };

    class C_man_1 : Civilian_F {
        class EventHandlers: EventHandlers {
            init = "(_this select 0) execVM ""\UnionServer\fix_headgear.sqf""";
        };
    };
};
