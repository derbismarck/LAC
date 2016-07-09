params ["_group"];

while {({alive _x} count (units _group)) > 0} do {
    //do distance check
    _players = [] call LAC_fnc_getPlayers;
    _n = [_group,_players] call LAC_fnc_nearestPlayer; _nearest = _n select 0; _nearestPlayer = _n select 1;

    if (_group getVariable "LAC_lvar_isReduced") then {
        //check for reasons to doBuild
        if (_nearest < lac_cache_range_nlos) then {
            [_group] call LAC_fnc_doBuild;
        };

        if ((_nearest > lac_cache_range_nlos) && lac_cache_nlos) then { //nearest player is inside of min LOS cache range, but outside of min NLOS cache range
            private _nearPlayers = [];  //all players inside of lac_cache_range_los distance
            {
                if ((_x distance2D (leader _group)) < lac_cache_range_los) then {
                    _nearPlayers pushBack _x;
                };
            } forEach _players;
            private _los = false;
            {
                _pos1 = ATLtoASL [(getPos _x) select 0,(getPos _x) select 1, ((getPos _x) select 2) + 3];
                _pos2 = ATLtoASL [(getPos (leader _group)) select 0,(getPos (leader _group)) select 1, ((getPos (leader _group)) select 2) + 15];
                if !(_los) then {
                    if ([vehicle _x,"VIEW"] checkVisibility [_pos1,_pos2] > 0) then {_los = true};
                };
            } forEach _nearPlayers;
            if (_los) then {   //players can soon see the leader, build the group
                [_group] call LAC_fnc_doBuild;
            };
        };
    };

    if !(_group getVariable "LAC_lvar_isReduced") then {
        //check for reasons to doReduce
        if (_nearest > lac_cache_range_los) then {  //nearest player is outside of min LOS cache range
            [_group] call LAC_fnc_doReduce;
        } else {
            if ((_nearest > lac_cache_range_nlos) && lac_cache_nlos) then { //nearest player is inside of min LOS cache range, but outside of min NLOS cache range
                private _nearPlayers = [];  //all players inside of lac_cache_range_los distance
                {
                    if ((_x distance2D (leader _group)) < lac_cache_range_los) then {
                        _nearPlayers pushBack _x;
                    };
                } forEach _players;
                private _los = false;
                {
                    _pos1 = ATLtoASL [(getPos _x) select 0,(getPos _x) select 1, ((getPos _x) select 2) + 3];
                    _pos2 = ATLtoASL [(getPos (leader _group)) select 0,(getPos (leader _group)) select 1, ((getPos (leader _group)) select 2) + 15];
                    if !(_los) then {
                        if ([vehicle _x,"VIEW"] checkVisibility [_pos1,_pos2] > 0) then {_los = true};
                    };
                } forEach _nearPlayers;
                if !(_los) then {   //no players can see the leader, reduce the group
                    [_group] call LAC_fnc_doReduce;
                };
            };
        };
    };

    _vel = vectorMagnitude (velocity _nearestPlayer);
    if (_vel > 50) then {sleep 5} else {
        sleep (60 - ((11 * _vel) / 10)); //line from [0,60] to [50,5]
        //sleep longer if nearest player is moving slower
    };
};
