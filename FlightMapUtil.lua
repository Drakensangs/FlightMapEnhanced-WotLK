-- Utility functions for FlightMap

FlightMapUtil = {};

------- Data access functions

-- Break up a "Town, Zone" string into town and zone components.  If
-- there's no comma, ie, Moonglade, the string will be returned for
-- both town and zone.
FlightMapUtil.getNameAndZone = function(taxipath)
    local comma = string.find(taxipath, FLIGHTMAP_SEP_STRING, 1, true);
    if (comma) then
        local name = string.sub(taxipath, 1, comma - 1);
        local zone = string.sub(taxipath,
                comma + string.len(FLIGHTMAP_SEP_STRING),
                -1 - string.len(FLIGHTMAP_SEP_POSTAMBLE));
        return name, zone;
    else
        return taxipath, taxipath;
    end
end

-- Construct a node name from its continent and taxi coordinates
FlightMapUtil.makeNodeName = function(continent, taxiX, taxiY)
    return string.format("%d:%d:%d", continent, taxiX * 1000, taxiY * 1000);
end

local lSessionMap = {};

-- Return the flight map appropriate to the current character.
FlightMapUtil.getFlightMap = function()
    local faction = UnitFactionGroup("player");
    if not faction then return {}; end

    if lSessionMap[faction] then
        return lSessionMap[faction];
    end

    local map = {};

    for k, v in pairs(FLIGHTMAP_FLIGHTS) do
        if v.Faction == nil or v.Faction == faction then
            local node = {};
            for field, val in pairs(v) do
                if field == "Location" then
                    local loc = {};
                    for space, coords in pairs(val) do
                        local c = {};
                        for axis, coord in pairs(coords) do c[axis] = coord; end
                        loc[space] = c;
                    end
                    node[field] = loc;
                elseif type(val) == "table" then
                    local t = {};
                    for sk, sv2 in pairs(val) do t[sk] = sv2; end
                    node[field] = t;
                else
                    node[field] = val;
                end
            end
            -- Guarantee sub-tables always exist
            if not node.Flights then node.Flights = {}; end
            if not node.Costs   then node.Costs   = {}; end
            if not node.Routes  then node.Routes  = {}; end
            map[k] = node;
        end
    end

    local overrides = FlightMap[faction];
    if overrides then
        for k, savedNode in pairs(overrides) do
            if not map[k] then
                -- Completely new node the player discovered; copy it in.
                local node = {};
                for field, val in pairs(savedNode) do
                    if field == "Location" then
                        local loc = {};
                        for space, coords in pairs(val) do
                            local c = {};
                            for axis, coord in pairs(coords) do c[axis] = coord; end
                            loc[space] = c;
                        end
                        node[field] = loc;
                    elseif type(val) == "table" then
                        local t = {};
                        for sk, sv2 in pairs(val) do t[sk] = sv2; end
                        node[field] = t;
                    else
                        node[field] = val;
                    end
                end
                if not node.Flights then node.Flights = {}; end
                if not node.Costs   then node.Costs   = {}; end
                if not node.Routes  then node.Routes  = {}; end
                map[k] = node;
            else
                -- Known node: merge override fields over the defaults.
                for field, val in pairs(savedNode) do
                    if type(val) == "table" and type(map[k][field]) == "table" then
                        -- Merge sub-table entries individually
                        for sk, sv2 in pairs(val) do
                            map[k][field][sk] = sv2;
                        end
                    else
                        map[k][field] = val;
                    end
                end
            end
        end
    end

    lSessionMap[faction] = map;
    return map;
end

local lPlayerKey = nil;

local lZoneNodeCache = {};

FlightMapUtil.resetFlightMapCache = function()
    lSessionMap = {};
    lPlayerKey  = nil;
    lZoneNodeCache = {};
end

FlightMapUtil.lGetOverrides = function(faction)
    if not FlightMap[faction] then FlightMap[faction] = {}; end
    return FlightMap[faction];
end

FlightMapUtil.eachNode = function(map)
    return pairs(map);
end

-- Returns true if the current character has seen a given node;
-- if the second argument is a true value, teaches the character of
-- the node's existence.

FlightMapUtil.knownNode = function(node, learning)
    if not lPlayerKey then
        lPlayerKey = UnitName("player") .. "@" .. GetCVar("realmName");
    end

    local known = FlightMapChar.Knowledge[lPlayerKey];
    if not known then
        known = {};
        FlightMapChar.Knowledge[lPlayerKey] = known;
    end

    if learning then
        known[node] = true;
    end

    return known[node];
end

-- TODO: put elsewhere
-- Nodes that belong to class specific flight masters
local FLIGHTMAP_NODE_CLASS_RESTRICTION = {
    ["1:549:807"] = "DRUID",
    ["1:549:806"] = "DRUID",
    ["2:622:655"] = "DEATHKNIGHT",
};

FlightMapUtil.isNodeVisibleToPlayer = function(node)
    local restriction = FLIGHTMAP_NODE_CLASS_RESTRICTION[node];
    if not restriction then return true; end
    return FlightMapChar.Opts.showClassPOIs ~= false;
end;

FlightMapUtil.lZoneNameMap = {};
FlightMapUtil.lContinentNameMap = {};

local LoadNames = function(map, ...)
    for i=1, select("#", ...) do
        map[i] = select(i, ...);
    end
end

FlightMapUtil.getContinentName = function(c)
    if not FlightMapUtil.lContinentNameMap[c] then
        LoadNames(FlightMapUtil.lContinentNameMap, GetMapContinents());
    end

    return FlightMapUtil.lContinentNameMap[c];
end

