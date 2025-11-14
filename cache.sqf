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

/*===================================耐力===================================*/
// 设置关闭耐力系统
player enableStamina false;

// 设置枪械后坐力与摇晃(0-1)
player setCustomAimCoef 0;
player setUnitRecoilCoefficient 0;
