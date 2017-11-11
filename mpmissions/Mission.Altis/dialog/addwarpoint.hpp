class UnionDialogAddWarpoint {
	idd = 4400;
	name= "UnionDialogAddWarpoint";
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
			idc = 4401;
			text = "Создание точки военного положения";
			
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.022 * safezoneH;
			
			colorBackground[] = {0,0,0,1};
		};

		class MainBackground : RscText
		{			
			idc = -1;
			
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.154 * safezoneH;

			colorBackground[] = {0,0,0,0.5};
		};
	};
	
	class controls {

		class CoordTitle : RscText
		{
			idc = -1;			
			text = "Координаты:";
			sizeEx = 0.03;
			
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class xEdit : RscEdit 
		{
			idc = 4404;			
			text = "";
			colorBackground[] = {0,0,0,0.5};			
			
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class xyTitle : RscText
		{
			idc = -1;			
			text = "-";
			sizeEx = 0.03;
			
			x = 0.5 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class yEdit : RscEdit 
		{
			idc = 4405;			
			text = "";
			colorBackground[] = {0,0,0,0.5};			
			
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class PointName : RscText
		{
			idc = 4402;			
			text = "Название:";
			sizeEx = 0.03;
			
			x = 0.391719 * safezoneW + safezoneX;			
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class PointEdit : RscEdit 
		{
			idc = 4403;			
			text = "";
			colorBackground[] = {0,0,0,0.5};			
			
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class GetCoordButton : RscButtonUC {
			idc = -1;			
			text = "Карта";
			onButtonClick = "closedialog 0; [] spawn UnionClient_martiallaw_getWarPointCoord";
			
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class InfoText : RscStructuredText
		{
			idc = 4406;
			text = "<t size ='0.85'>Название будет отображаться в сообщении ГДЕ объявлено военное положение. Например: у дп 12, в районе Пиргоса, на алмазной шахте</t>";
			
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.055 * safezoneH;
		};	

		class AddButton : RscButtonUC {
			idc = -1;			
			text = "Добавить";
			onButtonClick = "[] spawn UnionClient_martiallaw_addWarPointToServer";
			
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
		};
				
		class CloseButton : RscButtonUC {
			idc = -1;			
			text = "Закрыть";
			onButtonClick = "closedialog 0;";
			
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};