-- Return the name of the current map zone
FlightMapUtil.getZoneName = function()
    local cNum = GetCurrentMapContinent();
    local zNum = GetCurrentMapZone();
    if not FlightMapUtil.lZoneNameMap[cNum] then
        FlightMapUtil.lZoneNameMap[cNum] = {};
        LoadNames(FlightMapUtil.lZoneNameMap[cNum], GetMapZones(cNum));
    end

    return FlightMapUtil.lZoneNameMap[cNum][zNum];
end


-- Returns a table of nodes in a given zone; if second optional
-- argument is present and true, also returns subzone nodes.
FlightMapUtil.getNodesInZone = function(zone, subZones)
    local cacheKey = zone .. (subZones and ":1" or ":0");
    if lZoneNodeCache[cacheKey] then
        return lZoneNodeCache[cacheKey];
    end

    local map = FlightMapUtil.getFlightMap();
    local nodes = {};
    for k, v in pairs(map) do
        if v.Zone == zone then
            nodes[k] = v;
        elseif subZones and FLIGHTMAP_SUBZONES[v.Zone] == zone then
            nodes[k] = v;
        end
    end

    lZoneNodeCache[cacheKey] = nodes;
    return nodes;
end

-- Get the current continent number
FlightMapUtil.getContinent = function()
    SetMapToCurrentZone();
    return GetCurrentMapContinent();
end

------- Format and display functions

-- Format a second amount into m:ss, returning "-:--" for zero seconds
-- unless the "showZero" argument is true
FlightMapUtil.formatTime = function(secs, showZero)
    if secs == 0 and not showZero then return "-:--"; end

    return string.format("%d:%02d", secs / 60, mod(secs, 60));
end

local lFMT_GOLD   = "|cffddbb00%d%s|r";
local lFMT_SILVER = "|cffcccccc%d%s|r";
local lFMT_COPPER = "|cffcc9010%d%s|r";

-- Format a copper amount into a gold, silver, copper string
FlightMapUtil.formatMoney = function(amount)
    local copper = mod(amount, 100);
    local silver = mod(math.floor(amount/100), 100);
    local gold   = math.floor(amount/10000);

    local result = "";
    local pad = "";

    -- Only show gold and silver if they are non-zero
    if gold > 0 then
        local s = string.format(lFMT_GOLD, gold, FLIGHTMAP_MONEY_GOLD);
        result = result .. s;
        pad = " ";
    end
    if silver > 0 then
        local s = string.format(lFMT_SILVER, silver, FLIGHTMAP_MONEY_SILVER);
        result = result .. pad .. s;
        pad = " ";
    end

    -- But show copper anyway if there's neither gold nor silver..
    if (gold == 0 and silver == 0) or copper > 0 then
        local s = string.format(lFMT_COPPER, copper, FLIGHTMAP_MONEY_COPPER);
        result = result .. pad .. s;
    end

    return result;
end

-- Draw a line by stretching the texture widget given in texture
-- across the parent frame given in parent.  The coordinates
-- should be expressed as a number between 0 and 1, representing
-- the homogenized space of the parent.  (0, 0) is the lower left
-- corner.
FlightMapUtil.drawLine = function(parent, texture, x1, y1, x2, y2)
    texture:ClearAllPoints();

    -- Get the line deltas in pixels
    local dx = abs((x1 - x2) * parent:GetWidth());
    local dy = abs((y1 - y2) * parent:GetHeight());

    -- Seven possible cases:
    -- 1) Horizontal line (dy = 0)
    -- 2) Vertical line (dx = 0)
    -- 3) source is ABOVE and RIGHT of dest
    -- 4) source is BELOW and RIGHT of dest
    -- 5) source is ABOVE and LEFT of dest
    -- 6) source is BELOW and LEFT of dest
    -- 7) Source and destination are equal

    -- Equal points is the easiest case.
    if dx == 0 and dy == 0 then
        texture:Hide();
        return false;
    end

    -- The remaining cases can be reduced to four by swapping the
    -- source and destination points to ensure the source point is
    -- always to the left of the destination point:
    if x1 > x2 then
        local tmpX = x1;
        local tmpY = y1;
        x1 = x2; x2 = tmpX;
        y1 = y2; y2 = tmpY;
    end

    -- And then further reduced to two by making sure no lines really
    -- are horizontal or vertical
    if dy < 1 then dy = 1; end
    if dx < 1 then dx = 1; end

    -- Clip the texture if either delta is smaller than the base size
    -- This prevents the texture from being scaled down, which could result
    -- in parts of the line vanishing during interpolation.
    local clipsize = dx;
    if dy < dx then clipsize = dy; end

    -- Now normalize the clipping size to 0-1
    clipsize = clipsize / FLIGHTMAP_LINE_SIZE;
    if clipsize > 1 then clipsize = 1; end

    local anchorPoint = "NONE";
    if y1 > y2 then       -- Case 1: source ABOVE dest
        -- Set correct texture
        texture:SetTexture(FLIGHTMAP_TEX_UP);
        -- Use the bottom left corner of it
        texture:SetTexCoord(0, clipsize, 1 - clipsize, 1);
        -- Place the bottom left corner
        anchorPoint = "BOTTOMLEFT";
    else                        -- Case 2: source BELOW dest
        -- Set correct texture
        texture:SetTexture(FLIGHTMAP_TEX_DOWN);
        -- Use the top left corner of it
        texture:SetTexCoord(0, clipsize, 0, clipsize);
        -- Place the top left corner
        anchorPoint = "TOPLEFT";
    end

    -- Set the origin, using whichever anchor point is appropriate
    texture:SetPoint(anchorPoint, parent, "TOPLEFT",
        x1 * parent:GetWidth(),
        -y1 * parent:GetHeight());

    -- Set the texture's width and height
    texture:SetWidth(dx);
    texture:SetHeight(dy);

    -- Show the texture
    texture:Show();

    -- Success :)
    return true;
end
