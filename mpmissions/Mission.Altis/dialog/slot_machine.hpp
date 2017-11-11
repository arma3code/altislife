#define GUI_GRID_X    (0)
#define GUI_GRID_Y    (0)
#define GUI_GRID_W    (0.025)
#define GUI_GRID_H    (0.04)
#define GUI_GRID_WAbs    (1)
#define GUI_GRID_HAbs    (1)

class UnionDialogSlotMachine
{
	idd = 5780;
	name= "UnionDialogSlotMachine";
	movingEnabled = 0;
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
	
		class RscFrame_1800: RscText
		{
			idc = 5770;
			colorBackground[] = {0,0,0,0.7};
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 40 * GUI_GRID_W;
			h = 20 * GUI_GRID_H;
		};
		
		
		class RscText_1003: RscText
		{
			idc = 5783;
			text = "Ставка"; //--- ToDo: Localize;
			x = 5 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1004: RscText
		{
			idc = 5784;
			text = "Ставка"; //--- ToDo: Localize;
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1005: RscText
		{
			idc = 5786;
			text = "Ставка"; //--- ToDo: Localize;
			x = 22 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1006: RscText
		{
			idc = 5787;
			text = "Ставка"; //--- ToDo: Localize;
			x = 31 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class RscText_1002: RscText
		{
			idc = 5776;
			text = "Игровой автомат"; //--- ToDo: Localize;
			x = 8 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
			sizeEx = 3 * GUI_GRID_H;
		};
		
	};
	
	class controls
	{
	
		class SLOT_1: RscPicture
		{
			idc = 5771;
			text = "\union_pack\pictures\slot\slot.paa";
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 9 * GUI_GRID_H;
		};
		class SLOT_2: RscPicture
		{
			idc = 5772;
			text = "\union_pack\pictures\slot\slot.paa";
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 9 * GUI_GRID_H;
		};
		class SLOT_3: RscPicture
		{
			idc = 5773;
			text = "\union_pack\pictures\slot\slot.paa";
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 9 * GUI_GRID_H;
		};
				
		class EXIT_BTN: RscButtonMenu
		{
			idc = -1;
			text = "Выход"; //--- ToDo: Localize;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0;";
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 20.1 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class BET_5K: RscButtonMenu
		{
			idc = 5778;
			text = "$500"; //--- ToDo: Localize;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[500] spawn UnionClient_system_slotSpin;";
			x = 5 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class BET_50K: RscButtonMenu
		{
			idc = 5779;
			text = "$5000"; //--- ToDo: Localize;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[5000] spawn UnionClient_system_slotSpin;";
			x = 31 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class BET_25K: RscButtonMenu
		{
			idc = 5781;
			text = "$2500"; //--- ToDo: Localize;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[2500] spawn UnionClient_system_slotSpin;";
			x = 22 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class BET_10K: RscButtonMenu
		{
			idc = 5782;
			text = "$1000"; //--- ToDo: Localize;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[1000] spawn UnionClient_system_slotSpin;";
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		
	};
};