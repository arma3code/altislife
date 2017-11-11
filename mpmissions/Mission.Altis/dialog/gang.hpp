class UnionDialogMyGang {
	idd = 2620;
	name= "UnionDialogMyGang";
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
		
		class padImage : RscPicture {
			idc = 2640;
			text = "";
			
			x = -0.0875004;
			y = -0.38;
			w = 1.175;
			h = 1.72;
		};
		
		class BackButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0; [] spawn UnionClient_pad_openMain";
			tooltip = "$STR_PM_BackToMainMenu";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.375001;
			y = 0.86;
			w = 0.0624999;
			h = 0.06;
		};
		
		class HomeButton: RscPictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "$STR_Global_Close";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.462499;
			y = 0.86;
			w = 0.075;
			h = 0.06;
		};
	};
	
	class controls {
	
		class Title : RscTitle {
			colorBackground[] = {1,1,1,0.1};
			idc = 2629;
			text = "";
			
			x = 0.0374988;
			y = 0.1;
			w = 0.925;
			h = 0.04;
		};
		
		class GangMemberList : RscListBox 
		{
			idc = 2621;
			text = "";
			
			x = 0.0374988;
			y = 0.16;
			w = 0.65;
			h = 0.68;
		};

		
		class GangLeave : RscButtonMenu {
			idc = 2636;
			text = "$STR_Gang_Leave";
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "[] spawn UnionClient_gangs_Leave";
			
			x = 0.699998;
			y = 0.16;
			w = 0.2625;
			h = 0.04;
		};
		
		class DisbandGang : RscButtonMenu
		{
			idc = 2631;
			text = "$STR_Gang_Disband_Gang";
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "[] spawn UnionClient_gangs_Disband";			
			
			x = 0.699998;
			y = 0.16;
			w = 0.2625;
			h = 0.04;
		};
		
		class GangLock : RscButtonMenu 
		{
			idc = 2622;
			text = "$STR_Gang_UpgradeSlots";
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "[] spawn UnionClient_gangs_Upgrade";
			
			x = 0.700001;
			y = 0.208;
			w = 0.2625;
			h = 0.04;
		};
		
		
		class GangLeader : RscButtonMenu 
		{
			idc = 2625;
			text = "$STR_Gang_SetLeader";
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "[] spawn UnionClient_gangs_NewLeader";
			
			x = 0.700001;
			y = 0.256;
			w = 0.2625;
			h = 0.04;
		};
		
		class GangDeputy : RscButtonMenu 
		{
			idc = 2637;
			text = "$STR_Gang_SetDeputy";
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "[] spawn UnionClient_gangs_NewDeputy";
			
			x = 0.700001;
			y = 0.304;
			w = 0.2625;
			h = 0.04;
		};
				
		class GangKick : RscButtonMenu 
		{
			idc = 2624;
			text = "$STR_Gang_Kick";
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "[] spawn UnionClient_gangs_Kick";
			
			x = 0.700001;
			y = 0.352;
			w = 0.2625;
			h = 0.04;
		};
		
		
		class MoneyEdit : RscEdit 
		{
			idc = 2633;			
			text = "100000";
			colorBackground[] = {0,0,0,0.5};			
			
			x = 0.700001;
			y = 0.4;
			w = 0.125;
			h = 0.04;
		};
		
		class TakeMoney : RscButtonMenu 
		{
			idc = 2626;
			text = "Снять";
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "[] spawn UnionClient_gangs_Take";
			
			x = 0.8375;
			y = 0.4;
			w = 0.125;
			h = 0.04;
		};
		
		class LvlDOWN : RscButtonMenu 
		{
			idc = 2628;
			text = "Урв -";
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "[0] spawn UnionClient_gangs_Lvl";
			
			x = 0.700001;
			y = 0.448;
			w = 0.125;
			h = 0.04;
		};
		
		class LvlUP : RscButtonMenu 
		{
			idc = 2627;
			text = "Урв +";
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "[1] spawn UnionClient_gangs_Lvl";
			
			x = 0.8375;
			y = 0.448;
			w = 0.125;
			h = 0.04;
		};
		
		class GangLicense : RscButtonMenu 
		{
			idc = 2635;
			text = "Лицензия";
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "";
			
			x = 0.700001;
			y = 0.496;
			w = 0.2625;
			h = 0.04;
		};
		
		class OfflineList : RscButtonMenu 
		{
			idc = 2638;
			text = "Оффлайн";
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "[] spawn UnionClient_gangs_Offline";
			
			x = 0.700001;
			y = 0.544;
			w = 0.2625;
			h = 0.04;
		};
		
		class GangInfo : RscButtonMenu 
		{
			idc = -1;
			text = "Частоты";
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "[] spawn UnionClient_gangs_Info";
			
			x = 0.7;
			y = 0.64;
			w = 0.2;
			h = 0.04;
		};
		
		class GangInfoAdd : RscButtonMenu 
		{
			idc = 2639;
			text = "+";
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "[] spawn UnionClient_gangs_OpenInfoMenu";
			
			x = 0.9125;
			y = 0.64;
			w = 0.05;
			h = 0.04;
		};
		
		
		class InviteMember : RscButtonMenu
		{
			idc = 2630;
			text = "$STR_Gang_Invite_Player";
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "[] spawn UnionClient_gangs_InvitePlayer";
			
			x = 0.700001;
			y = 0.8;
			w = 0.2625;
			h = 0.04;
		};
		
		class PlayersInviteList : RscCombo
		{
			idc = 2632;
			
			x = 0.700001;
			y = 0.752;
			w = 0.2625;
			h = 0.04;
		};
		
		
		
		class GangBank : Title {
			idc = 601;
			style = 1;
			text = "";
		};
	};
};

