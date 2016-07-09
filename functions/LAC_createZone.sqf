// 0 = [thisTrigger,east,[4,2]] spawn LAC_fnc_createZone; //four fireteams, two squads
// Param 0 - thisTrigger
// Param 1 - side // (west, east, resistance)
// Param 2-0 - number of fireteam-sized groups to spawn
// Param 2-1 - number of squad-sized groups to spawn

// VEHICLES NOT CURRENTLY SUPPORTED

params ["_trigger","_side","_infArray"];
private _fireteamCount = _infArray select 0;
private _squadCount = _infArray select 1;

for "_i" from 1 to _fireteamCount do {
    private _pos = [0,0,0];
    while {surfaceIsWater _pos || _pos isEqualTo [0,0,0]} do {
        _pos = [_trigger] call LAC_fnc_randPos;
    };
    [_side,_pos,"fireteam"] call LAC_fnc_createGroup;
};

for "_i" from 1 to _squadCount do {
    private _pos = [0,0,0];
    while {surfaceIsWater _pos || _pos isEqualTo [0,0,0]} do {
        _pos = [_trigger] call LAC_fnc_randPos;
    };
    [_side,_pos,"squad"] call LAC_fnc_createGroup;
};
