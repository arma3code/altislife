class UnionDialogManageWarPoint {
	idd = 4500;
	name= "UnionDialogManageWarPoint";
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
		
		class Title : RscTitle {			
			idc = 4501;
			text = "Точки военного положения";
			
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.283594 * safezoneW;
			h = 0.022 * safezoneH;
			
			colorBackground[] = {0,0,0,1};
		};

		class MainBackground : RscText
		{			
			idc = -1;
			
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.283594 * safezoneW;
			h = 0.242 * safezoneH;

			colorBackground[] = {0,0,0,0.5};
		};
	};
	
	class controls {

		class PointsList : RscListBox 
		{
			idc = 4502;
			text = "";		
			
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.22 * safezoneH;
		};

		class addButton : RscButtonUC {
			idc = -1;			
			text = "Добавить";
			onButtonClick = "closedialog 0; createDialog ""UnionDialogAddWarpoint""";
			
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class removeButton : RscButtonUC {
			idc = 4503;			
			text = "Удалить";
			onButtonClick = "[] call UnionClient_martiallaw_removeWarPointFromServer";
			
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
				
		class CloseButton : RscButtonUC {
			idc = -1;			
			text = "Закрыть";
			onButtonClick = "closedialog 0;";
			
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};