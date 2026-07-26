--
-- FlightMap - AddOn to show inbound and outbound flightpaths from a given
--             zone on the World Map.  Additionally shows flight costs and
--             zone level ranges.
-- Copyright (c) 2005-2007 Byron Ellacott (Dhask of Uther)
--
-- An unlimited license to use, reproduce and copy this work is granted, on
-- the condition that the licensee accepts all responsibility and liability
-- for any damage that may arise from the use of this AddOn.

FLIGHTMAP_COLORS = {
    Unknown   = { r = 0.8, g = 0.8, b = 0.8 },
    Hostile   = { r = 0.9, g = 0.2, b = 0.2 },
    Friendly  = { r = 0.2, g = 0.9, b = 0.2 },
    Contested = { r = 0.8, g = 0.6, b = 0.4 },
    Neutral   = { r = 0.9, g = 0.8, b = 0.2 },
}

FLIGHTMAP_LEVELS = "%d - %d"

local lTYPE_HORDE     = "Horde"
local lTYPE_ALLIANCE  = "Alliance"
local lTYPE_CONTESTED = "Contested"
local lTYPE_NEUTRAL   = "Neutral"
local lTYPE_UNKNOWN   = "Unknown"

FLIGHTMAP_RANGES = {
    ["Ironforge"]     = { nil, nil, lTYPE_ALLIANCE },
    ["Silvermoon City"]     = { nil, nil, lTYPE_HORDE },
    ["Stormwind City"]     = { nil, nil, lTYPE_ALLIANCE },
    ["Undercity"]     = { nil, nil, lTYPE_HORDE },
    ["Dun Morogh"]     = { 1, 10, lTYPE_ALLIANCE },
    ["Durotar"]         = { 1, 10, lTYPE_HORDE },
    ["Elwynn Forest"]   = { 1, 10, lTYPE_ALLIANCE },
	["Eversong Woods"] = { 1, 10, lTYPE_HORDE },
    ["Tirisfal Glades"] = { 1, 10, lTYPE_HORDE },
    ["Ghostlands"]    = {10, 20, lTYPE_HORDE},
    ["Loch Modan"]      = { 10, 20, lTYPE_ALLIANCE },
    ["Silverpine Forest"] = { 10, 20, lTYPE_HORDE },
    ["Westfall"]        = { 10, 20, lTYPE_ALLIANCE },
    ["Redridge Mountains"] = { 15, 25, lTYPE_CONTESTED },
    ["Duskwood"]      = { 18, 30, lTYPE_CONTESTED },
    ["Hillsbrad Foothills"]  = { 20, 30, lTYPE_CONTESTED },
    ["Wetlands"]      = { 20, 30, lTYPE_CONTESTED },
    ["Alterac Mountains"]       = { 30, 40, lTYPE_CONTESTED },
    ["Arathi Highlands"]     = { 30, 40, lTYPE_CONTESTED },
    ["Badlands"]      = { 35, 45, lTYPE_CONTESTED },
    ["Stranglethorn Vale"]   = { 30, 45, lTYPE_CONTESTED },
    ["Swamp of Sorrows"]       = { 35, 45, lTYPE_CONTESTED },
    ["The Hinterlands"] = { 40, 50, lTYPE_CONTESTED },
    ["Searing Gorge"]   = { 43, 50, lTYPE_CONTESTED },
    ["Blasted Lands"]  = { 45, 55, lTYPE_CONTESTED },
    ["Burning Steppes"] = { 50, 58, lTYPE_CONTESTED },
    ["Western Plaguelands"] = { 51, 58, lTYPE_CONTESTED },
    ["Eastern Plaguelands"] = { 53, 60, lTYPE_CONTESTED },
    ["Deadwind Pass"]  = { 55, 60, lTYPE_CONTESTED },
    ["Isle of Quel'Danas"]  = { nil, 70, lTYPE_CONTESTED },
    ["Stonetalon Mountains"] = { 15, 27, lTYPE_CONTESTED },
    ["Darnassus"]     = { nil, nil, lTYPE_ALLIANCE },
    ["The Exodar"]     = { nil, nil, lTYPE_ALLIANCE },
    ["Orgrimmar"]     = { nil, nil, lTYPE_HORDE },
    ["Thunder Bluff"]     = { nil, nil, lTYPE_HORDE },
    ["Azuremyst Isle"]    = { 1, 10, lTYPE_ALLIANCE },
    ["Mulgore"]       = { 1, 10, lTYPE_HORDE },
    ["Teldrassil"]    = { 1, 10, lTYPE_ALLIANCE },
    ["Bloodmyst Isle"]    = { 1, 20, lTYPE_ALLIANCE },
    ["Darkshore"]     = { 10, 20, lTYPE_ALLIANCE },
    ["The Barrens"]     = { 10, 25, lTYPE_HORDE },
    ["Ashenvale"]       = { 18, 30, lTYPE_CONTESTED },
    ["Thousand Needles"]     = { 25, 35, lTYPE_CONTESTED },
    ["Desolace"]        = { 30, 40, lTYPE_CONTESTED },
    ["Dustwallow Marsh"] = { 35, 45, lTYPE_CONTESTED },
    ["Feralas"]         = { 40, 50, lTYPE_CONTESTED },
    ["Tanaris"]         = { 40, 50, lTYPE_CONTESTED },
    ["Azshara"]       = { 45, 55, lTYPE_CONTESTED },
    ["Felwood"]       = { 48, 55, lTYPE_CONTESTED },
    ["Un'Goro Crater"]  = { 48, 55, lTYPE_CONTESTED },
    ["Western Plaguelands"] = { 51, 58, lTYPE_CONTESTED },
    ["Eastern Plaguelands"] = { 53, 60, lTYPE_CONTESTED },
    ["Winterspring"]    = { 55, 60, lTYPE_CONTESTED },
    ["Silithus"]        = { 55, 60, lTYPE_CONTESTED },
    ["Moonglade"]     = { 1, 60, lTYPE_CONTESTED },
	
    ["Shattrath City"]     = { nil, nil, lTYPE_NEUTRAL },
    ["Hellfire Peninsula"] = { 58, 63, lTYPE_CONTESTED },
    ["Zangarmarsh"] = { 60, 64, lTYPE_CONTESTED },
    ["Terokkar Forest"] = { 62, 65, lTYPE_CONTESTED },
    ["Nagrand"] = { 64, 67, lTYPE_CONTESTED },
    ["Blade's Edge Mountains"] = { 65, 68, lTYPE_CONTESTED },
    ["Netherstorm"] = { 67, 70, lTYPE_CONTESTED },
    ["Shadowmoon Valley"] = { 67, 70, lTYPE_CONTESTED },
	
    ["Dalaran"] = { nil, nil, lTYPE_NEUTRAL },	
    ["Borean Tundra"] = { 68, 72, lTYPE_CONTESTED },	
    ["Howling Fjord"] = { 68, 72, lTYPE_CONTESTED },	
    ["Grizzly Hills"] = { 70, 74, lTYPE_CONTESTED },	
    ["Dragonblight"] = { 71, 75, lTYPE_CONTESTED },	
    ["Crystalsong Forest"] = { 74, 76, lTYPE_CONTESTED },	
    ["Zul'Drak"] = { 73, 77, lTYPE_CONTESTED },	
    ["Sholazar Basin"] = { 75, 79, lTYPE_CONTESTED },	
    ["The Storm Peaks"] = { 77, 80, lTYPE_CONTESTED },	
    ["Icecrown"] = { 77, 80, lTYPE_CONTESTED },	
	["Hrothgar's Landing"] = {77, 80, lTYPE_CONTESTED },
    ["Wintergrasp"] = { 77, 80, lTYPE_CONTESTED },	
}


-- Size and names for path texture files
FLIGHTMAP_LINE_SIZE = 256;
FLIGHTMAP_TEX_UP    = "Interface\\AddOns\\FlightMap\\FlightMapUp";
FLIGHTMAP_TEX_DOWN  = "Interface\\AddOns\\FlightMap\\FlightMapDown";

-- How many pixels is too close to another POI?
FLIGHTMAP_CLOSE     = 16;

-- Flight master nodes that should always be shown on the continent map
local FLIGHTMAP_POI_CLOSENESS_EXEMPT = {
    ["2:545:188"] = true,   -- Nethergarde Keep, Blasted Lands
};

-- Flight master nodes that should always be shown on the zone map
local FLIGHTMAP_POI_ZONE_CLOSENESS_EXEMPT = {
    ["3:232:496"] = true,   -- Zabra'jin, Zangarmarsh
};

-- Textures for flightmaster POI icons
FLIGHTMAP_POI_KNOWN = "Interface\\TaxiFrame\\UI-Taxi-Icon-Green";
FLIGHTMAP_POI_OTHER = "Interface\\TaxiFrame\\UI-Taxi-Icon-Gray";

local lTYPE_HORDE     = FLIGHTMAP_HORDE;
local lTYPE_ALLIANCE  = FLIGHTMAP_ALLIANCE;
local lTYPE_CONTESTED = FLIGHTMAP_CONTESTED;
local lTYPE_NEUTRAL   = FLIGHTMAP_NEUTRAL;

local lPlayerFaction = nil;

------------------ Data access functions ------------------

-- Attempt to move a node to a new taxi map position
local function lRelocateNode(newkey, name)
    local map = FlightMapUtil.getFlightMap();

    for k, v in pairs(map) do
        -- Same name, different key, it's probably moved
        if k ~= newkey and v.Name == name then
            -- Rename node
            map[newkey] = map[k];
            map[k] = nil;
            -- Adjust costs, times and routes
            for l, b in pairs(map) do
                map[l].Costs[newkey] = map[l].Costs[k];
                map[l].Costs[k] = nil;
                map[l].Flights[newkey] = map[l].Flights[k];
                map[l].Flights[k] = nil;
                if map[l].Routes then
                    map[l].Routes[newkey] = map[l].Routes[k];
                    map[l].Routes[k] = nil;
                    for _, r in pairs(map[l].Routes) do
                        for n, m in pairs(r) do
                            if m == k then r[n] = newkey; end
                        end
                    end
                end
            end
            -- Remap knowledge
            for _, knows in pairs(FlightMapChar.Knowledge) do
                knows[newkey] = knows[k];
                knows[k] = nil;
            end
            -- Node names are unique, no need to scan further.
            break;
        end
    end
end

