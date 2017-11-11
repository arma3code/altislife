class UnionDialogDeliver {
	idd = 4300;
	name= "UnionDialogDeliver";
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
			idc = 4301;
			text = "";
			
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.033 * safezoneH;
			
			colorBackground[] = {0,0,0,0.8};
		};
	};
	
	class controls {

		class List : RscListBox 
		{
			idc = 4302;
			text = "";
			
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.198 * safezoneH;
			
			colorBackground[] = {0,0,0,0.8};
		};

		class GetButton : RscButtonUC {
			idc = 4303;			
			text = "Взять заказ";
			onButtonClick = "[] spawn UnionClient_delivery_getMission";
			
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
		};		
				
		class DoneButton : RscButtonUC {
			idc = 4304;			
			text = "Сдать заказ";
			onButtonClick = "[] spawn UnionClient_delivery_finishMission";
			
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class CloseButton : RscButtonUC {
			idc = -1;			
			text = "Закрыть";
			onButtonClick = "closedialog 0;";
			
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};