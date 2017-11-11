class UnionDialogSkinSetup {
	idd = 6000;
	name= "UnionDialogSkinSetup";
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
		
		class MainBackground:Life_V3_BackGround {			
			idc = -1;
			x = 0.368749 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.448 * safezoneH;
		};
	};
	
	class controls {
		class Title : Life_V3_Title {			
			idc = -1;
			text = "Выбор скина";
			x = 0.36875 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.242812 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseImage : RscPicture {
			idc = -1;
			text = "\union_gui\data\v3\button_close.paa";
			
			x = 0.594498 * safezoneW + safezoneX;
			y = 0.2844 * safezoneH + safezoneY;
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
					
			x = 0.594498 * safezoneW + safezoneX;
			y = 0.2844 * safezoneH + safezoneY;
			w = 0.0144375 * safezoneW;
			h = 0.0252 * safezoneH;
		};

		class strtxt_demo: Life_V3_RscStructuredText
		{
			idc = 6001;
			x = 0.375312 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class editbox_demo: Life_V3_RscEdit
		{
			idc = 6002;
			text = "123456789 987 65 43 21 0"; //--- ToDo: Localize;
			x = 0.375313 * safezoneW + safezoneX;
			y = 0.598 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class txt_demo: Life_V3_RscText
		{
			idc = 6003;
			text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"; //--- ToDo: Localize;
			x = 0.375313 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.056 * safezoneH;			
		};
		class listbox_demo: Life_V3_RscListBox
		{
			idc = 6004;
			x = 0.375313 * safezoneW + safezoneX;
			y = 0.472 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.112 * safezoneH;
		};

		class skin_select: Life_V3_RscCombo
		{
			idc = 6005;
			x = 0.375312 * safezoneW + safezoneX;
			y = 0.724 * safezoneH + safezoneY;
			w = 0.137812 * safezoneW;
			h = 0.028 * safezoneH;

			onLBSelChanged = "_this call UnionClient_hud_skinUpdate";
		};

		class progressbar: Life_V3_RscProcessBar
		{
			idc = 6006;
			x = 0.375313 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.0308 * safezoneH;			
		};

		class progressbar_text: Life_V3_RscProcessBarText
		{
			idc = 6007;			
			text = "50%"; //--- ToDo: Localize;
			x = 0.375313 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.0308 * safezoneH;			
		};

		class ButtonClose : Life_V3_ButtonMenu
		{
			idc = -1;
			text = "Обновить";			
			onButtonClick = "closeDialog 0; [] spawn UnionClient_hud_skinMenu;";
			
			x = 0.519688 * safezoneW + safezoneX;
			y = 0.724 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};