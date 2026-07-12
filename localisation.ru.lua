-- Russian localisation

if (GetLocale() == "ruRU") then

BINDING_HEADER_FLIGHTMAP = "FlightMap";
BINDING_NAME_FLIGHTMAP   = "Показать карту полетов";

FLIGHTMAP_NAME          = "FlightMap";
FLIGHTMAP_DESCRIPTION   = "Информация о точках и путях полета на карте мира";
FLIGHTMAP_ALLIANCE      = "Альянс";
FLIGHTMAP_HORDE         = "Орда";
FLIGHTMAP_CONTESTED     = "Оспариваемые";
FLIGHTMAP_NEUTRAL       = "Нейтральные";

-- General strings
FLIGHTMAP_TIMING        = "(считаю)";
FLIGHTMAP_LEVELS        = "Уровни %d - %d";
FLIGHTMAP_NOFLIGHTS     = "Нет известных!";
FLIGHTMAP_NOT_KNOWN     = "(Неизвестно)";
FLIGHTMAP_NO_COST       = "Бесплатно";
FLIGHTMAP_MONEY_GOLD    = "з";
FLIGHTMAP_MONEY_SILVER  = "с";
FLIGHTMAP_MONEY_COPPER  = "м";
FLIGHTMAP_FLIGHTTIME    = "Время полета: ";
FLIGHTMAP_QUICKEST      = "Кратчайший путь";
FLIGHTMAP_TOTAL_TIME    = "Полное время";
FLIGHTMAP_VIA           = "Через ";
FLIGHTMAP_CONFIRM       = "Уверены, что хотите лететь к %s?%s";
FLIGHTMAP_CONFIRM_TIME  = " Этот полет займет ";

-- Command strings
FLIGHTMAP_RESET         = "сбросить";
FLIGHTMAP_SHOWMAP       = "открыть";
FLIGHTMAP_LOCKTIMES     = "закрепить";
FLIGHTMAP_TIMER_HELP    = "Нажмите SHIFT и перетащите панель таймера для изменения её положения.";

-- Option strings
FLIGHTMAP_OPTIONS_CLOSE = "Закрыть";
FLIGHTMAP_OPTIONS_TITLE = "FlightMap";

