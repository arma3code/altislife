/*

	Filename: 	UnionClient_delivery_price.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/

*/
#include "..\script_macros.hpp"
params [
	["_from","",[""]],
	["_to","",[""]],
	["_vehicle","",[""]]
];

if (EQUAL(_from,"") OR EQUAL(_to,"") OR EQUAL(_vehicle,"")) exitWith {0};

private _price = switch (_from) do {
	case "depo_kavala": {
		switch (_to) do {
			case "depo_molos": {35000}; //+
			case "depo_mazi": {35000}; //+
			case "depo_tonos": {21875}; //+
		};
	};
	case "depo_molos": {
		switch (_to) do {
			case "depo_kavala": {35000}; //+
			case "depo_mazi": {24500}; //+
			case "depo_tonos": {21875}; //+
		};
	};
	case "depo_mazi": {
		switch (_to) do {
			case "depo_kavala": {35000}; //+
			case "depo_molos": {24500}; //+
			case "depo_tonos": {24500}; //+
		};
	};
	case "depo_tonos": {
		switch (_to) do {
			case "depo_kavala": {21875}; //+
			case "depo_molos": {21875}; //+
			case "depo_mazi": {24500}; //+
		};
	};
};

switch (_vehicle) do {
	case "C_Offroad_01_F": {_price = round (_price / 3)};
	case "C_Van_01_transport_F": {_price = round (_price / 2)};
};

_price;