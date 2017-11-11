class UnionDialogProcessing {
	idd = 5000;
	name= "UnionDialogProcessing";
	movingEnable = 0;
	enableSimulation = 1;		
	
	class controlsBackground {	
		class MainBackground:Life_V3_BackGround {			
			idc = -1;
			x = 0.303124 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.39375 * safezoneW;
			h = 0.3136 * safezoneH;
		};		
	};
	
	class controls {
		class Proces_menu_title: Life_V3_Title {
			idc = 5001;
			text = "Proces of smth";
			x = 0.303127 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.39375 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class CloseImage : RscPicture {
			idc = -1;
			text = "\union_gui\data\v3\button_close.paa";
			
			x = 0.679784 * safezoneW + safezoneX;
			y = 0.3264 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class CloseButton: RscPictureButtonMenu {
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "$STR_Global_Close";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};
					
			x = 0.679784 * safezoneW + safezoneX;
			y = 0.3264 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};
		class Recipe_info: Life_V3_RscStructuredText {
			idc = 5002;
			text = "Recipe";
			x = 0.305748 * safezoneW + safezoneX;
			y = 0.3656 * safezoneH + safezoneY;
			w = 0.228374 * safezoneW;
			h = 0.2688 * safezoneH;
		};
		class Inventory_title: Life_V3_RscText {
			idc = 5008;
			text = ""; //--- ToDo: Localize;			
			x = 0.53675 * safezoneW + safezoneX;
			y = 0.3656 * safezoneH + safezoneY;
			w = 0.157502 * safezoneW;
			h = 0.028 * safezoneH;	
		};
		class inventory_list: Life_V3_RscListBox {
			idc = 5003;
			x = 0.536749 * safezoneW + safezoneX;
			y = 0.3992 * safezoneH + safezoneY;
			w = 0.1575 * safezoneW;
			h = 0.2352 * safezoneH;
		};		
		class process_edit: Life_V3_RscEdit {
			idc = 5004;
			text = "1";
			onKeyUp = "[life_process_info] call UnionClient_processing_update";
			
			x = 0.305748 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class process_button: Life_V3_ButtonMenu {
			idc = 5005;
			text = "Создать"; //--- ToDo: Localize;
			onButtonClick = "[life_process_info] spawn UnionClient_processing_action";			
			
			x = 0.34775 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.118124 * safezoneW;
			h = 0.028 * safezoneH;
		};		
		class ProcessBar: Life_V3_RscProcessBar {
			idc = 5006;
						
			x = 0.468497 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.225749 * safezoneW;
			h = 0.028 * safezoneH;
		};	
		class process_value: Life_V3_RscProcessBarText {
			idc = 5007;
			text = ""; //--- ToDo: Localize;			
			x = 0.468497 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.225749 * safezoneW;
			h = 0.028 * safezoneH;
		};	
	};
};