local function lSetDefaultData()
    -- Ensure the per-character saved variable table exists.
    if not FlightMapChar then FlightMapChar = {}; end

    -- Create an empty knowledge record (per-character)
    if not FlightMapChar["Knowledge"] then
        FlightMapChar.Knowledge = {};
    end

    -- Per-character cost overrides
    if not FlightMapChar["Costs"] then
        FlightMapChar.Costs = {};
    end

    -- Default option settings (per-character)
    if not FlightMapChar["Opts"] then
        FlightMapChar["Opts"] = FLIGHTMAP_DEFAULT_OPTS;
    end

    -- Any options that don't have a value at all should be defaulted
    for k, v in pairs(FLIGHTMAP_DEFAULT_OPTS) do
        if FlightMapChar.Opts[k] == nil then
            FlightMapChar.Opts[k] = v;
        end
    end

    local pos = FlightMapChar.Opts.timerPos;
    if pos then
        FlightMapTimesFrame:ClearAllPoints();
        FlightMapTimesFrame:SetPoint(pos.point, UIParent, pos.point, pos.x, pos.y);
    end

    -- Make sure there's a GossipFlights structure
    if not FlightMap["GossipFlights"] then
        FlightMap["GossipFlights"] = {};
    end

    local function lStripDefaults(factionSV)
        if not factionSV then return; end
        for nodeKey, savedNode in pairs(factionSV) do
            local defaultNode = FLIGHTMAP_FLIGHTS[nodeKey];
            if defaultNode then
                -- Strip scalar fields that match the default
                for _, field in ipairs({"Name", "Zone", "Continent", "Faction"}) do
                    if savedNode[field] == defaultNode[field] then
                        savedNode[field] = nil;
                    end
                end
                -- Strip Location if it matches defaults within 0.005 tolerance
                if savedNode.Location and defaultNode.Location then
                    local allMatch = true;
                    for _, space in ipairs({"Taxi", "Continent", "Zone"}) do
                        local sv = savedNode.Location[space];
                        local df = defaultNode.Location[space];
                        if sv and df then
                            if math.abs(sv.x - df.x) > 0.005
                            or math.abs(sv.y - df.y) > 0.005 then
                                allMatch = false; break;
                            end
                        end
                    end
                    if allMatch then savedNode.Location = nil; end
                end
                -- Strip Flights entries that match defaults (within 1s)
                if savedNode.Flights and defaultNode.Flights then
                    for dest, svTime in pairs(savedNode.Flights) do
                        local dfTime = defaultNode.Flights[dest];
                        if dfTime and math.abs(svTime - dfTime) < 1.0 then
                            savedNode.Flights[dest] = nil;
                        end
                    end
                    if not next(savedNode.Flights) then
                        savedNode.Flights = nil;
                    end
                end
                -- Strip Costs entries that match defaults exactly
                if savedNode.Costs and defaultNode.Costs then
                    for dest, svCost in pairs(savedNode.Costs) do
                        if defaultNode.Costs[dest] == svCost then
                            savedNode.Costs[dest] = nil;
                        end
                    end
                    if not next(savedNode.Costs) then
                        savedNode.Costs = nil;
                    end
                end
                -- Strip Routes entries that match defaults exactly
                if savedNode.Routes and defaultNode.Routes then
                    for dest, svRoute in pairs(savedNode.Routes) do
                        local dfRoute = defaultNode.Routes[dest];
                        if dfRoute and #svRoute == #dfRoute then
                            local same = true;
                            for i = 1, #svRoute do
                                if svRoute[i] ~= dfRoute[i] then
                                    same = false; break;
                                end
                            end
                            if same then savedNode.Routes[dest] = nil; end
                        end
                    end
                    if not next(savedNode.Routes) then
                        savedNode.Routes = nil;
                    end
                end
                -- If nothing meaningful remains, remove the whole node entry
                local hasData = false;
                for field in pairs(savedNode) do
                    hasData = true; break;
                end
                if not hasData then factionSV[nodeKey] = nil; end
            end
        end
    end

    lStripDefaults(FlightMap[FLIGHTMAP_HORDE]);
    lStripDefaults(FlightMap[FLIGHTMAP_ALLIANCE]);

    FlightMapUtil.resetFlightMapCache();
end

-- Learn about the currently open taxi map
local function lLearnTaxiNode()
    local map     = FlightMapUtil.getFlightMap();
    local faction = UnitFactionGroup("player");
    local sv      = FlightMapUtil.lGetOverrides(faction);

    local oldCont, oldZone = GetCurrentMapContinent(), GetCurrentMapZone();
    SetMapToCurrentZone();
    local thisCont = GetCurrentMapContinent();

    local thisNode;
    local destinations = {};
    local numNodes = NumTaxiNodes();
    for index = 1, numNodes, 1 do
        local tType = TaxiNodeGetType(index);
        if (tType == "CURRENT") then
            thisNode = index;
        elseif (tType == "REACHABLE") then
            local mx, my = TaxiNodePosition(index);
            local destName = FlightMapUtil.makeNodeName(thisCont, mx, my);

            destinations[destName] = index;
            lRelocateNode(destName, TaxiNodeName(index));
            FlightMapUtil.knownNode(destName, true);

            if not map[destName] then
                local stub = {
                    Name      = "Will be set below",
                    Zone      = "Unknown!",
                    Continent = thisCont,
                    Flights   = {},
                    Costs     = {},
                    Routes    = {},
                    Location  = {
                        Taxi      = { x = mx, y = my },
                        Zone      = { x = 0,  y = 0  },
                        Continent = { x = 0,  y = 0  },
                    },
                };
                map[destName] = stub;
                sv[destName]  = stub;
            end

            -- Update name and taxi location only when they differ from default
            local taxiName = TaxiNodeName(index);
            local df = FLIGHTMAP_FLIGHTS[destName];
            if map[destName].Name ~= taxiName then
                map[destName].Name = taxiName;
                if not df or df.Name ~= taxiName then
                    if not sv[destName] then sv[destName] = {}; end
                    sv[destName].Name = taxiName;
                end
            end
            local t = map[destName].Location and map[destName].Location.Taxi;
            if not t or t.x ~= mx or t.y ~= my then
                map[destName].Location.Taxi = { x = mx, y = my };
                local dfTaxi = df and df.Location and df.Location.Taxi;
                if not dfTaxi
                or math.abs(dfTaxi.x - mx) >= 0.005
                or math.abs(dfTaxi.y - my) >= 0.005 then
                    if not sv[destName] then sv[destName] = {}; end
                    if not sv[destName].Location then sv[destName].Location = {}; end
                    sv[destName].Location.Taxi = { x = mx, y = my };
                end
            end
        end
    end

    if (thisNode) then
        local mx, my   = TaxiNodePosition(thisNode);
        local thisName = FlightMapUtil.makeNodeName(thisCont, mx, my);
        local zoneName = FlightMapUtil.getZoneName();
        local zx, zy   = GetPlayerMapPosition("player");
        SetMapZoom(thisCont, nil);
        local cx, cy   = GetPlayerMapPosition("player");

        lRelocateNode(thisName, TaxiNodeName(thisNode));
        FlightMapUtil.knownNode(thisName, true);

        if not map[thisName]         then map[thisName]         = {}; end
        if not map[thisName].Flights then map[thisName].Flights = {}; end
        if not map[thisName].Costs   then map[thisName].Costs   = {}; end
        if not map[thisName].Routes  then map[thisName].Routes  = {}; end

        local df = FLIGHTMAP_FLIGHTS[thisName];
        local taxiNameStr = TaxiNodeName(thisNode);

        local function saveField(field, val)
            map[thisName][field] = val;
            if not df or df[field] ~= val then
                if not sv[thisName] then sv[thisName] = {}; end
                sv[thisName][field] = val;
            end
        end

        saveField("Name",      taxiNameStr);
        saveField("Zone",      zoneName);
        saveField("Continent", thisCont);

        local function coordClose(a, b) return math.abs(a - b) < 0.005; end
        local newLoc = {
            Zone      = { x = zx, y = zy },
            Continent = { x = cx, y = cy },
            Taxi      = { x = mx, y = my },
        };
        map[thisName].Location = newLoc;

        local dfLoc = df and df.Location;
        local locMatchesDefault = dfLoc
            and dfLoc.Zone      and coordClose(dfLoc.Zone.x,      zx) and coordClose(dfLoc.Zone.y,      zy)
            and dfLoc.Continent and coordClose(dfLoc.Continent.x, cx) and coordClose(dfLoc.Continent.y, cy)
            and dfLoc.Taxi      and coordClose(dfLoc.Taxi.x,      mx) and coordClose(dfLoc.Taxi.y,      my);
        if not locMatchesDefault then
            if not sv[thisName] then sv[thisName] = {}; end
            sv[thisName].Location = newLoc;
        end

        -- Record destinations
        for k, v in pairs(destinations) do
            local newCost = TaxiNodeCost(v);

            -- Update session map cost always
            map[thisName].Costs[k] = newCost;

            -- Persist cost only if it differs from default
            local dfCost = df and df.Costs and df.Costs[k];
            if dfCost ~= newCost then
                if not sv[thisName]       then sv[thisName]       = {}; end
                if not sv[thisName].Costs then sv[thisName].Costs = {}; end
                sv[thisName].Costs[k] = newCost;
            end

            local routes = GetNumRoutes(v);
            if routes > 1 then
                local totalTime = 0;
                local prevSpot  = thisName;
                local newRoute  = {};
                for r = 1, routes do
                    local dest = FlightMapUtil.makeNodeName(thisCont,
                            TaxiGetDestX(v, r), TaxiGetDestY(v, r));
                    table.insert(newRoute, dest);
                    if map[prevSpot] and map[prevSpot].Flights[dest]
                        and map[prevSpot].Flights[dest] > 0 and totalTime then
                        totalTime = totalTime + map[prevSpot].Flights[dest];
                    else
                        totalTime = nil;
                    end
                    prevSpot = dest;
                end

                local oldRoute = map[thisName].Routes[k];
                local isNewRoute = not oldRoute or #oldRoute ~= #newRoute;
                if not isNewRoute then
                    for idx = 1, #newRoute do
                        if newRoute[idx] ~= oldRoute[idx] then
                            isNewRoute = true;
                            break;
                        end
                    end
                end

                if isNewRoute or map[thisName].Flights[k] == 0 then
                    map[thisName].Flights[k] = totalTime;
                    map[thisName].Routes[k]  = newRoute;

                    -- Persist route only if it differs from default
                    local dfRoute = df and df.Routes and df.Routes[k];
                    local routeDiffers = not dfRoute
                        or #dfRoute ~= #newRoute;
                    if not routeDiffers then
                        for i = 1, #newRoute do
                            if newRoute[i] ~= dfRoute[i] then
                                routeDiffers = true; break;
                            end
                        end
                    end
                    if routeDiffers then
                        if not sv[thisName]        then sv[thisName]        = {}; end
                        if not sv[thisName].Routes then sv[thisName].Routes = {}; end
                        sv[thisName].Routes[k] = newRoute;
                    end
                end
            else
                map[thisName].Routes[k] = nil;
                if sv[thisName] and sv[thisName].Routes then
                    sv[thisName].Routes[k] = nil;
                end
            end

            if not map[thisName].Flights[k] then
                map[thisName].Flights[k] = 0;
            end
        end
    end

    SetMapZoom(oldCont, oldZone);
