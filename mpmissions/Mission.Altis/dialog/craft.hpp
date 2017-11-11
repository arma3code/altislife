class UnionDialogCraft {
	idd = 666;
	name= "UnionDialogCraft";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call UnionClient_gui_Tiles; [] spawn UnionClient_crafting_Menu";

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
			idc = 676;
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
			idc = -1;
			text = "$STR_CRAFT_Title";
			
			x = 0.0374988;
			y = 0.1;
			w = 0.925;
			h = 0.04;
		};

		class craftListHeader : RscText
		{
			idc = -1;
			colorBackground[] = {1,1,1,0.1};
			text = "$STR_PM_CraftStats";
			sizeEx = 0.04;
			
			x = 0.0374988;
			y = 0.16;
			w = 0.287499;
			h = 0.04;
		};

		//Craft list
		class craftList : RscListBox
		{
			idc = 669;			
			onLBSelChanged = "[] spawn UnionClient_crafting_Update";
			
			x = 0.0374988;
			y = 0.28;
			w = 0.287499;
			h = 0.56;
		};

		//Materials list header
		class materialListHeader : RscText
		{
			idc = -1;
			colorBackground[] = {1,1,1,0.1};
			text = "$STR_PM_CraftMaterials";
			sizeEx = 0.04;
			
			x = 0.3375;
			y = 0.16;
			w = 0.325;
			h = 0.04;
		};
		class materialList : RscStructuredText
		{
			idc = 672;
			sizeEx = 0.020;
			text = "";
			x = 0.3375;
			y = 0.22;
			w = 0.325;
			h = 0.22;
		};
		class craftInfoHeader : RscText
		{
			idc = -1;
			colorBackground[] = {1,1,1,0.1};
			text = "Информация";
			sizeEx = 0.04;
			
			x = 0.3375;
			y = 0.46;
			w = 0.325;
			h = 0.04;
		};
		class CraftInfoText : RscStructuredText
		{
			idc = 675;
			sizeEx = 0.020;
			text = "";
			x = 0.3375;
			y = 0.52;
			w = 0.325;
			h = 0.32;
		};

		//FILTER
		class FilterList : RscCombo
		{
			idc = 673;			
			onLBSelChanged  = "[] call UnionClient_crafting_UpdateFilter";
			
			x = 0.0374988;
			y = 0.22;
			w = 0.287499;
			h = 0.04;
		};

		//Craft button
		class ButtonCraft : RscButtonUC {
			idc = 674;
			text = "$STR_CRAFT_Button";
			colorBackground[] = {1,1,1,0.2};
			onButtonClick = "if (!life_is_processing) then {[] spawn UnionClient_crafting_Action};";
			
			x = 0.75;
			y = 0.78;
			w = 0.2125;
			h = 0.06;
		};	

		class my_inv_listTitle: RscText
		{
			idc = -1;
			text = "Инвентарь"; //--- ToDo: Localize;
			x = 0.675;
			y = 0.16;
			w = 0.2875;
			h = 0.04;
			colorBackground[] = {1,1,1,0.2};
		};
		class my_inv_list: RscListbox
		{
			idc = 677;
			x = 0.674999;
			y = 0.22;
			w = 0.2875;
			h = 0.54;
		};
		class kolvo_editbox: RscEdit
		{
			idc = 678;
			text = "1"; //--- ToDo: Localize;
			onKeyUp = "[] call UnionClient_crafting_Update";
			x = 0.675;
			y = 0.78;
			w = 0.0625;
			h = 0.06;
		};
	};
}; 