params ["_group","_trigger"];

_curPos = getPos leader _group;
_trigPos = getPos _trigger;
_distance = _curPos distance2D _trigger;
private _pos = [0,0,0];

switch (floor random 3) do {
    case 0: {   //random position
        while {surfaceIsWater _pos || _pos isEqualTo [0,0,0]} do {
            _pos = [_trigger] call LAC_fnc_randPos;
        };
    };
    case 1: {   //around one way
        _theta = random 60;
        _x = (_trigPos select 0) - (_curPos select 0);
        _y = (_trigPos select 1) - (_curPos select 1);
        _nx = (_x * cos(_theta)) - (_y * sin(_theta));
        _ny = (_x * sin(_theta)) + (_y * cos(_theta));
        _pos = [(_trigPos select 0) + _nx, (_trigPos select 1) + _ny, 0];
    };
    case 2: {   //around other way
        _theta = - random 60;
        _x = (_trigPos select 0) - (_curPos select 0);
        _y = (_trigPos select 1) - (_curPos select 1);
        _nx = (_x * cos(_theta)) - (_y * sin(_theta));
        _ny = (_x * sin(_theta)) + (_y * cos(_theta));
        _pos = [(_trigPos select 0) + _nx, (_trigPos select 1) + _ny, 0];
    };
};

if (surfaceIsWater _pos) then {
    [_group,_trigger] call LAC_fnc_doPatrol;    //retry if surfaceIsWater
} else {
    _wp = _group addWaypoint [_pos,0];
    _wp setWaypointFormation "COLUMN";
    _wp setWaypointStatements ['true','_trg = (group this) getVariable ''LAC_lvar_trigger''; [group this, _trg] call LAC_fnc_doPatrol;'];
};