end

------------------ Miscellaneous utility ------------------

-- Function to set tooltip font size
local function lSetTooltipFontSize(tooltip, size)
    -- Only FlightMapTooltip is safe to modify — we own it.
    if not tooltip or tooltip ~= FlightMapTooltip then return end

    size = math.max(8, math.min(20, size or 12));
    local font = GameFontNormal:GetFont();

    for i = 1, tooltip:NumLines() do
        local left  = _G[tooltip:GetName().."TextLeft"..i];
        local right = _G[tooltip:GetName().."TextRight"..i];
        if left  then left:SetFont(font, size) end
        if right then right:SetFont(font, size) end
    end
end

------------------ Map drawing functions ------------------

local function lFormatExtra(cost, secs)
    local result = "";
    local separator = "";
    if cost ~= nil and FlightMapChar.Opts.showCosts then
        local dosh = FlightMapUtil.formatMoney(cost);
        if cost == 0 then dosh = FLIGHTMAP_NO_COST; end
        result = result .. dosh;
        separator = " ";
    end
    if secs ~= nil and FlightMapChar.Opts.showTimes then
        local durn = FlightMapUtil.formatTime(secs);
        result = result .. separator .. durn;
    end
    return result;
end

-- Add node name and location into the given tooltip.  If the source node is
-- given, also show any stop-off nodes along the way.
local function lAddFlightsForNode(tooltip, node, prefix, source, lineCount, maxLines)
    -- Sanitize prefix
    if not prefix then prefix = ""; end

    -- Need a map of flight nodes
    local map = FlightMapUtil.getFlightMap();

    -- Get the node's data
    local data = map[node];
    if not data then return 0; end
    if not data.Costs then data.Costs = {}; end

    -- Get name of node
    local name = data.Name;

    -- And its zone location, if that's known
    local locn = "";
    if data.Location.Zone then
        locn = string.format("%d, %d", data.Location.Zone.x * 100,
                data.Location.Zone.y * 100);
    end

    if lineCount and maxLines then
        local needed = 1;
        if not source and FlightMapChar.Opts.showDestinations then
            for dest, secs in pairs(data.Flights) do
                local islocal = (not data.Routes or not data.Routes[dest]);
                local destData = map[dest];
                if destData and (islocal or FlightMapChar.Opts.showMultiHop)
                and FlightMapUtil.isNodeVisibleToPlayer(dest) then
                    if FlightMapUtil.knownNode(dest) or FlightMapChar.Opts.showAllInfo then
                        needed = needed + 1;
                    end
                end
            end
        end
        if lineCount + needed > maxLines then
            return nil;  -- nil signals "budget exceeded; stop iterating"
        end
    end

    -- Add the node header to the tooltip
    if FlightMapUtil.knownNode(node) then
        tooltip:AddDoubleLine(prefix .. name, locn);
    else
        local r = NORMAL_FONT_COLOR.r * 0.7;
        local g = NORMAL_FONT_COLOR.g * 0.7;
        local b = NORMAL_FONT_COLOR.b * 0.7;
        tooltip:AddDoubleLine(prefix .. name, locn, r, g, b, r, g, b);
    end
    local linesAdded = 1;

    -- Check for a route
    prefix = prefix .. " ";
    if source and map[source] then
        if map[source].Flights[node] then
          local durn = FlightMapUtil.formatTime(map[source].Flights[node]);
          tooltip:AddLine(prefix .. FLIGHTMAP_FLIGHTTIME .. durn, 1, 1, 1);
          linesAdded = linesAdded + 1;
        end
        if map[source].Routes[node] then
            local src = map[source];
            for i = 1, #src.Routes[node] - 1 do
                local hop = src.Routes[node][i];
                if map[hop] then
                    tooltip:AddLine(prefix..FLIGHTMAP_VIA..map[hop].Name,
                        0.7, 0.7, 0.7);
                    linesAdded = linesAdded + 1;
                end
            end
        end
    end

    -- Check for flights from node
    if not source and FlightMapChar.Opts.showDestinations then
        for dest, secs in pairs(data.Flights) do
            local islocal = (not data.Routes or not data.Routes[dest]);
            local destData = map[dest];
            if destData and (islocal or FlightMapChar.Opts.showMultiHop)
            and FlightMapUtil.isNodeVisibleToPlayer(dest) then
                local name, _ = FlightMapUtil.getNameAndZone(destData.Name);
                local cost = data.Costs[dest];
                local extra = lFormatExtra(cost, secs);
                if FlightMapUtil.knownNode(dest) then
                    tooltip:AddDoubleLine(prefix .. name, extra,
                        1, 1, 1, 1, 1, 1);
                    linesAdded = linesAdded + 1;
                elseif FlightMapChar.Opts.showAllInfo then
                    tooltip:AddDoubleLine(prefix .. name, extra,
                        0.7, 0.7, 0.7, 0.7, 0.7, 0.7);
                    linesAdded = linesAdded + 1;
                end
            end
         end
    end

    return linesAdded;
end
FlightMapUtil.addFlightsForNode = lAddFlightsForNode;

-- Update the flight tooltip for a zone
local function lUpdateTooltip(self, zoneName)
    if not FlightMapChar.Opts.showZoneTooltip then
        FlightMapTooltip:Hide();
        return;
    end

    -- No zone name, no tooltip!
    if not zoneName or zoneName == "" then
        FlightMapTooltip:Hide();
        return;
    end

    -- Doesn't matter which anchor point we use, none of them are
    -- useful for what FlightMap needs...
    FlightMapTooltip:SetOwner(self, "ANCHOR_LEFT");

    -- Determine colour and level range
    local title = FLIGHTMAP_COLORS.Unknown
    local levels = nil
    if FLIGHTMAP_RANGES and FLIGHTMAP_RANGES[zoneName] then
        if not lPlayerFaction then
            lPlayerFaction = UnitFactionGroup("player");
        end
        local faction = lPlayerFaction;
        local min = FLIGHTMAP_RANGES[zoneName][1]
        local max = FLIGHTMAP_RANGES[zoneName][2]
        local side = FLIGHTMAP_RANGES[zoneName][3]
        if side == lTYPE_NEUTRAL then
            title = FLIGHTMAP_COLORS.Neutral
        elseif side == lTYPE_CONTESTED then
            title = FLIGHTMAP_COLORS.Contested
        else
            if faction == side then
                title = FLIGHTMAP_COLORS.Friendly
            else
                title = FLIGHTMAP_COLORS.Hostile
            end
        end

        -- Only format levels if at least one value exists and option is enabled
        if FlightMapChar.Opts.showZoneLevels then
            if min and max then
                levels = string.format(FLIGHTMAP_LEVELS, min, max)
            elseif min then
                levels = string.format("Level %d", min)
            elseif max then
                levels = string.format("Level %d", max)
            else
                levels = nil
            end
        end
    end

    -- Show the zone title, add level range if known
    FlightMapTooltip:SetText(zoneName, title.r, title.g, title.b)
    local lineCount = 1;
    if levels then
        FlightMapTooltip:AddLine(levels, title.r, title.g, title.b)
        lineCount = lineCount + 1;
    end

    -- Get max lines from settings
    local maxLines = FlightMapChar.Opts.maxTooltipLines or 20;

    -- Discover and add all the flights, including subzones
    local nodes = FlightMapUtil.getNodesInZone(zoneName, true);

    -- Outbound flights
    local flights = 0;
    for node, data in pairs(nodes) do
        if (FlightMapUtil.knownNode(node) or FlightMapChar.Opts.showAllInfo)
        and FlightMapUtil.isNodeVisibleToPlayer(node) then
            local added = lAddFlightsForNode(FlightMapTooltip, node, "",
                    nil, lineCount, maxLines);
            if added == nil then
                break;
            end
            flights = flights + 1;
            lineCount = lineCount + added;
        end
    end

    -- Apply custom font size
    lSetTooltipFontSize(FlightMapTooltip, FlightMapChar.Opts.tooltipFontSize)

    -- This stuff seems to get reset each time, possibly by the SetOwner()
    FlightMapTooltip:SetBackdropColor(0, 0, 0, 0.5);
    FlightMapTooltip:SetBackdropBorderColor(0, 0, 0, 0);

    -- Cartographer Look 'n' Feel compatibility
    if CartographerLookNFeelOverlayHolder
    and FlightMapTooltip:GetParent() == CartographerLookNFeelOverlayHolder then
        FlightMapTooltip:SetParent(UIParent);
    end
    FlightMapTooltip:SetFrameStrata("TOOLTIP");

    -- Magnify-WotLK
    local tooltipAnchor = (WorldMapScrollFrame and WorldMapScrollFrame:GetScrollChild() == WorldMapDetailFrame)
        and WorldMapScrollFrame
        or  WorldMapDetailFrame;

    FlightMapTooltip:ClearAllPoints();
    FlightMapTooltip:SetPoint("BOTTOMLEFT", tooltipAnchor, "BOTTOMLEFT", 0, 0);

    -- Only show if there's flight information or level information
    if flights > 0 or levels then
        FlightMapTooltip:Show();
        
        -- Constrain tooltip to WorldMapDetailFrame bounds
        local tooltipHeight = FlightMapTooltip:GetHeight();
        local mapHeight = WorldMapDetailFrame:GetHeight();
        
        -- If tooltip is taller than the map, clamp it
        if tooltipHeight > mapHeight then
            -- Enable scrolling by limiting the height
            FlightMapTooltip:SetHeight(mapHeight - 10);
        end
    else
        FlightMapTooltip:Hide();
    end

    -- Now go ahead and put the tooltip into the right location
    FlightMapTooltip:ClearAllPoints();
    FlightMapTooltip:SetPoint("BOTTOMLEFT", tooltipAnchor);