FLIGHTMAP_OPT_SHOW_PATHS                = "Линии путей";
FLIGHTMAP_OPT_SHOW_PATHS_TIP            = "Рисует линии на карте мира для путей полета.";
FLIGHTMAP_OPT_SHOW_POIS                 = "Иконки мастеров полета";
FLIGHTMAP_OPT_SHOW_POIS_TIP             = "Показывает дополнительные иконки на карте мира для мастеров полета.";
FLIGHTMAP_OPT_SHOW_ALL_INFO             = "Показать неизвестные";
FLIGHTMAP_OPT_SHOW_ALL_INFO_TIP         = "Показывает все данные, даже для непосещенных мастеров полета.";
FLIGHTMAP_OPT_USE_TIMER                 = "Таймер в полете";
FLIGHTMAP_OPT_USE_TIMER_TIP             = "Включает/выключает индикатор продолжительности полета.";
FLIGHTMAP_OPT_SHOW_DESTINATIONS         = "Точки назначения";
FLIGHTMAP_OPT_SHOW_DESTINATIONS_TIP     = "Показывает пункты назначения полетов во всплывающих подсказках.";
FLIGHTMAP_OPT_SHOW_MULTI_HOP            = "Включая многопрыжковые";
FLIGHTMAP_OPT_SHOW_MULTI_HOP_TIP        = "Показывает многопрыжковые пункты назначения во всплывающих подсказках.";
FLIGHTMAP_OPT_SHOW_TIMES                = "Со временем полета";
FLIGHTMAP_OPT_SHOW_TIMES_TIP            = "Показывает время полета во всплывающих подсказках.";
FLIGHTMAP_OPT_SHOW_COSTS                = "Со стоимостью полета";
FLIGHTMAP_OPT_SHOW_COSTS_TIP            = "Показывает стоимость полетов во всплывающих подсказках.";
FLIGHTMAP_OPT_FULL_TAXI_MAP             = "Улучшенное окно полета";
FLIGHTMAP_OPT_FULL_TAXI_MAP_TIP         = "Показывает сеть полетов в окне выбора рейса.";
FLIGHTMAP_OPT_CONFIRM_FLIGHTS           = "Подтверждать полет";
FLIGHTMAP_OPT_CONFIRM_FLIGHTS_TIP       = "Запрашивает подтверждение перед посадкой на рейс.";
FLIGHTMAP_OPT_SHOW_ZONE_TOOLTIP         = "Показать всплывающую подсказку зоны";
FLIGHTMAP_OPT_SHOW_ZONE_TOOLTIP_TIP     = "Показывает информацию о полетах для зоны, на которую наведен курсор, в левом нижнем углу карты мира.";
FLIGHTMAP_OPT_SHOW_ZONE_LEVELS          = "Показать диапазоны уровней зоны";
FLIGHTMAP_OPT_SHOW_ZONE_LEVELS_TIP      = "Отображает рекомендуемый диапазон уровней для каждой зоны во всплывающей подсказке зоны.";
FLIGHTMAP_OPT_AWESOME_SEPARATOR         = "awesome_wotlk:";
FLIGHTMAP_OPT_NOTIFY_TASKBAR            = "Уведомить: значок на панели задач";
FLIGHTMAP_OPT_NOTIFY_TASKBAR_TIP        = "Мигает значком WoW на панели задач при посадке. Требуется awesome_wotlk (AwesomeCVar).";
FLIGHTMAP_OPT_TOOLTIP_FONT_SIZE         = "Размер шрифта всплывающей подсказки";
FLIGHTMAP_OPT_TOOLTIP_FONT_SIZE_TIP     = "Регулирует размер шрифта всплывающей подсказки зоны.";
FLIGHTMAP_OPT_MAX_TOOLTIP_LINES         = "Максимальное количество строк во всплывающей подсказке";
FLIGHTMAP_OPT_MAX_TOOLTIP_LINES_TIP     = "Максимальное количество строк, отображаемых во всплывающей подсказке зоны.";
FLIGHTMAP_OPT_SHOW_FM_CONTINENT         = "Иконки континентов мастера полетов";
FLIGHTMAP_OPT_SHOW_FM_CONTINENT_TIP     = "Отображает иконки мастера полетов на карте континентов.";
FLIGHTMAP_OPT_SHOW_FM_CLASS             = "Иконки мастера полетов по классам";
FLIGHTMAP_OPT_SHOW_FM_CLASS_TIP         = "Отображает иконки мастера полетов для конкретных классов.";
FLIGHTMAP_OPT_SHOW_FM_TOOLTIP           = "Всплывающая подсказка мастера полетов";
FLIGHTMAP_OPT_SHOW_FM_TOOLTIP_TIP       = "Отображает всплывающую подсказку с информацией о рейсе при наведении курсора на иконку мастера полетов.";
FLIGHTMAP_OPT_LOCK_FLIGHT_TIMES         = "Закрепить время полета";
FLIGHTMAP_OPT_LOCK_FLIGHT_TIMES_TIP     = "Запрещает аддону записывать новые или отличающиеся данные о полётах в savedvariables.";

-- Minimap button tooltip strings
FLIGHTMAP_OPT_SHOW_MINIMAP_BUTTON       = "Кнопка миникарты";
FLIGHTMAP_OPT_SHOW_MINIMAP_BUTTON_TIP   = "Показывает кнопку FlightMap на миникарте.";
FLIGHTMAP_MINIMAP_TIP1                  = "Левый клик для открытия настроек FlightMap.";
FLIGHTMAP_MINIMAP_TIP2                  = "Удерживать правый клик для перемещения кнопки миникарты.";
FLIGHTMAP_MINIMAP_TIP3                  = "Ctrl+левый клик для открытия карты полетов.";
FLIGHTMAP_MINIMAP_TIP4                  = "Shift+левый клик для сброса положения панели таймера.";

-- These constants determine how "Town, Zone" strings look.
-- SEP_STRING is what separates Town from Zone.  SEP_POSTAMBLE
-- is anything that is after Zone.
FLIGHTMAP_SEP_STRING    = ", ";
FLIGHTMAP_SEP_POSTAMBLE = "";

end
