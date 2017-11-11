class UnionDialogTrunk
{
	idd = 3500;
	name = "UnionDialogTrunk";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call UnionClient_gui_Tiles";
	
	class controlsBackground
	{
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

		class RscTitleText : RscTitle
		{			
			idc = 3501;
			x = 0.2984 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.4032 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class VehicleWeight : RscTitleText
		{
			idc = 3504;
			colorBackground[] = {0,0,0,0};
			style = 1;
			text = "";
		};
		
		class RscTrunkText : RscText
		{
			idc = -1;			
			text = "$STR_Trunk_TInventory";
			sizeEx = 0.04;
			
			x = 0.2984 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.196431 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class RscPlayerText : RscText
		{
			idc = -1;			
			text = "$STR_Trunk_PInventory";
			sizeEx = 0.04;
			
			x = 0.505169 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.196431 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};

		class TrunkGearBG: RscText
		{
			idc = -1;
			x = 0.2984 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.196431 * safezoneW;
			h = 0.319 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class PlayerGearBG: RscText
		{
			idc = -1;
			x = 0.505169 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.196431 * safezoneW;
			h = 0.319 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	
	class Controls
	{
		class TrunkGear : RscListBox
		{
			idc = 3502;
			text = "";
			
			x = 0.303569 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.186092 * safezoneW;
			h = 0.297 * safezoneH;
		};
		
		class PlayerGear : RscListBox
		{
			idc = 3503;
			text = "";
			
			x = 0.510338 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.186092 * safezoneW;
			h = 0.297 * safezoneH;
		};
		
		class TrunkEdit : RscEdit
		{
			idc = 3505;
			text = "1";			
			x = 0.2984 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0310154 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class PlayerEdit : RscEdit
		{
			idc = 3506;
			text = "1";			
			x = 0.505169 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0310154 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class TakeItem : RscButtonUC
		{
			idc = -1;
			text = "$STR_Trunk_Take";			
			onButtonClick = "[] call UnionClient_system_vehTakeItem;";
			x = 0.334585 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0775384 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 26) * 1)";
		};
		
		class TakeAllItems : RscButtonUC
		{
			idc = -1;
			text = "Взять все";			
			onButtonClick = "[true] call UnionClient_system_vehTakeItem;";
			x = 0.417293 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0775384 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 26) * 1)";
		};
		
		class StoreItem : RscButtonUC
		{
			idc = -1;
			text = "$STR_Trunk_Store";			
			onButtonClick = "[] call UnionClient_system_vehStoreItem;";
			x = 0.541354 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0775384 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 26) * 1)";
		};
		
		class StoreAllItems : RscButtonUC
		{
			idc = -1;
			text = "Положить все";			
			onButtonClick = "[true] call UnionClient_system_vehStoreItem;";
			x = 0.624062 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0775384 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 26) * 1)";
		};
		
		class ButtonClose : RscButtonUC {
			idc = -1;			
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.453477 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.0930461 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
	};
};