end

-- Returns true iff an existing world map POI icon is very close to the
-- given coordinates.
local function lCloseToExistingPOI(x, y)
    for i = 1, NUM_WORLDMAP_POIS, 1 do
        local button = getglobal("WorldMapFramePOI" .. i);
        if button and button:IsShown() then
            local _, _, index, _, _ = GetMapLandmarkInfo(i);
            -- Index 0 is an invisible POI
            if index ~= 0 then
                local px, py = button:GetCenter();
                px = px - WorldMapDetailFrame:GetLeft();
                py = py - WorldMapDetailFrame:GetBottom();
                if abs(px - x) < FLIGHTMAP_CLOSE and
                abs(py - y) < FLIGHTMAP_CLOSE then
                    return true;
                end
            end
        end
    end
    return false;
end

-- Try showing a POI node; returns true if the POI icon was displayed, or
-- false if it was too close to an existing POI icon, or there were no
-- known coordinates for the requested coordinate space, or the POI number
-- is out of range.
local function lShowNodePOI(node, data, space, num)
    -- Ensure the coordinate space is known
    if not data.Location[space] then return false; end

    -- Get the coordinates
    local x = data.Location[space].x;
    local y = data.Location[space].y;

    -- Convert them to world map pixel-space
    x = x * WorldMapDetailFrame:GetWidth();
    y = (1 - y) * WorldMapDetailFrame:GetHeight();

    -- Ensure the point isn't close to an existing POI icon.
    local exempt = (space == "Zone")
        and FLIGHTMAP_POI_ZONE_CLOSENESS_EXEMPT[node]
        or  FLIGHTMAP_POI_CLOSENESS_EXEMPT[node];
    if not exempt and lCloseToExistingPOI(x, y) then
        return false;
    end

    -- Get the node name
    local name, _ = FlightMapUtil.getNameAndZone(data.Name);

    -- Get the button
    local button = getglobal("FlightMapPOI" .. num);
    if not button then
        button = CreateFrame("Button", "FlightMapPOI" .. num,
                FlightMapPathFrame, "FlightMapPOITemplate");
        if not button then return false end
    end

    -- Keep buttons under FlightMapPathFrame (which inherits strata from
    -- WorldMapButton → overlayHolder).  Do NOT hardcode a strata: when
    -- Cartographer_LookNFeel is active, overlayHolder takes WorldMapDetailFrame's
    -- strata (FULLSCREEN by default) and our buttons must match it to be
    -- visible.  Frame level +1 above FlightMapPathFrame keeps them above the
    -- map tiles within that strata.
    --
    -- ZoneInfo text ordering is handled separately: see lFixZoneInfoStrata().
    button:SetParent(FlightMapPathFrame);
    button:SetFrameLevel(FlightMapPathFrame:GetFrameLevel() + 1);

    -- Does the user know this flight node?
    if not FlightMapUtil.knownNode(node) then
        if not FlightMapChar.Opts.showAllInfo then
            return false;
        end
        button:SetNormalTexture(FLIGHTMAP_POI_OTHER);
    else
        button:SetNormalTexture(FLIGHTMAP_POI_KNOWN);
    end

    -- Set all data
    button.name = name;
    button.data = data;
    button.node = node;
    button:SetPoint("CENTER", "WorldMapDetailFrame",
            "BOTTOMLEFT", x, y);
    button:Show();

    -- Done!
    return true;
end

-- Show locations of flight masters for either continent or zone level maps
-- Cartographer ZoneInfo strata fix.
local lFM_AreaFrameFixed = false;
local function lFixZoneInfoStrata()
    if not CartographerLookNFeelOverlayHolder then
        -- Cartographer not active: restore WorldMapFrameAreaFrame to its
        -- original parent (WorldMapFrame) if we previously moved it.
        if lFM_AreaFrameFixed and WorldMapFrameAreaFrame then
            WorldMapFrameAreaFrame:SetParent(WorldMapFrame);
            lFM_AreaFrameFixed = false;
        end
        return;
    end

    if not WorldMapFrameAreaFrame then return; end

    -- Move WorldMapFrameAreaFrame into overlayHolder so it shares the same
    -- strata container as our POI buttons.  Set its frame level above the
    -- highest possible POI button level (FlightMapPathFrame + 1) so it always
    -- renders on top of the icons.
    WorldMapFrameAreaFrame:SetParent(CartographerLookNFeelOverlayHolder);
    local topPOILevel = FlightMapPathFrame:GetFrameLevel() + 2;
    WorldMapFrameAreaFrame:SetFrameLevel(topPOILevel);
    lFM_AreaFrameFixed = true;
end

local function lUpdateFlightPOIs(zoneName)
    local continent = GetCurrentMapContinent();
    local mapZone = GetCurrentMapZone();
    local POI = 1;

    if mapZone ~= 0 and FlightMapChar.Opts.showPOIs then
        -- Zone level map
        local nodes = FlightMapUtil.getNodesInZone(zoneName, false);
        for node, data in pairs(nodes) do
            if FlightMapUtil.isNodeVisibleToPlayer(node) then
                if lShowNodePOI(node, data, "Zone", POI) then
                    POI = POI + 1;
                end
            end
        end
    elseif continent ~= 0 and FlightMapChar.Opts.showPOIs and FlightMapChar.Opts.showContinentPOIs then
        -- Continent level map
        local map = FlightMapUtil.getFlightMap();
        for node, data in pairs(map) do
            -- Filter list by continent
            if data.Continent == continent and FlightMapUtil.isNodeVisibleToPlayer(node) then
                if lShowNodePOI(node, data, "Continent", POI) then
                    POI = POI + 1;
                end
            end
        end
    end

    -- Hide any remaining unused POI buttons
    for i = POI, 10000, 1 do
        local but = getglobal("FlightMapPOI" .. i);
        if but then but:Hide() else break end
    end

    -- Ensure ZoneInfo text renders above our POI icons when Cartographer is
    -- active (see lFixZoneInfoStrata for full explanation).
    lFixZoneInfoStrata();
end

-- Draw a line from one flight node to another; returns true if the line
-- was drawn, false if it could not be: number out of range, coordinates
-- not known, etc.
local function lDrawFlightLine(from, to, num)
    -- Get the flight map
    local map = FlightMapUtil.getFlightMap();

    -- Make sure both ends are known about
    if not map[from] or not map[to] then return false; end

    -- Get the continent coordinate sets
    local src = map[from].Location.Continent;
    local dst = map[to].Location.Continent;

    -- Make sure both are known
    if not src or not dst then return false; end;
    if src.x == 0 or dst.x == 0 then return false; end

    -- Get the texture to work with
    local tex = getglobal("FlightMapPath" .. num);
    if not tex then
        tex = FlightMapPathFrame:CreateTexture(
                "FlightMapPath" .. num,
                "ARTWORK", "FlightMapPathTemplate");
        if not tex then return false end;
    end

    return FlightMapUtil.drawLine(WorldMapDetailFrame, tex,
            src.x, src.y, dst.x, dst.y);
end

-- Fill in flight map lines
local function lDrawFlightLines(zoneName)
    local lineNum = 1;

    -- Only if the zone name is known
    if zoneName and FlightMapChar.Opts.showPaths then
        -- Iterate over nodes in the current zone
        local nodes = FlightMapUtil.getNodesInZone(zoneName, true);
        for node, data in pairs(nodes) do
            -- If the source node is known and visible to this class
            if (FlightMapChar.Opts.showAllInfo or FlightMapUtil.knownNode(node))
            and FlightMapUtil.isNodeVisibleToPlayer(node) then
                -- ... then iterate over that node's outbound flights
                for dest, duration in pairs(data.Flights) do
                    -- If the destination node is known and visible to this class
                    if not (data.Routes and data.Routes[dest])
                    and (FlightMapChar.Opts.showAllInfo
                    or FlightMapUtil.knownNode(dest))
                    and FlightMapUtil.isNodeVisibleToPlayer(dest) then
                        -- ... and the flight line can be drawn
                        if lDrawFlightLine(node, dest, lineNum) then
                            -- ... then increment the line number
                            lineNum = lineNum + 1;
                        end
                    end
                end
            end
        end
    end

    -- Hide remaining flight paths
    for i = lineNum, 10000, 1 do
        local tex = getglobal("FlightMapPath" .. i);
        if tex then tex:Hide() else break end
    end
end

-- Last drawn info for tooltip
lFM_CurrentZone = nil;
lFM_CurrentArea = nil;
local lFM_OldUpdate = WorldMapFrame:GetScript("OnUpdate") or function() end

-- Replacement function to draw all the extra goodies of FlightMap
function FlightMap_WorldMapButton_OnUpdate(self, elapsed)
    lFM_OldUpdate(self, elapsed);
    local areaName = WorldMapFrame.areaName;
    local zoneNum = GetCurrentMapZone();

    -- zone name equivalence map
    if FLIGHTMAP_SUBZONES[areaName] then
        areaName = FLIGHTMAP_SUBZONES[areaName];
    end

    -- Bail out if nothing has changed
    if zoneNum == lFM_CurrentZone and areaName == lFM_CurrentArea then
        return;
    end

    -- Continent or zone map?
    if zoneNum == 0 then
        lUpdateTooltip(self, areaName);
        lUpdateFlightPOIs(areaName);
        lDrawFlightLines(areaName);
    else
        lUpdateFlightPOIs(FlightMapUtil.getZoneName());
        lUpdateTooltip(self, nil);            -- hide it
        lDrawFlightLines(nil);          -- hide them
    end
end

function FlightMapPOIButton_OnLeave()
    WorldMapPOIFrame.allowBlobTooltip = true;
    WorldMapTooltip:Hide();
end

