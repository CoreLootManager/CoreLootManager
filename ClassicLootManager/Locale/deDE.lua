local _, CLM = ...
if GetLocale() == "deDE" then
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:323
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:348
CLM.L[" alt of: "] = " Twink von: "
-- ClassicLootManager/Utils.lua:573
CLM.L[" more"] = " mehr"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:173
CLM.L[" over "] = " Über "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:396
CLM.L[" profile(s)"] = " Profil(e)"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:28
CLM.L["!bid"] = "!bid"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:29
CLM.L["!bidos"] = "!bidos"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:57
CLM.L["!dkp"] = "!dkp"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:278
CLM.L["% that will be decayed."] = "% die verfallen wird."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:341
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:393
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:408
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:454
CLM.L["%Y/%m/%d %H:%M:%S (%A)"] = "%Y/%m/%d %H:%M:%S (%A)"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:253
-- ClassicLootManager_Integrations/Models/Exporter.lua:327
-- ClassicLootManager_Integrations/Models/Exporter.lua:328
CLM.L["%Y/%m/%d %a %H:%M:%S"] = "%Y/%m/%d %a %H:%M:%S"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:591
CLM.L["%d/%m/%Y %H:%M:%S"] = "%d/%m/%Y %H:%M:%S"
-- ClassicLootManager_Alerts/Alerts.lua:24
CLM.L["%s %% %s decay"] = "%s %% %s Zerfall"
-- ClassicLootManager_Alerts/Alerts.lua:22
CLM.L["%s %s"] = "%s %s"
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:191
CLM.L["%s awarded to %s for %s %s"] = "%s an %s für %s %s verliehen"
-- ClassicLootManager/MinimapIcon.lua:37
CLM.L["%s events (%s pending)"] = "%s Events (%s ausstehend)"
-- ClassicLootManager/MinimapIcon.lua:39
CLM.L["%s events (0x%x)"] = "%s Events (0x%x)"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:38
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:68
CLM.L["%s has %s standby"] = "%s hat %s Standby"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:59
CLM.L["%s is not part of the %s roster"] = "%s ist nicht Teil von %s Roster"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:166
CLM.L["%s profile exists."] = "%s Profil existiert."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:168
CLM.L["%s profile missing. Adding."] = "%s Profil fehlt. Wird hinzugefügt."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:480
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:490
CLM.L["%s to %s for %s in <%s>"] = "%s an %s für %s in <%s>"
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:172
CLM.L["%s trade me for %s"] = "%s handel mich an für %s"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:174
CLM.L["%s was not found in guild."] = "%s wurde nicht in der Gilde gefunden."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:101
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:101
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:102
CLM.L["-- All --"] = "-- Alle --"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:170
CLM.L["10 Player (Heroic)"] = "10 Spieler (heroisch)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:168
CLM.L["10 Player"] = "10 Spieler"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:173
CLM.L["20 Player"] = "20 Spieler"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:171
CLM.L["25 Player (Heroic)"] = "25 Spieler (heroisch)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:169
CLM.L["25 Player"] = "25 Spieler"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:172
CLM.L["40 Player"] = "40 Spieler"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:90
CLM.L["<CLM> %s not present in any roster."] = "<CLM> %s in keinem Roster vorhanden."
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:92
CLM.L["<CLM> %s standings in %d %s:"] = "<CLM> %s Tabelle von %d %s:"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:101
CLM.L["<CLM> %s: %d DKP (%d this week)."] = "<CLM> %s: %d DKP (%d diese Woche)."
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:71
CLM.L["<CLM> Missing profile for player %s."] = "<CLM> Fehlendes Profil für Spieler %s."
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:51
CLM.L["<CLM> Your bid (%s) was %s%s."] = "<CLM> Dein Gebot (%s) wurde %s%s."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:860
CLM.L["Accepting rolls on %s for %s %s"] = "Würfeln auf %s akzeptieren für %s %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:150
CLM.L["Action context"] = "Aktionskontext"
-- ClassicLootManager_Integrations/Integrations.lua:160
CLM.L["Action to take upon Gargul loot award event happening during raid."] = "Maßnahmen zur Ausnahme von Gargul Loot AwardEvent während des Schlachtzugs."
-- ClassicLootManager_Integrations/Integrations.lua:265
CLM.L["Action to take upon RCLC loot award event happening during raid. Trigger is based on RCLC award reason or player response if reason is not used. On Integration Enable the buttons will be prefilled with existing ones."] = "Aktion welche nach der Vergabe durch RCLC im Raid stattfinden soll. Auslöser basiert auf den RCLC Vergabegrund oder die Antwort des Spielers falls kein Grund ausgewählt wird. Wenn die Integration aktiviert ist werden die Knöpfe mit diesen befüllt"
-- ClassicLootManager_Integrations/GenericImport.lua:181
CLM.L["Add Profiles to Rosters"] = "Profile zu Roster hinzufügen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:122
CLM.L["Add currently selected target to list."] = "Fügt aktuelles Ziel zur Liste hinzu."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:121
CLM.L["Add target"] = "Ziel hinzufügen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:142
CLM.L["Add to roster"] = "Zum Roster hinzufügen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:592
CLM.L["Add to standby"] = "Zum Standby hinzufügen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:396
CLM.L["Add"] = "Hinzufügen"
-- ClassicLootManager_Integrations/Migration.lua:368
CLM.L["Adding %s loot entries for team to %s"] = "Fügt %s Looteinträge zum Team %s hinzu"
-- ClassicLootManager_Integrations/Migration.lua:227
-- ClassicLootManager_Integrations/Migration.lua:346
CLM.L["Adding %s profiles to %s"] = "Fügt %s Profile hinzu %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:983
CLM.L["Adding missing %s players to current roster"] = "Fügt fehlende %s Spieler zum aktuellen Roster hinzu"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1261
CLM.L["Additional cost (tax) to add to the award value."] = "Zusätzliche Kosten (Steuer) zum Gebotwert hinzufügen."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1229
CLM.L["Additional points to be given to players atop of the split value."] = "Zusätzliche Punkte an Spieler zum Split Wert vergeben."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:145
CLM.L["Addon sounds"] = "Addon Sounds"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:143
CLM.L["Adds selected players to the selected roster (from dropdown)."] = "Fügt ausgewählte Spieler in die ausgewählte Liste (aus Dropdown) hinzu."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:162
CLM.L["Advance to next item after bid"] = "Weiter zum nächsten Gegenstand, nachdem man geboten hat"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:221
CLM.L["Affected players:"] = "Betroffene Spieler:"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:105
CLM.L["Akil'zon"] = "Akil'zon"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:87
CLM.L["Al'ar"] = "Al'ar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:128
CLM.L["Algalon the Observer"] = "Algalon der Beobachter"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:434
CLM.L["All In"] = "All in"
-- ClassicLootManager_Integrations/Migration.lua:29
CLM.L["All migration entries were commited and executed. Congratulations!"] = "Alle Migrierungseinträge wurden gespeichert und ausgeführt. Glückwunsch!"
-- ClassicLootManager/Modules/GUI/Filters.lua:178
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:20
CLM.L["All"] = "Alle"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:76
CLM.L["Allow bidding below minimum points"] = "Gebot unter den Mindestpunkten zulassen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1238
CLM.L["Allow biding more than current standings and ending up with less than minimum standings."] = "Bieten mit aktuellem Punktestand erlauben, auch wenn dies zu einem Punktestand führt der unterhalb des minimalem Punktstand liegt."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1237
CLM.L["Allow biding more than current standings"] = "Gebote größer als die vorhandenen Punkten zulassen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1198
CLM.L["Allow equal bids"] = "Gleiche Gebote erlauben"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:73
CLM.L["Allow going below minimum points"] = "Ermöglichen unter die Minimalpunktzahl zu kommen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:971
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:155
CLM.L["Allow players to subscribe to the bench through Raids menu"] = "Erlaube Spielern sich über das Raid Menü auf die Bank zu setzen."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:970
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:154
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:133
CLM.L["Allow subscription"] = "Erlaube Abonnement"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:498
CLM.L["Alt"] = "Alt"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1190
CLM.L["Always allow All-In bids"] = "All-In Gebote immer erlauben"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1182
CLM.L["Always allow Base bids"] = "Grundgebote immer erlauben"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1063
CLM.L["Always allow cancel/pass"] = "Abbrechen/passen immer erlauben"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:75
CLM.L["Always show"] = "Immer anzeigen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:861
CLM.L["Americas"] = "Amerikas"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:810
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:843
CLM.L["Ammo"] = "Munition"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:101
CLM.L["Anetheron"] = "Anetheron"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:340
CLM.L["Announce award to Guild"] = "Gewinn im Gildenchat posten"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:177
CLM.L["Announce loot from corpse to Raid"] = "Loot von der Leiche posten"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:173
CLM.L["Announce loot"] = "Beute ankündigen"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:195
CLM.L["Announcement loot rarity"] = "Lootseltenheit ankündigen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:711
CLM.L["Anonymous Open"] = "Anonym offen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1095
CLM.L["Anti-snipe time"] = "Anti-Snipe Zeit"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:762
CLM.L["Anti-snipe time: %s."] = "Anti-Snipe Zeit: %s."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:235
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:70
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:492
CLM.L["Anti-snipe"] = "Anti-Snipe"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:35
CLM.L["Anub'Rekhan"] = "Anub'Rekhan"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:142
CLM.L["Anub'arak"] = "Anub'arak"
-- ClassicLootManager/Tooltips.lua:37
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:67
CLM.L["Any"] = "Alle"
-- ClassicLootManager_Integrations/GUI.lua:138
CLM.L["April"] = "April"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:124
CLM.L["Archavon the Stone Watcher"] = "Archavon der Steinbeobachter"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:104
CLM.L["Archimonde"] = "Archimonde"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:168
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:324
CLM.L["Are you sure, you want to award %s to %s for %s %s?"] = "Bist du sicher, dass du %s an %s für %s %s verteilen willst?"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:349
CLM.L["Are you sure, you want to disenchant %s?"] = "Bist du sicher, dass du %s entzaubern willst?"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:738
CLM.L["Ascending"] = "Aufsteigend"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:224
CLM.L["Assistant"] = "Assistent"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:388
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:399
CLM.L["Att. [%]"] = "Att. [%]"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:382
CLM.L["Attendance"] = "Anwesenheit"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:67
CLM.L["Attumen the Huntsman"] = "Attumen der Jäger"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:248
CLM.L["Auction End Countdown"] = "Auktionsende Countdown"
-- ClassicLootManager/MinimapIcon.lua:109
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:222
CLM.L["Auction History"] = "Auktion's Historie"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:232
CLM.L["Auction Start/End"] = "Auktion Start/Ende"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:234
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:67
CLM.L["Auction Time"] = "Auktionszeit"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:55
CLM.L["Auction Type"] = "Auktionstyp"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:83
CLM.L["Auction column"] = "Auktionsspalte"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:658
CLM.L["Auction complete"] = "Auktion komplett"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:270
CLM.L["Auction finished"] = "Auktion fertig"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1087
CLM.L["Auction length in seconds."] = "Auktionslänge in Sekunden."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1086
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:482
CLM.L["Auction length"] = "Auktionslänge"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:250
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:754
CLM.L["Auction of %s items."] = "Auktion von %s Gegenständen."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:254
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:756
CLM.L["Auction of %s"] = "Auktion von %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1029
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:469
CLM.L["Auction settings"] = "Auktionseinstellungen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:649
CLM.L["Auction stopped by Master Looter"] = "Auktion wurde vom Lootmeister gestoppt"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:760
CLM.L["Auction time: %s."] = "Auktionszeit: %s."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:171
CLM.L["Auction timer bar width"] = "Auktions -Timer -Bar Breite"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1149
CLM.L["Auction type"] = "Auktionstyp"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:457
CLM.L["Auctioning - Chat Commands"] = "Versteigerung - Chatbefehle"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:55
CLM.L["Auctioning - History"] = "Auktionshistorie"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:368
CLM.L["Auctioning - List Filling"] = "Versteigerung - Liste ausfüllen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:604
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:612
CLM.L["Auctioning requires active raid or roster mode."] = "Um versteigern zu können muss ein aktivier Schlachtzug oder Roster Modus vorhanden sein."
-- ClassicLootManager/MinimapIcon.lua:104
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:658
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:336
CLM.L["Auctioning"] = "Versteigern"
-- ClassicLootManager_Integrations/GUI.lua:142
CLM.L["August"] = "August"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:129
CLM.L["Auriaya"] = "Auriaya"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:658
CLM.L["Author"] = "Autor"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:978
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:146
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:121
CLM.L["Auto bench leavers"] = "Spieler beim verlassen des Raids automatisch auf die Bank setzen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:349
CLM.L["Auto-assign from corpse"] = "Automatische Zuweisung aus der Leiche"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:358
CLM.L["Auto-trade after award"] = "Gewonnenen Loot automatisch handeln"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:437
CLM.L["Automatically mark auto-removed items as disenchanted"] = "Markieren Sie automatisch automatische Elemente als enttäuscht"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:404
CLM.L["Average weeks"] = "Durchschnittliche Wochen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:248
CLM.L["Award %s %s to %s selected players."] = "Vergebe %s %s an %s ausgewählte Spieler."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:242
CLM.L["Award %s %s to everyone in raid."] = "Vergebe %s %s an alle im Raid."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:244
CLM.L["Award %s %s to everyone in roster."] = "Vergebe %s %s an alle im Roster."
-- ClassicLootManager_Integrations/Integrations.lua:675
CLM.L["Award for Base"] = "Vergebe für die Basispunktzahl"
-- ClassicLootManager_Integrations/Integrations.lua:674
CLM.L["Award for Free"] = "Vergebe kostenlos"
-- ClassicLootManager_Integrations/Integrations.lua:678
CLM.L["Award for Large"] = "Vergebe für große Punktzahl"
-- ClassicLootManager_Integrations/Integrations.lua:679
CLM.L["Award for Max"] = "Vergebe für Maximalpunktzahl"
-- ClassicLootManager_Integrations/Integrations.lua:677
CLM.L["Award for Medium"] = "Vergebe für mittlere Punktzahl"
-- ClassicLootManager_Integrations/Integrations.lua:676
CLM.L["Award for Small"] = "Vergebe für kleine Punktzahl"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:195
CLM.L["Award item"] = "Item verteilen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:914
CLM.L["Award points only to online players"] = "DKP nur an Spieler vergeben, die online sind."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:923
CLM.L["Award points only to players in same zone"] = "DKP nur an Spieler vergeben, die in gleicher Zone sind."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:194
CLM.L["Award points to players based on context."] = "Vergebe Punkte an Spieler basierend auf dem Kontext."
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:136
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:183
CLM.L["Award value"] = "Betrag vergeben"
-- ClassicLootManager/MinimapIcon.lua:123
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:145
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:198
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:235
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1121
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:193
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:309
CLM.L["Award"] = "Vergeben"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:453
CLM.L["Awarded %s points for %s to all players in raid %s"] = "Vergebe %s punkte für %s an alle Spieler des Raids %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:429
CLM.L["Awarded %s points to %s players for %s in <%s>"] = "Vergebe %s punkte an %s Spieler für %s in <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:445
CLM.L["Awarded %s points to all players for %s in <%s>"] = "Vergebe %s punkte an alle Spieler für %s in <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:176
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:242
CLM.L["Awarded by"] = "Vergeben von"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:65
CLM.L["Ayamiss the Hunter"] = "Ayamiss der Jäger"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:103
CLM.L["Azgalor"] = "Azgalor"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:789
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:822
CLM.L["Back"] = "Rücken"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:809
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:842
CLM.L["Bag"] = "Tasche"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:159
CLM.L["Baltharus the Warborn"] = "Baltharus der Warborn"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:12
CLM.L["Baron Geddon"] = "Baron Geddon"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:356
CLM.L["Base value for Static-Priced auction.\nMinimum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Grundwert für statische Auktionen. \nMindestwert für aufsteigende und stufenbasierte Auktion. \n\nAuf denselben Wert wie andere Stufe oder negativ setzen um zu ignorieren."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:891
CLM.L["Base"] = "Standard"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:28
CLM.L["Battleguard Sartura"] = "Schildwache Sartura"
-- ClassicLootManager_Integrations/GUI.lua:316
-- ClassicLootManager_Integrations/GUI.lua:323
-- ClassicLootManager_Integrations/GUI.lua:330
CLM.L["Begin %d days ago, finish today."] = "Beginne vor %d Tagen, beende heute."
-- ClassicLootManager_Integrations/GUI.lua:249
CLM.L["Begin Day"] = "Tag beginnen"
-- ClassicLootManager_Integrations/GUI.lua:260
CLM.L["Begin Month"] = "Monat beginnen"
-- ClassicLootManager_Integrations/GUI.lua:271
CLM.L["Begin Year"] = "Jahr beginnen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:986
CLM.L["Bench multiplier"] = "Bank Multiplikator"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:964
CLM.L["Bench"] = "Bank"
-- ClassicLootManager_Alerts/Alerts.lua:34
CLM.L["Bid %s accepted!"] = "Gebot %s akzeptiert"
-- ClassicLootManager_Alerts/Alerts.lua:42
CLM.L["Bid %s denied!"] = "Gebot %s abgelehnt!"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:866
CLM.L["Bid accepted!"] = "Gebot akzeptiert"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1285
CLM.L["Bid cancelling not allowed"] = "Gebotsabbruch is nicht erlaubt"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:870
CLM.L["Bid denied!"] = "Gebot abgelehnt!"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1283
CLM.L["Bid increment too low"] = "Geboterhöhung ist zu niedrig"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:325
CLM.L["Bid input values as Main spec bid."] = "Gebote als Mainspec abgeben."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:339
CLM.L["Bid input values as Off spec bid."] = "Gebote als Offspec abgeben."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1281
CLM.L["Bid too high"] = "Gebot zu hoch"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1280
CLM.L["Bid too low"] = "Gebot zu niedrig"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:435
CLM.L["Bid your current DKP (%s)."] = "Biete deine aktuellen DKP (%s)."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:324
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:704
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:735
CLM.L["Bid"] = "Bieten"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1279
CLM.L["Bidding over current standings not allowed"] = "Gebot über deinem aktuellem Punktestand verboten"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1278
CLM.L["Bidding while below minimum standings not allowed"] = "Bieten unterhalb der Mindestpunktzahl nicht zulässig"
-- ClassicLootManager/MinimapIcon.lua:119
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1049
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:132
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:219
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:812
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1087
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1180
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:540
CLM.L["Bidding"] = "Bieten"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:264
CLM.L["Bids"] = "Gebote"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:121
CLM.L["Bindings"] = "Bindungen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:354
CLM.L["Black Temple"] = "Schwarzer Tempel"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:217
CLM.L["Blackwing Lair"] = "Pechschwingenhort"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:147
CLM.L["Blood Council"] = "Blood Council"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:56
CLM.L["Bloodlord Mandokir"] = "BLutfürst Mandokir"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:830
CLM.L["Bonuses"] = "Boni's"
-- ClassicLootManager/ClassicLootManager.lua:249
CLM.L["Boot complete"] = "Start fertig"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:521
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:836
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:78
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:236
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:79
CLM.L["Boss Kill Bonus"] = "Boss Kill Bonus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1140
CLM.L["Boss kill award values"] = "Boss Kill Wert"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:20
CLM.L["Broodlord Lashlayer"] = "Brutwächter Dreschbringer"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:112
CLM.L["Brutallus"] = "Brutallus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:64
CLM.L["Buru the Gorger"] = "Buru der Verschlinger"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:995
CLM.L["Button Names"] = "Knopfnamen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:34
CLM.L["C'Thun"] = "C'Thun"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:859
CLM.L["Can't use"] = "Kann nicht benutzt werden"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:372
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:535
CLM.L["Cancel your bid."] = "Dein Gebot abbrechen."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:293
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:421
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:371
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:534
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:863
CLM.L["Cancel"] = "Abbruch"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:755
CLM.L["Change roster name."] = "Rostername ändern."
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:13
CLM.L["Changelog"] = "Änderungsprotokoll"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:172
CLM.L["Changes auction timer bar width."] = "Ändert die Auktions -Timer -Balkenbreite."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1289
CLM.L["Changing bid from Main-spec to Off-Spec not allowed"] = "Bieten von Main-Spec zu Off-Spec nicht erlaubt"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:68
CLM.L["Channel for posting bids."] = "Kanal zum Posten der Gebote."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:240
CLM.L["Chat Commands"] = "Chatbefehle"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:56
CLM.L["Chat bidding is currently disabled."] = "Chatgebote sind momentan ausgeschaltet."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:75
CLM.L["Chess Event"] = "Schachevent"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:791
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:824
CLM.L["Chest (robes)"] = "Brust (Roben)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:790
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:823
CLM.L["Chest"] = "Brust"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:24
CLM.L["Chromaggus"] = "Chromaggus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:635
CLM.L["Classic"] = "Classic"
-- ClassicLootManager/Modules/GUI/Filters.lua:192
CLM.L["Clear all classes."] = "Alle Klassen löschen."
-- ClassicLootManager_Integrations/GUI.lua:474
CLM.L["Clear output"] = "Ausgabe löschen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:270
CLM.L["Clear"] = "Löschen"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:154
CLM.L["Close on bid"] = "Schließen Sie das Gebot"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:211
CLM.L["Comma-separated (CSV) list of disenchanter names. Case insensitive."] = "Durch Kommas getrennte (CSV) Liste mit Namen von Entzauberern. Groß- und Kleinschreibung wird nicht beachtet."
-- ClassicLootManager/Utils.lua:1020
CLM.L["Common"] = "Üblich"
-- ClassicLootManager/MinimapIcon.lua:138
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:309
-- ClassicLootManager_Integrations/GUI.lua:18
CLM.L["Configuration"] = "Konfiguration"
-- ClassicLootManager_Integrations/GenericImport.lua:175
CLM.L["Configure Rosters"] = "Kader konfigurieren"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:791
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:799
CLM.L["Copy settings from selected roster."] = "Einstellungen vom ausgewählten Roster kopieren."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:784
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:790
CLM.L["Copy settings"] = "Einstellungen kopieren"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:798
CLM.L["Copy source"] = "Quelle kopieren"
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:259
CLM.L["Core Loot Manager %s initialization complete. %s"] = "Core Loot Manager %s Initialisierung abgeschlossen. %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI.lua:267
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:13
CLM.L["Core Loot Manager"] = "Core Loot Manager"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:526
CLM.L["Correcting error"] = "Fehler korrigieren"
-- ClassicLootManager_Tracker/Auction.lua:10
CLM.L["Count"] = "Zählen"
-- ClassicLootManager_Integrations/GenericImport.lua:178
CLM.L["Create Profiles"] = "Profile erstellen"
-- ClassicLootManager_Integrations/GenericImport.lua:172
CLM.L["Create Rosters"] = "Dienstpläne erstellen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:194
CLM.L["Create new raid with provided name. You will automatically join this raid and leave any other you are part of."] = "Neuen Raid mit eingegebenen Namen erstellen. Du wirst diesem Raid automatisch beitreten und alle anderen verlassen."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:500
CLM.L["Create raid %s %s in <%s>"] = "Raid erstellen %s %s in <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:193
CLM.L["Create raid"] = "Raid erstellen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1275
-- ClassicLootManager_Integrations/Integrations.lua:251
CLM.L["Create"] = "Erstellen"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:807
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:261
CLM.L["Created"] = "Erstellt"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1276
CLM.L["Creates new roster with default configuration"] = "Erstellt einen neuen Roster mit Standardkonfiguration"
-- ClassicLootManager_Integrations/Integrations.lua:252
CLM.L["Creates new trigger to be used during RCLC award."] = "Erstellt einen neuen Auslöser welcher während der Vergabe durch RCLC genutzt werden kann"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:500
CLM.L["Ctrl + Alt"] = "Ctrl + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:497
CLM.L["Ctrl"] = "Ctrl"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:713
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1087
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:744
CLM.L["Current"] = "Aktuell"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:639
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:640
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:641
CLM.L["DF"] = "DF"
-- ClassicLootManager/Tooltips.lua:100
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:172
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:188
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:687
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:385
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:448
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:458
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:481
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:387
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:296
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1083
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:328
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1104
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:186
-- ClassicLootManager/Utils.lua:1005
CLM.L["DKP"] = "DKP"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:157
CLM.L["DPS"] = "DPS"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:273
CLM.L["Danger Zone - Use at own risk"] = "Achtung! Benutzung auf eigene Gefahr"
-- ClassicLootManager_Integrations/GUI.lua:222
CLM.L["Data"] = "Daten"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:271
CLM.L["Date"] = "Datum"
-- .:indirectly
CLM.L["Death Knight"] = "Death Knight"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:148
CLM.L["Deathbringer Saurfang"] = "Deathbringer Saurfang"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:277
CLM.L["Decay %"] = "Verfall %"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:359
CLM.L["Decay %s%% %s to %s selected players."] = "Verfall von %s%% %s für %s ausgewählte Spieler."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:355
CLM.L["Decay %s%% %s to everyone in roster."] = "Verfall von %s%% %s für alle im Kader."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:305
CLM.L["Decay Negatives"] = "Verfall von Negativen Werten"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:532
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:319
CLM.L["Decay"] = "Verfall"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:437
CLM.L["Decayed %s%% points to %s players in <%s>"] = "%s%% punkte verfallen von %s Spielern <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:461
CLM.L["Decayed %s%% points to all players %s in <%s>"] = "%s%% punkte verfallen von allen Spielern %s in <%s>"
-- ClassicLootManager_Integrations/GUI.lua:146
CLM.L["December"] = "Dezember"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:843
CLM.L["Default Boss Kill Bonus Value"] = "Standard Boss Kill Bonus"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:82
CLM.L["Default Boss Kill Bonus value"] = "Standard Boss Kill Bonus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1115
CLM.L["Default slot values"] = "Standard Slot Wert"
-- .:indirectly
CLM.L["Demon Hunter"] = "Demon Hunter"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:657
CLM.L["Description"] = "Beschreibung"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:291
CLM.L["Disable data synchronisation"] = "Datensynchronisation deaktivieren"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:292
CLM.L["Disable data synchronisation. This might lead to unexpected consequences. Use this at your own risk. Requires /reload to apply."] = "Datensynchronisation deaktivieren. Dies kann zu unerwarteten Konsequenzen führen. Verwendung auf eigene Gefahr! Erfordert /reload um aktiv zu werden."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:495
CLM.L["Disable"] = "Deaktivieren"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:37
CLM.L["Disables display of the changelog for any new version."] = "Deaktiviert die Anzeige des Änderungsprotokolls für neue Versionen."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:436
CLM.L["Disenchant removed items"] = "Enttäuschende Gegenstände"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:336
-- ClassicLootManager_Integrations/Integrations.lua:680
CLM.L["Disenchant"] = "Entzaubern"
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:242
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:26
CLM.L["Disenchanted"] = "Entzaubert"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:205
CLM.L["Disenchanters"] = "Entzauberer"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:282
CLM.L["Display price"] = "Preis anzeigen"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:78
CLM.L["Do not show again"] = "Nicht mehr anzeigen"
-- .:indirectly
CLM.L["Druid"] = "Druide"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1042
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1134
CLM.L["Dynamic Item values"] = "Dynamische Itemwerte"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:550
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:557
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:397
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:440
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:442
-- ClassicLootManager/Utils.lua:1010
CLM.L["EP"] = "EP"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:556
-- ClassicLootManager/Utils.lua:1012
CLM.L["EP/GP"] = "EP/GP"
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:187
CLM.L["EPGP WEB"] = "EPGP WEB"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:688
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1001
CLM.L["EPGP"] = "EPGP"
-- ClassicLootManager_Integrations/ImportCSV.lua:153
-- ClassicLootManager_Integrations/GenericImport.lua:246
CLM.L["ERROR - invalid import data"] = "Fehler - Ungültige Importdaten"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:22
CLM.L["Ebonroc"] = "Schattenschwinge"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:59
CLM.L["Edge of Madness"] = "Mojowahnsinn der Gurubashi"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:125
CLM.L["Emalon the Storm Watcher"] = "Emalon der Sturmbeobachter"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:462
CLM.L["Enable !dkp and !bid through whisper / raid. Change requires /reload."] = "Aktiviert !dkp und !bid über Flüstern / Raidchat. Änderung erfordert /reload."
-- ClassicLootManager_Integrations/Integrations.lua:123
CLM.L["Enable Gargul integration. This will allow Gargul to take control over some aspects of CLM (starting auction from Gargul, and awarding)."] = "Aktivieren Sie die Gargul Integration. Dadurch kann Gargul die Kontrolle über einige Aspekte von CLM (Startauktion von Gargul und Vergabe) übernehmen."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1056
CLM.L["Enable OS bids"] = "Aktivieren Sie OS -Gebote"
-- ClassicLootManager_Integrations/Integrations.lua:238
CLM.L["Enable RCLC integration. This will allow awarding DKP/GP points on RCLC item award. Requires /reload."] = "Aktiviert die RCLC Integration. Dadurch wird die Vergabe von DKP / GP anhand von RCLC ermöglicht. Änderung erfordert /reload."
-- ClassicLootManager_Integrations/Integrations.lua:361
CLM.L["Enable WoW DKP Bot Integration. This will result in additional data stored upon logout."] = "Aktiviert die WoW DKP Bot Integration. Benötigte Daten werden nach dem Logout gespeichert."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:233
CLM.L["Enable announcing auction start and end."] = "Aktiviert die Ankündigung vom Start und Ende der Auktion."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:137
CLM.L["Enable auto-update bid values when current highest bid changes (open auction only)."] = "Aktiviert das automatische Aktualisieren der Gebote wenn sich das höchste Gebot ändert (Nur für offene Auktion)."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:136
CLM.L["Enable auto-update bid values"] = "Aktiviert das automatische Aktualisieren der Gebote"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:461
CLM.L["Enable chat commands"] = "Aktiviert Chatbefehle"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:59
CLM.L["Enable item tracking information in tooltip display."] = "Informationen zur Gegenstandsverfolgung in der Tooltippanzeige einschalten"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:350
CLM.L["Enable loot auto-assign (Master Looter UI) from corpse when item is awarded"] = "Automatische  Beutezuweisung von Leiche aktivieren, wenn ein Gegenstand verliehen wurde."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1221
CLM.L["Enable paid value splitting amongst raiders."] = "Aufteilung des bezahlten Gebotes auf alle Raider."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1183
CLM.L["Enable to allow base bids even if higher bids are present if player didn't bid yet. Affects Open-Ascending Auction."] = "Aktivieren, dass Grundgebote erlaubt sind, auch wenn höhere Gebote bereits platziert wurden, wenn kein Spieler bisher geboten hat. Beeinflusst die Offene-Aufsteigende Auktion ."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1199
CLM.L["Enable to allow equal bids. Affects Open-Ascending Auction."] = "Gleiche Gebote erlauben aktivieren. Beeinflusst die Offene-Aufsteigende Auktion."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1191
CLM.L["Enable to always allow All-In bids. Affects Open-Ascending Auction."] = "Aktivieren Sie immer All-In-Gebote. Beeinflusst die offene Auktion."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1064
CLM.L["Enable to always allow cancelling or passing bids. Affects Open-Ascending Auction."] = "Das Abbrechen oder Passen von Geboten immer erlauben aktivieren. Beeinflusst die Offene-Aufsteigende Auktion."
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:58
CLM.L["Enable tooltip display"] = "Tooltippanzeige einschalten"
-- ClassicLootManager/MinimapIcon.lua:78
CLM.L["Enables / disables minimap Icon"] = "Aktiviert / deaktiviert das Minimap Symbol"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:32
CLM.L["Enables / disables verbose data printing during logging"] = "Aktiviert / Deaktiviert ausführliche Daten während der Logaufzeichnung"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:241
CLM.L["Enables announcing chat commands at auction start."] = "Aktiviert das Ankündigen der Chatbefehle zum Auktionsstart."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:257
CLM.L["Enables announcing loot awards."] = "Aktiviert das Ankündigen von Lootvergaben."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:265
CLM.L["Enables announcing new highest bid (when applicable)."] = "Aktiviert das Ankündigen des neuesten höchsten Gebots (wenn anwendbar)."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:224
CLM.L["Enables announcing raid start and end."] = "Aktiviert das Ankündigen von Raid Start und Ende."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:359
CLM.L["Enables auto-trade awarded loot after auctioning from bag"] = "Aktiviert das automatische Handeln von Loot aus der Tasche nach der Auktion"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:283
CLM.L["Enables displaying item price on tooltip."] = "Aktiviert die Anzeige von Itempreisen im Tooltip"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:249
CLM.L["Enables raid-warning countdown for auctions."] = "Aktiviert Countdown der Auktionen per Raidwarnung."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:744
CLM.L["End Timetravel"] = "Beendet Zeitreise"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:398
CLM.L["End selected raid"] = "Beendet ausgewählten Raid"
-- ClassicLootManager/Utils.lua:1023
CLM.L["Epic"] = "Episch"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:460
CLM.L["Equation"] = "Gleichung"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:114
CLM.L["Eredar Twins"] = "Eredarzwillinge"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:860
CLM.L["Europe"] = "Europa"
-- .:indirectly
CLM.L["Evoker"] = "Evoker"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:320
CLM.L["Execute decay for players based on context."] = "Führen Sie den Verfall für Spieler aus, die auf dem Kontext basieren."
-- ClassicLootManager_Integrations/Migration.lua:431
CLM.L["Execute migration from MonolithDKP, EssentialDKP, CommunityDKP, BastionLoot or CEPGP"] = "Führe Migration von MonolithDKP, EssentialDKP, CommunitiyDKP, BastionLoot oder CEPGP aus"
-- ClassicLootManager_Integrations/Migration.lua:52
CLM.L["Executing Addon Migration with comms disabled."] = "Führe Addon Migration mit deaktivierten Befehlen aus."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:490
CLM.L["Exponent / Base"] = "Exponent / Basis"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:482
CLM.L["Exponential scaling value used by the equations (Base for EPGPWeb, or Exponent for WoWpedia)"] = "Exponentieller Skalierungswert, der von den Gleichungen verwendet wird (Basis für EPGPWEB oder Exponent für Wowpedia)"
-- ClassicLootManager/MinimapIcon.lua:132
-- ClassicLootManager_Integrations/GUI.lua:398
-- ClassicLootManager_Integrations/GUI.lua:407
-- ClassicLootManager_Integrations/GUI.lua:484
-- ClassicLootManager_Integrations/GUI.lua:485
CLM.L["Export"] = "Export"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:84
CLM.L["Extend auction bid list with received item count information. Requires reload."] = "Auktionsliste der Gebote erweitern mit Informationen zur Anzahl der erhaltenen Gegenstände"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:67
CLM.L["Extend tooltip with more specific loot information."] = "Tooltipp mit mehr spezifischen Informationen erweitern"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:66
CLM.L["Extended tooltip"] = "Erweiterter Tooltipp"
-- ClassicLootManager/Modules/GUI/Filters.lua:79
CLM.L["External"] = "Extern"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:143
CLM.L["Faction Champions"] = "Fraktion Champions"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:37
CLM.L["False"] = "Falsch"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:29
CLM.L["Fankriss the Unyielding"] = "Fankriss der Unnachgiebige"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:84
CLM.L["Fathom-Lord Karathress"] = "Tiefenlord Karathress"
-- ClassicLootManager_Integrations/GUI.lua:136
CLM.L["February"] = "Februar"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:797
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:830
CLM.L["Feet"] = "Füße"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:113
CLM.L["Felmyst"] = "Teufelsruch"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:149
CLM.L["Festergut"] = "Festergut"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:372
CLM.L["Fill auction list from corpse"] = "Auktionsliste aus Leiche ausfüllen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:373
CLM.L["Fill auction list with items from corpse. Will happen only if you open the corpse loot window."] = "Auktionsliste mit Gegenstände aus der Leiche ausfüllen. Geschieht nur, wenn das Beutefenster der Leiche geöffnet wird."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:390
CLM.L["Fill auction list with looted items"] = "Auktionsliste mit geplünderten Gegenständen ausfüllen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:391
CLM.L["Fill auction list with looted items. This will automatically add all items you have received."] = "Auktionsliste mit geplünderten Gegenständen ausfüllen. Dies fügt alle von dir erhaltenen Gegenstände automatisch hinzu."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:97
CLM.L["Fill from Guild"] = "Aus Gilde auffüllen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:109
CLM.L["Fill from Raid Roster"] = "Aus Raid Roster auffüllen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:382
CLM.L["Fill from corpse only if you are the Loot Master."] = "Nur von der Leiche aus ausfüllen, wenn man Plündermeister ist."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:400
CLM.L["Fill from loot only if you are using Group Loot."] = "Nur ausfüllen wenn Plündern als Gruppe genutzt wird."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:110
CLM.L["Fill profile list with players in current raid roster."] = "Fülle Profilliste mit Spielern im aktuellen Raid Roster."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:98
CLM.L["Fill profile list with players with the minimum level and ranks."] = "Fülle Profilliste mit Spieler mit Minimumlevel und Rängen."
-- ClassicLootManager/Modules/GUI/Filters.lua:163
CLM.L["Filter"] = "Filter"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:798
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:831
CLM.L["Finger"] = "Finger"
-- ClassicLootManager_Integrations/GUI.lua:282
CLM.L["Finish Day"] = "Endtag"
-- ClassicLootManager_Integrations/GUI.lua:293
CLM.L["Finish Month"] = "Endmonat"
-- ClassicLootManager_Integrations/GUI.lua:304
CLM.L["Finish Year"] = "Endjahr"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:524
CLM.L["Finished raid %s"] = "Raid %s beendet"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:809
CLM.L["Finished"] = "Beendet"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:21
CLM.L["Firemaw"] = "Feuerschwinge"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:130
CLM.L["Flame Leviathan"] = "Flame Leviathan"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:23
CLM.L["Flamegor"] = "Flammenmaul"
-- ClassicLootManager_Integrations/GUI.lua:233
CLM.L["Format"] = "Format"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:163
CLM.L["Found %s in guild."] = "%s in Gilde gefunden."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:131
CLM.L["Freya"] = "Freya"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:220
CLM.L["GM"] = "GM"
-- ClassicLootManager/Tooltips.lua:100
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:551
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:558
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:172
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:188
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:398
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:441
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:469
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:385
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:296
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:328
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1104
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:186
-- ClassicLootManager/Utils.lua:1008
CLM.L["GP"] = "GP"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:60
CLM.L["Gahz'ranka"] = "Gahz'ranka"
-- ClassicLootManager_Integrations/Integrations.lua:116
-- ClassicLootManager_Integrations/Integrations.lua:122
CLM.L["Gargul Integration"] = "Gargul Integration"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:11
CLM.L["Garr"] = "Garr"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:10
CLM.L["Gehennas"] = "Gehennas"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:62
CLM.L["General Rajaxx"] = "General Rajaxx"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:132
CLM.L["General Vezax"] = "General Vezax"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:160
CLM.L["General Zarithrian"] = "General Zarithrian"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:749
CLM.L["General settings"] = "Allgemeine Einstellungen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:784
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:817
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:96
CLM.L["Global"] = "Global"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:40
CLM.L["Gluth"] = "Gluth"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:15
CLM.L["Golemagg the Incinerator"] = "Golemagg der Verbrenner"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:46
CLM.L["Gothik the Harvester"] = "Gothik der Seelenjäger"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:36
CLM.L["Grand Widow Faerlina"] = "Großwitwe Faerlina"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:39
CLM.L["Grobbulus"] = "Grobbulus"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:399
CLM.L["Group Loot Only"] = "Nur Plündern als Gruppe"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:79
CLM.L["Gruul the Dragonkiller"] = "Gruul der Drachenschlächter"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:317
CLM.L["Gruul's Lair"] = "Gruuls Unterschlupf"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:95
CLM.L["Gurtogg Bloodboil"] = "Gurtogg Siedeblut"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:58
CLM.L["Hakkar"] = "Hakkar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:108
CLM.L["Halazzi"] = "Halazzi"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:162
CLM.L["Halion"] = "Halion"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:794
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:827
CLM.L["Hands"] = "Hände"
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:72
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:616
CLM.L["Hard Mode"] = "Hardmodus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:955
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:106
CLM.L["Hard cap"] = "Oberes Limit"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:785
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:818
CLM.L["Head"] = "Kopf"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:156
CLM.L["Healer"] = "Heiler"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:43
CLM.L["Heigan the Unclean"] = "Heigan der Unreine"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:803
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:836
CLM.L["Held In Off-hand"] = "In Schildhand geführt"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs_Retail.lua:31
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:640
CLM.L["Heroic"] = "Heroic"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:109
CLM.L["Hex Lord Malacrass"] = "Hexlord Malacrass"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:203
CLM.L["Hide in combat"] = "Im Kampf verstecken"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:471
CLM.L["Hides incoming !dkp and !bid whispers. Change requires /reload."] = "Versteckt Whisper von Spielern durch !dkp und !bid. Änderung erfordert /reload."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:480
CLM.L["Hides outgoing !dkp and !bid responses. Change requires /reload."] = "Versteckt Antworten im Whisper an Spieler durch !dkp und !bid. Änderung erfordert /reload."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:89
CLM.L["High Astromancer Solarian"] = "Hochastromantin Solarian"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:78
CLM.L["High King Maulgar"] = "Hochkönig Maulgar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:51
CLM.L["High Priest Thekal"] = "Hohepriester Thekal"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:52
CLM.L["High Priest Venoxis"] = "Hohepriester Venoxis"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:53
CLM.L["High Priestess Arlokk"] = "Hohepriesterin Arlokk"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:54
CLM.L["High Priestess Jeklik"] = "Hohepriesterin Jeklik"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:55
CLM.L["High Priestess Mar'li"] = "Hohepriesterin Mar'li"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:91
CLM.L["High Warlord Naj'entus"] = "Oberster Kriegsfürst Naj'entus"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:136
CLM.L["History type"] = "Verlaufstyp"
-- .:indirectly
CLM.L["History"] = "Verlauf"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:133
CLM.L["Hodir"] = "Hodir"
-- .:indirectly
CLM.L["Hunter"] = "Jäger"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:81
CLM.L["Hydross the Unstable"] = "Hydross der Unstete"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:369
CLM.L["Hyjal Summit"] = "Hyjalgipfel"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:486
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:603
CLM.L["Icecrown Citadel"] = "Icecrown Citadel"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:151
CLM.L["Icecrown Gunship Battle"] = "Eiskrone Luftschiff Kampf"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:134
CLM.L["Ignis the Furnace Master"] = "Ignis der Ofenmeister"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:98
CLM.L["Ignore entry"] = "Eintrag ignorieren"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:445
CLM.L["Ignore"] = "Ignorieren"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:99
CLM.L["Illidan Stormrage"] = "Illidan Sturmgrimm"
-- ClassicLootManager_Integrations/Migration.lua:246
-- ClassicLootManager_Integrations/Migration.lua:380
-- ClassicLootManager_Integrations/Migration.lua:423
CLM.L["Import complete"] = "Importieren fertiggestellt"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:531
-- ClassicLootManager_Integrations/ImportCSV.lua:100
-- ClassicLootManager_Integrations/ImportCSV.lua:162
-- ClassicLootManager_Integrations/ImportCSV.lua:163
-- ClassicLootManager_Integrations/ImportCSV.lua:191
-- ClassicLootManager_Integrations/GenericImport.lua:222
-- ClassicLootManager_Integrations/GenericImport.lua:255
-- ClassicLootManager_Integrations/GenericImport.lua:256
-- ClassicLootManager_Integrations/GenericImport.lua:263
CLM.L["Import"] = "Importieren"
-- ClassicLootManager_Integrations/Migration.lua:197
CLM.L["Importing %s entries from DKPTable"] = "Importiere %s Einträgen von der DKP Liste"
-- ClassicLootManager_Integrations/Migration.lua:308
CLM.L["Importing profiles from DKPTable"] = "Profile von der DKP Liste importieren"
-- ClassicLootManager/Modules/GUI/Filters.lua:78
CLM.L["In Guild"] = "In Gilde"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:808
CLM.L["In Progress"] = "Im Gange"
-- ClassicLootManager/Modules/GUI/Filters.lua:75
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:289
CLM.L["In Raid"] = "Im Raid"
-- ClassicLootManager/MinimapIcon.lua:48
CLM.L["In-Sync"] = "Synchronisiert"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:905
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:138
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:124
CLM.L["Include bench"] = "Bank mit einbeziehen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:906
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:139
CLM.L["Include benched players in all auto-awards"] = "Beziehe die Bank in alle automatischen Punkte mit ein"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:306
CLM.L["Include players with negative standings in decay."] = "Beziehe Spieler mit negativer Wertung in Verfall mit ein."
-- ClassicLootManager/MinimapIcon.lua:46
CLM.L["Incoherent state"] = "Zumsammenhangsloser Zustand"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:261
CLM.L["Info"] = "Info"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:438
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:444
CLM.L["Information"] = "Information"
-- ClassicLootManager_Integrations/ImportCSV.lua:73
CLM.L["Input CSV Item value override data"] = "Wähle CSV Itemwerte zum überschreiben"
-- ClassicLootManager_Integrations/GenericImport.lua:199
CLM.L["Input JSON exported standings"] = "Wähle JSON exportierte Punktestände"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:158
CLM.L["Input name: %s"] = "Füge Namen ein: %s"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:45
CLM.L["Instructor Razuvious"] = "Instrukteur Razuvious"
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:136
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:141
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:146
-- ClassicLootManager_Integrations/ClassicLootManager_Integrations.lua:20
CLM.L["Integrations"] = "Integrationen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:100
CLM.L["Interval Bonus time"] = "Intervall Bonuszeit"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:533
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:881
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:115
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:248
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:97
CLM.L["Interval Bonus"] = "Intervall Bonus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:888
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:122
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:250
CLM.L["Interval Time"] = "Intervall Zeit"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:897
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:130
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:251
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:103
CLM.L["Interval Value"] = "Intervall Wert"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:889
CLM.L["Interval in [minutes] to award bonus points"] = "Intervall in [Minuten] um Bonuspunkte zu gewähren"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1282
CLM.L["Invalid bid value"] = "Ungültiger Gebotswert"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:353
CLM.L["Invalid context. You should not decay raid only."] = "Ungültiger Kontext. Du kannst nicht nur den Raid verfallen lassen."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:16
CLM.L["Invalid item link"] = "Ungültiger Gegenstandslink"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1288
CLM.L["Invalid item"] = "Ungültiger Gegenstand"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:50
CLM.L["Invalid value provided"] = "Ungültiger Wert eingegeben"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:58
CLM.L["Item Value Mode"] = "Gegenstandswert Modus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1034
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1206
CLM.L["Item value mode"] = "Gegenstandswert Modus"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:22
CLM.L["Item value must be positive"] = "Gestandswertswert muss im Positiven liegen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1128
CLM.L["Item value overrides"] = "Überschreibe den Gegenstandswert"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:90
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:100
CLM.L["Item"] = "Gegenstand"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:107
CLM.L["Jan'alai"] = "Jan'alai"
-- ClassicLootManager_Integrations/GUI.lua:135
CLM.L["January"] = "Januar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:57
CLM.L["Jin'do the Hexxer"] = "Jin'do der Verhexer"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:81
CLM.L["Join our discord for more info: "] = "Für mehr Informationen kommt auf unseren Discord: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:412
CLM.L["Join selected raid"] = "Dem ausgewählten Raid beitreten"
-- ClassicLootManager_Integrations/GUI.lua:141
CLM.L["July"] = "Juli"
-- ClassicLootManager_Integrations/GUI.lua:140
CLM.L["June"] = "Juni"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:90
CLM.L["Kael'thas Sunstrider"] = "Kael'thas Sonnenwanderer"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:111
CLM.L["Kalecgos"] = "Kalecgos"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:300
CLM.L["Karazhan"] = "Karazhan"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:102
CLM.L["Kaz'rogal"] = "Kaz'rogal"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:49
CLM.L["Kel'Thuzad"] = "Kel'Thuzad"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:116
CLM.L["Kil'jaeden"] = "Kil'jaeden"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:135
CLM.L["Kologarn"] = "Kologarn"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:126
CLM.L["Koralon the Flame Watcher"] = "Koralon der Flame Watcher"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:61
CLM.L["Kurinnaxx"] = "Kurinnaxx"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:152
CLM.L["Lady Deathwhisper"] = "Lady Deathwhisper"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:86
CLM.L["Lady Vashj"] = "Lady Vashj"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:368
CLM.L["Large value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Großer Wert für stufenbasierte Auktion. \n\n Auf denselben Wert wie andere Stufe oder negativ setzen zum ignorieren."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:894
CLM.L["Large"] = "Groß"
-- ClassicLootManager_Integrations/GUI.lua:322
CLM.L["Last month"] = "Im vergangenen Monat"
-- ClassicLootManager_Integrations/GUI.lua:315
CLM.L["Last week"] = "Letzte Woche"
-- ClassicLootManager_Integrations/GUI.lua:329
CLM.L["Last year"] = "Vergangenes Jahr"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:458
CLM.L["Latest loot"] = "Letzte Beute"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:481
CLM.L["Latest points"] = "Neueste Punkte"
-- ClassicLootManager/Utils.lua:1024
CLM.L["Legendary"] = "Legendär"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:796
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:829
CLM.L["Legs"] = "Beine"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:83
CLM.L["Leotheras the Blind"] = "Leotheras der Blinde"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:79
CLM.L["Link Alt to Main"] = "Verknüpfe Twink mit dem Main"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:534
CLM.L["Linking override"] = "Verknüpfung überschreiben"
-- ClassicLootManager/MinimapIcon.lua:42
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:378
CLM.L["Loading..."] = "Lädt..."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:44
CLM.L["Loatheb"] = "Loatheb"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:264
CLM.L["Lock selected"] = "Ausgewählte sperren"
-- ClassicLootManager/Modules/GUI/Filters.lua:81
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:426
CLM.L["Locked"] = "Gesperrt"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:22
CLM.L["Logging level"] = "Aufzeichnungs Level"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:18
CLM.L["Logging"] = "Aufzeichnung"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:256
CLM.L["Loot Awards"] = "Loot Gewinne"
-- ClassicLootManager_Integrations/GUI.lua:21
CLM.L["Loot History"] = "Loot Verlauf"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:408
CLM.L["Loot rarity"] = "Plünderrarität"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:21
CLM.L["Loot"] = "Beute"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:144
CLM.L["Lord Jaraxxus"] = "Lord Jaraxxus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:153
CLM.L["Lord Marrowgar"] = "Lord Marrowgar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:8
CLM.L["Lucifron"] = "Lucifron"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:115
CLM.L["M'uru"] = "M'uru"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:418
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:324
-- ClassicLootManager_Integrations/Integrations.lua:136
-- ClassicLootManager_Integrations/Integrations.lua:141
CLM.L["MS"] = "MS"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:37
CLM.L["Maexxna"] = "Maexxna"
-- .:indirectly
CLM.L["Mage"] = "Magier"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:9
CLM.L["Magmadar"] = "Magmadar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:80
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:325
CLM.L["Magtheridon"] = "Magtheridon"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:69
CLM.L["Maiden of Virtue"] = "Tugendhafte Maid"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:801
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:834
CLM.L["Main Hand"] = "Waffenhand"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:173
CLM.L["Main"] = "Main"
-- ClassicLootManager/Modules/GUI/Filters.lua:80
CLM.L["Mains"] = "Mains"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:16
CLM.L["Majordomo Executus"] = "Majordomus Exekutus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:123
CLM.L["Malygos"] = "Malygos"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:146
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:71
CLM.L["Management"] = "Management"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:222
CLM.L["Manager"] = "Manager"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:527
CLM.L["Manual adjustment"] = "Manuelle Anpassung"
-- ClassicLootManager_Integrations/GUI.lua:137
CLM.L["March"] = "Marsch"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:381
CLM.L["Master Loot Only"] = "Nur Plündermeister"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:895
CLM.L["Max"] = "Маximum"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:947
CLM.L["Maximum point cap player can receive per raid week. Set to 0 to disable."] = "Maximale Punnkte die ein Spieler pro Woche erhalten kann. Zum Ausschalten auf 0 setzen."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:956
CLM.L["Maximum point cap that player can have. Set to 0 to disable."] = "Maximale Punkte die ein Spieler erhalten kann. Zum Ausschalten auf 0 setzen."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:372
CLM.L["Maximum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Maximaler Wert für aufsteigende und stufenbasierte Auktion. \n\nDenselben Wert wie andere Stufe oder negativ setzen zum ignorieren."
-- ClassicLootManager_Integrations/GUI.lua:139
CLM.L["May"] = "Mai"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:364
CLM.L["Medium value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Mittlerer Wert für stufenbasierte Auktion. \n\nDenselben Wert wie andere Stufe oder negativ setzen zum ignorieren."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:893
CLM.L["Medium"] = "Mittel"
-- ClassicLootManager/MinimapIcon.lua:100
CLM.L["Menu"] = "Menü"
-- ClassicLootManager_Integrations/Migration.lua:184
-- ClassicLootManager_Integrations/Migration.lua:262
-- ClassicLootManager_Integrations/Migration.lua:391
CLM.L["Migrating %s"] = "Migration %s"
-- ClassicLootManager_Integrations/Migration.lua:66
CLM.L["Migration complete. %s to apply and sync with others or go to %s to discard."] = "Migration fertig. %s zum Anwenden und synchronisieren oder gehe zu %s zum verwerfen."
-- ClassicLootManager_Integrations/Migration.lua:285
CLM.L["Migration failure: Detected 0 teams"] = "Migratiosfehler: 0 Teams erkannt"
-- ClassicLootManager_Integrations/Migration.lua:223
-- ClassicLootManager_Integrations/Migration.lua:339
CLM.L["Migration failure: Unable to create profiles"] = "Migrationsfehler: Konnte keine Profile erstellen"
-- ClassicLootManager_Integrations/Migration.lua:35
CLM.L["Migration ongoing: %s(%s)"] = "Migration im Gange: %s(%s)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:136
CLM.L["Mimiron"] = "Mimiron"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:118
CLM.L["Min bid increment"] = "Minimale Gebotssteigerung"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1251
CLM.L["Minimal increment"] = "Minimale Steigerung"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1252
CLM.L["Minimal value increment for open auction mode."] = "Minimale Gebotssteigerung bei offener Auktion."
-- ClassicLootManager_Integrations/Migration.lua:68
CLM.L["Minimap Icon -> Configuration -> Wipe events"] = "Minimapsymbol -> Konfiguration -> Events löschen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1009
CLM.L["Minimum GP used in calculations when player has less GP than this value."] = "Der in Berechnungen verwendete Minimum GP, wenn der Spieler weniger GP als dieser Wert hat."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1008
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:142
CLM.L["Minimum GP"] = "Minimaler GP"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:84
CLM.L["Minimum Level"] = "Minimales Level"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:85
CLM.L["Minimum level of players to fill from guild."] = "Minimales Level der Spieler, welche von der Gilde gefüllt werden."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:139
CLM.L["Minimum points (DKP / EP)"] = "Mindestpunkte (DKP / EP)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1072
CLM.L["Minimum standing required to be allowed to bid."] = "Erfordert minimalen Punktestand um bieten zu können."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1071
CLM.L["Minimum standing"] = "Minimaler Punktestand"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:238
CLM.L["Missing award value"] = "Fehlender Preiswert"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:349
CLM.L["Missing decay value"] = "Fehlender Zerfallwert"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:55
CLM.L["Missing profile %s"] = "Fehlendes Profil %s"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:33
CLM.L["Missing roster name and you are not in raid"] = "Rostername fehlt und du bist nicht in einem Schlachtzug"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:37
CLM.L["Missing roster name. Using Raid Info"] = "Rostername fehlt. Benutze Schlachtzug Information"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:321
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:393
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:432
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:461
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:495
CLM.L["Missing valid raid"] = "Gültiger Schlachtzug fehlt"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:63
CLM.L["Moam"] = "Moam"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:239
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:417
CLM.L["Modifier combination"] = "Modifikator Kombination"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:201
CLM.L["Molten Core"] = "Geschmolzener Kern"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:68
CLM.L["Moroes"] = "Moroes"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:85
CLM.L["Morogrim Tidewalker"] = "Morogrim Gezeitenwandler"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:97
CLM.L["Mother Shahraz"] = "Mutter Shahraz"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:232
CLM.L["Moving %s from current queue to pending queue."] = "Umzug %s von der aktuellen Warteschlange zur ausstehenden Warteschlange."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:444
CLM.L["Multiple"] = "Mehrere"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:545
CLM.L["Multiplier for tier %s (if used by the auction type)."] = "Multiplikator für Tier %s (bei Verwendung des Auktionstyps)."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:468
CLM.L["Multiplier used by the equations"] = "Von den Gleichungen verwendeter Multiplikator"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:476
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1121
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:291
CLM.L["Multiplier"] = "Multiplikator"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs_Retail.lua:32
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:641
CLM.L["Mythic"] = "Mythic"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:106
CLM.L["Nalorakk"] = "Nalorakk"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:754
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:384
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:395
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:259
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:172
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:701
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:732
CLM.L["Name"] = "Name"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:145
CLM.L["Named Buttons"] = "Benannte Knöpfe"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:246
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:407
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:524
CLM.L["Naxxramas"] = "Naxxramas"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:786
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:819
CLM.L["Neck"] = "Hals"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:25
CLM.L["Nefarian"] = "Nefarian"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:74
CLM.L["Netherspite"] = "Nethergroll"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:36
CLM.L["Never show changelog"] = "Niemals das Änderungsprotokoll (Changelog) zeigen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1101
CLM.L["New highest bid on %s: %s %s %s"] = "Neues Höchstgebot für %s: %s %s %s"
-- ClassicLootManager_Integrations/GenericImport.lua:105
CLM.L["New roster: %s"] = "Neuer Kader: %s"
-- ClassicLootManager_Integrations/Migration.lua:111
CLM.L["New roster: [%s]"] = "Neuer Kader: [%s]"
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:57
CLM.L["New version %s of Core Loot Manager is available. For best experience please update the AddOn."] = "Neue Version %s von Core Loot Manager vorhanden. Bitte das Addon updaten für das beste Erlebnis"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:77
CLM.L["Nightbane"] = "Schrecken der Nacht"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1284
CLM.L["No auction in progress"] = "Keine Auktion im Gange"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:876
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:193
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:179
CLM.L["No bids"] = "Keine Gebote"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:475
CLM.L["No loot received"] = "Keine Beute erhalten"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:225
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:338
CLM.L["No players selected"] = "Keine Spieler ausgewählt"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:500
CLM.L["No points received"] = "Keine Punkte erhalten"
-- ClassicLootManager/Utils.lua:582
CLM.L["No"] = "Nein"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:808
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:841
CLM.L["Non-equippable"] = "Nicht ausrüstbar"
-- ClassicLootManager/Modules/GUI/Filters.lua:191
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:300
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:223
-- ClassicLootManager_Integrations/Integrations.lua:673
CLM.L["None"] = "Kein"
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:71
CLM.L["Normal Mode"] = "Normalmodus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs_Retail.lua:30
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:639
CLM.L["Normal"] = "Normal"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:145
CLM.L["Northrend Beasts"] = "Northrend Beasts"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1277
CLM.L["Not in a roster"] = "Nicht in einem Roster"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:595
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:640
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:549
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:278
CLM.L["Not in raid"] = "Nicht in einem Schlachtzug"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:161
CLM.L["Note to be added to award. Max 25 characters. It is recommended to not include date nor selected reason here. If you will input encounter ID it will be transformed into boss name."] = "Notiz, welcher der Vergabe hinzugefügt wird. Max 25 Zeichen. Es wird empfohlen, hier weder Datum noch den ausgewählte Grund einzuschließen. Wenn Sie die Boss-ID eingeben, wird sie in den Boss Namen umgewandelt."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:159
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:233
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:119
CLM.L["Note"] = "Notiz"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:42
CLM.L["Noth the Plaguebringer"] = "Noth der Seuchenfürst"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:353
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:520
CLM.L["Notify that you are passing on the item."] = "Melden das man auf einen Gegenstand passt."
-- ClassicLootManager_Integrations/GUI.lua:145
CLM.L["November"] = "November"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:654
CLM.L["Num"] = "Nummer"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1055
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:419
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:338
-- ClassicLootManager_Integrations/Integrations.lua:146
-- ClassicLootManager_Integrations/Integrations.lua:151
CLM.L["OS"] = "OS"
-- ClassicLootManager_Integrations/GUI.lua:144
CLM.L["October"] = "Oktober"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:802
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:835
CLM.L["Off Hand"] = "Schildhand"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1287
CLM.L["Off-spec bidding not allowed"] = "Off-Spec-Gebote nicht erlaubt"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:858
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:92
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:240
CLM.L["On Time Bonus Value"] = "Wert für Pünktlichkeits Bonus"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:88
CLM.L["On Time Bonus value"] = "Wert für Pünktlichkeits Bonus"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:520
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:851
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:85
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:238
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:85
CLM.L["On Time Bonus"] = "Pünktlichkeits Bonus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:800
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:833
CLM.L["One-Hand"] = "Einhändig"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:913
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:127
CLM.L["Online only"] = "Nur online"
-- ClassicLootManager/Modules/GUI/Filters.lua:76
CLM.L["Online"] = "Online"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:186
CLM.L["Only when ML/RL"] = "Nur wenn ML/RL"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:7
CLM.L["Onyxia"] = "Onyxia"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:194
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:504
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:621
CLM.L["Onyxia's Lair"] = "Onyxias Hort"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:122
CLM.L["Open Key Bindings UI for AddOns"] = "Die Tastaturbelegungs-UI für Addons öffnen"
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:55
CLM.L["Open trade"] = "Handel öffnen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:708
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:715
CLM.L["Open"] = "Offen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:70
CLM.L["Opera Hall"] = "Schach Event"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:66
CLM.L["Ossirian the Unscarred"] = "Ossirian der Narbenlose"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1245
CLM.L["Other"] = "Sonstiges"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:33
CLM.L["Ouro"] = "Ouro"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:74
CLM.L["Overrides"] = "Überschreibt"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1229
CLM.L["PASS"] = "PASSE"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1017
CLM.L["PR Rounding"] = "PR Runden"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:396
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1085
CLM.L["PR"] = "PR"
-- .:indirectly
CLM.L["Paladin"] = "Paladin"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:287
CLM.L["Participated"] = "Teilgenommen"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:293
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:420
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:352
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:519
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:863
CLM.L["Pass"] = "Passe"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1286
CLM.L["Passing after bidding not allowed"] = "Passen ist nach dem Bieten nicht erlaubt."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:38
CLM.L["Patchwerk"] = "Flickwerk"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:121
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:124
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:272
CLM.L["Player"] = "Spieler"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:360
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:373
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:390
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:404
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:418
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:437
CLM.L["Please select a raid"] = "Bitte einen Schlachtzug auswählen"
-- ClassicLootManager_Integrations/GUI.lua:20
CLM.L["Point History"] = "Punktehistorie"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:987
CLM.L["Point award multiplier for players on bench."] = "Point Award Multiplikator für Spieler auf der Bank."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:931
CLM.L["Point caps"] = "Punktelimit"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:761
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1292
CLM.L["Point type"] = "Punktetyp"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:22
CLM.L["Point"] = "Punkt"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:184
CLM.L["Points value that will be awarded."] = "Punktewert, der vergeben wird."
-- ClassicLootManager/Utils.lua:1019
CLM.L["Poor"] = "Schlecht"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:67
CLM.L["Post bids"] = "Gebote posten"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:67
CLM.L["Post channel"] = "Kanal zum Posten"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:278
CLM.L["Price Tooltips"] = "Preis im Tooltip"
-- .:indirectly
CLM.L["Priest"] = "Priester"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:76
CLM.L["Prince Malchezaar"] = "Prinz Malchezaar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:31
CLM.L["Princess Huhuran"] = "Prinzessin Huhuran"
-- ClassicLootManager_Integrations/Integrations.lua:141
-- ClassicLootManager_Integrations/Integrations.lua:151
CLM.L["Prioritized"] = "Priorisiert"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:154
CLM.L["Professor Putricide"] = "Professor Patrikmide"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:273
CLM.L["Profile %s already exists and is used by different GUID %s (%s). "] = "Profil %s existiert bereits und wird von anderer Guid %s ( %s) verwendet."
-- .:indirectly
CLM.L["Profiles"] = "Profile"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:523
CLM.L["Progression Bonus"] = "Fortschritts Bonus"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:387
CLM.L["Provide number of raids needed for 100% attendance in a weekly reset. Between 1 - 50 raids. Defaults to 2. Requires /reload."] = "Anzahl der Schlachtzüge in einer Woche angeben um 100% Beteiligung zu erhalten. Zwischen 1 - 50 Schlachtzügen. Voreingstellt ist 2. Erfordert /reload."
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:405
CLM.L["Provide number of weeks that will be accounted for attendance. Between 1 - 1000 weeks. Defaults to 10. Requires /reload."] = "Anzahl der Wochen angeben, welche für die Beteiligung angerechnet werden sollen. Zwischen 1 - 1000 Wochen. Voreingestellt sind 10. Erfordert /reload."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:112
CLM.L["Prune profiles"] = "Profile löschen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:979
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:147
CLM.L["Put players leaving raid on bench instead of removing them. To remove them completely they will need to be removed manually from the bench."] = "Spieler welche den Schlachtzug verlassen, auf die Bank setzten anstatt sie zu entfernen. Um sie vollständig zu entfernen, müssen sie manuell von der Bank (Standby) entfernt werden"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:155
CLM.L["Queen Lana'thel"] = "Königin Lana'thel"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:812
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:845
CLM.L["Quiver"] = "Köcher"
-- ClassicLootManager_Integrations/Integrations.lua:231
-- ClassicLootManager_Integrations/Integrations.lua:237
CLM.L["RCLC Integration"] = "RCLC Integration"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:689
CLM.L["ROLL"] = "Würfeln"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:100
CLM.L["Rage Winterchill"] = "Furor Winterfrost"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:17
CLM.L["Ragnaros"] = "Ragnaros"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:245
CLM.L["Raid Completion Bonus Value"] = "Raidabschluss Bonuswert"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:94
CLM.L["Raid Completion Bonus value"] = "Raidabschluss Bonuswert"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:522
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:866
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:100
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:243
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:91
CLM.L["Raid Completion Bonus"] = "Raid Abschlussbonus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:873
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:107
CLM.L["Raid Completion Value"] = "Raid Abschlusswert"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:183
CLM.L["Raid Name"] = "Schlachtzugsname"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:223
CLM.L["Raid Start/End"] = "Schlachtzug Beginn/Ende"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:219
CLM.L["Raid Warnings"] = "Schlachtzugswarnungen"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:425
CLM.L["Raid [%s] ended"] = "Schlachtzug [%s] beendet"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:373
CLM.L["Raid [%s] started"] = "Schlachtzug [%s] gestartet"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:311
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:333
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:405
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:448
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:473
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:507
CLM.L["Raid management is disabled during time traveling."] = "Schlachtzug Management ist deaktiviert wärend der Zeitreise"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:774
CLM.L["Raid"] = "Überfallen"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:39
CLM.L["Raid: %s Roster: %s"] = "Schlachtzug : %s Roster : %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:386
CLM.L["Raids needed in reset"] = "Benötigte Schlachtzüge in einem Reset"
-- ClassicLootManager_Integrations/GUI.lua:22
CLM.L["Raids"] = "Schlachtzüge"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:807
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:840
CLM.L["Ranged (wands)"] = "Distanz (Zauberstäbe)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:806
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:839
CLM.L["Ranged"] = "Fernkampf"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:75
CLM.L["Ranks"] = "Ränge"
-- ClassicLootManager/Utils.lua:1022
CLM.L["Rare"] = "Selten"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:18
CLM.L["Razorgore the Untamed"] = "Razorgore der Ungezähmte"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:137
CLM.L["Razorscale"] = "Rasiermesser"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:174
CLM.L["Reason"] = "Grund"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:387
CLM.L["Received"] = "Erhalten"
-- ClassicLootManager_Integrations/Integrations.lua:136
-- ClassicLootManager_Integrations/Integrations.lua:146
CLM.L["Regular"] = "Regulär"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:813
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:846
CLM.L["Relic"] = "Relikt"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:96
CLM.L["Reliquary of Souls"] = "Reliquiar der Seelen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:271
CLM.L["Remove all items from auction list. Populates new one if there are any pending."] = "Alle Gegenstände von der Auktionsliste löschen. Eine neue wird erstellt, sofern noch Gegenstände ausstehen."
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:104
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:81
CLM.L["Remove all"] = "Alle entfernen"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:80
CLM.L["Remove auction"] = "Auktion entfernen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:686
CLM.L["Remove from roster"] = "Vom Roster löschen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:637
CLM.L["Remove from standby"] = "Von Standby entfernen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:282
CLM.L["Remove item from auction list after it's awarded."] = "Gegenstand von der Auktionsliste entfernen, nachdem er verliehen wurde."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:428
CLM.L["Remove items without bids from auction list. This will make marking items as disenchanted not possible."] = "Entfernen Sie Elemente ohne Gebote aus der Auktionsliste. Dadurch wird Markierungsgegenstände nicht möglich."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:427
CLM.L["Remove items without bids"] = "Elemente ohne Gebote entfernen"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:93
CLM.L["Remove old"] = "Alt entfernen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:280
CLM.L["Remove on award"] = "Nach Verleihung entfernen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:602
CLM.L["Remove override"] = "Überschreiben entfernen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:815
CLM.L["Remove roster"] = "Roster entfernen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:431
CLM.L["Remove selected raid"] = "Ausgewählten Raid entfernen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:286
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:470
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:754
CLM.L["Remove selected"] = "Ausgewählte entfernen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:821
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:396
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:281
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:68
CLM.L["Remove"] = "Entfernen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:822
CLM.L["Removes current roster."] = "Aktuelles Roster etnfernen."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:228
CLM.L["Removing %s from current queue."] = "%s aus der aktuellen Warteschlange entfernen."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:225
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:620
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:699
CLM.L["Removing items not allowed during auction."] = "Gegenstände entfernen, welche nicht während einer Auktion erlaubt sind."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:354
CLM.L["Request standby"] = "Standby beantragen"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:101
CLM.L["Rescales CLM UI, except Bidding window. You can rescale Bidding window independently by using Ctrl + Mouse Wheel. Some windows may require closing and reopening."] = "Skaliert das CLM UI um, ausser dem Bietfenster. Mit Strg + Mausrad kannst du das Bietfenster unabhängig umskalieren. Einige Fenster erfordern eventuell das schließen und wieder öffnen."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:182
CLM.L["Reset gui positions"] = "Position vom GUI zurücksetzen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:367
CLM.L["Revoke standby"] = "Standby widerrufen"
-- .:indirectly
CLM.L["Rogue"] = "Schurke"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:174
CLM.L["Role"] = "Rolle"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1104
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1105
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:717
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:520
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:749
CLM.L["Roll"] = "Würfeln"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:893
CLM.L["Rolling complete"] = "Würfeln beendet"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1284
CLM.L["Roster Name"] = "Rostername"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1283
CLM.L["Roster name"] = "Rostername"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:108
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:125
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:773
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:306
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:113
-- ClassicLootManager_Integrations/ImportCSV.lua:91
CLM.L["Roster"] = "Roster"
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:135
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:140
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:145
CLM.L["Rosters"] = "Roster"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:156
CLM.L["Rotface"] = "Fäulnis"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1018
CLM.L["Round PR to selected number of decimals"] = "Auf ausgewählte Dezimalstellen PR aufrunden"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:775
CLM.L["Round to selected number of decimals"] = "Auf ausgewählte Dezimalstellen aufrunden"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:115
CLM.L["Round to"] = "Aufrunden auf"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:774
CLM.L["Rounding"] = "Runden"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:283
CLM.L["Ruins of Ahn'Qiraj"] = "Die Ruinen von'Ahn'Qiraj"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:690
CLM.L["SK"] = "SK"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:922
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:130
CLM.L["Same zone only"] = "Nur in selber Zone"
-- ClassicLootManager/MinimapIcon.lua:56
CLM.L["Sandbox mode"] = "Sandbox Modus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:48
CLM.L["Sapphiron"] = "Saphiron"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:119
CLM.L["Sartharion"] = "Sartharion"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:161
CLM.L["Saviana Ragefire"] = "Saviana Ragefire"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:709
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:716
CLM.L["Sealed"] = "Geschlossen"
-- ClassicLootManager/Modules/GUI/Filters.lua:208
CLM.L["Search for player names. Separate multiple with a comma ','. Minimum 3 characters. Overrides filtering."] = "Nach Spielernamen suchen. Mehrere durch Komma ',' unterteilen. Mindestens 3 Zeichen. Überschreibt das Filtern."
-- ClassicLootManager/Modules/GUI/Filters.lua:207
CLM.L["Search"] = "Suchen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1293
CLM.L["Select DKP or EPGP point system."] = "Wählen Sie DKP- oder EPGP Punktesystem."
-- ClassicLootManager_Integrations/GUI.lua:375
CLM.L["Select Profiles to export"] = "Wählen Sie Profile zum Exportieren aus"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:422
CLM.L["Select Rosters to display"] = "Wähle Kader zum Anzeigen"
-- ClassicLootManager_Integrations/GUI.lua:344
CLM.L["Select Rosters to export"] = "Wählen Sie Roster zum Exportieren"
-- ClassicLootManager/Modules/GUI/Filters.lua:179
CLM.L["Select all classes."] = "Alle Klassen auswählen."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:506
CLM.L["Select equation"] = "Gleichung auswählen"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:23
CLM.L["Select logging level for troubleshooting"] = "Protokollierungsgrad für Fehlerbehebung auswählen"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:196
CLM.L["Select loot rarity for the annoucement to raid."] = "Loot-Rarität für das Ankündigen im Schlachtzug auswählen."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:409
CLM.L["Select loot rarity threshold to used to fill the auction list."] = "Plünderschwelle auswählen um Auktionsliste auszufüllen"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:240
CLM.L["Select modifier combination for awarding."] = "Wählen Sie die Modifikator -Kombination für die Vergabe aus."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:418
CLM.L["Select modifier combination for filling auction from bags and corpse."] = "Modifikator Kombination auswählen um Auktionen aus Taschen und Leichen auszufüllen."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:133
CLM.L["Select roster to add profiles to."] = "Roster auwählen zu welchem Profile hinzugefügt werden sollen."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:163
CLM.L["Select roster to create raid for."] = "Roster zum Raid erstellen auswählen."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:162
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:132
CLM.L["Select roster"] = "Roster auswählen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:938
CLM.L["Select weekly reset timezone. EU: Wed 07:00 GMT or US: Tue 15:00 GMT"] = "Wöchentliche Reset Zeitzone auswählen. EU: Mi 07:00 GMT oder US: Die 15:00 GMT"
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:70
CLM.L["Select |cffeeee00%s|r encounter difficulty for bonus value award (%s)."] = "|cffeeee00%s|r Boss Schwierigkeitsgrad für Bonuswertverleihung auswählen (%s)."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:772
CLM.L["Selected"] = "Ausgewählt"
-- ClassicLootManager_Integrations/GUI.lua:143
CLM.L["September"] = "September"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:332
CLM.L["Serpentshrine Cavern"] = "Höhle des Schlangenschreins"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:469
CLM.L["Set %s points to %s players for %s in <%s>"] = "Setze %s punkte für %s Spieler für %s in <%s>"
-- ClassicLootManager_Integrations/GenericImport.lua:184
CLM.L["Set Profiles standings in Rosters"] = "Setzen Sie die Profiltypen in den Kadern"
-- ClassicLootManager_Integrations/Migration.lua:378
CLM.L["Set points for %s players for team to %s"] = "Setze punkte für %s Spieler im Team für %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:184
CLM.L["Set raid name"] = "Schlachtzugname bestimmen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:93
CLM.L["Shade of Akama"] = "Akamas Schemen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:73
CLM.L["Shade of Aran"] = "Arans Schemen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:120
CLM.L["Shadron"] = "Shadron"
-- .:indirectly
CLM.L["Shaman"] = "Schamane"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:13
CLM.L["Shazzrah"] = "Shazzrah"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:805
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:838
CLM.L["Shield"] = "Schild"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:499
CLM.L["Shift + Alt"] = "Shift + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:502
CLM.L["Shift + Ctrl + Alt"] = "Shift + Ctrl + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:501
CLM.L["Shift + Ctrl"] = "Shift + Ctrl"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:496
CLM.L["Shift"] = "Shift"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:788
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:821
CLM.L["Shirt"] = "Chemise"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:787
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:820
CLM.L["Shoulder"] = "Schulter"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:223
CLM.L["Show Award window"] = "Award Fenster Show"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:76
CLM.L["Show tooltip info even outside of CLM raid."] = "Tooltippinformationen auch ausserhalb von einem CLM Raid anzeigen lassen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:27
CLM.L["Silithid Royalty"] = "Das Käfer-Trio"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:157
CLM.L["Sindragosa"] = "Sindragosa"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:737
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:743
CLM.L["Single-Priced"] = "Einzelpreis"
-- ClassicLootManager_Integrations/Migration.lua:179
CLM.L["Skipping %s"] = "%s überspringen"
-- ClassicLootManager_Integrations/Migration.lua:255
CLM.L["Skipping CommunityDKP"] = "CommunityDKP überspringen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:512
CLM.L["Slot multipliers"] = "Slot Multiplikatoren"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:360
CLM.L["Small value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Kleiner Wert für stufenbasierte Auktion. \n\nDenselben Wert wie andere Stufe oder negativ setzen zum ignorieren."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:892
CLM.L["Small"] = "Klein"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:144
CLM.L["Spec guild request"] = "Spzialisierungen von der Gilde anfordern"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:386
CLM.L["Spent"] = "Ausgaben"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:810
CLM.L["Stale"] = "Abgestanden"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:136
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:146
CLM.L["Standby %s has been sent"] = "Standby %s wurde gesendet"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:524
CLM.L["Standby Bonus"] = "Standby Bonus"
-- ClassicLootManager/Modules/GUI/Filters.lua:77
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:298
CLM.L["Standby"] = "Standby"
-- ClassicLootManager_Integrations/GUI.lua:19
CLM.L["Standings"] = "Punktestand"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:384
CLM.L["Start selected raid"] = "Ausgwählten Schlachtzug starten"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:502
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:520
CLM.L["Start"] = "Starten"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:508
CLM.L["Started raid %s"] = "Schlachtzug %s gestartet"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:448
CLM.L["Statistics"] = "Statistiken"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:260
CLM.L["Status"] = "Status"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:502
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:520
CLM.L["Stop"] = "Stopp"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:59
CLM.L["Store bids"] = "Gebote speichern"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:60
CLM.L["Store finished auction bids information."] = "Vollendete Auktionsinformationen speichern."
-- ClassicLootManager_Integrations/ImportCSV.lua:118
-- ClassicLootManager_Integrations/GenericImport.lua:238
CLM.L["Success"] = "Erfolg"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:14
CLM.L["Sulfuron Harbinger"] = "Sulfuronherold"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:392
CLM.L["Sunwell Plateau"] = "Sonnenbrunnenplateau"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:470
CLM.L["Suppress incoming whispers"] = "Eingehende Whisper unterdrücken"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:479
CLM.L["Suppress outgoing whispers"] = "Ausgehende Whisper unterdrücken"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:79
CLM.L["Suppresses changelog display until new version is released"] = "Änderungsprotokoll Anzeige unterdrücken bis eine neue Version veröffentlicht wurde"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:92
CLM.L["Supremus"] = "Supremus"
-- ClassicLootManager/MinimapIcon.lua:50
CLM.L["Sync ongoing"] = "Synchronisation im Gange"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:636
CLM.L["TBC"] = "TBC"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:792
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:825
CLM.L["Tabard"] = "Wappenrock"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:155
CLM.L["Tank"] = "Tank"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1260
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:136
CLM.L["Tax"] = "Steuer"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:344
CLM.L["Tempest Keep"] = "Festung der Stürme"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:231
CLM.L["Temple of Ahn'Qiraj"] = "Ahn'Qiraj"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:121
CLM.L["Tenebron"] = "Tenebron"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:72
CLM.L["Terestian Illhoof"] = "Terestian Siechhuf"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:94
CLM.L["Teron Gorefiend"] = "Teron Blutschatten"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:41
CLM.L["Thaddius"] = "Thaddius"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:138
CLM.L["The Assembly of Iron"] = "Die Eisenbaugruppe"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:71
CLM.L["The Curator"] = "Der Kurator"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:438
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:555
CLM.L["The Eye of Eternity"] = "Das Auge der Ewigkeit"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:47
CLM.L["The Four Horsemen"] = "Die Vier Reiter"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:98
CLM.L["The Illidari Council"] = "Der Rat der Illidari"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:158
CLM.L["The Lich King"] = "Der Lichkönig"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:82
CLM.L["The Lurker Below"] = "Das Grauen aus der Tiefe"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:428
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:545
CLM.L["The Obsidian Sanctum"] = "Das Obsidian Sanctum"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:26
CLM.L["The Prophet Skeram"] = "Prophet Skeram"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:511
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:628
CLM.L["The Ruby Sanctum"] = "Das Ruby Sanctum"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:139
CLM.L["Thorim"] = "Thorim"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:811
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:844
CLM.L["Thrown"] = "Wurfwaffe"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:536
CLM.L["Tier multipliers"] = "Stufen Multiplikatoren"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:739
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:744
CLM.L["Tiered"] = "Stufenbasiert"
-- ClassicLootManager/MinimapIcon.lua:60
CLM.L["Time Traveling"] = "Zeitreisen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1096
CLM.L["Time in seconds by which auction will be extended if bid is received during last 10 seconds."] = "Zeit in Sekunden wie lange die Auktion verlängert wird, wenn ein Gebot in den letzten 10 Sekunden eingeht."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1080
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1104
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1105
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:655
CLM.L["Time"] = "Zeit"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:733
CLM.L["Timetravel"] = "Zeitreise"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:309
CLM.L["Toggle Auction History window display"] = "Auktionsverlauf Anzeige ein / ausschalten"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:702
CLM.L["Toggle Auctioning window display"] = "Auktionsfenster Anzeige ein / ausschalten"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:145
CLM.L["Toggle Bidding auto-open"] = "Automatisches öffnen des Bietfensters ein / ausschalten"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:220
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1181
CLM.L["Toggle Bidding window display"] = "Bietfenster Anzeige ein / ausschalten"
-- ClassicLootManager_Integrations/ImportCSV.lua:216
CLM.L["Toggle CSV import window display"] = "CSV Importfenster ein / ausschalten"
-- ClassicLootManager/MinimapIcon.lua:77
CLM.L["Toggle Minimap Icon"] = "Minimap Symbol ein / ausschalten"
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:283
CLM.L["Toggle Trade List window display"] = "Handelslistenfenster ein- ausblenden"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:163
CLM.L["Toggle advancing to next item on the list after bid."] = "Zum nächsten Gegenstand in der Liste umschalten, nachdem man geboten hat."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:146
CLM.L["Toggle auto open and auto close on auction start and stop"] = "Automatisches öffnen oder schließen vom Start und Ende der Auktion ein / ausschalten"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:46
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:158
CLM.L["Toggle changelog window display"] = "Änderungsprotokoll Anzeige ein / ausschalten"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:45
CLM.L["Toggle changelog"] = "Zeigt das Änderungsprotokoll"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:155
CLM.L["Toggle closing bidding UI after submitting bid for all items."] = "Gebotsfenster schließen, nachdem das Gebot auf alle Gegenstände abgegeben wurde."
-- ClassicLootManager_Integrations/GUI.lua:513
CLM.L["Toggle export window display"] = "Exportfensters Anzeige ein / ausschalten"
-- ClassicLootManager_Integrations/GenericImport.lua:281
CLM.L["Toggle import window display"] = "Importfenster Anzeige ein / ausschalten"
-- ClassicLootManager/Modules/GUI/UnifiedGUI.lua:423
CLM.L["Toggle standings window display"] = "Zeigt das Punktestand Fenster"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:194
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:203
CLM.L["Toggle test bar"] = "Schaltertestleiste"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:146
CLM.L["Toggles addon sounds."] = "Addon Geräusche ein / ausschalten."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:178
CLM.L["Toggles loot announcement to raid"] = "Loot Vergabe im Schlachtzug Kanal ankündigen ein / ausschalten"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:341
CLM.L["Toggles loot award announcement to guild"] = "Loot Vergabe im Gilden Kanal ankündigen ein / ausschalten"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:354
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:367
CLM.L["Too much data to display"] = "Zu viele Daten zum anzeigen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:127
CLM.L["Toravon the Ice Watcher"] = "Toravon der Eisbeobachter"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:451
CLM.L["Total blocked"] = "Gesamt blockiert"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:452
CLM.L["Total decayed"] = "Gesamt verfallen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:450
CLM.L["Total received"] = "Gesamt erhalten"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:449
CLM.L["Total spent"] = "Gesamtausgaben"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:104
CLM.L["Tracker"] = "Verfolger"
-- ClassicLootManager/MinimapIcon.lua:114
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:193
CLM.L["Trade List"] = "Handelsliste"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:475
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:592
CLM.L["Trial of the Crusader"] = "Versuch des Kreuzfahrers"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:799
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:832
CLM.L["Trinket"] = "Schmuckstück"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:37
CLM.L["True"] = "Wahr"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:32
CLM.L["Twin Emperors"] = "Zwillingsimperatoren"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:263
CLM.L["Two different profiles exist for target GUID %s (%s:%s) and name %s (%s:%s). Verify and clean up profiles before updating."] = "Für Zielguid %s (%s:%s) und Name %s (%s:%s) exisieren zwei verschiedene Profile. Überprüfen und bereinigen Sie Profile vor dem Aktualisieren."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:804
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:837
CLM.L["Two-Hand"] = "Zweihand"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:254
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:287
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:656
CLM.L["Type"] = "Typ"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:100
CLM.L["UI Scale"] = "UI Skalierung"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:455
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:572
CLM.L["Ulduar"] = "Ulduar"
-- ClassicLootManager_Integrations/Migration.lua:48
CLM.L["Unable to execute migration. Entries already exist."] = "Migrationen kann nicht ausgeführt werden. Einträge sind bereits vorhanden"
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:160
CLM.L["Unable to get item info from server. Please try auctioning again"] = "Iteminformationen konnten nicht vom Server abrufen werden. Bitte versuchen Sie es erneut zu versteigern"
-- ClassicLootManager/Utils.lua:1021
CLM.L["Uncommon"] = "Ungewöhnlich"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:525
CLM.L["Unexcused absence"] = "Unentschuldigstes Fehlen"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:44
CLM.L["Unknown roster %s"] = "Unbekanntes Roster %s"
-- ClassicLootManager/MinimapIcon.lua:52
CLM.L["Unknown sync state"] = "Unbekannter Synchronisations Status"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:284
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:340
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:170
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:240
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:172
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:34
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:336
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:433
CLM.L["Unknown"] = "Unbekannt"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:320
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:88
CLM.L["Unlink Alt"] = "Twink entkoppeln"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:273
CLM.L["Unlock selected"] = "Ausgewählte entsperren"
-- ClassicLootManager_Integrations/Migration.lua:144
CLM.L["UpdatePoints(): Empty targets list"] = "UpdatePunkte(): Leere Zielliste"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:515
CLM.L["Updated raid <%s> %s joined, %s left, %s benched, %s removed"] = "Aktualisiertem Schlachtzug <%s> %s beigetreten, %s verlassen, %s auf die Bank gesetzt, %s entfernt"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1158
CLM.L["Use named buttons"] = "Verwenden Sie benannte Knöpfe"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:19
CLM.L["Vaelastrasz the Corrupt"] = "Vaelastrasz der Verdorbene"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:146
CLM.L["Val'kyr Twins"] = "Val'kyr Twins"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:150
CLM.L["Valithria Dreamwalker"] = "Valitria Dreamwalker"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:262
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:300
CLM.L["Value"] = "Wert"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:445
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:562
CLM.L["Vault of Archavon"] = "Gewölbe von Archavon"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:31
CLM.L["Verbose"] = "Ausführlich"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:134
CLM.L["Version check in guild"] = "Version in der Gilde kontrollieren"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:175
CLM.L["Version"] = "Version"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:122
CLM.L["Vesperon"] = "Vesperon"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:710
CLM.L["Vickrey"] = "Vickrey"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:30
CLM.L["Viscidus"] = "Viscidus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:88
CLM.L["Void Reaver"] = "Leerhäscher"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:795
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:828
CLM.L["Waist"] = "Taille"
-- .:indirectly
CLM.L["Warlock"] = "Hexenmeister"
-- .:indirectly
CLM.L["Warrior"] = "Krieger"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:946
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:109
CLM.L["Weekly cap"] = "Wöchentliches Limit"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:442
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:445
CLM.L["Weekly gains"] = "Wöchentliche Gewinne"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:937
CLM.L["Weekly reset timezone"] = "Wöchentliche Reset Zeitzone"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:112
CLM.L["Weekly reset"] = "Wöchentlicher Reset"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:187
CLM.L["When enabled, this will make loot announcement display only if you're Master Looter or Raid Leader (if there is no Master Looter)."] = "Wenn dies aktiviert ist, werden Loot Ankündigungen nur durchgeführt, wenn Sie der Plündermeister- oder RAID Anführer sind (falls es keinen Plündermeister gibt)."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1159
CLM.L["Will display names of the buttons instead of values in bidding UI"] = "Zeigt Namen der Knöpfe anstelle von Werten in der Bieten Benutzeroberfläche an"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:204
CLM.L["Will hide bidding window if you enter combat and show it again when you exit. Will also delay auto opening if needed."] = "Versteckt das Bietungsfenster, wenn Sie den Kampf eingeben und es beim Beenden erneut anzeigen. Verzögert bei Bedarf auch die automatische Öffnung."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:154
CLM.L["Wipe events"] = "Ereignisse löschen"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:39
CLM.L["Wipe"] = "Löschen"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:155
CLM.L["Wipes all events from memory. This will trigger resyncing from other users."] = "Löscht alle Ereignisse vom Speicher. Löst ein Neusynchronisieren bei anderen Mitgliedern aus."
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:40
CLM.L["Wipes the log history"] = "Löscht die Protokoll Historie"
-- ClassicLootManager_Integrations/Integrations.lua:360
CLM.L["WoW DKP Bot Integration"] = "WoW DKP Bot Integration"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:637
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:638
CLM.L["WotLK"] = "WotLK"
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:188
CLM.L["Wowpedia"] = "Wowpedia"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:793
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:826
CLM.L["Wrist"] = "Handgelenk"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:140
CLM.L["XT-002 Deconstructor"] = "XT-002 Dekonstruktor"
-- ClassicLootManager/Utils.lua:577
CLM.L["Yes"] = "Ja"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:141
CLM.L["Yogg-Saron"] = "Yogg-Saron"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:307
CLM.L["You are already in an active raid. Leave or finish it before creating new one."] = "Du bist bereits in einem aktiven Schlachtzug. Verlasse oder beende den Schlachtzug bevor du einen neuen erstellst."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:729
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:846
CLM.L["You are not allowed to auction items"] = "Du darfst keine Gegenstände versteigern"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:465
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:499
CLM.L["You are not allowed to control raid."] = "Du darfst keinen Schlachtzug kontrollieren."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:303
CLM.L["You are not allowed to create raids."] = "Du darfst keinen Schlachtzug erstellen."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:436
CLM.L["You are not allowed to join raid."] = "Du darfst keinem Schlachtzug beitreten."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:325
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:397
CLM.L["You are not allowed to start raid."] = "Du darfst keinen Schlachtzug starten."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:338
CLM.L["You are not in the raid."] = "Du bist nicht im Schlachtzug."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:657
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:666
CLM.L["You can %s max %d players from standby at the same time to a %s raid."] = "Du kannst %s maximal %d Spieler von Standby zur gleichen Zeit zum %s Schlachtzug."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:612
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:621
CLM.L["You can %s max %d players to standby at the same time to a %s raid."] = "Du kannst %s maximal %d Spieler zur Standby zur gleichen Zeit zum %s Schlachtzug."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:469
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:503
CLM.L["You can only add players to standby of a progressing raid."] = "Du kannst nur Spieler auf Standby setzen, welche im einem laufenden Schlachtzug sind."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:603
CLM.L["You can only bench players from same roster as the raid (%s)."] = "Du kannst nur Spieler vom selben Roster und Raid auf die Bank setzen (%s)."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:401
CLM.L["You can only end an active raid."] = "Du kannst nur einen aktiven Schlachtzug beenden."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:440
CLM.L["You can only join an active raid."] = "Du kannst nur einem aktiven Schlachtzug beitreten."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:444
CLM.L["You can only join different raid than your current one."] = "Du kannst nur einen anderen Schlachtug beitreten als dem momentanen."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:648
CLM.L["You can only remove from bench players from same roster as the raid (%s)."] = "Du kannst nur Spieler vom selben Roster wie Schlachtzug (%s) von der Bank entfernen."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:329
CLM.L["You can only start a freshly created raid."] = "Du kannst nur einen neuerstellten Schlachtzug starten."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:700
CLM.L["You can remove max %d players from roster at the same time."] = "Du kannst maximal %d Spieler auf einmal vom Roster entfernen."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:337
CLM.L["Your bid (%s) was denied: |cffcc0000%s|r"] = "Dein Gobot von (%s) wurde abgelehnt: |cffcc0000%s|r"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:319
CLM.L["Your bid (%s) was |cff00cc00accepted|r"] = "Dein Gebot von (%s) wurde |cff00cc00akzeptiert|r"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:64
CLM.L["Zero-Sum Bank Inflation"] = "Zero-Sum Bank Inflation"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1220
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:61
CLM.L["Zero-Sum Bank"] = "Nullsummen Bank"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1228
CLM.L["Zero-Sum Inflation Value"] = "Nullsummen Inflationswert"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:528
CLM.L["Zero-Sum award"] = "Nullsummen vergabe"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1214
CLM.L["Zero-Sum"] = "Nullsumme"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:380
CLM.L["Zul'Aman"] = "Zul'Aman"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:267
CLM.L["Zul'Gurub"] = "Zul'Gurub"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:110
CLM.L["Zul'jin"] = "Zul'jin"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:218
CLM.L["[All Roster Configs]: "] = "[Alle Roster Konfigurationen]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:224
CLM.L["[All Roster Default Slot Values]: "] = "[Alle voreinsgestellten Roster Slot Werte]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:202
CLM.L["[Alt-Main Link]: "] = "[Main-Alt Link]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:209
CLM.L["[Create Roster]: "] = "[Roster erstellen]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:212
CLM.L["[Delete Roster]: "] = "[Roster löschen]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:287
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:529
CLM.L["[IGNORE]: Ignoring entry"] = "[IGNORIEREN]: Eintrag ignorieren]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:271
CLM.L["[Item Award in Raid]: "] = "[Gegenstand Vergeben im Raid]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:268
CLM.L["[Item Award]: "] = "[Gegenstand vergeben]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:258
CLM.L["[Point Award to raid]: "] = "[Punkte Vergeben zum Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:255
CLM.L["[Point Award to roster]: "] = "[Punkte Vergeben zum Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:249
CLM.L["[Point Award]: "] = "[Punkte Vergeben]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:261
CLM.L["[Point Decay for roster]: "] = "[Punkte Verfall für Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:252
CLM.L["[Point Decay]: "] = "[Punkte Verfall]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:264
CLM.L["[Point Set]: "] = "[Punkte Gesetzt]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:205
CLM.L["[Profile Lock]: "] = "[Profil Gesperrt]:"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:275
CLM.L["[Raid Create]: "] = "[Schlachtzug Erstellen]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:284
CLM.L["[Raid Finish]: "] = "[Schlachtzug Ende]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:278
CLM.L["[Raid Start]: "] = "[Schlachtzug Beginn]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:281
CLM.L["[Raid Update]: "] = "[Schlachtzug Update]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:199
CLM.L["[Remove Profile]: "] = "[Profile Entfernen]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:215
CLM.L["[Rename Roster]: "] = "[Roster Umbenennen]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:242
CLM.L["[Roster Boss Kill Bonus]: "] = "[Roster - Boss Kill Bonus]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:221
CLM.L["[Roster Config]: "] = "[Roster Konfiguration]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:239
CLM.L["[Roster Copy]: "] = "[Roster Kopie]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:227
CLM.L["[Roster Default Slot Value]: "] = "[Roster Voreinstellung Slot Wert]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:245
CLM.L["[Roster Field Rename]: "] = "[Roster Feld umbenennen]:"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:233
CLM.L["[Roster Item Value Override Single]: "] = "[Roster Itemwert Override Einzeln]:"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:230
CLM.L["[Roster Item Value Override]: "] = "[Roster Itemwert Überschreiben]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:236
CLM.L["[Roster Update Profiles]: "] = "[Roster Aktualisierungsprofile]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:196
CLM.L["[Update Profile]: "] = "[Profile aktualisiert]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:405
CLM.L["[config] "] = "[Konfiguration] "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:407
CLM.L["[item values] "] = "[Itemwert] "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:408
CLM.L["[profiles] "] = "[Profile] "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:406
CLM.L["[slot defaults] "] = "[Slot Voreinstellung] "
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:53
CLM.L["accepted"] = "akzeptieren"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:613
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:622
CLM.L["add"] = "hinzufügen"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:40
CLM.L["cancel"] = "abbrechen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:622
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:667
CLM.L["created"] = "erstellt"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:53
CLM.L["denied"] = "ablehnen"
-- ClassicLootManager_Integrations/Integrations.lua:342
CLM.L["else"] = "ansonsten"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:462
CLM.L["excluding negatives "] = "Negative auslassen"
-- ClassicLootManager_Integrations/Integrations.lua:277
CLM.L["if reason/response contains"] = "Wenn Grund / Antwort folgendes enthält"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:117
CLM.L["level"] = "Level"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:42
CLM.L["pass"] = "passe"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:613
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:658
CLM.L["progressing"] = "fortschreitend"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:120
CLM.L["rank"] = "rang"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:658
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:667
CLM.L["remove"] = "entfernen"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:137
CLM.L["request"] = "Anfrage"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:40
CLM.L["requested"] = "angefordert"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:147
CLM.L["revoke"] = "widerrufen"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:70
CLM.L["revoked"] = "widerrufen"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:92
CLM.L["roster"] = "Roster"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:92
CLM.L["rosters"] = "Roster"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:860
CLM.L["seconds"] = "Sekunden"
-- ClassicLootManager_Integrations/Integrations.lua:287
CLM.L["then"] = "dann"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:124
CLM.L["unguilded"] = "Ohne Gilde"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1150
CLM.L["|cff00ee44Open:|r English Auction with highest bidder announcement. Highest bidder wins. Two players can not bid same value. Additionally always allows bidding base to accomodate for Swedish Auction flavor.\n\n|cff00ee44Anonymous Open:|r Same as Open but highest bidder name is not disclosed.\n\n|cff00ee44Sealed:|r Bids are not announced. Highest bidder wins.\n\n|cff00ee44Vickrey:|r Same as sealed but winner pays with second-highest bid."] = "|cff00ee44Offen: |r Englische Auktion mit Ankündigung des höchsten Bieters. Der höchste Bieter gewinnt. Zwei Spieler können keinen gleichen Wert bieten. Ermöglicht auserdem nach Schwedischem Stil den Grundpreis zu bieten.\n\n|cff00ee44Anonym Offen:|r Genauso wie offen aber der Name des Höchstbieters wird nicht angezeigt.\n\n|cff00ee44Geschlossen:|r Keine Gebote werden angezeigt. Höchstes Gebot gewinnt.\n\n|cff00ee44Vickrey:|r Genauso wie geschlossen aber der Gewinner zahlt nur den zweithöchsten Gebotspreis."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1035
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1207
CLM.L["|cff00ee44Single-Priced:|r Static value mode. Only bidding Base value is supported.\n\n|cff00ee44Ascending:|r Ranged value mode. Allows bidding any value in |cff44ee00<base, max>|r.\n\n|cff00ee44Tiered:|r Ranged value mode. Allows bidding only specific values. Up to 5 tiers are configurable in |cff44ee00<base, small, medium, large, max>|r."] = "|Einzel-preise:|r statischer Wertmodus. Nur der Basiswert wird unterstützt. \n\n|cff00ee44Absteigend:|r Wertebereich Modus. Ermöglich das Bieten von werten zwischen |cff44ee00<Basis-, MaximalPunkten>|r.\n\n|cff00ee44Stufenbasiert:|r Wertebereich Modus. Ermöglicht das bieten von Spezifischen Werten. Bis zu 5 Werte konfigurierbar in |cff44ee00<Basis-, Klein-, Mittel-, Groß-, Maximalpunkte>|r."
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:50
CLM.L["|cffcc0000Your Core Loot Manager is significantly out of date.|r AddOn communication has been disabled. Version %s is available. Please update as soon as possible."] = "|cffcc0000Dein Core Loot Manager ist nicht mehr aktuell.|r Die Addon Kommunikation wurde abgeschaltet. Version %s ist verfügbar. Bitte schnellstmöglich auf den neuesten Stand bringen du kek"
end