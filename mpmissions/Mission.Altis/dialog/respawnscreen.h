class UnionDialogRespawnScreen {
	idd = 4700;
	name = "UnionDialogRespawnScreen";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call UnionClient_gui_Tiles";
	
	class controlsBackground {
		class DeathPicture: RscPicture {
			idc = -1;
			text = "";
			x = 0;
			y = 0;
			w = 1;
			h = 1;
			colorBackground[] = {0,0,0,1};
		};

		class Tiles: RscTiles {};
	};
	
	class Controls {
		class status : RscStructuredText {
			idc = 4701;
			colorBackground[] = {0,0,0,0};
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.381563 * safezoneW;
			h = 0.066 * safezoneH;
		};

		class RespawnBtn : RscButtonUC {
			idc = 4702;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.033 * safezoneH;
			text = "Воскреснуть";			
			onButtonClick = "closeDialog 0; life_respawned = true; [] call UnionClient_spawn_Menu;";
		};			
	};
};