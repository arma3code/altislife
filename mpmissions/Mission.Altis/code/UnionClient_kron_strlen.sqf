private["_in","_arr","_len"];
_in=_this select 0;
_arr=[_in] call UnionClient_kron_StrToArray;
_len=count (_arr);
_len