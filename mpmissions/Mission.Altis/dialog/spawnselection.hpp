class UnionDialogSpawnSelection
{
	idd = 38500;
	name = "UnionDialogSpawnSelection";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "[_this select 0] call UnionClient_gui_Tiles";
	
	class controlsBackground
	{
		class Tiles: RscTiles {};
		class Title : RscTitle
		{			
			idc = -1;
			text = "$STR_Spawn_Title";
			
			x = 0.257187 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.485625 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {1,1,1,0.2};
		};
		
		class SpawnPointTitle : Title
		{
			colorBackground[] = {0,0,0,0};
			idc = 38501;
			style = 1;
			text = "";
		};
		
		class MapView : RscMapControl 
		{
			idc = 38502;
			
			x = 0.434375 * safezoneW + safezoneX;
			y = 0.2256 * safezoneH + safezoneY;
			w = 0.308437 * safezoneW;
			h = 0.49 * safezoneH;
			
			maxSatelliteAlpha = 0.75;//0.75;
			alphaFadeStartScale = 1.15;//0.15;
			alphaFadeEndScale = 1.29;//0.29;
		};
	};
	
	class controls
	{	
		class SpawnPointList: RscListNBox
		{
			idc = 38510;
			text = "";
			sizeEx = 0.041;
			coloumns[] = {0,0,0.9};
			drawSideArrows = 0;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			
			x = 0.2585 * safezoneW + safezoneX;
			y = 0.2256 * safezoneH + safezoneY;
			w = 0.171937 * safezoneW;
			h = 0.49 * safezoneH;
			
			onLBSelChanged = "_this call UnionClient_spawn_PointSelected;";
		};
		
		class spawnButton : RscButtonMenu
		{
			idc = -1;			
			text = "$STR_Spawn_Spawn";
			onButtonClick = "[] spawn UnionClient_spawn_Confirm";
			
			x = 0.2585 * safezoneW + safezoneX;
			y = 0.724 * safezoneH + safezoneY;
			w = 0.171935 * safezoneW;
			h = 0.028 * safezoneH;
		};
	};
};