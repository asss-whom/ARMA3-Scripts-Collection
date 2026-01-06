/*
	导弹发射脚本v1.0
	作者：Asss_whom
	简介：简易的Mk41 VLS发射脚本，该脚本获取所有可用VLS并依次随机向OPFOR方载具发射一枚导弹。
*/

_all_vls = [];

{
    private _vls = _x;
    if (typeOf _vls == "B_Ship_MRLS_01_F") then {
        _all_vls pushBack _vls;
    };
} forEach vehicles;

_length = count _all_vls;
_i = 0;

{
    private _target = _x;
    if (side _target == opfor) then {
        _laser = createVehicle ["LaserTargetW", getPosATL _target];
        _laser attachTo [_target, [0, 0, 1]];
        west reportRemoteTarget [_laser, 3600];
        _vls = _all_vls select _i;
        _handle = _vls fireAtTarget [_laser, currentWeapon _vls];
        if (_handle) then {
            _i = _i + 1;
        };
        if (_i == _length) then {
            break;
        };
    };
} forEach vehicles;

/*
	导弹发射脚本v1.0
	作者：Asss_whom
	简介：从头顶50米处向所有OPFOR方单位发射一枚导弹
*/

{
    private _target = _x;
    if (side _target == opfor) then {
        if (_target isKindOf "Land" || _target isKindOf "Ship") then {
            _missile = createVehicle ["Missile_AGM_01_F", player modelToWorld [0, 0, 50], [], 0, "CAN_COLLIDE"];
            _missile setDir getDir player;
            _missile setMissileTarget [_target, true];
        };
        if (_target isKindOf "Air") then {
            _missile = createVehicle ["Missile_AA_03_F", player modelToWorld [0, 0, 50], [], 0, "CAN_COLLIDE"];
            _missile setDir getDir player;
            _missile setMissileTarget [_target, true];
        };
    };
} forEach allMissionObjects "All";
