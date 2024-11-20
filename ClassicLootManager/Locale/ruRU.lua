local _, CLM = ...
if GetLocale() == "ruRU" then
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:351
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:323
CLM.L[" alt of: "] = " альт игрока: "
-- ClassicLootManager/Utils.lua:581
CLM.L[" more"] = " подробнее "
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:172
CLM.L[" over "] = " над "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:396
CLM.L[" profile(s)"] = " профиль(-ей)"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:321
CLM.L["% that will be decayed."] = "% будет сожжено."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:393
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:408
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:454
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:344
CLM.L["%Y/%m/%d %H:%M:%S (%A)"] = "%Y/%m/%d %H:%M:%S (%A)"
-- ClassicLootManager_Integrations/Models/Exporter.lua:328
-- ClassicLootManager_Integrations/Models/Exporter.lua:329
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:253
CLM.L["%Y/%m/%d %a %H:%M:%S"] = "%Y/%m/%d %a %H:%M:%S"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:591
CLM.L["%d/%m/%Y %H:%M:%S"] = "%d/%m/%Y %H:%M:%S"
-- ClassicLootManager_Alerts/Alerts.lua:22
CLM.L["%s %% %s decay"] = "%s %% %s сгорание"
-- ClassicLootManager_Alerts/Alerts.lua:20
CLM.L["%s %s"] = "%s %s"
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:183
CLM.L["%s awarded to %s for %s %s"] = "%s вручено %s за %s %s"
-- ClassicLootManager/MinimapIcon.lua:39
CLM.L["%s events (%s pending)"] = "%s событий (%s ожидает)"
-- ClassicLootManager/MinimapIcon.lua:41
CLM.L["%s events (0x%x)"] = "%s событий (0x%x)"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:38
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:68
CLM.L["%s has %s standby"] = "%s имеет %s замен"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:59
CLM.L["%s is not part of the %s roster"] = "%s не является частью %s состава"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:135
CLM.L["%s profile exists."] = "%s профиль существует"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:137
CLM.L["%s profile missing. Adding."] = "%s профиль отсутствует. Добавляю."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:480
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:490
CLM.L["%s to %s for %s in <%s>"] = "%s для %s за %s в <%s>"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1037
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1045
CLM.L["%s to be awarded to player when joining roster."] = "%s будет вручен игроку при вступлении в состав."
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:172
CLM.L["%s trade me for %s"] = "%s открыл трейд для %s"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:143
CLM.L["%s was not found in guild."] = "%s не был найден в гильдии"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:101
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:101
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:102
CLM.L["-- All --"] = "-- Все --"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:26
CLM.L["10 Player (Heroic)"] = "10 человек (героик)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:24
CLM.L["10 Player"] = "10 человек"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:25
CLM.L["20 Player"] = "20 человек"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:28
CLM.L["25 Player (Heroic)"] = "25 человек (героик)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:27
CLM.L["25 Player"] = "25 человек"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:22
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:23
CLM.L["40 Player"] = "40 человек"
-- ClassicLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:19
CLM.L["Accept from"] = "Принять из"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:910
CLM.L["Accepting rolls on %s for %s %s"] = "Принятие роллов на %s для %s %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:150
CLM.L["Action context"] = "Контекст действия"
-- ClassicLootManager_Integrations/Integrations.lua:156
CLM.L["Action to take upon Gargul loot award event happening during raid."] = "Действие, в случае вручения добычи через Gargul loot, во время рейда."
-- ClassicLootManager_Integrations/Integrations.lua:261
CLM.L["Action to take upon RCLC loot award event happening during raid. Trigger is based on RCLC award reason or player response if reason is not used. On Integration Enable the buttons will be prefilled with existing ones."] = "Действие, которое будет сделано в случае выдачи предмета в RCLC во время рейда. Триггер основан на событии выдачи вещи RCLC или на ответе игроков, если применяется опрос. В случае применения интеграции внопки будут предзаполнены требуемыми значениями."
-- ClassicLootManager_Integrations/GenericImport.lua:180
CLM.L["Add Profiles to Rosters"] = "Добавить профили в составы"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:129
CLM.L["Add currently selected target to list."] = "Добавить текущую цель в список."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:128
CLM.L["Add target"] = "Добавить цель"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:149
CLM.L["Add to roster"] = "Добавить в состав"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:635
CLM.L["Add to standby"] = "Добавить на замену"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:396
CLM.L["Add"] = "Добавить"
-- ClassicLootManager_Integrations/Migration.lua:380
CLM.L["Adding %s loot entries for team to %s"] = "Добавляю %s добычи для состава %s"
-- ClassicLootManager_Integrations/Migration.lua:239
-- ClassicLootManager_Integrations/Migration.lua:358
CLM.L["Adding %s profiles to %s"] = "Добавляю %s профилей для %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:1009
CLM.L["Adding missing %s players to current roster"] = "Добавляю %s отсутствующих игроков в текущий состав"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1367
CLM.L["Additional cost (tax) to add to the award value."] = "Дополнительная стоимость (налог) для добавления к цене вещи."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1335
CLM.L["Additional points to be given to players atop of the split value."] = "Дополнительные очки будут начислены игрокам выше разделяющего значения."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:150
CLM.L["Addon sounds"] = "Звуки аддона"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:150
CLM.L["Adds selected players to the selected roster (from dropdown)."] = "Добавляет выбранных игроков в выбранную список (от выпадения)."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:213
CLM.L["Advance to next item after bid"] = "Перейти к следующему пункту после ставки"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:221
CLM.L["Affected players:"] = "Затронутые игроки:"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:166
CLM.L["Akil'zon"] = "Акил'зон"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:43
CLM.L["Aku'mai"] = "Аку'май"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:244
CLM.L["Al'Akir"] = "Al'Akir"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:148
CLM.L["Al'ar"] = "Ал'ар"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:189
CLM.L["Algalon the Observer"] = "Алгалон Наблюдатель"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:228
CLM.L["Alizabal"] = "Alizabal"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:632
CLM.L["All In"] = "Вабанк"
-- ClassicLootManager_Integrations/Migration.lua:28
CLM.L["All migration entries were commited and executed. Congratulations!"] = "Все мигрированные записи были добавлены. Поздравляем!"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:242
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:20
-- ClassicLootManager/Modules/GUI/Filters.lua:178
CLM.L["All"] = "Все"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:76
CLM.L["Allow bidding below minimum points"] = "Разрешить ставки при отрицательных значениях"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1344
CLM.L["Allow biding more than current standings and ending up with less than minimum standings."] = "Разрешить ставить больше чем текущее количество и таким образом оказаться ниже минимального после."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1343
CLM.L["Allow biding more than current standings"] = "Разрешить ставить больше, чем есть сейчас"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1296
CLM.L["Allow equal bids"] = "Разрешить одинаковые ставки"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:73
CLM.L["Allow going below minimum points"] = "Разрешить уходить в отрицательные значения"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1060
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:156
CLM.L["Allow players to subscribe to the bench through Raids menu"] = "Разрешить игрокам подписываться на замену через меню рейда"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1059
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:155
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:133
CLM.L["Allow subscription"] = "Разрешить подписку"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:572
-- ClassicLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:53
CLM.L["Alt"] = "Альт"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1304
CLM.L["Always allow 0 bids"] = "Всегда разрешать 0 ставки"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1288
CLM.L["Always allow All-In bids"] = "Всегда разрешать All-In ставки"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1280
CLM.L["Always allow Base bids"] = "Всегда разрешать базовую ставку"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1161
CLM.L["Always allow cancel/pass"] = "Всегда разрешать отмена/пасс"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:73
CLM.L["Always show"] = "Показывать всегда"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:249
CLM.L["Alysrazor"] = "Alysrazor"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:871
CLM.L["Americas"] = "Америка"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:820
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:853
CLM.L["Ammo"] = "Патроны"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:162
CLM.L["Anetheron"] = "Анетерон"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:373
CLM.L["Announce award to Guild"] = "Аннонсировать награды в Гильдию"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:182
CLM.L["Announce loot from corpse to Raid"] = "Аннонсировать добычу из трупа в Рейд"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:178
CLM.L["Announce loot"] = "Объявить добычу"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:200
CLM.L["Announcement loot rarity"] = "Аннонсировать редкость добычи"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:721
CLM.L["Anonymous Open"] = "Анонимный Открытый"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1184
CLM.L["Anti-snipe time"] = "Время анти-снайпера"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:807
CLM.L["Anti-snipe time: %s."] = "Анти-снайпер: %s."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:503
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:236
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:70
CLM.L["Anti-snipe"] = "Анти-снайпер"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:96
CLM.L["Anub'Rekhan"] = "Ануб'Рекан"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:203
CLM.L["Anub'arak"] = "Ануб'Арак"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:67
-- ClassicLootManager/Tooltips.lua:37
-- ClassicLootManager/Utils.lua:1118
CLM.L["Any"] = "Любой"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:654
CLM.L["Applies all changes and exits sandbox mode"] = "Принять все правки и выйти из песочницы"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:653
CLM.L["Apply changes"] = "Принять правки"
-- ClassicLootManager_Integrations/GUI.lua:137
CLM.L["April"] = "Апрель"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:185
CLM.L["Archavon the Stone Watcher"] = "Аркавон Страж Камня"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:165
CLM.L["Archimonde"] = "Архимонд"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:177
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:332
CLM.L["Are you sure, you want to award %s to %s for %s %s?"] = "Вы уверены, что хотите отдать %s %s за %s %s?"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:360
CLM.L["Are you sure, you want to disenchant %s?"] = "Вы действительно хотите распылить %s?"
-- ClassicLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:79
CLM.L["Are you sure, you want to link %s as alt of %s?"] = "Вы уверены, вы хотите связать %s как alt %s?"
-- ClassicLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:96
CLM.L["Are you sure, you want to unlink %s from its main?"] = "Вы уверены, вы хотите отключить %s от его основного?"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:226
CLM.L["Argaloth"] = "Argaloth"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:239
CLM.L["Ascendant Council"] = "Ascendant Council"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:748
CLM.L["Ascending"] = "По возрастанию"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:231
CLM.L["Assistant"] = "Помощник"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:55
CLM.L["Atal'ai Defenders"] = "Защитники Атал'ай"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:52
CLM.L["Atal'alarion"] = "Атал'аларион"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:233
CLM.L["Atramedes"] = "Atramedes"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:431
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:442
CLM.L["Att. [%]"] = "Пос. [%]"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:408
CLM.L["Attendance"] = "Посещаемость"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:128
CLM.L["Attumen the Huntsman"] = "Ловчий Аттумен"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:245
CLM.L["Auction End Countdown"] = "Отсчет конца аукциона"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:222
-- ClassicLootManager/MinimapIcon.lua:130
CLM.L["Auction History"] = "История торгов"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:237
CLM.L["Auction Start/End"] = "Старт/стоп аукциона"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:235
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:67
CLM.L["Auction Time"] = "Осталось: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:55
CLM.L["Auction Type"] = "Тип аукциона"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:81
CLM.L["Auction column"] = "Колонка аукциона"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:699
CLM.L["Auction complete"] = "Аукцион завершен"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:278
CLM.L["Auction finished"] = "Аукцион завершен"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1176
CLM.L["Auction length in seconds."] = "Длительность аукциона в секундах."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:493
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1175
CLM.L["Auction length"] = "Время аукциона"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:258
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:799
CLM.L["Auction of %s items."] = "Аукцион %s вещей."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:262
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:801
CLM.L["Auction of %s"] = "Аукцион %s"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:480
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1118
CLM.L["Auction settings"] = "Настройки аукциона"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:690
CLM.L["Auction stopped by the Master Looter"] = "Аукцион остановлен Распределяющим добычу"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:805
CLM.L["Auction time: %s."] = "Время аукциона: %s."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:285
CLM.L["Auction timer bar font size"] = "Аукцион Таймер Бар Шрифт"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:268
CLM.L["Auction timer bar font"] = "Аукционный таймер Бар шрифт"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:245
CLM.L["Auction timer bar height"] = "Аукционный таймер рост бара"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:308
CLM.L["Auction timer bar texture"] = "Аукционный таймер текстура"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:222
CLM.L["Auction timer bar width"] = "Аукционный таймер ширина"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1247
CLM.L["Auction type"] = "Тип аукциона"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:55
CLM.L["Auctioning - History"] = "История торгов"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:428
CLM.L["Auctioning - List Filling"] = "Аукцион - заполнение списка"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:646
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:654
CLM.L["Auctioning requires active raid or roster mode."] = "Аукцион требует активного рейда или включенного режима аукциона по составу."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:369
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:669
-- ClassicLootManager/MinimapIcon.lua:125
CLM.L["Auctioning"] = "Аукцион"
-- ClassicLootManager_Integrations/GUI.lua:141
CLM.L["August"] = "Август"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:190
CLM.L["Auriaya"] = "Ауриайя"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:708
CLM.L["Author"] = "Автор"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1067
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:147
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:121
CLM.L["Auto bench leavers"] = "Авто замена при выходе"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:391
CLM.L["Auto-assign from corpse"] = "Авто-вручение из трупа"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:400
CLM.L["Auto-trade after award"] = "Авто-выдача после награждения"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:497
CLM.L["Automatically mark auto-removed items as disenchanted"] = "Автоматически отмечать авто-удаленные предметы как распыленные"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:59
CLM.L["Avatar of Hakkar"] = "Аватара Хаккара"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:430
CLM.L["Average weeks"] = "Средненедельные"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:291
CLM.L["Award %s %s to %s selected players."] = "Выдать %s %s %s выбранным игрокам."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:285
CLM.L["Award %s %s to everyone in raid."] = "Выдать %s %s всем в рейде."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:287
CLM.L["Award %s %s to everyone in roster."] = "Выдать %s %s всем в составе."
-- ClassicLootManager_Integrations/Integrations.lua:671
CLM.L["Award for Base"] = "Выдать за мин ставку"
-- ClassicLootManager_Integrations/Integrations.lua:670
CLM.L["Award for Free"] = "Выдать бесплатно"
-- ClassicLootManager_Integrations/Integrations.lua:674
CLM.L["Award for Large"] = "Выдать за большую ставку"
-- ClassicLootManager_Integrations/Integrations.lua:675
CLM.L["Award for Max"] = "Выдать за макс ставку"
-- ClassicLootManager_Integrations/Integrations.lua:673
CLM.L["Award for Medium"] = "Выдать за среднюю ставку"
-- ClassicLootManager_Integrations/Integrations.lua:672
CLM.L["Award for Small"] = "Награда за малую ставку"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:164
CLM.L["Award item"] = "Отдать за: "
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:980
CLM.L["Award points only to online players"] = "Начислять ДКП только игрокам в онлайне"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:989
CLM.L["Award points only to players in same zone"] = "Начислять ДКП только игрокам в той же локации"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:194
CLM.L["Award points to players based on context."] = "Начислять игрокам на основе контекста."
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:144
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:183
CLM.L["Award value"] = "Стоимость"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:153
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:207
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:244
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:269
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1218
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:193
-- ClassicLootManager/MinimapIcon.lua:144
CLM.L["Award"] = "Начисление"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:224
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:453
CLM.L["Awarded %s points for %s to all players in raid %s"] = "Начислено %s очков за %s всем игрокам в рейде %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:241
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:266
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:429
CLM.L["Awarded %s points to %s player(s) for %s in <%s>"] = "Начислено %s очков %s игрокам за %s в <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:445
CLM.L["Awarded %s points to all players for %s in <%s>"] = "Начислено %s очков всем игрокам за %s в <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:176
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:242
CLM.L["Awarded by"] = "Выдал"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:126
CLM.L["Ayamiss the Hunter"] = "Аямисса Охотница"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:164
CLM.L["Azgalor"] = "Азгалор"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:63
CLM.L["Azuregos"] = "Azuregos"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:799
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:832
CLM.L["Back"] = "Спина"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:819
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:852
CLM.L["Bag"] = "Сумка"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:250
CLM.L["Baleroc"] = "Baleroc"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:220
CLM.L["Baltharus the Warborn"] = "Балтар Рожденный в Битве"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_4_Cata.lua:8
CLM.L["Baradin Hold"] = "Baradin Hold"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:37
CLM.L["Baron Aquanis"] = "Барон Акванис"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:73
CLM.L["Baron Geddon"] = "Барон Геддон"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:398
CLM.L["Base value for Static-Priced auction.\nMinimum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Базовое значение для статического ценового аукциона. \nМинимальное значение для восходящего и многоуровневого аукциона. \n\nУстановлено то же значение, что и другой уровень или отрицательный, чтобы игнорировать."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:901
CLM.L["Base"] = "Бозовое"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:89
CLM.L["Battleguard Sartura"] = "Боевой страж Сартура"
-- ClassicLootManager_Integrations/GUI.lua:315
-- ClassicLootManager_Integrations/GUI.lua:322
-- ClassicLootManager_Integrations/GUI.lua:329
CLM.L["Begin %d days ago, finish today."] = "Начало %d дней назад, окончание сегодня."
-- ClassicLootManager_Integrations/GUI.lua:248
CLM.L["Begin Day"] = "День начала"
-- ClassicLootManager_Integrations/GUI.lua:259
CLM.L["Begin Month"] = "Месяц начала"
-- ClassicLootManager_Integrations/GUI.lua:270
CLM.L["Begin Year"] = "Год начала"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1075
CLM.L["Bench multiplier"] = "Множитель замены"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1053
CLM.L["Bench"] = "Замены"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:248
CLM.L["Beth'tilac"] = "Beth'tilac"
-- ClassicLootManager_Alerts/Alerts.lua:32
CLM.L["Bid %s accepted!"] = "Ставка %s принята!"
-- ClassicLootManager_Alerts/Alerts.lua:40
CLM.L["Bid %s denied!"] = "Ставка %s не принята!"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1085
CLM.L["Bid accepted!"] = "Ставка принята!"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1349
CLM.L["Bid cancelling not allowed"] = "Отмена ставок запрещена"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1089
CLM.L["Bid denied!"] = "Ставка не принята!"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1347
CLM.L["Bid increment too low"] = "Слишком низкое увеличение ставки"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:551
CLM.L["Bid input values as Main spec bid."] = "Ставка МС."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:577
CLM.L["Bid input values as Off spec bid."] = "Ставка ОС."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1345
CLM.L["Bid too high"] = "Ставка слишком высокая"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1344
CLM.L["Bid too low"] = "Ставка слишком низкая"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:633
CLM.L["Bid your current DKP (%s)."] = "Поставьте свое текущее ДКП (%s)."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:550
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:919
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:746
CLM.L["Bid"] = "Ставка"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1343
CLM.L["Bidding over current standings not allowed"] = "Ставки выше текущей позиции невозможны"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1342
CLM.L["Bidding while below minimum standings not allowed"] = "Ставки при отрицательных значениях запрещены"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:174
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:392
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1030
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1320
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1410
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:551
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1138
-- ClassicLootManager/MinimapIcon.lua:140
CLM.L["Bidding"] = "Ставки"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:261
CLM.L["Bids"] = "Ставки"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:126
CLM.L["Bindings"] = "Назначения клавиш"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:62
CLM.L["Black Temple"] = "Черный храм"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:7
CLM.L["Blackfathom Deeps"] = "Непроглядная Пучина"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_4_Cata.lua:17
CLM.L["Blackwing Descent"] = "Blackwing Descent"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:94
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:30
CLM.L["Blackwing Lair"] = "Логово Крыла Тьмы"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:208
CLM.L["Blood Council"] = "Совет кровавых принцев"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:117
CLM.L["Bloodlord Mandokir"] = "Мандокир Повелитель Крови"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:896
CLM.L["Bonuses"] = "Бонусы"
-- ClassicLootManager/ClassicLootManager.lua:255
CLM.L["Boot complete"] = "Загрузка завершена"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:902
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:521
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:79
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:237
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:79
CLM.L["Boss Kill Bonus"] = "За убийство босса"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1237
CLM.L["Boss kill award values"] = "Значение бонуса за убийство босса"
-- ClassicLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:21
CLM.L["Both"] = "Оба"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:81
CLM.L["Broodlord Lashlayer"] = "Предводитель драконов Разящий Бич"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:173
CLM.L["Brutallus"] = "Бруталл"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:125
CLM.L["Buru the Gorger"] = "Буру Ненасытный"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1084
CLM.L["Button Names"] = "Имена кнопок"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:95
CLM.L["C'Thun"] = "К'тун"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1078
CLM.L["Can't use"] = "Не могу использовать"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:563
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:727
CLM.L["Cancel your bid."] = "Отменить свою ставку."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:562
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:726
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1082
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1246
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:301
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:429
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:847
CLM.L["Cancel"] = "Отмена"
-- ClassicLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:133
CLM.L["Case-sensitive Player name in the format: Player-RealmName"] = "Чувствительное к корпуам имя игрока в формате: игрока-рилмнаме"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:686
CLM.L["Cataclysm"] = "Cataclysm"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:821
CLM.L["Change roster name."] = "Изменить название состава."
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:13
CLM.L["Changelog"] = "Лог изменений"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:286
CLM.L["Changes auction timer bar font size."] = "Изменения Аукцион Таймер Бар Бар. Размер шрифта."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:269
CLM.L["Changes auction timer bar font."] = "Изменения Аукцион Таймер Бар шрифт."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:246
CLM.L["Changes auction timer bar height."] = "Изменения аукцион таймер рост бара."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:309
CLM.L["Changes auction timer bar texture."] = "Изменения аукцион Таймер Текстура."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:223
CLM.L["Changes auction timer bar width."] = "Изменение ширины полоски таймера аукциона."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1353
CLM.L["Changing bid from Main-spec to Off-Spec not allowed"] = "Изменение ставки с МС на ОС не разрешено"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:68
CLM.L["Channel for posting bids."] = "Канал публикации ставок."
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:136
CLM.L["Chess Event"] = "Шахматный турнир"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:801
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:834
CLM.L["Chest (robes)"] = "Нагрудник (роба)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:800
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:833
CLM.L["Chest"] = "Нагрудник"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:234
CLM.L["Chimaeron"] = "Chimaeron"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:240
CLM.L["Cho'gall"] = "Cho'gall"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:85
CLM.L["Chromaggus"] = "Хромаггус"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:683
CLM.L["Classic"] = "Классика"
-- ClassicLootManager/Modules/GUI/Filters.lua:192
CLM.L["Clear all classes."] = "Убирает все классы."
-- ClassicLootManager_Integrations/GUI.lua:473
CLM.L["Clear output"] = "Очистить вывод"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:275
CLM.L["Clear"] = "Очистить"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:196
CLM.L["Close on bid"] = "Закрыть ставку"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:216
CLM.L["Comma-separated (CSV) list of disenchanter names. Case insensitive. Player-RealmName."] = "Список имен в формате CSV. Учитывает регистр букв. игрока-рилмнаме"
-- ClassicLootManager/Utils.lua:1108
CLM.L["Common"] = "Обычное"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:243
CLM.L["Conclave of Wind"] = "Conclave of Wind"
-- ClassicLootManager_Integrations/GUI.lua:17
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:310
-- ClassicLootManager/MinimapIcon.lua:159
CLM.L["Configuration"] = "Настройки"
-- ClassicLootManager_Integrations/GenericImport.lua:174
CLM.L["Configure Rosters"] = "Настройте списки"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:857
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:865
CLM.L["Copy settings from selected roster."] = "Скопировать настройки из текущего состава."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:850
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:856
CLM.L["Copy settings"] = "Скопировать настройки"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:864
CLM.L["Copy source"] = "Скопировать источник"
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:119
CLM.L["Core Loot Manager %s initialization complete. %s"] = "Core Loot Manager %s загрузка завершена. %s"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:13
-- ClassicLootManager/Modules/GUI/UnifiedGUI.lua:277
CLM.L["Core Loot Manager"] = "Core Loot Manager"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:526
CLM.L["Correcting error"] = "Исправление ошибки"
-- ClassicLootManager_Tracker/Auction.lua:9
CLM.L["Count"] = "Количество"
-- ClassicLootManager_Integrations/GenericImport.lua:177
CLM.L["Create Profiles"] = "Создать Профили"
-- ClassicLootManager_Integrations/GenericImport.lua:171
CLM.L["Create Rosters"] = "Создать Составы"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:195
CLM.L["Create new raid with provided name. You will automatically join this raid and leave any other you are part of."] = "Создать новый рейд с выбранным именем. Вы автоматически присоединитесь к рейду и выйдите из любого другого."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:500
CLM.L["Create raid %s %s in <%s>"] = "Создать рейд %s %s в <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:194
CLM.L["Create raid"] = "Создать рейд"
-- ClassicLootManager_Integrations/Integrations.lua:247
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1381
CLM.L["Create"] = "Создать"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:811
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:262
CLM.L["Created"] = "Создан"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1382
CLM.L["Creates new roster with default configuration"] = "Создает новый состав с настройками по умолчанию"
-- ClassicLootManager_Integrations/Integrations.lua:248
CLM.L["Creates new trigger to be used during RCLC award."] = "Создает новый триггер для использования во время вручения вещей в RCLC."
-- ClassicLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:9
CLM.L["Cross-guild sync"] = "Синхронизация кросс-гилд"
-- ClassicLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:122
CLM.L["Cross-guild synchronisation allows connecting two guild data through proxy mechanism called tunneling. Three types of connection are available: Send to, Accept from or Both. |cff00cc00Accepting data from another player will merge the two guilds databases.|r Use this functionality only if you are absolutely sure you know what you are doing."] = "Синхронизация кросс-гилдинга позволяет подключать две данные гильдии с помощью прокси-механизма, называемого туннелированием. Доступны три типа соединения: отправить, принять из или обоих. |cFF00CC00ACCETING Данные от другого игрока объединят две базы данных гильдий. |r Используйте эту функциональность, только если вы абсолютно уверены, что знаете, что делаете."
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:48
CLM.L["Crowd Pummeler 9-60"] = "Толпогон 9-60"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:574
CLM.L["Ctrl + Alt"] = "Ctrl + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:571
CLM.L["Ctrl"] = "Ctrl"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:928
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1320
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:755
CLM.L["Current"] = "Текущий"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:181
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:180
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:185
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1316
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:304
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1163
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:336
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:697
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1036
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1037
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:428
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:491
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:501
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:524
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:387
-- ClassicLootManager/Tooltips.lua:121
-- ClassicLootManager/Utils.lua:1050
CLM.L["DKP"] = "ДКП"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:135
CLM.L["DPS"] = "ДПС"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:327
CLM.L["Danger Zone - Use at own risk"] = "Опасная зона - Используйте на свой страх и риск"
-- ClassicLootManager_Integrations/GUI.lua:221
CLM.L["Data"] = "Данные"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:271
CLM.L["Date"] = "Дата"
-- .:indirectly
CLM.L["Death Knight"] = "Рыцарь смерти"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:209
CLM.L["Deathbringer Saurfang"] = "Саурфанг Смертоносный"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:320
CLM.L["Decay %"] = "Сгорание %"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:402
CLM.L["Decay %s%% %s to %s selected players."] = "Сжечь %s%% %s у %s выбранных игроков."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:398
CLM.L["Decay %s%% %s to everyone in roster."] = "Сжечь %s%% %s всем в составе."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:348
CLM.L["Decay Negatives"] = "Сжигать отрицательное"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:532
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:362
CLM.L["Decay"] = "Сжигание"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:437
CLM.L["Decayed %s%% points to %s players in <%s>"] = "Сожжено %s%% очков %s игрокам в <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:461
CLM.L["Decayed %s%% points to all players %s in <%s>"] = "Сожжено %s%% очков всем игрокам %s в <%s>"
-- ClassicLootManager_Integrations/GUI.lua:145
CLM.L["December"] = "Декабрь"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:909
CLM.L["Default Boss Kill Bonus Value"] = "Значение по умолчанию за убийство босса"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:82
CLM.L["Default Boss Kill Bonus value"] = "Значение по умолчанию за убийство босса"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1212
CLM.L["Default slot values"] = "Значения слотов по умолчанию"
-- .:indirectly
CLM.L["Demon Hunter"] = "Охотник на демонов"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:707
CLM.L["Description"] = "Описание"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:332
CLM.L["Disable data synchronisation"] = "Отключить синхронизацию данных"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:333
CLM.L["Disable data synchronisation. This might lead to unexpected consequences. Use this at your own risk. Requires /reload to apply."] = "Отключить синхронизацию данных. Это может привести к неожиданным последствиям. Используйте это на свой страх и риск. Для применения требуется /reload."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:569
CLM.L["Disable"] = "Отключить"
-- ClassicLootManager/MinimapIcon.lua:54
CLM.L["Disabled"] = "Неполноценный"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:37
CLM.L["Disables display of the changelog for any new version."] = "Отключает отображение истории изменений для любой новой версии."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:663
CLM.L["Discard changes"] = "Отменить изменения"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:664
CLM.L["Discards all changes and exits sandbox mode"] = "Отменить все изменения и выйти из режима песочницы"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:496
CLM.L["Disenchant removed items"] = "Распылить удаленные предметы"
-- ClassicLootManager_Integrations/Integrations.lua:676
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:344
CLM.L["Disenchant"] = "Распылить"
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:230
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:28
CLM.L["Disenchanted"] = "Распылено"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:210
CLM.L["Disenchanters"] = "Кто может распылить"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:274
CLM.L["Display price"] = "Отображать цену"
-- ClassicLootManager/Utils.lua:1119
CLM.L["Do Nothing"] = "Ничего не делать"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:78
CLM.L["Do not show again"] = "Больше не показывать"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_4_Cata.lua:61
CLM.L["Dragon Soul"] = "Dragon Soul"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:687
CLM.L["Dragonflight"] = "Dragonflight"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:54
CLM.L["Dreamscythe and Weaver"] = "Жнец Снов и Ткачик"
-- .:indirectly
CLM.L["Druid"] = "Друид"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1131
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1231
CLM.L["Dynamic Item values"] = "Динамические цены вещей"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1036
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1037
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:551
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:558
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:440
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:483
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:485
-- ClassicLootManager/Utils.lua:1055
CLM.L["EP"] = "EP"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:557
-- ClassicLootManager/Utils.lua:1057
CLM.L["EP/GP"] = "EP/GP"
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:196
CLM.L["EPGP WEB"] = "EPGP WEB"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:698
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1090
CLM.L["EPGP"] = "EPGP"
-- ClassicLootManager_Integrations/GenericImport.lua:245
-- ClassicLootManager_Integrations/ImportCSV.lua:152
CLM.L["ERROR - invalid import data"] = "ОШИБКА - неверные данные импорта"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:83
CLM.L["Ebonroc"] = "Черноскал"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:120
CLM.L["Edge of Madness"] = "Грань безумия"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:47
CLM.L["Electrocutioner 6000"] = "Электрошокер 6000"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:186
CLM.L["Emalon the Storm Watcher"] = "Эмалон Страж Бури"
-- ClassicLootManager_Integrations/Integrations.lua:119
CLM.L["Enable Gargul integration. This will allow Gargul to take control over some aspects of CLM (starting auction from Gargul, and awarding)."] = "Включить интеграцию Gargul. Это позволит Gargul взять под контроль некоторые аспекты CLM (начинать аукцион из Gargul и вручать вещи)."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1154
CLM.L["Enable OS bids"] = "Включить ставки ОС"
-- ClassicLootManager_Integrations/Integrations.lua:234
CLM.L["Enable RCLC integration. This will allow awarding DKP/GP points on RCLC item award. Requires /reload."] = "Включает интеграцию с RCLC. Это позволит вручать DKP/GP очки в списках вручения вещей RCLC. Изменения требуют /reload."
-- ClassicLootManager_Integrations/Integrations.lua:357
CLM.L["Enable WoW DKP Bot Integration. This will result in additional data stored upon logout."] = "Включить интеграцию с WoW DKP Bot. Это приведет к сохранению дополнительных данных при выходе из игры."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:238
CLM.L["Enable announcing auction start and end."] = "Включает оповещения о старте и стопе аукциона"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:179
CLM.L["Enable auto-update bid values when current highest bid changes (open auction only)."] = "Включить авто обновление ставок, когда меняется текущая высшая ставка (для открытых аукционов)."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:178
CLM.L["Enable auto-update bid values"] = "Включить авто обновление ставок"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:57
CLM.L["Enable item tracking information in tooltip display."] = "Включить отслеживание вещей в подсказках"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:392
CLM.L["Enable loot auto-assign (Master Looter UI) from corpse when item is awarded"] = "Включить авто-вручение (UI ответственного за добычу) из трупа, когда вещь разыграна"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1327
CLM.L["Enable paid value splitting amongst raiders."] = "Включить разделение оплачиваемой стоимости между рейдерами."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1281
CLM.L["Enable to allow base bids even if higher bids are present if player didn't bid yet. Affects Open-Ascending Auction."] = "Включить разрешение базовой ставки даже если уже есть более высокие ставки от других игроков. Применимо в открытом аукционе с повышением ставок."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1297
CLM.L["Enable to allow equal bids. Affects Open-Ascending Auction."] = "Разрешить одинаковые ставки. Применимо в открытом аукционе с повышением ставок."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1305
CLM.L["Enable to always allow 0 bids. Affects ascending item value mode."] = "Включить разрешение 0 ставок. Применимо в аукционе с повышением ставок."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1289
CLM.L["Enable to always allow All-In bids. Affects Open-Ascending Auction."] = "Включить разрешение All-in ставок. Применимо в открытом аукционе с повышением ставок."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1162
CLM.L["Enable to always allow cancelling or passing bids. Affects Open-Ascending Auction."] = "Включить возможность всегда отменять ставки или пасовать. Влияет только на открытый аукцион."
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:56
CLM.L["Enable tooltip display"] = "Включить отображение описания"
-- ClassicLootManager/MinimapIcon.lua:83
CLM.L["Enables / disables minimap Icon"] = "Включает / отключает значок у миникарты"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:32
CLM.L["Enables / disables verbose data printing during logging"] = "Включает / отключает вывод подробных данных при логировании"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:254
CLM.L["Enables announcing loot awards."] = "Включает оповещения вручения наград"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:262
CLM.L["Enables announcing new highest bid (when applicable)."] = "Включает оповещение новой высшей ставки"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:229
CLM.L["Enables announcing raid start and end."] = "Включает оповещения старта и стопа рейда"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:401
CLM.L["Enables auto-trade awarded loot after auctioning from bag"] = "Включить автоматическую передачу вещи в окне обмена после завершения торгов"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:275
CLM.L["Enables displaying item price on tooltip."] = "Включает отображение цены вещи в подсказке."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:246
CLM.L["Enables raid-warning countdown for auctions."] = "Включает оповещения отсчета конца аукциона"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:794
CLM.L["End Timetravel"] = "Завершить путешествие во времени"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:401
CLM.L["End selected raid"] = "Завершить выбранный рейд"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:644
CLM.L["Enter sandbox"] = "Включить песочницу"
-- ClassicLootManager/Utils.lua:1111
CLM.L["Epic"] = "Эпическое"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:502
CLM.L["Equation"] = "Уравнение"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:175
CLM.L["Eredar Twins"] = "Эредарские близнецы"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:870
CLM.L["Europe"] = "Европа"
-- .:indirectly
CLM.L["Evoker"] = "Пробудитель"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:363
CLM.L["Execute decay for players based on context."] = "Выполнить сгорание для игроков на основе контекста."
-- ClassicLootManager_Integrations/Migration.lua:52
CLM.L["Execute migration again if you are sure this is correct."] = "Выполните миграцию снова, если вы уверены, что это правильно."
-- ClassicLootManager_Integrations/Migration.lua:443
CLM.L["Execute migration from MonolithDKP, EssentialDKP, CommunityDKP, BastionLoot or CEPGP"] = "Выполнить миграцию с MonolithDKP, EssentialDKP, CommunityDKP, Bastionloot или CEPGP"
-- ClassicLootManager_Integrations/Migration.lua:58
CLM.L["Executing Addon Migration with comms disabled."] = "Осуществляю миграцию аддона с выключенной синхронизацией."
-- ClassicLootManager_Integrations/Migration.lua:49
CLM.L["Executing migration even though ledger is not empty."] = "Выполнение миграции, хотя книга не пуста."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:532
CLM.L["Exponent / Base"] = "Показатель / база"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:524
CLM.L["Exponential scaling value used by the equations (Base for EPGPWeb, or Exponent for WoWpedia)"] = "Экспоненциальное значение масштабирования, используемое уравнениями (база для EPGPWEB, или показатель для WoWpedia)"
-- ClassicLootManager_Integrations/GUI.lua:397
-- ClassicLootManager_Integrations/GUI.lua:406
-- ClassicLootManager_Integrations/GUI.lua:483
-- ClassicLootManager_Integrations/GUI.lua:484
-- ClassicLootManager/MinimapIcon.lua:153
CLM.L["Export"] = "Экспорт"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:82
CLM.L["Extend auction bid list with received item count information. Requires reload."] = "Расширить список ставок аукциона количественной информацией. Требует перезагрузку интерфейса."
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:65
CLM.L["Extend tooltip with more specific loot information."] = "Расширить подсказки более точными данными о добыче."
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:64
CLM.L["Extended tooltip"] = "Расширенные подсказки"
-- ClassicLootManager/Modules/GUI/Filters.lua:79
CLM.L["External"] = "Внешние"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:204
CLM.L["Faction Champions"] = "Чемпионы фракций"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:37
CLM.L["False"] = "Ложно"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:90
CLM.L["Fankriss the Unyielding"] = "Фанкрисс Непреклонный"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:145
CLM.L["Fathom-Lord Karathress"] = "Повелитель глубин Каратресс"
-- ClassicLootManager_Integrations/GUI.lua:135
CLM.L["February"] = "Февраль"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:807
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:840
CLM.L["Feet"] = "Ступни"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:174
CLM.L["Felmyst"] = "Пророк Скверны"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:210
CLM.L["Festergut"] = "Тухлопуз"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:53
CLM.L["Festering Rotslime"] = "Гнойная гнилослизь"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:432
CLM.L["Fill auction list from corpse"] = "Заполнять список аукциона из трупа"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:433
CLM.L["Fill auction list with items from corpse. Will happen only if you open the corpse loot window."] = "Заполнять список аукциона вещами из трупа. Произойдет только когда вы откроете окно добычи в трупе."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:450
CLM.L["Fill auction list with looted items"] = "Заполнять список аукциона только полученными вещами"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:451
CLM.L["Fill auction list with looted items. This will automatically add all items you have received."] = "Заполнять список аукциона только полученными вещами. Это автоматически будет добавлять все взятые вами предметы."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:104
CLM.L["Fill from Guild"] = "Заполнить из гильдии"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:116
CLM.L["Fill from Raid Roster"] = "Заполнить из рейда"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:442
CLM.L["Fill from corpse only if you are the Loot Master."] = "Заполнять из трупа только если вы ответственный за добычу"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:460
CLM.L["Fill from loot only if you are using Group Loot."] = "Заполнять полученные вещи, если включена групповая добыча."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:117
CLM.L["Fill profile list with players in current raid roster."] = "Заполнить профили игроками из текущего рейда."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:105
CLM.L["Fill profile list with players with the minimum level and ranks."] = "Заполнить профили игроками с минимальным уровнем и рангом."
-- ClassicLootManager/Modules/GUI/Filters.lua:163
CLM.L["Filter"] = "Фильтр"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:808
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:841
CLM.L["Finger"] = "Палец"
-- ClassicLootManager_Integrations/GUI.lua:281
CLM.L["Finish Day"] = "Конечный день"
-- ClassicLootManager_Integrations/GUI.lua:292
CLM.L["Finish Month"] = "Конечный месяц"
-- ClassicLootManager_Integrations/GUI.lua:303
CLM.L["Finish Year"] = "Конечный год"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:524
CLM.L["Finished raid %s"] = "Завершен рейд %s"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:813
CLM.L["Finished"] = "Завершен"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_4_Cata.lua:48
CLM.L["Firelands"] = "Firelands"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:82
CLM.L["Firemaw"] = "Огнечрев"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:191
CLM.L["Flame Leviathan"] = "Огненный Левиафан"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:84
CLM.L["Flamegor"] = "Пламегор"
-- ClassicLootManager_Integrations/GUI.lua:232
CLM.L["Format"] = "Формат"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:132
CLM.L["Found %s in guild."] = "Найдено %s в гильдии."
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:192
CLM.L["Freya"] = "Фрейя"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:227
CLM.L["GM"] = "ГМ"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:181
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:180
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:185
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:304
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1163
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:336
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1044
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1045
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:552
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:559
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:441
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:484
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:512
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:385
-- ClassicLootManager/Tooltips.lua:121
-- ClassicLootManager/Utils.lua:1053
CLM.L["GP"] = "GP"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:121
CLM.L["Gahz'ranka"] = "Газ'ранка"
-- ClassicLootManager_Integrations/Integrations.lua:112
-- ClassicLootManager_Integrations/Integrations.lua:118
CLM.L["Gargul Integration"] = "Интеграция Gargul"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:72
CLM.L["Garr"] = "Гарр"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:71
CLM.L["Gehennas"] = "Гееннас"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:40
CLM.L["Gelihast"] = "Гелихаст"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:123
CLM.L["General Rajaxx"] = "Генерал Раджакс"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:193
CLM.L["General Vezax"] = "Генерал Везакс"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:221
CLM.L["General Zarithrian"] = "Генерал Заритриан"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:815
CLM.L["General settings"] = "Общие настройки"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:38
CLM.L["Ghamoo-ra"] = "Гхаму-ра"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:101
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:794
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:827
CLM.L["Global"] = "Общие"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:101
CLM.L["Gluth"] = "Глут"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:20
CLM.L["Gnomeregan"] = "Гномреган"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:76
CLM.L["Golemagg the Incinerator"] = "Големагг Испепелитель"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:107
CLM.L["Gothik the Harvester"] = "Готик Жнец"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:97
CLM.L["Grand Widow Faerlina"] = "Великая вдова Фарлина"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:100
CLM.L["Grobbulus"] = "Гроббулус"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:459
CLM.L["Group Loot Only"] = "Только групповая добыча"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:45
CLM.L["Grubbis"] = "Грязнюк"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:140
CLM.L["Gruul the Dragonkiller"] = "Груул Драконобой"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:25
CLM.L["Gruul's Lair"] = "Логово Груула"
-- ClassicLootManager/Modules/Global/GlobalGuildChangeHandler.lua:18
CLM.L["Guild change detected. Disabling synchronisation until UI reload."] = "Обнаружено изменение гильдии. Отключение синхронизации до перезагрузки пользовательского интерфейса."
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:156
CLM.L["Gurtogg Bloodboil"] = "Гуртогг Кипящая Кровь"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:257
CLM.L["Hagara the Stormbinder"] = "Hagara the Stormbinder"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:119
CLM.L["Hakkar"] = "Хаккар"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:169
CLM.L["Halazzi"] = "Халаззи"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:237
CLM.L["Halfus Wyrmbreaker"] = "Halfus Wyrmbreaker"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:223
CLM.L["Halion"] = "Халион"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:804
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:837
CLM.L["Hands"] = "Кисти рук"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:658
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:104
CLM.L["Hard Mode"] = "Высокая сложность"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1021
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:106
CLM.L["Hard cap"] = "Жесткий лимит"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:181
CLM.L["Hash"] = "Хэш"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:795
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:828
CLM.L["Head"] = "Голова"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:134
CLM.L["Healer"] = "Лекарь"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:104
CLM.L["Heigan the Unclean"] = "Хейган Нечистивый"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:813
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:846
CLM.L["Held In Off-hand"] = "Держится в левой руке"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:30
CLM.L["Heroic"] = "Героическое"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:170
CLM.L["Hex Lord Malacrass"] = "Повелитель проклятий Малакрасс"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:358
CLM.L["Hide in combat"] = "Скрыть в бою"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:150
CLM.L["High Astromancer Solarian"] = "Верховный звездочет Солариан"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:139
CLM.L["High King Maulgar"] = "Король Молгар"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:112
CLM.L["High Priest Thekal"] = "Верховный жрец Текал"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:113
CLM.L["High Priest Venoxis"] = "Верховный жрец Веноксис"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:114
CLM.L["High Priestess Arlokk"] = "Верховная жреца Арлокк"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:115
CLM.L["High Priestess Jeklik"] = "Верховная жреца Джеклик"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:116
CLM.L["High Priestess Mar'li"] = "Верховная жреца Мар'ли"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:152
CLM.L["High Warlord Naj'entus"] = "Верховный полководец Наджентус"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:136
CLM.L["History type"] = "Тип истории"
-- .:indirectly
CLM.L["History"] = "История"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:194
CLM.L["Hodir"] = "Ходир"
-- .:indirectly
CLM.L["Hunter"] = "Охотник"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:142
CLM.L["Hydross the Unstable"] = "Гидросс Нестабильный"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:77
CLM.L["Hyjal Summit"] = "Вершина Хиджала"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:87
CLM.L["Icecrown Citadel"] = "Цитадель Ледяной Короны"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:212
CLM.L["Icecrown Gunship Battle"] = "Воздушный бой"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:195
CLM.L["Ignis the Furnace Master"] = "Повелитель Горнов Игнис"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:78
CLM.L["Ignore entry"] = "Игнорировать запись"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:205
CLM.L["Ignore unusable items"] = "Игнорируйте непригодные предметы"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:505
CLM.L["Ignore"] = "Игнорировать"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:206
CLM.L["Ignores unusable items. They will not be added to bidding window."] = "Игнорирует непригодные предметы. Они не будут добавлены в окно торгов."
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:160
CLM.L["Illidan Stormrage"] = "Иллидан Ярость Бури"
-- ClassicLootManager_Integrations/Migration.lua:258
-- ClassicLootManager_Integrations/Migration.lua:392
-- ClassicLootManager_Integrations/Migration.lua:435
CLM.L["Import complete"] = "Импорт завершен"
-- ClassicLootManager_Integrations/GenericImport.lua:221
-- ClassicLootManager_Integrations/GenericImport.lua:254
-- ClassicLootManager_Integrations/GenericImport.lua:255
-- ClassicLootManager_Integrations/GenericImport.lua:262
-- ClassicLootManager_Integrations/ImportCSV.lua:99
-- ClassicLootManager_Integrations/ImportCSV.lua:161
-- ClassicLootManager_Integrations/ImportCSV.lua:162
-- ClassicLootManager_Integrations/ImportCSV.lua:190
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:531
CLM.L["Import"] = "Импорт"
-- ClassicLootManager_Integrations/Migration.lua:209
CLM.L["Importing %s entries from DKPTable"] = "Импортирую %s значений из DKPTable"
-- ClassicLootManager_Integrations/Migration.lua:320
CLM.L["Importing profiles from DKPTable"] = "Импортирую профили из DKPTable"
-- ClassicLootManager/Modules/GUI/Filters.lua:78
CLM.L["In Guild"] = "В гильдии"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:812
CLM.L["In Progress"] = "В процессе"
-- ClassicLootManager/Modules/GUI/Filters.lua:75
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:290
CLM.L["In Raid"] = "В рейде"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:645
CLM.L["In sandbox mode all communication is disabled and changes are local until applied. Click Apply changes to store changes and exit sandbox mode. Click Discard to undo changes and exit sandbox mode. /reload will discard changes. Entering sandbox mode will cancel time travel."] = "В режиме песочницы все изменения отключены и изменения локальны до их применения. Нажмите принять изменения чтобы сохранить их и выйти из режима песочницы. Нажмите отменить, чтобы отменить все изменения и выйти из песочницы. /reload отменит все изменения. Вход в песочницы отменит путешествие во времени."
-- ClassicLootManager/MinimapIcon.lua:50
CLM.L["In-Sync"] = "Синхронизирован"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:971
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:139
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:124
CLM.L["Include bench"] = "Учитывать замены"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:972
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:140
CLM.L["Include benched players in all auto-awards"] = "Включить всех игроков на замене в авто получение наград"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:377
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:419
CLM.L["Include cancels in bid list in open auction mode."] = "Включите отмены в список ставок в режиме открытого аукциона."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:376
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:418
CLM.L["Include cancels"] = "Включите отмены"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:368
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:410
CLM.L["Include passes in bid list in open auction mode."] = "Включите пропуски в список ставок в режиме открытого аукциона."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:367
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:409
CLM.L["Include passes"] = "Включить пасы"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:349
CLM.L["Include players with negative standings in decay."] = "Включите игроков с отрицательным дкп в сгорание."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:302
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:310
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:318
CLM.L["Include"] = "Включить"
-- ClassicLootManager/MinimapIcon.lua:48
CLM.L["Incoherent state"] = "Бессвязный статус"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:261
CLM.L["Info"] = "Инфо"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:481
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:487
CLM.L["Information"] = "Информация"
-- ClassicLootManager_Integrations/ImportCSV.lua:72
CLM.L["Input CSV Item value override data"] = "Введите данные о значении элемента CSV"
-- ClassicLootManager_Integrations/GenericImport.lua:198
CLM.L["Input JSON exported standings"] = "Введите экспортированные JSON данные"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:127
CLM.L["Input name: %s"] = "Имя вводящего: %s"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:106
CLM.L["Instructor Razuvious"] = "Инструктор Разувиус"
-- ClassicLootManager_Integrations/ClassicLootManager_Integrations.lua:18
CLM.L["Integrations"] = "Интеграции"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:100
CLM.L["Interval Bonus time"] = "Время"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:947
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:533
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:116
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:249
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:97
CLM.L["Interval Bonus"] = "Интервальный бонус"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:954
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:123
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:251
CLM.L["Interval Time"] = "Временной интервал"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:963
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:131
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:252
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:103
CLM.L["Interval Value"] = "Значение"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:955
CLM.L["Interval in [minutes] to award bonus points"] = "Интервал в [минутах] для присуждения бонуса"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1346
CLM.L["Invalid bid value"] = "Неверное значение ставки"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:396
CLM.L["Invalid context. You should not decay raid only."] = "Неверный контекст. Вы не должны разрушать только рейд."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:16
CLM.L["Invalid item link"] = "Неверная ссылка на предмет"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1352
CLM.L["Invalid item"] = "Неверный предмет"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1123
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1312
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:58
CLM.L["Item value mode"] = "Режим стоимости вещи"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:22
CLM.L["Item value must be positive"] = "Стоимость вещи должна быть положительная"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1225
CLM.L["Item value overrides"] = "Переназначение стоимости"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:91
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:101
CLM.L["Item"] = "Предмет"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:56
CLM.L["Jammal'an and Ogom"] = "Джаммал'ан и Огом"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:168
CLM.L["Jan'alai"] = "Джан'алай"
-- ClassicLootManager_Integrations/GUI.lua:134
CLM.L["January"] = "Январь"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:118
CLM.L["Jin'do the Hexxer"] = "Мастер проклятий Джин'до"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:86
CLM.L["Join our discord for more info: "] = "Присоединяйтесь к нашему дискорду: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:415
CLM.L["Join selected raid"] = "Присоединиться к выбранному рейду"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:535
CLM.L["Joining roster"] = "Присоединение к составу"
-- ClassicLootManager_Integrations/GUI.lua:140
CLM.L["July"] = "Июль"
-- ClassicLootManager_Integrations/GUI.lua:139
CLM.L["June"] = "Июнь"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:151
CLM.L["Kael'thas Sunstrider"] = "Кель'тас Солнечный Скиталец"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:172
CLM.L["Kalecgos"] = "Калесгос"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:8
CLM.L["Karazhan"] = "Каражан"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:163
CLM.L["Kaz'rogal"] = "Каз'рогал"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:110
CLM.L["Kel'Thuzad"] = "Кел'Тузад"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:177
CLM.L["Kil'jaeden"] = "Кил'джеден"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:196
CLM.L["Kologarn"] = "Кологарн"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:187
CLM.L["Koralon the Flame Watcher"] = "Коралон Страж Огня"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:122
CLM.L["Kurinnaxx"] = "Куриннакс"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:32
CLM.L["LFR"] = "LFR"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:213
CLM.L["Lady Deathwhisper"] = "Леди Смертный Шепот"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:39
CLM.L["Lady Sarevess"] = "Леди Саревесс"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:147
CLM.L["Lady Vashj"] = "Леди Вайш"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:410
CLM.L["Large value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Большое значение для многоуровневого аукциона. \n\nУстановлено на то же значение, что и другой уровень или отрицательный, чтобы игнорировать."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:904
CLM.L["Large"] = "Большая"
-- ClassicLootManager_Integrations/GUI.lua:321
CLM.L["Last month"] = "Прошлый месяц"
-- ClassicLootManager_Integrations/GUI.lua:314
CLM.L["Last week"] = "Прошлая неделя"
-- ClassicLootManager_Integrations/GUI.lua:328
CLM.L["Last year"] = "Прошлый год"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:501
CLM.L["Latest loot"] = "Последняя добыча"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:524
CLM.L["Latest points"] = "Последние очки"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:302
-- ClassicLootManager/Utils.lua:1112
CLM.L["Legendary"] = "Легендарное"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:806
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:839
CLM.L["Legs"] = "Ноги"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:144
CLM.L["Leotheras the Blind"] = "Леотерас Слепец"
-- ClassicLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:71
-- ClassicLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:122
-- ClassicLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:147
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:77
CLM.L["Link Alt to Main"] = "Привязать Альта к Мейну"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:534
CLM.L["Linking override"] = "Переопределение привязки"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:378
-- ClassicLootManager/MinimapIcon.lua:44
CLM.L["Loading..."] = "Загрузка..."
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:105
CLM.L["Loatheb"] = "Лотхиб"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:271
CLM.L["Lock selected"] = "Заблокировать выбранное"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:469
-- ClassicLootManager/Modules/GUI/Filters.lua:81
CLM.L["Locked"] = "Заблокировано"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:22
CLM.L["Logging level"] = "Уровень логирования"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:18
CLM.L["Logging"] = "Логирование"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:253
CLM.L["Loot Awards"] = "Вручение наград"
-- ClassicLootManager_Integrations/GUI.lua:20
CLM.L["Loot History"] = "История лута"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:283
CLM.L["Loot Rolling"] = "Ролл добычи"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:468
CLM.L["Loot rarity"] = "Редкость добычи"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:21
CLM.L["Loot"] = "Добыча"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:205
CLM.L["Lord Jaraxxus"] = "Лорд Джараксус"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:64
CLM.L["Lord Kazzak"] = "Lord Kazzak"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:214
CLM.L["Lord Marrowgar"] = "Лорд Ребрад"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:247
CLM.L["Lord Rhyolith"] = "Lord Rhyolith"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:41
CLM.L["Lorgus Jett"] = "Лоргус Джетт"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:69
CLM.L["Lucifron"] = "Люцифрон"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:176
CLM.L["M'uru"] = "М'уру"
-- ClassicLootManager_Integrations/Integrations.lua:132
-- ClassicLootManager_Integrations/Integrations.lua:137
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:550
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:426
CLM.L["MS"] = "МС"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:261
CLM.L["Madness of Deathwing"] = "Madness of Deathwing"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:98
CLM.L["Maexxna"] = "Мексна"
-- .:indirectly
CLM.L["Mage"] = "Маг"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:70
CLM.L["Magmadar"] = "Магмадар"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:230
CLM.L["Magmaw"] = "Magmaw"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:33
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:141
CLM.L["Magtheridon"] = "Магтеридон"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:130
CLM.L["Maiden of Virtue"] = "Благочестивая дева"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:811
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:844
CLM.L["Main Hand"] = "Правая рука"
-- ClassicLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:62
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:180
CLM.L["Main"] = "Мейн"
-- ClassicLootManager/Modules/GUI/Filters.lua:80
CLM.L["Mains"] = "Мейны"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:77
CLM.L["Majordomo Executus"] = "Мажордом Экзекутус"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:251
CLM.L["Majordomo Staghelm"] = "Majordomo Staghelm"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:232
CLM.L["Maloriak"] = "Maloriak"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:184
CLM.L["Malygos"] = "Малигос"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:146
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:71
CLM.L["Management"] = "Управление"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:229
CLM.L["Manager"] = "Менеджер"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:527
CLM.L["Manual adjustment"] = "Ручное начисление"
-- ClassicLootManager_Integrations/GUI.lua:136
CLM.L["March"] = "Март"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:441
CLM.L["Master Loot Only"] = "Только если ответственный за добычу"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:905
CLM.L["Max"] = "Макс"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1013
CLM.L["Maximum point cap player can receive per raid week. Set to 0 to disable."] = "Кап очков, которые игрок может набрать за рейдовую неделю. Поставьте 0 для отключения."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1022
CLM.L["Maximum point cap that player can have. Set to 0 to disable."] = "Кап очков, которые могут быть у игрока. Поставьте 0 для отключения."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:414
CLM.L["Maximum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Максимальное значение для восходящего и многоуровневого аукциона. \n\nУстановить на то же значение, что и другой уровень или отрицательный, чтобы игнорировать."
-- ClassicLootManager_Integrations/GUI.lua:138
CLM.L["May"] = "Май"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:49
CLM.L["Mechanical Menagerie"] = "Механический зверинец"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:406
CLM.L["Medium value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Среднее значение для многоуровневого аукциона. \n\nУстановлено то же значение, что и другой уровень или отрицательный, чтобы игнорировать."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:903
CLM.L["Medium"] = "Средняя"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:50
CLM.L["Mekgineer Thermaplugg"] = "Мекжинер Термоштепсель"
-- ClassicLootManager/MinimapIcon.lua:121
CLM.L["Menu"] = "Меню"
-- ClassicLootManager_Integrations/Migration.lua:196
-- ClassicLootManager_Integrations/Migration.lua:274
-- ClassicLootManager_Integrations/Migration.lua:403
CLM.L["Migrating %s"] = "Мигрирую %s"
-- ClassicLootManager_Integrations/Migration.lua:73
CLM.L["Migration complete. %s to apply and sync with others or go to %s to discard."] = "Миграция завершена. %s для принятия и синхронизации или %s для отмены."
-- ClassicLootManager_Integrations/Migration.lua:297
CLM.L["Migration failure: Detected 0 teams"] = "Миграция прервана: Найдено 0 команд"
-- ClassicLootManager_Integrations/Migration.lua:235
-- ClassicLootManager_Integrations/Migration.lua:351
CLM.L["Migration failure: Unable to create profiles"] = "Миграция прервана: Не могу создать профили"
-- ClassicLootManager_Integrations/Migration.lua:34
CLM.L["Migration ongoing: %s(%s)"] = "Миграция в процессе: %s(%s)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:197
CLM.L["Mimiron"] = "Мимирон"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:118
CLM.L["Min bid increment"] = "Мин увеличение ставки"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1357
CLM.L["Minimal increment"] = "Минимальное увеличение"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1358
CLM.L["Minimal value increment for open auction mode."] = "Минимальное увеличение ставки для открытых аукционов."
-- ClassicLootManager_Integrations/Migration.lua:75
CLM.L["Minimap Icon -> Configuration -> Wipe events"] = "Иконка на карте -> Настройки -> Стереть"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1098
CLM.L["Minimum GP used in calculations when player has less GP than this value."] = "Минимальное GP использующееся в расчетах, когда у игрока меньше GP, чем это значение."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1097
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:142
CLM.L["Minimum GP"] = "Минимальное GP"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:91
CLM.L["Minimum Level"] = "Минимальный уровень"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:92
CLM.L["Minimum level of players to fill from guild."] = "Минимальный уровень игроков для заполнения из гильдии."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:139
CLM.L["Minimum points (DKP / EP)"] = "Минимальные очки (DKP / EP)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1145
CLM.L["Minimum standing required to be allowed to bid."] = "Минимальное количество необходимое для разрешения ставки."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1144
CLM.L["Minimum standing"] = "Минимальное количество"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:281
CLM.L["Missing award value"] = "Отсутствует цена выдачи"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:392
CLM.L["Missing decay value"] = "Отсутствует значение сгорания"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:55
CLM.L["Missing profile %s"] = "Отсутствует профиль %s"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:33
CLM.L["Missing roster name and you are not in raid"] = "Отсутствует название состава и вы не в рейде"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:37
CLM.L["Missing roster name. Using Raid Info"] = "Отсутствует название состава. Использую инфо из рейда"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:325
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:397
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:436
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:465
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:499
CLM.L["Missing valid raid"] = "Отсутствует корректный рейд"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:124
CLM.L["Moam"] = "Моам"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:248
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:477
CLM.L["Modifier combination"] = "Комбинация модификатора"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:53
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:61
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:14
CLM.L["Molten Core"] = "Огненные Недра"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:254
CLM.L["Morchok"] = "Morchok"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:129
CLM.L["Moroes"] = "Мороуз"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:146
CLM.L["Morogrim Tidewalker"] = "Морогрим Волноступ"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:57
CLM.L["Morphaz and Hazzas"] = "Морфаз и Хаззас"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:158
CLM.L["Mother Shahraz"] = "Матушка Шахраз"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:233
CLM.L["Moving %s from current queue to pending queue."] = "Перемещение %s от текущей очереди в ожидание очереди."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:444
CLM.L["Multiple"] = "Несколько"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:587
CLM.L["Multiplier for tier %s (if used by the auction type)."] = "Мультипликатор для тира %s (если используется вашим типом аукциона)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:510
CLM.L["Multiplier used by the equations"] = "Мультипликатор используемый в уравнении"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:296
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:518
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1218
CLM.L["Multiplier"] = "Мультипликатор"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1194
CLM.L["Multiply auction time by the number of items to increase auction time lineary."] = "Умножение времени аукциона на количество товаров может линейно увеличить время аукциона."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1193
CLM.L["Multiply time"] = "Умножение времени"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:31
CLM.L["Mythic"] = "Мифическое"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:167
CLM.L["Nalorakk"] = "Налоракк"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:916
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:743
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:820
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:427
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:438
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:179
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:260
CLM.L["Name"] = "Имя"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:145
CLM.L["Named Buttons"] = "Названные кнопки"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:59
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:8
CLM.L["Naxxramas"] = "Наксрамас"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:796
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:829
CLM.L["Neck"] = "Шея"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:86
CLM.L["Nefarian"] = "Нефариан"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:235
CLM.L["Nefarian's End"] = "Nefarian's End"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:135
CLM.L["Netherspite"] = "Гнев Пустоты"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:36
CLM.L["Never show changelog"] = "Никогда не показывать изменения"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1160
CLM.L["New highest bid on %s: %s %s %s"] = "Новая наивысшая ставка на %s: %s %s %s"
-- ClassicLootManager_Integrations/GenericImport.lua:104
CLM.L["New roster: %s"] = "Новый состав: %s"
-- ClassicLootManager_Integrations/Migration.lua:123
CLM.L["New roster: [%s]"] = "Новый состав: [%s]"
-- ClassicLootManager/Modules/Common/Version/Version.lua:76
CLM.L["New version of Core Loot Manager is available. For best experience please update the AddOn."] = "Новая версия Core Loot Manager доступна. Для лучшего опыта использования, пожалуйста, обновите аддон."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:784
CLM.L["Next item"] = "Следующий проект"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:783
CLM.L["Next"] = "Следующий"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:138
CLM.L["Nightbane"] = "Ночная Погибель"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1348
CLM.L["No auction in progress"] = "Нет аукционов в процессе"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:192
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:179
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:902
CLM.L["No bids"] = "Нет ставок"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:518
CLM.L["No loot received"] = "Добыча не получена"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:255
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:381
CLM.L["No players selected"] = "Никто не выбран"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:543
CLM.L["No points received"] = "Очки не получены"
-- ClassicLootManager/Utils.lua:599
CLM.L["No"] = "Нет"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:818
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:851
CLM.L["Non-equippable"] = "Неодеваемое"
-- ClassicLootManager_Integrations/Integrations.lua:669
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:223
-- ClassicLootManager/Modules/GUI/Filters.lua:191
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:301
CLM.L["None"] = "Никто"
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:103
CLM.L["Normal Mode"] = "Нормальный режим"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:29
CLM.L["Normal"] = "Обычное"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:206
CLM.L["Northrend Beasts"] = "Нордскольские чудовища"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1341
CLM.L["Not in a roster"] = "Не в составе"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:270
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:560
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:638
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:683
CLM.L["Not in raid"] = "Не в рейде"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:161
CLM.L["Note to be added to award. Max 25 characters. It is recommended to not include date nor selected reason here. If you will input encounter ID it will be transformed into boss name."] = "Примечание будет добавлено в награду. Макс 25 символов. Рекомендуется не включать дату и не выбранную причину здесь. Если вы введете идентификатор боя, он будет преобразован в имя босса."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:120
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:159
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:233
CLM.L["Note"] = "Заметка"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:103
CLM.L["Noth the Plaguebringer"] = "Нот Чумной"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:715
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:800
CLM.L["Notify that you are passing on the item."] = "Уведомьте, что вы пасуете на предмет."
-- ClassicLootManager_Integrations/GUI.lua:144
CLM.L["November"] = "Ноябрь"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:704
CLM.L["Num"] = "Значение"
-- ClassicLootManager_Integrations/Integrations.lua:142
-- ClassicLootManager_Integrations/Integrations.lua:147
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:576
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:427
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1153
CLM.L["OS"] = "ОС"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:227
CLM.L["Occu'thar"] = "Occu'thar"
-- ClassicLootManager_Integrations/GUI.lua:143
CLM.L["October"] = "Октябрь"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:812
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:845
CLM.L["Off Hand"] = "Левая рука"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1351
CLM.L["Off-spec bidding not allowed"] = "Ставки на офф-спек не разрешены."
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:231
CLM.L["Omnotron Defense System"] = "Omnotron Defense System"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:924
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:93
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:241
CLM.L["On Time Bonus Value"] = "Значение бонуса за приход вовремя"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:88
CLM.L["On Time Bonus value"] = "Значение бонуса за приход вовремя"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:917
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:520
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:86
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:239
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:85
CLM.L["On Time Bonus"] = "Приход вовремя"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:810
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:843
CLM.L["One-Hand"] = "Одноручное"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:979
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:127
CLM.L["Online only"] = "В онлайне"
-- ClassicLootManager/Modules/GUI/Filters.lua:76
CLM.L["Online"] = "Онлайн"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:191
CLM.L["Only when ML/RL"] = "Только когда МЛ/РЛ"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:68
CLM.L["Onyxia"] = "Ониксия"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:46
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:7
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:105
CLM.L["Onyxia's Lair"] = "Логово Ониксии"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:127
CLM.L["Open Key Bindings UI for AddOns"] = "Открыть интерфейс назначения клавиш для аддонов"
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:55
CLM.L["Open trade"] = "Открыть торговлю"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:718
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:725
CLM.L["Open"] = "Открытый"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:131
CLM.L["Opera Hall"] = "Опера"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:127
CLM.L["Ossirian the Unscarred"] = "Оссириан Неуязвимый"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1351
CLM.L["Other"] = "Прочее"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:94
CLM.L["Ouro"] = "Оуро"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:75
CLM.L["Overrides"] = "Ручная коррекция"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1292
CLM.L["PASS"] = "ПАС"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1106
CLM.L["PR Rounding"] = "PR Округление"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1318
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:439
CLM.L["PR"] = "PR"
-- .:indirectly
CLM.L["Paladin"] = "Паладин"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:288
CLM.L["Participated"] = "Участвовавшие"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:714
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:799
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1082
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1246
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:301
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:428
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:847
CLM.L["Pass"] = "Пас"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1350
CLM.L["Passing after bidding not allowed"] = "Пас после ставки запрещен"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:99
CLM.L["Patchwerk"] = "Лоскутик"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:318
CLM.L["Patterns"] = "Рецепты"
-- ClassicLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:132
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:129
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:124
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:272
CLM.L["Player"] = "Игрок"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:363
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:376
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:393
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:407
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:421
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:440
CLM.L["Please select a raid"] = "Выберите рейд"
-- ClassicLootManager_Integrations/GUI.lua:19
CLM.L["Point History"] = "История ДКП"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1076
CLM.L["Point award multiplier for players on bench."] = "Множитель очков для игроков на скамейке."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:997
CLM.L["Point caps"] = "Лимит очков"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:827
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1398
CLM.L["Point type"] = "Тип очков"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:22
CLM.L["Point"] = "Очки"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:184
CLM.L["Points value that will be awarded."] = "Значение очков, которое будет вручено."
-- ClassicLootManager/Utils.lua:1107
CLM.L["Poor"] = "Низкое"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:517
CLM.L["Post all bids after awarding item"] = "Разместите все заявки после присуждения товара"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:516
CLM.L["Post all bids on award"] = "Разместите все заявки на награду"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:67
CLM.L["Post bids"] = "Публиковать ставки"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:67
CLM.L["Post channel"] = "Канал публикации"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:270
CLM.L["Price Tooltips"] = "Подсказки цен"
-- .:indirectly
CLM.L["Priest"] = "Жрец"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:137
CLM.L["Prince Malchezaar"] = "Принц Малчезар"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:66
CLM.L["Prince Thunderaan"] = "Prince Thunderaan"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:92
CLM.L["Princess Huhuran"] = "Принцесса Хухуран"
-- ClassicLootManager_Integrations/Integrations.lua:137
-- ClassicLootManager_Integrations/Integrations.lua:147
CLM.L["Prioritized"] = "Приоритет"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:215
CLM.L["Professor Putricide"] = "Профессор Мерзоцид"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:276
CLM.L["Profile %s already exists and is used by different GUID %s (%s). "] = "Профиль %s уже существует и используется различными GUID %s ( %s)."
-- .:indirectly
CLM.L["Profiles"] = "Профили"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:523
CLM.L["Progression Bonus"] = "Бонус за прогресс"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:413
CLM.L["Provide number of raids needed for 100% attendance in a weekly reset. Between 1 - 50 raids. Defaults to 2. Requires /reload."] = "Количество рейдов, необходимых в неделю для получения 100% посещения. Значение от 1 до 50. По умолчанию 2. Требуется /reload"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:431
CLM.L["Provide number of weeks that will be accounted for attendance. Between 1 - 1000 weeks. Defaults to 10. Requires /reload."] = "Количество недель, по которым будет высчитываться посещаемость. Значение от 1 до 1000. По умолчанию 10. Требуется /reload"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:92
CLM.L["Prune profiles"] = "Удалить профили"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1068
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:148
CLM.L["Put players leaving raid on bench instead of removing them. To remove them completely they will need to be removed manually from the bench."] = "Добавить игроков, которые вышли из рейда на замену, вместо того, чтобы удалять их совсем. Для того, чтобы удалить совсем - необходимо вручную удалить из замены"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:216
CLM.L["Queen Lana'thel"] = "Королева Лана'Тель"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:822
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:855
CLM.L["Quiver"] = "Колчан"
-- ClassicLootManager_Integrations/Integrations.lua:227
-- ClassicLootManager_Integrations/Integrations.lua:233
CLM.L["RCLC Integration"] = "Интеграция с RCLC"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:699
CLM.L["ROLL"] = "РОЛЛ"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:161
CLM.L["Rage Winterchill"] = "Лютый Хлад"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:78
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:252
CLM.L["Ragnaros"] = "Рагнарос"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:246
CLM.L["Raid Completion Bonus Value"] = "Значение бонуса за пройденный рейд"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:94
CLM.L["Raid Completion Bonus value"] = "Значение бонуса за пройденный рейд"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:932
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:522
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:101
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:244
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:91
CLM.L["Raid Completion Bonus"] = "За пройденный рейд"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:939
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:108
CLM.L["Raid Completion Value"] = "Значение за пройденный рейд"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:184
CLM.L["Raid Name"] = "Имя рейда"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:228
CLM.L["Raid Start/End"] = "Старт/стоп рейда"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:224
CLM.L["Raid Warnings"] = "Оповещения рейда"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:429
CLM.L["Raid [%s] ended"] = "Рейд [%s] завершен"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:377
CLM.L["Raid [%s] started"] = "Рейд [%s] стартовал"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:315
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:337
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:409
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:452
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:477
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:511
CLM.L["Raid management is disabled during time traveling."] = "Управление рейдом выключено в режиме путешествия во времени."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:819
CLM.L["Raid"] = "Рейд"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:39
CLM.L["Raid: %s Roster: %s"] = "Рейд: %s Состав: %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:412
CLM.L["Raids needed in reset"] = "Рейдов за неделю"
-- ClassicLootManager_Integrations/GUI.lua:21
CLM.L["Raids"] = "Рейды"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:817
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:850
CLM.L["Ranged (wands)"] = "Жезлы"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:816
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:849
CLM.L["Ranged"] = "Дальний бой"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:82
CLM.L["Ranks"] = "Ранги"
-- ClassicLootManager/Utils.lua:1110
CLM.L["Rare"] = "Редкое"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:79
CLM.L["Razorgore the Untamed"] = "Бритвосмерт Неукротимый"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:198
CLM.L["Razorscale"] = "Острокрылая"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:174
CLM.L["Reason"] = "Причина"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:430
CLM.L["Received"] = "Получено"
-- ClassicLootManager_Integrations/Integrations.lua:132
-- ClassicLootManager_Integrations/Integrations.lua:142
CLM.L["Regular"] = "Обычный"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:823
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:856
CLM.L["Relic"] = "Реликвия"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:157
CLM.L["Reliquary of Souls"] = "Реликварий Потерянных"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:276
CLM.L["Remove all items from auction list. Populates new one if there are any pending."] = "Удалить все вещи из списка аукциона. Добавит новые если они есть в очереди ожидания."
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:81
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:104
CLM.L["Remove all"] = "Удалить все"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:80
CLM.L["Remove auction"] = "Удалить аукцион"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:729
CLM.L["Remove from roster"] = "Удалить из состава"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:680
CLM.L["Remove from standby"] = "Удалить с замены"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:287
CLM.L["Remove item from auction list after it's awarded."] = "Удалить вещь из списка аукциона после ее вручения."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:488
CLM.L["Remove items without bids from auction list. This will make marking items as disenchanted not possible."] = "Удалить предметы без ставок из списка аукциона. Это сделает невозможным маркировку предметов как распыленных."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:487
CLM.L["Remove items without bids"] = "Удалить предметы без ставок"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:93
CLM.L["Remove old"] = "Удалить старое"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:382
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:285
CLM.L["Remove on award"] = "Удалить при вручении"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:644
CLM.L["Remove override"] = "Убрать переопределение"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:881
CLM.L["Remove roster"] = "Удалить состав"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:434
CLM.L["Remove selected raid"] = "Удалить выбранный рейд"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:470
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:293
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:804
CLM.L["Remove selected"] = "Удалить выбранное"
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:68
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:286
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:887
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:396
CLM.L["Remove"] = "Удалить"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:888
CLM.L["Removes current roster."] = "Удалить текущий состав."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:229
CLM.L["Removing %s from current queue."] = "Удаление %s из текущей очереди."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:662
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:740
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:226
CLM.L["Removing items not allowed during auction."] = "Удаление вещей запрещено во время аукциона."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:357
CLM.L["Request standby"] = "Запрос замены"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:106
CLM.L["Rescales CLM UI, except Bidding window. You can rescale Bidding window independently by using Ctrl + Mouse Wheel. Some windows may require closing and reopening."] = "Rescales CLM UI, кроме окна торгов. Вы можете самостоятельно изменить окно торгов независимо, используя колесо CTRL + мыши. Некоторые окна могут потребовать закрытия и повторного открытия."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:151
CLM.L["Reset gui positions"] = "Сброс позиционирования интерфейса"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:335
CLM.L["Restore bar defaults"] = "Восстановить по умолчанию"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:370
CLM.L["Revoke standby"] = "Отзыв замены"
-- .:indirectly
CLM.L["Rogue"] = "Разбойник"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:287
CLM.L["Roll on Loot"] = "Роллить на добычу"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:932
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:531
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:760
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1201
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1202
CLM.L["Roll"] = "Ролл"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:943
CLM.L["Rolling complete"] = "Прокатится"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1390
CLM.L["Roster Name"] = "Поле ввода названия состава"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1389
CLM.L["Roster name"] = "Название состава"
-- ClassicLootManager_Integrations/ImportCSV.lua:90
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:116
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:125
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:818
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:113
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:307
CLM.L["Roster"] = "Состав"
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:134
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:138
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:142
CLM.L["Rosters"] = "Составы"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:217
CLM.L["Rotface"] = "Гниломорд"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1107
CLM.L["Round PR to selected number of decimals"] = "Округлить PR до выбранного количества символов"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:841
CLM.L["Round to selected number of decimals"] = "Округлить до выбранного количества символов"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:115
CLM.L["Round to"] = "Округлить до"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:840
CLM.L["Rounding"] = "Округление"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:96
CLM.L["Ruins of Ahn'Qiraj"] = "Руины Ан'Кираж"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:700
CLM.L["SK"] = "SK"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:988
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:130
CLM.L["Same zone only"] = "В той же локации"
-- ClassicLootManager/MinimapIcon.lua:61
CLM.L["Sandbox mode"] = "Режим песочницы"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:676
CLM.L["Sandbox"] = "Песочница"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:109
CLM.L["Sapphiron"] = "Сапфирон"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:180
CLM.L["Sartharion"] = "Сартарион"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:222
CLM.L["Saviana Ragefire"] = "Савиана Огненная Пропасть"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:719
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:726
CLM.L["Sealed"] = "Запечатано"
-- ClassicLootManager/Modules/GUI/Filters.lua:208
CLM.L["Search for player names. Separate multiple with a comma ','. Minimum 3 characters. Overrides filtering."] = "Поиск имен игроков. Разделите нескольких игроков запятой "
-- ClassicLootManager/Modules/GUI/Filters.lua:207
CLM.L["Search"] = "Поиск"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:689
CLM.L["Season of Discovery"] = "Season of Discovery"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1399
CLM.L["Select DKP or EPGP point system."] = "Выберите DKP или EPGP систему."
-- ClassicLootManager_Integrations/GUI.lua:374
CLM.L["Select Profiles to export"] = "Выбор профилей для экспорта"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:448
CLM.L["Select Rosters to display"] = "Выбрать составы для отображения"
-- ClassicLootManager_Integrations/GUI.lua:343
CLM.L["Select Rosters to export"] = "Выбор составов для экспорта"
-- ClassicLootManager/Modules/GUI/Filters.lua:179
CLM.L["Select all classes."] = "Выбрать все классы."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:288
CLM.L["Select default behavior whenever group loot rolling window gets opened. This will be active only during CLM Raid and while in Raid instance."] = "Выбрать поведение по умолчанию при открытии окна ролла добычи. Это будет активно только во время активного CLM рейда и только внутри рейдового подземелья."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:548
CLM.L["Select equation"] = "Выберите уравнение"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:23
CLM.L["Select logging level for troubleshooting"] = "Выберите уровень логирования для поиска проблем"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:201
CLM.L["Select loot rarity for the annoucement to raid."] = "Выбрать редкость добычи для оповещений."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:469
CLM.L["Select loot rarity threshold to used to fill the auction list."] = "Выбрать редкость предметов для добавления в список аукциона."
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:249
CLM.L["Select modifier combination for awarding."] = "Выберите комбинацию модификатора для награждения."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:478
CLM.L["Select modifier combination for filling auction from bags and corpse."] = "Выбрать комбинации для заполнения списка аукциона из сумок и трупа."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:140
CLM.L["Select roster to add profiles to."] = "Выберите состав для добавления профилей."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:164
CLM.L["Select roster to create raid for."] = "Выберите состав для создания рейда."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:139
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:163
CLM.L["Select roster"] = "Выберите состав"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1004
CLM.L["Select weekly reset timezone. EU: Wed 07:00 GMT or US: Tue 15:00 GMT"] = "Выберете часовой пояс недельного сброса. EU: Среда 07:00 GMT или US: Вторник 15:00 GMT"
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:102
CLM.L["Select |cffeeee00%s|r encounter difficulty for bonus value award (%s)."] = "Выбор |cffeeee00%s|r столкнулся с трудностью для получения бонусной награды (%s)."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:817
CLM.L["Selected"] = "Выбранный"
-- ClassicLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:20
CLM.L["Send to"] = "Отправить"
-- ClassicLootManager_Integrations/GUI.lua:142
CLM.L["September"] = "Сентябрь"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:40
CLM.L["Serpentshrine Cavern"] = "Змеиное святилище"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:469
CLM.L["Set %s points to %s players for %s in <%s>"] = "Начислить %s очки для %s игроков за %s в <%s>"
-- ClassicLootManager_Integrations/GenericImport.lua:183
CLM.L["Set Profiles standings in Rosters"] = "Установить ранги профилей в составе"
-- ClassicLootManager_Integrations/Migration.lua:390
CLM.L["Set points for %s players for team to %s"] = "Начислить очки для %s игроков в команде с %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:185
CLM.L["Set raid name"] = "Установить имя рейда"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:154
CLM.L["Shade of Akama"] = "Тень Акамы"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:134
CLM.L["Shade of Aran"] = "Тень Арана"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:58
CLM.L["Shade of Eranikus"] = "Тень Эраникуса"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:181
CLM.L["Shadron"] = "Шадрон"
-- .:indirectly
CLM.L["Shaman"] = "Шаман"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:246
CLM.L["Shannox"] = "Shannox"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:74
CLM.L["Shazzrah"] = "Шаззрах"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:815
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:848
CLM.L["Shield"] = "Щит"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:573
CLM.L["Shift + Alt"] = "Shift + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:576
CLM.L["Shift + Ctrl + Alt"] = "Shift + Ctrl + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:575
CLM.L["Shift + Ctrl"] = "Shift + Ctrl"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:570
CLM.L["Shift"] = "Сдвиг"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:798
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:831
CLM.L["Shirt"] = "Рубашка"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:797
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:830
CLM.L["Shoulder"] = "Плечи"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:232
CLM.L["Show Award window"] = "Показать окно награды"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:74
CLM.L["Show tooltip info even outside of CLM raid."] = "Показывать подсказки даже вне CLM рейда."
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:88
CLM.L["Silithid Royalty"] = "Трио Жуков"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:218
CLM.L["Sindragosa"] = "Синдрагоса"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:241
CLM.L["Sinestra"] = "Sinestra"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:747
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:753
CLM.L["Single-Priced"] = "Фиксированная"
-- ClassicLootManager_Integrations/Migration.lua:191
CLM.L["Skipping %s"] = "Пропускаю %s"
-- ClassicLootManager_Integrations/Migration.lua:267
CLM.L["Skipping CommunityDKP"] = "Пропускаю CommunityDKP"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:554
CLM.L["Slot multipliers"] = "Мультипликаторы для слота"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:402
CLM.L["Small value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Маленькое значение для тир-аукциона. \n\nУстановите на то же значение, что и другой уровень или отрицательное значение, чтобы игнорировать."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:902
CLM.L["Small"] = "Маленькая"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:429
CLM.L["Spent"] = "Потрачено"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:260
CLM.L["Spine of Deathwing"] = "Spine of Deathwing"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:310
CLM.L["Stacking"] = "Стакающееся"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:814
CLM.L["Stale"] = "Устаревший"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:136
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:146
CLM.L["Standby %s has been sent"] = "Замена %s была отправлена"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:524
CLM.L["Standby Bonus"] = "Бонус за замену"
-- ClassicLootManager/Modules/GUI/Filters.lua:77
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:299
CLM.L["Standby"] = "Замена"
-- ClassicLootManager_Integrations/GUI.lua:18
CLM.L["Standings"] = "Составы"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:387
CLM.L["Start selected raid"] = "Начать выбранный рейд"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:513
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:531
CLM.L["Start"] = "Начать"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:508
CLM.L["Started raid %s"] = "Начат рейд %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1036
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1044
CLM.L["Starting %s"] = "Запуск %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1030
CLM.L["Starting points"] = "Стартовые очки"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:491
CLM.L["Statistics"] = "Статистика"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:261
CLM.L["Status"] = "Статус"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:513
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:531
CLM.L["Stop"] = "Стоп"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:59
CLM.L["Store bids"] = "Хранить ставки"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:60
CLM.L["Store finished auction bids information."] = "Хранить информацию по ставкам в завершенных торгах."
-- ClassicLootManager_Integrations/GenericImport.lua:237
-- ClassicLootManager_Integrations/ImportCSV.lua:117
CLM.L["Success"] = "Успех"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:75
CLM.L["Sulfuron Harbinger"] = "Предвестник Сульфурон"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:32
CLM.L["Sunken Temple"] = "Затонувший храм"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:100
CLM.L["Sunwell Plateau"] = "Плато Солнечного Колодца"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:79
CLM.L["Suppresses changelog display until new version is released"] = "Отключает отображение лога изменений до выхода новой версии"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:153
CLM.L["Supremus"] = "Супремус"
-- ClassicLootManager/MinimapIcon.lua:52
CLM.L["Sync ongoing"] = "Идет синхронизация"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:802
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:835
CLM.L["Tabard"] = "Гербовая накидка"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:133
CLM.L["Tank"] = "Танк"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1366
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:136
CLM.L["Tax"] = "Налог"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:52
CLM.L["Tempest Keep"] = "Крепость Бурь"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:115
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:44
CLM.L["Temple of Ahn'Qiraj"] = "Ан'Кираж"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:182
CLM.L["Tenebron"] = "Тенеброн"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:133
CLM.L["Terestian Illhoof"] = "Терестиан Больное Копыто"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:155
CLM.L["Teron Gorefiend"] = "Терон Кровожад"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:102
CLM.L["Thaddius"] = "Таддиус"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:199
CLM.L["The Assembly of Iron"] = "Железное Собрание"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_4_Cata.lua:29
CLM.L["The Bastion of Twilight"] = "The Bastion of Twilight"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:684
CLM.L["The Burning Crusade"] = "The Burning Crusade"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:108
CLM.L["The Crystal Vale"] = "The Crystal Vale"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:132
CLM.L["The Curator"] = "Смотритель"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:39
CLM.L["The Eye of Eternity"] = "Око Вечности"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:108
CLM.L["The Four Horsemen"] = "Четыре Всадника"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:159
CLM.L["The Illidari Council"] = "Совет иллидари"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:219
CLM.L["The Lich King"] = "Король-лич"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:143
CLM.L["The Lurker Below"] = "Скрытень из глубин"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:29
CLM.L["The Obsidian Sanctum"] = "Обсидиановое святилище"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:87
CLM.L["The Prophet Skeram"] = "Пророк Скерам"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:112
CLM.L["The Ruby Sanctum"] = "Рубиновое святилище"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:688
CLM.L["The War Within"] = "The War Within"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:238
CLM.L["Theralion and Valiona"] = "Theralion and Valiona"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:200
CLM.L["Thorim"] = "Торим"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_4_Cata.lua:40
CLM.L["Throne of the Four Winds"] = "Throne of the Four Winds"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:821
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:854
CLM.L["Thrown"] = "Метательное"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:578
CLM.L["Tier multipliers"] = "Мультипликаторы для тира"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:749
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:754
CLM.L["Tiered"] = "Многоуровневый"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:678
-- ClassicLootManager/MinimapIcon.lua:65
CLM.L["Time Traveling"] = "Путешествую во времени"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1185
CLM.L["Time in seconds by which auction will be extended if bid is received during last 10 seconds."] = "Время в секундах на которое будет продлен аукцион, если ставка будет сделана в последние 10 секунд."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1169
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1201
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1202
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:705
CLM.L["Time"] = "Время"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:783
CLM.L["Timetravel"] = "Путешествие"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:309
CLM.L["Toggle Auction History window display"] = "Включить отображение окна истории торгов"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:713
CLM.L["Toggle Auctioning window display"] = "Включить отображения окна ставок"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:187
CLM.L["Toggle Bidding auto-open"] = "Включить авто-открытие ставок"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:393
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1411
CLM.L["Toggle Bidding window display"] = "Включить отображение окна ставок"
-- ClassicLootManager_Integrations/ImportCSV.lua:215
CLM.L["Toggle CSV import window display"] = "Переключить дисплей импорта CSV"
-- ClassicLootManager/MinimapIcon.lua:82
CLM.L["Toggle Minimap Icon"] = "Переключить иконку минимума"
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:283
CLM.L["Toggle Trade List window display"] = "Включить отображение списка для передачи"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:214
CLM.L["Toggle advancing to next item on the list after bid."] = "Переверните, продвигаясь к следующему элементу в списке после ставки."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:188
CLM.L["Toggle auto open and auto close on auction start and stop"] = "Включить авто-открытие и закрытие окна при начале и окончании аукциона"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:46
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:158
CLM.L["Toggle changelog window display"] = "Включить отображение окна лога изменений"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:45
CLM.L["Toggle changelog"] = "Включить лог изменений"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:197
CLM.L["Toggle closing bidding UI after submitting bid for all items."] = "Активировать закрытие окна ставок после проставления ставок на все вещи."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:383
CLM.L["Toggle default behavior of remove on award field in auctioning ui"] = "Переключить поведение по умолчанию по полю"
-- ClassicLootManager_Integrations/GUI.lua:512
CLM.L["Toggle export window display"] = "Включить отображение окна экспорта"
-- ClassicLootManager_Integrations/GenericImport.lua:280
CLM.L["Toggle import window display"] = "Включить отображение окна импорта"
-- ClassicLootManager/Modules/GUI/UnifiedGUI.lua:436
CLM.L["Toggle standings window display"] = "Включить отображение окна составов"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:172
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:326
CLM.L["Toggle test bar"] = "Перевернуть тестовую полосу"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:151
CLM.L["Toggles addon sounds."] = "Включить звуки аддона."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:303
CLM.L["Toggles auto-rolling on legendary items."] = "Включить авто-ролл на легендарные предметы."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:319
CLM.L["Toggles auto-rolling on patterns."] = "Включить авто-ролл на рецепты."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:311
CLM.L["Toggles auto-rolling on stacking items."] = "Включить авто-ролл на стакающиеся предметы."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:374
CLM.L["Toggles loot and point award announcement to guild"] = "Включить оповещение о добыче в гильдию"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:183
CLM.L["Toggles loot announcement to raid"] = "Включить оповещение о добыче в рейд"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:354
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:367
CLM.L["Too much data to display"] = "Слишком много данных для отображения "
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:188
CLM.L["Toravon the Ice Watcher"] = "Торавон Страж Льда"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:494
CLM.L["Total blocked"] = "Всего заблокировано"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:495
CLM.L["Total decayed"] = "Всего сгорело"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:493
CLM.L["Total received"] = "Всего получено"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:492
CLM.L["Total spent"] = "Всего потрачено"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:108
CLM.L["Tracker"] = "Трекер"
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:193
-- ClassicLootManager/MinimapIcon.lua:135
CLM.L["Trade List"] = "Список для передачи"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:76
CLM.L["Trial of the Crusader"] = "Испытание крестоносца"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:809
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:842
CLM.L["Trinket"] = "Аксессуар"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:37
CLM.L["True"] = "Верно"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:42
CLM.L["Twilight Lord Kelris"] = "Повелитель сумрака Келрис"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:93
CLM.L["Twin Emperors"] = "Императоры-близнецы"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:266
CLM.L["Two different profiles exist for target GUID %s (%s:%s) and name %s (%s:%s). Verify and clean up profiles before updating."] = "Существуют два разных профиля для целевого GUID %s (%s:%s) и имя%s (%s:%s). Проверьте и очистите профили перед обновлением."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:814
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:847
CLM.L["Two-Hand"] = "Двуручное"
-- ClassicLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:141
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:297
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:330
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:706
CLM.L["Type"] = "Тип"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:105
CLM.L["UI Scale"] = "Масштаб пользовательского интерфейса"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:56
CLM.L["Ulduar"] = "Ульдуар"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:258
CLM.L["Ultraxion"] = "Ultraxion"
-- ClassicLootManager_Integrations/Migration.lua:51
CLM.L["Unable to execute migration. Entries already exist."] = "Невозможно выполнить миграцию. Записи уже существуют."
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:169
CLM.L["Unable to get item info from server. Please try auctioning again"] = "Не могу получить информацию о вещи от сервера. Попробуйте начать аукцион заново"
-- ClassicLootManager/Utils.lua:1109
CLM.L["Uncommon"] = "Необычное"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:525
CLM.L["Unexcused absence"] = "Отсутствие"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:44
CLM.L["Unknown roster %s"] = "Неизвестный состав %s"
-- ClassicLootManager/MinimapIcon.lua:56
CLM.L["Unknown sync state"] = "Статус синхронизации неизвестен"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:344
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:444
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:32
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:170
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:240
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:285
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:343
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:172
CLM.L["Unknown"] = "Неизвестно"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:323
-- ClassicLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:88
CLM.L["Unlink Alt"] = "Отвязать альта"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:280
CLM.L["Unlock selected"] = "Разблокировать выбранное"
-- ClassicLootManager_Integrations/Migration.lua:156
CLM.L["UpdatePoints(): Empty targets list"] = "ОбновитьОчки(): Пустой список целей"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:515
CLM.L["Updated raid <%s> %s joined, %s left, %s benched, %s removed"] = "Обновлен рейд <%s> %s игроков добавлено, %s игроков удалено, %s игроков на замене, %s игроков удалены с замены"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1256
CLM.L["Use named buttons"] = "Использовать именные кнопки"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:80
CLM.L["Vaelastrasz the Corrupt"] = "Валестраз Порочный"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:207
CLM.L["Val'kyr Twins"] = "Валь'киры Близнецы"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:211
CLM.L["Valithria Dreamwalker"] = "Валитрия Сновидица"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:305
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:262
CLM.L["Value"] = "Значение"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:46
CLM.L["Vault of Archavon"] = "Склеп Аркавона"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:31
CLM.L["Verbose"] = "Подробный"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:114
CLM.L["Version check in guild"] = "Проверка версии в гильдии"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:182
CLM.L["Version"] = "Версия"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:183
CLM.L["Vesperon"] = "Весперон"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:720
CLM.L["Vickrey"] = "Аукцион Викри"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:91
CLM.L["Viscidus"] = "Нечистотон"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:46
CLM.L["Viscous Fallout"] = "Липкая муть"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:149
CLM.L["Void Reaver"] = "Страж Бездны"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:805
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:838
CLM.L["Waist"] = "Пояс"
-- .:indirectly
CLM.L["Warlock"] = "Чернокнижник"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:255
CLM.L["Warlord Zon'ozz"] = "Warlord Zon'ozz"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:259
CLM.L["Warmaster Blackhorn"] = "Warmaster Blackhorn"
-- .:indirectly
CLM.L["Warrior"] = "Воин"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1012
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:109
CLM.L["Weekly cap"] = "Недельный лимит"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:485
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:488
CLM.L["Weekly gains"] = "За неделю"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1003
CLM.L["Weekly reset timezone"] = "Зона еженедельного сброса"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:112
CLM.L["Weekly reset"] = "Недельный сброс"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:192
CLM.L["When enabled, this will make loot announcement display only if you're Master Looter or Raid Leader (if there is no Master Looter)."] = "Когда включено, оповещения о добыче будут отображаться только если вы РЛ или МЛ (если нет МЛа)."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1257
CLM.L["Will display names of the buttons instead of values in bidding UI"] = "Будет отображать имена кнопок вместо значений в пользовательском интерфейсе"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:359
CLM.L["Will hide bidding window if you enter combat and show it again when you exit. Will also delay auto opening if needed."] = "Сможет окно торгов, если вы войдете в бой, и покажите его снова, когда вы выйдете. Также задержит автоматическое открытие, если это необходимо."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:159
CLM.L["Wipe events"] = "Стереть события"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:39
CLM.L["Wipe"] = "Стереть"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:160
CLM.L["Wipes all events from memory. This will trigger resyncing from other users."] = "Стереть все события. Это вызовет пересинхронизацию от других игроков."
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:40
CLM.L["Wipes the log history"] = "Стирает историю логов"
-- ClassicLootManager_Integrations/Integrations.lua:356
CLM.L["WoW DKP Bot Integration"] = "Интеграция с WoW DKP Bot"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:70
CLM.L["World Bosses"] = "World Bosses"
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:197
CLM.L["Wowpedia"] = "Wowpedia"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:685
CLM.L["Wrath of the Lich King"] = "Wrath of the Lich King"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:803
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:836
CLM.L["Wrist"] = "Запястья"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:201
CLM.L["XT-002 Deconstructor"] = "Разрушитель XT-002"
-- ClassicLootManager/Utils.lua:594
CLM.L["Yes"] = "Да"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:202
CLM.L["Yogg-Saron"] = "Йогг-Сарон"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:256
CLM.L["Yor'sahj the Unsleeping"] = "Yor'sahj the Unsleeping"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:310
CLM.L["You are already in an active raid. Leave or finish it before creating new one."] = "Вы уже в активном рейде. Выйдите или завершите его перед созданием нового."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:364
CLM.L["You are changing roster settings during active raid. You can continue without any issues however the settings will not get applied until you start a new one."] = "Вы меняете настройки списка во время активного рейда. Вы можете продолжить без каких -либо проблем, однако настройки не будут применены, пока вы не запустите новый."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:770
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:897
CLM.L["You are not allowed to auction items"] = "Вам запрещено проводить аукционы"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:469
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:503
CLM.L["You are not allowed to control raid."] = "Вы не можете управлять рейдом"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:306
CLM.L["You are not allowed to create raids."] = "Вам запрещено создавать рейды."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:440
CLM.L["You are not allowed to join raid."] = "Вам запрещено присоединяться к рейдам."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:329
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:401
CLM.L["You are not allowed to start raid."] = "Вам запрещено начинать рейды."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:342
CLM.L["You are not in the raid."] = "Вы не в рейде."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:700
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:709
CLM.L["You can %s max %d players from standby at the same time to a %s raid."] = "Вы можете %s макс %d игроков с замены за раз из %s рейда."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:655
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:664
CLM.L["You can %s max %d players to standby at the same time to a %s raid."] = "Вы можете %s макс %d игроков на замену за раз в %s рейд."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:473
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:507
CLM.L["You can only add players to standby of a progressing raid."] = "Вы можете добавлять замены только в начавшемся рейде"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:646
CLM.L["You can only bench players from same roster as the raid (%s)."] = "Вы можете добавить на замену только игроков из того же состава, что и рейд (%s)."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:405
CLM.L["You can only end an active raid."] = "Вы можете завершать только активный рейд."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:444
CLM.L["You can only join an active raid."] = "Вы можете присоединиться только к активному рейду."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:448
CLM.L["You can only join different raid than your current one."] = "Вы можете присоединиться только к отличному от вашего рейду."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:691
CLM.L["You can only remove from bench players from same roster as the raid (%s)."] = "Вы можете удалить с замены только игроков того же состава, что и рейд (%s)."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:333
CLM.L["You can only start a freshly created raid."] = "Вы можете запустить только свежесозданный рейд."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:743
CLM.L["You can remove max %d players from roster at the same time."] = "Вы можете удалить макс %d игроков из состава за раз."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:345
CLM.L["Your bid (%s) was denied: |cffcc0000%s|r"] = "Ваша ставка (%s) была отклонена: |cffcc0000%s|r"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:327
CLM.L["Your bid (%s) was |cff00cc00accepted|r"] = "Ваша ставка (%s) была |cff00cc00принята|r"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:64
CLM.L["Zero-Sum Bank Inflation"] = "Инфляция при нулевой сумме"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1326
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:61
CLM.L["Zero-Sum Bank"] = "Банк с нулевой суммой"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1334
CLM.L["Zero-Sum Inflation Value"] = "Значение инфляции при нулевой сумме"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:528
CLM.L["Zero-Sum award"] = "Награда за ноль"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1320
CLM.L["Zero-Sum"] = "Нулевая сумма"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:88
CLM.L["Zul'Aman"] = "Зул'Аман"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:78
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:80
CLM.L["Zul'Gurub"] = "Зул'Гуруб"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:171
CLM.L["Zul'jin"] = "Зул'Джин"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:218
CLM.L["[All Roster Configs]: "] = "[Настройки для всех]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:224
CLM.L["[All Roster Default Slot Values]: "] = "[Значения по умолчанию для всех]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:202
CLM.L["[Alt-Main Link]: "] = "[Связь альт-мейн]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:209
CLM.L["[Create Roster]: "] = "[Создать состав]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:212
CLM.L["[Delete Roster]: "] = "[Удалить состав]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:287
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:529
CLM.L["[IGNORE]: Ignoring entry"] = "[ИГНОР]: Игнорирую запись"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:271
CLM.L["[Item Award in Raid]: "] = "[Вручение вещи в рейде]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:268
CLM.L["[Item Award]: "] = "[Вещь]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:258
CLM.L["[Point Award to raid]: "] = "[ДКП рейду]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:255
CLM.L["[Point Award to roster]: "] = "[ДКП составу]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:249
CLM.L["[Point Award]: "] = "[Значение ДКП]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:261
CLM.L["[Point Decay for roster]: "] = "[Сгорание составу]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:252
CLM.L["[Point Decay]: "] = "[Значение сгорания]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:264
CLM.L["[Point Set]: "] = "[Установка значения]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:205
CLM.L["[Profile Lock]: "] = "[Блокировка профиля]:"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:275
CLM.L["[Raid Create]: "] = "[Создать рейд]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:284
CLM.L["[Raid Finish]: "] = "[Завершить рейд]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:278
CLM.L["[Raid Start]: "] = "[Начать рейд]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:281
CLM.L["[Raid Update]: "] = "[Обновить рейд]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:199
CLM.L["[Remove Profile]: "] = "[Удалить профиль]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:215
CLM.L["[Rename Roster]: "] = "[Переименовать состав]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:242
CLM.L["[Roster Boss Kill Bonus]: "] = "[Бонус составу за убийство босса]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:221
CLM.L["[Roster Config]: "] = "[Настройка состава]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:239
CLM.L["[Roster Copy]: "] = "[Копировать состав]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:227
CLM.L["[Roster Default Slot Value]: "] = "[Значения по умолчанию состава]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:245
CLM.L["[Roster Field Rename]: "] = "[Переименование поля списка]:"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:233
CLM.L["[Roster Item Value Override Single]: "] = "[Значение элемента списка переопределение одиночного]:"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:230
CLM.L["[Roster Item Value Override]: "] = "[Стоимость вещи для состава]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:236
CLM.L["[Roster Update Profiles]: "] = "[Обновить профили состава]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:196
CLM.L["[Update Profile]: "] = "[Обновить профиль]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:405
CLM.L["[config] "] = "[настройка] "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:407
CLM.L["[item values] "] = "[значение] "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:408
CLM.L["[profiles] "] = "[профили] "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:406
CLM.L["[slot defaults] "] = "[значения по умолчанию] "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:656
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:665
CLM.L["add"] = "добавить"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:665
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:710
CLM.L["created"] = "создан"
-- ClassicLootManager_Integrations/Integrations.lua:338
CLM.L["else"] = "иначе"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:462
CLM.L["excluding negatives "] = "исключая отрицательные "
-- ClassicLootManager_Integrations/Integrations.lua:273
CLM.L["if reason/response contains"] = "Если причина/ответ содержит"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:97
CLM.L["level"] = "уровень"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:656
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:701
CLM.L["progressing"] = "начатый"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:100
CLM.L["rank"] = "ранг"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:701
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:710
CLM.L["remove"] = "убрать"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:137
CLM.L["request"] = "запрос"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:40
CLM.L["requested"] = "запрошено"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:147
CLM.L["revoke"] = "отозвать"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:70
CLM.L["revoked"] = "отозван"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:910
CLM.L["seconds"] = "секунды"
-- ClassicLootManager_Integrations/Integrations.lua:283
CLM.L["then"] = "то"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:104
CLM.L["unguilded"] = "без гильдии"
-- ClassicLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:142
CLM.L["|cff00cc00Send to:|r If you are trusted in your guild, you will also send whisper syncs to the player.\n|cff00cc00Accept from:|r You will be accepting syncs from the player.\n|cff00cc00Both:|r Both of the above."] = "|cff00cc00send to: |r Если вам доверяют в своей гильдии, вы также отправите синхронизации шепота игроку. \n |cff00cc00accep выше.|r"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1248
CLM.L["|cff00ee44Open:|r English Auction with highest bidder announcement. Highest bidder wins. Two players can not bid same value. Additionally always allows bidding base to accomodate for Swedish Auction flavor.\n\n|cff00ee44Anonymous Open:|r Same as Open but highest bidder name is not disclosed.\n\n|cff00ee44Sealed:|r Bids are not announced. Highest bidder wins.\n\n|cff00ee44Vickrey:|r Same as sealed but winner pays with second-highest bid."] = "|cff00ee44Открытый: |r Английский аукцион с объявлением наибольшей ставки и участника. Наибольшая цена выигрывает. Два игрока не могут сделать одинаковую ставку. Кроме того, всегда позволяет ставить базовую стоимость предмета. \n\n|cff00ee44Закрытый: |r То же самое, что открытый, но имя участника с наибольшей ставкой не оглашется. Наибольшая ставка выигрывает. \n\n|cff00ee444Викри:|r то же самое, что закрытый, но победитель платит вторую по величине ставку."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1124
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1313
CLM.L["|cff00ee44Single-Priced:|r Static value mode. Only bidding Base value is supported.\n\n|cff00ee44Ascending:|r Ranged value mode. Allows bidding any value in |cff44ee00<base, max>|r.\n\n|cff00ee44Tiered:|r Ranged value mode. Allows bidding only specific values. Up to 5 tiers are configurable in |cff44ee00<base, small, medium, large, max>|r."] = "|cff00ee44Статичная цена:|r Режим статичной цены. Только ставка фиксированного значения разрешена.\n\n|cff00ee44На повышение:|r Разрешен диапазон ставок. Разрешается поставить любое значение в диапазоне |cff44ee00<base, max>|r.\n\n|cff00ee44Тир-аукцион:|r Разрешен диапазон ставок. Разрешается ставить только конкретные значения. До 5 тиров можно настроить в диапазоне |cff44ee00<base, small, medium, large, max>|r."
-- ClassicLootManager/Modules/Common/Version/Version.lua:69
CLM.L["|cffcc0000Your Core Loot Manager is significantly out of date.|r AddOn communication has been disabled. Please update as soon as possible."] = "|cffcc0000Ваш Core Loot Manager сильно устарел.|r Коммуникации аддона отключены. Пожалуйста, обновитесь как можно скорее."
end