class UnionDialogMyGangCreate {
	idd = 2520;
	name= "UnionDialogMyGangCreate";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	
	class controlsBackground {
		class RscTitleBackground:RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class MainBackground:RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.3 - (22 / 250);
		};
	};
	
	class controls {
	
		class InfoMsg : RscStructuredText
		{
			idc = 2523;
			sizeEx = 0.020;
			text = "";
			x = 0.1;
			y = 0.25;
			w = 0.5; h = .11;
		};
		
		class Title : RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Gang_Title";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class CloseLoadMenu : RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.5 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangCreateField : RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Create";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call UnionClient_gangs_Create";
			x = 0.27;
			y = 0.40;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class CreateGangText : RscEdit
		{
			idc = 2522;
			text = "$STR_Gang_YGN";
			
			x = 0.04 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.35;
			w = (13 / 40);
			h = (1 / 25);
		};
	};
};


class UnionDialogMyGangAddInfo {
	idd = 4200;
	name= "UnionDialogMyGangAddInfo";
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground {
		class RscTitleBackground:RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class MainBackground:RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.2 - (22 / 250);
		};
	};
	
	class controls {
		
		class Title : RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Укажите частоты раций";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class MWtext : RscStructuredText
		{
			idc = -1;
			sizeEx = 0.020;
			text = "СВ: ";
			x = 0.1;
			y = 0.25;
			w = 0.065; h = .11;
		};
		
		class LWtext : RscStructuredText
		{
			idc = -1;
			sizeEx = 0.020;
			text = "ДВ: ";
			x = 0.1;
			y = 0.3;
			w = 0.065; h = .11;
		};
		
		class MWtextEdit : RscEdit
		{
			idc = 4201;
			text = "";
			
			x = 0.17;
			y = 0.25;
			w = 0.25;
			h = (1 / 25);
		};
		
		class LWtextEdit : RscEdit
		{
			idc = 4202;
			text = "";
			
			x = 0.17;
			y = 0.3;
			w = 0.25;
			h = (1 / 25);
		};
		
		class AddinfoButton : RscButtonMenu {
			idc = -1;
			text = "Установить";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call UnionClient_gangs_InfoAdd";
			x = 0.1;
			y = 0.36;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class CloseInfoMenu : RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.6 - (6.25 / 40);
			y = 0.36;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};