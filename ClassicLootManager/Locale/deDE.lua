local _, CLM = ...
if GetLocale() == "deDE" then
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:351
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:323
CLM.L[" alt of: "] = " Twink von: "
-- ClassicLootManager/Utils.lua:581
CLM.L[" more"] = " mehr"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:172
CLM.L[" over "] = " Über "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:396
CLM.L[" profile(s)"] = " Profil(e)"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:321
CLM.L["% that will be decayed."] = "% die verfallen wird."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:393
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:408
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:454
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:344
CLM.L["%Y/%m/%d %H:%M:%S (%A)"] = "%Y/%m/%d %H:%M:%S (%A)"
-- ClassicLootManager_Integrations/Models/Exporter.lua:326
-- ClassicLootManager_Integrations/Models/Exporter.lua:327
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:253
CLM.L["%Y/%m/%d %a %H:%M:%S"] = "%Y/%m/%d %a %H:%M:%S"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:591
CLM.L["%d/%m/%Y %H:%M:%S"] = "%d/%m/%Y %H:%M:%S"
-- ClassicLootManager_Alerts/Alerts.lua:22
CLM.L["%s %% %s decay"] = "%s %% %s Zerfall"
-- ClassicLootManager_Alerts/Alerts.lua:20
CLM.L["%s %s"] = "%s %s"
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:183
CLM.L["%s awarded to %s for %s %s"] = "%s an %s für %s %s verliehen"
-- ClassicLootManager/MinimapIcon.lua:39
CLM.L["%s events (%s pending)"] = "%s Events (%s ausstehend)"
-- ClassicLootManager/MinimapIcon.lua:41
CLM.L["%s events (0x%x)"] = "%s Events (0x%x)"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:38
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:68
CLM.L["%s has %s standby"] = "%s hat %s Standby"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:59
CLM.L["%s is not part of the %s roster"] = "%s ist nicht Teil von %s Roster"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:135
CLM.L["%s profile exists."] = "%s Profil existiert."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:137
CLM.L["%s profile missing. Adding."] = "%s Profil fehlt. Wird hinzugefügt."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:480
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:490
CLM.L["%s to %s for %s in <%s>"] = "%s an %s für %s in <%s>"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1037
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1045
CLM.L["%s to be awarded to player when joining roster."] = "%s werden dem Spieler zuerkannt, wenn er dem Kader beitritt."
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:172
CLM.L["%s trade me for %s"] = "%s handel mich an für %s"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:143
CLM.L["%s was not found in guild."] = "%s wurde nicht in der Gilde gefunden."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:101
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:101
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:102
CLM.L["-- All --"] = "-- Alle --"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:26
CLM.L["10 Player (Heroic)"] = "10 Spieler (heroisch)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:24
CLM.L["10 Player"] = "10 Spieler"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:25
CLM.L["20 Player"] = "20 Spieler"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:28
CLM.L["25 Player (Heroic)"] = "25 Spieler (heroisch)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:27
CLM.L["25 Player"] = "25 Spieler"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:22
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:23
CLM.L["40 Player"] = "40 Spieler"
-- ClassicLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:19
CLM.L["Accept from"] = "Akzeptieren von"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:910
CLM.L["Accepting rolls on %s for %s %s"] = "Würfeln auf %s akzeptieren für %s %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:150
CLM.L["Action context"] = "Aktionskontext"
-- ClassicLootManager_Integrations/Integrations.lua:163
CLM.L["Action to take upon Gargul loot award event happening during raid."] = "Maßnahmen zur Ausnahme von Gargul Loot AwardEvent während des Schlachtzugs."
-- ClassicLootManager_Integrations/Integrations.lua:268
CLM.L["Action to take upon RCLC loot award event happening during raid. Trigger is based on RCLC award reason or player response if reason is not used. On Integration Enable the buttons will be prefilled with existing ones."] = "Aktion welche nach der Vergabe durch RCLC im Raid stattfinden soll. Auslöser basiert auf den RCLC Vergabegrund oder die Antwort des Spielers falls kein Grund ausgewählt wird. Wenn die Integration aktiviert ist werden die Knöpfe mit diesen befüllt"
-- ClassicLootManager_Integrations/GenericImport.lua:180
CLM.L["Add Profiles to Rosters"] = "Profile zu Roster hinzufügen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:129
CLM.L["Add currently selected target to list."] = "Fügt aktuelles Ziel zur Liste hinzu."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:128
CLM.L["Add target"] = "Ziel hinzufügen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:149
CLM.L["Add to roster"] = "Zum Roster hinzufügen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:635
CLM.L["Add to standby"] = "Zum Standby hinzufügen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:396
CLM.L["Add"] = "Hinzufügen"
-- ClassicLootManager_Integrations/Migration.lua:401
CLM.L["Adding %s loot entries for team to %s"] = "Fügt %s Looteinträge zum Team %s hinzu"
-- ClassicLootManager_Integrations/Migration.lua:260
-- ClassicLootManager_Integrations/Migration.lua:379
CLM.L["Adding %s profiles to %s"] = "Fügt %s Profile hinzu %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:1009
CLM.L["Adding missing %s players to current roster"] = "Fügt fehlende %s Spieler zum aktuellen Roster hinzu"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1367
CLM.L["Additional cost (tax) to add to the award value."] = "Zusätzliche Kosten (Steuer) zum Gebotwert hinzufügen."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1335
CLM.L["Additional points to be given to players atop of the split value."] = "Zusätzliche Punkte an Spieler zum Split Wert vergeben."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:152
CLM.L["Addon sounds"] = "Addon Sounds"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:150
CLM.L["Adds selected players to the selected roster (from dropdown)."] = "Fügt ausgewählte Spieler in die ausgewählte Liste (aus Dropdown) hinzu."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:213
CLM.L["Advance to next item after bid"] = "Weiter zum nächsten Gegenstand, nachdem man geboten hat"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:221
CLM.L["Affected players:"] = "Betroffene Spieler:"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:166
CLM.L["Akil'zon"] = "Akil'zon"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:43
CLM.L["Aku'mai"] = "Aku'mai"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:244
CLM.L["Al'Akir"] = "Al'Akir"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:148
CLM.L["Al'ar"] = "Al'ar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:189
CLM.L["Algalon the Observer"] = "Algalon der Beobachter"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:228
CLM.L["Alizabal"] = "Alizabal"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:642
CLM.L["All In"] = "All in"
-- ClassicLootManager_Integrations/Migration.lua:29
CLM.L["All migration entries were commited and executed. Congratulations!"] = "Alle Migrierungseinträge wurden gespeichert und ausgeführt. Glückwunsch!"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:242
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:20
-- ClassicLootManager/Modules/GUI/Filters.lua:178
CLM.L["All"] = "Alle"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:76
CLM.L["Allow bidding below minimum points"] = "Gebot unter den Mindestpunkten zulassen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1344
CLM.L["Allow biding more than current standings and ending up with less than minimum standings."] = "Bieten mit aktuellem Punktestand erlauben, auch wenn dies zu einem Punktestand führt der unterhalb des minimalem Punktstand liegt."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1343
CLM.L["Allow biding more than current standings"] = "Gebote größer als die vorhandenen Punkten zulassen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1296
CLM.L["Allow equal bids"] = "Gleiche Gebote erlauben"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:73
CLM.L["Allow going below minimum points"] = "Ermöglichen unter die Minimalpunktzahl zu kommen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1060
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:156
CLM.L["Allow players to subscribe to the bench through Raids menu"] = "Erlaube Spielern sich über das Raid Menü auf die Bank zu setzen."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1059
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:155
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:133
CLM.L["Allow subscription"] = "Erlaube Abonnement"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:606
-- ClassicLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:53
CLM.L["Alt"] = "Alt"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1304
CLM.L["Always allow 0 bids"] = "0 Gebote immer erlauben"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1288
CLM.L["Always allow All-In bids"] = "All-In Gebote immer erlauben"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1280
CLM.L["Always allow Base bids"] = "Grundgebote immer erlauben"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1161
CLM.L["Always allow cancel/pass"] = "Abbrechen/passen immer erlauben"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:73
CLM.L["Always show"] = "Immer anzeigen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:249
CLM.L["Alysrazor"] = "Alysrazor"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:871
CLM.L["Americas"] = "Amerikas"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:820
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:853
CLM.L["Ammo"] = "Munition"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:162
CLM.L["Anetheron"] = "Anetheron"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:373
CLM.L["Announce award to Guild"] = "Gewinn im Gildenchat posten"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:184
CLM.L["Announce loot from corpse to Raid"] = "Loot von der Leiche posten"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:180
CLM.L["Announce loot"] = "Beute ankündigen"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:202
CLM.L["Announcement loot rarity"] = "Lootseltenheit ankündigen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:721
CLM.L["Anonymous Open"] = "Anonym offen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1184
CLM.L["Anti-snipe time"] = "Anti-Snipe Zeit"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:807
CLM.L["Anti-snipe time: %s."] = "Anti-Snipe Zeit: %s."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:503
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:236
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:70
CLM.L["Anti-snipe"] = "Anti-Snipe"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:96
CLM.L["Anub'Rekhan"] = "Anub'Rekhan"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:203
CLM.L["Anub'arak"] = "Anub'arak"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:67
-- ClassicLootManager/Tooltips.lua:37
-- ClassicLootManager/Utils.lua:1118
CLM.L["Any"] = "Alle"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:654
CLM.L["Applies all changes and exits sandbox mode"] = "Alle Änderungen anwenden und Sandbox verlassen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:653
CLM.L["Apply changes"] = "Änderungen anwenden"
-- ClassicLootManager_Integrations/GUI.lua:137
CLM.L["April"] = "April"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:185
CLM.L["Archavon the Stone Watcher"] = "Archavon der Steinbeobachter"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:165
CLM.L["Archimonde"] = "Archimonde"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:177
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:332
CLM.L["Are you sure, you want to award %s to %s for %s %s?"] = "Bist du sicher, dass du %s an %s für %s %s verteilen willst?"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:542
CLM.L["Are you sure, you want to bid on an unusable item %s?"] = "Sind Sie sicher, Sie möchten auf einen unbrauchbaren Artikel %s bieten?"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:360
CLM.L["Are you sure, you want to disenchant %s?"] = "Bist du sicher, dass du %s entzaubern willst?"
-- ClassicLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:79
CLM.L["Are you sure, you want to link %s as alt of %s?"] = "Sind Sie sicher, Sie möchten %s als Alt von %s verknüpfen?"
-- ClassicLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:96
CLM.L["Are you sure, you want to unlink %s from its main?"] = "Sind Sie sicher, Sie möchten %s von der Hauptsache entlasten?"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:226
CLM.L["Argaloth"] = "Argaloth"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:239
CLM.L["Ascendant Council"] = "Ascendant Council"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:748
CLM.L["Ascending"] = "Aufsteigend"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:231
CLM.L["Assistant"] = "Assistent"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:55
CLM.L["Atal'ai Defenders"] = "Atal'ai Defenders"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:52
CLM.L["Atal'alarion"] = "Atal'alarion"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:233
CLM.L["Atramedes"] = "Atramedes"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:431
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:442
CLM.L["Att. [%]"] = "Att. [%]"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:408
CLM.L["Attendance"] = "Anwesenheit"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:128
CLM.L["Attumen the Huntsman"] = "Attumen der Jäger"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:247
CLM.L["Auction End Countdown"] = "Auktionsende Countdown"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:222
-- ClassicLootManager/MinimapIcon.lua:130
CLM.L["Auction History"] = "Auktion's Historie"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:239
CLM.L["Auction Start/End"] = "Auktion Start/Ende"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:235
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:67
CLM.L["Auction Time"] = "Auktionszeit"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:55
CLM.L["Auction Type"] = "Auktionstyp"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:81
CLM.L["Auction column"] = "Auktionsspalte"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:699
CLM.L["Auction complete"] = "Auktion komplett"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:278
CLM.L["Auction finished"] = "Auktion fertig"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1176
CLM.L["Auction length in seconds."] = "Auktionslänge in Sekunden."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:493
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1175
CLM.L["Auction length"] = "Auktionslänge"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:258
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:799
CLM.L["Auction of %s items."] = "Auktion von %s Gegenständen."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:262
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:801
CLM.L["Auction of %s"] = "Auktion von %s"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:480
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1118
CLM.L["Auction settings"] = "Auktionseinstellungen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:690
CLM.L["Auction stopped by the Master Looter"] = "Auktion wurde vom Lootmeister gestoppt"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:805
CLM.L["Auction time: %s."] = "Auktionszeit: %s."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:285
CLM.L["Auction timer bar font size"] = "Auktions Timer Bar Schriftgröße"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:268
CLM.L["Auction timer bar font"] = "Auktions Timer Bar Schriftart"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:245
CLM.L["Auction timer bar height"] = "Auktions Timer Barhöhe"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:308
CLM.L["Auction timer bar texture"] = "Auktions Timer Bar -Textur"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:222
CLM.L["Auction timer bar width"] = "Auktions Timer Bar Breite"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1247
CLM.L["Auction type"] = "Auktionstyp"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:55
CLM.L["Auctioning - History"] = "Auktionshistorie"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:428
CLM.L["Auctioning - List Filling"] = "Versteigerung - Liste ausfüllen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:646
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:654
CLM.L["Auctioning requires active raid or roster mode."] = "Um versteigern zu können muss ein aktivier Schlachtzug oder Roster Modus vorhanden sein."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:369
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:669
-- ClassicLootManager/MinimapIcon.lua:125
CLM.L["Auctioning"] = "Versteigern"
-- ClassicLootManager_Integrations/GUI.lua:141
CLM.L["August"] = "August"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:190
CLM.L["Auriaya"] = "Auriaya"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:708
CLM.L["Author"] = "Autor"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1067
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:147
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:121
CLM.L["Auto bench leavers"] = "Spieler beim verlassen des Raids automatisch auf die Bank setzen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:391
CLM.L["Auto-assign from corpse"] = "Automatische Zuweisung aus der Leiche"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:400
CLM.L["Auto-trade after award"] = "Gewonnenen Loot automatisch handeln"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:497
CLM.L["Automatically mark auto-removed items as disenchanted"] = "Markiere entfernte Gegenstände fürs Entzaubern. Nur möglich wenn Items ohne Gebote automatisch entfernt werden."
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:59
CLM.L["Avatar of Hakkar"] = "Avatar of Hakkar"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:430
CLM.L["Average weeks"] = "Durchschnittliche Wochen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:291
CLM.L["Award %s %s to %s selected players."] = "Vergebe %s %s an %s ausgewählte Spieler."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:285
CLM.L["Award %s %s to everyone in raid."] = "Vergebe %s %s an alle im Raid."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:287
CLM.L["Award %s %s to everyone in roster."] = "Vergebe %s %s an alle im Roster."
-- ClassicLootManager_Integrations/Integrations.lua:682
CLM.L["Award for Base"] = "Vergebe für die Basispunktzahl"
-- ClassicLootManager_Integrations/Integrations.lua:681
CLM.L["Award for Free"] = "Vergebe kostenlos"
-- ClassicLootManager_Integrations/Integrations.lua:685
CLM.L["Award for Large"] = "Vergebe für große Punktzahl"
-- ClassicLootManager_Integrations/Integrations.lua:686
CLM.L["Award for Max"] = "Vergebe für Maximalpunktzahl"
-- ClassicLootManager_Integrations/Integrations.lua:684
CLM.L["Award for Medium"] = "Vergebe für mittlere Punktzahl"
-- ClassicLootManager_Integrations/Integrations.lua:683
CLM.L["Award for Small"] = "Vergebe für kleine Punktzahl"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:164
CLM.L["Award item"] = "Item verteilen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:980
CLM.L["Award points only to online players"] = "DKP nur an Spieler vergeben, die online sind."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:989
CLM.L["Award points only to players in same zone"] = "DKP nur an Spieler vergeben, die in gleicher Zone sind."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:194
CLM.L["Award points to players based on context."] = "Vergebe Punkte an Spieler basierend auf dem Kontext."
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:144
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:183
CLM.L["Award value"] = "Betrag vergeben"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:153
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:207
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:244
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:269
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1218
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:193
-- ClassicLootManager/MinimapIcon.lua:144
CLM.L["Award"] = "Vergeben"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:224
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:453
CLM.L["Awarded %s points for %s to all players in raid %s"] = "Vergebe %s punkte für %s an alle Spieler des Raids %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:241
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:266
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:429
CLM.L["Awarded %s points to %s player(s) for %s in <%s>"] = "Vergebe %s punkte an %s Spieler für %s in <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:445
CLM.L["Awarded %s points to all players for %s in <%s>"] = "Vergebe %s punkte an alle Spieler für %s in <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:176
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:242
CLM.L["Awarded by"] = "Vergeben von"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:126
CLM.L["Ayamiss the Hunter"] = "Ayamiss der Jäger"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:164
CLM.L["Azgalor"] = "Azgalor"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:63
CLM.L["Azuregos"] = "Azuregos"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:799
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:832
CLM.L["Back"] = "Rücken"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:819
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:852
CLM.L["Bag"] = "Tasche"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:250
CLM.L["Baleroc"] = "Baleroc"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:220
CLM.L["Baltharus the Warborn"] = "Baltharus der Warborn"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_4_Cata.lua:8
CLM.L["Baradin Hold"] = "Baradin Hold"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:37
CLM.L["Baron Aquanis"] = "Baron Aquanis"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:73
CLM.L["Baron Geddon"] = "Baron Geddon"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:398
CLM.L["Base value for Static-Priced auction.\nMinimum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Grundwert für statische Auktionen. \nMindestwert für aufsteigende und stufenbasierte Auktion. \n\nAuf denselben Wert wie andere Stufe oder negativ setzen um zu ignorieren."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:901
CLM.L["Base"] = "Standard"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:89
CLM.L["Battleguard Sartura"] = "Schildwache Sartura"
-- ClassicLootManager_Integrations/GUI.lua:315
-- ClassicLootManager_Integrations/GUI.lua:322
-- ClassicLootManager_Integrations/GUI.lua:329
CLM.L["Begin %d days ago, finish today."] = "Beginne vor %d Tagen, beende heute."
-- ClassicLootManager_Integrations/GUI.lua:248
CLM.L["Begin Day"] = "Tag beginnen"
-- ClassicLootManager_Integrations/GUI.lua:259
CLM.L["Begin Month"] = "Monat beginnen"
-- ClassicLootManager_Integrations/GUI.lua:270
CLM.L["Begin Year"] = "Jahr beginnen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1075
CLM.L["Bench multiplier"] = "Bank Multiplikator"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1053
CLM.L["Bench"] = "Bank"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:248
CLM.L["Beth'tilac"] = "Beth'tilac"
-- ClassicLootManager_Alerts/Alerts.lua:32
CLM.L["Bid %s accepted!"] = "Gebot %s akzeptiert"
-- ClassicLootManager_Alerts/Alerts.lua:40
CLM.L["Bid %s denied!"] = "Gebot %s abgelehnt!"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1097
CLM.L["Bid accepted!"] = "Gebot akzeptiert"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1349
CLM.L["Bid cancelling not allowed"] = "Gebotsabbruch is nicht erlaubt"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1101
CLM.L["Bid denied!"] = "Gebot abgelehnt!"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1347
CLM.L["Bid increment too low"] = "Geboterhöhung ist zu niedrig"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:558
CLM.L["Bid input values as Main spec bid."] = "Gebote als Mainspec abgeben."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:585
CLM.L["Bid input values as Off spec bid."] = "Gebote als Offspec abgeben."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1345
CLM.L["Bid too high"] = "Gebot zu hoch"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1344
CLM.L["Bid too low"] = "Gebot zu niedrig"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:643
CLM.L["Bid your current DKP (%s)."] = "Biete deine aktuellen DKP (%s)."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:557
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:931
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:746
CLM.L["Bid"] = "Bieten"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1343
CLM.L["Bidding over current standings not allowed"] = "Gebot über deinem aktuellem Punktestand verboten"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1342
CLM.L["Bidding while below minimum standings not allowed"] = "Bieten unterhalb der Mindestpunktzahl nicht zulässig"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:174
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:392
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1042
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1332
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1422
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:551
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1138
-- ClassicLootManager/MinimapIcon.lua:140
CLM.L["Bidding"] = "Bieten"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:263
CLM.L["Bids"] = "Gebote"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:128
CLM.L["Bindings"] = "Bindungen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:62
CLM.L["Black Temple"] = "Schwarzer Tempel"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:7
CLM.L["Blackfathom Deeps"] = "Blackfathom Deeps"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_4_Cata.lua:17
CLM.L["Blackwing Descent"] = "Blackwing Descent"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:94
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:30
CLM.L["Blackwing Lair"] = "Pechschwingenhort"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:208
CLM.L["Blood Council"] = "Blood Council"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:117
CLM.L["Bloodlord Mandokir"] = "BLutfürst Mandokir"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:896
CLM.L["Bonuses"] = "Boni's"
-- ClassicLootManager/ClassicLootManager.lua:255
CLM.L["Boot complete"] = "Start fertig"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:902
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:521
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:79
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:237
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:79
CLM.L["Boss Kill Bonus"] = "Boss Kill Bonus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1237
CLM.L["Boss kill award values"] = "Boss Kill Wert"
-- ClassicLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:21
CLM.L["Both"] = "Beide"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:81
CLM.L["Broodlord Lashlayer"] = "Brutwächter Dreschbringer"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:173
CLM.L["Brutallus"] = "Brutallus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:125
CLM.L["Buru the Gorger"] = "Buru der Verschlinger"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1084
CLM.L["Button Names"] = "Knopfnamen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:95
CLM.L["C'Thun"] = "C'Thun"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1090
CLM.L["Can't use"] = "Kann nicht benutzt werden"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:571
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:739
CLM.L["Cancel your bid."] = "Dein Gebot abbrechen."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:570
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:738
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1094
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1258
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:301
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:429
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:847
CLM.L["Cancel"] = "Abbruch"
-- ClassicLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:133
CLM.L["Case-sensitive Player name in the format: Player-RealmName"] = "Fall-sensitiver Spielername im Format: Player-Realmname"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:686
CLM.L["Cataclysm"] = "Cataclysm"
-- ClassicLootManager_Integrations/Migration.lua:519
CLM.L["Change migration notes source"] = "Migrationsnotizen Quelle ändern"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:821
CLM.L["Change roster name."] = "Rostername ändern."
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:13
CLM.L["Changelog"] = "Änderungsprotokoll"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:286
CLM.L["Changes auction timer bar font size."] = "Ändert Auktions -Timer -Balken -Schriftgröße."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:269
CLM.L["Changes auction timer bar font."] = "Ändert Auktions -Timer -Bar -Schriftart."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:246
CLM.L["Changes auction timer bar height."] = "Ändert die Höhe der Auktions -Timer."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:309
CLM.L["Changes auction timer bar texture."] = "Ändert die Auktions -Timer -Balken -Textur."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:223
CLM.L["Changes auction timer bar width."] = "Ändert die Auktions -Timer -Balkenbreite."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1353
CLM.L["Changing bid from Main-spec to Off-Spec not allowed"] = "Bieten von Main-Spec zu Off-Spec nicht erlaubt"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:68
CLM.L["Channel for posting bids."] = "Kanal zum Posten der Gebote."
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:136
CLM.L["Chess Event"] = "Schachevent"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:801
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:834
CLM.L["Chest (robes)"] = "Brust (Roben)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:800
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:833
CLM.L["Chest"] = "Brust"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:234
CLM.L["Chimaeron"] = "Chimaeron"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:240
CLM.L["Cho'gall"] = "Cho'gall"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:85
CLM.L["Chromaggus"] = "Chromaggus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:683
CLM.L["Classic"] = "Classic"
-- ClassicLootManager/Modules/GUI/Filters.lua:192
CLM.L["Clear all classes."] = "Alle Klassen löschen."
-- ClassicLootManager_Integrations/GUI.lua:473
CLM.L["Clear output"] = "Ausgabe löschen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:275
CLM.L["Clear"] = "Löschen"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:196
CLM.L["Close on bid"] = "Schließen Sie das Gebot"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:218
CLM.L["Comma-separated (CSV) list of disenchanter names. Case insensitive. Player-RealmName."] = "Durch Kommas getrennte (CSV) Liste mit Namen von Entzauberern. Groß- und Kleinschreibung wird nicht beachtet. Player-RealmName"
-- ClassicLootManager/Utils.lua:1108
CLM.L["Common"] = "Üblich"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:243
CLM.L["Conclave of Wind"] = "Conclave of Wind"
-- ClassicLootManager_Integrations/GUI.lua:17
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:310
-- ClassicLootManager/MinimapIcon.lua:159
CLM.L["Configuration"] = "Konfiguration"
-- ClassicLootManager_Integrations/GenericImport.lua:174
CLM.L["Configure Rosters"] = "Kader konfigurieren"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:857
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:865
CLM.L["Copy settings from selected roster."] = "Einstellungen vom ausgewählten Roster kopieren."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:850
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:856
CLM.L["Copy settings"] = "Einstellungen kopieren"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:864
CLM.L["Copy source"] = "Quelle kopieren"
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:119
CLM.L["Core Loot Manager %s initialization complete. %s"] = "Core Loot Manager %s Initialisierung abgeschlossen. %s"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:13
-- ClassicLootManager/Modules/GUI/UnifiedGUI.lua:277
CLM.L["Core Loot Manager"] = "Core Loot Manager"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:526
CLM.L["Correcting error"] = "Fehler korrigieren"
-- ClassicLootManager_Tracker/Auction.lua:9
CLM.L["Count"] = "Zählen"
-- ClassicLootManager_Integrations/GenericImport.lua:177
CLM.L["Create Profiles"] = "Profile erstellen"
-- ClassicLootManager_Integrations/GenericImport.lua:171
CLM.L["Create Rosters"] = "Dienstpläne erstellen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:195
CLM.L["Create new raid with provided name. You will automatically join this raid and leave any other you are part of."] = "Neuen Raid mit eingegebenen Namen erstellen. Du wirst diesem Raid automatisch beitreten und alle anderen verlassen."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:500
CLM.L["Create raid %s %s in <%s>"] = "Raid erstellen %s %s in <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:194
CLM.L["Create raid"] = "Raid erstellen"
-- ClassicLootManager_Integrations/Integrations.lua:254
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1381
CLM.L["Create"] = "Erstellen"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:811
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:262
CLM.L["Created"] = "Erstellt"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1382
CLM.L["Creates new roster with default configuration"] = "Erstellt einen neuen Roster mit Standardkonfiguration"
-- ClassicLootManager_Integrations/Integrations.lua:255
CLM.L["Creates new trigger to be used during RCLC award."] = "Erstellt einen neuen Auslöser welcher während der Vergabe durch RCLC genutzt werden kann"
-- ClassicLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:9
CLM.L["Cross-guild sync"] = "Cross-Guild-Synchronisierung"
-- ClassicLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:122
CLM.L["Cross-guild synchronisation allows connecting two guild data through proxy mechanism called tunneling. Three types of connection are available: Send to, Accept from or Both. |cff00cc00Accepting data from another player will merge the two guilds databases.|r Use this functionality only if you are absolutely sure you know what you are doing."] = "Durch die Cross-Guild-Synchronisation werden zwei Gildendaten über den Proxy-Mechanismus angeschlossen, der als Tunneling bezeichnet wird. Es sind drei Arten von Verbindungen verfügbar: Senden, akzeptieren, von oder beides akzeptieren. |cFF00CC00ACCEPTING -Daten von einem anderen Player fusionieren die beiden Gildendatenbanken. |r verwenden diese Funktionalität nur, wenn Sie absolut sicher sind, dass Sie wissen, was Sie tun."
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:48
CLM.L["Crowd Pummeler 9-60"] = "Crowd Pummeler 9-60"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:608
CLM.L["Ctrl + Alt"] = "Ctrl + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:605
CLM.L["Ctrl"] = "Ctrl"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:940
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1332
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:755
CLM.L["Current"] = "Aktuell"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:181
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:180
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:185
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1328
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
CLM.L["DKP"] = "DKP"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:135
CLM.L["DPS"] = "DPS"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:345
CLM.L["Danger Zone - Use at own risk"] = "Achtung! Benutzung auf eigene Gefahr"
-- ClassicLootManager_Integrations/GUI.lua:221
CLM.L["Data"] = "Daten"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:271
CLM.L["Date"] = "Datum"
-- .:indirectly
CLM.L["Death Knight"] = "Death Knight"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:209
CLM.L["Deathbringer Saurfang"] = "Deathbringer Saurfang"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:320
CLM.L["Decay %"] = "Verfall %"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:402
CLM.L["Decay %s%% %s to %s selected players."] = "Verfall von %s%% %s für %s ausgewählte Spieler."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:398
CLM.L["Decay %s%% %s to everyone in roster."] = "Verfall von %s%% %s für alle im Kader."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:348
CLM.L["Decay Negatives"] = "Verfall von Negativen Werten"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:532
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:362
CLM.L["Decay"] = "Verfall"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:437
CLM.L["Decayed %s%% points to %s players in <%s>"] = "%s%% punkte verfallen von %s Spielern <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:461
CLM.L["Decayed %s%% points to all players %s in <%s>"] = "%s%% punkte verfallen von allen Spielern %s in <%s>"
-- ClassicLootManager_Integrations/GUI.lua:145
CLM.L["December"] = "Dezember"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:909
CLM.L["Default Boss Kill Bonus Value"] = "Standard Boss Kill Bonus"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:82
CLM.L["Default Boss Kill Bonus value"] = "Standard Boss Kill Bonus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1212
CLM.L["Default slot values"] = "Standard Slot Wert"
-- .:indirectly
CLM.L["Demon Hunter"] = "Demon Hunter"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:707
CLM.L["Description"] = "Beschreibung"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:350
CLM.L["Disable data synchronisation"] = "Datensynchronisation deaktivieren"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:351
CLM.L["Disable data synchronisation. This might lead to unexpected consequences. Use this at your own risk. Requires /reload to apply."] = "Datensynchronisation deaktivieren. Dies kann zu unerwarteten Konsequenzen führen. Verwendung auf eigene Gefahr! Erfordert /reload um aktiv zu werden."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:603
CLM.L["Disable"] = "Deaktivieren"
-- ClassicLootManager/MinimapIcon.lua:54
CLM.L["Disabled"] = "Deaktiviert"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:37
CLM.L["Disables display of the changelog for any new version."] = "Deaktiviert die Anzeige des Änderungsprotokolls für neue Versionen."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:663
CLM.L["Discard changes"] = "Änderungen löschen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:664
CLM.L["Discards all changes and exits sandbox mode"] = "Wirft alle Änderungen weg und verlässt den Sandbox Modus"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:496
CLM.L["Disenchant removed items"] = "Entfernte Itemsfürs Entzaubern markieren"
-- ClassicLootManager_Integrations/Integrations.lua:687
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:344
CLM.L["Disenchant"] = "Entzaubern"
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:230
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:28
CLM.L["Disenchanted"] = "Entzaubert"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:212
CLM.L["Disenchanters"] = "Entzauberer"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:276
CLM.L["Display price"] = "Preis anzeigen"
-- ClassicLootManager/Utils.lua:1119
CLM.L["Do Nothing"] = "Nichts tun"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:78
CLM.L["Do not show again"] = "Nicht mehr anzeigen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_4_Cata.lua:61
CLM.L["Dragon Soul"] = "Dragon Soul"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:687
CLM.L["Dragonflight"] = "Dragonflight"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:54
CLM.L["Dreamscythe and Weaver"] = "Dreamscythe and Weaver"
-- .:indirectly
CLM.L["Druid"] = "Druide"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1131
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1231
CLM.L["Dynamic Item values"] = "Dynamische Itemwerte"
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
CLM.L["ERROR - invalid import data"] = "Fehler - Ungültige Importdaten"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:83
CLM.L["Ebonroc"] = "Schattenschwinge"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:120
CLM.L["Edge of Madness"] = "Mojowahnsinn der Gurubashi"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:47
CLM.L["Electrocutioner 6000"] = "Electrocutioner 6000"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:186
CLM.L["Emalon the Storm Watcher"] = "Emalon der Sturmbeobachter"
-- ClassicLootManager_Integrations/Integrations.lua:118
CLM.L["Enable Gargul integration. This will allow Gargul to take control over some aspects of CLM (starting auction from Gargul, and awarding)."] = "Aktivieren Sie die Gargul Integration. Dadurch kann Gargul die Kontrolle über einige Aspekte von CLM (Startauktion von Gargul und Vergabe) übernehmen."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1154
CLM.L["Enable OS bids"] = "Aktivieren Sie OS -Gebote"
-- ClassicLootManager_Integrations/Integrations.lua:241
CLM.L["Enable RCLC integration. This will allow awarding DKP/GP points on RCLC item award. Requires /reload."] = "Aktiviert die RCLC Integration. Dadurch wird die Vergabe von DKP / GP anhand von RCLC ermöglicht. Änderung erfordert /reload."
-- ClassicLootManager_Integrations/Integrations.lua:364
CLM.L["Enable WoW DKP Bot Integration. This will result in additional data stored upon logout."] = "Aktiviert die WoW DKP Bot Integration. Benötigte Daten werden nach dem Logout gespeichert."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:240
CLM.L["Enable announcing auction start and end."] = "Aktiviert die Ankündigung vom Start und Ende der Auktion."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:179
CLM.L["Enable auto-update bid values when current highest bid changes (open auction only)."] = "Aktiviert das automatische Aktualisieren der Gebote wenn sich das höchste Gebot ändert (Nur für offene Auktion)."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:178
CLM.L["Enable auto-update bid values"] = "Aktiviert das automatische Aktualisieren der Gebote"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:57
CLM.L["Enable item tracking information in tooltip display."] = "Informationen zur Gegenstandsverfolgung in der Tooltippanzeige einschalten"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:392
CLM.L["Enable loot auto-assign (Master Looter UI) from corpse when item is awarded"] = "Automatische  Beutezuweisung von Leiche aktivieren, wenn ein Gegenstand verliehen wurde."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1327
CLM.L["Enable paid value splitting amongst raiders."] = "Aufteilung des bezahlten Gebotes auf alle Raider."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1281
CLM.L["Enable to allow base bids even if higher bids are present if player didn't bid yet. Affects Open-Ascending Auction."] = "Aktivieren, dass Grundgebote erlaubt sind, auch wenn höhere Gebote bereits platziert wurden, wenn kein Spieler bisher geboten hat. Beeinflusst die Offene-Aufsteigende Auktion ."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1297
CLM.L["Enable to allow equal bids. Affects Open-Ascending Auction."] = "Gleiche Gebote erlauben aktivieren. Beeinflusst die Offene-Aufsteigende Auktion."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1305
CLM.L["Enable to always allow 0 bids. Affects ascending item value mode."] = "Aktivieren Sie immer 0-Gebote. Beeinflusst die Gegenstandswert Modus."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1289
CLM.L["Enable to always allow All-In bids. Affects Open-Ascending Auction."] = "Aktivieren Sie immer All-In-Gebote. Beeinflusst die offene Auktion."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1162
CLM.L["Enable to always allow cancelling or passing bids. Affects Open-Ascending Auction."] = "Das Abbrechen oder Passen von Geboten immer erlauben aktivieren. Beeinflusst die Offene-Aufsteigende Auktion."
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:56
CLM.L["Enable tooltip display"] = "Tooltippanzeige einschalten"
-- ClassicLootManager/MinimapIcon.lua:83
CLM.L["Enables / disables minimap Icon"] = "Aktiviert / deaktiviert das Minimap Symbol"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:32
CLM.L["Enables / disables verbose data printing during logging"] = "Aktiviert / Deaktiviert ausführliche Daten während der Logaufzeichnung"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:256
CLM.L["Enables announcing loot awards."] = "Aktiviert das Ankündigen von Lootvergaben."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:264
CLM.L["Enables announcing new highest bid (when applicable)."] = "Aktiviert das Ankündigen des neuesten höchsten Gebots (wenn anwendbar)."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:231
CLM.L["Enables announcing raid start and end."] = "Aktiviert das Ankündigen von Raid Start und Ende."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:401
CLM.L["Enables auto-trade awarded loot after auctioning from bag"] = "Aktiviert das automatische Handeln von Loot aus der Tasche nach der Auktion"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:277
CLM.L["Enables displaying item price on tooltip."] = "Aktiviert die Anzeige von Itempreisen im Tooltip"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:248
CLM.L["Enables raid-warning countdown for auctions."] = "Aktiviert Countdown der Auktionen per Raidwarnung."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:794
CLM.L["End Timetravel"] = "Beendet Zeitreise"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:401
CLM.L["End selected raid"] = "Beendet ausgewählten Raid"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:644
CLM.L["Enter sandbox"] = "Aktiviert Sandbox"
-- ClassicLootManager/Utils.lua:1111
CLM.L["Epic"] = "Episch"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:502
CLM.L["Equation"] = "Gleichung"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:175
CLM.L["Eredar Twins"] = "Eredarzwillinge"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:870
CLM.L["Europe"] = "Europa"
-- .:indirectly
CLM.L["Evoker"] = "Evoker"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:363
CLM.L["Execute decay for players based on context."] = "Führen Sie den Verfall für Spieler aus, die auf dem Kontext basieren."
-- ClassicLootManager_Integrations/Migration.lua:67
CLM.L["Execute migration again if you are sure this is correct."] = "Führen Sie die Migration erneut aus, wenn Sie sicher sind, dass dies korrekt ist."
-- ClassicLootManager_Integrations/Migration.lua:512
CLM.L["Execute migration"] = "Führe Migration"
-- ClassicLootManager_Integrations/Migration.lua:73
CLM.L["Executing Addon Migration with comms disabled."] = "Führe Addon Migration mit deaktivierten Befehlen aus."
-- ClassicLootManager_Integrations/Migration.lua:64
CLM.L["Executing migration even though ledger is not empty."] = "Ausführung von Migration, obwohl das Ledger nicht leer ist."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:532
CLM.L["Exponent / Base"] = "Exponent / Basis"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:524
CLM.L["Exponential scaling value used by the equations (Base for EPGPWeb, or Exponent for WoWpedia)"] = "Exponentieller Skalierungswert, der von den Gleichungen verwendet wird (Basis für EPGPWEB oder Exponent für Wowpedia)"
-- ClassicLootManager_Integrations/GUI.lua:397
-- ClassicLootManager_Integrations/GUI.lua:406
-- ClassicLootManager_Integrations/GUI.lua:483
-- ClassicLootManager_Integrations/GUI.lua:484
-- ClassicLootManager/MinimapIcon.lua:153
CLM.L["Export"] = "Export"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:82
CLM.L["Extend auction bid list with received item count information. Requires reload."] = "Auktionsliste der Gebote erweitern mit Informationen zur Anzahl der erhaltenen Gegenstände"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:65
CLM.L["Extend tooltip with more specific loot information."] = "Tooltipp mit mehr spezifischen Informationen erweitern"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:64
CLM.L["Extended tooltip"] = "Erweiterter Tooltipp"
-- ClassicLootManager/Modules/GUI/Filters.lua:79
CLM.L["External"] = "Extern"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:204
CLM.L["Faction Champions"] = "Fraktion Champions"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:37
CLM.L["False"] = "Falsch"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:90
CLM.L["Fankriss the Unyielding"] = "Fankriss der Unnachgiebige"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:145
CLM.L["Fathom-Lord Karathress"] = "Tiefenlord Karathress"
-- ClassicLootManager_Integrations/GUI.lua:135
CLM.L["February"] = "Februar"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:807
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:840
CLM.L["Feet"] = "Füße"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:174
CLM.L["Felmyst"] = "Teufelsruch"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:210
CLM.L["Festergut"] = "Festergut"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:53
CLM.L["Festering Rotslime"] = "Festering Rotslime"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:432
CLM.L["Fill auction list from corpse"] = "Auktionsliste aus Leiche ausfüllen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:433
CLM.L["Fill auction list with items from corpse. Will happen only if you open the corpse loot window."] = "Auktionsliste mit Gegenstände aus der Leiche ausfüllen. Geschieht nur, wenn das Beutefenster der Leiche geöffnet wird."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:450
CLM.L["Fill auction list with looted items"] = "Auktionsliste mit geplünderten Gegenständen ausfüllen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:451
CLM.L["Fill auction list with looted items. This will automatically add all items you have received."] = "Auktionsliste mit geplünderten Gegenständen ausfüllen. Dies fügt alle von dir erhaltenen Gegenstände automatisch hinzu."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:104
CLM.L["Fill from Guild"] = "Aus Gilde auffüllen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:116
CLM.L["Fill from Raid Roster"] = "Aus Raid Roster auffüllen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:442
CLM.L["Fill from corpse only if you are the Loot Master."] = "Nur von der Leiche aus ausfüllen, wenn man Plündermeister ist."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:460
CLM.L["Fill from loot only if you are using Group Loot."] = "Nur ausfüllen wenn Plündern als Gruppe genutzt wird."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:117
CLM.L["Fill profile list with players in current raid roster."] = "Fülle Profilliste mit Spielern im aktuellen Raid Roster."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:105
CLM.L["Fill profile list with players with the minimum level and ranks."] = "Fülle Profilliste mit Spieler mit Minimumlevel und Rängen."
-- ClassicLootManager/Modules/GUI/Filters.lua:163
CLM.L["Filter"] = "Filter"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:808
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:841
CLM.L["Finger"] = "Finger"
-- ClassicLootManager_Integrations/GUI.lua:281
CLM.L["Finish Day"] = "Endtag"
-- ClassicLootManager_Integrations/GUI.lua:292
CLM.L["Finish Month"] = "Endmonat"
-- ClassicLootManager_Integrations/GUI.lua:303
CLM.L["Finish Year"] = "Endjahr"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:524
CLM.L["Finished raid %s"] = "Raid %s beendet"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:813
CLM.L["Finished"] = "Beendet"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_4_Cata.lua:48
CLM.L["Firelands"] = "Firelands"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:82
CLM.L["Firemaw"] = "Feuerschwinge"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:191
CLM.L["Flame Leviathan"] = "Flame Leviathan"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:84
CLM.L["Flamegor"] = "Flammenmaul"
-- ClassicLootManager_Integrations/GUI.lua:232
CLM.L["Format"] = "Format"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:132
CLM.L["Found %s in guild."] = "%s in Gilde gefunden."
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:192
CLM.L["Freya"] = "Freya"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:227
CLM.L["GM"] = "GM"
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
CLM.L["Gahz'ranka"] = "Gahz'ranka"
-- ClassicLootManager_Integrations/Integrations.lua:111
-- ClassicLootManager_Integrations/Integrations.lua:117
CLM.L["Gargul Integration"] = "Gargul Integration"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:72
CLM.L["Garr"] = "Garr"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:71
CLM.L["Gehennas"] = "Gehennas"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:40
CLM.L["Gelihast"] = "Gelihast"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:123
CLM.L["General Rajaxx"] = "General Rajaxx"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:193
CLM.L["General Vezax"] = "General Vezax"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:221
CLM.L["General Zarithrian"] = "General Zarithrian"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:815
CLM.L["General settings"] = "Allgemeine Einstellungen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:38
CLM.L["Ghamoo-ra"] = "Ghamoo-ra"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:103
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:794
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:827
CLM.L["Global"] = "Global"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:101
CLM.L["Gluth"] = "Gluth"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:20
CLM.L["Gnomeregan"] = "Gnomeregan"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:76
CLM.L["Golemagg the Incinerator"] = "Golemagg der Verbrenner"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:107
CLM.L["Gothik the Harvester"] = "Gothik der Seelenjäger"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:97
CLM.L["Grand Widow Faerlina"] = "Großwitwe Faerlina"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:100
CLM.L["Grobbulus"] = "Grobbulus"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:459
CLM.L["Group Loot Only"] = "Nur Plündern als Gruppe"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:45
CLM.L["Grubbis"] = "Grubbis"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:140
CLM.L["Gruul the Dragonkiller"] = "Gruul der Drachenschlächter"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:25
CLM.L["Gruul's Lair"] = "Gruuls Unterschlupf"
-- ClassicLootManager/Modules/Global/GlobalGuildChangeHandler.lua:18
CLM.L["Guild change detected. Disabling synchronisation until UI reload."] = "Gildenwechsel erkannt. Deaktivieren der Synchronisation bis zum Nachladen von UI."
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:156
CLM.L["Gurtogg Bloodboil"] = "Gurtogg Siedeblut"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:257
CLM.L["Hagara the Stormbinder"] = "Hagara the Stormbinder"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:119
CLM.L["Hakkar"] = "Hakkar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:169
CLM.L["Halazzi"] = "Halazzi"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:237
CLM.L["Halfus Wyrmbreaker"] = "Halfus Wyrmbreaker"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:223
CLM.L["Halion"] = "Halion"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:804
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:837
CLM.L["Hands"] = "Hände"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:658
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:104
CLM.L["Hard Mode"] = "Hardmodus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1021
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:106
CLM.L["Hard cap"] = "Oberes Limit"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:181
CLM.L["Hash"] = "Hash"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:795
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:828
CLM.L["Head"] = "Kopf"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:134
CLM.L["Healer"] = "Heiler"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:104
CLM.L["Heigan the Unclean"] = "Heigan der Unreine"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:813
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:846
CLM.L["Held In Off-hand"] = "In Schildhand geführt"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:30
CLM.L["Heroic"] = "Heroic"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:170
CLM.L["Hex Lord Malacrass"] = "Hexlord Malacrass"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:358
CLM.L["Hide in combat"] = "Im Kampf verstecken"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:150
CLM.L["High Astromancer Solarian"] = "Hochastromantin Solarian"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:139
CLM.L["High King Maulgar"] = "Hochkönig Maulgar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:112
CLM.L["High Priest Thekal"] = "Hohepriester Thekal"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:113
CLM.L["High Priest Venoxis"] = "Hohepriester Venoxis"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:114
CLM.L["High Priestess Arlokk"] = "Hohepriesterin Arlokk"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:115
CLM.L["High Priestess Jeklik"] = "Hohepriesterin Jeklik"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:116
CLM.L["High Priestess Mar'li"] = "Hohepriesterin Mar'li"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:152
CLM.L["High Warlord Naj'entus"] = "Oberster Kriegsfürst Naj'entus"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:136
CLM.L["History type"] = "Verlaufstyp"
-- .:indirectly
CLM.L["History"] = "Verlauf"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:194
CLM.L["Hodir"] = "Hodir"
-- .:indirectly
CLM.L["Hunter"] = "Jäger"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:142
CLM.L["Hydross the Unstable"] = "Hydross der Unstete"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:77
CLM.L["Hyjal Summit"] = "Hyjalgipfel"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:87
CLM.L["Icecrown Citadel"] = "Icecrown Citadel"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:212
CLM.L["Icecrown Gunship Battle"] = "Eiskrone Luftschiff Kampf"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:195
CLM.L["Ignis the Furnace Master"] = "Ignis der Ofenmeister"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:78
CLM.L["Ignore entry"] = "Eintrag ignorieren"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:205
CLM.L["Ignore unusable items"] = "Ignorieren Sie unbrauchbare Gegenstände"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:505
CLM.L["Ignore"] = "Ignorieren"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:206
CLM.L["Ignores unusable items. They will not be added to bidding window."] = "Ignoriert unbrauchbare Gegenstände. Sie werden nicht zum Bietungsfenster hinzugefügt."
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:160
CLM.L["Illidan Stormrage"] = "Illidan Sturmgrimm"
-- ClassicLootManager_Integrations/Migration.lua:279
-- ClassicLootManager_Integrations/Migration.lua:413
-- ClassicLootManager_Integrations/Migration.lua:455
-- ClassicLootManager_Integrations/Migration.lua:504
CLM.L["Import complete"] = "Importieren fertiggestellt"
-- ClassicLootManager_Integrations/GenericImport.lua:221
-- ClassicLootManager_Integrations/GenericImport.lua:254
-- ClassicLootManager_Integrations/GenericImport.lua:255
-- ClassicLootManager_Integrations/GenericImport.lua:262
-- ClassicLootManager_Integrations/ImportCSV.lua:99
-- ClassicLootManager_Integrations/ImportCSV.lua:161
-- ClassicLootManager_Integrations/ImportCSV.lua:162
-- ClassicLootManager_Integrations/ImportCSV.lua:190
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:531
CLM.L["Import"] = "Importieren"
-- ClassicLootManager_Integrations/Migration.lua:230
CLM.L["Importing %s entries from DKPTable"] = "Importiere %s Einträgen von der DKP Liste"
-- ClassicLootManager_Integrations/Migration.lua:341
CLM.L["Importing profiles from DKPTable"] = "Profile von der DKP Liste importieren"
-- ClassicLootManager/Modules/GUI/Filters.lua:78
CLM.L["In Guild"] = "In Gilde"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:812
CLM.L["In Progress"] = "Im Gange"
-- ClassicLootManager/Modules/GUI/Filters.lua:75
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:290
CLM.L["In Raid"] = "Im Raid"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:645
CLM.L["In sandbox mode all communication is disabled and changes are local until applied. Click Apply changes to store changes and exit sandbox mode. Click Discard to undo changes and exit sandbox mode. /reload will discard changes. Entering sandbox mode will cancel time travel."] = "Im Sandbox Modus wird jegliche Kommunikation ausgeschaltet und Änderungen sind lokal bis sie angewandt werden. Klicke auf Änderungen anwenden um sie zu speichern und verlasse den Sandbox Modus. Klicke verwerfen um die Änderungen wieder rückgängig zu machen und den Sandbox Modus zu verlassen. /reload verwirft die Änderungen. Geht man in den Sandbox Modus verlässt man den Zeitreise Modus."
-- ClassicLootManager/MinimapIcon.lua:50
CLM.L["In-Sync"] = "Synchronisiert"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:971
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:139
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:124
CLM.L["Include bench"] = "Bank mit einbeziehen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:972
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:140
CLM.L["Include benched players in all auto-awards"] = "Beziehe die Bank in alle automatischen Punkte mit ein"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:377
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:419
CLM.L["Include cancels in bid list in open auction mode."] = "Fügen Sie Stornierungen in der Gebotsliste im offenen Auktionsmodus ein."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:376
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:418
CLM.L["Include cancels"] = "Stornieren einschließen"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:368
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:410
CLM.L["Include passes in bid list in open auction mode."] = "Fügen Sie die Ausgaben in der Gebotsliste im offenen Auktionsmodus ein."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:367
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:409
CLM.L["Include passes"] = "Pässe einschließen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:349
CLM.L["Include players with negative standings in decay."] = "Beziehe Spieler mit negativer Wertung in Verfall mit ein."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:304
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:312
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:320
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:328
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:336
CLM.L["Include"] = "Behinhalten"
-- ClassicLootManager/MinimapIcon.lua:48
CLM.L["Incoherent state"] = "Zumsammenhangsloser Zustand"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:261
CLM.L["Info"] = "Info"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:481
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:487
CLM.L["Information"] = "Information"
-- ClassicLootManager_Integrations/ImportCSV.lua:72
CLM.L["Input CSV Item value override data"] = "Wähle CSV Itemwerte zum überschreiben"
-- ClassicLootManager_Integrations/GenericImport.lua:198
CLM.L["Input JSON exported standings"] = "Wähle JSON exportierte Punktestände"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:127
CLM.L["Input name: %s"] = "Füge Namen ein: %s"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:106
CLM.L["Instructor Razuvious"] = "Instrukteur Razuvious"
-- ClassicLootManager_Integrations/ClassicLootManager_Integrations.lua:18
CLM.L["Integrations"] = "Integrationen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:100
CLM.L["Interval Bonus time"] = "Intervall Bonuszeit"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:947
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:533
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:116
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:249
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:97
CLM.L["Interval Bonus"] = "Intervall Bonus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:954
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:123
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:251
CLM.L["Interval Time"] = "Intervall Zeit"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:963
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:131
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:252
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:103
CLM.L["Interval Value"] = "Intervall Wert"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:955
CLM.L["Interval in [minutes] to award bonus points"] = "Intervall in [Minuten] um Bonuspunkte zu gewähren"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1346
CLM.L["Invalid bid value"] = "Ungültiger Gebotswert"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:396
CLM.L["Invalid context. You should not decay raid only."] = "Ungültiger Kontext. Du kannst nicht nur den Raid verfallen lassen."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:16
CLM.L["Invalid item link"] = "Ungültiger Gegenstandslink"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1352
CLM.L["Invalid item"] = "Ungültiger Gegenstand"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1123
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1312
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:58
CLM.L["Item value mode"] = "Gegenstandswert Modus"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:22
CLM.L["Item value must be positive"] = "Gestandswertswert muss im Positiven liegen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1225
CLM.L["Item value overrides"] = "Überschreibe den Gegenstandswert"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:91
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:101
CLM.L["Item"] = "Gegenstand"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:56
CLM.L["Jammal'an and Ogom"] = "Jammal'an and Ogom"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:168
CLM.L["Jan'alai"] = "Jan'alai"
-- ClassicLootManager_Integrations/GUI.lua:134
CLM.L["January"] = "Januar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:118
CLM.L["Jin'do the Hexxer"] = "Jin'do der Verhexer"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:88
CLM.L["Join our discord for more info: "] = "Für mehr Informationen kommt auf unseren Discord: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:415
CLM.L["Join selected raid"] = "Dem ausgewählten Raid beitreten"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:535
CLM.L["Joining roster"] = "Beitritt zum Kader"
-- ClassicLootManager_Integrations/GUI.lua:140
CLM.L["July"] = "Juli"
-- ClassicLootManager_Integrations/GUI.lua:139
CLM.L["June"] = "Juni"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:151
CLM.L["Kael'thas Sunstrider"] = "Kael'thas Sonnenwanderer"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:172
CLM.L["Kalecgos"] = "Kalecgos"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:8
CLM.L["Karazhan"] = "Karazhan"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:163
CLM.L["Kaz'rogal"] = "Kaz'rogal"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:110
CLM.L["Kel'Thuzad"] = "Kel'Thuzad"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:177
CLM.L["Kil'jaeden"] = "Kil'jaeden"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:196
CLM.L["Kologarn"] = "Kologarn"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:187
CLM.L["Koralon the Flame Watcher"] = "Koralon der Flame Watcher"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:122
CLM.L["Kurinnaxx"] = "Kurinnaxx"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:32
CLM.L["LFR"] = "LFR"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:213
CLM.L["Lady Deathwhisper"] = "Lady Deathwhisper"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:39
CLM.L["Lady Sarevess"] = "Lady Sarevess"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:147
CLM.L["Lady Vashj"] = "Lady Vashj"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:410
CLM.L["Large value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Großer Wert für stufenbasierte Auktion. \n\n Auf denselben Wert wie andere Stufe oder negativ setzen zum ignorieren."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:904
CLM.L["Large"] = "Groß"
-- ClassicLootManager_Integrations/GUI.lua:321
CLM.L["Last month"] = "Im vergangenen Monat"
-- ClassicLootManager_Integrations/GUI.lua:314
CLM.L["Last week"] = "Letzte Woche"
-- ClassicLootManager_Integrations/GUI.lua:328
CLM.L["Last year"] = "Vergangenes Jahr"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:501
CLM.L["Latest loot"] = "Letzte Beute"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:524
CLM.L["Latest points"] = "Neueste Punkte"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:304
-- ClassicLootManager/Utils.lua:1112
CLM.L["Legendary"] = "Legendär"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:806
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:839
CLM.L["Legs"] = "Beine"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:144
CLM.L["Leotheras the Blind"] = "Leotheras der Blinde"
-- ClassicLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:71
-- ClassicLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:122
-- ClassicLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:147
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:77
CLM.L["Link Alt to Main"] = "Verknüpfe Twink mit dem Main"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:534
CLM.L["Linking override"] = "Verknüpfung überschreiben"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:378
-- ClassicLootManager/MinimapIcon.lua:44
CLM.L["Loading..."] = "Lädt..."
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:105
CLM.L["Loatheb"] = "Loatheb"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:271
CLM.L["Lock selected"] = "Ausgewählte sperren"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:469
-- ClassicLootManager/Modules/GUI/Filters.lua:81
CLM.L["Locked"] = "Gesperrt"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:22
CLM.L["Logging level"] = "Aufzeichnungs Level"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:18
CLM.L["Logging"] = "Aufzeichnung"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:255
CLM.L["Loot Awards"] = "Loot Gewinne"
-- ClassicLootManager_Integrations/GUI.lua:20
CLM.L["Loot History"] = "Loot Verlauf"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:285
CLM.L["Loot Rolling"] = "Beute Verwürfeln"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:468
CLM.L["Loot rarity"] = "Plünderrarität"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:21
CLM.L["Loot"] = "Beute"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:205
CLM.L["Lord Jaraxxus"] = "Lord Jaraxxus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:64
CLM.L["Lord Kazzak"] = "Lord Kazzak"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:214
CLM.L["Lord Marrowgar"] = "Lord Marrowgar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:247
CLM.L["Lord Rhyolith"] = "Lord Rhyolith"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:41
CLM.L["Lorgus Jett"] = "Lorgus Jett"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:69
CLM.L["Lucifron"] = "Lucifron"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:176
CLM.L["M'uru"] = "M'uru"
-- ClassicLootManager_Integrations/Integrations.lua:129
-- ClassicLootManager_Integrations/Integrations.lua:134
-- ClassicLootManager_Integrations/Integrations.lua:139
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:557
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:426
CLM.L["MS"] = "MS"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:261
CLM.L["Madness of Deathwing"] = "Madness of Deathwing"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:98
CLM.L["Maexxna"] = "Maexxna"
-- .:indirectly
CLM.L["Mage"] = "Magier"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:70
CLM.L["Magmadar"] = "Magmadar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:230
CLM.L["Magmaw"] = "Magmaw"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:33
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:141
CLM.L["Magtheridon"] = "Magtheridon"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:130
CLM.L["Maiden of Virtue"] = "Tugendhafte Maid"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:811
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:844
CLM.L["Main Hand"] = "Waffenhand"
-- ClassicLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:62
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:180
CLM.L["Main"] = "Main"
-- ClassicLootManager/Modules/GUI/Filters.lua:80
CLM.L["Mains"] = "Mains"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:77
CLM.L["Majordomo Executus"] = "Majordomus Exekutus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:251
CLM.L["Majordomo Staghelm"] = "Majordomo Staghelm"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:232
CLM.L["Maloriak"] = "Maloriak"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:184
CLM.L["Malygos"] = "Malygos"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:146
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:71
CLM.L["Management"] = "Management"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:229
CLM.L["Manager"] = "Manager"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:527
CLM.L["Manual adjustment"] = "Manuelle Anpassung"
-- ClassicLootManager_Integrations/GUI.lua:136
CLM.L["March"] = "Marsch"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:441
CLM.L["Master Loot Only"] = "Nur Plündermeister"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:905
CLM.L["Max"] = "Маximum"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1013
CLM.L["Maximum point cap player can receive per raid week. Set to 0 to disable."] = "Maximale Punnkte die ein Spieler pro Woche erhalten kann. Zum Ausschalten auf 0 setzen."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1022
CLM.L["Maximum point cap that player can have. Set to 0 to disable."] = "Maximale Punkte die ein Spieler erhalten kann. Zum Ausschalten auf 0 setzen."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:414
CLM.L["Maximum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Maximaler Wert für aufsteigende und stufenbasierte Auktion. \n\nDenselben Wert wie andere Stufe oder negativ setzen zum ignorieren."
-- ClassicLootManager_Integrations/GUI.lua:138
CLM.L["May"] = "Mai"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:49
CLM.L["Mechanical Menagerie"] = "Mechanical Menagerie"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:406
CLM.L["Medium value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Mittlerer Wert für stufenbasierte Auktion. \n\nDenselben Wert wie andere Stufe oder negativ setzen zum ignorieren."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:903
CLM.L["Medium"] = "Mittel"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:50
CLM.L["Mekgineer Thermaplugg"] = "Mekgineer Thermaplugg"
-- ClassicLootManager/MinimapIcon.lua:121
CLM.L["Menu"] = "Menü"
-- ClassicLootManager_Integrations/Migration.lua:217
-- ClassicLootManager_Integrations/Migration.lua:295
-- ClassicLootManager_Integrations/Migration.lua:423
-- ClassicLootManager_Integrations/Migration.lua:466
CLM.L["Migrating %s"] = "Migration %s"
-- ClassicLootManager_Integrations/Migration.lua:89
CLM.L["Migration complete. %s to apply and sync with others or go to %s to discard."] = "Migration fertig. %s zum Anwenden und synchronisieren oder gehe zu %s zum verwerfen."
-- ClassicLootManager_Integrations/Migration.lua:318
CLM.L["Migration failure: Detected 0 teams"] = "Migratiosfehler: 0 Teams erkannt"
-- ClassicLootManager_Integrations/Migration.lua:256
-- ClassicLootManager_Integrations/Migration.lua:372
CLM.L["Migration failure: Unable to create profiles"] = "Migrationsfehler: Konnte keine Profile erstellen"
-- ClassicLootManager_Integrations/Migration.lua:35
CLM.L["Migration ongoing: %s(%s)"] = "Migration im Gange: %s(%s)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:197
CLM.L["Mimiron"] = "Mimiron"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:118
CLM.L["Min bid increment"] = "Minimale Gebotssteigerung"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1357
CLM.L["Minimal increment"] = "Minimale Steigerung"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1358
CLM.L["Minimal value increment for open auction mode."] = "Minimale Gebotssteigerung bei offener Auktion."
-- ClassicLootManager_Integrations/Migration.lua:91
CLM.L["Minimap Icon -> Configuration -> Wipe events"] = "Minimapsymbol -> Konfiguration -> Events löschen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1098
CLM.L["Minimum GP used in calculations when player has less GP than this value."] = "Der in Berechnungen verwendete Minimum GP, wenn der Spieler weniger GP als dieser Wert hat."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1097
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:142
CLM.L["Minimum GP"] = "Minimaler GP"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:91
CLM.L["Minimum Level"] = "Minimales Level"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:92
CLM.L["Minimum level of players to fill from guild."] = "Minimales Level der Spieler, welche von der Gilde gefüllt werden."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:139
CLM.L["Minimum points (DKP / EP)"] = "Mindestpunkte (DKP / EP)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1145
CLM.L["Minimum standing required to be allowed to bid."] = "Erfordert minimalen Punktestand um bieten zu können."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1144
CLM.L["Minimum standing"] = "Minimaler Punktestand"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:281
CLM.L["Missing award value"] = "Fehlender Preiswert"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:392
CLM.L["Missing decay value"] = "Fehlender Zerfallwert"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:55
CLM.L["Missing profile %s"] = "Fehlendes Profil %s"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:33
CLM.L["Missing roster name and you are not in raid"] = "Rostername fehlt und du bist nicht in einem Schlachtzug"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:37
CLM.L["Missing roster name. Using Raid Info"] = "Rostername fehlt. Benutze Schlachtzug Information"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:325
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:397
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:436
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:465
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:499
CLM.L["Missing valid raid"] = "Gültiger Schlachtzug fehlt"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:124
CLM.L["Moam"] = "Moam"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:248
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:477
CLM.L["Modifier combination"] = "Modifikator Kombination"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:53
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:61
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:14
CLM.L["Molten Core"] = "Geschmolzener Kern"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:254
CLM.L["Morchok"] = "Morchok"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:129
CLM.L["Moroes"] = "Moroes"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:146
CLM.L["Morogrim Tidewalker"] = "Morogrim Gezeitenwandler"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:57
CLM.L["Morphaz and Hazzas"] = "Morphaz and Hazzas"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:158
CLM.L["Mother Shahraz"] = "Mutter Shahraz"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:328
--CLM.L["Mounts"] = ""
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:233
CLM.L["Moving %s from current queue to pending queue."] = "Umzug %s von der aktuellen Warteschlange zur ausstehenden Warteschlange."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:444
CLM.L["Multiple"] = "Mehrere"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:587
CLM.L["Multiplier for tier %s (if used by the auction type)."] = "Multiplikator für Tier %s (bei Verwendung des Auktionstyps)."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:510
CLM.L["Multiplier used by the equations"] = "Von den Gleichungen verwendeter Multiplikator"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:296
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:518
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1218
CLM.L["Multiplier"] = "Multiplikator"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1194
CLM.L["Multiply auction time by the number of items to increase auction time lineary."] = "Multiplizieren Sie die Auktionszeit mit der Anzahl der Gegenstände, um die Auktionszeit linear zu erhöhen."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1193
CLM.L["Multiply time"] = "Zeit vervielfachen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:31
CLM.L["Mythic"] = "Mythic"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:167
CLM.L["Nalorakk"] = "Nalorakk"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:928
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:743
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:820
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:427
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:438
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:179
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:260
CLM.L["Name"] = "Name"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:145
CLM.L["Named Buttons"] = "Benannte Knöpfe"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:130
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:59
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:8
CLM.L["Naxxramas"] = "Naxxramas"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:796
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:829
CLM.L["Neck"] = "Hals"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:86
CLM.L["Nefarian"] = "Nefarian"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:235
CLM.L["Nefarian's End"] = "Nefarian's End"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:135
CLM.L["Netherspite"] = "Nethergroll"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:36
CLM.L["Never show changelog"] = "Niemals das Änderungsprotokoll (Changelog) zeigen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1160
CLM.L["New highest bid on %s: %s %s %s"] = "Neues Höchstgebot für %s: %s %s %s"
-- ClassicLootManager_Integrations/Migration.lua:47
CLM.L["New migration source for note-based AddOns: %s"] = "Neue Migrationsquelle für Notiz-basierte Addons: %s"
-- ClassicLootManager_Integrations/GenericImport.lua:104
CLM.L["New roster: %s"] = "Neuer Kader: %s"
-- ClassicLootManager_Integrations/Migration.lua:144
CLM.L["New roster: [%s]"] = "Neuer Kader: [%s]"
-- ClassicLootManager/Modules/Common/Version/Version.lua:76
CLM.L["New version of Core Loot Manager is available. For best experience please update the AddOn."] = "Neue Version von Core Loot Manager vorhanden. Bitte das Addon updaten für das beste Erlebnis"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:796
CLM.L["Next item"] = "Nächster Punkt"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:795
CLM.L["Next"] = "Nächster"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:138
CLM.L["Nightbane"] = "Schrecken der Nacht"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1348
CLM.L["No auction in progress"] = "Keine Auktion im Gange"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:192
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:179
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:902
CLM.L["No bids"] = "Keine Gebote"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:518
CLM.L["No loot received"] = "Keine Beute erhalten"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:255
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:381
CLM.L["No players selected"] = "Keine Spieler ausgewählt"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:543
CLM.L["No points received"] = "Keine Punkte erhalten"
-- ClassicLootManager/Utils.lua:599
CLM.L["No"] = "Nein"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:818
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:851
CLM.L["Non-equippable"] = "Nicht ausrüstbar"
-- ClassicLootManager_Integrations/Integrations.lua:680
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:223
-- ClassicLootManager/Modules/GUI/Filters.lua:191
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:301
CLM.L["None"] = "Kein"
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:103
CLM.L["Normal Mode"] = "Normalmodus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:29
CLM.L["Normal"] = "Normal"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:206
CLM.L["Northrend Beasts"] = "Northrend Beasts"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1341
CLM.L["Not in a roster"] = "Nicht in einem Roster"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:272
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:560
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:638
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:683
CLM.L["Not in raid"] = "Nicht in einem Schlachtzug"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:161
CLM.L["Note to be added to award. Max 25 characters. It is recommended to not include date nor selected reason here. If you will input encounter ID it will be transformed into boss name."] = "Notiz, welcher der Vergabe hinzugefügt wird. Max 25 Zeichen. Es wird empfohlen, hier weder Datum noch den ausgewählte Grund einzuschließen. Wenn Sie die Boss-ID eingeben, wird sie in den Boss Namen umgewandelt."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:120
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:159
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:233
CLM.L["Note"] = "Notiz"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:103
CLM.L["Noth the Plaguebringer"] = "Noth der Seuchenfürst"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:727
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:812
CLM.L["Notify that you are passing on the item."] = "Melden das man auf einen Gegenstand passt."
-- ClassicLootManager_Integrations/GUI.lua:144
CLM.L["November"] = "November"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:704
CLM.L["Num"] = "Nummer"
-- ClassicLootManager_Integrations/Integrations.lua:144
-- ClassicLootManager_Integrations/Integrations.lua:149
-- ClassicLootManager_Integrations/Integrations.lua:154
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:584
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:427
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1153
CLM.L["OS"] = "OS"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:227
CLM.L["Occu'thar"] = "Occu'thar"
-- ClassicLootManager_Integrations/GUI.lua:143
CLM.L["October"] = "Oktober"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:812
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:845
CLM.L["Off Hand"] = "Schildhand"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1351
CLM.L["Off-spec bidding not allowed"] = "Off-Spec-Gebote nicht erlaubt"
-- ClassicLootManager_Integrations/Migration.lua:50
CLM.L["Officer notes"] = "Anmerkungen des Offiziers"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:231
CLM.L["Omnotron Defense System"] = "Omnotron Defense System"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:924
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:93
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:241
CLM.L["On Time Bonus Value"] = "Wert für Pünktlichkeits Bonus"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:88
CLM.L["On Time Bonus value"] = "Wert für Pünktlichkeits Bonus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:917
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:520
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:86
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:239
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:85
CLM.L["On Time Bonus"] = "Pünktlichkeits Bonus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:810
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:843
CLM.L["One-Hand"] = "Einhändig"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:979
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:127
CLM.L["Online only"] = "Nur online"
-- ClassicLootManager/Modules/GUI/Filters.lua:76
CLM.L["Online"] = "Online"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:193
CLM.L["Only when ML/RL"] = "Nur wenn ML/RL"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:68
CLM.L["Onyxia"] = "Onyxia"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:46
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:7
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:105
CLM.L["Onyxia's Lair"] = "Onyxias Hort"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:129
CLM.L["Open Key Bindings UI for AddOns"] = "Die Tastaturbelegungs-UI für Addons öffnen"
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:55
CLM.L["Open trade"] = "Handel öffnen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:718
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:725
CLM.L["Open"] = "Offen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:131
CLM.L["Opera Hall"] = "Schach Event"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:127
CLM.L["Ossirian the Unscarred"] = "Ossirian der Narbenlose"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1351
CLM.L["Other"] = "Sonstiges"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:94
CLM.L["Ouro"] = "Ouro"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:75
CLM.L["Overrides"] = "Überschreibt"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1292
CLM.L["PASS"] = "PASSE"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1106
CLM.L["PR Rounding"] = "PR Runden"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1330
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:439
CLM.L["PR"] = "PR"
-- .:indirectly
CLM.L["Paladin"] = "Paladin"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:288
CLM.L["Participated"] = "Teilgenommen"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:726
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:811
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1094
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1258
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:301
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:428
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:847
CLM.L["Pass"] = "Passe"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1350
CLM.L["Passing after bidding not allowed"] = "Passen ist nach dem Bieten nicht erlaubt."
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:99
CLM.L["Patchwerk"] = "Flickwerk"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:320
CLM.L["Patterns"] = "Muster"
-- ClassicLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:132
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:129
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:124
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:272
CLM.L["Player"] = "Spieler"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:363
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:376
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:393
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:407
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:421
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:440
CLM.L["Please select a raid"] = "Bitte einen Schlachtzug auswählen"
-- ClassicLootManager_Integrations/GUI.lua:19
CLM.L["Point History"] = "Punktehistorie"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1076
CLM.L["Point award multiplier for players on bench."] = "Point Award Multiplikator für Spieler auf der Bank."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:997
CLM.L["Point caps"] = "Punktelimit"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:827
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1398
CLM.L["Point type"] = "Punktetyp"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:22
CLM.L["Point"] = "Punkt"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:184
CLM.L["Points value that will be awarded."] = "Punktewert, der vergeben wird."
-- ClassicLootManager/Utils.lua:1107
CLM.L["Poor"] = "Schlecht"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:517
CLM.L["Post all bids after awarding item"] = "Veröffentlichen Sie alle Gebote nach der Vergabe von Artikeln"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:516
CLM.L["Post all bids on award"] = "Veröffentlichen Sie alle Gebote für die Auszeichnung"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:67
CLM.L["Post bids"] = "Gebote posten"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:67
CLM.L["Post channel"] = "Kanal zum Posten"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:272
CLM.L["Price Tooltips"] = "Preis im Tooltip"
-- .:indirectly
CLM.L["Priest"] = "Priester"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:137
CLM.L["Prince Malchezaar"] = "Prinz Malchezaar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:66
CLM.L["Prince Thunderaan"] = "Prince Thunderaan"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:92
CLM.L["Princess Huhuran"] = "Prinzessin Huhuran"
-- ClassicLootManager_Integrations/Integrations.lua:139
-- ClassicLootManager_Integrations/Integrations.lua:154
CLM.L["Prioritized"] = "Priorisiert"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:215
CLM.L["Professor Putricide"] = "Professor Patrikmide"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:276
CLM.L["Profile %s already exists and is used by different GUID %s (%s). "] = "Profil %s existiert bereits und wird von anderer Guid %s ( %s) verwendet."
-- .:indirectly
CLM.L["Profiles"] = "Profile"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:523
CLM.L["Progression Bonus"] = "Fortschritts Bonus"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:413
CLM.L["Provide number of raids needed for 100% attendance in a weekly reset. Between 1 - 50 raids. Defaults to 2. Requires /reload."] = "Anzahl der Schlachtzüge in einer Woche angeben um 100% Beteiligung zu erhalten. Zwischen 1 - 50 Schlachtzügen. Voreingstellt ist 2. Erfordert /reload."
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:431
CLM.L["Provide number of weeks that will be accounted for attendance. Between 1 - 1000 weeks. Defaults to 10. Requires /reload."] = "Anzahl der Wochen angeben, welche für die Beteiligung angerechnet werden sollen. Zwischen 1 - 1000 Wochen. Voreingestellt sind 10. Erfordert /reload."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:92
CLM.L["Prune profiles"] = "Profile löschen"
-- ClassicLootManager_Integrations/Migration.lua:52
CLM.L["Public notes"] = "Öffentliche Notizen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1068
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:148
CLM.L["Put players leaving raid on bench instead of removing them. To remove them completely they will need to be removed manually from the bench."] = "Spieler welche den Schlachtzug verlassen, auf die Bank setzten anstatt sie zu entfernen. Um sie vollständig zu entfernen, müssen sie manuell von der Bank (Standby) entfernt werden"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:216
CLM.L["Queen Lana'thel"] = "Königin Lana'thel"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:822
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:855
CLM.L["Quiver"] = "Köcher"
-- ClassicLootManager_Integrations/Integrations.lua:234
-- ClassicLootManager_Integrations/Integrations.lua:240
CLM.L["RCLC Integration"] = "RCLC Integration"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:699
CLM.L["ROLL"] = "Würfeln"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:161
CLM.L["Rage Winterchill"] = "Furor Winterfrost"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:78
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:252
CLM.L["Ragnaros"] = "Ragnaros"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:246
CLM.L["Raid Completion Bonus Value"] = "Raidabschluss Bonuswert"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:94
CLM.L["Raid Completion Bonus value"] = "Raidabschluss Bonuswert"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:932
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:522
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:101
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:244
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:91
CLM.L["Raid Completion Bonus"] = "Raid Abschlussbonus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:939
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:108
CLM.L["Raid Completion Value"] = "Raid Abschlusswert"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:184
CLM.L["Raid Name"] = "Schlachtzugsname"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:230
CLM.L["Raid Start/End"] = "Schlachtzug Beginn/Ende"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:226
CLM.L["Raid Warnings"] = "Schlachtzugswarnungen"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:429
CLM.L["Raid [%s] ended"] = "Schlachtzug [%s] beendet"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:377
CLM.L["Raid [%s] started"] = "Schlachtzug [%s] gestartet"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:315
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:337
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:409
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:452
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:477
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:511
CLM.L["Raid management is disabled during time traveling."] = "Schlachtzug Management ist deaktiviert wärend der Zeitreise"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:819
CLM.L["Raid"] = "Überfallen"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:39
CLM.L["Raid: %s Roster: %s"] = "Schlachtzug : %s Roster : %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:412
CLM.L["Raids needed in reset"] = "Benötigte Schlachtzüge in einem Reset"
-- ClassicLootManager_Integrations/GUI.lua:21
CLM.L["Raids"] = "Schlachtzüge"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:817
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:850
CLM.L["Ranged (wands)"] = "Distanz (Zauberstäbe)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:816
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:849
CLM.L["Ranged"] = "Fernkampf"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:82
CLM.L["Ranks"] = "Ränge"
-- ClassicLootManager/Utils.lua:1110
CLM.L["Rare"] = "Selten"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:79
CLM.L["Razorgore the Untamed"] = "Razorgore der Ungezähmte"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:198
CLM.L["Razorscale"] = "Rasiermesser"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:174
CLM.L["Reason"] = "Grund"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:430
CLM.L["Received"] = "Erhalten"
-- ClassicLootManager_Integrations/Integrations.lua:134
-- ClassicLootManager_Integrations/Integrations.lua:149
CLM.L["Regular"] = "Regulär"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:823
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:856
CLM.L["Relic"] = "Relikt"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:157
CLM.L["Reliquary of Souls"] = "Reliquiar der Seelen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:276
CLM.L["Remove all items from auction list. Populates new one if there are any pending."] = "Alle Gegenstände von der Auktionsliste löschen. Eine neue wird erstellt, sofern noch Gegenstände ausstehen."
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:81
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:104
CLM.L["Remove all"] = "Alle entfernen"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:80
CLM.L["Remove auction"] = "Auktion entfernen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:729
CLM.L["Remove from roster"] = "Vom Roster löschen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:680
CLM.L["Remove from standby"] = "Von Standby entfernen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:287
CLM.L["Remove item from auction list after it's awarded."] = "Gegenstand von der Auktionsliste entfernen, nachdem er verliehen wurde."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:488
CLM.L["Remove items without bids from auction list. This will make marking items as disenchanted not possible."] = "Items ohne Gebote automatisch aus der Auktonsliste entfernen. Entfernte Items können nicht mehr manuell fürs Entzaubern markiert werden."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:487
CLM.L["Remove items without bids"] = "Items ohne Gebote entfernen"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:93
CLM.L["Remove old"] = "Alt entfernen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:382
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:285
CLM.L["Remove on award"] = "Nach Verleihung entfernen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:644
CLM.L["Remove override"] = "Überschreiben entfernen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:881
CLM.L["Remove roster"] = "Roster entfernen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:434
CLM.L["Remove selected raid"] = "Ausgewählten Raid entfernen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:470
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:293
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:804
CLM.L["Remove selected"] = "Ausgewählte entfernen"
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:68
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:286
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:887
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:396
CLM.L["Remove"] = "Entfernen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:888
CLM.L["Removes current roster."] = "Aktuelles Roster etnfernen."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:229
CLM.L["Removing %s from current queue."] = "%s aus der aktuellen Warteschlange entfernen."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:662
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:740
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:226
CLM.L["Removing items not allowed during auction."] = "Gegenstände entfernen, welche nicht während einer Auktion erlaubt sind."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:357
CLM.L["Request standby"] = "Standby beantragen"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:108
CLM.L["Rescales CLM UI, except Bidding window. You can rescale Bidding window independently by using Ctrl + Mouse Wheel. Some windows may require closing and reopening."] = "Skaliert das CLM UI um, ausser dem Bietfenster. Mit Strg + Mausrad kannst du das Bietfenster unabhängig umskalieren. Einige Fenster erfordern eventuell das schließen und wieder öffnen."
-- ClassicLootManager_Integrations/Integrations.lua:129
-- ClassicLootManager_Integrations/Integrations.lua:144
CLM.L["Reserved"] = "Reserviert"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:151
CLM.L["Reset gui positions"] = "Position vom GUI zurücksetzen"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:335
CLM.L["Restore bar defaults"] = "Wiederherstellen Sie die Balkenverwaltungen wieder her"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:370
CLM.L["Revoke standby"] = "Standby widerrufen"
-- .:indirectly
CLM.L["Rogue"] = "Schurke"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:289
CLM.L["Roll on Loot"] = "Um Beute würfeln"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:944
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:531
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:760
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1201
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1202
CLM.L["Roll"] = "Würfeln"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:943
CLM.L["Rolling complete"] = "Würfeln beendet"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1390
CLM.L["Roster Name"] = "Rostername"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1389
CLM.L["Roster name"] = "Rostername"
-- ClassicLootManager_Integrations/ImportCSV.lua:90
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:116
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:125
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:818
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:113
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:307
CLM.L["Roster"] = "Roster"
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:134
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:138
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:142
CLM.L["Rosters"] = "Roster"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:217
CLM.L["Rotface"] = "Fäulnis"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1107
CLM.L["Round PR to selected number of decimals"] = "Auf ausgewählte Dezimalstellen PR aufrunden"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:841
CLM.L["Round to selected number of decimals"] = "Auf ausgewählte Dezimalstellen aufrunden"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:115
CLM.L["Round to"] = "Aufrunden auf"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:840
CLM.L["Rounding"] = "Runden"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:96
CLM.L["Ruins of Ahn'Qiraj"] = "Die Ruinen von'Ahn'Qiraj"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:700
CLM.L["SK"] = "SK"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:988
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:130
CLM.L["Same zone only"] = "Nur in selber Zone"
-- ClassicLootManager/MinimapIcon.lua:61
CLM.L["Sandbox mode"] = "Sandbox Modus"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:676
CLM.L["Sandbox"] = "Sandbox"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:109
CLM.L["Sapphiron"] = "Saphiron"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:180
CLM.L["Sartharion"] = "Sartharion"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:222
CLM.L["Saviana Ragefire"] = "Saviana Ragefire"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:719
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:726
CLM.L["Sealed"] = "Geschlossen"
-- ClassicLootManager/Modules/GUI/Filters.lua:208
CLM.L["Search for player names. Separate multiple with a comma ','. Minimum 3 characters. Overrides filtering."] = "Nach Spielernamen suchen. Mehrere durch Komma ',' unterteilen. Mindestens 3 Zeichen. Überschreibt das Filtern."
-- ClassicLootManager/Modules/GUI/Filters.lua:207
CLM.L["Search"] = "Suchen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:689
CLM.L["Season of Discovery"] = "Season of Discovery"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1399
CLM.L["Select DKP or EPGP point system."] = "Wählen Sie DKP- oder EPGP Punktesystem."
-- ClassicLootManager_Integrations/GUI.lua:374
CLM.L["Select Profiles to export"] = "Wählen Sie Profile zum Exportieren aus"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:448
CLM.L["Select Rosters to display"] = "Wähle Kader zum Anzeigen"
-- ClassicLootManager_Integrations/GUI.lua:343
CLM.L["Select Rosters to export"] = "Wählen Sie Roster zum Exportieren"
-- ClassicLootManager/Modules/GUI/Filters.lua:179
CLM.L["Select all classes."] = "Alle Klassen auswählen."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:290
CLM.L["Select default behavior whenever group loot rolling window gets opened. This will be active only during CLM Raid and while in Raid instance."] = "Standard Verhalten auswählen wenn das Würfelfenster von Plündern als Gruppe geöffnet wird. Dies wird nur aktiv sein während eines CLM Raids und wenn man sich in einer Raid Instanz befindet."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:548
CLM.L["Select equation"] = "Gleichung auswählen"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:23
CLM.L["Select logging level for troubleshooting"] = "Protokollierungsgrad für Fehlerbehebung auswählen"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:203
CLM.L["Select loot rarity for the annoucement to raid."] = "Loot-Rarität für das Ankündigen im Schlachtzug auswählen."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:469
CLM.L["Select loot rarity threshold to used to fill the auction list."] = "Plünderschwelle auswählen um Auktionsliste auszufüllen"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:249
CLM.L["Select modifier combination for awarding."] = "Wählen Sie die Modifikator -Kombination für die Vergabe aus."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:478
CLM.L["Select modifier combination for filling auction from bags and corpse."] = "Modifikator Kombination auswählen um Auktionen aus Taschen und Leichen auszufüllen."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:140
CLM.L["Select roster to add profiles to."] = "Roster auwählen zu welchem Profile hinzugefügt werden sollen."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:164
CLM.L["Select roster to create raid for."] = "Roster zum Raid erstellen auswählen."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:139
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:163
CLM.L["Select roster"] = "Roster auswählen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1004
CLM.L["Select weekly reset timezone. EU: Wed 07:00 GMT or US: Tue 15:00 GMT"] = "Wöchentliche Reset Zeitzone auswählen. EU: Mi 07:00 GMT oder US: Die 15:00 GMT"
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:102
CLM.L["Select |cffeeee00%s|r encounter difficulty for bonus value award (%s)."] = "|cffeeee00%s|r Boss Schwierigkeitsgrad für Bonuswertverleihung auswählen (%s)."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:817
CLM.L["Selected"] = "Ausgewählt"
-- ClassicLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:20
CLM.L["Send to"] = "Senden an"
-- ClassicLootManager_Integrations/GUI.lua:142
CLM.L["September"] = "September"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:40
CLM.L["Serpentshrine Cavern"] = "Höhle des Schlangenschreins"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:469
CLM.L["Set %s points to %s players for %s in <%s>"] = "Setze %s punkte für %s Spieler für %s in <%s>"
-- ClassicLootManager_Integrations/GenericImport.lua:183
CLM.L["Set Profiles standings in Rosters"] = "Setzen Sie die Profiltypen in den Kadern"
-- ClassicLootManager_Integrations/Migration.lua:411
CLM.L["Set points for %s players for team to %s"] = "Setze punkte für %s Spieler im Team für %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:185
CLM.L["Set raid name"] = "Schlachtzugname bestimmen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:154
CLM.L["Shade of Akama"] = "Akamas Schemen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:134
CLM.L["Shade of Aran"] = "Arans Schemen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:58
CLM.L["Shade of Eranikus"] = "Shade of Eranikus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:181
CLM.L["Shadron"] = "Shadron"
-- .:indirectly
CLM.L["Shaman"] = "Schamane"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:246
CLM.L["Shannox"] = "Shannox"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:74
CLM.L["Shazzrah"] = "Shazzrah"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:815
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:848
CLM.L["Shield"] = "Schild"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:607
CLM.L["Shift + Alt"] = "Shift + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:610
CLM.L["Shift + Ctrl + Alt"] = "Shift + Ctrl + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:609
CLM.L["Shift + Ctrl"] = "Shift + Ctrl"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:604
CLM.L["Shift"] = "Shift"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:798
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:831
CLM.L["Shirt"] = "Chemise"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:797
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:830
CLM.L["Shoulder"] = "Schulter"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:232
CLM.L["Show Award window"] = "Award Fenster Show"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:74
CLM.L["Show tooltip info even outside of CLM raid."] = "Tooltippinformationen auch ausserhalb von einem CLM Raid anzeigen lassen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:88
CLM.L["Silithid Royalty"] = "Das Käfer-Trio"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:218
CLM.L["Sindragosa"] = "Sindragosa"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:241
CLM.L["Sinestra"] = "Sinestra"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:747
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:753
CLM.L["Single-Priced"] = "Einzelpreis"
-- ClassicLootManager_Integrations/Migration.lua:212
CLM.L["Skipping %s"] = "%s überspringen"
-- ClassicLootManager_Integrations/Migration.lua:288
CLM.L["Skipping CommunityDKP"] = "CommunityDKP überspringen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:554
CLM.L["Slot multipliers"] = "Slot Multiplikatoren"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:402
CLM.L["Small value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Kleiner Wert für stufenbasierte Auktion. \n\nDenselben Wert wie andere Stufe oder negativ setzen zum ignorieren."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:902
CLM.L["Small"] = "Klein"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:429
CLM.L["Spent"] = "Ausgaben"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:260
CLM.L["Spine of Deathwing"] = "Spine of Deathwing"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:312
CLM.L["Stacking"] = "Stapeln"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:814
CLM.L["Stale"] = "Abgestanden"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:136
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:146
CLM.L["Standby %s has been sent"] = "Standby %s wurde gesendet"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:524
CLM.L["Standby Bonus"] = "Standby Bonus"
-- ClassicLootManager/Modules/GUI/Filters.lua:77
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:299
CLM.L["Standby"] = "Standby"
-- ClassicLootManager_Integrations/GUI.lua:18
CLM.L["Standings"] = "Punktestand"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:387
CLM.L["Start selected raid"] = "Ausgwählten Schlachtzug starten"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:513
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:531
CLM.L["Start"] = "Starten"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:508
CLM.L["Started raid %s"] = "Schlachtzug %s gestartet"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1036
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1044
CLM.L["Starting %s"] = "Startet %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1030
CLM.L["Starting points"] = "Ausgangspunkte"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:491
CLM.L["Statistics"] = "Statistiken"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:261
CLM.L["Status"] = "Status"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:513
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:531
CLM.L["Stop"] = "Stopp"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:59
CLM.L["Store bids"] = "Gebote speichern"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:60
CLM.L["Store finished auction bids information."] = "Vollendete Auktionsinformationen speichern."
-- ClassicLootManager_Integrations/GenericImport.lua:237
-- ClassicLootManager_Integrations/ImportCSV.lua:117
CLM.L["Success"] = "Erfolg"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:75
CLM.L["Sulfuron Harbinger"] = "Sulfuronherold"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:32
CLM.L["Sunken Temple"] = "Sunken Temple"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:100
CLM.L["Sunwell Plateau"] = "Sonnenbrunnenplateau"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:79
CLM.L["Suppresses changelog display until new version is released"] = "Änderungsprotokoll Anzeige unterdrücken bis eine neue Version veröffentlicht wurde"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:153
CLM.L["Supremus"] = "Supremus"
-- ClassicLootManager/MinimapIcon.lua:52
CLM.L["Sync ongoing"] = "Synchronisation im Gange"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:802
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:835
CLM.L["Tabard"] = "Wappenrock"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:133
CLM.L["Tank"] = "Tank"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1366
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:136
CLM.L["Tax"] = "Steuer"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:52
CLM.L["Tempest Keep"] = "Festung der Stürme"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:115
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:44
CLM.L["Temple of Ahn'Qiraj"] = "Ahn'Qiraj"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:182
CLM.L["Tenebron"] = "Tenebron"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:133
CLM.L["Terestian Illhoof"] = "Terestian Siechhuf"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:155
CLM.L["Teron Gorefiend"] = "Teron Blutschatten"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:102
CLM.L["Thaddius"] = "Thaddius"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:199
CLM.L["The Assembly of Iron"] = "Die Eisenbaugruppe"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_4_Cata.lua:29
CLM.L["The Bastion of Twilight"] = "The Bastion of Twilight"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:684
CLM.L["The Burning Crusade"] = "The Burning Crusade"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:108
CLM.L["The Crystal Vale"] = "The Crystal Vale"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:132
CLM.L["The Curator"] = "Der Kurator"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:39
CLM.L["The Eye of Eternity"] = "Das Auge der Ewigkeit"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:108
CLM.L["The Four Horsemen"] = "Die Vier Reiter"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:159
CLM.L["The Illidari Council"] = "Der Rat der Illidari"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:219
CLM.L["The Lich King"] = "Der Lichkönig"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:143
CLM.L["The Lurker Below"] = "Das Grauen aus der Tiefe"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:29
CLM.L["The Obsidian Sanctum"] = "Das Obsidian Sanctum"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:87
CLM.L["The Prophet Skeram"] = "Prophet Skeram"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:112
CLM.L["The Ruby Sanctum"] = "Das Ruby Sanctum"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:688
CLM.L["The War Within"] = "The War Within"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:238
CLM.L["Theralion and Valiona"] = "Theralion and Valiona"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:200
CLM.L["Thorim"] = "Thorim"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_4_Cata.lua:40
CLM.L["Throne of the Four Winds"] = "Throne of the Four Winds"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:821
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:854
CLM.L["Thrown"] = "Wurfwaffe"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:578
CLM.L["Tier multipliers"] = "Stufen Multiplikatoren"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:749
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:754
CLM.L["Tiered"] = "Stufenbasiert"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:678
-- ClassicLootManager/MinimapIcon.lua:65
CLM.L["Time Traveling"] = "Zeitreisen"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1185
CLM.L["Time in seconds by which auction will be extended if bid is received during last 10 seconds."] = "Zeit in Sekunden wie lange die Auktion verlängert wird, wenn ein Gebot in den letzten 10 Sekunden eingeht."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1169
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1201
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1202
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:705
CLM.L["Time"] = "Zeit"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:783
CLM.L["Timetravel"] = "Zeitreise"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:309
CLM.L["Toggle Auction History window display"] = "Auktionsverlauf Anzeige ein / ausschalten"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:713
CLM.L["Toggle Auctioning window display"] = "Auktionsfenster Anzeige ein / ausschalten"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:187
CLM.L["Toggle Bidding auto-open"] = "Automatisches öffnen des Bietfensters ein / ausschalten"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:393
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1423
CLM.L["Toggle Bidding window display"] = "Bietfenster Anzeige ein / ausschalten"
-- ClassicLootManager_Integrations/ImportCSV.lua:215
CLM.L["Toggle CSV import window display"] = "CSV Importfenster ein / ausschalten"
-- ClassicLootManager/MinimapIcon.lua:82
CLM.L["Toggle Minimap Icon"] = "Minimap Symbol ein / ausschalten"
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:283
CLM.L["Toggle Trade List window display"] = "Handelslistenfenster ein- ausblenden"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:214
CLM.L["Toggle advancing to next item on the list after bid."] = "Zum nächsten Gegenstand in der Liste umschalten, nachdem man geboten hat."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:188
CLM.L["Toggle auto open and auto close on auction start and stop"] = "Automatisches öffnen oder schließen vom Start und Ende der Auktion ein / ausschalten"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:46
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:158
CLM.L["Toggle changelog window display"] = "Änderungsprotokoll Anzeige ein / ausschalten"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:45
CLM.L["Toggle changelog"] = "Zeigt das Änderungsprotokoll"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:197
CLM.L["Toggle closing bidding UI after submitting bid for all items."] = "Gebotsfenster schließen, nachdem das Gebot auf alle Gegenstände abgegeben wurde."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:383
CLM.L["Toggle default behavior of remove on award field in auctioning ui"] = "Default -Verhalten von Entfernen auf dem Preis in der Auktions -Benutzeroberfläche umschalten"
-- ClassicLootManager_Integrations/GUI.lua:512
CLM.L["Toggle export window display"] = "Exportfensters Anzeige ein / ausschalten"
-- ClassicLootManager_Integrations/GenericImport.lua:280
CLM.L["Toggle import window display"] = "Importfenster Anzeige ein / ausschalten"
-- ClassicLootManager/Modules/GUI/UnifiedGUI.lua:436
CLM.L["Toggle standings window display"] = "Zeigt das Punktestand Fenster"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:172
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:326
CLM.L["Toggle test bar"] = "Schaltertestleiste"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:153
CLM.L["Toggles addon sounds."] = "Addon Geräusche ein / ausschalten."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:305
CLM.L["Toggles auto-rolling on legendary items."] = "Umschalten auf automatisches würfeln um legendäre Gegenstände"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:329
--CLM.L["Toggles auto-rolling on mounts."] = ""
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:321
CLM.L["Toggles auto-rolling on patterns."] = "Umschalten auf automatisches würfeln um Muster."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:313
CLM.L["Toggles auto-rolling on stacking items."] = "Umschalten auf automatisches stapeln von Gegenständen."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:337
--CLM.L["Toggles auto-rolling on toys."] = ""
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:374
CLM.L["Toggles loot and point award announcement to guild"] = "Loot Vergabe im Gilden Kanal ankündigen ein / ausschalten"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:185
CLM.L["Toggles loot announcement to raid"] = "Loot Vergabe im Schlachtzug Kanal ankündigen ein / ausschalten"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:354
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:367
CLM.L["Too much data to display"] = "Zu viele Daten zum anzeigen"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:188
CLM.L["Toravon the Ice Watcher"] = "Toravon der Eisbeobachter"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:494
CLM.L["Total blocked"] = "Gesamt blockiert"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:495
CLM.L["Total decayed"] = "Gesamt verfallen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:493
CLM.L["Total received"] = "Gesamt erhalten"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:492
CLM.L["Total spent"] = "Gesamtausgaben"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:336
--CLM.L["Toys"] = ""
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:108
CLM.L["Tracker"] = "Verfolger"
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:193
-- ClassicLootManager/MinimapIcon.lua:135
CLM.L["Trade List"] = "Handelsliste"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:76
CLM.L["Trial of the Crusader"] = "Versuch des Kreuzfahrers"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:809
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:842
CLM.L["Trinket"] = "Schmuckstück"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:37
CLM.L["True"] = "Wahr"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:42
CLM.L["Twilight Lord Kelris"] = "Twilight Lord Kelris"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:93
CLM.L["Twin Emperors"] = "Zwillingsimperatoren"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:266
CLM.L["Two different profiles exist for target GUID %s (%s:%s) and name %s (%s:%s). Verify and clean up profiles before updating."] = "Für Zielguid %s (%s:%s) und Name %s (%s:%s) exisieren zwei verschiedene Profile. Überprüfen und bereinigen Sie Profile vor dem Aktualisieren."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:814
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:847
CLM.L["Two-Hand"] = "Zweihand"
-- ClassicLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:141
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:297
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:330
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:706
CLM.L["Type"] = "Typ"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:107
CLM.L["UI Scale"] = "UI Skalierung"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:56
CLM.L["Ulduar"] = "Ulduar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:258
CLM.L["Ultraxion"] = "Ultraxion"
-- ClassicLootManager_Integrations/Migration.lua:66
CLM.L["Unable to execute migration. Entries already exist."] = "Migrationen kann nicht ausgeführt werden. Einträge sind bereits vorhanden"
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:169
CLM.L["Unable to get item info from server. Please try auctioning again"] = "Iteminformationen konnten nicht vom Server abrufen werden. Bitte versuchen Sie es erneut zu versteigern"
-- ClassicLootManager/Utils.lua:1109
CLM.L["Uncommon"] = "Ungewöhnlich"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:525
CLM.L["Unexcused absence"] = "Unentschuldigstes Fehlen"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:44
CLM.L["Unknown roster %s"] = "Unbekanntes Roster %s"
-- ClassicLootManager/MinimapIcon.lua:56
CLM.L["Unknown sync state"] = "Unbekannter Synchronisations Status"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:344
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:444
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:32
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:170
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:240
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:285
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:343
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:172
CLM.L["Unknown"] = "Unbekannt"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:323
-- ClassicLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:88
CLM.L["Unlink Alt"] = "Twink entkoppeln"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:280
CLM.L["Unlock selected"] = "Ausgewählte entsperren"
-- ClassicLootManager_Integrations/Migration.lua:177
CLM.L["UpdatePoints(): Empty targets list"] = "UpdatePunkte(): Leere Zielliste"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:515
CLM.L["Updated raid <%s> %s joined, %s left, %s benched, %s removed"] = "Aktualisiertem Schlachtzug <%s> %s beigetreten, %s verlassen, %s auf die Bank gesetzt, %s entfernt"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1256
CLM.L["Use named buttons"] = "Verwenden Sie benannte Knöpfe"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:80
CLM.L["Vaelastrasz the Corrupt"] = "Vaelastrasz der Verdorbene"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:207
CLM.L["Val'kyr Twins"] = "Val'kyr Twins"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:211
CLM.L["Valithria Dreamwalker"] = "Valitria Dreamwalker"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:305
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:262
CLM.L["Value"] = "Wert"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:46
CLM.L["Vault of Archavon"] = "Gewölbe von Archavon"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:31
CLM.L["Verbose"] = "Ausführlich"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:114
CLM.L["Version check in guild"] = "Version in der Gilde kontrollieren"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:182
CLM.L["Version"] = "Version"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:183
CLM.L["Vesperon"] = "Vesperon"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:720
CLM.L["Vickrey"] = "Vickrey"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:91
CLM.L["Viscidus"] = "Viscidus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:46
CLM.L["Viscous Fallout"] = "Viscous Fallout"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:149
CLM.L["Void Reaver"] = "Leerhäscher"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:805
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:838
CLM.L["Waist"] = "Taille"
-- .:indirectly
CLM.L["Warlock"] = "Hexenmeister"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:255
CLM.L["Warlord Zon'ozz"] = "Warlord Zon'ozz"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:259
CLM.L["Warmaster Blackhorn"] = "Warmaster Blackhorn"
-- .:indirectly
CLM.L["Warrior"] = "Krieger"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1012
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:109
CLM.L["Weekly cap"] = "Wöchentliches Limit"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:485
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:488
CLM.L["Weekly gains"] = "Wöchentliche Gewinne"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1003
CLM.L["Weekly reset timezone"] = "Wöchentliche Reset Zeitzone"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:112
CLM.L["Weekly reset"] = "Wöchentlicher Reset"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:194
CLM.L["When enabled, this will make loot announcement display only if you're Master Looter or Raid Leader (if there is no Master Looter)."] = "Wenn dies aktiviert ist, werden Loot Ankündigungen nur durchgeführt, wenn Sie der Plündermeister- oder RAID Anführer sind (falls es keinen Plündermeister gibt)."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1257
CLM.L["Will display names of the buttons instead of values in bidding UI"] = "Zeigt Namen der Knöpfe anstelle von Werten in der Bieten Benutzeroberfläche an"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:359
CLM.L["Will hide bidding window if you enter combat and show it again when you exit. Will also delay auto opening if needed."] = "Versteckt das Bietungsfenster, wenn Sie den Kampf eingeben und es beim Beenden erneut anzeigen. Verzögert bei Bedarf auch die automatische Öffnung."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:161
CLM.L["Wipe events"] = "Ereignisse löschen"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:39
CLM.L["Wipe"] = "Löschen"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:162
CLM.L["Wipes all events from memory. This will trigger resyncing from other users."] = "Löscht alle Ereignisse vom Speicher. Löst ein Neusynchronisieren bei anderen Mitgliedern aus."
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:40
CLM.L["Wipes the log history"] = "Löscht die Protokoll Historie"
-- ClassicLootManager_Integrations/Integrations.lua:363
CLM.L["WoW DKP Bot Integration"] = "WoW DKP Bot Integration"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:70
CLM.L["World Bosses"] = "World Bosses"
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:197
CLM.L["Wowpedia"] = "Wowpedia"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:685
CLM.L["Wrath of the Lich King"] = "Wrath of the Lich King"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:803
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:836
CLM.L["Wrist"] = "Handgelenk"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:201
CLM.L["XT-002 Deconstructor"] = "XT-002 Dekonstruktor"
-- ClassicLootManager/Utils.lua:594
CLM.L["Yes"] = "Ja"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:202
CLM.L["Yogg-Saron"] = "Yogg-Saron"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:256
CLM.L["Yor'sahj the Unsleeping"] = "Yor'sahj the Unsleeping"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:310
CLM.L["You are already in an active raid. Leave or finish it before creating new one."] = "Du bist bereits in einem aktiven Schlachtzug. Verlasse oder beende den Schlachtzug bevor du einen neuen erstellst."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:364
CLM.L["You are changing roster settings during active raid. You can continue without any issues however the settings will not get applied until you start a new one."] = "Sie ändern die Dienstplaneinstellungen während des aktiven Überfalls. Sie können ohne Probleme fortfahren, aber die Einstellungen werden erst angewendet, wenn Sie eine neue starten."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:770
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:897
CLM.L["You are not allowed to auction items"] = "Du darfst keine Gegenstände versteigern"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:469
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:503
CLM.L["You are not allowed to control raid."] = "Du darfst keinen Schlachtzug kontrollieren."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:306
CLM.L["You are not allowed to create raids."] = "Du darfst keinen Schlachtzug erstellen."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:440
CLM.L["You are not allowed to join raid."] = "Du darfst keinem Schlachtzug beitreten."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:329
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:401
CLM.L["You are not allowed to start raid."] = "Du darfst keinen Schlachtzug starten."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:342
CLM.L["You are not in the raid."] = "Du bist nicht im Schlachtzug."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:700
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:709
CLM.L["You can %s max %d players from standby at the same time to a %s raid."] = "Du kannst %s maximal %d Spieler von Standby zur gleichen Zeit zum %s Schlachtzug."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:655
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:664
CLM.L["You can %s max %d players to standby at the same time to a %s raid."] = "Du kannst %s maximal %d Spieler zur Standby zur gleichen Zeit zum %s Schlachtzug."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:473
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:507
CLM.L["You can only add players to standby of a progressing raid."] = "Du kannst nur Spieler auf Standby setzen, welche im einem laufenden Schlachtzug sind."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:646
CLM.L["You can only bench players from same roster as the raid (%s)."] = "Du kannst nur Spieler vom selben Roster und Raid auf die Bank setzen (%s)."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:405
CLM.L["You can only end an active raid."] = "Du kannst nur einen aktiven Schlachtzug beenden."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:444
CLM.L["You can only join an active raid."] = "Du kannst nur einem aktiven Schlachtzug beitreten."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:448
CLM.L["You can only join different raid than your current one."] = "Du kannst nur einen anderen Schlachtug beitreten als dem momentanen."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:691
CLM.L["You can only remove from bench players from same roster as the raid (%s)."] = "Du kannst nur Spieler vom selben Roster wie Schlachtzug (%s) von der Bank entfernen."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:333
CLM.L["You can only start a freshly created raid."] = "Du kannst nur einen neuerstellten Schlachtzug starten."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:743
CLM.L["You can remove max %d players from roster at the same time."] = "Du kannst maximal %d Spieler auf einmal vom Roster entfernen."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:345
CLM.L["Your bid (%s) was denied: |cffcc0000%s|r"] = "Dein Gobot von (%s) wurde abgelehnt: |cffcc0000%s|r"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:327
CLM.L["Your bid (%s) was |cff00cc00accepted|r"] = "Dein Gebot von (%s) wurde |cff00cc00akzeptiert|r"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:64
CLM.L["Zero-Sum Bank Inflation"] = "Zero-Sum Bank Inflation"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1326
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:61
CLM.L["Zero-Sum Bank"] = "Nullsummen Bank"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1334
CLM.L["Zero-Sum Inflation Value"] = "Nullsummen Inflationswert"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:528
CLM.L["Zero-Sum award"] = "Nullsummen vergabe"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1320
CLM.L["Zero-Sum"] = "Nullsumme"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:88
CLM.L["Zul'Aman"] = "Zul'Aman"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:78
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:80
CLM.L["Zul'Gurub"] = "Zul'Gurub"
-- ClassicLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:171
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
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:656
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:665
CLM.L["add"] = "hinzufügen"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:665
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:710
CLM.L["created"] = "erstellt"
-- ClassicLootManager_Integrations/Integrations.lua:345
CLM.L["else"] = "ansonsten"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:462
CLM.L["excluding negatives "] = "Negative auslassen"
-- ClassicLootManager_Integrations/Integrations.lua:280
CLM.L["if reason/response contains"] = "Wenn Grund / Antwort folgendes enthält"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:97
CLM.L["level"] = "Level"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:656
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:701
CLM.L["progressing"] = "fortschreitend"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:100
CLM.L["rank"] = "rang"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:701
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:710
CLM.L["remove"] = "entfernen"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:137
CLM.L["request"] = "Anfrage"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:40
CLM.L["requested"] = "angefordert"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:147
CLM.L["revoke"] = "widerrufen"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:70
CLM.L["revoked"] = "widerrufen"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:910
CLM.L["seconds"] = "Sekunden"
-- ClassicLootManager_Integrations/Integrations.lua:290
CLM.L["then"] = "dann"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:104
CLM.L["unguilded"] = "Ohne Gilde"
-- ClassicLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:142
CLM.L["|cff00cc00Send to:|r If you are trusted in your guild, you will also send whisper syncs to the player.\n|cff00cc00Accept from:|r You will be accepting syncs from the player.\n|cff00cc00Both:|r Both of the above."] = "|cFF00CC00Send an: |r Wenn Sie in Ihrer Gilde vertrauen, senden Sie auch Whisper Syncs an den Spieler. obenstehendes."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1248
CLM.L["|cff00ee44Open:|r English Auction with highest bidder announcement. Highest bidder wins. Two players can not bid same value. Additionally always allows bidding base to accomodate for Swedish Auction flavor.\n\n|cff00ee44Anonymous Open:|r Same as Open but highest bidder name is not disclosed.\n\n|cff00ee44Sealed:|r Bids are not announced. Highest bidder wins.\n\n|cff00ee44Vickrey:|r Same as sealed but winner pays with second-highest bid."] = "|cff00ee44Offen: |r Englische Auktion mit Ankündigung des höchsten Bieters. Der höchste Bieter gewinnt. Zwei Spieler können keinen gleichen Wert bieten. Ermöglicht auserdem nach Schwedischem Stil den Grundpreis zu bieten.\n\n|cff00ee44Anonym Offen:|r Genauso wie offen aber der Name des Höchstbieters wird nicht angezeigt.\n\n|cff00ee44Geschlossen:|r Keine Gebote werden angezeigt. Höchstes Gebot gewinnt.\n\n|cff00ee44Vickrey:|r Genauso wie geschlossen aber der Gewinner zahlt nur den zweithöchsten Gebotspreis."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1124
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1313
CLM.L["|cff00ee44Single-Priced:|r Static value mode. Only bidding Base value is supported.\n\n|cff00ee44Ascending:|r Ranged value mode. Allows bidding any value in |cff44ee00<base, max>|r.\n\n|cff00ee44Tiered:|r Ranged value mode. Allows bidding only specific values. Up to 5 tiers are configurable in |cff44ee00<base, small, medium, large, max>|r."] = "|Einzel-preise:|r statischer Wertmodus. Nur der Basiswert wird unterstützt. \n\n|cff00ee44Absteigend:|r Wertebereich Modus. Ermöglich das Bieten von werten zwischen |cff44ee00<Basis-, MaximalPunkten>|r.\n\n|cff00ee44Stufenbasiert:|r Wertebereich Modus. Ermöglicht das bieten von Spezifischen Werten. Bis zu 5 Werte konfigurierbar in |cff44ee00<Basis-, Klein-, Mittel-, Groß-, Maximalpunkte>|r."
-- ClassicLootManager/Modules/Common/Version/Version.lua:69
CLM.L["|cffcc0000Your Core Loot Manager is significantly out of date.|r AddOn communication has been disabled. Please update as soon as possible."] = "|cffcc0000Dein Core Loot Manager ist nicht mehr aktuell.|r Die Addon Kommunikation wurde abgeschaltet. Bitte schnellstmöglich auf den neuesten Stand bringen du kek"
end