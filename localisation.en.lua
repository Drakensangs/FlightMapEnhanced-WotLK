-- Translatable strings, English (and default) version

BINDING_HEADER_FLIGHTMAP = "FlightMap";
BINDING_NAME_FLIGHTMAP   = "Show flight map";

FLIGHTMAP_NAME          = "FlightMap";
FLIGHTMAP_DESCRIPTION   = "Flight path info on the World Map";
FLIGHTMAP_ALLIANCE      = "Alliance";
FLIGHTMAP_HORDE         = "Horde";
FLIGHTMAP_CONTESTED     = "Contested";
FLIGHTMAP_NEUTRAL       = "Neutral";

-- General strings
FLIGHTMAP_TIMING        = "(timing)";
FLIGHTMAP_LEVELS        = "Levels %d - %d";
FLIGHTMAP_NOFLIGHTS     = "None known!";
FLIGHTMAP_NOT_KNOWN     = "(Not known)";
FLIGHTMAP_NO_COST       = "Free";
FLIGHTMAP_MONEY_GOLD    = "g";
FLIGHTMAP_MONEY_SILVER  = "s";
FLIGHTMAP_MONEY_COPPER  = "c";
FLIGHTMAP_FLIGHTTIME    = "Flight time: ";
FLIGHTMAP_QUICKEST      = "Fastest route";
FLIGHTMAP_TOTAL_TIME    = "Total time";
FLIGHTMAP_VIA           = "Via ";
FLIGHTMAP_CONFIRM       = "Are you sure you wish to fly to %s?%s";
FLIGHTMAP_CONFIRM_TIME  = " This flight will take ";

-- Command strings
FLIGHTMAP_RESET         = "reset";
FLIGHTMAP_SHOWMAP       = "open";
FLIGHTMAP_LOCKTIMES     = "lock";
FLIGHTMAP_GETHELP       = "help";   -- TODO translate

-- Help text        TODO translate
FLIGHTMAP_TIMER_HELP    =
    "Hold down SHIFT and drag the timer bar to reposition.";
FLIGHTMAP_SUBCOMMANDS   = {
    [FLIGHTMAP_RESET]       = "Reset timer bar position",
    [FLIGHTMAP_SHOWMAP]     = "Open flight map window",
    [FLIGHTMAP_GETHELP]     = "Show this text",
};

-- Locked/unlocked status
FLIGHTMAP_TIMESLOCKED   = {
    [true] = "Flight times will no longer be recorded.",
    [false] = "Flight times will now be recorded.",
};

-- Option strings
FLIGHTMAP_OPTIONS_CLOSE = "Close";
FLIGHTMAP_OPTIONS_TITLE = "FlightMap";
FLIGHTMAP_OPTIONS = {};
FLIGHTMAP_OPTIONS[1] = {   -- Option 1: flight path lines
    label = "Flight path lines",
    option = "showPaths",
    tooltip = "Draw lines on the world map for flight paths.",
};
FLIGHTMAP_OPTIONS[2] = {   -- Option 2: extra POI buttons
    label = "Flight master icons",
    option = "showPOIs",
    tooltip = "Show extra world map icons for flight masters.",
};
FLIGHTMAP_OPTIONS[3] = {   -- Option 3: Unknown masters
    label = "Show unknown flights",
    option = "showAllInfo",
    tooltip = "Show all data, even for unvisited flight masters.",
};
FLIGHTMAP_OPTIONS[4] = {   -- Option 5: flight timers
    label = "In-flight timers",
    option = "useTimer",
    tooltip = "Enable/disable the flight duration meter.",
};

FLIGHTMAP_OPTIONS[5] = {   -- Option 6: Show flight destinations
    label = "Show destinations",
    option = "showDestinations",
    tooltip = "Show flight destinations on tooltips",
    children = {6, 7, 8},
};
FLIGHTMAP_OPTIONS[6] = {   -- Option 7: Show multi-hop destinations
    label = "Including multi-hop",
    option = "showMultiHop",
    tooltip = "Show multi-hop destinations on tooltips",
};
FLIGHTMAP_OPTIONS[7] = {   -- Option 8: Show flight times
    label = "With flight times",
    option = "showTimes",
    tooltip = "Show flight times on tooltips.",
};
FLIGHTMAP_OPTIONS[8] = {   -- Option 9: Show flight costs
    label = "With flight costs",
    option = "showCosts",
    tooltip = "Show flight costs on tooltips.",
};
FLIGHTMAP_OPTIONS[9] = {   -- Option 10: Taxi window extras
    label = "Enhanced flight window",
    option = "fullTaxiMap",
    tooltip = "Show flight network on flight selection window",
};
FLIGHTMAP_OPTIONS[10] = {   -- Option 11: Confirm flight destinations
    label = "Confirm flights",
    option = "confirmFlights",
    tooltip = "Prompt for confirmation before taking a flight",
};

-- Options panel: zone tooltip / marker tooltip settings
FLIGHTMAP_OPT_SHOW_ZONE_TOOLTIP         = "Show zone tooltip";
FLIGHTMAP_OPT_SHOW_ZONE_TOOLTIP_TIP     = "Show flight information for the hovered zone in the lower left corner of the world map.";
FLIGHTMAP_OPT_SHOW_ZONE_LEVELS          = "Show zone level ranges";
FLIGHTMAP_OPT_SHOW_ZONE_LEVELS_TIP      = "Display the recommended level range for each zone in the zone tooltip.";
FLIGHTMAP_OPT_AWESOME_SEPARATOR         = "awesome_wotlk:";
FLIGHTMAP_OPT_NOTIFY_TASKBAR            = "Notify: taskbar icon";
FLIGHTMAP_OPT_NOTIFY_TASKBAR_TIP        = "Flash the WoW taskbar icon when you land. Requires awesome_wotlk (AwesomeCVar).";
FLIGHTMAP_OPT_TOOLTIP_FONT_SIZE         = "Tooltip font size";
FLIGHTMAP_OPT_TOOLTIP_FONT_SIZE_TIP     = "Adjusts the font size of the zone tooltip.";
FLIGHTMAP_OPT_MAX_TOOLTIP_LINES         = "Max tooltip lines";
FLIGHTMAP_OPT_MAX_TOOLTIP_LINES_TIP     = "Maximum number of lines shown in the zone tooltip.";
FLIGHTMAP_OPT_SHOW_FM_CONTINENT         = "Flight master continent icons";
FLIGHTMAP_OPT_SHOW_FM_CONTINENT_TIP     = "Show flight master icons on the continent map.";
FLIGHTMAP_OPT_SHOW_FM_CLASS             = "Class specific flight master icons";
FLIGHTMAP_OPT_SHOW_FM_CLASS_TIP         = "Show class specific flight master icons.";
FLIGHTMAP_OPT_SHOW_FM_TOOLTIP           = "Flight master tooltip";
FLIGHTMAP_OPT_SHOW_FM_TOOLTIP_TIP       = "Show a tooltip with flight information when hovering over a flight master icon.";

-- These constants determine how "Town, Zone" strings look.
-- SEP_STRING is what separates Town from Zone.  SEP_POSTAMBLE
-- is anything that is after Zone.
FLIGHTMAP_SEP_STRING    = ", ";
FLIGHTMAP_SEP_POSTAMBLE = "";
