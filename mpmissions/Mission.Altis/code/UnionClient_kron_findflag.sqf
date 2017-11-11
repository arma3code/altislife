private["_in","_flg","_arr","_out"];
_in=_this select 0;
_flg=toUpper(_this select 1);
_arr=[_in] call UnionClient_kron_ArrayToUpper;
_out=_flg in _arr;
_out