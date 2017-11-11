class UnionDialogAdmin {
    idd = 2900;
    name= "UnionDialogAdmin";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "[_this select 0] call UnionClient_gui_Tiles";

    class controlsBackground {
        class Blackout: RscText
        {
            idc = -1;
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "safezoneH";

            colorBackground[] = { 0, 0, 0, 0.5 };
        };
        class Tiles: RscTiles {};
    };

    class controls {

        class Title : Life_V3_Title {
            idc = 2901;
            text = "$STR_Admin_Title";

            x = 0 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = 1 * safezoneW;
            h = 0.0418 * safezoneH;

        };

        class PlayerList_Admin : RscListBox {
            idc = 2902;
            text = "";

            onLBSelChanged = "[_this] spawn UnionClient_admin_Query";

            x = 0.00190622 * safezoneW + safezoneX;
            y = 0.049 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.693 * safezoneH;

            colorBackground[] = {0,0,0,0.75};
        };

        class PlayerBInfo : RscStructuredText {
            idc = 2903;
            text = "";

            x = 0.149375 * safezoneW + safezoneX;
            y = 0.049 * safezoneH + safezoneY;
            w = 0.170156 * safezoneW;
            h = 0.176 * safezoneH;

            colorBackground[] = {0,0,0,0.75};
        };

        class PlayerLicenses : RscListBox {
            idc = 2904;
            text = "";

            x = 0.149375 * safezoneW + safezoneX;
            y = 0.2294 * safezoneH + safezoneY;
            w = 0.170156 * safezoneW;
            h = 0.154 * safezoneH;

            colorBackground[] = {0,0,0,0.75};
        };

        class PlayerLloot : RscListBox {
            idc = 2905;
            text = "";

            x = 0.149375 * safezoneW + safezoneX;
            y = 0.3878 * safezoneH + safezoneY;
            w = 0.170156 * safezoneW;
            h = 0.33 * safezoneH;

            colorBackground[] = {0,0,0,0.75};
        };

        class GetLootButton : RscButtonMenu {
            idc = 2906;
            text = "Получить инвентарь";

            onButtonClick = "[] call UnionClient_admin_GetUnitLoot";

            x = 0.149375 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.170156 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class SpectateButton : RscButtonMenu {
            idc = 2907;
            text = "Наблюдение";

            onButtonClick = "[] spawn UnionClient_admin_Spectate;";

            x = 0.323656 * safezoneW + safezoneX;
            y = 0.049 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class FreezeButton : RscButtonMenu {
            idc = 2908;
            text = "Заморозить";

            onButtonClick = "[] call UnionClient_admin_Freeze;";

            x = 0.323656 * safezoneW + safezoneX;
            y = 0.0754 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TeleportToMeButton : RscButtonMenu {
            idc = 2909;
            text = "ТП ко мне";

            onButtonClick = "[] call UnionClient_admin_TpHere";

            x = 0.323656 * safezoneW + safezoneX;
            y = 0.1018 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class TeleportToHimButton : RscButtonMenu {
            idc = 2910;
            text = "ТП к игроку";

            onButtonClick = "[] call UnionClient_admin_TpTo";

            x = 0.323656 * safezoneW + safezoneX;
            y = 0.1282 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class DdosTS : RscButtonMenu {
            idc = 29111;
            text = "Дудосят ТС";

            onButtonClick = "['ddosts'] remoteExecCall ['TON_fnc_ServerCommand',2];";

            x = 0.414407 * safezoneW + safezoneX;
            y = 0.1766 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.022 * safezoneH;

            colorBackground[] = {1,0,0,1};
        };

        class DdosServer : RscButtonMenu {
            idc = 29112;
            text = "Дудосят Сервер";

            onButtonClick = "['ddosserver'] remoteExecCall ['TON_fnc_ServerCommand',2];";

            x = 0.323656 * safezoneW + safezoneX;
            y = 0.1766 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.022 * safezoneH;

            colorBackground[] = {1,0,0,1};
        };
        class KickButton : RscButtonMenu {
            idc = 2911;
            text = "Кикнуть";

            onButtonClick = "[] call UnionClient_admin_Kick";

            x = 0.323656 * safezoneW + safezoneX;
            y = 0.2030 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.022 * safezoneH;

            colorBackground[] = {1,0,0,1};
        };

        class BanButton : RscButtonMenu {
            idc = 2912;
            text = "Забанить";

            onButtonClick = "[] call UnionClient_admin_QuickBan";

            x = 0.414407 * safezoneW + safezoneX;
            y = 0.2030 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.022 * safezoneH;

            colorBackground[] = {1,0,0,1};
        };

        class HousesList : RscListBox {
            idc = 2913;
            text = "";

            x = 0.322625 * safezoneW + safezoneX;
            y = 0.2294 * safezoneH + safezoneY;
            w = 0.179438 * safezoneW;
            h = 0.1276 * safezoneH;

            colorBackground[] = {0,0,0,0.75};
        };

        class GetHousesButton : RscButtonMenu {
            idc = 2914;
            text = "Получить список домов";

            onButtonClick = "";

            x = 0.322625 * safezoneW + safezoneX;
            y = 0.3614 * safezoneH + safezoneY;
            w = 0.179438 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class VehiclesList : RscListBox {
            idc = 2915;
            text = "";

            x = 0.322625 * safezoneW + safezoneX;
            y = 0.3878 * safezoneH + safezoneY;
            w = 0.179438 * safezoneW;
            h = 0.33 * safezoneH;

            colorBackground[] = {0,0,0,0.75};
        };

        class GetVehiclesButton : RscButtonMenu {
            idc = 2916;
            text = "Получить список техники";

            onButtonClick = "";

            x = 0.322624 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.180466 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class CmdExecute : RscButtonMenu {
            idc = 2917;
            text = "Выполнить";

            onButtonClick = "call compile (ctrlText 2918)";

            x = 0.795968 * safezoneW + safezoneX;
            y = 0.3746 * safezoneH + safezoneY;
            w = 0.201094 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class CmdWindow : RscEdit {
            idc = 2918;
            text = "";
            lineSpacing = 1;
            autocomplete = "scripting";
            x = 0.795969 * safezoneW + safezoneX;
            y = 0.049 * safezoneH + safezoneY;
            w = 0.201094 * safezoneW;
            h = 0.319 * safezoneH;

            colorBackground[] = {0,0,0,0.75};
        };

        class LockButton : RscButtonMenu {
            idc = 2919;
            text = "Закрыть сервер";

            onButtonClick = "['lock'] remoteExecCall ['TON_fnc_ServerCommand',2];";

            x = 0.795969 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.0989999 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class UnLockButton : RscButtonMenu {
            idc = 2920;
            text = "Открыть сервер";

            onButtonClick = "['unlock'] remoteExecCall ['TON_fnc_ServerCommand',2];";

            x = 0.898062 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.0989999 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class CompensateButton : RscButtonMenu {
            idc = 2921;
            text = "+ $500.000";

            onButtonClick = "[] call UnionClient_admin_Compensate";

            x = 0.795969 * safezoneW + safezoneX;
            y = 0.4824 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class MakeZero : RscButtonMenu {
            idc = 29221;
            text = "Сделать $0";

            onButtonClick = "['cash','set',0] call UnionClient_system_myCash";

            x = 0.898062 * safezoneW + safezoneX;
            y = 0.4824 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class adminShop : RscButtonMenu {
            idc = 29231;
            text = "Магаз оружия";

            onButtonClick = "['','','','admin'] call UnionClient_system_weaponShopMenu";

            x = 0.795969 * safezoneW + safezoneX;
            y = 0.4560 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ClothinShop : RscButtonMenu {
            idc = 292231;
            text = "Магаз одежды";

            onButtonClick = "['','','','admin'] call UnionClient_system_clothingMenu";

            x = 0.898062 * safezoneW + safezoneX;
            y = 0.4560 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class MarkersButton : RscButtonMenu {
            idc = 2922;
            text = "Маркеры";

            onButtonClick = "[] spawn UnionClient_admin_Markers";

            x = 0.795969 * safezoneW + safezoneX;
            y = 0.4296 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
        };

        /*class GodButton : RscButtonMenu {
            idc = 2923;
            text = "Режим Бога";

            onButtonClick = "[] call UnionClient_admin_GodMode;";

            x = 0.795969 * safezoneW + safezoneX;
            y = 0.5506 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
        };*/

        class TeleportButton : RscButtonMenu {
            idc = 2924;
            text = "Телепорт";

            onButtonClick = "[] call UnionClient_admin_Teleport; hint 'Укажите место для перемещения'";

            x = 0.795969 * safezoneW + safezoneX;
            y = 0.5352 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class DeBuff : RscButtonMenu {
            idc = 29244;
            text = "Лекнуть себя";

            onButtonClick = "['all'] call UnionClient_system_removeBuff; player setdamage 0";

            x = 0.898062 * safezoneW + safezoneX;
            y = 0.5352 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class EditBox : RscEdit {
            idc = 29251;

            x = 0.795969 * safezoneW + safezoneX;
            y = 0.5088 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class MakeChane : RscButtonMenu {
            idc = 292521;
            text = "Сменить ник";

            onButtonClick = "[player,'realname',(ctrlText 29251)] call CBA_fnc_setVarNet;";

            x = 0.898062 * safezoneW + safezoneX;
            y = 0.5088 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class AmodeOnButton : RscButtonMenu {
            idc = 2925;
            text = "Режим админа вкл";

            onButtonClick = "[true] call UnionClient_admin_Mode";

            x = 0.795969 * safezoneW + safezoneX;
            y = 0.577 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class AmodeOffButton : RscButtonMenu {
            idc = 2926;
            text = "Режим админа выкл";

            onButtonClick = "[false] call UnionClient_admin_Mode";

             x = 0.898062 * safezoneW + safezoneX;
            y = 0.577 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class CloseButtonKey : RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";

            x = 0.795969 * safezoneW + safezoneX;
            y = 0.6188 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;

            onButtonClick = "closeDialog 0;";
        };
    };
};