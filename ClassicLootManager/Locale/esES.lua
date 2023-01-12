local _, CLM = ...
if GetLocale() == "esES" then
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:326
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:332
CLM.L[" alt of: "] = " ater de "
-- ClassicLootManager/Utils.lua:493
CLM.L[" more"] = " más "
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:178
CLM.L[" over "] = " sobre "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:399
CLM.L[" profile(s)"] = " perfil(es)"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:34
CLM.L["!bid"] = "!bid"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:35
CLM.L["!bidos"] = "!bidos"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:63
CLM.L["!dkp"] = "!dkp"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:269
CLM.L["% that will be decayed."] = "% que será descompuesto."
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
CLM.L["%s %% %s decay"] = "%s %% %s decadencia"
-- ClassicLootManager_Alerts/Alerts.lua:12
CLM.L["%s %s"] = "%s %s"
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:142
CLM.L["%s awarded to %s for %s %s"] = "%s otorgado a %s por %s %s"
-- ClassicLootManager/MinimapIcon.lua:37
CLM.L["%s events (%s pending)"] = "%s eventos (%s pendientes)"
-- ClassicLootManager/MinimapIcon.lua:39
CLM.L["%s events (0x%x)"] = "%s eventos (0x%x)"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:40
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:70
CLM.L["%s has %s standby"] = "%s tiene %s en espera"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:107
CLM.L["%s profile exists."] = "%s perfil existente."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:109
CLM.L["%s profile missing. Adding."] = "%s falta el perfil. Agregando."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:483
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:493
CLM.L["%s to %s for %s in <%s>"] = "%s a %s para %s en <%s>"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:115
CLM.L["%s was not found in guild."] = "%s no se encontró en la Hermandad."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:92
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:92
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:93
CLM.L["-- All --"] = "-- Todos --"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:166
CLM.L["10 Player (Heroic)"] = "10 jugador (heroico)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:164
CLM.L["10 Player"] = "10 jugador"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:169
CLM.L["20 Player"] = "20 jugador"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:167
CLM.L["25 Player (Heroic)"] = "25 jugador (heroico)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:165
CLM.L["25 Player"] = "25 jugador"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:168
CLM.L["40 Player"] = "40 jugador"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:96
CLM.L["<CLM> %s not present in any roster."] = "<CLM> %s no está presente en ningun roster."
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:98
CLM.L["<CLM> %s standings in %d %s:"] = "<CLM> %s posiciones en %d %s:"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:107
CLM.L["<CLM> %s: %d DKP (%d this week)."] = "<CLM> %s: %d DKP (%d esta semana)."
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:77
CLM.L["<CLM> Missing profile for player %s."] = "<CLM> Falta el perfil del jugador %s."
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:57
CLM.L["<CLM> Your bid (%s) was %s%s."] = "<CLM> Tu oferta (%s) es %s%s."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:145
CLM.L["Action context"] = "Contexto de acción"
-- ClassicLootManager_Integrations/Integrations.lua:161
CLM.L["Action to take upon Gargul loot award event happening during raid."] = "Acción para llevar al evento de premio Gargul Loot que ocurre durante la redada."
-- ClassicLootManager_Integrations/Integrations.lua:266
CLM.L["Action to take upon RCLC loot award event happening during raid. Trigger is based on RCLC award reason or player response if reason is not used. On Integration Enable the buttons will be prefilled with existing ones."] = "Acción para enfrentar el evento del premio RCLC Loot que ocurre durante la redada. Trigger se basa en la razón del premio RCLC o la respuesta del jugador si no se usa la razón. En la integración habilitar los botones se precedirán con los existentes."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:124
CLM.L["Add currently selected target to list."] = "Agregar objetivo seleccionado actualmente a la lista."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:123
CLM.L["Add target"] = "Agregar objetivo"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:144
CLM.L["Add to roster"] = "Agregar al Roster"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:567
CLM.L["Add to standby"] = "Añadir en espera"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:399
CLM.L["Add"] = "Añadir"
-- ClassicLootManager_Integrations/Migration.lua:368
CLM.L["Adding %s loot entries for team to %s"] = "Agregando %s entradas de botín para el equipo a %s"
-- ClassicLootManager_Integrations/Migration.lua:227
-- ClassicLootManager_Integrations/Migration.lua:346
CLM.L["Adding %s profiles to %s"] = "Agregando %s perfiles a %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:944
CLM.L["Adding missing %s players to current roster"] = "Agregar %s jugadores faltantes al roster actual"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1169
CLM.L["Additional cost (tax) to add to the award value."] = "Coste adicional (tasa) para agregar al valor del premio."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1137
CLM.L["Additional points to be given to players atop of the split value."] = "Se otorgarán puntos adicionales a los jugadores además del valor compartido."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:146
CLM.L["Addon sounds"] = "Sonidos de complemento"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:145
CLM.L["Adds selected players to the selected roster (from dropdown)."] = "Agrega jugadores seleccionados a la lista seleccionada (desde el menú desplegable)."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:266
CLM.L["Affected players:"] = "Jugadores afectados: "
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:102
CLM.L["Akil'zon"] = "Akil'zon"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:84
CLM.L["Al'ar"] = "Al'ar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:125
CLM.L["Algalon the Observer"] = "Algalon el observador"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:268
CLM.L["All In"] = "Todo incluido"
-- ClassicLootManager_Integrations/Migration.lua:29
CLM.L["All migration entries were commited and executed. Congratulations!"] = "Todas las entradas de migración se confirmaron y ejecutaron. ¡Felicidades!"
-- ClassicLootManager/Modules/GUI/Filters.lua:182
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:23
CLM.L["All"] = "Todo"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:79
CLM.L["Allow bidding below minimum points"] = "Permitir ofertas por debajo de los puntos mínimos"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1146
--CLM.L["Allow biding more than current standings and ending up with less than minimum standings."] = ""
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1145
CLM.L["Allow biding more than current standings"] = "Permitir que se reduzca más que la clasificación actual"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1004
--CLM.L["Allow equal bids"] = ""
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:76
CLM.L["Allow going below minimum points"] = "Permitir ir por debajo de los puntos mínimos"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:896
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:157
CLM.L["Allow players to subscribe to the bench through Raids menu"] = "Permitir que los jugadores se suscriban al banquillo a través del menú Raids"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:895
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:156
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:136
CLM.L["Allow subscription"] = "Permitir suscripción"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:456
CLM.L["Alt"] = "Alternativa Alternativo"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:996
--CLM.L["Always allow All-In bids"] = ""
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:988
--CLM.L["Always allow Base bids"] = ""
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1012
--CLM.L["Always allow cancel/pass"] = ""
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:788
CLM.L["Americas"] = "Américas"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:737
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:770
CLM.L["Ammo"] = "Munición"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:98
CLM.L["Anetheron"] = "Anetheron"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:321
CLM.L["Announce award to Guild"] = "Anunciar el premio a la Hermandad"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:168
CLM.L["Announce loot from corpse to Raid"] = "Anunciar el botín a la raid"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:164
CLM.L["Announce loot"] = "Anunciar el botín"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:186
CLM.L["Announcement loot rarity"] = "Anuncio de rareza de botín"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:636
CLM.L["Anonymous Open"] = "Anónimo abierto"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1044
CLM.L["Anti-snipe time"] = "Tiempo anti-snipe"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:695
CLM.L["Anti-snipe time: %s."] = "Tiempo anti-snipe: %s."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:237
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:73
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:490
CLM.L["Anti-snipe"] = "Anti-snipe"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:32
CLM.L["Anub'Rekhan"] = "Anub'Rekhan"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:139
CLM.L["Anub'arak"] = "Anub'arak"
-- ClassicLootManager/Tooltips.lua:37
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:69
CLM.L["Any"] = "Todo"
-- ClassicLootManager_Integrations/GUI.lua:143
CLM.L["April"] = "Abril"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:121
CLM.L["Archavon the Stone Watcher"] = "Archavon the Stone Watcher"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:101
CLM.L["Archimonde"] = "Archimonde"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:164
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:320
CLM.L["Are you sure, you want to award %s to %s for %s %s?"] = "¿Está seguro de que desea otorgar %s a %s por %s %s?"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:663
CLM.L["Ascending"] = "Ascendente"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:226
CLM.L["Assistant"] = "Asistente"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:359
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:370
CLM.L["Att. [%]"] = "Att. [%]"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:372
CLM.L["Attendance"] = "Asistencia"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:64
CLM.L["Attumen the Huntsman"] = "Attumen el Montero"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:225
CLM.L["Auction End Countdown"] = "Cuenta regresiva para el final de la subasta"
-- ClassicLootManager/MinimapIcon.lua:109
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:219
CLM.L["Auction History"] = "Historial de subastas"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:209
CLM.L["Auction Start/End"] = "Subasta Inicio/Terminación"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:236
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:70
CLM.L["Auction Time"] = "Tiempo de subasta"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:58
CLM.L["Auction Type"] = "Tipo de subasta"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:608
CLM.L["Auction complete"] = "Subasta completa"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:286
CLM.L["Auction finished"] = "Subasta finalizada"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1036
CLM.L["Auction length in seconds."] = "Duración de la subasta en segundos."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1035
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:480
CLM.L["Auction length"] = "Duración de la subasta."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:268
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:687
--CLM.L["Auction of %s items."] = ""
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:270
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:689
CLM.L["Auction of %s"] = "Subasta de %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:954
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:467
CLM.L["Auction settings"] = "Configuración de la subasta"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:599
CLM.L["Auction stopped by Master Looter"] = "Subasta detenida por el Master Looter"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:693
CLM.L["Auction time: %s."] = "Tiempo de subasta: %s."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1106
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1178
CLM.L["Auction type"] = "Tipo de subasta"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:427
CLM.L["Auctioning - Chat Commands"] = "Subastas: comandos de chat"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:60
CLM.L["Auctioning - History"] = "Subastas - Historia"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:349
--CLM.L["Auctioning - List Filling"] = ""
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:573
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:581
--CLM.L["Auctioning requires active raid or roster mode."] = ""
-- ClassicLootManager/MinimapIcon.lua:104
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:633
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:317
CLM.L["Auctioning"] = "Subasta"
-- ClassicLootManager_Integrations/GUI.lua:147
CLM.L["August"] = "Agosto"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:126
CLM.L["Auriaya"] = "Auriaya"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:661
CLM.L["Author"] = "Autor"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:903
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:148
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:124
CLM.L["Auto bench leavers"] = "Bancos automáticos"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:330
--CLM.L["Auto-assign from corpse"] = ""
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:339
CLM.L["Auto-trade after award"] = "Intercambio automático después de la adjudicación"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:394
CLM.L["Average weeks"] = "Semanas promedio"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:241
CLM.L["Award %s points to %s selected players."] = "Los premios apuntan a %de jugadores seleccionados."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:235
CLM.L["Award %s points to everyone in raid."] = "El premio %standby señala a todos en RAID."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:237
CLM.L["Award %s points to everyone in roster."] = "Premio %s señala a todos en la lista."
-- ClassicLootManager_Integrations/Integrations.lua:650
CLM.L["Award for Base"] = "Premio a la base"
-- ClassicLootManager_Integrations/Integrations.lua:649
CLM.L["Award for Free"] = "Premio gratis"
-- ClassicLootManager_Integrations/Integrations.lua:653
CLM.L["Award for Large"] = "Premio por grande"
-- ClassicLootManager_Integrations/Integrations.lua:654
CLM.L["Award for Max"] = "Premio por Max"
-- ClassicLootManager_Integrations/Integrations.lua:652
CLM.L["Award for Medium"] = "Premio a Medium"
-- ClassicLootManager_Integrations/Integrations.lua:651
CLM.L["Award for Small"] = "Premio a Pequeño"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:839
CLM.L["Award points only to online players"] = "Otorga puntos solo a jugadores en línea"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:848
CLM.L["Award points only to players in same zone"] = "Otorga puntos solo a jugadores en la misma zona"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:189
CLM.L["Award points to players based on context."] = "Puntos de premio a los jugadores basados en el contexto."
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:136
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:178
CLM.L["Award value"] = "Valor asignado"
-- ClassicLootManager/MinimapIcon.lua:118
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:145
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:194
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:231
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:188
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:305
CLM.L["Award"] = "Recompensa"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:280
--CLM.L["Award:"] = ""
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:456
CLM.L["Awarded %s points for %s to all players in raid %s"] = "Otorgó %s puntos por %s a todos los jugadores en la raid %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:432
CLM.L["Awarded %s points to %s players for %s in <%s>"] = "Otorgó %s puntos a %s jugadores por %s en <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:448
CLM.L["Awarded %s points to all players for %s in <%s>"] = "Otorgó %s puntos a todos los jugadores por %s en <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:221
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:287
CLM.L["Awarded by"] = "Otorgado por"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:62
CLM.L["Ayamiss the Hunter"] = "Ayamiss el Cazador"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:100
CLM.L["Azgalor"] = "Azgalor"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:716
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:749
CLM.L["Back"] = "Atras"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:736
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:769
CLM.L["Bag"] = "Bolsa"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:156
CLM.L["Baltharus the Warborn"] = "Baltharus el Warborn"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:9
CLM.L["Baron Geddon"] = "Baron Geddon"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:353
CLM.L["Base value for Static-Priced auction.\nMinimum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Valor base para una subasta de precio estático. \n\nValor mínimo para subasta ascendente y escalonada. \n\nEstablecer al mismo valor que otro nivel o negativo para ignorar."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:818
CLM.L["Base"] = "Base"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:25
CLM.L["Battleguard Sartura"] = "Guardia de batalla Sartura"
-- ClassicLootManager_Integrations/GUI.lua:321
-- ClassicLootManager_Integrations/GUI.lua:328
-- ClassicLootManager_Integrations/GUI.lua:335
CLM.L["Begin %d days ago, finish today."] = "Empezar hace %d días, finalizar hoy."
-- ClassicLootManager_Integrations/GUI.lua:254
CLM.L["Begin Day"] = "Día de inicio"
-- ClassicLootManager_Integrations/GUI.lua:265
CLM.L["Begin Month"] = "Mes de inicio"
-- ClassicLootManager_Integrations/GUI.lua:276
CLM.L["Begin Year"] = "Año de inicio"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:911
CLM.L["Bench multiplier"] = "Multiplicador en el banco."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:889
CLM.L["Bench"] = "Banquillo"
-- ClassicLootManager_Alerts/Alerts.lua:25
CLM.L["Bid %s accepted!"] = "¡Oferta %s aceptada!"
-- ClassicLootManager_Alerts/Alerts.lua:33
CLM.L["Bid %s denied!"] = "¡Oferta %s rechazada!"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1086
CLM.L["Bid cancelling not allowed"] = "Cancelación de oferta no permitida"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1084
CLM.L["Bid increment too low"] = "Incremento de oferta demasiado bajo"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:164
CLM.L["Bid input values as Main spec bid."] = "Valores de entrada de oferta como oferta de especificaciones principales."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:177
CLM.L["Bid input values as Off spec bid."] = "Valores de entrada de oferta como oferta de especificación OFF."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1082
CLM.L["Bid too high"] = "Oferta demasiado alta"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1081
CLM.L["Bid too low"] = "Oferta demasiado baja"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:269
CLM.L["Bid your current DKP (%s)."] = "Oferte su DKP actual (%s)."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:163
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:530
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:396
CLM.L["Bid"] = "Oferta de compra"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1080
CLM.L["Bidding over current standings not allowed"] = "No se permite pujar sobre la clasificación actual"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1079
CLM.L["Bidding while below minimum standings not allowed"] = "Licitación de licitación por debajo de la clasificación mínima no permitida"
-- ClassicLootManager/MinimapIcon.lua:114
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:974
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:75
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:83
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:638
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:820
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:876
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:515
CLM.L["Bidding"] = "Ofertas"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:241
CLM.L["Bids"] = "Ofertas"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:122
CLM.L["Bindings"] = "Fijación"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:336
CLM.L["Black Temple"] = "Templo Oscuro"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:201
CLM.L["Blackwing Lair"] = "Guarida Alanegra"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:144
CLM.L["Blood Council"] = "Consejo de sangre"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:53
CLM.L["Bloodlord Mandokir"] = "Señor sangriento Mandokir"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:755
CLM.L["Bonuses"] = "Bonus"
-- ClassicLootManager/ClassicLootManager.lua:224
CLM.L["Boot complete"] = "Arranque completo"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:432
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:761
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:80
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:238
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:82
CLM.L["Boss Kill Bonus"] = "Bonificación por muerte de jefe"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1073
CLM.L["Boss kill award values"] = "Valores de recompensa por muerte de jefe"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:17
CLM.L["Broodlord Lashlayer"] = "Señor de linaje Capazote"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:109
CLM.L["Brutallus"] = "Brutallus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:61
CLM.L["Buru the Gorger"] = "Buru el Manducador"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:920
CLM.L["Button Names"] = "Nombres de botones"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:31
CLM.L["C'Thun"] = "C'Thun"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:208
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:366
CLM.L["Cancel your bid."] = "Cancele su oferta."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:312
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:332
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:419
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:207
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:365
CLM.L["Cancel"] = "Cancelar"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:680
CLM.L["Change roster name."] = "Cambiar el nombre del Roster."
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:15
CLM.L["Changelog"] = "Registro de cambios"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1090
--CLM.L["Changing bid from Main-spec to Off-Spec not allowed"] = ""
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:73
CLM.L["Channel for posting bids."] = "Canal de publicación de ofertas."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:217
CLM.L["Chat Commands"] = "Comandos de chat"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:62
--CLM.L["Chat bidding is currently disabled."] = ""
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:72
CLM.L["Chess Event"] = "Chess Event"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:718
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:751
CLM.L["Chest (robes)"] = "Pecho (túnicas)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:717
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:750
CLM.L["Chest"] = "Pecho"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:21
CLM.L["Chromaggus"] = "Chromaggus"
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:263
CLM.L["Classic Loot Manager %s initialization complete. %s"] = "Classic Loot Manager %s inicialización completa. %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI.lua:270
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:15
CLM.L["Classic Loot Manager"] = "Classic Loot Manager"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:597
CLM.L["Classic"] = "Classic"
-- ClassicLootManager/Modules/GUI/Filters.lua:196
CLM.L["Clear all classes."] = "Borrar todas las clases."
-- ClassicLootManager_Integrations/GUI.lua:479
CLM.L["Clear output"] = "Borrar salida"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:253
--CLM.L["Clear"] = ""
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:68
CLM.L["Close on bid"] = "Cerrar en la oferta"
-- ClassicLootManager/Utils.lua:868
CLM.L["Common"] = "Común"
-- ClassicLootManager/MinimapIcon.lua:133
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:311
-- ClassicLootManager_Integrations/GUI.lua:23
CLM.L["Configuration"] = "Configuración"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:716
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:724
CLM.L["Copy settings from selected roster."] = "Copie la configuración del roster seleccionado."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:709
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:715
CLM.L["Copy settings"] = "Copiar parámetros"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:723
CLM.L["Copy source"] = "Copiar fuente"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:437
CLM.L["Correcting error"] = "Corrección de error"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:196
CLM.L["Create new raid with provided name. You will automatically join this raid and leave any other you are part of."] = "Crea una nueva raid con el nombre proporcionado. Automáticamente te unirás a esta raod y dejarás cualquier otra de la que formes parte."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:503
CLM.L["Create raid %s %s in <%s>"] = "Crear raid %s %s en <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:195
CLM.L["Create raid"] = "Crear raid"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1192
-- ClassicLootManager_Integrations/Integrations.lua:252
CLM.L["Create"] = "Crear"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:793
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:263
CLM.L["Created"] = "Creada"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1193
CLM.L["Creates new roster with default configuration"] = "Crea un nuevo roster con la configuración predeterminada"
-- ClassicLootManager_Integrations/Integrations.lua:253
CLM.L["Creates new trigger to be used during RCLC award."] = "Crea un nuevo desencadenante para ser utilizado durante el premio RCLC."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:458
CLM.L["Ctrl + Alt"] = "Ctrl + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:455
CLM.L["Ctrl"] = "Ctrl"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:539
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:820
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:405
CLM.L["Current"] = "Actual"
-- ClassicLootManager/Tooltips.lua:95
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:168
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:139
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:612
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:356
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:419
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:429
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:452
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:356
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:398
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:816
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:324
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:914
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:191
-- ClassicLootManager_Alerts/Alerts.lua:14
CLM.L["DKP"] = "DKP"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:157
CLM.L["DPS"] = "DPS"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:250
CLM.L["Danger Zone - Use at own risk"] = "Zona de peligro - uso bajo su propio riesgo"
-- ClassicLootManager_Integrations/GUI.lua:227
CLM.L["Data"] = "Datos"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:177
CLM.L["Date"] = "Fecha"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:145
CLM.L["Deathbringer Saurfang"] = "Deathbringer Saurfang"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:268
CLM.L["Decay %"] = "Decadencia %"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:330
CLM.L["Decay %s%% points to %s selected players."] = "La descomposición %s%% apunta a %s jugadores seleccionados."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:326
CLM.L["Decay %s%% points to everyone in roster."] = "La descomposición %s%% apunta a todos en la lista."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:278
CLM.L["Decay Negatives"] = "Decadencia negativa"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:443
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:292
CLM.L["Decay"] = "Decaimiento"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:440
CLM.L["Decayed %s%% points to %s players in <%s>"] = "%s%% puntos restado a %s jugadores en <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:464
CLM.L["Decayed %s%% points to all players %s in <%s>"] = "Restó %s%% puntos a todos los jugadores %s in <%s>"
-- ClassicLootManager_Integrations/GUI.lua:151
CLM.L["December"] = "Diciembre"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:768
CLM.L["Default Boss Kill Bonus Value"] = "Valor de bonificación por muerte de jefe predeterminado"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:85
CLM.L["Default Boss Kill Bonus value"] = "Valor predeterminado de la bonificación Boss Muerto"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1055
CLM.L["Default slot values"] = "Valores de slot predeterminados"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:660
CLM.L["Description"] = "Descripción"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:268
CLM.L["Disable data synchronisation"] = "Deshabilitar la sincronización de datos"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:269
CLM.L["Disable data synchronisation. This might lead to unexpected consequences. Use this at your own risk. Requires /reload to apply."] = "Desactiva la sincronización de datos. Esto podría conducir a consecuencias inesperadas. Usa esto bajo tu propio riesgo. Requiere /recargar para aplicar."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:453
CLM.L["Disable"] = "Deshabilitar"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:39
CLM.L["Disables display of the changelog for any new version."] = "Deshabilita la visualización del registro de cambios para cualquier versión nueva."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:259
CLM.L["Display price"] = "Precio de visualización"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:80
CLM.L["Do not show again"] = "No mostrar de nuevo"
-- .:indirectly
CLM.L["Druid"] = "Druida"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:967
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1061
CLM.L["Dynamic Item values"] = "Valores de elemento dinámico"
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
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:613
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:926
CLM.L["EPGP"] = "EPGP"
-- ClassicLootManager_Integrations/ImportCSV.lua:153
CLM.L["ERROR - invalid import data"] = "Error: datos de importación no válidos"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:19
CLM.L["Ebonroc"] = "Ebanorroca"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:56
CLM.L["Edge of Madness"] = "Edge of Madness"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:122
CLM.L["Emalon the Storm Watcher"] = "Emalon the Storm Watcher"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:432
CLM.L["Enable !dkp and !bid through whisper / raid. Change requires /reload."] = "Habilite !dkp y !bid a través de susurro /raid. El cambio requiere /recargar. "
-- ClassicLootManager_Integrations/Integrations.lua:124
CLM.L["Enable Gargul integration. This will allow Gargul to take control over some aspects of CLM (starting auction from Gargul, and awarding)."] = "Habilitar la integración de Gargul. Esto permitirá a Gargul tomar el control sobre algunos aspectos de CLM (subasta inicial de Gargul y otorgar)."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:981
CLM.L["Enable OS bids"] = "Habilitar ofertas del OS"
-- ClassicLootManager_Integrations/Integrations.lua:239
CLM.L["Enable RCLC integration. This will allow awarding DKP/GP points on RCLC item award. Requires /reload."] = "Habilitar la integración de RCLC. Esto permitirá otorgar puntos DKP/GP en el premio RCLC Artem. El cambio requiere /recargar."
-- ClassicLootManager_Integrations/Integrations.lua:362
CLM.L["Enable WoW DKP Bot Integration. This will result in additional data stored upon logout."] = "Habilite la integración de WoW DKP Bot. Esto resultará en datos adicionales almacenados al cerrar la sesión."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:210
CLM.L["Enable announcing auction start and end."] = "Habilite anunciar el inicio y el final de la subasta."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:89
CLM.L["Enable auto-update bid values when current highest bid changes (open auction only)."] = "Habilite la actualización automática de los valores de la oferta cuando cambie la oferta más alta actual (solo subasta abierta)."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:88
CLM.L["Enable auto-update bid values"] = "Habilitar valores de oferta de actualización automática"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:431
CLM.L["Enable chat commands"] = "Habilitar comandos de chat"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:331
--CLM.L["Enable loot auto-assign (Master Looter UI) from corpse when item is awarded"] = ""
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1129
CLM.L["Enable paid value splitting amongst raiders."] = "Habilite la división del valor pagado entre los raiders."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:989
--CLM.L["Enable to allow base bids even if higher bids are present if player didn't bid yet. Affects Open-Ascending Auction."] = ""
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1005
--CLM.L["Enable to allow equal bids. Affects Open-Ascending Auction."] = ""
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:997
--CLM.L["Enable to always allow All-In bids. Affects Open-Ascending Auction."] = ""
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1013
--CLM.L["Enable to always allow cancelling or passing bids. Affects Open-Ascending Auction."] = ""
-- ClassicLootManager/MinimapIcon.lua:78
CLM.L["Enables / disables minimap Icon"] = "Habilitar / deshabilitar icono minimap"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:34
CLM.L["Enables / disables verbose data printing during logging"] = "Habilita/deshabilita la impresión de datos detallados durante el registro"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:218
CLM.L["Enables announcing chat commands at auction start."] = "Habilita anunciar comandos de chat al inicio de la subasta."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:234
CLM.L["Enables announcing loot awards."] = "Permite anunciar premios de botín."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:242
CLM.L["Enables announcing new highest bid (when applicable)."] = "Habilita el anuncio de la nueva oferta más alta (cuando corresponda)."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:201
CLM.L["Enables announcing raid start and end."] = "Permite anunciar el inicio y el final de la raid."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:340
CLM.L["Enables auto-trade awarded loot after auctioning from bag"] = "Permite el intercambio automático de botín después de la subasta."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:260
CLM.L["Enables displaying item price on tooltip."] = "Habilita mostrar el precio del artículo en la información sobre herramientas."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:226
CLM.L["Enables raid-warning countdown for auctions."] = "Habilita la cuenta regresiva de advertencia de raid para las subastas."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:747
CLM.L["End Timetravel"] = "Fin de Timetravel"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:400
CLM.L["End selected raid"] = "Finalizar raid seleccionada"
-- ClassicLootManager/Utils.lua:871
CLM.L["Epic"] = "Épico"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:455
CLM.L["Equation"] = "Ecuación"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:111
CLM.L["Eredar Twins"] = "Gemelos Eredar"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:787
CLM.L["Europe"] = "Europa"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:293
CLM.L["Execute decay for players based on context."] = "Ejecute la descomposición para los jugadores en función del contexto."
-- ClassicLootManager_Integrations/Migration.lua:432
CLM.L["Execute migration from MonolithDKP, EssentialDKP, CommunityDKP, BastionLoot or CEPGP"] = "Ejecute la migración desde MonolithDKP, EssentialDKP, CommunityDKP, BastionLoot o CEPGP"
-- ClassicLootManager_Integrations/Migration.lua:52
CLM.L["Executing Addon Migration with comms disabled."] = "Ejecutando la migración de complementos con las comunicaciones deshabilitadas."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:479
CLM.L["Exponent / Base"] = "Exponente / base"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:474
CLM.L["Exponential scaling value used by the equations (Base for EPGPWeb, or Exponent for WoWpedia)"] = "Valor de escala exponencial utilizado por las ecuaciones (base para Epgpweb o exponente para Wowpedia)"
-- ClassicLootManager/MinimapIcon.lua:127
-- ClassicLootManager_Integrations/GUI.lua:403
-- ClassicLootManager_Integrations/GUI.lua:412
-- ClassicLootManager_Integrations/GUI.lua:489
-- ClassicLootManager_Integrations/GUI.lua:490
CLM.L["Export"] = "Exportar"
-- ClassicLootManager/Modules/GUI/Filters.lua:83
CLM.L["External"] = "Externo"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:140
CLM.L["Faction Champions"] = "Campeón de facción"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:40
CLM.L["False"] = "Falso"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:26
CLM.L["Fankriss the Unyielding"] = "Fankriss el Implacable"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:81
CLM.L["Fathom-Lord Karathress"] = "Señor de las profundidades Karathress"
-- ClassicLootManager_Integrations/GUI.lua:141
CLM.L["February"] = "Febrero"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:724
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:757
CLM.L["Feet"] = "Pies"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:110
CLM.L["Felmyst"] = "Brumavil"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:146
CLM.L["Festergut"] = "Festroso"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:353
--CLM.L["Fill auction list from corpse"] = ""
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:354
--CLM.L["Fill auction list with items from corpse. Will happen only if you open the corpse loot window."] = ""
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:371
--CLM.L["Fill auction list with looted items"] = ""
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:372
--CLM.L["Fill auction list with looted items. This will automatically add all items you have received."] = ""
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:99
CLM.L["Fill from Guild"] = "Rellenar desde la Hermandad"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:111
CLM.L["Fill from Raid Roster"] = "Rellenar desde el roster de raid"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:363
--CLM.L["Fill from corpse only if you are the Loot Master."] = ""
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:381
--CLM.L["Fill from loot only if you are using Group Loot."] = ""
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:112
CLM.L["Fill profile list with players in current raid roster."] = "Llene la lista de perfiles con jugadores en el roster de raid actual."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:100
CLM.L["Fill profile list with players with the minimum level and ranks."] = "Llene la lista de perfiles con jugadores con el nivel mínimo y rangos."
-- ClassicLootManager/Modules/GUI/Filters.lua:167
CLM.L["Filter"] = "Filtro"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:725
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:758
CLM.L["Finger"] = "Dedo"
-- ClassicLootManager_Integrations/GUI.lua:287
CLM.L["Finish Day"] = "Día de finalización"
-- ClassicLootManager_Integrations/GUI.lua:298
CLM.L["Finish Month"] = "Mes de finalización"
-- ClassicLootManager_Integrations/GUI.lua:309
CLM.L["Finish Year"] = "Año de finalización"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:527
CLM.L["Finished raid %s"] = "Raid terminada %s"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:795
CLM.L["Finished"] = "Finalizado"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:18
CLM.L["Firemaw"] = "Faucefogo"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:127
CLM.L["Flame Leviathan"] = "Leviatán de la llama"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:20
CLM.L["Flamegor"] = "Flamegor"
-- ClassicLootManager_Integrations/GUI.lua:238
CLM.L["Format"] = "Formato"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:104
CLM.L["Found %s in guild."] = "Encontrado %s en la Hermandad."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:128
CLM.L["Freya"] = "Freya"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:222
CLM.L["GM"] = "GM"
-- ClassicLootManager/Tooltips.lua:95
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:168
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:139
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:369
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:412
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:440
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:467
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:354
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:393
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:324
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:914
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:191
CLM.L["GP"] = "GP"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:57
CLM.L["Gahz'ranka"] = "Gahz'ranka"
-- ClassicLootManager_Integrations/Integrations.lua:117
-- ClassicLootManager_Integrations/Integrations.lua:123
CLM.L["Gargul Integration"] = "Integración de la gargul"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:8
CLM.L["Garr"] = "Garr"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:247
CLM.L["Gear Points"] = "Puntos de engranaje"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:7
CLM.L["Gehennas"] = "Gehennas"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:59
CLM.L["General Rajaxx"] = "General Rajaxx"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:129
CLM.L["General Vezax"] = "Vezax general"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:157
CLM.L["General Zarithrian"] = "General Zaritrio"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:674
CLM.L["General settings"] = "Configuración general"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:711
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:744
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:97
CLM.L["Global"] = "Global"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:37
CLM.L["Gluth"] = "Gluth"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:12
CLM.L["Golemagg the Incinerator"] = "Golemagg el Incinerador"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:43
CLM.L["Gothik the Harvester"] = "Gothik el Cosechador"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:33
CLM.L["Grand Widow Faerlina"] = "Gran Viuda Faerlina"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:36
CLM.L["Grobbulus"] = "Grobbulus"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:380
--CLM.L["Group Loot Only"] = ""
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:76
CLM.L["Gruul the Dragonkiller"] = "Gruul el Asesino de Dragones"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:299
CLM.L["Gruul's Lair"] = "Guarida de Gruul"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:92
CLM.L["Gurtogg Bloodboil"] = "Gurtogg Sangre Hirviente"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:55
CLM.L["Hakkar"] = "Hakkar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:105
CLM.L["Halazzi"] = "Halazzi"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:159
CLM.L["Halion"] = "Halion"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:721
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:754
CLM.L["Hands"] = "Manos"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:880
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:109
CLM.L["Hard cap"] = "Límite máximo"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:712
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:745
CLM.L["Head"] = "Cabeza"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:156
CLM.L["Healer"] = "Healer"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:40
CLM.L["Heigan the Unclean"] = "Heigan el Impuro"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:730
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:763
CLM.L["Held In Off-hand"] = "Sostenido en la mano izquierda"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:106
CLM.L["Hex Lord Malacrass"] = "Señor aojador Malacrass"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:441
CLM.L["Hides incoming !dkp and !bid whispers. Change requires /reload."] = "Oculta los susurros entrantes de !dkp y !bid. El cambio requiere /recargar."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:450
CLM.L["Hides outgoing !dkp and !bid responses. Change requires /reload."] = "Oculta las respuestas !dkp y !bid salientes. El cambio requiere /recargar."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:86
CLM.L["High Astromancer Solarian"] = "Gran astromántica Solarian"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:75
CLM.L["High King Maulgar"] = "Su majestad Maulgar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:48
CLM.L["High Priest Thekal"] = "Sumo Sacerdote Thekal"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:49
CLM.L["High Priest Venoxis"] = "Sumo Sacerdote Venoxis"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:50
CLM.L["High Priestess Arlokk"] = "Suma Sacerdotisa Arlokk"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:51
CLM.L["High Priestess Jeklik"] = "Suma Sacerdotisa Jeklik"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:52
CLM.L["High Priestess Mar'li"] = "Suma Sacerdotisa Mar'li"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:88
CLM.L["High Warlord Naj'entus"] = "Gran Señor de la Guerra Naj'entus"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:127
CLM.L["History type"] = "Tipo de historia"
-- .:indirectly
CLM.L["History"] = "Historia"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:130
CLM.L["Hodir"] = "Hodir"
-- .:indirectly
CLM.L["Hunter"] = "Cazador"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:78
CLM.L["Hydross the Unstable"] = "Hydross el Inestable"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:351
CLM.L["Hyjal Summit"] = "Monte Hyjal"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:468
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:585
CLM.L["Icecrown Citadel"] = "Ciudadela de Icecrown"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:148
CLM.L["Icecrown Gunship Battle"] = "Batalla de cañones de helado"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:131
CLM.L["Ignis the Furnace Master"] = "Ignis el maestro del horno"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:39
CLM.L["Ignore entry"] = "Ignorar entrada"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:408
CLM.L["Ignore"] = "Ignorar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:96
CLM.L["Illidan Stormrage"] = "Illidan Tempestira"
-- ClassicLootManager_Integrations/Migration.lua:246
-- ClassicLootManager_Integrations/Migration.lua:380
-- ClassicLootManager_Integrations/Migration.lua:424
CLM.L["Import complete"] = "Importación completa"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:442
-- ClassicLootManager_Integrations/ImportCSV.lua:100
-- ClassicLootManager_Integrations/ImportCSV.lua:162
-- ClassicLootManager_Integrations/ImportCSV.lua:163
-- ClassicLootManager_Integrations/ImportCSV.lua:191
CLM.L["Import"] = "Importar"
-- ClassicLootManager_Integrations/Migration.lua:197
CLM.L["Importing %s entries from DKPTable"] = "Importación de entradas %s de la tabla DKP"
-- ClassicLootManager_Integrations/Migration.lua:308
CLM.L["Importing profiles from DKPTable"] = "Importación de perfiles desde la tabla DKP"
-- ClassicLootManager/Modules/GUI/Filters.lua:82
CLM.L["In Guild"] = "En la Hermandad"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:794
CLM.L["In Progress"] = "En curso"
-- ClassicLootManager/Modules/GUI/Filters.lua:79
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:291
CLM.L["In Raid"] = "En Raid"
-- ClassicLootManager/MinimapIcon.lua:48
CLM.L["In-Sync"] = "En Sincronización"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:830
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:140
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:127
CLM.L["Include bench"] = "Incluir banquillo"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:831
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:141
CLM.L["Include benched players in all auto-awards"] = "Incluir jugadores en el banquillo en todas las recompensas automáticas"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:279
CLM.L["Include players with negative standings in decay."] = "Incluya jugadores con clasificación negativa en la descomposición."
-- ClassicLootManager/MinimapIcon.lua:46
CLM.L["Incoherent state"] = "Estado incoherente"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:167
CLM.L["Info"] = "Información"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:409
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:415
CLM.L["Information"] = "Información"
-- ClassicLootManager_Integrations/ImportCSV.lua:73
CLM.L["Input CSV Item value override data"] = "Datos de anulación del valor del elemento CSV de entrada"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:99
CLM.L["Input name: %s"] = "Nombre de entrada: %s"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:42
CLM.L["Instructor Razuvious"] = "Instructor Razuvious"
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:138
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:143
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:148
-- ClassicLootManager_Integrations/ClassicLootManager_Integrations.lua:20
CLM.L["Integrations"] = "Integraciones"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:103
CLM.L["Interval Bonus time"] = "Tiempo de bonificación de intervalo"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:444
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:806
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:117
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:250
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:100
CLM.L["Interval Bonus"] = "Bono de intervalo"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:813
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:124
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:252
CLM.L["Interval Time"] = "Tiempo de intervalo"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:822
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:132
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:253
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:106
CLM.L["Interval Value"] = "Valor de bonificación de intervalo"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:814
CLM.L["Interval in [minutes] to award bonus points"] = "Intervalo en [minutos] para otorgar puntos de bonificación"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1083
CLM.L["Invalid bid value"] = "Valor de oferta no válido"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:324
CLM.L["Invalid context. You should not decay raid only."] = "Contexto no válido. No debes descomponer solo Raid."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1089
--CLM.L["Invalid item"] = ""
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:56
CLM.L["Invalid value provided"] = "Valor proporcionado no válido"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:61
CLM.L["Item Value Mode"] = "Modo de valor del artículo"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:959
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1114
CLM.L["Item value mode"] = "Modo de valor del artículo"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1067
CLM.L["Item value overrides"] = "Reemplazos del valor del artículo"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:91
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:99
CLM.L["Item"] = "Articulo"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:104
CLM.L["Jan'alai"] = "Jan'alai"
-- ClassicLootManager_Integrations/GUI.lua:140
CLM.L["January"] = "Enero"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:54
CLM.L["Jin'do the Hexxer"] = "Jin'do el Malhechor"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:82
CLM.L["Join our discord for more info: "] = "Únete a nuestro discord para más información: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:414
CLM.L["Join selected raid"] = "Unirse a la raid seleccionada"
-- ClassicLootManager_Integrations/GUI.lua:146
CLM.L["July"] = "Julio"
-- ClassicLootManager_Integrations/GUI.lua:145
CLM.L["June"] = "Junio"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:87
CLM.L["Kael'thas Sunstrider"] = "Kael'thas Caminante del Sol "
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:108
CLM.L["Kalecgos"] = "Kalecgos"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:282
CLM.L["Karazhan"] = "Karazhan"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:99
CLM.L["Kaz'rogal"] = "Kaz'rogal"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:46
CLM.L["Kel'Thuzad"] = "Kel'Thuzad"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:113
CLM.L["Kil'jaeden"] = "Kil'jaeden"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:132
CLM.L["Kologarn"] = "Kologarn"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:123
CLM.L["Koralon the Flame Watcher"] = "Koralon el observador de la llama"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:58
CLM.L["Kurinnaxx"] = "Kurinnaxx"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:149
CLM.L["Lady Deathwhisper"] = "Lady Deathwhisper"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:83
CLM.L["Lady Vashj"] = "Lady Vashj"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:365
CLM.L["Large value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Gran valor para la subasta escalonada. \n\nEstablecer al mismo valor que otro nivel o negativo para ignorar."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:821
CLM.L["Large"] = "Larga Largo"
-- ClassicLootManager_Integrations/GUI.lua:327
CLM.L["Last month"] = "El mes pasado"
-- ClassicLootManager_Integrations/GUI.lua:320
CLM.L["Last week"] = "La semana pasada"
-- ClassicLootManager_Integrations/GUI.lua:334
CLM.L["Last year"] = "El año pasado"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:429
CLM.L["Latest loot"] = "Último botín"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:452
CLM.L["Latest points"] = "Últimos puntos"
-- ClassicLootManager/Utils.lua:872
CLM.L["Legendary"] = "Legendaria"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:723
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:756
CLM.L["Legs"] = "Piernas"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:80
CLM.L["Leotheras the Blind"] = "Leotheras el Ciego"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:20
CLM.L["Link Alt to Main"] = "Vincular Alter a Main"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:445
CLM.L["Linking override"] = "Anulación de vinculación"
-- ClassicLootManager/MinimapIcon.lua:42
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:347
CLM.L["Loading..."] = "Cargando..."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:41
CLM.L["Loatheb"] = "Loatheb"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:266
CLM.L["Lock selected"] = "Bloqueo seleccionado"
-- ClassicLootManager/Modules/GUI/Filters.lua:85
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:397
CLM.L["Locked"] = "Encerrada Encerrado"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:24
CLM.L["Logging level"] = "Nivel de registro"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:20
CLM.L["Logging"] = "Inicio sesión"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:233
CLM.L["Loot Awards"] = "Premios de botín"
-- ClassicLootManager_Integrations/GUI.lua:26
CLM.L["Loot History"] = "Historial de botín"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:389
--CLM.L["Loot rarity"] = ""
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:24
CLM.L["Loot"] = "Botín"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:141
CLM.L["Lord Jaraxxus"] = "Lord Jaraxxus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:150
CLM.L["Lord Marrowgar"] = "Lord Marrowgar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:5
CLM.L["Lucifron"] = "Lucifron"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:112
CLM.L["M'uru"] = "M'uru"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:416
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:163
-- ClassicLootManager_Integrations/Integrations.lua:137
-- ClassicLootManager_Integrations/Integrations.lua:142
CLM.L["MS"] = "MS"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:34
CLM.L["Maexxna"] = "Maexxna"
-- .:indirectly
CLM.L["Mage"] = "Mago"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:6
CLM.L["Magmadar"] = "Magmadar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:77
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:307
CLM.L["Magtheridon"] = "Magtheridon"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:66
CLM.L["Maiden of Virtue"] = "Doncella de Virtud"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:728
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:761
CLM.L["Main Hand"] = "Mano Principal"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:175
CLM.L["Main"] = "Mano"
-- ClassicLootManager/Modules/GUI/Filters.lua:84
CLM.L["Mains"] = "Manos"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:13
CLM.L["Majordomo Executus"] = "Mayordomo Executus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:120
CLM.L["Malygos"] = "Malygos"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:141
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:73
CLM.L["Management"] = "Gestión"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:224
CLM.L["Manager"] = "Gerente"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:438
CLM.L["Manual adjustment"] = "Ajuste manual"
-- ClassicLootManager_Integrations/GUI.lua:142
CLM.L["March"] = "Marzo"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:362
--CLM.L["Master Loot Only"] = ""
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:822
CLM.L["Max"] = "Маx"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:872
CLM.L["Maximum point cap player can receive per raid week. Set to 0 to disable."] = "Máximo límite de puntos que el jugador puede recibir por semana de incursión. Establecer en 0 para deshabilitar. "
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:881
CLM.L["Maximum point cap that player can have. Set to 0 to disable."] = "Límite máximo de puntos que puede tener el jugador. Establecer en 0 para deshabilitar. "
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:369
CLM.L["Maximum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Valor máximo para subasta ascendente y escalonada. \n\nEstablecer al mismo valor que otro nivel o negativo para ignorar."
-- ClassicLootManager_Integrations/GUI.lua:144
CLM.L["May"] = "Mayo"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:361
CLM.L["Medium value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Valor medio para subasta escalonada. \n\nSet al mismo valor que otro nivel o negativo para ignorar."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:820
CLM.L["Medium"] = "Medio"
-- ClassicLootManager/MinimapIcon.lua:100
CLM.L["Menu"] = "Menú"
-- ClassicLootManager_Integrations/Migration.lua:184
-- ClassicLootManager_Integrations/Migration.lua:262
-- ClassicLootManager_Integrations/Migration.lua:391
CLM.L["Migrating %s"] = "Migrando %s"
-- ClassicLootManager_Integrations/Migration.lua:66
CLM.L["Migration complete. %s to apply and sync with others or go to %s to discard."] = "Migración completa. %s para aplicar y sincronizar con otros o ir a %s para descartar. "
-- ClassicLootManager_Integrations/Migration.lua:285
CLM.L["Migration failure: Detected 0 teams"] = "Error de migración: 0 equipos detectados"
-- ClassicLootManager_Integrations/Migration.lua:223
-- ClassicLootManager_Integrations/Migration.lua:339
CLM.L["Migration failure: Unable to create profiles"] = "Error de migración: no se pueden crear perfiles"
-- ClassicLootManager_Integrations/Migration.lua:35
CLM.L["Migration ongoing: %s(%s)"] = "Migración en curso: %s(%s)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:133
CLM.L["Mimiron"] = "Mimirón"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:121
CLM.L["Min bid increment"] = "Incremento mínimo de oferta"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1159
CLM.L["Minimal increment"] = "Incremento mínimo"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1160
CLM.L["Minimal value increment for open auction mode."] = "Incremento de valor mínimo para el modo de subasta abierta."
-- ClassicLootManager_Integrations/Migration.lua:68
CLM.L["Minimap Icon -> Configuration -> Wipe events"] = "Ícono del minimapa -> Configuración -> Borrar eventos"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:934
CLM.L["Minimum GP used in calculations when player has less GP than this value."] = "GP mínimo utilizado en los cálculos cuando el jugador tiene menos GP que este valor."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:933
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:145
CLM.L["Minimum GP"] = "GP mínimo"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:86
CLM.L["Minimum Level"] = "Nivel mínimo"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:87
CLM.L["Minimum level of players to fill from guild."] = "Nivel mínimo de jugadores para llenar de la Hermandad."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:142
CLM.L["Minimum points (DKP / EP)"] = "Puntos mínimos (DKP / EP)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1021
--CLM.L["Minimum standing required to be allowed to bid."] = ""
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1020
--CLM.L["Minimum standing"] = ""
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:233
CLM.L["Missing award value"] = "Valor de premio faltante"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:322
CLM.L["Missing decay value"] = "Valor de descomposición faltante"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:321
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:393
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:432
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:461
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:495
CLM.L["Missing valid raid"] = "Falta una raid válida"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:60
CLM.L["Moam"] = "Moam"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:235
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:398
CLM.L["Modifier combination"] = "Combinación de modificador"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:185
CLM.L["Molten Core"] = "Nucleo de Magma"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:65
CLM.L["Moroes"] = "Moroes"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:82
CLM.L["Morogrim Tidewalker"] = "Morogrim Levantamareas"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:94
CLM.L["Mother Shahraz"] = "Madre Shahraz"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:410
CLM.L["Multiple"] = "Múltiple"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:527
CLM.L["Multiplier for tier %s (if used by the auction type)."] = "Multiplicador para nivel %s (si se usa por el tipo de subasta)."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:463
CLM.L["Multiplier used by the equations"] = "Multiplicador utilizado por las ecuaciones"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:468
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:287
CLM.L["Multiplier"] = "Multiplicadora Multiplicador"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:103
CLM.L["Nalorakk"] = "Nalorakk"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:679
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:355
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:366
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:261
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:174
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:527
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:393
CLM.L["Name"] = "Nombre"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:148
CLM.L["Named Buttons"] = "Botones nombrados"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:230
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:389
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:506
CLM.L["Naxxramas"] = "Naxxramas"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:713
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:746
CLM.L["Neck"] = "Cuello"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:22
CLM.L["Nefarian"] = "Nefarian"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:71
CLM.L["Netherspite"] = "Rencor abisal"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:38
CLM.L["Never show changelog"] = "Nunca mostrar el registro de cambios"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:911
--CLM.L["New highest bid on %s: %s %s %s"] = ""
-- ClassicLootManager_Integrations/Migration.lua:111
CLM.L["New roster: [%s]"] = "Nuevo roster: [%s]"
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:61
CLM.L["New version %s of Classic Loot Manager is available. For best experience please update the AddOn."] = "La nueva versión %s de Classic Loot Manager está disponible. Para obtener la mejor experiencia, actualice el AddOn."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:74
CLM.L["Nightbane"] = "Nocturno"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1085
CLM.L["No auction in progress"] = "No hay subasta en curso"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:198
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:176
CLM.L["No bids"] = "Sin ofertas"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:446
CLM.L["No loot received"] = "No se recibió botín"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:220
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:311
CLM.L["No players selected"] = "No hay jugadores seleccionados"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:475
CLM.L["No points received"] = "No se recibieron puntos"
-- ClassicLootManager/Utils.lua:502
CLM.L["No"] = "No"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:735
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:768
CLM.L["Non-equippable"] = "No equipable"
-- ClassicLootManager/Modules/GUI/Filters.lua:195
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:302
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:268
-- ClassicLootManager_Integrations/Integrations.lua:648
CLM.L["None"] = "Ninguno"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:142
CLM.L["Northrend Beasts"] = "Bestias northrend"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1078
CLM.L["Not in a roster"] = "No en un roster"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:570
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:615
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:524
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:255
CLM.L["Not in raid"] = "No en raid"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:156
CLM.L["Note to be added to award. Max 25 characters. It is recommended to not include date nor selected reason here. If you will input encounter ID it will be transformed into boss name."] = "Nota a agregar al premio. Max 25 caracteres. Se recomienda no incluir fecha ni razón seleccionada aquí. Si ingresa el ID de encuentro, se transformará en el nombre del jefe."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:154
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:278
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:114
CLM.L["Note"] = "Nota"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:39
CLM.L["Noth the Plaguebringer"] = "Noth el Pesteador"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:190
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:352
CLM.L["Notify that you are passing on the item."] = "Notifique que está pasando el artículo."
-- ClassicLootManager_Integrations/GUI.lua:150
CLM.L["November"] = "Noviembre"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:657
CLM.L["Num"] = "Número"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:980
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:417
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:176
-- ClassicLootManager_Integrations/Integrations.lua:147
-- ClassicLootManager_Integrations/Integrations.lua:152
CLM.L["OS"] = "OS"
-- ClassicLootManager_Integrations/GUI.lua:149
CLM.L["October"] = "Octubre"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:729
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:762
CLM.L["Off Hand"] = "Mano izquierda"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1088
CLM.L["Off-spec bidding not allowed"] = "Pidiendo fuera de especificación no permitida"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:783
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:94
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:242
CLM.L["On Time Bonus Value"] = "Valor de bonificación a tiempo"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:91
CLM.L["On Time Bonus value"] = "Valor de bonificación a tiempo"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:431
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:776
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:87
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:240
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:88
CLM.L["On Time Bonus"] = "Bono de tiempo"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:727
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:760
CLM.L["One-Hand"] = "Una mano"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:838
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:130
CLM.L["Online only"] = "solo online"
-- ClassicLootManager/Modules/GUI/Filters.lua:80
CLM.L["Online"] = "En línea"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:177
CLM.L["Only when ML/RL"] = "Solo cuando ML/RL"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:4
CLM.L["Onyxia"] = "Onyxia"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:178
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:486
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:603
CLM.L["Onyxia's Lair"] = "Guarida de Onyxia"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:123
CLM.L["Open Key Bindings UI for AddOns"] = "Abra la interfaz de usuario de enlaces de llave para complementos"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:633
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:640
CLM.L["Open"] = "Abierto"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:67
CLM.L["Opera Hall"] = "Ópera"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:63
CLM.L["Ossirian the Unscarred"] = "Osirio el Sinmarcas"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1153
CLM.L["Other"] = "Otra Otro"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:30
CLM.L["Ouro"] = "Ouro"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:76
CLM.L["Overrides"] = "Reemplaza"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1030
CLM.L["PASS"] = "PASAR"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:942
CLM.L["PR Rounding"] = "PR Redondeo"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:367
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:818
CLM.L["PR"] = "PR"
-- .:indirectly
CLM.L["Paladin"] = "Paladín"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:289
CLM.L["Participated"] = "participó"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:312
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:332
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:418
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:189
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:351
CLM.L["Pass"] = "Pasar"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1087
CLM.L["Passing after bidding not allowed"] = "Pasar después de pujar no está permitido"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:35
CLM.L["Patchwerk"] = "Remendejo"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:121
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:115
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:178
CLM.L["Player"] = "Jugador"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:362
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:375
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:392
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:406
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:420
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:439
CLM.L["Please select a raid"] = "Seleccione una raid"
-- ClassicLootManager_Integrations/GUI.lua:25
CLM.L["Point History"] = "Historial de puntos"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:912
CLM.L["Point award multiplier for players on bench."] = "Multiplicador de premio de puntos para jugadores en el banco."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:856
CLM.L["Point caps"] = "Límite de puntos"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:686
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1209
CLM.L["Point type"] = "Tipo de punto"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:25
CLM.L["Point"] = "Punto"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:179
CLM.L["Points value that will be awarded."] = "Valor de puntos que se otorgará."
-- ClassicLootManager/Utils.lua:867
CLM.L["Poor"] = "Pobre"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:70
CLM.L["Post bids"] = "Publicar ofertas"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:72
CLM.L["Post channel"] = "Publicar canal"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:255
CLM.L["Price Tooltips"] = "Tras de herramientas de precio"
-- .:indirectly
CLM.L["Priest"] = "Sacerdote"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:73
CLM.L["Prince Malchezaar"] = "Principe Malchezaar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:28
CLM.L["Princess Huhuran"] = "Princesa Huhuran"
-- ClassicLootManager_Integrations/Integrations.lua:142
-- ClassicLootManager_Integrations/Integrations.lua:152
CLM.L["Prioritized"] = "Priorizada Priorizado"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:151
CLM.L["Professor Putricide"] = "Profesor Putricidio"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:257
CLM.L["Profile %s already exists and is used by different GUID %s (%s). "] = "Perfil %s ya existe y es utilizado por diferentes GUID %s ( %s)."
-- .:indirectly
CLM.L["Profiles"] = "Perfiles"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:434
CLM.L["Progression Bonus"] = "Progreso del Bonus"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:377
CLM.L["Provide number of raids needed for 100% attendance in a weekly reset. Between 1 - 50 raids. Defaults to 2. Requires /reload."] = "Proporcione la cantidad de redadas necesarias para el 100 % de asistencia en un reinicio semanal. Entre 1 - 50 redadas. El valor predeterminado es 2. Requiere /recargar."
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:395
CLM.L["Provide number of weeks that will be accounted for attendance. Between 1 - 1000 weeks. Defaults to 10. Requires /reload."] = "Proporcione el número de semanas que se contabilizarán como asistencia. Entre 1 - 1000 semanas. El valor predeterminado es 10. Requiere /recargar."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:53
CLM.L["Prune profiles"] = "Cortar los perfiles"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:904
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:149
CLM.L["Put players leaving raid on bench instead of removing them. To remove them completely they will need to be removed manually from the bench."] = "Poner a los jugadores que salen de raid en el banquillo en lugar de eliminarlos. Para eliminarlos por completo, será necesario retirarlos manualmente del banquillo. "
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:152
CLM.L["Queen Lana'thel"] = "Reina lana'thel"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:739
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:772
CLM.L["Quiver"] = "Carcaj"
-- ClassicLootManager_Integrations/Integrations.lua:232
-- ClassicLootManager_Integrations/Integrations.lua:238
CLM.L["RCLC Integration"] = "Integración RCLC"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:614
CLM.L["ROLL"] = "Tirada de dados"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:97
CLM.L["Rage Winterchill"] = "Ira Fríoinvierno"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:14
CLM.L["Ragnaros"] = "Ragnaros"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:247
CLM.L["Raid Completion Bonus Value"] = "Valor de bonificación por finalización de raid"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:97
CLM.L["Raid Completion Bonus value"] = "Valor de bonificación por finalización de raid"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:433
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:791
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:102
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:245
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:94
CLM.L["Raid Completion Bonus"] = "Bono de finalización de raid"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:798
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:109
CLM.L["Raid Completion Value"] = "Valor de finalización de raid"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:185
CLM.L["Raid Name"] = "Nombre de la raid"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:200
CLM.L["Raid Start/End"] = "Inicio/fin de raid"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:196
CLM.L["Raid Warnings"] = "Advertencias de raid"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:425
CLM.L["Raid [%s] ended"] = "Raid [%s] finalizada"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:373
CLM.L["Raid [%s] started"] = "Raid [%s] iniciada"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:311
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:333
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:405
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:448
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:473
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:507
CLM.L["Raid management is disabled during time traveling."] = "La gestion de las raids está desactivada durante el Time-traveling"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:747
CLM.L["Raid"] = "Redada"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:376
CLM.L["Raids needed in reset"] = "Raids necesarias para reiniciar"
-- ClassicLootManager_Integrations/GUI.lua:27
CLM.L["Raids"] = "Raids"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:734
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:767
CLM.L["Ranged (wands)"] = "A distancia (varitas)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:733
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:766
CLM.L["Ranged"] = "A distancia"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:77
CLM.L["Ranks"] = "Rangos"
-- ClassicLootManager/Utils.lua:870
CLM.L["Rare"] = "Raro"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:15
CLM.L["Razorgore the Untamed"] = "Sangrevaja el Indomable"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:134
CLM.L["Razorscale"] = "Escala de afeitar"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:169
CLM.L["Reason"] = "Razón"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:358
CLM.L["Received"] = "Recibido"
-- ClassicLootManager_Integrations/Integrations.lua:137
-- ClassicLootManager_Integrations/Integrations.lua:147
CLM.L["Regular"] = "Regular"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:740
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:773
CLM.L["Relic"] = "Reliquia"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:93
CLM.L["Reliquary of Souls"] = "Relicario de almas"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:254
--CLM.L["Remove all items from auction list. Populates new one if there are any pending."] = ""
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:107
CLM.L["Remove all"] = "Eliminar todo"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:83
CLM.L["Remove auction"] = "Eliminar subasta"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:661
CLM.L["Remove from roster"] = "Eliminar del roster"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:612
CLM.L["Remove from standby"] = "Quitar del modo de espera"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:264
--CLM.L["Remove item from auction list after it's awarded."] = ""
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:96
CLM.L["Remove old"] = "Eliminar viejo"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:263
--CLM.L["Remove on award"] = ""
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:580
CLM.L["Remove override"] = "Eliminar la anulación"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:740
CLM.L["Remove roster"] = "Quitar roster"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:433
CLM.L["Remove selected raid"] = "Quitar la raid seleccionada"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:288
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:436
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:757
CLM.L["Remove selected"] = "Eliminar la selección"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:746
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:399
CLM.L["Remove"] = "Eliminar"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:747
CLM.L["Removes current roster."] = "Elimina el roster actual."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:215
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:637
--CLM.L["Removing items not allowed during auction."] = ""
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:356
CLM.L["Request standby"] = "Solicitar espera"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:102
CLM.L["Rescales CLM UI, except Bidding window. You can rescale Bidding window independently by using Ctrl + Mouse Wheel. Some windows may require closing and reopening."] = "Rescala CLM UI, excepto la ventana de licitación. Puede rescalar una ventana de oferta de forma independiente utilizando la rueda CTRL + mouse. Algunas ventanas pueden requerir cierre y reapertura."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:123
CLM.L["Reset gui positions"] = "Restablecer posiciones de interfaz gráfica de usuario"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:369
CLM.L["Revoke standby"] = "Revocar modo de espera"
-- .:indirectly
CLM.L["Rogue"] = "Pícaro"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:176
CLM.L["Role"] = "Role"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:543
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:410
--CLM.L["Roll"] = ""
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1201
CLM.L["Roster Name"] = "Nombre del roster"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1200
CLM.L["Roster name"] = "Nombre del roster"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:109
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:120
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:746
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:308
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:104
-- ClassicLootManager_Integrations/ImportCSV.lua:91
CLM.L["Roster"] = "Roster"
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:137
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:142
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:147
CLM.L["Rosters"] = "Rosters"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:153
CLM.L["Rotface"] = "Corredera"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:943
CLM.L["Round PR to selected number of decimals"] = "Redondear PR al número seleccionado de decimales"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:700
CLM.L["Round to selected number of decimals"] = "Redondear al número seleccionado de decimales"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:118
CLM.L["Round to"] = "Redondear a"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:699
CLM.L["Rounding"] = "Redondeo"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:267
CLM.L["Ruins of Ahn'Qiraj"] = "Ruinas de Ahn'Qiraj"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:615
CLM.L["SK"] = "SK"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:847
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:133
CLM.L["Same zone only"] = "Solo la misma zona"
-- ClassicLootManager/MinimapIcon.lua:56
CLM.L["Sandbox mode"] = "Sandbox mode"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:45
CLM.L["Sapphiron"] = "Saphiron"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:116
CLM.L["Sartharion"] = "Sartarión"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:158
CLM.L["Saviana Ragefire"] = "Saviana Ragefire"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:634
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:641
CLM.L["Sealed"] = "Sellado"
-- ClassicLootManager/Modules/GUI/Filters.lua:212
CLM.L["Search for player names. Separate multiple with a comma ','. Minimum 3 characters. Overrides filtering."] = "Buscar nombres de jugadores. Separe los múltiplos con una coma ','. Un mínimo de 3 caracteres. Anula el filtrado."
-- ClassicLootManager/Modules/GUI/Filters.lua:211
CLM.L["Search"] = "Búsqueda"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1210
CLM.L["Select DKP or EPGP point system."] = "Seleccione el sistema de puntos DKP o EPGP."
-- ClassicLootManager_Integrations/GUI.lua:380
CLM.L["Select Profiles to export"] = "Seleccionar Perfiles para exportar"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:412
CLM.L["Select Rosters to display"] = "Seleccione las listas para mostrar"
-- ClassicLootManager_Integrations/GUI.lua:349
CLM.L["Select Rosters to export"] = "Seleccionar Rosters para exportar"
-- ClassicLootManager/Modules/GUI/Filters.lua:183
CLM.L["Select all classes."] = "Seleccione todas las clases."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:492
CLM.L["Select equation"] = "Seleccionar ecuación"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:25
CLM.L["Select logging level for troubleshooting"] = "Seleccione el nivel de registro para la solución de problemas"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:187
CLM.L["Select loot rarity for the annoucement to raid."] = "Seleccione la rareza del botín para el anuncio de incursión."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:390
--CLM.L["Select loot rarity threshold to used to fill the auction list."] = ""
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:236
CLM.L["Select modifier combination for awarding."] = "Seleccione la combinación de modificador para la adjudicación."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:399
--CLM.L["Select modifier combination for filling auction from bags and corpse."] = ""
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:135
CLM.L["Select roster to add profiles to."] = "Seleccione el roster al que agregar perfiles."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:165
CLM.L["Select roster to create raid for."] = "Seleccione el roster para crear la raid."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:164
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:134
CLM.L["Select roster"] = "Seleccionar el roster"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:863
CLM.L["Select weekly reset timezone. EU: Wed 07:00 GMT or US: Tue 15:00 GMT"] = "Seleccione la zona horaria de restablecimiento semanal. UE: miércoles 07:00 GMT o EE. UU.: martes 15:00 GMT"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:745
CLM.L["Selected"] = "Seleccionada Seleccionado"
-- ClassicLootManager_Integrations/GUI.lua:148
CLM.L["September"] = "Septiembre"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:314
CLM.L["Serpentshrine Cavern"] = "Caverna Santuario Serpiente"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:472
CLM.L["Set %s points to %s players for %s in <%s>"] = "Establecer %s puntos en %s jugadores para %s en <%s>"
-- ClassicLootManager_Integrations/Migration.lua:378
CLM.L["Set points for %s players for team to %s"] = "Establecer puntos para %s jugadores por equipo en %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:186
CLM.L["Set raid name"] = "Establecer nombre de raid"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:90
CLM.L["Shade of Akama"] = "Sombra de Akama"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:70
CLM.L["Shade of Aran"] = "Sombra de Aran"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:117
CLM.L["Shadron"] = "Sombreado"
-- .:indirectly
CLM.L["Shaman"] = "Chaman"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:10
CLM.L["Shazzrah"] = "Shazzrah"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:732
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:765
CLM.L["Shield"] = "Escudo"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:457
CLM.L["Shift + Alt"] = "Shift + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:460
CLM.L["Shift + Ctrl + Alt"] = "Shift + Ctrl + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:459
CLM.L["Shift + Ctrl"] = "Shift + Ctrl"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:454
CLM.L["Shift"] = "Shift"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:715
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:748
CLM.L["Shirt"] = "Camisa"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:714
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:747
CLM.L["Shoulder"] = "Hombro"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:219
CLM.L["Show Award window"] = "Mostrar ventana de premio"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:24
CLM.L["Silithid Royalty"] = "Bug Trio"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:154
CLM.L["Sindragosa"] = "Sindragosa"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:662
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:668
CLM.L["Single-Priced"] = "Precio único"
-- ClassicLootManager_Integrations/Migration.lua:179
CLM.L["Skipping %s"] = "Saltando %s"
-- ClassicLootManager_Integrations/Migration.lua:255
CLM.L["Skipping CommunityDKP"] = "Ignorar CommunityDKP"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:498
CLM.L["Slot multipliers"] = "Multiplicadores de ranura"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:357
CLM.L["Small value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Pequeño valor para subasta escalonada. \n\nEstablecer al mismo valor que otro nivel o negativo para ignorar."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:819
CLM.L["Small"] = "Pequeña Pequeño"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:85
CLM.L["Spec guild request"] = "Solicitud de especificaciones de la Hermandad"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:357
CLM.L["Spent"] = "Gastado"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:796
CLM.L["Stale"] = "Caducado"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:138
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:148
CLM.L["Standby %s has been sent"] = "Se ha enviado %s en espera"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:435
CLM.L["Standby Bonus"] = "Bono de espera"
-- ClassicLootManager/Modules/GUI/Filters.lua:81
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:300
CLM.L["Standby"] = "En espera"
-- ClassicLootManager_Integrations/GUI.lua:24
CLM.L["Standings"] = "Posiciones"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:386
CLM.L["Start selected raid"] = "Iniciar raid seleccionada"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:500
CLM.L["Start"] = "Comienzo"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:511
CLM.L["Started raid %s"] = "Raid iniciada %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:419
CLM.L["Statistics"] = "Estadísticas"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:262
CLM.L["Status"] = "Estado"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:500
CLM.L["Stop"] = "Detener"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:64
CLM.L["Store bids"] = "Tienda de ofertas"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:65
CLM.L["Store finished auction bids information."] = "Almacenar información de ofertas de subastas terminadas."
-- ClassicLootManager_Integrations/ImportCSV.lua:118
CLM.L["Success"] = "Éxito"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:11
CLM.L["Sulfuron Harbinger"] = "Sulfuron Presagista"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:374
CLM.L["Sunwell Plateau"] = "Meseta de La Fuente del Sol"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:440
CLM.L["Suppress incoming whispers"] = "Suprimir susurro entrante"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:449
CLM.L["Suppress outgoing whispers"] = "Suprimir los susurros salientes"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:81
CLM.L["Suppresses changelog display until new version is released"] = "Suprime la visualización del registro de cambios hasta que se lanza una nueva versión"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:89
CLM.L["Supremus"] = "Supremus"
-- ClassicLootManager/MinimapIcon.lua:50
CLM.L["Sync ongoing"] = "Sincronización en curso"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:602
CLM.L["TBC"] = "TBC"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:719
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:752
CLM.L["Tabard"] = "Tabardo"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:155
CLM.L["Tank"] = "Tank"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1168
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:139
CLM.L["Tax"] = "Tasa"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:326
CLM.L["Tempest Keep"] = "El Castillo de la Tempestad"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:215
CLM.L["Temple of Ahn'Qiraj"] = "Templo de Ahn'Qiraj"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:118
CLM.L["Tenebron"] = "Tenebrón"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:69
CLM.L["Terestian Illhoof"] = "Terestian Pezuña Enferma"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:91
CLM.L["Teron Gorefiend"] = "Teron Sanguino"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:38
CLM.L["Thaddius"] = "Thaddius"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:135
CLM.L["The Assembly of Iron"] = "La asamblea de hierro"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:68
CLM.L["The Curator"] = "Curator"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:420
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:537
CLM.L["The Eye of Eternity"] = "El ojo de la eternidad"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:44
CLM.L["The Four Horsemen"] = "Cofre de los cuatro jinetes"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:95
CLM.L["The Illidari Council"] = "El Consejo Illidari"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:155
CLM.L["The Lich King"] = "El rey Lich"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:79
CLM.L["The Lurker Below"] = "El Rondador de abajo"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:410
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:527
CLM.L["The Obsidian Sanctum"] = "El santuario de la obsidiana"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:23
CLM.L["The Prophet Skeram"] = "El Profeta Skeram"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:493
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:610
CLM.L["The Ruby Sanctum"] = "El santuario rubí"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:136
CLM.L["Thorim"] = "Thorim"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:738
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:771
CLM.L["Thrown"] = "Arma arrojadiza"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:519
CLM.L["Tier multipliers"] = "Multiplicadores de nivel"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:664
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:669
CLM.L["Tiered"] = "De nivel"
-- ClassicLootManager/MinimapIcon.lua:60
CLM.L["Time Traveling"] = "Viajar en el tiempo"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1045
CLM.L["Time in seconds by which auction will be extended if bid is received during last 10 seconds."] = "Tiempo en segundos por el cual se extenderá la subasta si se recibe una oferta durante los últimos 10 segundos."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1029
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:658
CLM.L["Time"] = "Hora"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:736
CLM.L["Timetravel"] = "Viaje en el tiempo"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:305
CLM.L["Toggle Auction History window display"] = "Alternar la visualización de la ventana Historial de subastas"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:677
CLM.L["Toggle Auctioning window display"] = "Alternar la visualización de la ventana de Subastas"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:79
CLM.L["Toggle Bidding auto-open"] = "Alternar ofertas de apertura automática"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:84
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:877
CLM.L["Toggle Bidding window display"] = "Alternar la visualización de la ventana de ofertas"
-- ClassicLootManager_Integrations/ImportCSV.lua:216
CLM.L["Toggle CSV import window display"] = "Pantalla de ventana de importación CSV de al revés CSV"
-- ClassicLootManager/MinimapIcon.lua:77
CLM.L["Toggle Minimap Icon"] = "Alternar icono de minimap"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:80
CLM.L["Toggle auto open and auto close on auction start and stop"] = "Alternar entre abrir y cerrar automáticamente al iniciar y detener la subasta"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:48
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:160
CLM.L["Toggle changelog window display"] = "Alternar la visualización de la ventana de registro de cambios"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:47
CLM.L["Toggle changelog"] = "Alternar registro de cambios"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:69
--CLM.L["Toggle closing bidding UI after submitting bid for all items."] = ""
-- ClassicLootManager_Integrations/GUI.lua:518
CLM.L["Toggle export window display"] = "Alternar visualización de la ventana de exportación"
-- ClassicLootManager/Modules/GUI/UnifiedGUI.lua:426
CLM.L["Toggle standings window display"] = "Alternar la visualización de la ventana de clasificación"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:147
CLM.L["Toggles addon sounds."] = "Alternar los sonidos de complemento."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:169
CLM.L["Toggles loot announcement to raid"] = "Cambia el anuncio de botín a la raid"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:322
CLM.L["Toggles loot award announcement to guild"] = "Cambia el anuncio del premio de botín a la Hermandad"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:357
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:370
CLM.L["Too much data to display"] = "Demasiados datos para mostrar "
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:124
CLM.L["Toravon the Ice Watcher"] = "Toravon el observador de hielo"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:422
CLM.L["Total blocked"] = "Total bloqueado"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:423
CLM.L["Total decayed"] = "Total decaído"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:421
CLM.L["Total received"] = "Total recibido"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:420
CLM.L["Total spent"] = "Total gastado"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:457
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:574
CLM.L["Trial of the Crusader"] = "Juicio del cruzado"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:726
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:759
CLM.L["Trinket"] = "Trinket"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:40
CLM.L["True"] = "Verdad"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:29
CLM.L["Twin Emperors"] = "Emperadores Gemelos"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:247
CLM.L["Two different profiles exist for target GUID %s (%s:%s) and name %s (%s:%s). Verify and clean up profiles before updating."] = "Existen dos perfiles diferentes para Target GUID%s (%s:%s) y nombre%s (%s:%s). Verifique y limpie los perfiles antes de actualizar."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:731
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:764
CLM.L["Two-Hand"] = "Dos manos"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:659
CLM.L["Type"] = "Tipo"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:101
CLM.L["UI Scale"] = "Escala de ui"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:437
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:554
CLM.L["Ulduar"] = "Ulduar"
-- ClassicLootManager_Integrations/Migration.lua:48
CLM.L["Unable to execute migration. Entries already exist."] = "No se puede ejecutar la migración. Las entradas ya existen. "
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:163
CLM.L["Unable to get item info from server. Please try auctioning again"] = "No se puede obtener la información del elemento del servidor. Intente subastando de nuevo"
-- ClassicLootManager/Utils.lua:869
CLM.L["Uncommon"] = "Poco común"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:436
CLM.L["Unexcused absence"] = "Ausencia sin excusa"
-- ClassicLootManager/MinimapIcon.lua:52
CLM.L["Unknown sync state"] = "Estado de sincronización desconocido"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:286
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:342
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:215
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:285
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:175
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:34
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:334
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:434
CLM.L["Unknown"] = "Desconocido"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:304
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:29
CLM.L["Unlink Alt"] = "Desvincular Alter"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:275
CLM.L["Unlock selected"] = "Desbloquear seleccionado"
-- ClassicLootManager_Integrations/Migration.lua:144
CLM.L["UpdatePoints(): Empty targets list"] = "UpdatePoints(): lista de objetivos vacíos"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:518
CLM.L["Updated raid <%s> %s joined, %s left, %s benched, %s removed"] = "Raid actualizada <%s> %s se unió, %s se fue, %s se quedó en el banquillo, %s se eliminó"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1083
CLM.L["Use named buttons"] = "Usar botones con nombre"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:16
CLM.L["Vaelastrasz the Corrupt"] = "Vaelastrasz el Corrupto"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:143
CLM.L["Val'kyr Twins"] = "Val'kyr gemelos"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:147
CLM.L["Valithria Dreamwalker"] = "Valithria Dreamwalker"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:168
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:296
CLM.L["Value"] = "Valor"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:427
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:544
CLM.L["Vault of Archavon"] = "Bóveda de Archavon"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:33
CLM.L["Verbose"] = "Detallado"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:75
CLM.L["Version check in guild"] = "Comprobación de versión en la Hermandad"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:177
CLM.L["Version"] = "Versión"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:119
CLM.L["Vesperon"] = "Veseron"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:635
CLM.L["Vickrey"] = "Vickrey"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:27
CLM.L["Viscidus"] = "Viscidus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:85
CLM.L["Void Reaver"] = "Atracador del vacío"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:722
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:755
CLM.L["Waist"] = "Cintura"
-- .:indirectly
CLM.L["Warlock"] = "Brujo"
-- .:indirectly
CLM.L["Warrior"] = "Guerrero"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:871
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:112
CLM.L["Weekly cap"] = "Límite semanal"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:413
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:416
CLM.L["Weekly gains"] = "Ganancias semanales"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:862
CLM.L["Weekly reset timezone"] = "Zona horaria de restablecimiento semanal"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:115
CLM.L["Weekly reset"] = "Reinicio semanal"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:178
CLM.L["When enabled, this will make loot announcement display only if you're Master Looter or Raid Leader (if there is no Master Looter)."] = "Cuando está habilitado, esto hará que se muestre el anuncio del botín solo si eres Master Looter o Raid Leader (si no hay Master Looter)."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1084
CLM.L["Will display names of the buttons instead of values in bidding UI"] = "Mostrará nombres de los botones en lugar de valores en la interfaz de usuario de licitación"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:155
CLM.L["Wipe events"] = "Borrar eventos"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:41
CLM.L["Wipe"] = "Borrar"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:156
CLM.L["Wipes all events from memory. This will trigger resyncing from other users."] = "Borra todos los eventos de la memoria. Esto activará la resincronización de otros usuarios."
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:42
CLM.L["Wipes the log history"] = "Borra el historial de registro"
-- ClassicLootManager_Integrations/Integrations.lua:361
CLM.L["WoW DKP Bot Integration"] = "Integración WoW DKP Bot"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:607
CLM.L["WotLK - 10"] = "WotLK - 10"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:612
CLM.L["WotLK - 25"] = "WotLK - 25"
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:191
CLM.L["Wowpedia"] = "Wowpedia"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:720
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:753
CLM.L["Wrist"] = "Muñeca"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:137
CLM.L["XT-002 Deconstructor"] = "Deconstructor XT-002"
-- ClassicLootManager/Utils.lua:497
CLM.L["Yes"] = "Sí"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:138
CLM.L["Yogg-Saron"] = "Yogug-saron"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:307
CLM.L["You are already in an active raid. Leave or finish it before creating new one."] = "Ya estás en una raid activa. Déjala o termínala antes de crear una nueva. "
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:662
CLM.L["You are not allowed to auction items"] = "No tienes permitido subastar artículos."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:465
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:499
CLM.L["You are not allowed to control raid."] = "No tienes permitido controlar la raid."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:303
CLM.L["You are not allowed to create raids."] = "No tienes permitido crear raids."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:436
CLM.L["You are not allowed to join raid."] = "No tienes permitido unirte a la raid."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:325
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:397
CLM.L["You are not allowed to start raid."] = "No se le permite iniciar la raid."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:338
CLM.L["You are not in the raid."] = "No estás en la raid."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:632
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:641
CLM.L["You can %s max %d players from standby at the same time to a %s raid."] = "Puedes %s como máximo %d jugadores desde el modo de espera al mismo tiempo a una raid de %s."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:587
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:596
CLM.L["You can %s max %d players to standby at the same time to a %s raid."] = "Puede %s como máximo %d jugadores para estar en espera al mismo tiempo en una raid de %s."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:469
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:503
CLM.L["You can only add players to standby of a progressing raid."] = "Solo puedes agregar jugadores al modo de espera de una raid en progreso."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:578
CLM.L["You can only bench players from same roster as the raid (%s)."] = "Solo puedes enviar al banquillo a jugadores del mismo roster que la raid (%s)."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:401
CLM.L["You can only end an active raid."] = "Solo puedes finalizar una raid activa."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:440
CLM.L["You can only join an active raid."] = "Solo puedes unirte a una raid activa."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:444
CLM.L["You can only join different raid than your current one."] = "Solo puedes unirte a una raid diferente a la actual."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:623
CLM.L["You can only remove from bench players from same roster as the raid (%s)."] = "Solo puedes eliminar del banquillo a jugadores del mismo roster que el raid (%s)."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:329
CLM.L["You can only start a freshly created raid."] = "Solo puedes iniciar una raid recién creada."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:675
CLM.L["You can remove max %d players from roster at the same time."] = "Puede eliminar un máximo de %d jugadores del la roster al mismo tiempo."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:335
CLM.L["Your bid (%s) was denied: |cffcc0000%s|r"] = "Su oferta (%s) fue denegada: |cffcc0000%s|r"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:314
CLM.L["Your bid (%s) was |cff00cc00accepted|r"] = "Su oferta (%s) fue |cff00cc00aceptada|r"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:67
CLM.L["Zero-Sum Bank Inflation"] = "Inflación bancaria de suma cero"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1128
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:64
CLM.L["Zero-Sum Bank"] = "banco de suma cero"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1136
CLM.L["Zero-Sum Inflation Value"] = "Valor de inflación de suma cero"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:439
CLM.L["Zero-Sum award"] = "premio de suma cero"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1122
CLM.L["Zero-Sum"] = "Suma cero"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:362
CLM.L["Zul'Aman"] = "Zul'Aman"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:251
CLM.L["Zul'Gurub"] = "Zul'Gurub"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:107
CLM.L["Zul'jin"] = "Zul'jin"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:221
CLM.L["[All Roster Configs]: "] = "[Todas las configuraciones del roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:227
CLM.L["[All Roster Default Slot Values]: "] = "[Todos los valores de ranura predeterminados del roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:205
CLM.L["[Alt-Main Link]: "] = "[Alt-Main Enlace principal]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:212
CLM.L["[Create Roster]: "] = "[Crear Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:215
CLM.L["[Delete Roster]: "] = "[Eliminar Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:290
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:532
CLM.L["[IGNORE]: Ignoring entry"] = "[IGNORAR]: Ignorar entrada"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:274
CLM.L["[Item Award in Raid]: "] = "[Premio de artículo en raid]:"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:271
CLM.L["[Item Award]: "] = "[Premio del artículo]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:261
CLM.L["[Point Award to raid]: "] = "[Premio de puntos a la raid]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:258
CLM.L["[Point Award to roster]: "] = "[Premio de puntos al roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:252
CLM.L["[Point Award]: "] = "[Premio de puntos]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:264
CLM.L["[Point Decay for roster]: "] = "[Decaimiento de puntos para el roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:255
CLM.L["[Point Decay]: "] = "[Punto de caída]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:267
CLM.L["[Point Set]: "] = "[Conjunto de puntos]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:208
CLM.L["[Profile Lock]: "] = "[Bloqueo de perfil]:"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:278
CLM.L["[Raid Create]: "] = "[Raid creada]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:287
CLM.L["[Raid Finish]: "] = "[Raid finalizada]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:281
CLM.L["[Raid Start]: "] = "[Inicio de la Raid]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:284
CLM.L["[Raid Update]: "] = "[Raid actualizada]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:202
CLM.L["[Remove Profile]: "] = "[Perfil eliminado]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:218
CLM.L["[Rename Roster]: "] = "[Renombrar Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:245
CLM.L["[Roster Boss Kill Bonus]: "] = "[Bonificación por matar al jefe del roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:224
CLM.L["[Roster Config]: "] = "[Configuración del roster]:: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:242
CLM.L["[Roster Copy]: "] = "[Copia del roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:230
CLM.L["[Roster Default Slot Value]: "] = "[Valor del Roster por defecto]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:248
CLM.L["[Roster Field Rename]: "] = "[Cambiar el campo de la lista]:"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:236
CLM.L["[Roster Item Value Override Single]: "] = "[Anulación del valor del elemento de la lista soltero]:"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:233
CLM.L["[Roster Item Value Override]: "] = "[Anulación del valor del elemento del roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:239
CLM.L["[Roster Update Profiles]: "] = "[Actualizar perfiles del roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:199
CLM.L["[Update Profile]: "] = "[Actulizar el perfil]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:408
CLM.L["[config] "] = "[Configuración] "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:410
CLM.L["[item values] "] = "[Valor del artículo] "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:411
CLM.L["[profiles] "] = "Perfiles] "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:409
CLM.L["[slot defaults] "] = "[valores predeterminados de la ranura] "
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:59
CLM.L["accepted"] = "Aceptado"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:588
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:597
CLM.L["add"] = "añadir"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:46
CLM.L["cancel"] = "cancelar"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:597
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:642
CLM.L["created"] = "creado"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:59
CLM.L["denied"] = "denegado"
-- ClassicLootManager_Integrations/Integrations.lua:343
CLM.L["else"] = "más"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:465
CLM.L["excluding negatives "] = "excluyendo negativos "
-- ClassicLootManager_Integrations/Integrations.lua:278
CLM.L["if reason/response contains"] = "Si la razón/respuesta contiene"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:58
CLM.L["level"] = "nivel"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:48
CLM.L["pass"] = "pasar"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:588
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:633
CLM.L["progressing"] = "progresando"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:61
CLM.L["rank"] = "rango"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:633
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:642
CLM.L["remove"] = "retirar"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:139
CLM.L["request"] = "solicitud"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:42
CLM.L["requested"] = "solicitado"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:149
CLM.L["revoke"] = "revocar"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:72
CLM.L["revoked"] = "revocado"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:98
CLM.L["roster"] = "roster"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:98
CLM.L["rosters"] = "rosters"
-- ClassicLootManager_Integrations/Integrations.lua:288
CLM.L["then"] = "después"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:65
CLM.L["unguilded"] = "Sin Hermandad"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1107
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1179
CLM.L["|cff00ee44Open:|r English Auction with highest bidder announcement. Highest bidder wins. Two players can not bid same value. Additionally always allows bidding base to accomodate for Swedish Auction flavor.\n\n|cff00ee44Anonymous Open:|r Same as Open but highest bidder name is not disclosed.\n\n|cff00ee44Sealed:|r Bids are not announced. Highest bidder wins.\n\n|cff00ee44Vickrey:|r Same as sealed but winner pays with second-highest bid."] = "|cff00ee44Open: |r Subasta en inglés con el mejor anuncio de postor. El mejor postor gana. Dos jugadores no pueden ofertar el mismo valor. Además, siempre permite que la base de licitación se acomode para el sabor de subasta sueca. \n\n|cff000ee44Abierto:|r Igual que no se revele el nombre de postor abierto pero más alto. El mejor postor gana. \n\n|cff00ee44vickrey: |r igual que el sellado pero el ganador paga con la segunda oferta más alta."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:960
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1115
CLM.L["|cff00ee44Single-Priced:|r Static value mode. Only bidding Base value is supported.\n\n|cff00ee44Ascending:|r Ranged value mode. Allows bidding any value in |cff44ee00<base, max>|r.\n\n|cff00ee44Tiered:|r Ranged value mode. Allows bidding only specific values. Up to 5 tiers are configurable in |cff44ee00<base, small, medium, large, max>|r."] = "|cff00ee44Precio: |r Modo de valor estático. Solo se admite el valor base de oferta. Permite ofertar cualquier valor en |cff44ee00 <base, max> |r. \n\n|cff00ee44tiered: |r ranged valor modo. Permite ofertar solo valores específicos. Hasta 5 niveles son configurables en |cff44ee00 <base, pequeña, mediana, grande, max> |r."
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:54
CLM.L["|cffcc0000Your Classic Loot Manager is significantly out of date.|r AddOn communication has been disabled. Version %s is available. Please update as soon as possible."] = "|cffcc0000Tu Classic Loot Manager está significativamente desactualizado.|r La comunicación AddOn ha sido deshabilitada. La versión %s está disponible. Actualice lo antes posible. "
end