function FlightMapPOIButton_OnEnter(self)
    WorldMapPOIFrame.allowBlobTooltip = false;

    -- Only show the flight master tooltip if the option is enabled
    if not FlightMapChar.Opts.showFlightMasterTooltip then return; end

    local x, y = self:GetCenter();
    local parentX, parentY = WorldMapDetailFrame:GetCenter();
    if (x > parentX) then
        WorldMapTooltip:SetOwner(self, "ANCHOR_LEFT");
    else
        WorldMapTooltip:SetOwner(self, "ANCHOR_RIGHT");
    end

    lAddFlightsForNode(WorldMapTooltip, self.node, "");

    -- Ensure the flight master tooltip always renders above the zone tooltip
    -- (FlightMapTooltip) by raising its strata and frame level above it.
    WorldMapTooltip:SetFrameStrata("TOOLTIP");
    WorldMapTooltip:SetFrameLevel(FlightMapTooltip:GetFrameLevel() + 1);
    WorldMapTooltip:Show();
end

---------------- Initialization functions -----------------

-- /flightmap handler
function FlightMap_OnSlashCmd(args)
    local cmd = string.match(args, "^(%S+)");

    if cmd == FLIGHTMAP_RESET then
        -- Reset the flight timer window's position to the default from Defaults.lua
        local def = FLIGHTMAP_DEFAULT_OPTS.timerPos;
        FlightMapTimesFrame:ClearAllPoints();
        FlightMapTimesFrame:SetPoint(def.point, UIParent, def.point, def.x, def.y);
        FlightMapTimesFrame:SetUserPlaced(false);
        FlightMapChar.Opts.timerPos = { point = def.point, x = def.x, y = def.y };
    elseif cmd == FLIGHTMAP_SHOWMAP then
        FlightMapTaxi_ShowContinent();
    elseif cmd == FLIGHTMAP_LOCKTIMES then
        FlightMapChar.Opts.lockFlightTimes = not FlightMapChar.Opts.lockFlightTimes;
        DEFAULT_CHAT_FRAME:AddMessage(
            FLIGHTMAP_TIMESLOCKED[FlightMapChar.Opts.lockFlightTimes],
            1.0, 1.0, 1.0);
    else
        InterfaceOptionsFrame_OpenToCategory(InterfaceOptionsFlightMapPanel);
    end
end

function FlightMap_OnLoad(self)
    -- Hook TAXIMAP_OPENED to learn flight paths
    self:RegisterEvent("TAXIMAP_OPENED");

    WorldMapFrame:SetScript('OnUpdate', function(...) 
        FlightMap_WorldMapButton_OnUpdate(...)
    end)

    -- Cartographer Look 'n' Feel compatibility: 
	-- Hide the zone tooltip when the world map closes
    local lFM_OldOnHide = WorldMapFrame:GetScript("OnHide") or function() end;
    WorldMapFrame:SetScript("OnHide", function(this)
        lFM_OldOnHide(this);
        FlightMapTooltip:Hide();
        -- Reset zone tracking so the tooltip redraws correctly on next open.
        lFM_CurrentZone = nil;
        lFM_CurrentArea = nil;
    end);

    -- Annotate gossip buttons with flight times.
    self:RegisterEvent("GOSSIP_SHOW");

    -- Set up my slash command
    SLASH_FLIGHTMAP1 = "/fmap";
    SLASH_FLIGHTMAP2 = "/flightmap";
    SlashCmdList["FLIGHTMAP"] = FlightMap_OnSlashCmd;

    -- Register for VARIABLES_LOADED to initialise saved data
    self:RegisterEvent("VARIABLES_LOADED");
end

function FlightMap_OnEvent(self, event)
    if (event == "TAXIMAP_OPENED") then
        lLearnTaxiNode();
    elseif (event == "GOSSIP_SHOW") then
        local npcName = UnitName("npc");
        if not npcName then return; end
        local entry = FLIGHTMAP_GOSSIP_FLIGHTS
                  and FLIGHTMAP_GOSSIP_FLIGHTS[npcName];
        if not entry or not entry.Flights then return; end

        -- Build title→seconds lookup from this page's gossip options.
        local flightTitles = {};
        local options = { GetGossipOptions() };
        local opt = 1;
        while options[opt] do
            local title = options[opt];
            opt = opt + 2;
            if entry.Flights[title] then
                flightTitles[title] = entry.Flights[title];
            end
        end

        -- Annotate each button whose text matches a known flight title.
        local i = 1;
        while true do
            local btn = getglobal("GossipTitleButton" .. i);
            if not btn then break; end
            i = i + 1;
            local text = btn:GetText() or "";
            local secs = flightTitles[text];
            if secs then
                btn:SetText(text .. " (" .. FlightMapUtil.formatTime(secs) .. ")");
            end
        end
    elseif (event == "VARIABLES_LOADED") then
        lSetDefaultData();
        FlightMap_UpdateMinimapButton();
    end
end

----------------- Options panel functions -----------------

