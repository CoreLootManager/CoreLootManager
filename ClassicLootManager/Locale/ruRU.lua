local _, CLM = ...
if GetLocale() == "ruRU" then
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:326
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:332
CLM.L[" alt of: "] = " альт игрока: "
-- ClassicLootManager/Utils.lua:509
CLM.L[" more"] = " подробнее "
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:178
CLM.L[" over "] = " над "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:399
CLM.L[" profile(s)"] = " профиль(-ей)"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:34
CLM.L["!bid"] = "!bid"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:35
CLM.L["!bidos"] = "!bidos"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:63
CLM.L["!dkp"] = "!dkp"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:269
CLM.L["% that will be decayed."] = "% это будет сгорать."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:343
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:362
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:420
CLM.L["%Y/%m/%d %H:%M:%S (%A)"] = "%Y/%m/%d %H:%M:%S (%A)"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:250
-- ClassicLootManager_Integrations/Models/Exporter.lua:317
-- ClassicLootManager_Integrations/Models/Exporter.lua:318
CLM.L["%Y/%m/%d %a %H:%M:%S"] = "%Y/%m/%d %a %H:%M:%S"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:594
CLM.L["%d/%m/%Y %H:%M:%S"] = "%d/%m/%Y %H:%M:%S"
-- ClassicLootManager_Alerts/Alerts.lua:15
CLM.L["%s %% %s decay"] = "%s %% %s сгорание"
-- ClassicLootManager_Alerts/Alerts.lua:12
CLM.L["%s %s"] = "%s %s"
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:142
CLM.L["%s awarded to %s for %s %s"] = "%s вручено %s за %s %s"
-- ClassicLootManager/MinimapIcon.lua:37
CLM.L["%s events (%s pending)"] = "%s событий (%s ожидает)"
-- ClassicLootManager/MinimapIcon.lua:39
CLM.L["%s events (0x%x)"] = "%s событий (0x%x)"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:40
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:70
CLM.L["%s has %s standby"] = "%s имеет %s замен"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:63
CLM.L["%s is not part of the %s roster"] = "%s не является частью %s состава"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:169
CLM.L["%s profile exists."] = "%s профиль существует"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:171
CLM.L["%s profile missing. Adding."] = "%s профиль отсутствует. Добавляю."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:483
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:493
CLM.L["%s to %s for %s in <%s>"] = "%s для %s за %s в <%s>"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:177
CLM.L["%s was not found in guild."] = "%s не был найден в гильдии"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:92
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:92
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:93
CLM.L["-- All --"] = "-- Все --"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:166
CLM.L["10 Player (Heroic)"] = "10 человек (героик)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:164
CLM.L["10 Player"] = "10 человек"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:169
CLM.L["20 Player"] = "20 человек"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:167
CLM.L["25 Player (Heroic)"] = "25 человек (героик)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:165
CLM.L["25 Player"] = "25 человек"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:168
CLM.L["40 Player"] = "40 человек"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:96
CLM.L["<CLM> %s not present in any roster."] = "<CLM> %s не состоит в составе."
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:98
CLM.L["<CLM> %s standings in %d %s:"] = "<CLM> %s рейтинг в %d %s:"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:107
CLM.L["<CLM> %s: %d DKP (%d this week)."] = "<CLM> %s: %d ДКП (%d эта неделя)."
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:77
CLM.L["<CLM> Missing profile for player %s."] = "<CLM> Нет профиля для %s."
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:57
CLM.L["<CLM> Your bid (%s) was %s%s."] = "<CLM> Ваша ставка (%s) была %s%s."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:145
CLM.L["Action context"] = "Контекст действия"
-- ClassicLootManager_Integrations/Integrations.lua:161
CLM.L["Action to take upon Gargul loot award event happening during raid."] = "Действие, в случае вручения добычи через Gargul loot, во время рейда."
-- ClassicLootManager_Integrations/Integrations.lua:266
CLM.L["Action to take upon RCLC loot award event happening during raid. Trigger is based on RCLC award reason or player response if reason is not used. On Integration Enable the buttons will be prefilled with existing ones."] = "Действие, которое будет сделано в случае выдачи предмета в RCLC во время рейда. Триггер основан на событии выдачи вещи RCLC или на ответе игроков, если применяется опрос. В случае применения интеграции внопки будут предзаполнены требуемыми значениями."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:124
CLM.L["Add currently selected target to list."] = "Добавить текущую цель в список."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:123
CLM.L["Add target"] = "Добавить цель"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:144
CLM.L["Add to roster"] = "Добавить в состав"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:567
CLM.L["Add to standby"] = "Добавить на замену"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:399
CLM.L["Add"] = "Добавить"
-- ClassicLootManager_Integrations/Migration.lua:368
CLM.L["Adding %s loot entries for team to %s"] = "Добавляю %s добычи для состава %s"
-- ClassicLootManager_Integrations/Migration.lua:227
-- ClassicLootManager_Integrations/Migration.lua:346
CLM.L["Adding %s profiles to %s"] = "Добавляю %s профилей для %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:944
CLM.L["Adding missing %s players to current roster"] = "Добавляю %s отсутствующих игроков в текущий состав"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1189
CLM.L["Additional cost (tax) to add to the award value."] = "Дополнительная стоимость (налог) для добавления к цене вещи."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1157
CLM.L["Additional points to be given to players atop of the split value."] = "Дополнительные очки будут начислены игрокам выше разделяющего значения."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:146
CLM.L["Addon sounds"] = "Звуки аддона"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:145
CLM.L["Adds selected players to the selected roster (from dropdown)."] = "Добавляет выбранных игроков в выбранную список (от выпадения)."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:114
CLM.L["Advance to next item after bid"] = "Перейти к следующему пункту после ставки"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:266
CLM.L["Affected players:"] = "Затронутые игроки:"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:102
CLM.L["Akil'zon"] = "Акил'зон"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:84
CLM.L["Al'ar"] = "Ал'ар"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:125
CLM.L["Algalon the Observer"] = "Алгалон Наблюдатель"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:369
CLM.L["All In"] = "Вабанк"
-- ClassicLootManager_Integrations/Migration.lua:29
CLM.L["All migration entries were commited and executed. Congratulations!"] = "Все мигрированные записи были добавлены. Поздравляем!"
-- ClassicLootManager/Modules/GUI/Filters.lua:182
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:23
CLM.L["All"] = "Все"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:79
CLM.L["Allow bidding below minimum points"] = "Разрешить ставки при отрицательных значениях"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1166
CLM.L["Allow biding more than current standings and ending up with less than minimum standings."] = "Разрешить ставить больше чем текущее количество и таким образом оказаться ниже минимального после."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1165
CLM.L["Allow biding more than current standings"] = "Разрешить ставить больше, чем есть сейчас"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1118
CLM.L["Allow equal bids"] = "Разрешить одинаковые ставки"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:76
CLM.L["Allow going below minimum points"] = "Разрешить уходить в отрицательные значения"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:916
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:157
CLM.L["Allow players to subscribe to the bench through Raids menu"] = "Разрешить игрокам подписываться на замену через меню рейда"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:915
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:156
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:136
CLM.L["Allow subscription"] = "Разрешить подписку"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:456
CLM.L["Alt"] = "Альт"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1110
CLM.L["Always allow All-In bids"] = "Всегда разрешать All-In ставки"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1102
CLM.L["Always allow Base bids"] = "Всегда разрешать базовую ставку"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1008
CLM.L["Always allow cancel/pass"] = "Всегда разрешать отмена/пасс"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:798
CLM.L["Americas"] = "Америка"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:747
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:780
CLM.L["Ammo"] = "Патроны"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:98
CLM.L["Anetheron"] = "Анетерон"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:275
CLM.L["Announce award to Guild"] = "Аннонсировать награды в Гильдию"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:168
CLM.L["Announce loot from corpse to Raid"] = "Аннонсировать добычу из трупа в Рейд"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:164
CLM.L["Announce loot"] = "Объявить добычу"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:186
CLM.L["Announcement loot rarity"] = "Аннонсировать редкость добычи"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:646
CLM.L["Anonymous Open"] = "Анонимный Открытый"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1040
CLM.L["Anti-snipe time"] = "Время анти-снайпера"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:659
CLM.L["Anti-snipe time: %s."] = "Анти-снайпер: %s."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:237
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:73
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:503
CLM.L["Anti-snipe"] = "Анти-снайпер"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:32
CLM.L["Anub'Rekhan"] = "Ануб'Рекан"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:139
CLM.L["Anub'arak"] = "Ануб'Арак"
-- ClassicLootManager/Tooltips.lua:37
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:69
CLM.L["Any"] = "Любой"
-- ClassicLootManager_Integrations/GUI.lua:143
CLM.L["April"] = "Апрель"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:121
CLM.L["Archavon the Stone Watcher"] = "Аркавон Страж Камня"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:101
CLM.L["Archimonde"] = "Архимонд"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:164
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:333
CLM.L["Are you sure, you want to award %s to %s for %s %s?"] = "Вы уверены, что хотите отдать %s %s за %s %s?"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:673
CLM.L["Ascending"] = "По возрастанию"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:226
CLM.L["Assistant"] = "Помощник"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:359
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:370
CLM.L["Att. [%]"] = "Пос. [%]"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:372
CLM.L["Attendance"] = "Посещаемость"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:64
CLM.L["Attumen the Huntsman"] = "Ловчий Аттумен"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:225
CLM.L["Auction End Countdown"] = "Отсчет конца аукциона"
-- ClassicLootManager/MinimapIcon.lua:109
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:219
CLM.L["Auction History"] = "История торгов"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:209
CLM.L["Auction Start/End"] = "Старт/стоп аукциона"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:236
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:70
CLM.L["Auction Time"] = "Осталось: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:58
CLM.L["Auction Type"] = "Тип аукциона"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:572
CLM.L["Auction complete"] = "Аукцион завершен"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:307
CLM.L["Auction finished"] = "Аукцион завершен"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1032
CLM.L["Auction length in seconds."] = "Длительность аукциона в секундах."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1031
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:493
CLM.L["Auction length"] = "Время аукциона"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:287
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:651
CLM.L["Auction of %s items."] = "Аукцион %s вещей."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:291
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:653
CLM.L["Auction of %s"] = "Аукцион %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:974
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:480
CLM.L["Auction settings"] = "Настройки аукциона"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:563
CLM.L["Auction stopped by Master Looter"] = "Аукцион остановлен Распределяющим добычу"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:657
CLM.L["Auction time: %s."] = "Время аукциона: %s."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:123
CLM.L["Auction timer bar width"] = "Аукционный таймер ширина"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1126
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1198
CLM.L["Auction type"] = "Тип аукциона"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:381
CLM.L["Auctioning - Chat Commands"] = "Аукцион - команды чата"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:60
CLM.L["Auctioning - History"] = "История торгов"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:303
CLM.L["Auctioning - List Filling"] = "Аукцион - заполнение списка"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:527
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:535
CLM.L["Auctioning requires active raid or roster mode."] = "Аукцион требует активного рейда или включенного режима аукциона по составу."
-- ClassicLootManager/MinimapIcon.lua:104
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:646
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:271
CLM.L["Auctioning"] = "Аукцион"
-- ClassicLootManager_Integrations/GUI.lua:147
CLM.L["August"] = "Август"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:126
CLM.L["Auriaya"] = "Ауриайя"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:661
CLM.L["Author"] = "Автор"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:923
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:148
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:124
CLM.L["Auto bench leavers"] = "Авто замена при выходе"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:284
CLM.L["Auto-assign from corpse"] = "Авто-вручение из трупа"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:293
CLM.L["Auto-trade after award"] = "Авто-выдача после награждения"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:394
CLM.L["Average weeks"] = "Недель для среднего"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:241
CLM.L["Award %s points to %s selected players."] = "Выдать %s очков %s выбранным игрокам."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:235
CLM.L["Award %s points to everyone in raid."] = "Выдать %s очков всем в рейде."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:237
CLM.L["Award %s points to everyone in roster."] = "Выдать %s очков всем в составе."
-- ClassicLootManager_Integrations/Integrations.lua:650
CLM.L["Award for Base"] = "Выдать за мин ставку"
-- ClassicLootManager_Integrations/Integrations.lua:649
CLM.L["Award for Free"] = "Выдать бесплатно"
-- ClassicLootManager_Integrations/Integrations.lua:653
CLM.L["Award for Large"] = "Выдать за большую ставку"
-- ClassicLootManager_Integrations/Integrations.lua:654
CLM.L["Award for Max"] = "Выдать за макс ставку"
-- ClassicLootManager_Integrations/Integrations.lua:652
CLM.L["Award for Medium"] = "Выдать за среднюю ставку"
-- ClassicLootManager_Integrations/Integrations.lua:651
CLM.L["Award for Small"] = "Награда за малую ставку"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:198
CLM.L["Award item"] = "Отдать за: "
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:859
CLM.L["Award points only to online players"] = "Начислять ДКП только игрокам в онлайне"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:868
CLM.L["Award points only to players in same zone"] = "Начислять ДКП только игрокам в той же локации"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:189
CLM.L["Award points to players based on context."] = "Начислять игрокам на основе контекста."
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:136
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:178
CLM.L["Award value"] = "Стоимость"
-- ClassicLootManager/MinimapIcon.lua:118
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:145
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:194
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:231
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:188
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:318
CLM.L["Award"] = "Начисление"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:293
CLM.L["Award:"] = "Вручить:"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:456
CLM.L["Awarded %s points for %s to all players in raid %s"] = "Начислено %s точки за %s всем игрокам в рейде %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:432
CLM.L["Awarded %s points to %s players for %s in <%s>"] = "Начислено %s точки %s игрокам за %s в <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:448
CLM.L["Awarded %s points to all players for %s in <%s>"] = "Начислено %s точки всем игрокам за %s в <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:221
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:287
CLM.L["Awarded by"] = "Выдал"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:62
CLM.L["Ayamiss the Hunter"] = "Аямисса Охотница"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:100
CLM.L["Azgalor"] = "Азгалор"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:726
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:759
CLM.L["Back"] = "Спина"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:746
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:779
CLM.L["Bag"] = "Сумка"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:156
CLM.L["Baltharus the Warborn"] = "Балтарус, Рожденный в битве"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:9
CLM.L["Baron Geddon"] = "Барон Геддон"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:353
CLM.L["Base value for Static-Priced auction.\nMinimum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Базовое значение для статического ценового аукциона. \nМинимальное значение для восходящего и многоуровневого аукциона. \n\nУстановлено то же значение, что и другой уровень или отрицательный, чтобы игнорировать."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:828
CLM.L["Base"] = "Мин"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:25
CLM.L["Battleguard Sartura"] = "Боевой страж Сартура"
-- ClassicLootManager_Integrations/GUI.lua:321
-- ClassicLootManager_Integrations/GUI.lua:328
-- ClassicLootManager_Integrations/GUI.lua:335
CLM.L["Begin %d days ago, finish today."] = "Начало %d дней назад, окончание сегодня."
-- ClassicLootManager_Integrations/GUI.lua:254
CLM.L["Begin Day"] = "Стартовый день"
-- ClassicLootManager_Integrations/GUI.lua:265
CLM.L["Begin Month"] = "Стартовый месяц"
-- ClassicLootManager_Integrations/GUI.lua:276
CLM.L["Begin Year"] = "Стартовый год"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:931
CLM.L["Bench multiplier"] = "Множитель скамейки"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:909
CLM.L["Bench"] = "Замены"
-- ClassicLootManager_Alerts/Alerts.lua:25
CLM.L["Bid %s accepted!"] = "Ставка %s принята!"
-- ClassicLootManager_Alerts/Alerts.lua:33
CLM.L["Bid %s denied!"] = "Ставка %s не принята!"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:799
CLM.L["Bid accepted!"] = "Ставка принята!"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1054
CLM.L["Bid cancelling not allowed"] = "Отмена ставок запрещена"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:803
CLM.L["Bid denied!"] = "Ставка не принята!"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1052
CLM.L["Bid increment too low"] = "Слишком низкое увеличение ставки"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:260
CLM.L["Bid input values as Main spec bid."] = "Ставка МС."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:274
CLM.L["Bid input values as Off spec bid."] = "Ставка ОС."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1050
CLM.L["Bid too high"] = "Ставка слишком высокая"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1049
CLM.L["Bid too low"] = "Ставка слишком низкая"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:370
CLM.L["Bid your current DKP (%s)."] = "Поставьте свое текущее ДКП (%s)."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:259
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:638
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:409
CLM.L["Bid"] = "Ставка"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1048
CLM.L["Bidding over current standings not allowed"] = "Ставки выше текущей позиции невозможны"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1047
CLM.L["Bidding while below minimum standings not allowed"] = "Ставки при отрицательных значениях запрещены"
-- ClassicLootManager/MinimapIcon.lua:114
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:994
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:75
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:162
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:746
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:991
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1047
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:528
CLM.L["Bidding"] = "Ставки"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:241
CLM.L["Bids"] = "Ставки"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:122
CLM.L["Bindings"] = "Привязки"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:348
CLM.L["Black Temple"] = "Черный храм"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:213
CLM.L["Blackwing Lair"] = "Логово Крыла Тьмы"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:144
CLM.L["Blood Council"] = "Совет кровавых принцев"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:53
CLM.L["Bloodlord Mandokir"] = "Мандокир Повелитель Крови"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:775
CLM.L["Bonuses"] = "Бонусы"
-- ClassicLootManager/ClassicLootManager.lua:225
CLM.L["Boot complete"] = "Загрузка завершена"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:432
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:781
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:80
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:238
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:82
CLM.L["Boss Kill Bonus"] = "За убийство босса"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1069
CLM.L["Boss kill award values"] = "Значение бонуса за убийство босса"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:17
CLM.L["Broodlord Lashlayer"] = "Предводитель драконов Разящий Бич"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:109
CLM.L["Brutallus"] = "Бруталл"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:61
CLM.L["Buru the Gorger"] = "Буру Ненасытный"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:940
CLM.L["Button Names"] = "Имена кнопок"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:31
CLM.L["C'Thun"] = "К'тун"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:792
CLM.L["Can't use"] = "Не могу использовать"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:307
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:470
CLM.L["Cancel your bid."] = "Отменить свою ставку."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:333
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:353
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:440
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:306
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:469
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:796
CLM.L["Cancel"] = "Отмена"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:700
CLM.L["Change roster name."] = "Изменить название состава."
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:15
CLM.L["Changelog"] = "Лог изменений"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:124
CLM.L["Changes auction timer bar width."] = "Изменения Аукцион Таймер Ширина."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1058
CLM.L["Changing bid from Main-spec to Off-Spec not allowed"] = "Изменение ставки с МС на ОС не разрешено"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:73
CLM.L["Channel for posting bids."] = "Канал публикации ставок."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:217
CLM.L["Chat Commands"] = "Чат команды"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:62
CLM.L["Chat bidding is currently disabled."] = "Ставки в чате отключены."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:72
CLM.L["Chess Event"] = "Шахматный турнир"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:728
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:761
CLM.L["Chest (robes)"] = "Грудь (роба)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:727
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:760
CLM.L["Chest"] = "Грудь"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:21
CLM.L["Chromaggus"] = "Хромаггус"
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:263
CLM.L["Classic Loot Manager %s initialization complete. %s"] = "Classic Loot Manager %s загрузка завершена. %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI.lua:270
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:15
CLM.L["Classic Loot Manager"] = "Classic Loot Manager"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:616
CLM.L["Classic"] = "Классика"
-- ClassicLootManager/Modules/GUI/Filters.lua:196
CLM.L["Clear all classes."] = "Убирает все классы."
-- ClassicLootManager_Integrations/GUI.lua:479
CLM.L["Clear output"] = "Очистить"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:266
CLM.L["Clear"] = "Очистить"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:106
CLM.L["Close on bid"] = "Закрыть ставку"
-- ClassicLootManager/Utils.lua:892
CLM.L["Common"] = "Обычное"
-- ClassicLootManager/MinimapIcon.lua:133
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:311
-- ClassicLootManager_Integrations/GUI.lua:23
CLM.L["Configuration"] = "Настройки"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:736
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:744
CLM.L["Copy settings from selected roster."] = "Скопировать настройки из текущего состава."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:729
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:735
CLM.L["Copy settings"] = "Скопировать настройки"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:743
CLM.L["Copy source"] = "Скопировать источник"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:437
CLM.L["Correcting error"] = "Исправление ошибки"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:196
CLM.L["Create new raid with provided name. You will automatically join this raid and leave any other you are part of."] = "Создать новый рейд с выбранным именем. Вы автоматически присоединитесь к рейду и выйдите из любого другого."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:503
CLM.L["Create raid %s %s in <%s>"] = "Создать рейд %s %s в <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:195
CLM.L["Create raid"] = "Создать рейд"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1212
-- ClassicLootManager_Integrations/Integrations.lua:252
CLM.L["Create"] = "Создать"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:793
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:263
CLM.L["Created"] = "Создано"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1213
CLM.L["Creates new roster with default configuration"] = "Создает новый состав с настройками по умолчанию"
-- ClassicLootManager_Integrations/Integrations.lua:253
CLM.L["Creates new trigger to be used during RCLC award."] = "Создает новый триггер для использования во время вручения вещей в RCLC."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:458
CLM.L["Ctrl + Alt"] = "Ctrl + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:455
CLM.L["Ctrl"] = "Ctrl"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:647
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:991
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:418
CLM.L["Current"] = "Текущий"
-- ClassicLootManager/Tooltips.lua:95
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:168
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:139
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:622
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:356
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:419
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:429
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:452
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:356
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:398
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:987
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:337
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:882
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:191
-- ClassicLootManager_Alerts/Alerts.lua:14
CLM.L["DKP"] = "ДКП"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:157
CLM.L["DPS"] = "Дпс"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:250
CLM.L["Danger Zone - Use at own risk"] = "Опасная зона - Используйте на свой страх и риск"
-- ClassicLootManager_Integrations/GUI.lua:227
CLM.L["Data"] = "Данные"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:177
CLM.L["Date"] = "Дата"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:145
CLM.L["Deathbringer Saurfang"] = "Саурфанг Смертоносный"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:268
CLM.L["Decay %"] = "Сгорание %"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:330
CLM.L["Decay %s%% points to %s selected players."] = "Сжечь %s%% очков %s выбранных игроков"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:326
CLM.L["Decay %s%% points to everyone in roster."] = "Сжечь %s%% очков всем в составе"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:278
CLM.L["Decay Negatives"] = "Сжигать отрицательное"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:443
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:292
CLM.L["Decay"] = "Сгорание"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:440
CLM.L["Decayed %s%% points to %s players in <%s>"] = "Сожжено %s%% точки %s игрокам в <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:464
CLM.L["Decayed %s%% points to all players %s in <%s>"] = "Сожжено %s%% точки всем игрокам %s в <%s>"
-- ClassicLootManager_Integrations/GUI.lua:151
CLM.L["December"] = "Декабрь"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:788
CLM.L["Default Boss Kill Bonus Value"] = "Значение по умолчанию за убийство босса"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:85
CLM.L["Default Boss Kill Bonus value"] = "Значение по умолчанию за убийство босса"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1051
CLM.L["Default slot values"] = "Значения слотов по умолчанию"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:660
CLM.L["Description"] = "Описание"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:268
CLM.L["Disable data synchronisation"] = "Отключить синхронизацию данных"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:269
CLM.L["Disable data synchronisation. This might lead to unexpected consequences. Use this at your own risk. Requires /reload to apply."] = "Отключить синхронизацию данных. Это может привести к неожиданным последствиям. Используйте это на свой страх и риск. Для применения требуется /reload."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:453
CLM.L["Disable"] = "Отключить"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:39
CLM.L["Disables display of the changelog for any new version."] = "Отключает отображение истории изменений для любой новой версии."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:259
CLM.L["Display price"] = "Отображать цену"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:80
CLM.L["Do not show again"] = "Больше не показывать"
-- .:indirectly
CLM.L["Druid"] = "Друид"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:987
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1057
CLM.L["Dynamic Item values"] = "Динамические цены вещей"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:368
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:411
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:413
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:469
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:395
CLM.L["EP"] = "EP"
-- ClassicLootManager_Alerts/Alerts.lua:14
CLM.L["EP/GP"] = "EP/GP"
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:190
CLM.L["EPGP WEB"] = "EPGP WEB"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:623
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:946
CLM.L["EPGP"] = "EPGP"
-- ClassicLootManager_Integrations/ImportCSV.lua:153
CLM.L["ERROR - invalid import data"] = "ОШИБКА - неверные данные импорта"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:19
CLM.L["Ebonroc"] = "Черноскал"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:56
CLM.L["Edge of Madness"] = "Грань безумия"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:122
CLM.L["Emalon the Storm Watcher"] = "Эмалон Страж Бури"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:386
CLM.L["Enable !dkp and !bid through whisper / raid. Change requires /reload."] = "Включить !dkp и !bid в личных сообщениях / рейде. Изменения требуют перезагрузки интерфейса."
-- ClassicLootManager_Integrations/Integrations.lua:124
CLM.L["Enable Gargul integration. This will allow Gargul to take control over some aspects of CLM (starting auction from Gargul, and awarding)."] = "Включить интеграцию Gargul. Это позволит Gargul взять под контроль некоторые аспекты CLM (начинать аукцион из Gargul и вручать вещи)."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1001
CLM.L["Enable OS bids"] = "Включить ставки ОС"
-- ClassicLootManager_Integrations/Integrations.lua:239
CLM.L["Enable RCLC integration. This will allow awarding DKP/GP points on RCLC item award. Requires /reload."] = "Включает интеграцию с RCLC. Это позволит вручать DKP/GP очки в списках вручения вещей RCLC. Изменения требуют /reload."
-- ClassicLootManager_Integrations/Integrations.lua:362
CLM.L["Enable WoW DKP Bot Integration. This will result in additional data stored upon logout."] = "Включить интеграцию с WoW DKP Bot. Это приведет к сохранению дополнительных данных при выходе из игры."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:210
CLM.L["Enable announcing auction start and end."] = "Включает оповещения о старте и стопе аукциона"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:89
CLM.L["Enable auto-update bid values when current highest bid changes (open auction only)."] = "Включить авто обновление ставок, когда меняется текущая высшая ставка (для открытых аукционов)."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:88
CLM.L["Enable auto-update bid values"] = "Включить авто обновление ставок"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:385
CLM.L["Enable chat commands"] = "Включить команды чата"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:285
CLM.L["Enable loot auto-assign (Master Looter UI) from corpse when item is awarded"] = "Включить авто-вручение (UI ответственного за добычу) из трупа, когда вещь разыграна"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1149
CLM.L["Enable paid value splitting amongst raiders."] = "Включить разделение оплачиваемой стоимости между рейдерами."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1103
CLM.L["Enable to allow base bids even if higher bids are present if player didn't bid yet. Affects Open-Ascending Auction."] = "Включить разрешение базовой ставки даже если уже есть более высокие ставки от других игроков. Применимо в открытом аукционе с повышением ставок."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1119
CLM.L["Enable to allow equal bids. Affects Open-Ascending Auction."] = "Разрешить одинаковые ставки. Применимо в открытом аукционе с повышением ставок."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1111
CLM.L["Enable to always allow All-In bids. Affects Open-Ascending Auction."] = "Включить разрешение All-in ставок. Применимо в открытом аукционе с повышением ставок."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1009
CLM.L["Enable to always allow cancelling or passing bids. Affects Open-Ascending Auction."] = "Включить возможность всегда отменять ставки или пасовать. Влияет только на открытый аукцион."
-- ClassicLootManager/MinimapIcon.lua:78
CLM.L["Enables / disables minimap Icon"] = "Включает / отключает значок у миникарты"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:34
CLM.L["Enables / disables verbose data printing during logging"] = "Включает / отключает вывод подробных данных при логировании"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:218
CLM.L["Enables announcing chat commands at auction start."] = "Включает оповещения чат команд о начале аукциона"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:234
CLM.L["Enables announcing loot awards."] = "Включает оповещения вручения наград"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:242
CLM.L["Enables announcing new highest bid (when applicable)."] = "Включает оповещение новой высшей ставки"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:201
CLM.L["Enables announcing raid start and end."] = "Включает оповещения старта и стопа рейда"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:294
CLM.L["Enables auto-trade awarded loot after auctioning from bag"] = "Включить автоматическую передачу вещи в окне обмена после завершения торгов"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:260
CLM.L["Enables displaying item price on tooltip."] = "Включает отображение цены вещи в подсказке."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:226
CLM.L["Enables raid-warning countdown for auctions."] = "Включает оповещения отсчета конца аукциона"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:747
CLM.L["End Timetravel"] = "Завершить путешествие во времени"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:400
CLM.L["End selected raid"] = "Завершить выбранный рейд"
-- ClassicLootManager/Utils.lua:895
CLM.L["Epic"] = "Эпическое"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:455
CLM.L["Equation"] = "Уравнение"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:111
CLM.L["Eredar Twins"] = "Эредарские близнецы"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:797
CLM.L["Europe"] = "Европа"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:293
CLM.L["Execute decay for players based on context."] = "Выполнить сгорание для игроков на основе контекста."
-- ClassicLootManager_Integrations/Migration.lua:432
CLM.L["Execute migration from MonolithDKP, EssentialDKP, CommunityDKP, BastionLoot or CEPGP"] = "Выполнить миграцию с MonolithDKP, EssentialDKP, CommunityDKP, Bastionloot или CEPGP"
-- ClassicLootManager_Integrations/Migration.lua:52
CLM.L["Executing Addon Migration with comms disabled."] = "Осуществляю миграцию аддона с выключенной синхронизацией."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:479
CLM.L["Exponent / Base"] = "Показатель / база"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:474
CLM.L["Exponential scaling value used by the equations (Base for EPGPWeb, or Exponent for WoWpedia)"] = "Экспоненциальное значение масштабирования, используемое уравнениями (база для EPGPWEB, или показатель для WoWpedia)"
-- ClassicLootManager/MinimapIcon.lua:127
-- ClassicLootManager_Integrations/GUI.lua:403
-- ClassicLootManager_Integrations/GUI.lua:412
-- ClassicLootManager_Integrations/GUI.lua:489
-- ClassicLootManager_Integrations/GUI.lua:490
CLM.L["Export"] = "Экспорт"
-- ClassicLootManager/Modules/GUI/Filters.lua:83
CLM.L["External"] = "Внешние"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:140
CLM.L["Faction Champions"] = "Враждебные Чемпионы"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:40
CLM.L["False"] = "Ложно"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:26
CLM.L["Fankriss the Unyielding"] = "Фанкрисс Непреклонный"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:81
CLM.L["Fathom-Lord Karathress"] = "Повелитель глубин Каратресс"
-- ClassicLootManager_Integrations/GUI.lua:141
CLM.L["February"] = "Февраль"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:734
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:767
CLM.L["Feet"] = "Ступни"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:110
CLM.L["Felmyst"] = "Пророк Скверны"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:146
CLM.L["Festergut"] = "Тухлопуз"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:307
CLM.L["Fill auction list from corpse"] = "Заполнять список аукциона из трупа"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:308
CLM.L["Fill auction list with items from corpse. Will happen only if you open the corpse loot window."] = "Заполнять список аукциона вещами из трупа. Произойдет только когда вы откроете окно добычи в трупе."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:325
CLM.L["Fill auction list with looted items"] = "Заполнять список аукциона только полученными вещами"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:326
CLM.L["Fill auction list with looted items. This will automatically add all items you have received."] = "Заполнять список аукциона только полученными вещами. Это автоматически будет добавлять все взятые вами предметы."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:99
CLM.L["Fill from Guild"] = "Заполнить из гильдии"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:111
CLM.L["Fill from Raid Roster"] = "Заполнить из рейда"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:317
CLM.L["Fill from corpse only if you are the Loot Master."] = "Заполнять из трупа только если вы ответственный за добычу"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:335
CLM.L["Fill from loot only if you are using Group Loot."] = "Заполнять полученные вещи, если включена групповая добыча."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:112
CLM.L["Fill profile list with players in current raid roster."] = "Заполнить профили игроками из текущего рейда."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:100
CLM.L["Fill profile list with players with the minimum level and ranks."] = "Заполнить профили игроками с минимальным уровнем и рангом."
-- ClassicLootManager/Modules/GUI/Filters.lua:167
CLM.L["Filter"] = "Фильтр"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:735
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:768
CLM.L["Finger"] = "Палец"
-- ClassicLootManager_Integrations/GUI.lua:287
CLM.L["Finish Day"] = "Конечный день"
-- ClassicLootManager_Integrations/GUI.lua:298
CLM.L["Finish Month"] = "Конечный месяц"
-- ClassicLootManager_Integrations/GUI.lua:309
CLM.L["Finish Year"] = "Конечный год"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:527
CLM.L["Finished raid %s"] = "Завершен рейд %s"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:795
CLM.L["Finished"] = "Завершено"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:18
CLM.L["Firemaw"] = "Огнечрев"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:127
CLM.L["Flame Leviathan"] = "Огненный Левиафан"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:20
CLM.L["Flamegor"] = "Пламегор"
-- ClassicLootManager_Integrations/GUI.lua:238
CLM.L["Format"] = "Формат"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:166
CLM.L["Found %s in guild."] = "Найдено %s в гильдии."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:128
CLM.L["Freya"] = "Фрейя"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:222
CLM.L["GM"] = "ГМ"
-- ClassicLootManager/Tooltips.lua:95
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:168
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:139
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:369
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:412
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:440
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:467
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:354
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:393
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:337
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:882
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:191
CLM.L["GP"] = "GP"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:57
CLM.L["Gahz'ranka"] = "Газ'ранка"
-- ClassicLootManager_Integrations/Integrations.lua:117
-- ClassicLootManager_Integrations/Integrations.lua:123
CLM.L["Gargul Integration"] = "Интеграция Gargul"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:8
CLM.L["Garr"] = "Гарр"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:247
CLM.L["Gear Points"] = "Точки передачи"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:7
CLM.L["Gehennas"] = "Гееннас"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:59
CLM.L["General Rajaxx"] = "Генерал Раджакс"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:129
CLM.L["General Vezax"] = "Генерал Везакс"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:157
CLM.L["General Zarithrian"] = "Генерал Заритриан"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:694
CLM.L["General settings"] = "Общие настройки"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:721
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:754
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:97
CLM.L["Global"] = "Общие"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:37
CLM.L["Gluth"] = "Глут"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:12
CLM.L["Golemagg the Incinerator"] = "Големагг Испепелитель"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:43
CLM.L["Gothik the Harvester"] = "Готик Жнец"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:33
CLM.L["Grand Widow Faerlina"] = "Великая вдова Фарлина"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:36
CLM.L["Grobbulus"] = "Гроббулус"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:334
CLM.L["Group Loot Only"] = "Только групповая добыча"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:76
CLM.L["Gruul the Dragonkiller"] = "Груул Драконобой"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:311
CLM.L["Gruul's Lair"] = "Логово Груула"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:92
CLM.L["Gurtogg Bloodboil"] = "Гуртогг Кипящая Кровь"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:55
CLM.L["Hakkar"] = "Хаккар"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:105
CLM.L["Halazzi"] = "Халаззи"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:159
CLM.L["Halion"] = "Халион"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:731
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:764
CLM.L["Hands"] = "Кисти рук"
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:72
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:594
CLM.L["Hard Mode"] = "Высокая сложность"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:900
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:109
CLM.L["Hard cap"] = "Жесткий лимит"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:722
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:755
CLM.L["Head"] = "Голова"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:156
CLM.L["Healer"] = "Целитель"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:40
CLM.L["Heigan the Unclean"] = "Хейган Нечистивый"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:740
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:773
CLM.L["Held In Off-hand"] = "Держится в левой руке"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:106
CLM.L["Hex Lord Malacrass"] = "Повелитель проклятий Малакрасс"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:395
CLM.L["Hides incoming !dkp and !bid whispers. Change requires /reload."] = "Скрывает входящие !dkp и !bid приваты. Изменения требуют /reload."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:404
CLM.L["Hides outgoing !dkp and !bid responses. Change requires /reload."] = "Скрывает исходящие !dkp и !bid приваты. Изменения требуют /reload."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:86
CLM.L["High Astromancer Solarian"] = "Верховный звездочет Солариан"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:75
CLM.L["High King Maulgar"] = "Король Молгар"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:48
CLM.L["High Priest Thekal"] = "Верховный жрец Текал"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:49
CLM.L["High Priest Venoxis"] = "Верховный жрец Веноксис"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:50
CLM.L["High Priestess Arlokk"] = "Верховная жреца Арлокк"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:51
CLM.L["High Priestess Jeklik"] = "Верховная жреца Джеклик"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:52
CLM.L["High Priestess Mar'li"] = "Верховная жреца Мар'ли"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:88
CLM.L["High Warlord Naj'entus"] = "Верховный полководец Наджентус"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:127
CLM.L["History type"] = "Тип истории"
-- .:indirectly
CLM.L["History"] = "История"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:130
CLM.L["Hodir"] = "Ходир"
-- .:indirectly
CLM.L["Hunter"] = "Охотник"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:78
CLM.L["Hydross the Unstable"] = "Гидросс Нестабильный"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:363
CLM.L["Hyjal Summit"] = "Вершина Хиджала"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:480
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:597
CLM.L["Icecrown Citadel"] = "Цитадель Ледяной Короны"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:148
CLM.L["Icecrown Gunship Battle"] = "Воздушный бой"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:131
CLM.L["Ignis the Furnace Master"] = "Повелитель Горнов Игнис"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:101
CLM.L["Ignore entry"] = "Игнорировать запись"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:362
CLM.L["Ignore"] = "Игнорировать"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:96
CLM.L["Illidan Stormrage"] = "Иллидан Ярость Бури"
-- ClassicLootManager_Integrations/Migration.lua:246
-- ClassicLootManager_Integrations/Migration.lua:380
-- ClassicLootManager_Integrations/Migration.lua:424
CLM.L["Import complete"] = "Импорт завершен"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:442
-- ClassicLootManager_Integrations/ImportCSV.lua:100
-- ClassicLootManager_Integrations/ImportCSV.lua:162
-- ClassicLootManager_Integrations/ImportCSV.lua:163
-- ClassicLootManager_Integrations/ImportCSV.lua:191
CLM.L["Import"] = "Импорт"
-- ClassicLootManager_Integrations/Migration.lua:197
CLM.L["Importing %s entries from DKPTable"] = "Импортирую %s значений из DKPTable"
-- ClassicLootManager_Integrations/Migration.lua:308
CLM.L["Importing profiles from DKPTable"] = "Импортирую профили из DKPTable"
-- ClassicLootManager/Modules/GUI/Filters.lua:82
CLM.L["In Guild"] = "В гильдии"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:794
CLM.L["In Progress"] = "В процессе"
-- ClassicLootManager/Modules/GUI/Filters.lua:79
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:291
CLM.L["In Raid"] = "В рейде"
-- ClassicLootManager/MinimapIcon.lua:48
CLM.L["In-Sync"] = "Синхронизирован"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:850
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:140
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:127
CLM.L["Include bench"] = "Учитывать замены"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:851
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:141
CLM.L["Include benched players in all auto-awards"] = "Включить всех игроков на замене в авто получение дкп"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:279
CLM.L["Include players with negative standings in decay."] = "Включите игроков с отрицательным дкп в сгорание."
-- ClassicLootManager/MinimapIcon.lua:46
CLM.L["Incoherent state"] = "Бессвязный статус"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:167
CLM.L["Info"] = "Инфо"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:409
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:415
CLM.L["Information"] = "Информация"
-- ClassicLootManager_Integrations/ImportCSV.lua:73
CLM.L["Input CSV Item value override data"] = "Введите данные о значении элемента CSV"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:161
CLM.L["Input name: %s"] = "Имя вводящего: %s"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:42
CLM.L["Instructor Razuvious"] = "Инструктор Разувиус"
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:138
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:143
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:148
-- ClassicLootManager_Integrations/ClassicLootManager_Integrations.lua:20
CLM.L["Integrations"] = "Интеграции"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:103
CLM.L["Interval Bonus time"] = "Время"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:444
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:826
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:117
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:250
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:100
CLM.L["Interval Bonus"] = "Интервальный бонус"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:833
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:124
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:252
CLM.L["Interval Time"] = "Временной интервал"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:842
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:132
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:253
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:106
CLM.L["Interval Value"] = "Значение"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:834
CLM.L["Interval in [minutes] to award bonus points"] = "Интервал в [минутах] для присуждения бонуса"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1051
CLM.L["Invalid bid value"] = "Неверное значение ставки"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:324
CLM.L["Invalid context. You should not decay raid only."] = "Неверный контекст. Вы не должны разрушать только рейд."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:20
CLM.L["Invalid item link"] = "Неверная ссылка на предмет"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1057
CLM.L["Invalid item"] = "Неверный предмет"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:56
CLM.L["Invalid value provided"] = "Предоставлено неверное значение"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:61
CLM.L["Item Value Mode"] = "Режим стоимости вещи"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:979
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1134
CLM.L["Item value mode"] = "Режим стоимости вещи"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:26
CLM.L["Item value must be positive"] = "Стоимость вещи должна быть положительная"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1063
CLM.L["Item value overrides"] = "Переназначение стоимости"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:91
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:105
CLM.L["Item"] = "Предмет"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:104
CLM.L["Jan'alai"] = "Джан'алай"
-- ClassicLootManager_Integrations/GUI.lua:140
CLM.L["January"] = "Январь"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:54
CLM.L["Jin'do the Hexxer"] = "Мастер проклятий Джин'до"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:82
CLM.L["Join our discord for more info: "] = "Присоединяйтесь к нашему дискорду: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:414
CLM.L["Join selected raid"] = "Присоединиться к выбранному рейду"
-- ClassicLootManager_Integrations/GUI.lua:146
CLM.L["July"] = "Июль"
-- ClassicLootManager_Integrations/GUI.lua:145
CLM.L["June"] = "Июнь"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:87
CLM.L["Kael'thas Sunstrider"] = "Кель'тас Солнечный Скиталец"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:108
CLM.L["Kalecgos"] = "Калесгос"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:294
CLM.L["Karazhan"] = "Каражан"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:99
CLM.L["Kaz'rogal"] = "Каз'рогал"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:46
CLM.L["Kel'Thuzad"] = "Кел'Тузад"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:113
CLM.L["Kil'jaeden"] = "Кил'джеден"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:132
CLM.L["Kologarn"] = "Кологарн"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:123
CLM.L["Koralon the Flame Watcher"] = "Коралон Страж Огня"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:58
CLM.L["Kurinnaxx"] = "Куриннакс"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:149
CLM.L["Lady Deathwhisper"] = "Леди Смертный Шепот"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:83
CLM.L["Lady Vashj"] = "Леди Вайш"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:365
CLM.L["Large value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Большое значение для многоуровневого аукциона. \n\nУстановлено на то же значение, что и другой уровень или отрицательный, чтобы игнорировать."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:831
CLM.L["Large"] = "Большая"
-- ClassicLootManager_Integrations/GUI.lua:327
CLM.L["Last month"] = "Прошлый месяц"
-- ClassicLootManager_Integrations/GUI.lua:320
CLM.L["Last week"] = "Прошлая неделя"
-- ClassicLootManager_Integrations/GUI.lua:334
CLM.L["Last year"] = "Прошлый год"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:429
CLM.L["Latest loot"] = "Последняя добыча"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:452
CLM.L["Latest points"] = "Последние очки"
-- ClassicLootManager/Utils.lua:896
CLM.L["Legendary"] = "Легендарное"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:733
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:766
CLM.L["Legs"] = "Ноги"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:80
CLM.L["Leotheras the Blind"] = "Леотерас Слепец"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:82
CLM.L["Link Alt to Main"] = "Привязать Альта к Мейну"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:445
CLM.L["Linking override"] = "Привязка переопределить"
-- ClassicLootManager/MinimapIcon.lua:42
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:347
CLM.L["Loading..."] = "Загрузка..."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:41
CLM.L["Loatheb"] = "Лотхиб"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:266
CLM.L["Lock selected"] = "Заблокировать выбранное"
-- ClassicLootManager/Modules/GUI/Filters.lua:85
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:397
CLM.L["Locked"] = "Заблокировано"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:24
CLM.L["Logging level"] = "Уровень логирования"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:20
CLM.L["Logging"] = "Логирование"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:233
CLM.L["Loot Awards"] = "Вручение наград"
-- ClassicLootManager_Integrations/GUI.lua:26
CLM.L["Loot History"] = "История лута"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:343
CLM.L["Loot rarity"] = "Редкость добычи"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:24
CLM.L["Loot"] = "Добыча"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:141
CLM.L["Lord Jaraxxus"] = "Лорд Джараксус"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:150
CLM.L["Lord Marrowgar"] = "Лорд Ребрад"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:5
CLM.L["Lucifron"] = "Люцифрон"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:112
CLM.L["M'uru"] = "М'уру"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:437
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:259
-- ClassicLootManager_Integrations/Integrations.lua:137
-- ClassicLootManager_Integrations/Integrations.lua:142
CLM.L["MS"] = "МС"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:34
CLM.L["Maexxna"] = "Мексна"
-- .:indirectly
CLM.L["Mage"] = "Маг"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:6
CLM.L["Magmadar"] = "Магмадар"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:77
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:319
CLM.L["Magtheridon"] = "Магтеридон"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:66
CLM.L["Maiden of Virtue"] = "Благочестивая дева"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:738
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:771
CLM.L["Main Hand"] = "Правая рука"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:175
CLM.L["Main"] = "Мейн"
-- ClassicLootManager/Modules/GUI/Filters.lua:84
CLM.L["Mains"] = "Мейны"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:13
CLM.L["Majordomo Executus"] = "Мажордом Экзекутус"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:120
CLM.L["Malygos"] = "Малигос"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:141
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:73
CLM.L["Management"] = "Управление"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:224
CLM.L["Manager"] = "Менеджер"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:438
CLM.L["Manual adjustment"] = "Ручное начисление"
-- ClassicLootManager_Integrations/GUI.lua:142
CLM.L["March"] = "Март"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:316
CLM.L["Master Loot Only"] = "Только если ответственный за добычу"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:832
CLM.L["Max"] = "Макс"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:892
CLM.L["Maximum point cap player can receive per raid week. Set to 0 to disable."] = "Кап очков, которые игрок может набрать за рейдовую неделю. Поставьте 0 для отключения."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:901
CLM.L["Maximum point cap that player can have. Set to 0 to disable."] = "Кап очков, которые могут быть у игрока. Поставьте 0 для отключения."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:369
CLM.L["Maximum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Максимальное значение для восходящего и многоуровневого аукциона. \n\nУстановить на то же значение, что и другой уровень или отрицательный, чтобы игнорировать."
-- ClassicLootManager_Integrations/GUI.lua:144
CLM.L["May"] = "Май"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:361
CLM.L["Medium value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Среднее значение для многоуровневого аукциона. \n\nУстановлено то же значение, что и другой уровень или отрицательный, чтобы игнорировать."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:830
CLM.L["Medium"] = "Средняя"
-- ClassicLootManager/MinimapIcon.lua:100
CLM.L["Menu"] = "Меню"
-- ClassicLootManager_Integrations/Migration.lua:184
-- ClassicLootManager_Integrations/Migration.lua:262
-- ClassicLootManager_Integrations/Migration.lua:391
CLM.L["Migrating %s"] = "Мигрирую %s"
-- ClassicLootManager_Integrations/Migration.lua:66
CLM.L["Migration complete. %s to apply and sync with others or go to %s to discard."] = "Миграция завершена. %s для принятия и синхронизации или %s для отмены."
-- ClassicLootManager_Integrations/Migration.lua:285
CLM.L["Migration failure: Detected 0 teams"] = "Миграция прервана: Найдено 0 команд"
-- ClassicLootManager_Integrations/Migration.lua:223
-- ClassicLootManager_Integrations/Migration.lua:339
CLM.L["Migration failure: Unable to create profiles"] = "Миграция прервана: Не могу создать профили"
-- ClassicLootManager_Integrations/Migration.lua:35
CLM.L["Migration ongoing: %s(%s)"] = "Миграция в процессе: %s(%s)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:133
CLM.L["Mimiron"] = "Мимирон"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:121
CLM.L["Min bid increment"] = "Мин увеличение ставки"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1179
CLM.L["Minimal increment"] = "Минимальное увеличение"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1180
CLM.L["Minimal value increment for open auction mode."] = "Минимальное увеличение ставки для открытых аукционов."
-- ClassicLootManager_Integrations/Migration.lua:68
CLM.L["Minimap Icon -> Configuration -> Wipe events"] = "Иконка на карте -> Настройки -> Стереть"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:954
CLM.L["Minimum GP used in calculations when player has less GP than this value."] = "Минимальное GP использующееся в расчетах, когда у игрока меньше GP, чем это значение."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:953
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:145
CLM.L["Minimum GP"] = "Минимальное GP"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:86
CLM.L["Minimum Level"] = "Минимальный уровень"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:87
CLM.L["Minimum level of players to fill from guild."] = "Минимальный уровень игроков для заполнения из гильдии."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:142
CLM.L["Minimum points (DKP / EP)"] = "Минимальные очки (DKP / EP)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1017
CLM.L["Minimum standing required to be allowed to bid."] = "Минимальное количество необходимое для разрешения ставки."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1016
CLM.L["Minimum standing"] = "Минимальное количество"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:233
CLM.L["Missing award value"] = "Отсутствует цена выдачи"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:322
CLM.L["Missing decay value"] = "Отсутствует значение сгорания"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:59
CLM.L["Missing profile %s"] = "Отсутствует профиль %s"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:37
CLM.L["Missing roster name and you are not in raid"] = "Отсутствует название состава и вы не в рейде"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:41
CLM.L["Missing roster name. Using Raid Info"] = "Отсутствует название состава. Использую инфо из рейда"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:321
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:393
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:432
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:461
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:495
CLM.L["Missing valid raid"] = "Отсутствует корректный рейд"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:60
CLM.L["Moam"] = "Моам"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:235
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:352
CLM.L["Modifier combination"] = "Комбинация модификатора"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:197
CLM.L["Molten Core"] = "Огненные Недра"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:65
CLM.L["Moroes"] = "Мороуз"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:82
CLM.L["Morogrim Tidewalker"] = "Морогрим Волноступ"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:94
CLM.L["Mother Shahraz"] = "Матушка Шахраз"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:229
CLM.L["Moving %s from current queue to pending queue."] = "Перемещение %s от текущей очереди в ожидание очереди."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:410
CLM.L["Multiple"] = "Несколько"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:527
CLM.L["Multiplier for tier %s (if used by the auction type)."] = "Мультипликатор для тира %s (если используется вашим типом аукциона)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:463
CLM.L["Multiplier used by the equations"] = "Мультипликатор используемый в уравнении"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:468
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:300
CLM.L["Multiplier"] = "Мультипликатор"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:103
CLM.L["Nalorakk"] = "Налоракк"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:699
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:355
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:366
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:261
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:174
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:635
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:406
CLM.L["Name"] = "Имя"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:148
CLM.L["Named Buttons"] = "Названные кнопки"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:242
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:401
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:518
CLM.L["Naxxramas"] = "Наксрамас"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:723
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:756
CLM.L["Neck"] = "Шея"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:22
CLM.L["Nefarian"] = "Нефариан"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:71
CLM.L["Netherspite"] = "Гнев Пустоты"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:38
CLM.L["Never show changelog"] = "Никогда не показывать изменения"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:879
CLM.L["New highest bid on %s: %s %s %s"] = "Новая наивысшая ставка на %s: %s %s %s"
-- ClassicLootManager_Integrations/Migration.lua:111
CLM.L["New roster: [%s]"] = "Новый состав: [%s]"
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:61
CLM.L["New version %s of Classic Loot Manager is available. For best experience please update the AddOn."] = "Новая версия %s Classic Loot Manager доступна. Для лучшего опыта использования, пожалуйста, обновите аддон."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:74
CLM.L["Nightbane"] = "Ночная Погибель"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1053
CLM.L["No auction in progress"] = "Нет аукционов в процессе"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:790
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:198
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:176
CLM.L["No bids"] = "Нет ставок"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:446
CLM.L["No loot received"] = "Добыча не получена"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:220
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:311
CLM.L["No players selected"] = "Никто не выбран"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:475
CLM.L["No points received"] = "Очки не получены"
-- ClassicLootManager/Utils.lua:518
CLM.L["No"] = "Нет"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:745
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:778
CLM.L["Non-equippable"] = "Неодеваемое"
-- ClassicLootManager/Modules/GUI/Filters.lua:195
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:302
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:268
-- ClassicLootManager_Integrations/Integrations.lua:648
CLM.L["None"] = "Никто"
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:71
CLM.L["Normal Mode"] = "Нормальный режим"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:142
CLM.L["Northrend Beasts"] = "Нортрендские Чудовища"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1046
CLM.L["Not in a roster"] = "Не в составе"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:570
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:615
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:537
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:255
CLM.L["Not in raid"] = "Не в рейде"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:156
CLM.L["Note to be added to award. Max 25 characters. It is recommended to not include date nor selected reason here. If you will input encounter ID it will be transformed into boss name."] = "Примечание будет добавлено в награду. Макс 25 символов. Рекомендуется не включать дату и не выбранную причину здесь. Если вы введете идентификатор боя, он будет преобразован в имя босса."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:154
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:278
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:120
CLM.L["Note"] = "Заметка"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:39
CLM.L["Noth the Plaguebringer"] = "Нот Чумной"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:288
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:455
CLM.L["Notify that you are passing on the item."] = "Уведомьте, что вы пасуете на предмет."
-- ClassicLootManager_Integrations/GUI.lua:150
CLM.L["November"] = "Ноябрь"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:657
CLM.L["Num"] = "Значение"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1000
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:438
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:273
-- ClassicLootManager_Integrations/Integrations.lua:147
-- ClassicLootManager_Integrations/Integrations.lua:152
CLM.L["OS"] = "ОС"
-- ClassicLootManager_Integrations/GUI.lua:149
CLM.L["October"] = "Октябрь"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:739
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:772
CLM.L["Off Hand"] = "Левая рука"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1056
CLM.L["Off-spec bidding not allowed"] = "Занятия не разрешены."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:803
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:94
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:242
CLM.L["On Time Bonus Value"] = "Значение бонуса за приход вовремя"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:91
CLM.L["On Time Bonus value"] = "Значение бонуса за приход вовремя"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:431
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:796
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:87
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:240
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:88
CLM.L["On Time Bonus"] = "Приход вовремя"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:737
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:770
CLM.L["One-Hand"] = "Одноручное"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:858
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:130
CLM.L["Online only"] = "В онлайне"
-- ClassicLootManager/Modules/GUI/Filters.lua:80
CLM.L["Online"] = "онлайн"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:177
CLM.L["Only when ML/RL"] = "Только когда ML/RL"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:4
CLM.L["Onyxia"] = "Ониксия"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:190
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:498
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:615
CLM.L["Onyxia's Lair"] = "Логово Ониксии"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:123
CLM.L["Open Key Bindings UI for AddOns"] = "Открыть привязку кнопок для аддонов"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:643
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:650
CLM.L["Open"] = "Открытый"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:67
CLM.L["Opera Hall"] = "Опера"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:63
CLM.L["Ossirian the Unscarred"] = "Оссириан Неуязвимый"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1173
CLM.L["Other"] = "Прочее"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:30
CLM.L["Ouro"] = "Оуро"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:76
CLM.L["Overrides"] = "Ручная коррекция"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:998
CLM.L["PASS"] = "ПАС"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:962
CLM.L["PR Rounding"] = "PR Округление"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:367
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:989
CLM.L["PR"] = "PR"
-- .:indirectly
CLM.L["Paladin"] = "Паладин"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:289
CLM.L["Participated"] = "Участвовавшие"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:333
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:353
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:439
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:287
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:454
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:796
CLM.L["Pass"] = "Пас"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1055
CLM.L["Passing after bidding not allowed"] = "Пас после ставки запрещен"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:35
CLM.L["Patchwerk"] = "Лоскутик"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:121
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:115
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:178
CLM.L["Player"] = "Игрок"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:362
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:375
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:392
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:406
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:420
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:439
CLM.L["Please select a raid"] = "Выберите рейд"
-- ClassicLootManager_Integrations/GUI.lua:25
CLM.L["Point History"] = "История ДКП"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:932
CLM.L["Point award multiplier for players on bench."] = "Множитель Award Award для игроков на скамейке."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:876
CLM.L["Point caps"] = "Лимит очков"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:706
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1229
CLM.L["Point type"] = "Тип очков"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:25
CLM.L["Point"] = "Очки"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:179
CLM.L["Points value that will be awarded."] = "Значение, которое будет вручена."
-- ClassicLootManager/Utils.lua:891
CLM.L["Poor"] = "Низкое"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:70
CLM.L["Post bids"] = "Публиковать ставки"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:72
CLM.L["Post channel"] = "Канал публикации"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:255
CLM.L["Price Tooltips"] = "Подсказки цен"
-- .:indirectly
CLM.L["Priest"] = "Жрец"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:73
CLM.L["Prince Malchezaar"] = "Принц Малчезар"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:28
CLM.L["Princess Huhuran"] = "Принцесса Хухуран"
-- ClassicLootManager_Integrations/Integrations.lua:142
-- ClassicLootManager_Integrations/Integrations.lua:152
CLM.L["Prioritized"] = "Приоритет"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:151
CLM.L["Professor Putricide"] = "Профессор Мерзоцид"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:257
CLM.L["Profile %s already exists and is used by different GUID %s (%s). "] = "Профиль %s уже существует и используется различными GUID %s ( %s)."
-- .:indirectly
CLM.L["Profiles"] = "Профили"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:434
CLM.L["Progression Bonus"] = "Бонус за прогресс"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:377
CLM.L["Provide number of raids needed for 100% attendance in a weekly reset. Between 1 - 50 raids. Defaults to 2. Requires /reload."] = "Количество рейдов, необходимых в неделю для получения 100% посещения. Значение от 1 до 50. По умолчанию 2. Требуется /reload"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:395
CLM.L["Provide number of weeks that will be accounted for attendance. Between 1 - 1000 weeks. Defaults to 10. Requires /reload."] = "Количество недель, по которым будет высчитываться посещаемость. Значение от 1 до 1000. По умолчанию 10. Требуется /reload"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:115
CLM.L["Prune profiles"] = "Удалить профили"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:924
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:149
CLM.L["Put players leaving raid on bench instead of removing them. To remove them completely they will need to be removed manually from the bench."] = "Добавить игроков, которые вышли из рейда на замену, вместо того, чтобы удалять их совсем. Для того, чтобы удалить совсем - необходимо вручную удалить из замены"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:152
CLM.L["Queen Lana'thel"] = "Королева Лана'Тель"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:749
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:782
CLM.L["Quiver"] = "Колчан"
-- ClassicLootManager_Integrations/Integrations.lua:232
-- ClassicLootManager_Integrations/Integrations.lua:238
CLM.L["RCLC Integration"] = "Интеграция с RCLC"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:624
CLM.L["ROLL"] = "РОЛЛ"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:97
CLM.L["Rage Winterchill"] = "Лютый Хлад"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:14
CLM.L["Ragnaros"] = "Рагнарос"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:247
CLM.L["Raid Completion Bonus Value"] = "Значение бонуса за пройденный рейд"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:97
CLM.L["Raid Completion Bonus value"] = "Значение бонуса за пройденный рейд"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:433
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:811
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:102
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:245
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:94
CLM.L["Raid Completion Bonus"] = "За пройденный рейд"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:818
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:109
CLM.L["Raid Completion Value"] = "Значение за пройденный рейд"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:185
CLM.L["Raid Name"] = "Имя рейда"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:200
CLM.L["Raid Start/End"] = "Старт/стоп рейда"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:196
CLM.L["Raid Warnings"] = "Оповещения рейда"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:425
CLM.L["Raid [%s] ended"] = "Рейд [%s] завершен"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:373
CLM.L["Raid [%s] started"] = "Рейд [%s] стартовал"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:311
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:333
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:405
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:448
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:473
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:507
CLM.L["Raid management is disabled during time traveling."] = "Управление рейдом выключено в режиме путешествия во времени."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:747
CLM.L["Raid"] = "Рейд"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:43
CLM.L["Raid: %s Roster: %s"] = "Рейд: %s Состав: %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:376
CLM.L["Raids needed in reset"] = "Рейдов за неделю"
-- ClassicLootManager_Integrations/GUI.lua:27
CLM.L["Raids"] = "Рейды"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:744
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:777
CLM.L["Ranged (wands)"] = "Жезлы"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:743
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:776
CLM.L["Ranged"] = "Дальний бой"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:77
CLM.L["Ranks"] = "Ранги"
-- ClassicLootManager/Utils.lua:894
CLM.L["Rare"] = "Редкое"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:15
CLM.L["Razorgore the Untamed"] = "Бритвосмерт Неукротимый"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:134
CLM.L["Razorscale"] = "Острокрылая"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:169
CLM.L["Reason"] = "Причина"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:358
CLM.L["Received"] = "Получено"
-- ClassicLootManager_Integrations/Integrations.lua:137
-- ClassicLootManager_Integrations/Integrations.lua:147
CLM.L["Regular"] = "Обычный"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:750
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:783
CLM.L["Relic"] = "Реликвия"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:93
CLM.L["Reliquary of Souls"] = "Реликварий Потерянных"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:267
CLM.L["Remove all items from auction list. Populates new one if there are any pending."] = "Удалить все вещи из списка аукциона. Добавит новые если они есть в очереди ожидания."
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:107
CLM.L["Remove all"] = "Удалить все"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:83
CLM.L["Remove auction"] = "Удалить аукцион"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:661
CLM.L["Remove from roster"] = "Удалить из состава"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:612
CLM.L["Remove from standby"] = "Удалить с замены"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:277
CLM.L["Remove item from auction list after it's awarded."] = "Удалить вещь из списка аукциона после ее вручения."
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:96
CLM.L["Remove old"] = "Удалить старое"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:276
CLM.L["Remove on award"] = "Удалить при вручении"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:580
CLM.L["Remove override"] = "Убрать переопределение"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:760
CLM.L["Remove roster"] = "Удалить состав"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:433
CLM.L["Remove selected raid"] = "Удалить выбранный рейд"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:288
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:436
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:757
CLM.L["Remove selected"] = "Удалить выбранное"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:766
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:399
CLM.L["Remove"] = "Удалить"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:767
CLM.L["Removes current roster."] = "Удалить текущий состав."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:225
CLM.L["Removing %s from current queue."] = "Удаление %s из текущей очереди."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:222
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:543
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:601
CLM.L["Removing items not allowed during auction."] = "Удаление вещей запрещено во время аукциона."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:356
CLM.L["Request standby"] = "Запрос замены"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:102
CLM.L["Rescales CLM UI, except Bidding window. You can rescale Bidding window independently by using Ctrl + Mouse Wheel. Some windows may require closing and reopening."] = "Rescales CLM UI, кроме окна торгов. Вы можете самостоятельно изменить окно торгов независимо, используя колесо CTRL + мыши. Некоторые окна могут потребовать закрытия и повторного открытия."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:185
CLM.L["Reset gui positions"] = "Сброс позиционирования интерфейса"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:369
CLM.L["Revoke standby"] = "Отзыв замены"
-- .:indirectly
CLM.L["Rogue"] = "Разбойник"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:176
CLM.L["Role"] = "Роль"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:651
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:423
CLM.L["Roll"] = "Ролл"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1221
CLM.L["Roster Name"] = "Поле ввода названия состава"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1220
CLM.L["Roster name"] = "Название состава"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:109
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:120
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:746
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:308
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:104
-- ClassicLootManager_Integrations/ImportCSV.lua:91
CLM.L["Roster"] = "Состав"
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:137
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:142
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:147
CLM.L["Rosters"] = "Составы"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:153
CLM.L["Rotface"] = "Гниломорд"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:963
CLM.L["Round PR to selected number of decimals"] = "Округлить PR до выбранного количества символов"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:720
CLM.L["Round to selected number of decimals"] = "Округлить до выбранного количества символов"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:118
CLM.L["Round to"] = "Округлить до"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:719
CLM.L["Rounding"] = "Округление"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:279
CLM.L["Ruins of Ahn'Qiraj"] = "Руины Ан'Кираж"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:625
CLM.L["SK"] = "SK"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:867
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:133
CLM.L["Same zone only"] = "В той же локации"
-- ClassicLootManager/MinimapIcon.lua:56
CLM.L["Sandbox mode"] = "Режим песочницы"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:45
CLM.L["Sapphiron"] = "Сапфирон"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:116
CLM.L["Sartharion"] = "Сартарион"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:158
CLM.L["Saviana Ragefire"] = "Савиана Огненная Пропасть"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:644
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:651
CLM.L["Sealed"] = "Закрытый"
-- ClassicLootManager/Modules/GUI/Filters.lua:212
CLM.L["Search for player names. Separate multiple with a comma ','. Minimum 3 characters. Overrides filtering."] = "Поиск имен игроков. Разделите нескольких игроков запятой "
-- ClassicLootManager/Modules/GUI/Filters.lua:211
CLM.L["Search"] = "Поиск"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1230
CLM.L["Select DKP or EPGP point system."] = "Выберите DKP или EPGP систему."
-- ClassicLootManager_Integrations/GUI.lua:380
CLM.L["Select Profiles to export"] = "Выбор профилей для экспорта"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:412
CLM.L["Select Rosters to display"] = "Выбрать составы для отображения"
-- ClassicLootManager_Integrations/GUI.lua:349
CLM.L["Select Rosters to export"] = "Выбор составов для экспорта"
-- ClassicLootManager/Modules/GUI/Filters.lua:183
CLM.L["Select all classes."] = "Выбрать все классы."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:492
CLM.L["Select equation"] = "Выберите уравнение"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:25
CLM.L["Select logging level for troubleshooting"] = "Выберите уровень логирования для поиска проблем"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:187
CLM.L["Select loot rarity for the annoucement to raid."] = "Выбрать редкость добычи для оповещений."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:344
CLM.L["Select loot rarity threshold to used to fill the auction list."] = "Выбрать редкость предметов для добавления в список аукциона."
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:236
CLM.L["Select modifier combination for awarding."] = "Выберите комбинацию модификатора для награждения."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:353
CLM.L["Select modifier combination for filling auction from bags and corpse."] = "Выбрать комбинации для заполнения списка аукциона из сумок и трупа."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:135
CLM.L["Select roster to add profiles to."] = "Выберите состав для добавления профилей."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:165
CLM.L["Select roster to create raid for."] = "Выберите состав для создания рейда."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:164
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:134
CLM.L["Select roster"] = "Выберите состав"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:883
CLM.L["Select weekly reset timezone. EU: Wed 07:00 GMT or US: Tue 15:00 GMT"] = "Выберете часовой пояс недельного сброса. EU: Среда 07:00 GMT или US: Вторник 15:00 GMT"
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:70
CLM.L["Select |cffeeee00%s|r encounter difficulty for bonus value award (%s)."] = "Выберите | Cffeeee00%s | R СЛУЧАЕТ СЛОЖЕНИЕ ПРЕДОСТАВЛЕНИЯ ДЛЯ БОНУСКОЙ ЗНАЧЕНИЯ (%s)."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:745
CLM.L["Selected"] = "Выбранный"
-- ClassicLootManager_Integrations/GUI.lua:148
CLM.L["September"] = "Сентябрь"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:326
CLM.L["Serpentshrine Cavern"] = "Змеиное святилище"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:472
CLM.L["Set %s points to %s players for %s in <%s>"] = "Начислить %s точки для %s игроков за %s в <%s>"
-- ClassicLootManager_Integrations/Migration.lua:378
CLM.L["Set points for %s players for team to %s"] = "Начислить точки для %s игроков в команде с %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:186
CLM.L["Set raid name"] = "Установить имя рейда"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:90
CLM.L["Shade of Akama"] = "Тень Акамы"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:70
CLM.L["Shade of Aran"] = "Тень Арана"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:117
CLM.L["Shadron"] = "Шадрон"
-- .:indirectly
CLM.L["Shaman"] = "Шаман"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:10
CLM.L["Shazzrah"] = "Шаззрах"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:742
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:775
CLM.L["Shield"] = "Щит"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:457
CLM.L["Shift + Alt"] = "Shift + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:460
CLM.L["Shift + Ctrl + Alt"] = "Shift + Ctrl + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:459
CLM.L["Shift + Ctrl"] = "Shift + Ctrl"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:454
CLM.L["Shift"] = "Сдвиг"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:725
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:758
CLM.L["Shirt"] = "Рубашка"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:724
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:757
CLM.L["Shoulder"] = "Плечи"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:219
CLM.L["Show Award window"] = "Показать окно награды"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:24
CLM.L["Silithid Royalty"] = "Трио Жуков"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:154
CLM.L["Sindragosa"] = "Синдрагоса"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:672
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:678
CLM.L["Single-Priced"] = "Фиксированная"
-- ClassicLootManager_Integrations/Migration.lua:179
CLM.L["Skipping %s"] = "Пропускаю %s"
-- ClassicLootManager_Integrations/Migration.lua:255
CLM.L["Skipping CommunityDKP"] = "Пропускаю CommunityDKP"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:498
CLM.L["Slot multipliers"] = "Мультипликаторы для слота"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:357
CLM.L["Small value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Маленькое значение для тир-аукциона. \n\nУстановите на то же значение, что и другой уровень или отрицательное значение, чтобы игнорировать."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:829
CLM.L["Small"] = "Маленькая"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:147
CLM.L["Spec guild request"] = "Запрос специализаций гильдии"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:357
CLM.L["Spent"] = "Потрачено"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:796
CLM.L["Stale"] = "Устаревший"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:138
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:148
CLM.L["Standby %s has been sent"] = "Замена %s была отправлена"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:435
CLM.L["Standby Bonus"] = "Бонус за замену"
-- ClassicLootManager/Modules/GUI/Filters.lua:81
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:300
CLM.L["Standby"] = "Замена"
-- ClassicLootManager_Integrations/GUI.lua:24
CLM.L["Standings"] = "Составы"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:386
CLM.L["Start selected raid"] = "Начать выбранный рейд"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:513
CLM.L["Start"] = "Начать"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:511
CLM.L["Started raid %s"] = "Начат рейд %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:419
CLM.L["Statistics"] = "Статистика"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:262
CLM.L["Status"] = "Статус"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:513
CLM.L["Stop"] = "Стоп"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:64
CLM.L["Store bids"] = "Хранить ставки"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:65
CLM.L["Store finished auction bids information."] = "Хранить информацию по ставкам в завершенных торгах."
-- ClassicLootManager_Integrations/ImportCSV.lua:118
CLM.L["Success"] = "Успех"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:11
CLM.L["Sulfuron Harbinger"] = "Предвестник Сульфурон"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:386
CLM.L["Sunwell Plateau"] = "Плато Солнечного Колодца"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:394
CLM.L["Suppress incoming whispers"] = "Скрытие входящих приватов"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:403
CLM.L["Suppress outgoing whispers"] = "Скрытие исходящих приватов"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:81
CLM.L["Suppresses changelog display until new version is released"] = "Отключает отображение лога изменений до выхода новой версии"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:89
CLM.L["Supremus"] = "Супремус"
-- ClassicLootManager/MinimapIcon.lua:50
CLM.L["Sync ongoing"] = "Идет синхронизация"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:621
CLM.L["TBC"] = "БК"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:729
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:762
CLM.L["Tabard"] = "Гербовая накидка"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:155
CLM.L["Tank"] = "Танк"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1188
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:139
CLM.L["Tax"] = "Налог"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:338
CLM.L["Tempest Keep"] = "Крепость Бурь"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:227
CLM.L["Temple of Ahn'Qiraj"] = "Ан'Кираж"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:118
CLM.L["Tenebron"] = "Тенеброн"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:69
CLM.L["Terestian Illhoof"] = "Терестиан Больное Копыто"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:91
CLM.L["Teron Gorefiend"] = "Терон Кровожад"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:38
CLM.L["Thaddius"] = "Таддиус"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:135
CLM.L["The Assembly of Iron"] = "Железное Собрание"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:68
CLM.L["The Curator"] = "Смотритель"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:432
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:549
CLM.L["The Eye of Eternity"] = "Око Вечности"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:44
CLM.L["The Four Horsemen"] = "Четыре Всадника"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:95
CLM.L["The Illidari Council"] = "Совет иллидари"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:155
CLM.L["The Lich King"] = "Король-лич"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:79
CLM.L["The Lurker Below"] = "Скрытень из глубин"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:422
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:539
CLM.L["The Obsidian Sanctum"] = "Обсидиановое святилище"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:23
CLM.L["The Prophet Skeram"] = "Пророк Скерам"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:505
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:622
CLM.L["The Ruby Sanctum"] = "Рубиновое святилище"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:136
CLM.L["Thorim"] = "Торим"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:748
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:781
CLM.L["Thrown"] = "Метательное"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:519
CLM.L["Tier multipliers"] = "Мультипликаторы для тира"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:674
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:679
CLM.L["Tiered"] = "Многоуровневый"
-- ClassicLootManager/MinimapIcon.lua:60
CLM.L["Time Traveling"] = "Путешествую во времени"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1041
CLM.L["Time in seconds by which auction will be extended if bid is received during last 10 seconds."] = "Время в секундах на которое будет продлен аукцион, если ставка будет сделана в последние 10 секунд."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1025
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:658
CLM.L["Time"] = "Время"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:736
CLM.L["Timetravel"] = "Путешествие"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:305
CLM.L["Toggle Auction History window display"] = "Включить отображение окна истории торгов"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:690
CLM.L["Toggle Auctioning window display"] = "Включить отображения окна ставок"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:79
CLM.L["Toggle Bidding auto-open"] = "Включить авто-открытие ставок"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:163
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1048
CLM.L["Toggle Bidding window display"] = "Включить отображение окна ставок"
-- ClassicLootManager_Integrations/ImportCSV.lua:216
CLM.L["Toggle CSV import window display"] = "Переключить дисплей импорта CSV"
-- ClassicLootManager/MinimapIcon.lua:77
CLM.L["Toggle Minimap Icon"] = "Переключить иконку минимума"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:115
CLM.L["Toggle advancing to next item on the list after bid."] = "Переверните, продвигаясь к следующему элементу в списке после ставки."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:80
CLM.L["Toggle auto open and auto close on auction start and stop"] = "Включить авто-открытие и закрытие окна при начале и окончании аукциона"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:48
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:160
CLM.L["Toggle changelog window display"] = "Включить отображение окна лога изменений"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:47
CLM.L["Toggle changelog"] = "Включить лог изменений"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:107
CLM.L["Toggle closing bidding UI after submitting bid for all items."] = "Активировать закрытие окна ставок после проставления ставок на все вещи."
-- ClassicLootManager_Integrations/GUI.lua:518
CLM.L["Toggle export window display"] = "Включить отображение окна экспорта"
-- ClassicLootManager/Modules/GUI/UnifiedGUI.lua:426
CLM.L["Toggle standings window display"] = "Включить отображение окна составов"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:146
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:206
CLM.L["Toggle test bar"] = "Перевернуть тестовый планшета"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:147
CLM.L["Toggles addon sounds."] = "Включить звуки аддона."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:169
CLM.L["Toggles loot announcement to raid"] = "Включить оповещение о добыче в рейд"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:276
CLM.L["Toggles loot award announcement to guild"] = "Включить оповещение о добыче в гильдию"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:357
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:370
CLM.L["Too much data to display"] = "Слишком много данных для отображения "
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:124
CLM.L["Toravon the Ice Watcher"] = "Торавон Страж Льда"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:422
CLM.L["Total blocked"] = "Всего заблокировано"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:423
CLM.L["Total decayed"] = "Всего сгорело"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:421
CLM.L["Total received"] = "Всего получено"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:420
CLM.L["Total spent"] = "Всего потрачено"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:469
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:586
CLM.L["Trial of the Crusader"] = "Испытание крестоносца"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:736
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:769
CLM.L["Trinket"] = "Аксессуар"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:40
CLM.L["True"] = "Верно"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:29
CLM.L["Twin Emperors"] = "Императоры-близнецы"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:247
CLM.L["Two different profiles exist for target GUID %s (%s:%s) and name %s (%s:%s). Verify and clean up profiles before updating."] = "Существуют два разных профиля для целевого GUID %s (%s:%s) и имя%s (%s:%s). Проверьте и очистите профили перед обновлением."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:741
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:774
CLM.L["Two-Hand"] = "Двуручное"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:659
CLM.L["Type"] = "Тип"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:101
CLM.L["UI Scale"] = "Масштаб пользовательского интерфейса"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:449
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:566
CLM.L["Ulduar"] = "Ульдуар"
-- ClassicLootManager_Integrations/Migration.lua:48
CLM.L["Unable to execute migration. Entries already exist."] = "Невозможно выполнить миграцию. Записи уже существуют."
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:163
CLM.L["Unable to get item info from server. Please try auctioning again"] = "Не могу получить информацию о вещи от сервера. Попробуйте начать аукцион заново"
-- ClassicLootManager/Utils.lua:893
CLM.L["Uncommon"] = "Необычное"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:436
CLM.L["Unexcused absence"] = "Отсутствие"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:48
CLM.L["Unknown roster %s"] = "Неизвестный состав %s"
-- ClassicLootManager/MinimapIcon.lua:52
CLM.L["Unknown sync state"] = "Статус синхронизации неизвестен"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:286
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:342
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:215
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:285
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:175
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:34
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:355
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:447
CLM.L["Unknown"] = "Неизвестно"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:304
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:91
CLM.L["Unlink Alt"] = "Отвязать альта"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:275
CLM.L["Unlock selected"] = "Разблокировать выбранное"
-- ClassicLootManager_Integrations/Migration.lua:144
CLM.L["UpdatePoints(): Empty targets list"] = "ОбновитьОчки(): Пустой список целей"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:518
CLM.L["Updated raid <%s> %s joined, %s left, %s benched, %s removed"] = "Обновлен рейд <%s> %s игроков добавлено, %s игроков удалено, %s игроков на замене, %s игроков удалены с замены"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1079
CLM.L["Use named buttons"] = "Использовать именные кнопки"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:16
CLM.L["Vaelastrasz the Corrupt"] = "Валестраз Порочный"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:143
CLM.L["Val'kyr Twins"] = "Валь'киры Близнецы"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:147
CLM.L["Valithria Dreamwalker"] = "Валитрия Сновидица"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:168
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:309
CLM.L["Value"] = "Значение"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:439
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:556
CLM.L["Vault of Archavon"] = "Склеп Аркавона"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:33
CLM.L["Verbose"] = "Подробный"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:137
CLM.L["Version check in guild"] = "Проверка версии в гильдии"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:177
CLM.L["Version"] = "Версия"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:119
CLM.L["Vesperon"] = "Весперон"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:645
CLM.L["Vickrey"] = "Аукцион Викри"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:27
CLM.L["Viscidus"] = "Нечистотон"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:85
CLM.L["Void Reaver"] = "Страж Бездны"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:732
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:765
CLM.L["Waist"] = "Пояс"
-- .:indirectly
CLM.L["Warlock"] = "Чернокнижник"
-- .:indirectly
CLM.L["Warrior"] = "Воин"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:891
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:112
CLM.L["Weekly cap"] = "Недельный лимит"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:413
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:416
CLM.L["Weekly gains"] = "За неделю"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:882
CLM.L["Weekly reset timezone"] = "Зона еженедельного сброса"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:115
CLM.L["Weekly reset"] = "Недельный сброс"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:178
CLM.L["When enabled, this will make loot announcement display only if you're Master Looter or Raid Leader (if there is no Master Looter)."] = "Когда включено, оповещения о добыче будут отображаться только если вы РЛ или МЛ (если нет МЛа)."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1080
CLM.L["Will display names of the buttons instead of values in bidding UI"] = "Будет отображать имена кнопок вместо значений в пользовательском интерфейсе"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:155
CLM.L["Wipe events"] = "Стереть события"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:41
CLM.L["Wipe"] = "Стереть"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:156
CLM.L["Wipes all events from memory. This will trigger resyncing from other users."] = "Стереть все события. Это вызовет пересинхронизацию от других игроков."
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:42
CLM.L["Wipes the log history"] = "Стирает историю логов"
-- ClassicLootManager_Integrations/Integrations.lua:361
CLM.L["WoW DKP Bot Integration"] = "Интеграция с WoW DKP Bot"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:626
CLM.L["WotLK - 10"] = "Wotlk - 10"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:631
CLM.L["WotLK - 25"] = "Wotlk - 25"
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:191
CLM.L["Wowpedia"] = "Wowpedia"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:730
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:763
CLM.L["Wrist"] = "Запястья"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:137
CLM.L["XT-002 Deconstructor"] = "Разрушитель XT-002"
-- ClassicLootManager/Utils.lua:513
CLM.L["Yes"] = "Да"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:138
CLM.L["Yogg-Saron"] = "Йогг-Сарон"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:307
CLM.L["You are already in an active raid. Leave or finish it before creating new one."] = "Вы уже в активном рейде. Выйдите или завершите его перед созданием нового."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:626
CLM.L["You are not allowed to auction items"] = "Вам запрещено проводить аукционы"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:465
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:499
CLM.L["You are not allowed to control raid."] = "Вы не можете управлять рейдом"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:303
CLM.L["You are not allowed to create raids."] = "Вам запрещено создавать рейды."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:436
CLM.L["You are not allowed to join raid."] = "Вам запрещено присоединяться к рейдам."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:325
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:397
CLM.L["You are not allowed to start raid."] = "Вам запрещено начинать рейды."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:338
CLM.L["You are not in the raid."] = "Вы не в рейде."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:632
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:641
CLM.L["You can %s max %d players from standby at the same time to a %s raid."] = "Вы можете %s макс %d игроков с замены за раз из %s рейда."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:587
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:596
CLM.L["You can %s max %d players to standby at the same time to a %s raid."] = "Вы можете %s макс %d игроков на замену за раз в %s рейд."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:469
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:503
CLM.L["You can only add players to standby of a progressing raid."] = "Вы можете добавлять замены только в начавшемся рейде"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:578
CLM.L["You can only bench players from same roster as the raid (%s)."] = "Вы можете добавить на замену только игроков из того же состава, что и рейд (%s)."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:401
CLM.L["You can only end an active raid."] = "Вы можете завершать только активный рейд."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:440
CLM.L["You can only join an active raid."] = "Вы можете присоединиться только к активному рейду."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:444
CLM.L["You can only join different raid than your current one."] = "Вы можете присоединиться только к отличному от вашего рейду."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:623
CLM.L["You can only remove from bench players from same roster as the raid (%s)."] = "Вы можете удалить с замены только игроков того же состава, что и рейд (%s)."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:329
CLM.L["You can only start a freshly created raid."] = "Вы можете запустить только свежесозданный рейд."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:675
CLM.L["You can remove max %d players from roster at the same time."] = "Вы можете удалить макс %d игроков из состава за раз."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:356
CLM.L["Your bid (%s) was denied: |cffcc0000%s|r"] = "Ваша ставка (%s) была отклонена: |cffcc0000%s|r"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:335
CLM.L["Your bid (%s) was |cff00cc00accepted|r"] = "Ваша ставка (%s) была |cff00cc00accepted|r"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:67
CLM.L["Zero-Sum Bank Inflation"] = "Инфляция при нулевой сумме"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1148
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:64
CLM.L["Zero-Sum Bank"] = "Банк с нулевой суммой"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1156
CLM.L["Zero-Sum Inflation Value"] = "Значение инфляции при нулевой сумме"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:439
CLM.L["Zero-Sum award"] = "Награда за ноль"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1142
CLM.L["Zero-Sum"] = "Нулевая сумма"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:374
CLM.L["Zul'Aman"] = "Зул'Аман"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:263
CLM.L["Zul'Gurub"] = "Зул'Гуруб"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:107
CLM.L["Zul'jin"] = "Зул'Джин"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:221
CLM.L["[All Roster Configs]: "] = "[Настройки для всех]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:227
CLM.L["[All Roster Default Slot Values]: "] = "[Значения по умолчанию для всех]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:205
CLM.L["[Alt-Main Link]: "] = "[Связь альт-мейн]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:212
CLM.L["[Create Roster]: "] = "[Создать состав]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:215
CLM.L["[Delete Roster]: "] = "[Удалить состав]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:290
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:532
CLM.L["[IGNORE]: Ignoring entry"] = "[ИГНОР]: Игнорирую запись"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:274
CLM.L["[Item Award in Raid]: "] = "[Вручение вещи в рейде]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:271
CLM.L["[Item Award]: "] = "[Вещь]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:261
CLM.L["[Point Award to raid]: "] = "[ДКП рейду]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:258
CLM.L["[Point Award to roster]: "] = "[ДКП составу]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:252
CLM.L["[Point Award]: "] = "[Значение ДКП]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:264
CLM.L["[Point Decay for roster]: "] = "[Сгорание составу]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:255
CLM.L["[Point Decay]: "] = "[Значение сгорания]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:267
CLM.L["[Point Set]: "] = "[Установка значения]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:208
CLM.L["[Profile Lock]: "] = "[Блокировка профиля]:"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:278
CLM.L["[Raid Create]: "] = "[Создать рейд]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:287
CLM.L["[Raid Finish]: "] = "[Завершить рейд]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:281
CLM.L["[Raid Start]: "] = "[Начать рейд]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:284
CLM.L["[Raid Update]: "] = "[Обновить рейд]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:202
CLM.L["[Remove Profile]: "] = "[Удалить профиль]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:218
CLM.L["[Rename Roster]: "] = "[Переименовать состав]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:245
CLM.L["[Roster Boss Kill Bonus]: "] = "[Бонус составу за убийство босса]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:224
CLM.L["[Roster Config]: "] = "[Настройка состава]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:242
CLM.L["[Roster Copy]: "] = "[Копировать состав]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:230
CLM.L["[Roster Default Slot Value]: "] = "[Значения по умолчанию состава]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:248
CLM.L["[Roster Field Rename]: "] = "[Переименование поля списка]:"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:236
CLM.L["[Roster Item Value Override Single]: "] = "[Значение элемента списка переопределение одиночного]:"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:233
CLM.L["[Roster Item Value Override]: "] = "[Стоимость вещи для состава]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:239
CLM.L["[Roster Update Profiles]: "] = "[Обновить профили состава]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:199
CLM.L["[Update Profile]: "] = "[Обновить профиль]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:408
CLM.L["[config] "] = "[настройка] "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:410
CLM.L["[item values] "] = "[Значение] "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:411
CLM.L["[profiles] "] = "[профили] "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:409
CLM.L["[slot defaults] "] = "[значения по умолчанию] "
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:59
CLM.L["accepted"] = "принята"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:588
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:597
CLM.L["add"] = "добавить"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:46
CLM.L["cancel"] = "отмена"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:597
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:642
CLM.L["created"] = "создан"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:59
CLM.L["denied"] = "отказ"
-- ClassicLootManager_Integrations/Integrations.lua:343
CLM.L["else"] = "иначе"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:465
CLM.L["excluding negatives "] = "исключая отрицательные "
-- ClassicLootManager_Integrations/Integrations.lua:278
CLM.L["if reason/response contains"] = "Если причина/ответ содержит"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:120
CLM.L["level"] = "уровень"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:48
CLM.L["pass"] = "пас"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:588
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:633
CLM.L["progressing"] = "начатый"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:123
CLM.L["rank"] = "ранг"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:633
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:642
CLM.L["remove"] = "убрать"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:139
CLM.L["request"] = "запрос"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:42
CLM.L["requested"] = "запрошено"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:149
CLM.L["revoke"] = "отозвать"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:72
CLM.L["revoked"] = "отозван"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:98
CLM.L["roster"] = "состав"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:98
CLM.L["rosters"] = "составы"
-- ClassicLootManager_Integrations/Integrations.lua:288
CLM.L["then"] = "то"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:127
CLM.L["unguilded"] = "без гильдии"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1127
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1199
CLM.L["|cff00ee44Open:|r English Auction with highest bidder announcement. Highest bidder wins. Two players can not bid same value. Additionally always allows bidding base to accomodate for Swedish Auction flavor.\n\n|cff00ee44Anonymous Open:|r Same as Open but highest bidder name is not disclosed.\n\n|cff00ee44Sealed:|r Bids are not announced. Highest bidder wins.\n\n|cff00ee44Vickrey:|r Same as sealed but winner pays with second-highest bid."] = "|cff00ee44Открытый: |r Английский аукцион с объявлением наибольшей ставки и участника. Наибольшая цена выигрывает. Два игрока не могут сделать одинаковую ставку. Кроме того, всегда позволяет ставить базовую стоимость предмета. \n\n|cff00ee44Закрытый: |r То же самое, что открытый, но имя участника с наибольшей ставкой не оглашется. Наибольшая ставка выигрывает. \n\n|cff00ee444Викри:|r то же самое, что закрытый, но победитель платит вторую по величине ставку."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:980
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1135
CLM.L["|cff00ee44Single-Priced:|r Static value mode. Only bidding Base value is supported.\n\n|cff00ee44Ascending:|r Ranged value mode. Allows bidding any value in |cff44ee00<base, max>|r.\n\n|cff00ee44Tiered:|r Ranged value mode. Allows bidding only specific values. Up to 5 tiers are configurable in |cff44ee00<base, small, medium, large, max>|r."] = "|cff00ee44Статичная цена:|r Режим статичной цены. Только ставка фиксированного значения разрешена.\n\n|cff00ee44На повышение:|r Разрешен диапазон ставок. Разрешается поставить любое значение в диапазоне |cff44ee00<base, max>|r.\n\n|cff00ee44Тир-аукцион:|r Разрешен диапазон ставок. Разрешается ставить только конкретные значения. До 5 тиров можно настроить в диапазоне |cff44ee00<base, small, medium, large, max>|r."
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:54
CLM.L["|cffcc0000Your Classic Loot Manager is significantly out of date.|r AddOn communication has been disabled. Version %s is available. Please update as soon as possible."] = "|cffcc0000Ваш Classic Loot Manager сильно устарел.|r Коммуникации аддона отключены. Версия %s уже доступна. Пожалуйста, обновитесь как можно скорее."
end