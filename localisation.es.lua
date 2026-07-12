-- Spanish localisation

if (GetLocale() == "esES") then

BINDING_HEADER_FLIGHTMAP = "FlightMap";
BINDING_NAME_FLIGHTMAP   = "Mostrar mapa de vuelo";

FLIGHTMAP_NAME          = "FlightMap";
FLIGHTMAP_DESCRIPTION   = "Información de rutas de vuelo en el Mapa del Mundo";
FLIGHTMAP_ALLIANCE      = "Alianza";
FLIGHTMAP_HORDE         = "Horda";
FLIGHTMAP_CONTESTED     = "En Disputa";
FLIGHTMAP_NEUTRAL       = "Neutral";

-- General strings
FLIGHTMAP_TIMING        = "(cronometrando)";
FLIGHTMAP_LEVELS        = "Niveles %d - %d";
FLIGHTMAP_NOFLIGHTS     = "¡Ninguno conocido!";
FLIGHTMAP_NOT_KNOWN     = "(Desconocido)";
FLIGHTMAP_NO_COST       = "Gratis";
FLIGHTMAP_MONEY_GOLD    = "o";
FLIGHTMAP_MONEY_SILVER  = "p";
FLIGHTMAP_MONEY_COPPER  = "c";
FLIGHTMAP_FLIGHTTIME    = "Duración del vuelo: ";
FLIGHTMAP_QUICKEST      = "Ruta más rápida";
FLIGHTMAP_TOTAL_TIME    = "Tiempo total";
FLIGHTMAP_VIA           = "Por ";
FLIGHTMAP_CONFIRM       = "¿Estás seguro de que deseas volar a %s?%s";
FLIGHTMAP_CONFIRM_TIME  = " Este vuelo tardará ";

-- Command strings
FLIGHTMAP_RESET         = "reiniciar";
FLIGHTMAP_SHOWMAP       = "abrir";
FLIGHTMAP_LOCKTIMES     = "bloquear";
FLIGHTMAP_TIMER_HELP    = "Pulsa MAYÚS y arrastra la barra de tiempo para cambiar su posición.";

-- Option strings
FLIGHTMAP_OPTIONS_CLOSE = "Cerrar";
FLIGHTMAP_OPTIONS_TITLE = "FlightMap";

