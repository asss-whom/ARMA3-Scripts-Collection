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
	简介：从头顶100米处向所有敌方载具发射一枚导弹
*/

{
    private _target = _x;
    if (side player getFriend side _target < 0.6) then {
        if (_target isKindOf "Land" || _target isKindOf "Ship") then {
            _missile = createVehicle ["ammo_Missile_Cruise_01", player modelToWorld [0, 0, 100], [], 0, "CAN_COLLIDE"];
            _missile setDir (player getDir _target);
            _missile setMissileTarget [_target, true];
        };
        if (_target isKindOf "Air") then {
            _missile = createVehicle ["ammo_Missile_mim145", player modelToWorld [0, 0, 100], [], 0, "CAN_COLLIDE"];
            _missile setDir (player getDir _target);
            _missile setMissileTarget [_target, true];
        };
    };
} forEach vehicles;

/*
	空战发射脚本v1.0
	作者：Asss_whom
	简介：从载具下方5米向所有敌方载具发射一枚导弹
*/
_jet = vehicle this;
{
    private _target = _x;
    if (side this getFriend side _target < 0.6) then {
        if (side this == blufor) then {
            if (_target isKindOf "Land" || _target isKindOf "Ship") then {
                _missile = createVehicle ["Missile_AGM_02_F", player modelToWorld [0, 0, -5], [], 0, "CAN_COLLIDE"];
                _missile setDir getDir _jet;
                _missile setMissileTarget [_target, true];
            };
            if (_target isKindOf "Air") then {
                _missile = createVehicle ["ammo_Missile_AMRAAM_D", player modelToWorld [0, 0, -5], [], 0, "CAN_COLLIDE"];
                _missile setDir getDir _jet;
                _missile setMissileTarget [_target, true];
            };
        };
        if (side this == opfor) then {
            if (_target isKindOf "Land" || _target isKindOf "Ship") then {
                _missile = createVehicle ["Missile_AGM_01_F", player modelToWorld [0, 0, -5], [], 0, "CAN_COLLIDE"];
                _missile setDir getDir _jet;
                _missile setMissileTarget [_target, true];
            };
            if (_target isKindOf "Air") then {
                _missile = createVehicle ["ammo_Missile_AA_R77", player modelToWorld [0, 0, -5], [], 0, "CAN_COLLIDE"];
                _missile setDir getDir _jet;
                _missile setMissileTarget [_target, true];
            };
        };
        if (side this == independent) then {
            if (_target isKindOf "Land" || _target isKindOf "Ship") then {
                _missile = createVehicle ["Missile_AGM_02_F", player modelToWorld [0, 0, -5], [], 0, "CAN_COLLIDE"];
                _missile setDir getDir _jet;
                _missile setMissileTarget [_target, true];
            };
            if (_target isKindOf "Air") then {
                _missile = createVehicle ["ammo_Missile_AMRAAM_C", player modelToWorld [0, 0, -5], [], 0, "CAN_COLLIDE"];
                _missile setDir getDir _jet;
                _missile setMissileTarget [_target, true];
            };
        };
    };
} forEach vehicles;
