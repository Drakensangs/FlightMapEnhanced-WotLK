-- Simplified Chinese localisation

if (GetLocale() == "zhCN") then

BINDING_HEADER_FLIGHTMAP = "飞行地图";
BINDING_NAME_FLIGHTMAP   = "显示飞行地图";

FLIGHTMAP_NAME          = "飞行地图";
FLIGHTMAP_DESCRIPTION   = "在世界地图上显示飞行路线";
FLIGHTMAP_ALLIANCE      = "联盟";
FLIGHTMAP_HORDE         = "部落";
FLIGHTMAP_CONTESTED     = "争夺中";
FLIGHTMAP_NEUTRAL       = "中立";

-- General strings
FLIGHTMAP_TIMING        = "(计时)";
FLIGHTMAP_LEVELS        = "等级范围: %d - %d";
FLIGHTMAP_NOFLIGHTS     = "没有已知的飞行点!";
FLIGHTMAP_NOT_KNOWN     = "(未知)";
FLIGHTMAP_NO_COST       = "免费";
FLIGHTMAP_MONEY_GOLD    = "金";
FLIGHTMAP_MONEY_SILVER  = "银";
FLIGHTMAP_MONEY_COPPER  = "铜";
FLIGHTMAP_FLIGHTTIME    = "飞行时间: ";
FLIGHTMAP_QUICKEST      = "最快路线";
FLIGHTMAP_TOTAL_TIME    = "总计时间";
FLIGHTMAP_VIA           = "经由 ";
FLIGHTMAP_CONFIRM       = "你确定要飞往 %s 吗?%s";
FLIGHTMAP_CONFIRM_TIME  = " 此次飞行将耗时 ";

-- Command strings
FLIGHTMAP_RESET         = "重置";
FLIGHTMAP_SHOWMAP       = "打开";
FLIGHTMAP_LOCKTIMES     = "锁定";
FLIGHTMAP_TIMER_HELP    = "按住 SHIFT 键并拖动计时条以重新定位。";

-- Option strings
FLIGHTMAP_OPTIONS_CLOSE = "关闭";
FLIGHTMAP_OPTIONS_TITLE = "飞行地图";

