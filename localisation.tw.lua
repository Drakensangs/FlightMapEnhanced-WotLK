-- Traditional Chinese localisation

if (GetLocale() == "zhTW") then

BINDING_HEADER_FLIGHTMAP = "飛行地圖";
BINDING_NAME_FLIGHTMAP   = "顯示飛行地圖";

FLIGHTMAP_NAME          = "飛行地圖";
FLIGHTMAP_DESCRIPTION   = "在世界地圖上顯示飛行路線資訊";
FLIGHTMAP_ALLIANCE      = "聯盟";
FLIGHTMAP_HORDE         = "部落";
FLIGHTMAP_CONTESTED     = "爭奪中";
FLIGHTMAP_NEUTRAL       = "中立地區";

-- General strings
FLIGHTMAP_TIMING        = "(計時中)";
FLIGHTMAP_LEVELS        = "等級 %d - %d";
FLIGHTMAP_NOFLIGHTS     = "沒有已知的飛行點!";
FLIGHTMAP_NOT_KNOWN     = "(未開啟)";
FLIGHTMAP_NO_COST       = "免費";
FLIGHTMAP_MONEY_GOLD    = "金";
FLIGHTMAP_MONEY_SILVER  = "銀";
FLIGHTMAP_MONEY_COPPER  = "銅";
FLIGHTMAP_FLIGHTTIME    = "飛行時間: ";
FLIGHTMAP_QUICKEST      = "最快路線";
FLIGHTMAP_TOTAL_TIME    = "總計時間";
FLIGHTMAP_VIA           = "經由 ";
FLIGHTMAP_CONFIRM       = "你確定要飛往 %s 嗎?%s";
FLIGHTMAP_CONFIRM_TIME  = " 此次飛行將耗時 ";

-- Command strings
FLIGHTMAP_RESET         = "重設";
FLIGHTMAP_SHOWMAP       = "開啟";
FLIGHTMAP_LOCKTIMES     = "鎖住";
FLIGHTMAP_TIMER_HELP    = "按住 SHIFT 鍵並拖曳計時列以重新定位。";

-- Option strings
FLIGHTMAP_OPTIONS_CLOSE = "關閉";
FLIGHTMAP_OPTIONS_TITLE = "飛行地圖";

