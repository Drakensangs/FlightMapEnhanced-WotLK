-- French localisation

if (GetLocale() == "frFR") then

BINDING_HEADER_FLIGHTMAP = "FlightMap";
BINDING_NAME_FLIGHTMAP   = "Afficher la carte des chemins aériens";

FLIGHTMAP_NAME          = "FlightMap";
FLIGHTMAP_DESCRIPTION   = "Informations des chemins aériens sur la carte du monde";
FLIGHTMAP_ALLIANCE      = "Alliance";
FLIGHTMAP_HORDE         = "Horde";
FLIGHTMAP_CONTESTED     = "Contesté";
FLIGHTMAP_NEUTRAL       = "Neutre";

-- General strings
FLIGHTMAP_TIMING        = "(en cours)";
FLIGHTMAP_LEVELS        = "Niveau de zone: %d - %d";
FLIGHTMAP_NOFLIGHTS     = "Aucun connu!";
FLIGHTMAP_NOT_KNOWN     = "(Inconnu)";
FLIGHTMAP_NO_COST       = "Gratuit";
FLIGHTMAP_MONEY_GOLD    = "o";
FLIGHTMAP_MONEY_SILVER  = "a";
FLIGHTMAP_MONEY_COPPER  = "c";
FLIGHTMAP_FLIGHTTIME    = "Temps de vol: ";
FLIGHTMAP_QUICKEST      = "Trajet le plus rapide";
FLIGHTMAP_TOTAL_TIME    = "Temps total";
FLIGHTMAP_VIA           = "Via ";
FLIGHTMAP_CONFIRM       = "Voulez-vous vraiment rejoindre %s?%s";
FLIGHTMAP_CONFIRM_TIME  = " Ce vol devrait prendre ";

-- Command strings
FLIGHTMAP_RESET         = "réinitialiser";
FLIGHTMAP_SHOWMAP       = "ouvrir";
FLIGHTMAP_LOCKTIMES     = "verrouiller";
FLIGHTMAP_TIMER_HELP    = "Maintenez la touche MAJ et faites glisser la barre de temps pour la déplacer.";

-- Option strings
FLIGHTMAP_OPTIONS_CLOSE = "Fermer";
FLIGHTMAP_OPTIONS_TITLE = "FlightMap";

