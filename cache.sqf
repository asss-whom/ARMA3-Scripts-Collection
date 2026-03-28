/*
	常用脚本v1.0
	作者：Asss_whom
	简介：最为常用的脚本合集
*/

/*===================================宙斯===================================*/
// 创建宙斯并添加所有可编辑物体
private _moduleGroup = createGroup sideLogic;
"ModuleCurator_F" createUnit [
	getPosATL player, 
	_moduleGroup, 
	"this setVariable ['BIS_fnc_initModules_disableAutoActivation', false, true]; BIS_Zeus = this"
];
bis_curator = player;
BIS_Zeus setvariable ["owner", "bis_curator"];
BIS_Zeus addCuratorEditableObjects [allMissionObjects "all", true];

// 查找所有宙斯模块
_zeus = (entities "Logic") select {_x iskindof "ModuleCurator_F"};
// 将任务编辑器中放置的全部对象添加至任务的所有宙斯操作者
{
	player assignCurator _x;
	_x addCuratorEditableObjects [allMissionObjects "all", true];
} forEach _zeus;

/*================================================单元控制/对象操作===========================================*/
// 为玩家主武器添加弹药
player addMagazines [primaryWeaponMagazine player select 0, 3];

// 启用/禁用模拟
player enableSimulation false;

// 启用/禁用伤害
player allowdamage false;

// 设置玩家移动速度(1为默认速度)
player setAnimSpeedCoef 1;

// 打开虚拟军火库
["Open", [true]] call BIS_fnc_arsenal;

// 打开虚拟载具库
["Open", true] call BIS_fnc_garage;

/*===================================耐力===================================*/
// 设置关闭耐力系统
player enableStamina false;

// 设置枪械后坐力与摇晃(0-1)
player setCustomAimCoef 0;
player setUnitRecoilCoefficient 0;

/*===================================数据链===================================*/
// 给所有敌方载具附加激光靶
{
    private _target = _x;
    if (side player getFriend side _target < 0.6) then {
        _laser = createVehicle ["LaserTargetW", getPosATL _target];
        _laser attachTo [_target, [0, 0, 1]];
        west reportRemoteTarget [_laser, 3600];
    };
} forEach vehicles;

// 向数据链通报所有载具
{ west reportRemoteTarget [_x, 3600]; } forEach vehicles;

// 强制小队知晓200米内所有敌人
_my_group = group player;
{
    private _obj = _x;
    if (side player getFriend side _obj < 0.6) then {
        _my_group reveal [_obj, 4];
    };
} forEach nearestObjects [player, ["CAManBase", "Air", "Ship", "LandVehicle"], 200];

/*===================================技能===================================*/
// 设置小队成员满技能
{ _x setSkill ["general", 1]; } forEach units player;

/*===================================火炮===================================*/
// 火炮定点打击多目标
[BIS_GUN, [BIS_TGT1, BIS_TGT2, BIS_TGT3], 5] spawn {
    params ["_gun", "_targets", "_rounds"];
    
    _gun addEventHandler ["Fired", { (_this select 0) setVehicleAmmo 1 }];
    private _mag = (getArtilleryAmmo [_gun]) select 0;
    {
        _gun doArtilleryFire [getPos _x, _mag, _rounds];
        waitUntil { sleep 0.5; unitReady gunner _gun };
    } forEach _targets;
};

// 火炮区域随机覆盖（左上 -> 右下）
[BIS_GUN, [POS_TL, POS_BR], 10] spawn {
    params ["_gun", "_area", "_rounds"];
    
    _gun addEventHandler ["Fired", { (_this select 0) setVehicleAmmo 1 }];
    private _mag = (getArtilleryAmmo [_gun]) select 0;
    
    private _tl = _area select 0;
    private _br = _area select 1;
    
    private _minX = (_tl select 0) min (_br select 0);
    private _maxX = (_tl select 0) max (_br select 0);
    private _minY = (_tl select 1) min (_br select 1);
    private _maxY = (_tl select 1) max (_br select 1);
    
    for "_i" from 1 to _rounds do {
        private _pos = [
            _minX + random (_maxX - _minX),
            _minY + random (_maxY - _minY),
            0
        ];
        
        _gun doArtilleryFire [_pos, _mag, 1];
        waitUntil { sleep 0.5; unitReady gunner _gun };
    };
};

// 添加230mm集束火箭弹
this removeMagazinesTurret ["12Rnd_230mm_rockets",[0]];
this removeWeaponTurret ["rockets_230mm_GAT",[0]];
this addMagazineTurret ["12Rnd_230mm_rockets_cluster",[0]];
this addWeaponTurret ["rockets_230mm_GAT",[0]];

// 加载弹药
this loadMagazine [[0], "weapon_VLS_01", "magazine_Missiles_Cruise_01_Cluster_x18"];
