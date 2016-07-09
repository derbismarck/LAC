//Generates a uniformly random position inside a trigger with a specific major and minor axis with some rotation theta (in bearing, not trigonometric form)
//[trigger] call LAC_fnc_randPos;
private ["_xSize","_ySize","_azi","_isRect","_theta","_xF","_yF"];
params ["_trig"];
_xSize = (triggerArea _trig) select 0;
_ySize = (triggerArea _trig) select 1;
_azi = (triggerArea _trig) select 2;
_isRect = (triggerArea _trig) select 3;

_theta = ((-_azi) + 3600) mod 360;

if (_isRect) then {
	_x1 = (random 1) - 0.5;
	_y1 = (random 1) - 0.5;
	_x2 = _x1 * _xSize * 2;
	_y2 = _y1 * _ySize * 2;
	_xF = (_x2 * cos(_theta)) - (_y2 * sin(_theta));
	_yF = (_x2 * sin(_theta)) + (_y2 * cos(_theta));
} else {
	_r = sqrt (random 1);
	_ang = random 360;
	_x1 = _r * cos(_ang);
	_y1 = _r * sin(_ang);
	_x2 = _x1 * _xSize;
	_y2 = _y1 * _ySize;
	_xF = (_x2 * cos(_theta)) - (_y2 * sin(_theta));
	_yF = (_x2 * sin(_theta)) + (_y2 * cos(_theta));
};

_pos = [_xF + ((getPos _trig) select 0), _yF + ((getPos _trig) select 1), 0];

_pos;