FLIGHTMAP_OPT_SHOW_PATHS                = "Afficher les lignes de vol";
FLIGHTMAP_OPT_SHOW_PATHS_TIP            = "Dessine des lignes sur la carte du monde pour les chemins de vol.";
FLIGHTMAP_OPT_SHOW_POIS                 = "Icônes des maîtres de vol";
FLIGHTMAP_OPT_SHOW_POIS_TIP             = "Affiche des icônes supplémentaires sur la carte du monde pour les maîtres de vol.";
FLIGHTMAP_OPT_SHOW_ALL_INFO             = "Afficher tous les vols";
FLIGHTMAP_OPT_SHOW_ALL_INFO_TIP         = "Affiche toutes les données, même pour les maîtres de vol non visités.";
FLIGHTMAP_OPT_USE_TIMER                 = "Minuterie en vol";
FLIGHTMAP_OPT_USE_TIMER_TIP             = "Active/désactive l'indicateur de durée de vol.";
FLIGHTMAP_OPT_SHOW_DESTINATIONS         = "Afficher les destinations";
FLIGHTMAP_OPT_SHOW_DESTINATIONS_TIP     = "Affiche les destinations de vol dans les infobulles.";
FLIGHTMAP_OPT_SHOW_MULTI_HOP            = "Inclure les multi-escales";
FLIGHTMAP_OPT_SHOW_MULTI_HOP_TIP        = "Affiche les destinations multi-escales dans les infobulles.";
FLIGHTMAP_OPT_SHOW_TIMES                = "Afficher les durées";
FLIGHTMAP_OPT_SHOW_TIMES_TIP            = "Affiche les temps de vol dans les infobulles.";
FLIGHTMAP_OPT_SHOW_COSTS                = "Afficher les coûts";
FLIGHTMAP_OPT_SHOW_COSTS_TIP            = "Affiche les coûts de vol dans les infobulles.";
FLIGHTMAP_OPT_FULL_TAXI_MAP             = "Fenêtre de vol améliorée";
FLIGHTMAP_OPT_FULL_TAXI_MAP_TIP         = "Affiche le réseau de vol dans la fenêtre de sélection de vol.";
FLIGHTMAP_OPT_CONFIRM_FLIGHTS           = "Confirmer les vols";
FLIGHTMAP_OPT_CONFIRM_FLIGHTS_TIP       = "Demande une confirmation avant de prendre un vol.";
FLIGHTMAP_OPT_SHOW_ZONE_TOOLTIP         = "Afficher l'infobulle de zone";
FLIGHTMAP_OPT_SHOW_ZONE_TOOLTIP_TIP     = "Affiche les informations de vol pour la zone survolée dans le coin inférieur gauche de la carte du monde.";
FLIGHTMAP_OPT_SHOW_ZONE_LEVELS          = "Afficher les plages de niveaux de zone";
FLIGHTMAP_OPT_SHOW_ZONE_LEVELS_TIP      = "Affiche la plage de niveaux recommandée pour chaque zone dans l'infobulle de zone.";
FLIGHTMAP_OPT_AWESOME_SEPARATOR         = "awesome_wotlk:";
FLIGHTMAP_OPT_NOTIFY_TASKBAR            = "Notification: icône de la barre des tâches";
FLIGHTMAP_OPT_NOTIFY_TASKBAR_TIP        = "Fait clignoter l'icône WoW dans la barre des tâches à l'atterrissage. Nécessite awesome_wotlk (AwesomeCVar).";
FLIGHTMAP_OPT_TOOLTIP_FONT_SIZE         = "Taille de police de l'infobulle";
FLIGHTMAP_OPT_TOOLTIP_FONT_SIZE_TIP     = "Ajuste la taille de police de l'infobulle de zone.";
FLIGHTMAP_OPT_MAX_TOOLTIP_LINES         = "Nombre maximal de lignes dans l'infobulle";
FLIGHTMAP_OPT_MAX_TOOLTIP_LINES_TIP     = "Nombre maximal de lignes affichées dans l'infobulle de zone.";
FLIGHTMAP_OPT_SHOW_FM_CONTINENT         = "Icônes de continent du maître de vol";
FLIGHTMAP_OPT_SHOW_FM_CONTINENT_TIP     = "Affiche les icônes de maître de vol sur la carte des continents.";
FLIGHTMAP_OPT_SHOW_FM_CLASS             = "Icônes de maître de vol par classe";
FLIGHTMAP_OPT_SHOW_FM_CLASS_TIP         = "Affiche les icônes de maître de vol spécifiques à la classe.";
FLIGHTMAP_OPT_SHOW_FM_TOOLTIP           = "Infobulle du maître de vol";
FLIGHTMAP_OPT_SHOW_FM_TOOLTIP_TIP       = "Affiche une infobulle avec les informations de vol au survol d'une icône de maître de vol.";
FLIGHTMAP_OPT_LOCK_FLIGHT_TIMES         = "Verrouiller les temps de vol";
FLIGHTMAP_OPT_LOCK_FLIGHT_TIMES_TIP     = "Empêche l'addon d'écrire des données de vol nouvelles ou différentes dans les savedvariables.";

-- Minimap button tooltip strings
FLIGHTMAP_OPT_SHOW_MINIMAP_BUTTON       = "Bouton de la minicarte";
FLIGHTMAP_OPT_SHOW_MINIMAP_BUTTON_TIP   = "Affiche un bouton FlightMap sur la minicarte.";
FLIGHTMAP_MINIMAP_TIP1                  = "Clic gauche pour ouvrir les options FlightMap.";
FLIGHTMAP_MINIMAP_TIP2                  = "Maintenir le clic droit pour déplacer le bouton de la minicarte.";
FLIGHTMAP_MINIMAP_TIP3                  = "Ctrl+clic gauche pour ouvrir la carte de vol.";
FLIGHTMAP_MINIMAP_TIP4                  = "Maj+clic gauche pour réinitialiser la position de la barre de temps.";

-- These constants determine how "Town, Zone" strings look.
-- SEP_STRING is what separates Town from Zone.  SEP_POSTAMBLE
-- is anything that is after Zone.
FLIGHTMAP_SEP_STRING    = ", ";
FLIGHTMAP_SEP_POSTAMBLE = "";

end