FLIGHTMAP_OPT_SHOW_PATHS                = "飛行路線";
FLIGHTMAP_OPT_SHOW_PATHS_TIP            = "在世界地圖上繪製飛行路線。";
FLIGHTMAP_OPT_SHOW_POIS                 = "管理員圖示";
FLIGHTMAP_OPT_SHOW_POIS_TIP             = "在世界地圖上顯示飛行管理員的額外圖示。";
FLIGHTMAP_OPT_SHOW_ALL_INFO             = "顯示未知飛行點";
FLIGHTMAP_OPT_SHOW_ALL_INFO_TIP         = "顯示所有資料，包括未訪問的飛行管理員。";
FLIGHTMAP_OPT_USE_TIMER                 = "飛行計時器顯示";
FLIGHTMAP_OPT_USE_TIMER_TIP             = "啟用/停用飛行時長指示器。";
FLIGHTMAP_OPT_SHOW_DESTINATIONS         = "顯示目的地";
FLIGHTMAP_OPT_SHOW_DESTINATIONS_TIP     = "在提示框中顯示飛行目的地。";
FLIGHTMAP_OPT_SHOW_MULTI_HOP            = "包含轉運點";
FLIGHTMAP_OPT_SHOW_MULTI_HOP_TIP        = "在提示框中顯示轉運飛行目的地。";
FLIGHTMAP_OPT_SHOW_TIMES                = "顯示飛行時間";
FLIGHTMAP_OPT_SHOW_TIMES_TIP            = "在提示框中顯示飛行時間。";
FLIGHTMAP_OPT_SHOW_COSTS                = "顯示飛行費用";
FLIGHTMAP_OPT_SHOW_COSTS_TIP            = "在提示框中顯示飛行費用。";
FLIGHTMAP_OPT_FULL_TAXI_MAP             = "全飛行地圖";
FLIGHTMAP_OPT_FULL_TAXI_MAP_TIP         = "在飛行選擇視窗中顯示飛行網路。";
FLIGHTMAP_OPT_CONFIRM_FLIGHTS           = "確認飛行路線";
FLIGHTMAP_OPT_CONFIRM_FLIGHTS_TIP       = "搭乘飛行前請求確認。";
FLIGHTMAP_OPT_SHOW_ZONE_TOOLTIP         = "顯示區域提示框";
FLIGHTMAP_OPT_SHOW_ZONE_TOOLTIP_TIP     = "在世界地圖左下角顯示滑鼠懸停區域的飛行資訊。";
FLIGHTMAP_OPT_SHOW_ZONE_LEVELS          = "顯示區域等級範圍";
FLIGHTMAP_OPT_SHOW_ZONE_LEVELS_TIP      = "在區域提示框中顯示每個區域的建議等級範圍。";
FLIGHTMAP_OPT_AWESOME_SEPARATOR         = "awesome_wotlk:";
FLIGHTMAP_OPT_NOTIFY_TASKBAR            = "通知：工作列圖示";
FLIGHTMAP_OPT_NOTIFY_TASKBAR_TIP        = "降落時閃爍 WoW 工作列圖示。需要 awesome_wotlk (AwesomeCVar)。";
FLIGHTMAP_OPT_TOOLTIP_FONT_SIZE         = "提示框字體大小";
FLIGHTMAP_OPT_TOOLTIP_FONT_SIZE_TIP     = "調整區域提示框的字體大小。";
FLIGHTMAP_OPT_MAX_TOOLTIP_LINES         = "提示框最大行數";
FLIGHTMAP_OPT_MAX_TOOLTIP_LINES_TIP     = "區域提示框中顯示的最大行數。";
FLIGHTMAP_OPT_SHOW_FM_CONTINENT         = "飛行管理員大陸圖示";
FLIGHTMAP_OPT_SHOW_FM_CONTINENT_TIP     = "在大陸地圖上顯示飛行管理員圖示。";
FLIGHTMAP_OPT_SHOW_FM_CLASS             = "職業專屬飛行管理員圖示";
FLIGHTMAP_OPT_SHOW_FM_CLASS_TIP         = "顯示職業專屬飛行管理員圖示。";
FLIGHTMAP_OPT_SHOW_FM_TOOLTIP           = "飛行管理員提示框";
FLIGHTMAP_OPT_SHOW_FM_TOOLTIP_TIP       = "滑鼠懸停在飛行管理員圖示上時顯示包含飛行資訊的提示框。";
FLIGHTMAP_OPT_LOCK_FLIGHT_TIMES         = "鎖定飛行時間";
FLIGHTMAP_OPT_LOCK_FLIGHT_TIMES_TIP     = "阻止插件將新的或不同的飛行數據寫入 savedvariables。";

-- Minimap button tooltip strings
FLIGHTMAP_OPT_SHOW_MINIMAP_BUTTON       = "小地圖按鈕";
FLIGHTMAP_OPT_SHOW_MINIMAP_BUTTON_TIP   = "在小地圖上顯示 FlightMap 按鈕。";
FLIGHTMAP_MINIMAP_TIP1                  = "左鍵單擊以開啟 FlightMap 選項。";
FLIGHTMAP_MINIMAP_TIP2                  = "按住右鍵以移動小地圖按鈕。";
FLIGHTMAP_MINIMAP_TIP3                  = "Ctrl+左鍵單擊以開啟飛行地圖。";
FLIGHTMAP_MINIMAP_TIP4                  = "Shift+左鍵單擊以重設計時列位置。";

-- These constants determine how "Town, Zone" strings look.
-- SEP_STRING is what separates Town from Zone.  SEP_POSTAMBLE
-- is anything that is after Zone.
FLIGHTMAP_SEP_STRING    = "，";
FLIGHTMAP_SEP_POSTAMBLE = "";

end
