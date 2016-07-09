params ["_group","_players"];
private _nearest = 50000;
private _nearestPlayer = objNull;
{
    _distance = (leader _group) distance2D _x;
    if (_distance < _nearest) then {_nearest = _distance};
    _nearestPlayer = _x;
} forEach _players;
[_nearest,_nearestPlayer]