function FlightMapOptionsFrame_OnLoad(self)
    local base = "InterfaceOptionsFlightMapPanel";
    local panel = InterfaceOptionsFlightMapPanel;
    local options = {};
    local children = {};

    local scrollFrame = CreateFrame("ScrollFrame", base .. "ScrollFrame",
            panel, "UIPanelScrollFrameTemplate");
    scrollFrame:SetPoint("TOPLEFT", panel, "TOPLEFT", 8, -60);
    scrollFrame:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -28, 4);

    local scrollChild = CreateFrame("Frame", base .. "ScrollChild", scrollFrame);
    scrollChild:SetHeight(530);
    scrollFrame:SetScrollChild(scrollChild);
    scrollFrame:SetScript("OnShow", function(self)
        scrollChild:SetWidth(self:GetWidth());
    end);

    local parent = scrollChild;
    local referent = CreateFrame("Frame", base .. "ScrollAnchor", scrollChild);
    referent:SetHeight(1);
    referent:SetWidth(1);
    referent:SetPoint("TOPLEFT", scrollChild, "TOPLEFT", 0, 0);

    -- Counter for option positioning
    local optionCount = 0;
    local fmTooltipBox = nil;
    local fmContinentBox = nil;
    local fmClassBox = nil;
    local fmDestChildBoxes = {};

    -- Helper to create a checkbox using OptionsCheckButtonTemplate with our own OnClick
    local function lCreateCheckBox(name, parentFrame)
        local cb = CreateFrame("CheckButton", name, parentFrame, "OptionsCheckButtonTemplate");
        cb:SetScript("OnClick", function(self)
            if self:GetChecked() then
                PlaySound("igMainMenuOptionCheckBoxOn");
                if self.setFunc then self.setFunc("1") end
            else
                PlaySound("igMainMenuOptionCheckBoxOff");
                if self.setFunc then self.setFunc("0") end
            end
        end);
        cb:SetScript("OnEnter", function(self)
            local opt = self.label and options[self.label];
            if opt and opt.tooltip then
                GameTooltip_SetDefaultAnchor(GameTooltip, self);
                GameTooltip:SetText(opt.tooltip, nil, nil, nil, nil, true);
                GameTooltip:Show();
            end
        end);
        cb:SetScript("OnLeave", function(self)
            GameTooltip:Hide();
        end);
        return cb;
    end

    -- Option: Flight path lines
    optionCount = optionCount + 1;
    local showPathsBox = lCreateCheckBox(base .. "ShowPaths", parent);
    showPathsBox.type = CONTROLTYPE_CHECKBOX;
    showPathsBox.label = "showPaths";
    showPathsBox.setFunc = function(value)
        if value == "0" then value = false end
        FlightMapChar.Opts.showPaths = value;
    end
    showPathsBox.GetValue = function()
        return (FlightMapChar.Opts.showPaths and "1" or "0");
    end
    showPathsBox:SetPoint("TOPLEFT", referent, "BOTTOMLEFT", -2, 30 - 30 * optionCount);
    getglobal(showPathsBox:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_SHOW_PATHS);
    getglobal(showPathsBox:GetName() .. "Text"):SetTextColor(
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    options["showPaths"] = {
        text = FLIGHTMAP_OPT_SHOW_PATHS, tooltip = FLIGHTMAP_OPT_SHOW_PATHS_TIP, default = true,
    };

    -- Option: Flight master icons
    optionCount = optionCount + 1;
    local showPOIsBox = lCreateCheckBox(base .. "ShowPOIs", parent);
    showPOIsBox.type = CONTROLTYPE_CHECKBOX;
    showPOIsBox.label = "showPOIs";
    showPOIsBox.setFunc = function(value)
        if value == "0" then value = false end
        FlightMapChar.Opts.showPOIs = value;
        local enable = value and true or false;
        local color = enable and NORMAL_FONT_COLOR or GRAY_FONT_COLOR;
        if enable then
            fmContinentBox:Enable(); fmClassBox:Enable(); fmTooltipBox:Enable();
        else
            fmContinentBox:Disable(); fmClassBox:Disable(); fmTooltipBox:Disable();
        end
        getglobal(fmContinentBox:GetName() .. "Text"):SetTextColor(color.r, color.g, color.b);
        getglobal(fmClassBox:GetName()     .. "Text"):SetTextColor(color.r, color.g, color.b);
        getglobal(fmTooltipBox:GetName()   .. "Text"):SetTextColor(color.r, color.g, color.b);
    end
    showPOIsBox.GetValue = function()
        return (FlightMapChar.Opts.showPOIs and "1" or "0");
    end
    showPOIsBox:SetPoint("TOPLEFT", referent, "BOTTOMLEFT", -2, 30 - 30 * optionCount);
    getglobal(showPOIsBox:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_SHOW_POIS);
    getglobal(showPOIsBox:GetName() .. "Text"):SetTextColor(
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    options["showPOIs"] = {
        text = FLIGHTMAP_OPT_SHOW_POIS, tooltip = FLIGHTMAP_OPT_SHOW_POIS_TIP, default = true,
    };

    -- Option: Flight master continent icons (child of showPOIs)
    optionCount = optionCount + 1;
    fmContinentBox = lCreateCheckBox(base .. "FMContinent", parent);
    fmContinentBox.type = CONTROLTYPE_CHECKBOX;
    fmContinentBox.label = "fmContinent";
    fmContinentBox.setFunc = function(value)
        if value == "0" then value = false end
        FlightMapChar.Opts.showContinentPOIs = value;
    end
    fmContinentBox.GetValue = function()
        return (FlightMapChar.Opts.showContinentPOIs and "1" or "0");
    end
    fmContinentBox:SetPoint("TOPLEFT", referent, "BOTTOMLEFT", 13, 30 - 30 * optionCount);
    getglobal(fmContinentBox:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_SHOW_FM_CONTINENT);
    getglobal(fmContinentBox:GetName() .. "Text"):SetTextColor(
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    options["fmContinent"] = {
        text = FLIGHTMAP_OPT_SHOW_FM_CONTINENT, tooltip = FLIGHTMAP_OPT_SHOW_FM_CONTINENT_TIP, default = true,
    };

    -- Option: Class specific flight master icons (child of showPOIs)
    optionCount = optionCount + 1;
    fmClassBox = lCreateCheckBox(base .. "FMClass", parent);
    fmClassBox.type = CONTROLTYPE_CHECKBOX;
    fmClassBox.label = "fmClass";
    fmClassBox.setFunc = function(value)
        if value == "0" then value = false end
        FlightMapChar.Opts.showClassPOIs = value;
    end
    fmClassBox.GetValue = function()
        return (FlightMapChar.Opts.showClassPOIs and "1" or "0");
    end
    fmClassBox:SetPoint("TOPLEFT", referent, "BOTTOMLEFT", 13, 30 - 30 * optionCount);
    getglobal(fmClassBox:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_SHOW_FM_CLASS);
    getglobal(fmClassBox:GetName() .. "Text"):SetTextColor(
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    options["fmClass"] = {
        text = FLIGHTMAP_OPT_SHOW_FM_CLASS, tooltip = FLIGHTMAP_OPT_SHOW_FM_CLASS_TIP, default = true,
    };

    -- Option: Flight master tooltip (child of showPOIs)
    optionCount = optionCount + 1;
    fmTooltipBox = lCreateCheckBox(base .. "FMTooltip", parent);
    fmTooltipBox.type = CONTROLTYPE_CHECKBOX;
    fmTooltipBox.label = "fmTooltip";
    fmTooltipBox.setFunc = function(value)
        if value == "0" then value = false end
        FlightMapChar.Opts.showFlightMasterTooltip = value;
    end
    fmTooltipBox.GetValue = function()
        return (FlightMapChar.Opts.showFlightMasterTooltip and "1" or "0");
    end
    fmTooltipBox:SetPoint("TOPLEFT", referent, "BOTTOMLEFT", 13, 30 - 30 * optionCount);
    getglobal(fmTooltipBox:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_SHOW_FM_TOOLTIP);
    getglobal(fmTooltipBox:GetName() .. "Text"):SetTextColor(
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    options["fmTooltip"] = {
        text = FLIGHTMAP_OPT_SHOW_FM_TOOLTIP, tooltip = FLIGHTMAP_OPT_SHOW_FM_TOOLTIP_TIP, default = false,
    };

    -- Option: Show unknown flights
    optionCount = optionCount + 1;
    local showAllInfoBox = lCreateCheckBox(base .. "ShowAllInfo", parent);
    showAllInfoBox.type = CONTROLTYPE_CHECKBOX;
    showAllInfoBox.label = "showAllInfo";
    showAllInfoBox.setFunc = function(value)
        if value == "0" then value = false end
        FlightMapChar.Opts.showAllInfo = value;
    end
    showAllInfoBox.GetValue = function()
        return (FlightMapChar.Opts.showAllInfo and "1" or "0");
    end
    showAllInfoBox:SetPoint("TOPLEFT", referent, "BOTTOMLEFT", -2, 30 - 30 * optionCount);
    getglobal(showAllInfoBox:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_SHOW_ALL_INFO);
    getglobal(showAllInfoBox:GetName() .. "Text"):SetTextColor(
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    options["showAllInfo"] = {
        text = FLIGHTMAP_OPT_SHOW_ALL_INFO, tooltip = FLIGHTMAP_OPT_SHOW_ALL_INFO_TIP, default = false,
    };

    -- Option: In-flight timers
    optionCount = optionCount + 1;
    local useTimerBox = lCreateCheckBox(base .. "UseTimer", parent);
    useTimerBox.type = CONTROLTYPE_CHECKBOX;
    useTimerBox.label = "useTimer";
    useTimerBox.setFunc = function(value)
        if value == "0" then value = false end
        FlightMapChar.Opts.useTimer = value;
    end
    useTimerBox.GetValue = function()
        return (FlightMapChar.Opts.useTimer and "1" or "0");
    end
    useTimerBox:SetPoint("TOPLEFT", referent, "BOTTOMLEFT", -2, 30 - 30 * optionCount);
    getglobal(useTimerBox:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_USE_TIMER);
    getglobal(useTimerBox:GetName() .. "Text"):SetTextColor(
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    options["useTimer"] = {
        text = FLIGHTMAP_OPT_USE_TIMER, tooltip = FLIGHTMAP_OPT_USE_TIMER_TIP, default = true,
    };

    -- Option: Show destinations
    optionCount = optionCount + 1;
    local showDestinationsBox = lCreateCheckBox(base .. "ShowDestinations", parent);
    showDestinationsBox.type = CONTROLTYPE_CHECKBOX;
    showDestinationsBox.label = "showDestinations";
    showDestinationsBox.setFunc = function(value)
        if value == "0" then value = false end
        FlightMapChar.Opts.showDestinations = value;
        local color = value and NORMAL_FONT_COLOR or GRAY_FONT_COLOR;
        for _, cb in pairs(fmDestChildBoxes) do
            if value then cb:Enable() else cb:Disable() end
            getglobal(cb:GetName() .. "Text"):SetTextColor(color.r, color.g, color.b);
        end
    end
    showDestinationsBox.GetValue = function()
        return (FlightMapChar.Opts.showDestinations and "1" or "0");
    end
    showDestinationsBox:SetPoint("TOPLEFT", referent, "BOTTOMLEFT", -2, 30 - 30 * optionCount);
    getglobal(showDestinationsBox:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_SHOW_DESTINATIONS);
    getglobal(showDestinationsBox:GetName() .. "Text"):SetTextColor(
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    options["showDestinations"] = {
        text = FLIGHTMAP_OPT_SHOW_DESTINATIONS, tooltip = FLIGHTMAP_OPT_SHOW_DESTINATIONS_TIP, default = true,
    };

    -- Option: Including multi-hop (child of showDestinations)
    optionCount = optionCount + 1;
    local showMultiHopBox = lCreateCheckBox(base .. "ShowMultiHop", parent);
    showMultiHopBox.type = CONTROLTYPE_CHECKBOX;
    showMultiHopBox.label = "showMultiHop";
    showMultiHopBox.setFunc = function(value)
        if value == "0" then value = false end
        FlightMapChar.Opts.showMultiHop = value;
    end
    showMultiHopBox.GetValue = function()
        return (FlightMapChar.Opts.showMultiHop and "1" or "0");
    end
    showMultiHopBox:SetPoint("TOPLEFT", referent, "BOTTOMLEFT", 13, 30 - 30 * optionCount);
    getglobal(showMultiHopBox:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_SHOW_MULTI_HOP);
    getglobal(showMultiHopBox:GetName() .. "Text"):SetTextColor(
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    options["showMultiHop"] = {
        text = FLIGHTMAP_OPT_SHOW_MULTI_HOP, tooltip = FLIGHTMAP_OPT_SHOW_MULTI_HOP_TIP, default = true,
    };

    table.insert(fmDestChildBoxes, showMultiHopBox);

    -- Option: With flight times (child of showDestinations)
    optionCount = optionCount + 1;
    local showTimesBox = lCreateCheckBox(base .. "ShowTimes", parent);
    showTimesBox.type = CONTROLTYPE_CHECKBOX;
    showTimesBox.label = "showTimes";
    showTimesBox.setFunc = function(value)
        if value == "0" then value = false end
        FlightMapChar.Opts.showTimes = value;
    end
    showTimesBox.GetValue = function()
        return (FlightMapChar.Opts.showTimes and "1" or "0");
    end
    showTimesBox:SetPoint("TOPLEFT", referent, "BOTTOMLEFT", 13, 30 - 30 * optionCount);
    getglobal(showTimesBox:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_SHOW_TIMES);
    getglobal(showTimesBox:GetName() .. "Text"):SetTextColor(
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    options["showTimes"] = {
        text = FLIGHTMAP_OPT_SHOW_TIMES, tooltip = FLIGHTMAP_OPT_SHOW_TIMES_TIP, default = true,
    };

    table.insert(fmDestChildBoxes, showTimesBox);

    -- Option: With flight costs (child of showDestinations)
    optionCount = optionCount + 1;
    local showCostsBox = lCreateCheckBox(base .. "ShowCosts", parent);
    showCostsBox.type = CONTROLTYPE_CHECKBOX;
    showCostsBox.label = "showCosts";
    showCostsBox.setFunc = function(value)
        if value == "0" then value = false end
        FlightMapChar.Opts.showCosts = value;
    end
    showCostsBox.GetValue = function()
        return (FlightMapChar.Opts.showCosts and "1" or "0");
    end
    showCostsBox:SetPoint("TOPLEFT", referent, "BOTTOMLEFT", 13, 30 - 30 * optionCount);
    getglobal(showCostsBox:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_SHOW_COSTS);
    getglobal(showCostsBox:GetName() .. "Text"):SetTextColor(
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    options["showCosts"] = {
        text = FLIGHTMAP_OPT_SHOW_COSTS, tooltip = FLIGHTMAP_OPT_SHOW_COSTS_TIP, default = true,
    };

    table.insert(fmDestChildBoxes, showCostsBox);

    -- Option: Enhanced flight window
    optionCount = optionCount + 1;
    local fullTaxiMapBox = lCreateCheckBox(base .. "FullTaxiMap", parent);
    fullTaxiMapBox.type = CONTROLTYPE_CHECKBOX;
    fullTaxiMapBox.label = "fullTaxiMap";
    fullTaxiMapBox.setFunc = function(value)
        if value == "0" then value = false end
        FlightMapChar.Opts.fullTaxiMap = value;
    end
    fullTaxiMapBox.GetValue = function()
        return (FlightMapChar.Opts.fullTaxiMap and "1" or "0");
    end
    fullTaxiMapBox:SetPoint("TOPLEFT", referent, "BOTTOMLEFT", -2, 30 - 30 * optionCount);
    getglobal(fullTaxiMapBox:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_FULL_TAXI_MAP);
    getglobal(fullTaxiMapBox:GetName() .. "Text"):SetTextColor(
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    options["fullTaxiMap"] = {
        text = FLIGHTMAP_OPT_FULL_TAXI_MAP, tooltip = FLIGHTMAP_OPT_FULL_TAXI_MAP_TIP, default = false,
    };

    -- Option: Confirm flights
    optionCount = optionCount + 1;
    local confirmFlightsBox = lCreateCheckBox(base .. "ConfirmFlights", parent);
    confirmFlightsBox.type = CONTROLTYPE_CHECKBOX;
    confirmFlightsBox.label = "confirmFlights";
    confirmFlightsBox.setFunc = function(value)
        if value == "0" then value = false end
        FlightMapChar.Opts.confirmFlights = value;
    end
    confirmFlightsBox.GetValue = function()
        return (FlightMapChar.Opts.confirmFlights and "1" or "0");
    end
    confirmFlightsBox:SetPoint("TOPLEFT", referent, "BOTTOMLEFT", -2, 30 - 30 * optionCount);
    getglobal(confirmFlightsBox:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_CONFIRM_FLIGHTS);
    getglobal(confirmFlightsBox:GetName() .. "Text"):SetTextColor(
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    options["confirmFlights"] = {
        text = FLIGHTMAP_OPT_CONFIRM_FLIGHTS, tooltip = FLIGHTMAP_OPT_CONFIRM_FLIGHTS_TIP, default = false,
    };

    -- Option: Show zone tooltip
    optionCount = optionCount + 1;
    local zoneLevelsBox = nil;  -- forward declaration so zoneTooltipBox can reference it

    local zoneTooltipBox = lCreateCheckBox(base .. "ZoneTooltip", parent);
    zoneTooltipBox.type = CONTROLTYPE_CHECKBOX;
    zoneTooltipBox.label = "zoneTooltip";
    zoneTooltipBox.setFunc = function(value)
        if value == "0" then value = false end
        FlightMapChar.Opts.showZoneTooltip = value
        lFM_CurrentZone = nil
        lFM_CurrentArea = nil
        if zoneLevelsBox then
            if value then
                zoneLevelsBox:Enable();
                getglobal(zoneLevelsBox:GetName() .. "Text"):SetTextColor(
                    NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
            else
                zoneLevelsBox:Disable();
                getglobal(zoneLevelsBox:GetName() .. "Text"):SetTextColor(
                    GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b);
            end
        end
    end
    zoneTooltipBox.GetValue = function() 
        return (FlightMapChar.Opts.showZoneTooltip and "1" or "0") 
    end
    zoneTooltipBox:SetPoint("TOPLEFT", referent, "BOTTOMLEFT",
            -2, 30 - 30 * optionCount);
    getglobal(zoneTooltipBox:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_SHOW_ZONE_TOOLTIP);
    getglobal(zoneTooltipBox:GetName() .. "Text"):SetTextColor(
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    options["zoneTooltip"] = {
        text = FLIGHTMAP_OPT_SHOW_ZONE_TOOLTIP,
        tooltip = FLIGHTMAP_OPT_SHOW_ZONE_TOOLTIP_TIP,
        default = true,
    };

    -- Option: Show zone level ranges (child of ZoneTooltip)
    optionCount = optionCount + 1;
    zoneLevelsBox = lCreateCheckBox(base .. "ZoneLevels", parent);
    zoneLevelsBox.type = CONTROLTYPE_CHECKBOX;
    zoneLevelsBox.label = "zoneLevels";
    zoneLevelsBox.setFunc = function(value)
        if value == "0" then value = false end
        FlightMapChar.Opts.showZoneLevels = value
        lFM_CurrentZone = nil
        lFM_CurrentArea = nil
    end
    zoneLevelsBox.GetValue = function() 
        return (FlightMapChar.Opts.showZoneLevels and "1" or "0") 
    end
    zoneLevelsBox:SetPoint("TOPLEFT", referent, "BOTTOMLEFT",
            13, 30 - 30 * optionCount);
    getglobal(zoneLevelsBox:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_SHOW_ZONE_LEVELS);
    getglobal(zoneLevelsBox:GetName() .. "Text"):SetTextColor(
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    options["zoneLevels"] = {
        text = FLIGHTMAP_OPT_SHOW_ZONE_LEVELS,
        tooltip = FLIGHTMAP_OPT_SHOW_ZONE_LEVELS_TIP,
        default = true,
    };

    --  Option: Minimap button
    optionCount = optionCount + 1;
    local minimapBox = lCreateCheckBox(base .. "MinimapButton", parent);
    minimapBox.type = CONTROLTYPE_CHECKBOX;
    minimapBox.label = "minimapButton";
    minimapBox.setFunc = function(value)
        if value == "0" then value = false end
        FlightMapChar.Opts.showMinimapButton = value;
        FlightMap_UpdateMinimapButton();
    end
    minimapBox.GetValue = function()
        return (FlightMapChar.Opts.showMinimapButton and "1" or "0");
    end
    minimapBox:SetPoint("TOPLEFT", referent, "BOTTOMLEFT",
            -2, 30 - 30 * optionCount);
    getglobal(minimapBox:GetName() .. "Text"):SetText(
        FLIGHTMAP_OPT_SHOW_MINIMAP_BUTTON or "Minimap button");
    getglobal(minimapBox:GetName() .. "Text"):SetTextColor(
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    options["minimapButton"] = {
        text    = FLIGHTMAP_OPT_SHOW_MINIMAP_BUTTON or "Minimap button",
        tooltip = FLIGHTMAP_OPT_SHOW_MINIMAP_BUTTON_TIP or "Show a FlightMap button on the minimap.",
        default = true,
    };

    -- Option: Lock flight times
    optionCount = optionCount + 1;
    local lockTimesBox = lCreateCheckBox(base .. "LockFlightTimes", parent);
    lockTimesBox.type = CONTROLTYPE_CHECKBOX;
    lockTimesBox.label = "lockFlightTimes";
    lockTimesBox.setFunc = function(value)
        if value == "0" then value = false end
        FlightMapChar.Opts.lockFlightTimes = value;
    end
    lockTimesBox.GetValue = function()
        return (FlightMapChar.Opts.lockFlightTimes and "1" or "0");
    end
    lockTimesBox:SetPoint("TOPLEFT", referent, "BOTTOMLEFT",
            -2, 30 - 30 * optionCount);
    getglobal(lockTimesBox:GetName() .. "Text"):SetText(
        FLIGHTMAP_OPT_LOCK_FLIGHT_TIMES or "Lock flight times");
    getglobal(lockTimesBox:GetName() .. "Text"):SetTextColor(
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    options["lockFlightTimes"] = {
        text    = FLIGHTMAP_OPT_LOCK_FLIGHT_TIMES or "Lock flight times",
        tooltip = FLIGHTMAP_OPT_LOCK_FLIGHT_TIMES_TIP or "Prevents the addon from recording new or updated flight times to SavedVariables.",
        default = false,
    };

    -- awesome_wotlk separator
    optionCount = optionCount + 1;
    local awesomeSeparator = parent:CreateFontString(
        base .. "AwesomeSeparator", "ARTWORK", "GameFontNormalSmall");
    awesomeSeparator:SetPoint("TOPLEFT", referent, "BOTTOMLEFT",
        18, 16 - 30 * optionCount);
    awesomeSeparator:SetText(FLIGHTMAP_OPT_AWESOME_SEPARATOR or "awesome_wotlk:");
    awesomeSeparator:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);

    -- Option: Notify: taskbar icon
    optionCount = optionCount + 1;
    local awesomeLoaded = IsAddOnLoaded("AwesomeCVar");
    local notifyTaskbarBox = lCreateCheckBox(base .. "NotifyTaskbar", parent);
    notifyTaskbarBox.type = CONTROLTYPE_CHECKBOX;
    notifyTaskbarBox.label = "notifyTaskbar";
    notifyTaskbarBox.setFunc = function(value)
        if value == "0" then value = false end
        FlightMapChar.Opts.notifyTaskbar = value;
    end
    notifyTaskbarBox.GetValue = function()
        return (FlightMapChar.Opts.notifyTaskbar and "1" or "0")
    end
    notifyTaskbarBox:SetPoint("TOPLEFT", referent, "BOTTOMLEFT",
        -2, 30 - 30 * optionCount);
    getglobal(notifyTaskbarBox:GetName() .. "Text"):SetText(
        FLIGHTMAP_OPT_NOTIFY_TASKBAR or "Notify: taskbar icon");
    if awesomeLoaded then
        getglobal(notifyTaskbarBox:GetName() .. "Text"):SetTextColor(
            NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    else
        notifyTaskbarBox:Disable();
        getglobal(notifyTaskbarBox:GetName() .. "Text"):SetTextColor(
            GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b);
    end
    options["notifyTaskbar"] = {
        text    = FLIGHTMAP_OPT_NOTIFY_TASKBAR or "Notify: taskbar icon",
        tooltip = FLIGHTMAP_OPT_NOTIFY_TASKBAR_TIP,
        default = nil,
    };

    -- Option: Tooltip font size
    optionCount = optionCount + 1;
    local fontSizeSlider = CreateFrame("Slider", base .. "FontSize",
            parent, "OptionsSliderTemplate");
    fontSizeSlider:SetWidth(200);
    fontSizeSlider:SetHeight(17);
    fontSizeSlider:SetOrientation("HORIZONTAL");
    fontSizeSlider:SetMinMaxValues(8, 20);
    fontSizeSlider:SetValueStep(1);
    
    fontSizeSlider:SetPoint("TOPLEFT", referent, "BOTTOMLEFT",
            8, 15 - 30 * optionCount);
    
    getglobal(fontSizeSlider:GetName() .. "Low"):SetText("8");
    getglobal(fontSizeSlider:GetName() .. "High"):SetText("20");
    getglobal(fontSizeSlider:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_TOOLTIP_FONT_SIZE .. ": 12");
    getglobal(fontSizeSlider:GetName() .. "Text"):SetTextColor(
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);

    fontSizeSlider:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value + 0.5);
        FlightMapChar.Opts.tooltipFontSize = value;
        getglobal(self:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_TOOLTIP_FONT_SIZE .. ": " .. value);
        getglobal(self:GetName() .. "Text"):SetTextColor(
            NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    end);

    fontSizeSlider:SetScript("OnShow", function(self)
        self:SetValue(FlightMapChar.Opts.tooltipFontSize or 12);
        getglobal(self:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_TOOLTIP_FONT_SIZE .. ": " .. (FlightMapChar.Opts.tooltipFontSize or 12));
        getglobal(self:GetName() .. "Text"):SetTextColor(
            NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    end);

    fontSizeSlider:SetScript("OnEnter", function(self)
        GameTooltip_SetDefaultAnchor(GameTooltip, self);
        GameTooltip:SetText(FLIGHTMAP_OPT_TOOLTIP_FONT_SIZE_TIP, nil, nil, nil, nil, true);
        GameTooltip:Show();
    end);
    fontSizeSlider:SetScript("OnLeave", function(self)
        GameTooltip:Hide();
    end);

    -- Option: Max tooltip lines
    optionCount = optionCount + 1;
    local maxLinesSlider = CreateFrame("Slider", base .. "MaxLines",
            parent, "OptionsSliderTemplate");
    maxLinesSlider:SetWidth(200);
    maxLinesSlider:SetHeight(17);
    maxLinesSlider:SetOrientation("HORIZONTAL");
    maxLinesSlider:SetMinMaxValues(20, 80);
    maxLinesSlider:SetValueStep(1);
    maxLinesSlider:SetValue(20);
	
	maxLinesSlider:SetScript("OnShow", function(self)
	    self:SetValue(FlightMapChar.Opts.maxTooltipLines or 20);
		getglobal(self:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_MAX_TOOLTIP_LINES .. ": " .. (FlightMapChar.Opts.maxTooltipLines or 20));
		getglobal(self:GetName() .. "Text"):SetTextColor(
		    NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
	end);
    
    maxLinesSlider:SetPoint("TOPLEFT", referent, "BOTTOMLEFT",
            8, -5 - 30 * optionCount);
    
    getglobal(maxLinesSlider:GetName() .. "Low"):SetText("20");
    getglobal(maxLinesSlider:GetName() .. "High"):SetText("80");
    getglobal(maxLinesSlider:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_MAX_TOOLTIP_LINES .. ": 20");
    getglobal(maxLinesSlider:GetName() .. "Text"):SetTextColor(
        NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    
    maxLinesSlider:Show();
    
    maxLinesSlider:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value + 0.5);
        FlightMapChar.Opts.maxTooltipLines = value;
        getglobal(self:GetName() .. "Text"):SetText(FLIGHTMAP_OPT_MAX_TOOLTIP_LINES .. ": " .. value);
        getglobal(self:GetName() .. "Text"):SetTextColor(
            NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
        lFM_CurrentZone = nil;
        lFM_CurrentArea = nil;
    end);

    maxLinesSlider:SetScript("OnEnter", function(self)
        GameTooltip_SetDefaultAnchor(GameTooltip, self);
        GameTooltip:SetText(FLIGHTMAP_OPT_MAX_TOOLTIP_LINES_TIP, nil, nil, nil, nil, true);
        GameTooltip:Show();
    end);
    maxLinesSlider:SetScript("OnLeave", function(self)
        GameTooltip:Hide();
    end);

    -- Initialise the options panel
    self.name = FLIGHTMAP_OPTIONS_TITLE;
    self.options = options;
    InterfaceOptions_AddCategory(self);

    panel:SetScript("OnShow", function()
        fontSizeSlider:SetValue(FlightMapChar.Opts.tooltipFontSize or 12);
        getglobal(fontSizeSlider:GetName() .. "Text"):SetText(
            FLIGHTMAP_OPT_TOOLTIP_FONT_SIZE .. ": " .. (FlightMapChar.Opts.tooltipFontSize or 12));
        getglobal(fontSizeSlider:GetName() .. "Text"):SetTextColor(
            NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);

        maxLinesSlider:SetValue(FlightMapChar.Opts.maxTooltipLines or 20);
        getglobal(maxLinesSlider:GetName() .. "Text"):SetText(
            FLIGHTMAP_OPT_MAX_TOOLTIP_LINES .. ": " .. (FlightMapChar.Opts.maxTooltipLines or 20));
        getglobal(maxLinesSlider:GetName() .. "Text"):SetTextColor(
            NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);

        local poisEnabled = FlightMapChar.Opts.showPOIs;
        local function applyGrayout(cb, enabled)
            if enabled then
                cb:Enable();
                getglobal(cb:GetName() .. "Text"):SetTextColor(
                    NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
            else
                cb:Disable();
                getglobal(cb:GetName() .. "Text"):SetTextColor(
                    GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b);
            end
        end
        if fmContinentBox then applyGrayout(fmContinentBox, poisEnabled) end
        if fmClassBox     then applyGrayout(fmClassBox,     poisEnabled) end
        if fmTooltipBox   then applyGrayout(fmTooltipBox,   poisEnabled) end

        -- Grey out "Show destinations" children (multi-hop, times, costs)
        local destEnabled = FlightMapChar.Opts.showDestinations;
        for _, cb in pairs(fmDestChildBoxes) do
            applyGrayout(cb, destEnabled);
        end

        -- Grey out "Show zone level ranges" if zone tooltip is off
        if zoneLevelsBox then
            applyGrayout(zoneLevelsBox, FlightMapChar.Opts.showZoneTooltip);
        end

        -- Grey out "Notify: taskbar icon" if AwesomeCVar is not loaded
        if notifyTaskbarBox then
            applyGrayout(notifyTaskbarBox,
                IsAddOnLoaded("AwesomeCVar"));
        end

        -- Sync minimap button checkbox
        if minimapBox then
            minimapBox:SetChecked(FlightMapChar.Opts.showMinimapButton and true or false);
        end

        -- Sync lock flight times checkbox
        if lockTimesBox then
            lockTimesBox:SetChecked(FlightMapChar.Opts.lockFlightTimes and true or false);
        end

        -- Sync all remaining checkboxes
        showPathsBox:SetChecked(FlightMapChar.Opts.showPaths and true or false);
        showPOIsBox:SetChecked(FlightMapChar.Opts.showPOIs and true or false);
        fmContinentBox:SetChecked(FlightMapChar.Opts.showContinentPOIs and true or false);
        fmClassBox:SetChecked(FlightMapChar.Opts.showClassPOIs and true or false);
        fmTooltipBox:SetChecked(FlightMapChar.Opts.showFlightMasterTooltip and true or false);
        showAllInfoBox:SetChecked(FlightMapChar.Opts.showAllInfo and true or false);
        useTimerBox:SetChecked(FlightMapChar.Opts.useTimer and true or false);
        showDestinationsBox:SetChecked(FlightMapChar.Opts.showDestinations and true or false);
        showMultiHopBox:SetChecked(FlightMapChar.Opts.showMultiHop and true or false);
        showTimesBox:SetChecked(FlightMapChar.Opts.showTimes and true or false);
        showCostsBox:SetChecked(FlightMapChar.Opts.showCosts and true or false);
        fullTaxiMapBox:SetChecked(FlightMapChar.Opts.fullTaxiMap and true or false);
        confirmFlightsBox:SetChecked(FlightMapChar.Opts.confirmFlights and true or false);
        zoneTooltipBox:SetChecked(FlightMapChar.Opts.showZoneTooltip and true or false);
        zoneLevelsBox:SetChecked(FlightMapChar.Opts.showZoneLevels and true or false);
        notifyTaskbarBox:SetChecked(FlightMapChar.Opts.notifyTaskbar and true or false);
    end);
end

----------------- Minimap Button -----------------

local FLIGHTMAP_MINIMAP_DEFAULT_ANGLE = 225;

local function lUpdateMinimapButtonPosition()
    local frame = FlightMapMinimapButtonFrame;
    if not frame then return; end
    local angle = (FlightMapChar and FlightMapChar.Opts and FlightMapChar.Opts.minimapButtonAngle)
                  or FLIGHTMAP_MINIMAP_DEFAULT_ANGLE;
    local rad = math.rad(angle);
    local radius = 80;
    frame:ClearAllPoints();
    frame:SetPoint("CENTER", Minimap, "CENTER",
        math.cos(rad) * radius, math.sin(rad) * radius);
end

function FlightMap_UpdateMinimapButton()
    local frame = FlightMapMinimapButtonFrame;
    if not frame then return; end
    if FlightMapChar and FlightMapChar.Opts and FlightMapChar.Opts.showMinimapButton then
        frame:Show();
        lUpdateMinimapButtonPosition();
    else
        frame:Hide();
    end
end

function FlightMapMinimapButton_OnUpdate(self)
    local mx, my = Minimap:GetCenter();
    local scale  = Minimap:GetEffectiveScale();
    local cx, cy = GetCursorPosition();
    cx = cx / scale;
    cy = cy / scale;
    local angle = math.deg(math.atan2(cy - my, cx - mx));
    self:GetParent():ClearAllPoints();
    self:GetParent():SetPoint("CENTER", Minimap, "CENTER",
        math.cos(math.rad(angle)) * 80, math.sin(math.rad(angle)) * 80);
    if FlightMapChar and FlightMapChar.Opts then
        FlightMapChar.Opts.minimapButtonAngle = angle;
    end
end

function FlightMapMinimapButton_OnMouseDown(self, button)
    if button == "RightButton" then
        self:SetScript("OnUpdate", FlightMapMinimapButton_OnUpdate);
    end
end

function FlightMapMinimapButton_OnMouseUp(self, button)
    if button == "RightButton" then
        self:SetScript("OnUpdate", nil);
        lUpdateMinimapButtonPosition();
    elseif button == "LeftButton" then
        if IsShiftKeyDown() then
            FlightMap_OnSlashCmd(FLIGHTMAP_RESET);
        elseif IsControlKeyDown() then
            FlightMapTaxi_ShowContinent();
        else
            InterfaceOptionsFrame_OpenToCategory(InterfaceOptionsFlightMapPanel);
        end
    end
end

function FlightMapMinimapButton_OnEnter(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT");
    GameTooltip:SetText("FlightMap");
    GameTooltip:AddLine(FLIGHTMAP_MINIMAP_TIP1 or "Left click to open FlightMap options.", 1, 1, 1);
    GameTooltip:AddLine(FLIGHTMAP_MINIMAP_TIP3 or "Ctrl left click to open flight map.", 1, 1, 1);
    GameTooltip:AddLine(FLIGHTMAP_MINIMAP_TIP4 or "Shift left click to reset timer bar position.", 1, 1, 1);
    GameTooltip:AddLine(FLIGHTMAP_MINIMAP_TIP2 or "Hold right click to move minimap button.", 1, 1, 1);
    GameTooltip:Show();
end

function FlightMapMinimapButton_OnLeave()
    GameTooltip:Hide();
end