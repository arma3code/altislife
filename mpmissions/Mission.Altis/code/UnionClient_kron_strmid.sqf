private["_in","_pos","_len","_arr","_i","_out"];
_in=_this select 0;
_pos=abs(_this select 1);
_arr=[_in] call UnionClient_kron_StrToArray;
_len=count(_arr);
if ((count _this)>2) then {_len=(_this select 2)};
_out="";
if ((_pos+_len)>=(count _arr)) then {_len=(count _arr)-_pos};
if (_len>0) then {
	for "_i" from _pos to (_pos+_len-1) do {
		_out=_out + (_arr select _i);
	};
};
_out