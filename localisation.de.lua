-- German localisation

if (GetLocale() == "deDE") then

BINDING_HEADER_FLIGHTMAP = "Flugkarte";
BINDING_NAME_FLIGHTMAP   = "Zeige Flugkarte";

FLIGHTMAP_NAME          = "Flugkarte";
FLIGHTMAP_DESCRIPTION   = "Fluglinieninfos auf der Weltkarte";
FLIGHTMAP_ALLIANCE      = "Allianz";
FLIGHTMAP_HORDE         = "Horde";
FLIGHTMAP_CONTESTED     = "Umkämpft";
FLIGHTMAP_NEUTRAL       = "Neutral";

-- General strings
FLIGHTMAP_TIMING        = "(Zeitberechnung)";
FLIGHTMAP_LEVELS        = "Zonen-Level: %d - %d";
FLIGHTMAP_NOFLIGHTS     = "Keine bekannt!";
FLIGHTMAP_NOT_KNOWN     = "(Nicht bekannt)";
FLIGHTMAP_NO_COST       = "Kostenlos";
FLIGHTMAP_MONEY_GOLD    = "g";
FLIGHTMAP_MONEY_SILVER  = "s";
FLIGHTMAP_MONEY_COPPER  = "k";
FLIGHTMAP_FLIGHTTIME    = "Flugzeit: ";
FLIGHTMAP_QUICKEST      = "Schnellste Verbindung";
FLIGHTMAP_TOTAL_TIME    = "Gesamtdauer";
FLIGHTMAP_VIA           = "Über ";
FLIGHTMAP_CONFIRM       = "Bist du sicher dass du nach %s fliegen willst?%s";
FLIGHTMAP_CONFIRM_TIME  = " Dieser Flug dauert ";

-- Command strings
FLIGHTMAP_RESET         = "zurücksetzen";
FLIGHTMAP_SHOWMAP       = "öffnen";
FLIGHTMAP_LOCKTIMES     = "sperren";
FLIGHTMAP_TIMER_HELP    = "Halte die SHIFT-Taste gedrückt und verschiebe die Zeitleiste zum Neuanordnen.";

-- Option strings
FLIGHTMAP_OPTIONS_CLOSE = "Schließen";
FLIGHTMAP_OPTIONS_TITLE = "FlightMap";