FLIGHTMAP_OPT_SHOW_PATHS                = "Líneas de ruta de vuelo";
FLIGHTMAP_OPT_SHOW_PATHS_TIP            = "Dibuja líneas en el mapa del mundo para las rutas de vuelo.";
FLIGHTMAP_OPT_SHOW_POIS                 = "Iconos de maestros de vuelo";
FLIGHTMAP_OPT_SHOW_POIS_TIP             = "Muestra iconos adicionales en el mapa del mundo para los maestros de vuelo.";
FLIGHTMAP_OPT_SHOW_ALL_INFO             = "Mostrar vuelos desconocidos";
FLIGHTMAP_OPT_SHOW_ALL_INFO_TIP         = "Muestra todos los datos, incluso para maestros de vuelo no visitados.";
FLIGHTMAP_OPT_USE_TIMER                 = "Temporizador en vuelo";
FLIGHTMAP_OPT_USE_TIMER_TIP             = "Activa/desactiva el medidor de duración de vuelo.";
FLIGHTMAP_OPT_SHOW_DESTINATIONS         = "Mostrar destinos";
FLIGHTMAP_OPT_SHOW_DESTINATIONS_TIP     = "Muestra los destinos de vuelo en los tooltips.";
FLIGHTMAP_OPT_SHOW_MULTI_HOP            = "Incluir multisalto";
FLIGHTMAP_OPT_SHOW_MULTI_HOP_TIP        = "Muestra los destinos multisalto en los tooltips.";
FLIGHTMAP_OPT_SHOW_TIMES                = "Con tiempos de vuelo";
FLIGHTMAP_OPT_SHOW_TIMES_TIP            = "Muestra los tiempos de vuelo en los tooltips.";
FLIGHTMAP_OPT_SHOW_COSTS                = "Con costes de vuelo";
FLIGHTMAP_OPT_SHOW_COSTS_TIP            = "Muestra los costes de vuelo en los tooltips.";
FLIGHTMAP_OPT_FULL_TAXI_MAP             = "Ventana de vuelo mejorada";
FLIGHTMAP_OPT_FULL_TAXI_MAP_TIP         = "Muestra la red de vuelo en la ventana de selección de vuelo.";
FLIGHTMAP_OPT_CONFIRM_FLIGHTS           = "Confirmar vuelos";
FLIGHTMAP_OPT_CONFIRM_FLIGHTS_TIP       = "Solicita confirmación antes de tomar un vuelo.";
FLIGHTMAP_OPT_SHOW_ZONE_TOOLTIP         = "Mostrar información sobre la zona";
FLIGHTMAP_OPT_SHOW_ZONE_TOOLTIP_TIP     = "Muestra información de vuelo para la zona sobre la que se encuentra el cursor en la esquina inferior izquierda del mapa del mundo.";
FLIGHTMAP_OPT_SHOW_ZONE_LEVELS          = "Mostrar rangos de nivel de zona";
FLIGHTMAP_OPT_SHOW_ZONE_LEVELS_TIP      = "Muestra el rango de nivel recomendado para cada zona en el tooltip de zona.";
FLIGHTMAP_OPT_AWESOME_SEPARATOR         = "awesome_wotlk:";
FLIGHTMAP_OPT_NOTIFY_TASKBAR            = "Notificar: icono de la barra de tareas";
FLIGHTMAP_OPT_NOTIFY_TASKBAR_TIP        = "Parpadea el icono de WoW en la barra de tareas al aterrizar. Requiere awesome_wotlk (AwesomeCVar).";
FLIGHTMAP_OPT_TOOLTIP_FONT_SIZE         = "Tamaño de fuente del tooltip";
FLIGHTMAP_OPT_TOOLTIP_FONT_SIZE_TIP     = "Ajusta el tamaño de fuente del tooltip de zona.";
FLIGHTMAP_OPT_MAX_TOOLTIP_LINES         = "Número máximo de líneas del tooltip";
FLIGHTMAP_OPT_MAX_TOOLTIP_LINES_TIP     = "Número máximo de líneas que se muestran en el tooltip de zona.";
FLIGHTMAP_OPT_SHOW_FM_CONTINENT         = "Iconos de continente del maestro de vuelo";
FLIGHTMAP_OPT_SHOW_FM_CONTINENT_TIP     = "Muestra iconos del maestro de vuelo en el mapa de continentes.";
FLIGHTMAP_OPT_SHOW_FM_CLASS             = "Iconos del maestro de vuelo por clase";
FLIGHTMAP_OPT_SHOW_FM_CLASS_TIP         = "Muestra iconos del maestro de vuelo específicos de cada clase.";
FLIGHTMAP_OPT_SHOW_FM_TOOLTIP           = "Tooltip del maestro de vuelo";
FLIGHTMAP_OPT_SHOW_FM_TOOLTIP_TIP       = "Muestra un tooltip con información de vuelo al pasar el cursor sobre un icono del maestro de vuelo.";
FLIGHTMAP_OPT_LOCK_FLIGHT_TIMES         = "Bloquear tiempos de vuelo";
FLIGHTMAP_OPT_LOCK_FLIGHT_TIMES_TIP     = "Impide que el addon escriba datos de vuelo nuevos o diferentes en las savedvariables.";

-- Minimap button tooltip strings
FLIGHTMAP_OPT_SHOW_MINIMAP_BUTTON       = "Botón del minimapa";
FLIGHTMAP_OPT_SHOW_MINIMAP_BUTTON_TIP   = "Muestra un botón de FlightMap en el minimapa.";
FLIGHTMAP_MINIMAP_TIP1                  = "Clic izquierdo para abrir las opciones de FlightMap.";
FLIGHTMAP_MINIMAP_TIP2                  = "Mantén el clic derecho para mover el botón del minimapa.";
FLIGHTMAP_MINIMAP_TIP3                  = "Ctrl+clic izquierdo para abrir el mapa de vuelo.";
FLIGHTMAP_MINIMAP_TIP4                  = "Mayús+clic izquierdo para restablecer la posición de la barra de tiempo.";

-- These constants determine how "Town, Zone" strings look.
-- SEP_STRING is what separates Town from Zone.  SEP_POSTAMBLE
-- is anything that is after Zone.
FLIGHTMAP_SEP_STRING    = ", ";
FLIGHTMAP_SEP_POSTAMBLE = "";

end