FLIGHTMAP_OPT_SHOW_PATHS                = "飞行路线";
FLIGHTMAP_OPT_SHOW_PATHS_TIP            = "在世界地图上绘制飞行路线。";
FLIGHTMAP_OPT_SHOW_POIS                 = "飞行管理员图标";
FLIGHTMAP_OPT_SHOW_POIS_TIP             = "在世界地图上显示飞行管理员的额外图标。";
FLIGHTMAP_OPT_SHOW_ALL_INFO             = "显示所有信息";
FLIGHTMAP_OPT_SHOW_ALL_INFO_TIP         = "显示所有数据，包括未访问的飞行管理员。";
FLIGHTMAP_OPT_USE_TIMER                 = "飞行计时器";
FLIGHTMAP_OPT_USE_TIMER_TIP             = "启用/禁用飞行时长指示器。";
FLIGHTMAP_OPT_SHOW_DESTINATIONS         = "显示目的地";
FLIGHTMAP_OPT_SHOW_DESTINATIONS_TIP     = "在提示框中显示飞行目的地。";
FLIGHTMAP_OPT_SHOW_MULTI_HOP            = "包括中转飞行";
FLIGHTMAP_OPT_SHOW_MULTI_HOP_TIP        = "在提示框中显示中转飞行目的地。";
FLIGHTMAP_OPT_SHOW_TIMES                = "显示飞行时间";
FLIGHTMAP_OPT_SHOW_TIMES_TIP            = "在提示框中显示飞行时间。";
FLIGHTMAP_OPT_SHOW_COSTS                = "显示飞行费用";
FLIGHTMAP_OPT_SHOW_COSTS_TIP            = "在提示框中显示飞行费用。";
FLIGHTMAP_OPT_FULL_TAXI_MAP             = "增强飞行窗口";
FLIGHTMAP_OPT_FULL_TAXI_MAP_TIP         = "在飞行选择窗口中显示飞行网络。";
FLIGHTMAP_OPT_CONFIRM_FLIGHTS           = "确认飞行";
FLIGHTMAP_OPT_CONFIRM_FLIGHTS_TIP       = "乘坐飞行前请求确认。";
FLIGHTMAP_OPT_SHOW_ZONE_TOOLTIP         = "显示区域提示框";
FLIGHTMAP_OPT_SHOW_ZONE_TOOLTIP_TIP     = "在世界地图左下角显示鼠标悬停区域的飞行信息。";
FLIGHTMAP_OPT_SHOW_ZONE_LEVELS          = "显示区域等级范围";
FLIGHTMAP_OPT_SHOW_ZONE_LEVELS_TIP      = "在区域提示框中显示每个区域的推荐等级范围。";
FLIGHTMAP_OPT_AWESOME_SEPARATOR         = "awesome_wotlk:";
FLIGHTMAP_OPT_NOTIFY_TASKBAR            = "通知：任务栏图标";
FLIGHTMAP_OPT_NOTIFY_TASKBAR_TIP        = "降落时闪烁 WoW 任务栏图标。需要 awesome_wotlk (AwesomeCVar)。";
FLIGHTMAP_OPT_TOOLTIP_FONT_SIZE         = "提示框字体大小";
FLIGHTMAP_OPT_TOOLTIP_FONT_SIZE_TIP     = "调整区域提示框的字体大小。";
FLIGHTMAP_OPT_MAX_TOOLTIP_LINES         = "提示框最大行数";
FLIGHTMAP_OPT_MAX_TOOLTIP_LINES_TIP     = "区域提示框中显示的最大行数。";
FLIGHTMAP_OPT_SHOW_FM_CONTINENT         = "飞行管理员大陆图标";
FLIGHTMAP_OPT_SHOW_FM_CONTINENT_TIP     = "在大陆地图上显示飞行管理员图标。";
FLIGHTMAP_OPT_SHOW_FM_CLASS             = "职业专属飞行管理员图标";
FLIGHTMAP_OPT_SHOW_FM_CLASS_TIP         = "显示职业专属飞行管理员图标。";
FLIGHTMAP_OPT_SHOW_FM_TOOLTIP           = "飞行管理员提示框";
FLIGHTMAP_OPT_SHOW_FM_TOOLTIP_TIP       = "鼠标悬停在飞行管理员图标上时显示包含飞行信息的提示框。";
FLIGHTMAP_OPT_LOCK_FLIGHT_TIMES         = "锁定飞行时间";
FLIGHTMAP_OPT_LOCK_FLIGHT_TIMES_TIP     = "阻止插件将新的或不同的飞行数据写入 savedvariables。";

-- Minimap button tooltip strings
FLIGHTMAP_OPT_SHOW_MINIMAP_BUTTON       = "小地图按钮";
FLIGHTMAP_OPT_SHOW_MINIMAP_BUTTON_TIP   = "在小地图上显示 FlightMap 按钮。";
FLIGHTMAP_MINIMAP_TIP1                  = "左键单击以打开 FlightMap 选项。";
FLIGHTMAP_MINIMAP_TIP2                  = "按住右键以移动小地图按钮。";
FLIGHTMAP_MINIMAP_TIP3                  = "Ctrl+左键单击以打开飞行地图。";
FLIGHTMAP_MINIMAP_TIP4                  = "Shift+左键单击以重置计时条位置。";

-- These constants determine how "Town, Zone" strings look.
-- SEP_STRING is what separates Town from Zone.  SEP_POSTAMBLE
-- is anything that is after Zone.
FLIGHTMAP_SEP_STRING    = "，";
FLIGHTMAP_SEP_POSTAMBLE = "";

end
