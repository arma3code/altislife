/*
	File: initServer.sqf

	Description:
	Starts the initialization of the server.
*/
if(!(_this select 0)) exitWith {}; //Not server
[] call compile PreprocessFileLineNumbers "\UnionServer\init.sqf";