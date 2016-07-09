_side = lac_playerSide;
private _players = [];
{
    if ((side _x == _side) && (isPlayer _x)) then {
        _players pushBack _x;
    };
} forEach playableUnits;

_players
