class UnionDialogCredit {
	idd = 3400;
	name= "UnionDialogCredit";
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
		
		class RscTitleBackground:RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.5 - (22 / 250);
		};
	};
	
	class controls {
	
		class Title : RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3401;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class CreditStatus : RscStructuredText
		{
			idc = 3402;			
			text = "";
			sizeEx = 0.020;
			colorBackground[] = {0, 0, 0, 0};
			
			x = 0.11; y = 0.28;
			w = 0.75; h = 0.35;
		};
			
		
		class GetCreditButton : RscButtonMenu {
			idc = 3404;
			text = "Получить";
			onButtonClick = "[1] call UnionClient_credit_sendRequest;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.7 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class RepayCreditButton : RscButtonMenu {
			idc = 3405;
			text = "Погасить";
			onButtonClick = "[0] call UnionClient_credit_sendRequest;";
			x = -0.06 + (6.25 / 40)*2 + (1 / 250 / (safezoneW / safezoneH))*2;
			y = 0.7 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class CloseButton : RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.744;
			y = 0.7 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		
		
	};
};