FLIGHTMAP_OPT_SHOW_PATHS                = "Flugrouten-Linien";
FLIGHTMAP_OPT_SHOW_PATHS_TIP            = "Zeichnet Linien auf der Weltkarte für Flugrouten.";
FLIGHTMAP_OPT_SHOW_POIS                 = "Flugmeister-Symbole";
FLIGHTMAP_OPT_SHOW_POIS_TIP             = "Zeigt zusätzliche Weltkartensymbole für Flugmeister an.";
FLIGHTMAP_OPT_SHOW_ALL_INFO             = "Zeige alle Infos";
FLIGHTMAP_OPT_SHOW_ALL_INFO_TIP         = "Zeigt alle Daten an, auch für nicht besuchte Flugmeister.";
FLIGHTMAP_OPT_USE_TIMER                 = "Restdauer-Anzeige";
FLIGHTMAP_OPT_USE_TIMER_TIP             = "Aktiviert/deaktiviert die Anzeige der Flugdauer.";
FLIGHTMAP_OPT_SHOW_DESTINATIONS         = "Zeige Zielorte";
FLIGHTMAP_OPT_SHOW_DESTINATIONS_TIP     = "Zeigt Flugziele in Tooltips an.";
FLIGHTMAP_OPT_SHOW_MULTI_HOP            = "Multi-Hop einbeziehen";
FLIGHTMAP_OPT_SHOW_MULTI_HOP_TIP        = "Zeigt Multi-Hop-Ziele in Tooltips an.";
FLIGHTMAP_OPT_SHOW_TIMES                = "Zeige Flugdauer";
FLIGHTMAP_OPT_SHOW_TIMES_TIP            = "Zeigt Flugzeiten in Tooltips an.";
FLIGHTMAP_OPT_SHOW_COSTS                = "Zeige Flugkosten";
FLIGHTMAP_OPT_SHOW_COSTS_TIP            = "Zeigt Flugkosten in Tooltips an.";
FLIGHTMAP_OPT_FULL_TAXI_MAP             = "Vollständige Flugkarte";
FLIGHTMAP_OPT_FULL_TAXI_MAP_TIP         = "Zeigt das Flugnetz im Flugauswahlfenster an.";
FLIGHTMAP_OPT_CONFIRM_FLIGHTS           = "Flüge bestätigen";
FLIGHTMAP_OPT_CONFIRM_FLIGHTS_TIP       = "Fragt vor dem Abflug nach einer Bestätigung.";
FLIGHTMAP_OPT_SHOW_ZONE_TOOLTIP         = "Zonen-Tooltip anzeigen";
FLIGHTMAP_OPT_SHOW_ZONE_TOOLTIP_TIP     = "Zeigt Fluginformationen für die Zone, über die der Mauszeiger bewegt wird, in der unteren linken Ecke der Weltkarte an.";
FLIGHTMAP_OPT_SHOW_ZONE_LEVELS          = "Zonen-Levelbereiche anzeigen";
FLIGHTMAP_OPT_SHOW_ZONE_LEVELS_TIP      = "Zeigt den empfohlenen Levelbereich für jede Zone im Zonen-Tooltip an.";
FLIGHTMAP_OPT_AWESOME_SEPARATOR         = "awesome_wotlk:";
FLIGHTMAP_OPT_NOTIFY_TASKBAR            = "Benachrichtigung: Taskleistensymbol";
FLIGHTMAP_OPT_NOTIFY_TASKBAR_TIP        = "Lässt das WoW-Taskleistensymbol blinken, wenn du landest. Erfordert awesome_wotlk (AwesomeCVar).";
FLIGHTMAP_OPT_TOOLTIP_FONT_SIZE         = "Schriftgröße des Tooltips";
FLIGHTMAP_OPT_TOOLTIP_FONT_SIZE_TIP     = "Passt die Schriftgröße des Zonen-Tooltips an.";
FLIGHTMAP_OPT_MAX_TOOLTIP_LINES         = "Maximale Anzahl an Tooltip-Zeilen";
FLIGHTMAP_OPT_MAX_TOOLTIP_LINES_TIP     = "Maximale Anzahl der im Zonen-Tooltip angezeigten Zeilen.";
FLIGHTMAP_OPT_SHOW_FM_CONTINENT         = "Flugmeister-Kontinentsymbole";
FLIGHTMAP_OPT_SHOW_FM_CONTINENT_TIP     = "Zeigt Flugmeistersymbole auf der Kontinentkarte an.";
FLIGHTMAP_OPT_SHOW_FM_CLASS             = "Klassenspezifische Flugmeistersymbole";
FLIGHTMAP_OPT_SHOW_FM_CLASS_TIP         = "Zeigt klassenspezifische Flugmeistersymbole an.";
FLIGHTMAP_OPT_SHOW_FM_TOOLTIP           = "Flugmeister-Tooltip";
FLIGHTMAP_OPT_SHOW_FM_TOOLTIP_TIP       = "Zeigt einen Tooltip mit Fluginformationen beim Überfahren eines Flugmeistersymbols an.";
FLIGHTMAP_OPT_LOCK_FLIGHT_TIMES         = "Flugzeiten sperren";
FLIGHTMAP_OPT_LOCK_FLIGHT_TIMES_TIP     = "Verhindert, dass das Addon neue oder geänderte Flugdaten in die savedvariables schreibt.";

-- Minimap button tooltip strings
FLIGHTMAP_OPT_SHOW_MINIMAP_BUTTON       = "Minimap-Schaltfläche";
FLIGHTMAP_OPT_SHOW_MINIMAP_BUTTON_TIP   = "Zeigt eine FlightMap-Schaltfläche auf der Minimap an.";
FLIGHTMAP_MINIMAP_TIP1                  = "Linksklick zum Öffnen der FlightMap-Optionen.";
FLIGHTMAP_MINIMAP_TIP2                  = "Rechtsklick gedrückt halten zum Verschieben der Minimap-Schaltfläche.";
FLIGHTMAP_MINIMAP_TIP3                  = "Strg+Linksklick zum Öffnen der Flugkarte.";
FLIGHTMAP_MINIMAP_TIP4                  = "Umschalt+Linksklick zum Zurücksetzen der Zeitleisteposition.";

-- These constants determine how "Town, Zone" strings look.
-- SEP_STRING is what separates Town from Zone.  SEP_POSTAMBLE
-- is anything that is after Zone.
FLIGHTMAP_SEP_STRING    = ", ";
FLIGHTMAP_SEP_POSTAMBLE = "";

end
