local _, CLM = ...
if GetLocale() == "frFR" then
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:323
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:336
CLM.L[" alt of: "] = " reroll de "
-- ClassicLootManager/Utils.lua:499
CLM.L[" more"] = " suite "
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:173
CLM.L[" over "] = " plus de "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:396
CLM.L[" profile(s)"] = " profil(s)"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:28
CLM.L["!bid"] = "!bid"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:29
CLM.L["!bidos"] = "!bidos"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:57
CLM.L["!dkp"] = "!dkp"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:264
CLM.L["% that will be decayed."] = "% qui sera réduit"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:341
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:393
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:408
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:466
CLM.L["%Y/%m/%d %H:%M:%S (%A)"] = "%d/%m/%Y %H:%M:%S (%A)"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:252
-- ClassicLootManager_Integrations/Models/Exporter.lua:327
-- ClassicLootManager_Integrations/Models/Exporter.lua:328
CLM.L["%Y/%m/%d %a %H:%M:%S"] = "%a %d/%m/%Y %H:%M:%S"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:591
CLM.L["%d/%m/%Y %H:%M:%S"] = "%d/%m/%Y %H:%M:%S"
-- ClassicLootManager_Alerts/Alerts.lua:15
CLM.L["%s %% %s decay"] = "%s %% %s Réduction"
-- ClassicLootManager_Alerts/Alerts.lua:12
CLM.L["%s %s"] = "%s %s"
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:180
CLM.L["%s awarded to %s for %s %s"] = "%s attribué à %s pour %s %s"
-- ClassicLootManager/MinimapIcon.lua:37
CLM.L["%s events (%s pending)"] = "%s événements (%s en attente)"
-- ClassicLootManager/MinimapIcon.lua:39
CLM.L["%s events (0x%x)"] = "%s événements (0x%x)"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:40
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:70
CLM.L["%s has %s standby"] = "%s a %s en veille"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:59
CLM.L["%s is not part of the %s roster"] = "%s ne fait pas partie  %s du Roster"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:165
CLM.L["%s profile exists."] = "%s Profil existant."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:167
CLM.L["%s profile missing. Adding."] = "%s profil manquant. Ajouter."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:480
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:490
CLM.L["%s to %s for %s in <%s>"] = "%s à %s pour %s dans <%s>"
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:171
CLM.L["%s trade me for %s"] = "%s échanger pour %s"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:173
CLM.L["%s was not found in guild."] = "%s introuvable dans la guilde."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:101
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:101
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:102
CLM.L["-- All --"] = "-- Tout -- "
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:166
CLM.L["10 Player (Heroic)"] = "10 joueurs (Héroïque)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:164
CLM.L["10 Player"] = "10 joueurs"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:169
CLM.L["20 Player"] = "20 joueurs"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:167
CLM.L["25 Player (Heroic)"] = "25 joueurs (Héroïque)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:165
CLM.L["25 Player"] = "25 joueurs"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:168
CLM.L["40 Player"] = "40 joueurs"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:90
CLM.L["<CLM> %s not present in any roster."] = "<CLM> %s n'est présent dans aucun roster."
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:92
CLM.L["<CLM> %s standings in %d %s:"] = "<CLM> %s Classé dans %d %s:"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:101
CLM.L["<CLM> %s: %d DKP (%d this week)."] = "<CLM> %s: %d DKP (%d cette semaine)."
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:71
CLM.L["<CLM> Missing profile for player %s."] = "<CLM> Profil manquant pour le joueur %s."
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:51
CLM.L["<CLM> Your bid (%s) was %s%s."] = "<CLM> Ton enchère (%s) est %s%s."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:861
CLM.L["Accepting rolls on %s for %s %s"] = "Prise de rolls sur %s pour %s %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:140
CLM.L["Action context"] = "Contexte de l'action"
-- ClassicLootManager_Integrations/Integrations.lua:156
CLM.L["Action to take upon Gargul loot award event happening during raid."] = "Action à effectuer lorsqu'un event Gargul d'attribution de loot eu lieu en raid."
-- ClassicLootManager_Integrations/Integrations.lua:261
CLM.L["Action to take upon RCLC loot award event happening during raid. Trigger is based on RCLC award reason or player response if reason is not used. On Integration Enable the buttons will be prefilled with existing ones."] = "Action à effectuer lors de l'attribution d'objets RCLC en raid. Le déclencheur est basé sur la raison d'attribution RCLC ou sur la réponse du joueur si pas de raison. Si l'intégration est activée, le label des boutons sera pré-rempli."
-- ClassicLootManager_Integrations/GenericImport.lua:181
CLM.L["Add Profiles to Rosters"] = "Ajouter des profils aux rosters"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:122
CLM.L["Add currently selected target to list."] = "ajouter la cible actuellement sélectionnée au roster."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:121
CLM.L["Add target"] = "Ajouter cible"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:142
CLM.L["Add to roster"] = "Ajouter au Roster"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:562
CLM.L["Add to standby"] = "Ajouter en veille"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:396
CLM.L["Add"] = "Ajouté"
-- ClassicLootManager_Integrations/Migration.lua:368
CLM.L["Adding %s loot entries for team to %s"] = "Ajout de %s entrées de butin pour l'équipe à %s"
-- ClassicLootManager_Integrations/Migration.lua:227
-- ClassicLootManager_Integrations/Migration.lua:346
CLM.L["Adding %s profiles to %s"] = "Ajout %s profils à %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:983
CLM.L["Adding missing %s players to current roster"] = "Ajout de %s joueurs manquants au roster actuel"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1263
CLM.L["Additional cost (tax) to add to the award value."] = "Coût supplémentaire (taxe) à ajouter à la valeur de la récompense."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1231
CLM.L["Additional points to be given to players atop of the split value."] = "Points supplémentaires à attribuer aux joueurs en plus de la valeur partagée."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:145
CLM.L["Addon sounds"] = "Sons de l'addon"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:143
CLM.L["Adds selected players to the selected roster (from dropdown)."] = "Ajoute les joueurs sélectionnés au roster sélectionné depuis la liste déroulante."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:162
CLM.L["Advance to next item after bid"] = "Passer à l'objet suivant après l'offre"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:221
CLM.L["Affected players:"] = "Joueurs concernés:"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:102
CLM.L["Akil'zon"] = "Akil'zon"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:84
CLM.L["Al'ar"] = "Al'ar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:125
CLM.L["Algalon the Observer"] = "Algalon l'observateur"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:432
CLM.L["All In"] = "Offre max"
-- ClassicLootManager_Integrations/Migration.lua:29
CLM.L["All migration entries were commited and executed. Congratulations!"] = "Toutes les entrées de migration ont été validées et exécutées. Toutes nos félicitations!"
-- ClassicLootManager/Modules/GUI/Filters.lua:178
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:20
CLM.L["All"] = "Tout"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:76
CLM.L["Allow bidding below minimum points"] = "Permettre d'enchérir en-dessous du minimum de points"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1240
CLM.L["Allow biding more than current standings and ending up with less than minimum standings."] = "Autoriser d'enchérir plus que son capital actuel et terminer avec un capital inférieur au minimum"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1239
CLM.L["Allow biding more than current standings"] = "Permettre de placer une offre supérieure au points actuellement détenus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1200
CLM.L["Allow equal bids"] = "Autoriser les offres à valeur égale"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:73
CLM.L["Allow going below minimum points"] = "Permettre d'aller en-dessous du minimum de points"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:973
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:155
CLM.L["Allow players to subscribe to the bench through Raids menu"] = "Autoriser les joueurs à se placer sur le banc via le menu Raids"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:972
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:154
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:133
CLM.L["Allow subscription"] = "Autoriser l'abonnement"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:498
CLM.L["Alt"] = "Alt"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1192
CLM.L["Always allow All-In bids"] = "Toujours autoriser les offres all-in"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1184
CLM.L["Always allow Base bids"] = "Toujours autoriser les offres à valeur de base"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1065
CLM.L["Always allow cancel/pass"] = "Toujours autoriser à passer ou annuler"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:847
CLM.L["Americas"] = "Amériques"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:796
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:829
CLM.L["Ammo"] = "Munitions"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:98
CLM.L["Anetheron"] = "Anetheron"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:341
CLM.L["Announce award to Guild"] = "Annoncer la récompense à la guilde"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:177
CLM.L["Announce loot from corpse to Raid"] = "Annoncer le butin ramassé au raid"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:173
CLM.L["Announce loot"] = "Annoncer le butin"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:195
CLM.L["Announcement loot rarity"] = "Annonce de la rareté du butin"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:697
CLM.L["Anonymous Open"] = "Anonyme Ouvert"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1097
CLM.L["Anti-snipe time"] = "Temps anti-snipe"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:763
CLM.L["Anti-snipe time: %s."] = "Temps anti-snipe : %s."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:235
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:70
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:523
CLM.L["Anti-snipe"] = "Anti-snipe"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:32
CLM.L["Anub'Rekhan"] = "Anub'Rekhan"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:139
CLM.L["Anub'arak"] = "Anub'arak"
-- ClassicLootManager/Tooltips.lua:37
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:67
CLM.L["Any"] = "Tout"
-- ClassicLootManager_Integrations/GUI.lua:138
CLM.L["April"] = "Avril"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:121
CLM.L["Archavon the Stone Watcher"] = "Archavon le Gardien des pierres"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:101
CLM.L["Archimonde"] = "Archimonde"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:164
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:319
CLM.L["Are you sure, you want to award %s to %s for %s %s?"] = "Êtes-vous sûr de vouloir attribuer %s à %s pour %s %s ?"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:344
CLM.L["Are you sure, you want to disenchant %s?"] = "Etes vous sûr de vouloir désenchanter %s?"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:724
CLM.L["Ascending"] = "Ascendant"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:224
CLM.L["Assistant"] = "Assistant"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:354
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:365
CLM.L["Att. [%]"] = "Prés. [%]"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:382
CLM.L["Attendance"] = "Présence"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:64
CLM.L["Attumen the Huntsman"] = "Attumen le Veneur"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:248
CLM.L["Auction End Countdown"] = "Compte à rebours de fin d'enchères"
-- ClassicLootManager/MinimapIcon.lua:109
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:221
CLM.L["Auction History"] = "Historique de l'enchère"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:232
CLM.L["Auction Start/End"] = "Début/Fin de l'enchère"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:234
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:67
CLM.L["Auction Time"] = "Temps de l'enchère"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:55
CLM.L["Auction Type"] = "Type d'enchère"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:659
CLM.L["Auction complete"] = "Enchère terminée"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:269
CLM.L["Auction finished"] = "Enchère terminée"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1089
CLM.L["Auction length in seconds."] = "Durée de l'enchère en secondes."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1088
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:513
CLM.L["Auction length"] = "Durée de l'enchère"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:249
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:755
CLM.L["Auction of %s items."] = "Enchères de % items"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:253
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:757
CLM.L["Auction of %s"] = "Enchère de %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1031
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:500
CLM.L["Auction settings"] = "Configuration des enchères"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:650
CLM.L["Auction stopped by Master Looter"] = "Enchères arrêtées par le maître du butin"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:761
CLM.L["Auction time: %s."] = "Temps de l'enchère: %s."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:171
CLM.L["Auction timer bar width"] = "Largeur de la barre timer d'enchère"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1151
CLM.L["Auction type"] = "Type d'enchère"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:458
CLM.L["Auctioning - Chat Commands"] = "Enchères - Commandes de chat"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:55
CLM.L["Auctioning - History"] = "Vente aux enchères - Historique"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:369
CLM.L["Auctioning - List Filling"] = "Enchères - Remplissage de liste"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:605
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:613
CLM.L["Auctioning requires active raid or roster mode."] = "Les enchères nécessite un raid actif ou le mode roster"
-- ClassicLootManager/MinimapIcon.lua:104
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:689
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:337
CLM.L["Auctioning"] = "Vente aux enchères"
-- ClassicLootManager_Integrations/GUI.lua:142
CLM.L["August"] = "Aout"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:126
CLM.L["Auriaya"] = "Auriaya"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:658
CLM.L["Author"] = "Auteur"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:980
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:146
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:121
CLM.L["Auto bench leavers"] = "Automatiquement mettre sur le banc les sortants"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:350
CLM.L["Auto-assign from corpse"] = "Assignation automatique depuis le cadavre"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:359
CLM.L["Auto-trade after award"] = "Echange automatique après attribution"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:438
CLM.L["Automatically mark auto-removed items as disenchanted"] = "Marquez automatiquement les éléments de l'auto-rémunération comme désenchanté"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:404
CLM.L["Average weeks"] = "Semaines moyennes"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:236
CLM.L["Award %s points to %s selected players."] = "Attribuer %s points aux %s joueurs sélectionnés."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:230
CLM.L["Award %s points to everyone in raid."] = "Attribuer %s points à tous les membres du raid."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:232
CLM.L["Award %s points to everyone in roster."] = "Attribuer %s points à tout le roster."
-- ClassicLootManager_Integrations/Integrations.lua:645
CLM.L["Award for Base"] = "Récompense de base"
-- ClassicLootManager_Integrations/Integrations.lua:644
CLM.L["Award for Free"] = "Récompense gratuite"
-- ClassicLootManager_Integrations/Integrations.lua:648
CLM.L["Award for Large"] = "Récompense grande"
-- ClassicLootManager_Integrations/Integrations.lua:649
CLM.L["Award for Max"] = "Récompense Max"
-- ClassicLootManager_Integrations/Integrations.lua:647
CLM.L["Award for Medium"] = "Récompense médium"
-- ClassicLootManager_Integrations/Integrations.lua:646
CLM.L["Award for Small"] = "Récompense petite"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:194
CLM.L["Award item"] = "Attribuer l'objet"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:916
CLM.L["Award points only to online players"] = "Attribuer des points uniquement aux joueurs en ligne"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:925
CLM.L["Award points only to players in same zone"] = "Attribuer des points uniquement aux joueurs dans la même zone"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:184
CLM.L["Award points to players based on context."] = "Attribuer des points aux joueurs en fonction du contexte."
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:132
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:173
CLM.L["Award value"] = "Valeur attribuée"
-- ClassicLootManager/MinimapIcon.lua:123
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:141
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:194
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:231
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1123
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:183
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:304
CLM.L["Award"] = "Récompense"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:453
CLM.L["Awarded %s points for %s to all players in raid %s"] = "Attribution de %s points pour %s à tous les joueurs du raid %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:429
CLM.L["Awarded %s points to %s players for %s in <%s>"] = "Attribution de %s points à %s joueurs pour %s dans <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:445
CLM.L["Awarded %s points to all players for %s in <%s>"] = "Attribution de %s points à tous les joueurs pour %s dans <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:176
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:242
CLM.L["Awarded by"] = "Attribué par"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:62
CLM.L["Ayamiss the Hunter"] = "Ayamiss le Chasseur"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:100
CLM.L["Azgalor"] = "Azgalor"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:775
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:808
CLM.L["Back"] = "Dos"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:795
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:828
CLM.L["Bag"] = "Sac"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:156
CLM.L["Baltharus the Warborn"] = "Baltharus l'Enfant de la guerre"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:9
CLM.L["Baron Geddon"] = "Baron Geddon"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:356
CLM.L["Base value for Static-Priced auction.\nMinimum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Valeur de base pour les enchères à prix fixe. \nValeur minimum pour les enchères montantes et par palier.\n\nRemplissez la même valeur que les autres paliers ou une valeur négative pour ignorer"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:877
CLM.L["Base"] = "Base"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:25
CLM.L["Battleguard Sartura"] = "Garde de guerre Sartura"
-- ClassicLootManager_Integrations/GUI.lua:316
-- ClassicLootManager_Integrations/GUI.lua:323
-- ClassicLootManager_Integrations/GUI.lua:330
CLM.L["Begin %d days ago, finish today."] = "Début il y a %d jours, fin aujourd'hui."
-- ClassicLootManager_Integrations/GUI.lua:249
CLM.L["Begin Day"] = "Jour de début"
-- ClassicLootManager_Integrations/GUI.lua:260
CLM.L["Begin Month"] = "Mois de début"
-- ClassicLootManager_Integrations/GUI.lua:271
CLM.L["Begin Year"] = "Année de début"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:988
CLM.L["Bench multiplier"] = "Multiplicateur du banc"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:966
CLM.L["Bench"] = "Banc"
-- ClassicLootManager_Alerts/Alerts.lua:25
CLM.L["Bid %s accepted!"] = "Enchère %s acceptée !"
-- ClassicLootManager_Alerts/Alerts.lua:33
CLM.L["Bid %s denied!"] = "Enchère %s refusée !"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:863
CLM.L["Bid accepted!"] = "Enchère acceptée !"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1286
CLM.L["Bid cancelling not allowed"] = "Annulation d'enchère non autorisée"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:867
CLM.L["Bid denied!"] = "Enchère refusée !"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1284
CLM.L["Bid increment too low"] = "Incrémentation d'enchère trop basse"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:323
CLM.L["Bid input values as Main spec bid."] = "Entrer une offre pour une enchère de Main Spec"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:337
CLM.L["Bid input values as Off spec bid."] = "Entrer une pour une enchère d'Off Spec"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1282
CLM.L["Bid too high"] = "Enchère trop élevée"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1281
CLM.L["Bid too low"] = "Enchère trop basse"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:433
CLM.L["Bid your current DKP (%s)."] = "Enchérissez tous vos DKP actuels (%s)."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:322
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:701
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:426
CLM.L["Bid"] = "Offre d'achat"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1280
CLM.L["Bidding over current standings not allowed"] = "Vous ne pouvez pas faire d’offre supérieure à votre montant actuel de points"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1279
CLM.L["Bidding while below minimum standings not allowed"] = "Vous ne pouvez pas faire d’offre quand vous êtes sous le minimum de points"
-- ClassicLootManager/MinimapIcon.lua:119
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1051
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:132
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:219
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:809
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1084
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1177
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:571
CLM.L["Bidding"] = "Enchère"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:264
CLM.L["Bids"] = "Enchères"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:121
CLM.L["Bindings"] = "Raccourcis clavier"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:348
CLM.L["Black Temple"] = "Temple noir"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:213
CLM.L["Blackwing Lair"] = "Repaire de l'Aile noire"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:144
CLM.L["Blood Council"] = "Conseil des princes de sang"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:53
CLM.L["Bloodlord Mandokir"] = "Seigneur sanglant Mandokir"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:832
CLM.L["Bonuses"] = "Bonus"
-- ClassicLootManager/ClassicLootManager.lua:240
CLM.L["Boot complete"] = "Démarrage terminé"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:430
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:838
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:78
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:236
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:79
CLM.L["Boss Kill Bonus"] = "Bonus par boss tué"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1142
CLM.L["Boss kill award values"] = "Valeurs de récompense par boss tué"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:17
CLM.L["Broodlord Lashlayer"] = "Seigneur des couvées Lanistaire"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:109
CLM.L["Brutallus"] = "Brutallus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:61
CLM.L["Buru the Gorger"] = "Buru Grandgosier"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:997
CLM.L["Button Names"] = "Noms des boutons"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:31
CLM.L["C'Thun"] = "C'Thun"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:856
CLM.L["Can't use"] = "Impossible d'utiliser"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:370
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:533
CLM.L["Cancel your bid."] = "Annulez votre offre."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:292
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:420
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:369
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:532
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:860
CLM.L["Cancel"] = "Annuler"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:757
CLM.L["Change roster name."] = "Changer le nom du Roster."
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:13
CLM.L["Changelog"] = "Journal des modifications"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:172
CLM.L["Changes auction timer bar width."] = "Changer la largeur de la barre timer d'enchère"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1290
CLM.L["Changing bid from Main-spec to Off-Spec not allowed"] = "Changer une offre depuis mainspec vers offspec non autorisé"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:68
CLM.L["Channel for posting bids."] = "Canal où annoncer les enchères."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:240
CLM.L["Chat Commands"] = "Commandes de discussion"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:56
CLM.L["Chat bidding is currently disabled."] = "Offres d'enchères par chat désactivées"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:72
CLM.L["Chess Event"] = "Chess Event"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:777
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:810
CLM.L["Chest (robes)"] = "Torse (robes)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:776
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:809
CLM.L["Chest"] = "Torse"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:21
CLM.L["Chromaggus"] = "Chromaggus"
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:261
CLM.L["Classic Loot Manager %s initialization complete. %s"] = "Classic Loot Manager %s initialisation terminée. %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI.lua:266
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:13
CLM.L["Classic Loot Manager"] = "Classic Loot Manager"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:638
CLM.L["Classic"] = "Classic"
-- ClassicLootManager/Modules/GUI/Filters.lua:192
CLM.L["Clear all classes."] = "Effacer toutes les classes."
-- ClassicLootManager_Integrations/GUI.lua:474
CLM.L["Clear output"] = "Effacer la sortie"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:265
CLM.L["Clear"] = "Effacer"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:154
CLM.L["Close on bid"] = "Fermer après l'offre"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:211
CLM.L["Comma-separated (CSV) list of disenchanter names. Case insensitive."] = "Liste CSV de désenchanteurs. Sensible à la casse"
-- ClassicLootManager/Utils.lua:921
CLM.L["Common"] = "Commun"
-- ClassicLootManager/MinimapIcon.lua:138
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:309
-- ClassicLootManager_Integrations/GUI.lua:18
CLM.L["Configuration"] = "Configuration"
-- ClassicLootManager_Integrations/GenericImport.lua:175
CLM.L["Configure Rosters"] = "Configurer les listes"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:793
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:801
CLM.L["Copy settings from selected roster."] = "Copier les paramètres du roster sélectionné."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:786
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:792
CLM.L["Copy settings"] = "Copier les paramètres"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:800
CLM.L["Copy source"] = "Copier la source"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:435
CLM.L["Correcting error"] = "Correction d'erreur"
-- ClassicLootManager_Integrations/GenericImport.lua:178
CLM.L["Create Profiles"] = "Créer des profils"
-- ClassicLootManager_Integrations/GenericImport.lua:172
CLM.L["Create Rosters"] = "Créer des rosters"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:194
CLM.L["Create new raid with provided name. You will automatically join this raid and leave any other you are part of."] = "Créez un nouveau raid avec le nom fourni. Vous rejoindrez automatiquement ce raid et quitterez tout autre dont vous faites partie."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:500
CLM.L["Create raid %s %s in <%s>"] = "Créer raid %s %s dans <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:193
CLM.L["Create raid"] = "Créer raid"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1277
-- ClassicLootManager_Integrations/Integrations.lua:247
CLM.L["Create"] = "Créer"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:808
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:261
CLM.L["Created"] = "Créé"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1278
CLM.L["Creates new roster with default configuration"] = "Crée un nouveau roster avec la configuration par défaut"
-- ClassicLootManager_Integrations/Integrations.lua:248
CLM.L["Creates new trigger to be used during RCLC award."] = "Crée un nouveau déclencheur utilisé lors de l'attribution RCLC."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:500
CLM.L["Ctrl + Alt"] = "Ctrl + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:497
CLM.L["Ctrl"] = "Ctrl"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:710
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1084
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:435
CLM.L["Current"] = "Actuel"
-- ClassicLootManager/Tooltips.lua:95
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:168
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:177
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:673
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:351
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:414
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:424
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:447
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:387
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:444
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:295
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1080
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:323
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1105
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:186
-- ClassicLootManager_Alerts/Alerts.lua:14
CLM.L["DKP"] = "DKP"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:157
CLM.L["DPS"] = "DPS"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:273
CLM.L["Danger Zone - Use at own risk"] = "Zone de danger - Utilisation à vos risques et périls"
-- ClassicLootManager_Integrations/GUI.lua:222
CLM.L["Data"] = "Donnés"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:271
CLM.L["Date"] = "Date"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:145
CLM.L["Deathbringer Saurfang"] = "Porte-mort Saurcroc"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:263
CLM.L["Decay %"] = "Réduction %"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:325
CLM.L["Decay %s%% points to %s selected players."] = "Réduction de %s%% points aux %s joueurs sélectionnés."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:321
CLM.L["Decay %s%% points to everyone in roster."] = "Réduction de %s%%  points à tout le roster."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:273
CLM.L["Decay Negatives"] = "La réduction impacte les points négatifs"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:441
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:287
CLM.L["Decay"] = "Réduction"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:437
CLM.L["Decayed %s%% points to %s players in <%s>"] = "Réduction de %s%% points pour %s joueurs dans <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:461
CLM.L["Decayed %s%% points to all players %s in <%s>"] = "Réduction de %s%% points pour tous les joueurs %s dans <%s>"
-- ClassicLootManager_Integrations/GUI.lua:146
CLM.L["December"] = "Décembre"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:845
CLM.L["Default Boss Kill Bonus Value"] = "Valeur par défaut du bonus de Boss tué"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:82
CLM.L["Default Boss Kill Bonus value"] = "Valeur par défaut du bonus de Boss tué"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1117
CLM.L["Default slot values"] = "Valeurs d'emplacement par défaut"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:657
CLM.L["Description"] = "Description"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:291
CLM.L["Disable data synchronisation"] = "Désactiver la synchronisation des données"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:292
CLM.L["Disable data synchronisation. This might lead to unexpected consequences. Use this at your own risk. Requires /reload to apply."] = "Désactiver la synchro des données. Peut entraîner des conséquences inattendues. Utilisez à vos risques et périls. Nécessite /reload pour appliquer."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:495
CLM.L["Disable"] = "Désactiver"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:37
CLM.L["Disables display of the changelog for any new version."] = "Désactiver l'affichage du changelog pour toute nouvelle version."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:437
CLM.L["Disenchant removed items"] = "Dissenchant les articles supprimés"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:331
CLM.L["Disenchant"] = "Désenchanter"
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:220
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:15
CLM.L["Disenchanted"] = "Désenchanté"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:205
CLM.L["Disenchanters"] = "Désenchanteurs"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:282
CLM.L["Display price"] = "Prix affiché"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:78
CLM.L["Do not show again"] = "Ne pas montrer à nouveau"
-- .:indirectly
CLM.L["Druid"] = "Druide"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1044
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1136
CLM.L["Dynamic Item values"] = "Valeur d'objet dynamique"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:363
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:406
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:408
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:464
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:441
CLM.L["EP"] = "EP"
-- ClassicLootManager_Alerts/Alerts.lua:14
CLM.L["EP/GP"] = "EP/GP"
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:187
CLM.L["EPGP WEB"] = "EPGP WEB"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:674
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1003
CLM.L["EPGP"] = "EPGP"
-- ClassicLootManager_Integrations/ImportCSV.lua:153
-- ClassicLootManager_Integrations/GenericImport.lua:246
CLM.L["ERROR - invalid import data"] = "Erreur - données d'importation non valides"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:19
CLM.L["Ebonroc"] = "Rochébène"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:56
CLM.L["Edge of Madness"] = "Frontière de la folie"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:122
CLM.L["Emalon the Storm Watcher"] = "Emalon le Guetteur d'orage"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:463
CLM.L["Enable !dkp and !bid through whisper / raid. Change requires /reload."] = "Activez !dkp et !bid via chuchotement / raid. Le changement nécessite /reload."
-- ClassicLootManager_Integrations/Integrations.lua:119
CLM.L["Enable Gargul integration. This will allow Gargul to take control over some aspects of CLM (starting auction from Gargul, and awarding)."] = "Activer l'intégration de Gargul. Permettra à Gargul de prendre le contrôle de certains aspects de CLM (Démarrer les enchères et attributions via Gargul)."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1058
CLM.L["Enable OS bids"] = "Activer les offres OS"
-- ClassicLootManager_Integrations/Integrations.lua:234
CLM.L["Enable RCLC integration. This will allow awarding DKP/GP points on RCLC item award. Requires /reload."] = "Activer l'intégration RCLC. Cela permet de donner des DKP/GP via l'attribution d'objets RCLC. Nécessite /reload."
-- ClassicLootManager_Integrations/Integrations.lua:357
CLM.L["Enable WoW DKP Bot Integration. This will result in additional data stored upon logout."] = "Activez l'intégration de WoW DKP Bot. Cela entraînera le stockage de données supplémentaires lors de la déconnexion."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:233
CLM.L["Enable announcing auction start and end."] = "Activer l'annonce de début et fin des enchères."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:137
CLM.L["Enable auto-update bid values when current highest bid changes (open auction only)."] = "Activer la mise à jour automatique des valeurs d'enchères lorsque l'enchère actuelle la plus élevée change (enchère ouverte uniquement)."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:136
CLM.L["Enable auto-update bid values"] = "Activer la mise à jour automatique des valeurs d'enchère"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:462
CLM.L["Enable chat commands"] = "Activer les commandes de chat"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:351
CLM.L["Enable loot auto-assign (Master Looter UI) from corpse when item is awarded"] = "Active l'assignation automatique du butin (Interface du maitre du butin) depuis le cadavre lorsque l'item est attribué"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1223
CLM.L["Enable paid value splitting amongst raiders."] = "Activez la répartition de la valeur payée entre les raiders."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1185
CLM.L["Enable to allow base bids even if higher bids are present if player didn't bid yet. Affects Open-Ascending Auction."] = "Activer pour autoriser les joueurs n'ayant pas encore fait d'offre à poster des offres à valeur de base même si des offres plus hautes existent déjà"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1201
CLM.L["Enable to allow equal bids. Affects Open-Ascending Auction."] = "Activer pour autoriser les offres à valeur égale. Affecte les enchères ouvertes ascendantes"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1193
CLM.L["Enable to always allow All-In bids. Affects Open-Ascending Auction."] = "Activer pour toujours autoriser les offres all-in. Affecte les enchères ouvertes ascendantes"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1066
CLM.L["Enable to always allow cancelling or passing bids. Affects Open-Ascending Auction."] = "Activer pour toujours autoriser à passer/annuler. Affecte els enchères ouvertes ascendantes"
-- ClassicLootManager/MinimapIcon.lua:78
CLM.L["Enables / disables minimap Icon"] = "Active/désactive l'icône de minimap"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:32
CLM.L["Enables / disables verbose data printing during logging"] = "Active/désactive l'impression de données détaillées dans les logs"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:241
CLM.L["Enables announcing chat commands at auction start."] = "Permet d'annoncer les commandes de discussion au début de l'enchère."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:257
CLM.L["Enables announcing loot awards."] = "Active l'annonce des récompenses de butin."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:265
CLM.L["Enables announcing new highest bid (when applicable)."] = "Active l'annonce de la nouvelle offre la plus élevée (le cas échéant)."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:224
CLM.L["Enables announcing raid start and end."] = "Active l'annonce de début et fin du raid."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:360
CLM.L["Enables auto-trade awarded loot after auctioning from bag"] = "Active l'échange automatique du butin après la vente aux enchères depuis l’inventaire"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:283
CLM.L["Enables displaying item price on tooltip."] = "Active l'affichage du prix en infobulle"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:249
CLM.L["Enables raid-warning countdown for auctions."] = "Active le compte à rebours en avertissement de raid pour les enchères."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:744
CLM.L["End Timetravel"] = "Mettre fin au Timetravel"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:398
CLM.L["End selected raid"] = "Mettre fin au raid sélectionné"
-- ClassicLootManager/Utils.lua:924
CLM.L["Epic"] = "Épique"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:460
CLM.L["Equation"] = "Equation"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:111
CLM.L["Eredar Twins"] = "Jumelles érédars"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:846
CLM.L["Europe"] = "Europe"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:288
CLM.L["Execute decay for players based on context."] = "Appliquer la réduction aux joueurs en fonction du contexte"
-- ClassicLootManager_Integrations/Migration.lua:432
CLM.L["Execute migration from MonolithDKP, EssentialDKP, CommunityDKP, BastionLoot or CEPGP"] = "Exécuter la migration depuis MonolithDKP, EssentialDKP, CommunityDKP, BastionLoot ou CEPGP"
-- ClassicLootManager_Integrations/Migration.lua:52
CLM.L["Executing Addon Migration with comms disabled."] = "Exécution de la migration des modules complémentaires avec les communications désactivées."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:490
CLM.L["Exponent / Base"] = "Exposant / base"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:482
CLM.L["Exponential scaling value used by the equations (Base for EPGPWeb, or Exponent for WoWpedia)"] = "Valeur de mise à l'échelle exponentielle utilisée par les équations (base pour epgpweb, ou exposant pour wowpedia)"
-- ClassicLootManager/MinimapIcon.lua:132
-- ClassicLootManager_Integrations/GUI.lua:398
-- ClassicLootManager_Integrations/GUI.lua:407
-- ClassicLootManager_Integrations/GUI.lua:484
-- ClassicLootManager_Integrations/GUI.lua:485
CLM.L["Export"] = "Exporter"
-- ClassicLootManager/Modules/GUI/Filters.lua:79
CLM.L["External"] = "Externe"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:140
CLM.L["Faction Champions"] = "Champions de faction"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:37
CLM.L["False"] = "Faux"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:26
CLM.L["Fankriss the Unyielding"] = "Fankriss l'Inflexible"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:81
CLM.L["Fathom-Lord Karathress"] = "Seigneur des fonds Karathress"
-- ClassicLootManager_Integrations/GUI.lua:136
CLM.L["February"] = "Février"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:783
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:816
CLM.L["Feet"] = "Pieds"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:110
CLM.L["Felmyst"] = "Gangrebrume"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:146
CLM.L["Festergut"] = "Pulentraille"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:373
CLM.L["Fill auction list from corpse"] = "Remplir la liste d'enchère depuis le cadavre"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:374
CLM.L["Fill auction list with items from corpse. Will happen only if you open the corpse loot window."] = "Remplir la liste d'enchère avec les items présents sur le cadavre. Se produira seulement si vous ouvrez la fenêtre de butin du cadavre"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:391
CLM.L["Fill auction list with looted items"] = "Remplir la liste d'enchères avec les items"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:392
CLM.L["Fill auction list with looted items. This will automatically add all items you have received."] = "Remplir la liste d'enchères avec les items. Ajoutera automatiquement tous les items que vous avez reçu"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:97
CLM.L["Fill from Guild"] = "Remplir depuis la guilde"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:109
CLM.L["Fill from Raid Roster"] = "Remplir à partir du groupe de raid"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:383
CLM.L["Fill from corpse only if you are the Loot Master."] = "Remplir depuis le cadavre uniquement si vous êtes maitre du butin"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:401
CLM.L["Fill from loot only if you are using Group Loot."] = "Remplir depuis le butin uniquement si vous utilisez le butin de groupe"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:110
CLM.L["Fill profile list with players in current raid roster."] = "Remplir la liste de profils avec les joueurs dans le groupe de raid."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:98
CLM.L["Fill profile list with players with the minimum level and ranks."] = "Remplir la liste de profils avec les joueurs ayant le niveau et les rangs minimum."
-- ClassicLootManager/Modules/GUI/Filters.lua:163
CLM.L["Filter"] = "Filtre"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:784
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:817
CLM.L["Finger"] = "Doigt"
-- ClassicLootManager_Integrations/GUI.lua:282
CLM.L["Finish Day"] = "Jour de fin"
-- ClassicLootManager_Integrations/GUI.lua:293
CLM.L["Finish Month"] = "Mois de fin"
-- ClassicLootManager_Integrations/GUI.lua:304
CLM.L["Finish Year"] = "Année de fin"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:524
CLM.L["Finished raid %s"] = "Raid %s terminé"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:810
CLM.L["Finished"] = "Terminé"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:18
CLM.L["Firemaw"] = "Gueule-de-feu"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:127
CLM.L["Flame Leviathan"] = "Léviathan des flammes"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:20
CLM.L["Flamegor"] = "Flamegor"
-- ClassicLootManager_Integrations/GUI.lua:233
CLM.L["Format"] = "Format"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:162
CLM.L["Found %s in guild."] = "Trouvé %s dans la guilde."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:128
CLM.L["Freya"] = "Freya"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:220
CLM.L["GM"] = "GM"
-- ClassicLootManager/Tooltips.lua:95
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:168
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:177
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:364
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:407
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:435
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:462
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:385
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:439
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:295
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:323
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1105
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:186
CLM.L["GP"] = "GP"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:57
CLM.L["Gahz'ranka"] = "Gahz'ranka"
-- ClassicLootManager_Integrations/Integrations.lua:112
-- ClassicLootManager_Integrations/Integrations.lua:118
CLM.L["Gargul Integration"] = "Intégration Gargul"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:8
CLM.L["Garr"] = "Garr"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:242
CLM.L["Gear Points"] = "Points de vitesse"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:7
CLM.L["Gehennas"] = "Gehennas"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:59
CLM.L["General Rajaxx"] = "Général Rajaxx"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:129
CLM.L["General Vezax"] = "Général Vezax"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:157
CLM.L["General Zarithrian"] = "Général Zarithrian"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:751
CLM.L["General settings"] = "Options générales"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:770
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:803
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:96
CLM.L["Global"] = "Général"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:37
CLM.L["Gluth"] = "Gluth"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:12
CLM.L["Golemagg the Incinerator"] = "Golemagg l'Incinérateur"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:43
CLM.L["Gothik the Harvester"] = "Gothik le Moissonneur"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:33
CLM.L["Grand Widow Faerlina"] = "Grande veuve Faerlina"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:36
CLM.L["Grobbulus"] = "Grobbulus"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:400
CLM.L["Group Loot Only"] = "Butin de groupe uniquement"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:76
CLM.L["Gruul the Dragonkiller"] = "Gruul le Tue-dragon"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:311
CLM.L["Gruul's Lair"] = "Repaire de Gruul"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:92
CLM.L["Gurtogg Bloodboil"] = "Gurtogg Fièvresang"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:55
CLM.L["Hakkar"] = "Hakkar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:105
CLM.L["Halazzi"] = "Halazzi"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:159
CLM.L["Halion"] = "Halion"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:780
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:813
CLM.L["Hands"] = "Mains"
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:68
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:616
CLM.L["Hard Mode"] = "Mode hard"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:957
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:106
CLM.L["Hard cap"] = "Hard cap"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:771
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:804
CLM.L["Head"] = "Tête"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:156
CLM.L["Healer"] = "Soigneur"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:40
CLM.L["Heigan the Unclean"] = "Heigan l'Impur"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:789
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:822
CLM.L["Held In Off-hand"] = "Tenu en main gauche"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:106
CLM.L["Hex Lord Malacrass"] = "Seigneur des maléfices Malacrass"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:203
CLM.L["Hide in combat"] = "Se cacher au combat"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:472
CLM.L["Hides incoming !dkp and !bid whispers. Change requires /reload."] = "Masque les chuchotements entrants !dkp et !bid. Le changement nécessite /reload."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:481
CLM.L["Hides outgoing !dkp and !bid responses. Change requires /reload."] = "Masque les réponses sortantes !dkp et !bid. La modification nécessite /reload."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:86
CLM.L["High Astromancer Solarian"] = "Grande astromancienne Solarian"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:75
CLM.L["High King Maulgar"] = "Haut Roi Maulgar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:48
CLM.L["High Priest Thekal"] = "Grand prêtre Thekal"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:49
CLM.L["High Priest Venoxis"] = "Grand prêtre Venoxis"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:50
CLM.L["High Priestess Arlokk"] = "Grande prêtresse Arlokk"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:51
CLM.L["High Priestess Jeklik"] = "Grande prêtresse Jeklik"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:52
CLM.L["High Priestess Mar'li"] = "Grande prêtresse Mar'li"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:88
CLM.L["High Warlord Naj'entus"] = "Grand seigneur de guerre Naj'entus"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:136
CLM.L["History type"] = "Type d'historique"
-- .:indirectly
CLM.L["History"] = "Historique"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:130
CLM.L["Hodir"] = "Hodir"
-- .:indirectly
CLM.L["Hunter"] = "Chasseur"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:78
CLM.L["Hydross the Unstable"] = "Hydross l'Instable"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:363
CLM.L["Hyjal Summit"] = "Sommet d'Hyjal"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:480
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:597
CLM.L["Icecrown Citadel"] = "Citadelle de la couronne de glace"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:148
CLM.L["Icecrown Gunship Battle"] = "Bataille des canonnières"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:131
CLM.L["Ignis the Furnace Master"] = "Ignis le maître de la Fournaise"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:97
CLM.L["Ignore entry"] = "Ignorer la saisie"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:446
CLM.L["Ignore"] = "Ignorer"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:96
CLM.L["Illidan Stormrage"] = "Illidan Hurlorage"
-- ClassicLootManager_Integrations/Migration.lua:246
-- ClassicLootManager_Integrations/Migration.lua:380
-- ClassicLootManager_Integrations/Migration.lua:424
CLM.L["Import complete"] = "Importation terminée"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:440
-- ClassicLootManager_Integrations/ImportCSV.lua:100
-- ClassicLootManager_Integrations/ImportCSV.lua:162
-- ClassicLootManager_Integrations/ImportCSV.lua:163
-- ClassicLootManager_Integrations/ImportCSV.lua:191
-- ClassicLootManager_Integrations/GenericImport.lua:222
-- ClassicLootManager_Integrations/GenericImport.lua:255
-- ClassicLootManager_Integrations/GenericImport.lua:256
-- ClassicLootManager_Integrations/GenericImport.lua:263
CLM.L["Import"] = "Importer"
-- ClassicLootManager_Integrations/Migration.lua:197
CLM.L["Importing %s entries from DKPTable"] = "Importation de %s entrées  depuis la table DKP"
-- ClassicLootManager_Integrations/Migration.lua:308
CLM.L["Importing profiles from DKPTable"] = "Importation de profils depuis la table DKP"
-- ClassicLootManager/Modules/GUI/Filters.lua:78
CLM.L["In Guild"] = "Dans la guilde"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:809
CLM.L["In Progress"] = "En cours"
-- ClassicLootManager/Modules/GUI/Filters.lua:75
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:289
CLM.L["In Raid"] = "En Raid"
-- ClassicLootManager/MinimapIcon.lua:48
CLM.L["In-Sync"] = "En synchronisation"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:907
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:138
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:124
CLM.L["Include bench"] = "Inclure banc"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:908
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:139
CLM.L["Include benched players in all auto-awards"] = "Inclure les joueurs sur le banc dans toutes les récompenses automatiques"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:274
CLM.L["Include players with negative standings in decay."] = "Inclure les joueurs avec un total de points négatifs à la réduction"
-- ClassicLootManager/MinimapIcon.lua:46
CLM.L["Incoherent state"] = "État incohérent"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:261
CLM.L["Info"] = "Info"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:404
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:410
CLM.L["Information"] = "Information"
-- ClassicLootManager_Integrations/ImportCSV.lua:73
CLM.L["Input CSV Item value override data"] = "Entrer les données de remplacement de valeur au format CSV"
-- ClassicLootManager_Integrations/GenericImport.lua:199
CLM.L["Input JSON exported standings"] = "Entrer les données exportées en JSON"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:157
CLM.L["Input name: %s"] = "Nom d'entrée: %s"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:42
CLM.L["Instructor Razuvious"] = "Instructeur Razuvious"
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:136
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:141
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:146
-- ClassicLootManager_Integrations/ClassicLootManager_Integrations.lua:20
CLM.L["Integrations"] = "Intégrations"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:100
CLM.L["Interval Bonus time"] = "Intervalle de temps du bonus"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:442
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:883
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:115
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:248
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:97
CLM.L["Interval Bonus"] = "Bonus d'intervalle"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:890
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:122
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:250
CLM.L["Interval Time"] = "Intervalle de temps"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:899
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:130
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:251
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:103
CLM.L["Interval Value"] = "Valeur du bonus d'intervalle"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:891
CLM.L["Interval in [minutes] to award bonus points"] = "Intervalle en [minutes] pour attribuer des points bonus"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1283
CLM.L["Invalid bid value"] = "Valeur d'enchère non valide"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:319
CLM.L["Invalid context. You should not decay raid only."] = "Contexte non valide. Vous ne devriez pas faire de réduction uniquement sur le raid."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:16
CLM.L["Invalid item link"] = "Lien d'objet invalide"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1289
CLM.L["Invalid item"] = "Item invalide"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:50
CLM.L["Invalid value provided"] = "Valeur fournie non valide"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:58
CLM.L["Item Value Mode"] = "Mode de Valeur de l'objet"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1036
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1208
CLM.L["Item value mode"] = "Mode de Valeur de l'objet"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:22
CLM.L["Item value must be positive"] = "La valeur de l'objet doit être positive"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1130
CLM.L["Item value overrides"] = "Remplacements de la valeur de l'objet"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:86
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:100
CLM.L["Item"] = "Objet"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:104
CLM.L["Jan'alai"] = "Jan'alai"
-- ClassicLootManager_Integrations/GUI.lua:135
CLM.L["January"] = "Janvier"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:54
CLM.L["Jin'do the Hexxer"] = "Jin'do le Maléficieur"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:81
CLM.L["Join our discord for more info: "] = "Rejoignez notre discord pour plus d'infos : "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:412
CLM.L["Join selected raid"] = "Rejoindre le raid sélectionné"
-- ClassicLootManager_Integrations/GUI.lua:141
CLM.L["July"] = "Juillet"
-- ClassicLootManager_Integrations/GUI.lua:140
CLM.L["June"] = "Juin"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:87
CLM.L["Kael'thas Sunstrider"] = "Kael'thas Haut-soleil"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:108
CLM.L["Kalecgos"] = "Kalecgos"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:294
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
CLM.L["Koralon the Flame Watcher"] = "Koralon le Veilleur des flammes"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:58
CLM.L["Kurinnaxx"] = "Kurinnaxx"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:149
CLM.L["Lady Deathwhisper"] = "Dame Murmemort"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:83
CLM.L["Lady Vashj"] = "Dame Vashj"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:368
CLM.L["Large value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Grande valeur pour les enchères par palier. \n\nRemplissez la même valeur que les autres paliers ou une valeur négative pour ignorer"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:880
CLM.L["Large"] = "Grand"
-- ClassicLootManager_Integrations/GUI.lua:322
CLM.L["Last month"] = "Le mois dernier"
-- ClassicLootManager_Integrations/GUI.lua:315
CLM.L["Last week"] = "La semaine dernière"
-- ClassicLootManager_Integrations/GUI.lua:329
CLM.L["Last year"] = "L'année dernière"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:424
CLM.L["Latest loot"] = "Dernier butin"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:447
CLM.L["Latest points"] = "Derniers points"
-- ClassicLootManager/Utils.lua:925
CLM.L["Legendary"] = "Légendaire"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:782
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:815
CLM.L["Legs"] = "Jambes"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:80
CLM.L["Leotheras the Blind"] = "Leotheras l'Aveugle"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:78
CLM.L["Link Alt to Main"] = "Lier Reroll au Main"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:443
CLM.L["Linking override"] = "Remplacement de la liaison"
-- ClassicLootManager/MinimapIcon.lua:42
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:378
CLM.L["Loading..."] = "Chargement..."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:41
CLM.L["Loatheb"] = "Horreb"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:264
CLM.L["Lock selected"] = "Verrouillage sélectionné"
-- ClassicLootManager/Modules/GUI/Filters.lua:81
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:392
CLM.L["Locked"] = "Fermé"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:22
CLM.L["Logging level"] = "Niveau Enregistrement"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:18
CLM.L["Logging"] = "Enregistrement"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:256
CLM.L["Loot Awards"] = "Récompenses de butin"
-- ClassicLootManager_Integrations/GUI.lua:21
CLM.L["Loot History"] = "Historique du butin"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:409
CLM.L["Loot rarity"] = "Rareté de butin"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:21
CLM.L["Loot"] = "Butin"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:141
CLM.L["Lord Jaraxxus"] = "Seigneur Jaraxxus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:150
CLM.L["Lord Marrowgar"] = "Seigneur Gargamoelle"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:5
CLM.L["Lucifron"] = "Lucifron"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:112
CLM.L["M'uru"] = "M'uru"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:417
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:322
-- ClassicLootManager_Integrations/Integrations.lua:132
-- ClassicLootManager_Integrations/Integrations.lua:137
CLM.L["MS"] = "MS"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:34
CLM.L["Maexxna"] = "Maexxna"
-- .:indirectly
CLM.L["Mage"] = "Mage"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:6
CLM.L["Magmadar"] = "Magmadar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:77
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:319
CLM.L["Magtheridon"] = "Magtheridon"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:66
CLM.L["Maiden of Virtue"] = "Damoiselle de vertu"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:787
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:820
CLM.L["Main Hand"] = "Main droite"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:173
CLM.L["Main"] = "Main"
-- ClassicLootManager/Modules/GUI/Filters.lua:80
CLM.L["Mains"] = "Mains"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:13
CLM.L["Majordomo Executus"] = "Chambellan Executus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:120
CLM.L["Malygos"] = "Malygos"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:136
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:71
CLM.L["Management"] = "Gestion"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:222
CLM.L["Manager"] = "Admin"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:436
CLM.L["Manual adjustment"] = "Réglage manuel"
-- ClassicLootManager_Integrations/GUI.lua:137
CLM.L["March"] = "Mars"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:382
CLM.L["Master Loot Only"] = "Maitre du butin uniquement"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:881
CLM.L["Max"] = "Маx"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:949
CLM.L["Maximum point cap player can receive per raid week. Set to 0 to disable."] = "Le nombre maximum de points qu’un joueur peut recevoir par semaine de raid. Réglez sur 0 pour désactiver."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:958
CLM.L["Maximum point cap that player can have. Set to 0 to disable."] = "Limite maximale de points qu’un joueur peut avoir. Réglez sur 0 pour désactiver."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:372
CLM.L["Maximum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Valeur maximum pour les enchères montantes ou par palier.\n\nRemplissez la même valeur que les autres paliers ou une valeur négative pour ignorer"
-- ClassicLootManager_Integrations/GUI.lua:139
CLM.L["May"] = "Mai"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:364
CLM.L["Medium value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Valeur Médium pour les enchères par palier. \n\nRemplissez la même valeur que les autres paliers ou une valeur négative pour ignorer"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:879
CLM.L["Medium"] = "Médium"
-- ClassicLootManager/MinimapIcon.lua:100
CLM.L["Menu"] = "Menu"
-- ClassicLootManager_Integrations/Migration.lua:184
-- ClassicLootManager_Integrations/Migration.lua:262
-- ClassicLootManager_Integrations/Migration.lua:391
CLM.L["Migrating %s"] = "Migration de %s"
-- ClassicLootManager_Integrations/Migration.lua:66
CLM.L["Migration complete. %s to apply and sync with others or go to %s to discard."] = "Migration terminée. %s pour appliquer et synchroniser avec les autres ou aller à %s pour annuler."
-- ClassicLootManager_Integrations/Migration.lua:285
CLM.L["Migration failure: Detected 0 teams"] = "Échec de la migration : 0 équipes détectées"
-- ClassicLootManager_Integrations/Migration.lua:223
-- ClassicLootManager_Integrations/Migration.lua:339
CLM.L["Migration failure: Unable to create profiles"] = "Échec de la migration : impossible de créer des profils"
-- ClassicLootManager_Integrations/Migration.lua:35
CLM.L["Migration ongoing: %s(%s)"] = "Migration en cours : %s(%s)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:133
CLM.L["Mimiron"] = "Mimiron"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:118
CLM.L["Min bid increment"] = "Incrément d'enchère minimum"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1253
CLM.L["Minimal increment"] = "Incrément minimal"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1254
CLM.L["Minimal value increment for open auction mode."] = "Valeur minimale d’incrément en mode d'enchères ouvertes."
-- ClassicLootManager_Integrations/Migration.lua:68
CLM.L["Minimap Icon -> Configuration -> Wipe events"] = "Icône de minicarte -> Configuration -> Effacer les événements"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1011
CLM.L["Minimum GP used in calculations when player has less GP than this value."] = "GP minimum utilisés dans les calculs lorsque le joueur a moins de GP que cette valeur."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1010
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:142
CLM.L["Minimum GP"] = "GP minimum"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:84
CLM.L["Minimum Level"] = "Niveau minimum"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:85
CLM.L["Minimum level of players to fill from guild."] = "Niveau minimum des joueurs à remplir depuis guilde."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:139
CLM.L["Minimum points (DKP / EP)"] = "Points minimums (DKP / EP)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1074
CLM.L["Minimum standing required to be allowed to bid."] = "Capital minimum pour avoir le droit d'enchérir"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1073
CLM.L["Minimum standing"] = "Capital minimum"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:228
CLM.L["Missing award value"] = "Valeur de récompense manquante"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:317
CLM.L["Missing decay value"] = "Valeur de réduction manquante"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:55
CLM.L["Missing profile %s"] = "Profil %s manquant"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:33
CLM.L["Missing roster name and you are not in raid"] = "Nom de roster manquant et vous n'êtes pas en raid"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:37
CLM.L["Missing roster name. Using Raid Info"] = "Nom de roster manquant. Utilisation des informations de raid"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:322
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:394
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:433
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:462
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:496
CLM.L["Missing valid raid"] = "Raid valide manquant"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:60
CLM.L["Moam"] = "Moam"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:235
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:418
CLM.L["Modifier combination"] = "Modifier la combinaison de touche"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:197
CLM.L["Molten Core"] = "Cœur du Magma"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:65
CLM.L["Moroes"] = "Moroes"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:82
CLM.L["Morogrim Tidewalker"] = "Morogrim Marcheur-des-flots"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:94
CLM.L["Mother Shahraz"] = "Mère Shahraz"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:228
CLM.L["Moving %s from current queue to pending queue."] = "Déplacer %s de la file d'attente actuelle à la file d'attente en attente."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:456
CLM.L["Multiple"] = "Multiple"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:545
CLM.L["Multiplier for tier %s (if used by the auction type)."] = "Multiplicateur du palier %s (si utilisé par le type d'enchère)."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:468
CLM.L["Multiplier used by the equations"] = "Multiplicateur utilisé par l'équation"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:476
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1123
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:286
CLM.L["Multiplier"] = "Mutiplicateur"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:103
CLM.L["Nalorakk"] = "Nalorakk"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:756
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:350
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:361
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:259
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:172
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:698
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:423
CLM.L["Name"] = "Nom"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:145
CLM.L["Named Buttons"] = "Boutons nommés"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:242
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:401
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:518
CLM.L["Naxxramas"] = "Naxxramas"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:772
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:805
CLM.L["Neck"] = "Cou"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:22
CLM.L["Nefarian"] = "Nefarian"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:71
CLM.L["Netherspite"] = "Dédain-du-Néant"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:36
CLM.L["Never show changelog"] = "Ne jamais afficher le journal des modifications"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1102
CLM.L["New highest bid on %s: %s %s %s"] = "Nouvelle offre la plus haute %s: %d %s %s"
-- ClassicLootManager_Integrations/GenericImport.lua:105
CLM.L["New roster: %s"] = "Nouveau roster: %s"
-- ClassicLootManager_Integrations/Migration.lua:111
CLM.L["New roster: [%s]"] = "Nouveau roster : [%s]"
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:59
CLM.L["New version %s of Classic Loot Manager is available. For best experience please update the AddOn."] = "La nouvelle version %s de Classic Loot Manager est disponible. Pour une meilleure expérience, veuillez mettre à jour l'Addon."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:74
CLM.L["Nightbane"] = "Plaie-de-nuit"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1285
CLM.L["No auction in progress"] = "Aucune enchère en cours"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:833
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:193
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:178
CLM.L["No bids"] = "Aucune enchère"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:441
CLM.L["No loot received"] = "Aucun butin reçu"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:215
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:306
CLM.L["No players selected"] = "Aucun joueur sélectionné."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:470
CLM.L["No points received"] = "Aucun point reçu"
-- ClassicLootManager/Utils.lua:508
CLM.L["No"] = "Non"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:794
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:827
CLM.L["Non-equippable"] = "Non-équipable"
-- ClassicLootManager/Modules/GUI/Filters.lua:191
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:300
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:223
-- ClassicLootManager_Integrations/Integrations.lua:643
CLM.L["None"] = "Aucun"
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:67
CLM.L["Normal Mode"] = "Mode normal"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:142
CLM.L["Northrend Beasts"] = "Les bêtes du Norfendre"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1278
CLM.L["Not in a roster"] = "Pas dans un roster"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:565
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:610
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:580
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:278
CLM.L["Not in raid"] = "Pas en raid"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:151
CLM.L["Note to be added to award. Max 25 characters. It is recommended to not include date nor selected reason here. If you will input encounter ID it will be transformed into boss name."] = "Ajouter une note à l’attrib. de points. Maximum 25 lettres. Il est recommandé de ne pas inclure de date ni la raison ici. Si vous entrer l'ID de la rencontre, il sera transformé en nom du boss"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:149
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:233
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:115
CLM.L["Note"] = "Note"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:39
CLM.L["Noth the Plaguebringer"] = "Noth le Porte-peste"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:351
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:518
CLM.L["Notify that you are passing on the item."] = "Avertissez que vous passez sur l'objet."
-- ClassicLootManager_Integrations/GUI.lua:145
CLM.L["November"] = "Novembre"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:654
CLM.L["Num"] = "Nombre"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1057
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:418
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:336
-- ClassicLootManager_Integrations/Integrations.lua:142
-- ClassicLootManager_Integrations/Integrations.lua:147
CLM.L["OS"] = "OS"
-- ClassicLootManager_Integrations/GUI.lua:144
CLM.L["October"] = "Octobre"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:788
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:821
CLM.L["Off Hand"] = "Main gauche"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1288
CLM.L["Off-spec bidding not allowed"] = "Les enchères hors spécifications non autorisées"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:860
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:92
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:240
CLM.L["On Time Bonus Value"] = "Valeur du bonus de début de raid"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:88
CLM.L["On Time Bonus value"] = "Valeur du bonus de début de raid"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:429
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:853
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:85
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:238
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:85
CLM.L["On Time Bonus"] = "Bonus de début de raid"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:786
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:819
CLM.L["One-Hand"] = "Une main"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:915
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:127
CLM.L["Online only"] = "En ligne seulement"
-- ClassicLootManager/Modules/GUI/Filters.lua:76
CLM.L["Online"] = "En ligne"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:186
CLM.L["Only when ML/RL"] = "Uniquement lorsque ML/RL"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:4
CLM.L["Onyxia"] = "Onyxia"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:190
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:498
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:615
CLM.L["Onyxia's Lair"] = "Repaire d'Onyxia"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:122
CLM.L["Open Key Bindings UI for AddOns"] = "Ouvrir les raccourcis clavier pour les addons"
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:54
CLM.L["Open trade"] = "Ouvrir l'échange"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:694
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:701
CLM.L["Open"] = "Ouvert"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:67
CLM.L["Opera Hall"] = "L'Opéra"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:63
CLM.L["Ossirian the Unscarred"] = "Ossirian l'Intouché"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1247
CLM.L["Other"] = "Autre"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:30
CLM.L["Ouro"] = "Ouro"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:74
CLM.L["Overrides"] = "Paramètres"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1230
CLM.L["PASS"] = "PASSE"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1019
CLM.L["PR Rounding"] = "PR Arrondi"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:362
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1082
CLM.L["PR"] = "PR"
-- .:indirectly
CLM.L["Paladin"] = "Paladin"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:287
CLM.L["Participated"] = "Participé"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:292
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:419
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:350
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:517
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:860
CLM.L["Pass"] = "Passe"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1287
CLM.L["Passing after bidding not allowed"] = "Passer après une enchère n'est pas autorisé"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:35
CLM.L["Patchwerk"] = "Le Recousu"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:117
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:124
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:272
CLM.L["Player"] = "Joueur"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:360
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:373
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:390
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:404
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:418
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:437
CLM.L["Please select a raid"] = "Veuillez sélectionner un raid"
-- ClassicLootManager_Integrations/GUI.lua:20
CLM.L["Point History"] = "Historique des points"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:989
CLM.L["Point award multiplier for players on bench."] = "Multiplicateur de récompense pour les joueurs sur le banc"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:933
CLM.L["Point caps"] = "Point caps"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:763
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1294
CLM.L["Point type"] = "Type de point"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:22
CLM.L["Point"] = "Point"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:174
CLM.L["Points value that will be awarded."] = "Valeur des points qui seront attribués"
-- ClassicLootManager/Utils.lua:920
CLM.L["Poor"] = "Médiocre"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:66
CLM.L["Post bids"] = "Annoncer les offres"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:67
CLM.L["Post channel"] = "Canal d’annonce"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:278
CLM.L["Price Tooltips"] = "Infobulle de prix"
-- .:indirectly
CLM.L["Priest"] = "Prêtre"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:73
CLM.L["Prince Malchezaar"] = "Prince Malchezaar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:28
CLM.L["Princess Huhuran"] = "Princesse Huhuran"
-- ClassicLootManager_Integrations/Integrations.lua:137
-- ClassicLootManager_Integrations/Integrations.lua:147
CLM.L["Prioritized"] = "Priorisé"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:151
CLM.L["Professor Putricide"] = "Professeur Putricide"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:261
CLM.L["Profile %s already exists and is used by different GUID %s (%s). "] = "Le profil %s existe déjà et est utilisé par un différent GUID %s (%s)."
-- .:indirectly
CLM.L["Profiles"] = "Profils"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:432
CLM.L["Progression Bonus"] = "Bonus de progression"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:387
CLM.L["Provide number of raids needed for 100% attendance in a weekly reset. Between 1 - 50 raids. Defaults to 2. Requires /reload."] = "Indiquez le nombre de raids nécessaires pour une participation à 100% lors d'une réinitialisation hebdomadaire. Entre 1 et 50 raids. La valeur par défaut est 2. Nécessite /reload."
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:405
CLM.L["Provide number of weeks that will be accounted for attendance. Between 1 - 1000 weeks. Defaults to 10. Requires /reload."] = "Indiquez sur combien de semaines sera calculée la fréquentation. Entre 1 et 1000 semaines. La valeur par défaut est 10. Nécessite /reload."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:111
CLM.L["Prune profiles"] = "Nettoyer les profils"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:981
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:147
CLM.L["Put players leaving raid on bench instead of removing them. To remove them completely they will need to be removed manually from the bench."] = "Mettez les joueurs quittant le raid sur le banc au lieu de les retirer. Pour les retirer complètement, ils devront être retirés manuellement du banc."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:152
CLM.L["Queen Lana'thel"] = "Reine de sang Lana'thel"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:798
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:831
CLM.L["Quiver"] = "Carquois"
-- ClassicLootManager_Integrations/Integrations.lua:227
-- ClassicLootManager_Integrations/Integrations.lua:233
CLM.L["RCLC Integration"] = "Integration RCLC"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:675
CLM.L["ROLL"] = "Jet de dés"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:97
CLM.L["Rage Winterchill"] = "Rage Froidhiver"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:14
CLM.L["Ragnaros"] = "Ragnaros"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:245
CLM.L["Raid Completion Bonus Value"] = "Valeur du bonus de fin de raid"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:94
CLM.L["Raid Completion Bonus value"] = "Valeur du bonus de fin de raid"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:431
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:868
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:100
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:243
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:91
CLM.L["Raid Completion Bonus"] = "Bonus de fin de raid"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:875
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:107
CLM.L["Raid Completion Value"] = "Valeur de fin de raid"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:183
CLM.L["Raid Name"] = "Nom du raid"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:223
CLM.L["Raid Start/End"] = "Début/Fin du Raid"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:219
CLM.L["Raid Warnings"] = "Avertissements de raid"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:426
CLM.L["Raid [%s] ended"] = "Raid [%s] terminé"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:374
CLM.L["Raid [%s] started"] = "Le raid [%s] a commencé"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:312
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:334
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:406
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:449
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:474
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:508
CLM.L["Raid management is disabled during time traveling."] = "La gestion des raids est désactivée pendant le Time-traveling"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:742
CLM.L["Raid"] = "Raid"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:39
CLM.L["Raid: %s Roster: %s"] = "Raid : %s Roster : %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:386
CLM.L["Raids needed in reset"] = "Raids nécessaires à la réinitialisation"
-- ClassicLootManager_Integrations/GUI.lua:22
CLM.L["Raids"] = "Raids"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:793
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:826
CLM.L["Ranged (wands)"] = "À distance (baguettes)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:792
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:825
CLM.L["Ranged"] = "À distance"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:75
CLM.L["Ranks"] = "Rangs"
-- ClassicLootManager/Utils.lua:923
CLM.L["Rare"] = "Rare"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:15
CLM.L["Razorgore the Untamed"] = "Tranchetripe l'Indompté"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:134
CLM.L["Razorscale"] = "Tranchécaille"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:164
CLM.L["Reason"] = "Raison"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:353
CLM.L["Received"] = "Reçu"
-- ClassicLootManager_Integrations/Integrations.lua:132
-- ClassicLootManager_Integrations/Integrations.lua:142
CLM.L["Regular"] = "Standard"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:799
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:832
CLM.L["Relic"] = "Relique"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:93
CLM.L["Reliquary of Souls"] = "Reliquaire des âmes"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:266
CLM.L["Remove all items from auction list. Populates new one if there are any pending."] = "Retirer tous les items de la liste d'enchères. Recréé une nouvelle liste si des items sont encore en attente"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:103
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:80
CLM.L["Remove all"] = "Supprimer tout"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:79
CLM.L["Remove auction"] = "Supprimer l'enchère"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:656
CLM.L["Remove from roster"] = "Retirer du roster"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:607
CLM.L["Remove from standby"] = "Retirer du mode veille"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:277
CLM.L["Remove item from auction list after it's awarded."] = "Retirer l'item de la liste d'enchères lorsqu'il est attribué"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:429
CLM.L["Remove items without bids from auction list. This will make marking items as disenchanted not possible."] = "Retirez les articles sans offres de la liste des enchères. Cela rendra les articles de marquage comme désenchantés non possibles."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:428
CLM.L["Remove items without bids"] = "Retirer les articles sans offres"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:92
CLM.L["Remove old"] = "Supprimer l'ancien"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:275
CLM.L["Remove on award"] = "Retirer lors de l'attribution"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:602
CLM.L["Remove override"] = "Supprimer le remplacement"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:817
CLM.L["Remove roster"] = "Supprimer le roster"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:431
CLM.L["Remove selected raid"] = "Supprimer le raid sélectionné"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:286
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:482
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:754
CLM.L["Remove selected"] = "Supprimer la sélection"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:823
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:396
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:276
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:67
CLM.L["Remove"] = "Supprimer"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:824
CLM.L["Removes current roster."] = "Supprime le roster actuel."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:224
CLM.L["Removing %s from current queue."] = "Suppression de %s de la file d'attente actuelle."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:221
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:621
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:700
CLM.L["Removing items not allowed during auction."] = "Interdiction de retirer des objets en cours d'enchère"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:354
CLM.L["Request standby"] = "Demander une mise en veille"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:101
CLM.L["Rescales CLM UI, except Bidding window. You can rescale Bidding window independently by using Ctrl + Mouse Wheel. Some windows may require closing and reopening."] = "Modifie l'échelle d'interface CLM, sauf la fenêtre d'Enchère. Vous pouvez modifier l'échelle de la fenêtre d'enchère indépendamment en utilisant Ctrl + Molette de la souris. Certaines fenêtres devront être fermées et rouvertes."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:181
CLM.L["Reset gui positions"] = "Réinitialiser les positions de l'interface graphique"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:367
CLM.L["Revoke standby"] = "Révoquer la mise en veille"
-- .:indirectly
CLM.L["Rogue"] = "Voleur"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:174
CLM.L["Role"] = "Rôle"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1106
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1107
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:714
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:440
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:551
CLM.L["Roll"] = "Roll"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:894
CLM.L["Rolling complete"] = "Rolls terminés"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1286
CLM.L["Roster Name"] = "Nom de roster"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1285
CLM.L["Roster name"] = "Nom de roster"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:104
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:115
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:741
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:306
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:113
-- ClassicLootManager_Integrations/ImportCSV.lua:91
CLM.L["Roster"] = "Roster"
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:135
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:140
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:145
CLM.L["Rosters"] = "Rosters"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:153
CLM.L["Rotface"] = "Trognepus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1020
CLM.L["Round PR to selected number of decimals"] = "Arrondir PR au nombre de décimales sélectionné"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:777
CLM.L["Round to selected number of decimals"] = "Arrondir au nombre de décimales sélectionné"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:115
CLM.L["Round to"] = "Arrondir à"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:776
CLM.L["Rounding"] = "Arrondi"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:279
CLM.L["Ruins of Ahn'Qiraj"] = "Ruines d'Ahn'Qiraj"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:676
CLM.L["SK"] = "SK"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:924
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:130
CLM.L["Same zone only"] = "Même zone uniquement"
-- ClassicLootManager/MinimapIcon.lua:56
CLM.L["Sandbox mode"] = "Mode Sandbox"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:45
CLM.L["Sapphiron"] = "Saphiron"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:116
CLM.L["Sartharion"] = "Sartharion"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:158
CLM.L["Saviana Ragefire"] = "Saviana Ragefeu"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:695
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:702
CLM.L["Sealed"] = "Fermée"
-- ClassicLootManager/Modules/GUI/Filters.lua:208
CLM.L["Search for player names. Separate multiple with a comma ','. Minimum 3 characters. Overrides filtering."] = "Rechercher des noms de joueurs. Séparez les multiples par une virgule ','. 3 caractères minimum. Remplace le filtrage."
-- ClassicLootManager/Modules/GUI/Filters.lua:207
CLM.L["Search"] = "Chercher"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1295
CLM.L["Select DKP or EPGP point system."] = "Sélectionner un système de point : DKP ou EPGP"
-- ClassicLootManager_Integrations/GUI.lua:375
CLM.L["Select Profiles to export"] = "Sélectionnez les profils à exporter"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:422
CLM.L["Select Rosters to display"] = "Sélectionner les rosters à afficher"
-- ClassicLootManager_Integrations/GUI.lua:344
CLM.L["Select Rosters to export"] = "Sélectionnez les rosters à exporter"
-- ClassicLootManager/Modules/GUI/Filters.lua:179
CLM.L["Select all classes."] = "Sélectionnez toutes les classes."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:506
CLM.L["Select equation"] = "Sélectionner l'équation"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:23
CLM.L["Select logging level for troubleshooting"] = "Sélectionnez le niveau du journal pour le dépannage"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:196
CLM.L["Select loot rarity for the annoucement to raid."] = "Sélectionnez la rareté du butin annoncé au raid."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:410
CLM.L["Select loot rarity threshold to used to fill the auction list."] = "Sélectionnez le seuil de rareté de butin utilisé pour remplir la liste d'enchères"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:236
CLM.L["Select modifier combination for awarding."] = "Sélectionnez la combinaison de modificateurs pour l'attribution."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:419
CLM.L["Select modifier combination for filling auction from bags and corpse."] = "Sélectionnez la combinaison de modificateurs gouvernant le remplissage depuis les sacs et cadavre"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:133
CLM.L["Select roster to add profiles to."] = "Sélectionner le roster auquel ajouter des profils."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:163
CLM.L["Select roster to create raid for."] = "Sélectionner le roster pour lequel créer un raid."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:162
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:132
CLM.L["Select roster"] = "Sélectionner le roster"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:940
CLM.L["Select weekly reset timezone. EU: Wed 07:00 GMT or US: Tue 15:00 GMT"] = "Sélectionnez le fuseau horaire de réinitialisation hebdomadaire. UE : Mercredi 07h00 GMT ou États-Unis : Mar 15h00 GMT"
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:66
CLM.L["Select |cffeeee00%s|r encounter difficulty for bonus value award (%s)."] = "Sélectionner |cffeeee00%s|r difficulté de rencontre pour attribuer une valeur bonus (%s)"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:740
CLM.L["Selected"] = "Sélectionné"
-- ClassicLootManager_Integrations/GUI.lua:143
CLM.L["September"] = "Septembre"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:326
CLM.L["Serpentshrine Cavern"] = "Caverne du sanctuaire du Serpent"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:469
CLM.L["Set %s points to %s players for %s in <%s>"] = "Définir %s points sur %s joueurs pour %s dans <%s>"
-- ClassicLootManager_Integrations/GenericImport.lua:184
CLM.L["Set Profiles standings in Rosters"] = "Définir les points des profils dans les rosters"
-- ClassicLootManager_Integrations/Migration.lua:378
CLM.L["Set points for %s players for team to %s"] = "Définir des points pour %s joueurs pour l'équipe pour %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:184
CLM.L["Set raid name"] = "Définir le nom du raid"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:90
CLM.L["Shade of Akama"] = "Ombre d'Akama"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:70
CLM.L["Shade of Aran"] = "L'ombre d'Aran"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:117
CLM.L["Shadron"] = "Obscuron"
-- .:indirectly
CLM.L["Shaman"] = "Chaman"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:10
CLM.L["Shazzrah"] = "Shazzrah"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:791
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:824
CLM.L["Shield"] = "Bouclier"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:499
CLM.L["Shift + Alt"] = "Shift + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:502
CLM.L["Shift + Ctrl + Alt"] = "Shift + Ctrl + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:501
CLM.L["Shift + Ctrl"] = "Shift + Ctrl"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:496
CLM.L["Shift"] = "Shift"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:774
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:807
CLM.L["Shirt"] = "Chemise"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:773
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:806
CLM.L["Shoulder"] = "Épaule"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:219
CLM.L["Show Award window"] = "Fenêtre de récompense de spectacles"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:24
CLM.L["Silithid Royalty"] = "Bug Trio"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:154
CLM.L["Sindragosa"] = "Sindragosa"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:723
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:729
CLM.L["Single-Priced"] = "Prix unique"
-- ClassicLootManager_Integrations/Migration.lua:179
CLM.L["Skipping %s"] = "%s ignoré"
-- ClassicLootManager_Integrations/Migration.lua:255
CLM.L["Skipping CommunityDKP"] = "Ignorer CommunityDKP"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:512
CLM.L["Slot multipliers"] = "Multiplicateurs d'emplacement"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:360
CLM.L["Small value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Petite valeur pour les enchères par palier. \n\nRemplissez la même valeur que les autres paliers ou une valeur négative pour ignorer"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:878
CLM.L["Small"] = "Petit"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:143
CLM.L["Spec guild request"] = "Demande pour spé guilde"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:352
CLM.L["Spent"] = "Dépensé"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:811
CLM.L["Stale"] = "Périmé"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:138
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:148
CLM.L["Standby %s has been sent"] = "Veille %s a été envoyé"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:433
CLM.L["Standby Bonus"] = "Bonus d'attente"
-- ClassicLootManager/Modules/GUI/Filters.lua:77
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:298
CLM.L["Standby"] = "En attente"
-- ClassicLootManager_Integrations/GUI.lua:19
CLM.L["Standings"] = "Aperçu roster"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:384
CLM.L["Start selected raid"] = "Commencer le raid sélectionné"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:533
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:551
CLM.L["Start"] = "Début"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:508
CLM.L["Started raid %s"] = "Raid %s commencé"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:414
CLM.L["Statistics"] = "Statistiques"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:260
CLM.L["Status"] = "Status"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:533
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:551
CLM.L["Stop"] = "Stop"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:59
CLM.L["Store bids"] = "Sauvegarder les enchères"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:60
CLM.L["Store finished auction bids information."] = "Sauvegarder les informations d’enchères terminées."
-- ClassicLootManager_Integrations/ImportCSV.lua:118
-- ClassicLootManager_Integrations/GenericImport.lua:238
CLM.L["Success"] = "Succès"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:11
CLM.L["Sulfuron Harbinger"] = "Messager de Sulfuron"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:386
CLM.L["Sunwell Plateau"] = "Plateau du Puits de soleil"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:471
CLM.L["Suppress incoming whispers"] = "Supprimer les chuchotements entrants"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:480
CLM.L["Suppress outgoing whispers"] = "Supprimer les chuchotements sortants"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:79
CLM.L["Suppresses changelog display until new version is released"] = "Supprimer l'affichage du journal des modifications jusqu'à ce qu'une nouvelle version soit publiée"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:89
CLM.L["Supremus"] = "Supremus"
-- ClassicLootManager/MinimapIcon.lua:50
CLM.L["Sync ongoing"] = "Synchronisation en cours"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:643
CLM.L["TBC"] = "TBC"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:778
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:811
CLM.L["Tabard"] = "Tabard"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:155
CLM.L["Tank"] = "Tank"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1262
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:136
CLM.L["Tax"] = "Taxe"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:338
CLM.L["Tempest Keep"] = "Donjon de la Tempête"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:227
CLM.L["Temple of Ahn'Qiraj"] = "Ahn'Qiraj"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:118
CLM.L["Tenebron"] = "Tenebron"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:69
CLM.L["Terestian Illhoof"] = "Terestian Malsabot"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:91
CLM.L["Teron Gorefiend"] = "Teron Fielsang"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:38
CLM.L["Thaddius"] = "Thaddius"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:135
CLM.L["The Assembly of Iron"] = "Assemblée du fer"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:68
CLM.L["The Curator"] = "Le conservateur"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:432
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:549
CLM.L["The Eye of Eternity"] = "L'Oeil de l'Eternité"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:44
CLM.L["The Four Horsemen"] = "Coffre des quatre cavaliers"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:95
CLM.L["The Illidari Council"] = "Le conseil illidari"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:155
CLM.L["The Lich King"] = "Le Roi-Liche"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:79
CLM.L["The Lurker Below"] = "Le Rôdeur d'En bas"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:422
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:539
CLM.L["The Obsidian Sanctum"] = "Le Sanctum Obsidien"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:23
CLM.L["The Prophet Skeram"] = "Le Prophète Skeram"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:505
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:622
CLM.L["The Ruby Sanctum"] = "Sanctum rubis"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:136
CLM.L["Thorim"] = "Thorim"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:797
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:830
CLM.L["Thrown"] = "Arme de jet"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:536
CLM.L["Tier multipliers"] = "Multiplicateur de palier"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:725
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:730
CLM.L["Tiered"] = "Par niveau"
-- ClassicLootManager/MinimapIcon.lua:60
CLM.L["Time Traveling"] = "Voyager dans le temps"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1098
CLM.L["Time in seconds by which auction will be extended if bid is received during last 10 seconds."] = "Durée en secondes ajoutée à l’enchère si une offre est reçue au cours des 10 dernières secondes."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1082
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1106
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1107
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:655
CLM.L["Time"] = "Temps"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:733
CLM.L["Timetravel"] = "Timetravel"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:308
CLM.L["Toggle Auction History window display"] = "Activer l'affichage de la fenêtre Historique des enchères"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:733
CLM.L["Toggle Auctioning window display"] = "Activer l'affichage de la fenêtre d'enchères"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:145
CLM.L["Toggle Bidding auto-open"] = "Activer l'ouverture automatique des enchères"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:220
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1178
CLM.L["Toggle Bidding window display"] = "Activer l'affichage de la fenêtre d'enchères"
-- ClassicLootManager_Integrations/ImportCSV.lua:216
CLM.L["Toggle CSV import window display"] = "Activer l’affichage de la fenêtre d'importation CSV"
-- ClassicLootManager/MinimapIcon.lua:77
CLM.L["Toggle Minimap Icon"] = "Afficher l'icône de minimap"
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:282
CLM.L["Toggle Trade List window display"] = "Basculer l'affichage de la liste d'échange"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:163
CLM.L["Toggle advancing to next item on the list after bid."] = "Basculer le passage à l'objet suivant dans la liste après l'offre"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:146
CLM.L["Toggle auto open and auto close on auction start and stop"] = "Activer l'ouverture et la fermeture automatiques au début et à l'arrêt des enchères"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:46
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:158
CLM.L["Toggle changelog window display"] = "Activer l'affichage de la fenêtre du journal des modifications"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:45
CLM.L["Toggle changelog"] = "Activer le journal des modifications"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:155
CLM.L["Toggle closing bidding UI after submitting bid for all items."] = "Basculer la fermeture de l'interface après avoir soumis les offres pour tous les items"
-- ClassicLootManager_Integrations/GUI.lua:513
CLM.L["Toggle export window display"] = "Activer l’affichage de la fenêtre d'exportation"
-- ClassicLootManager_Integrations/GenericImport.lua:281
CLM.L["Toggle import window display"] = "Activer l’Affichage de la fenêtre d'importation"
-- ClassicLootManager/Modules/GUI/UnifiedGUI.lua:422
CLM.L["Toggle standings window display"] = "Activer l'affichage de la fenêtre de l’aperçu roster"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:194
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:202
CLM.L["Toggle test bar"] = "Basculer pour montrer un aperçu de la barre timer d'enchère"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:146
CLM.L["Toggles addon sounds."] = "Activer les sons de l'addon"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:178
CLM.L["Toggles loot announcement to raid"] = "Activer l'annonce de butin en raid"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:342
CLM.L["Toggles loot award announcement to guild"] = "Activer l'annonce de récompense de butin à la guilde"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:354
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:367
CLM.L["Too much data to display"] = "Trop de données à afficher "
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:124
CLM.L["Toravon the Ice Watcher"] = "Toravon la Sentinelle de glace"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:417
CLM.L["Total blocked"] = "Total bloqué"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:418
CLM.L["Total decayed"] = "Total de points réduits"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:416
CLM.L["Total received"] = "Total reçu"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:415
CLM.L["Total spent"] = "Total dépensé"
-- ClassicLootManager/MinimapIcon.lua:114
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:192
CLM.L["Trade List"] = "Liste d'échange"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:469
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:586
CLM.L["Trial of the Crusader"] = "Epreuve du Croisé"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:785
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:818
CLM.L["Trinket"] = "Bijou"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:37
CLM.L["True"] = "Vrai"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:29
CLM.L["Twin Emperors"] = "Les Empereurs jumeaux"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:251
CLM.L["Two different profiles exist for target GUID %s (%s:%s) and name %s (%s:%s). Verify and clean up profiles before updating."] = "Deux profils différents existent pour le GUID %s (%s:%s) et le nom %s (%s:%s). Vérifiez et nettoyez les profils avant de mettre à jour."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:790
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:823
CLM.L["Two-Hand"] = "Deux mains"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:656
CLM.L["Type"] = "Type"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:100
CLM.L["UI Scale"] = "Echelle d'interface"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:449
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:566
CLM.L["Ulduar"] = "Ulduar"
-- ClassicLootManager_Integrations/Migration.lua:48
CLM.L["Unable to execute migration. Entries already exist."] = "Impossible d'exécuter la migration. Les entrées existent déjà."
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:160
CLM.L["Unable to get item info from server. Please try auctioning again"] = "Impossible de récupérer les infos de l'objet depuis le serveur. Essayez de relancer l'enchère"
-- ClassicLootManager/Utils.lua:922
CLM.L["Uncommon"] = "Commun"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:434
CLM.L["Unexcused absence"] = "Absence injustifiée"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:44
CLM.L["Unknown roster %s"] = "Roster %s inconnu"
-- ClassicLootManager/MinimapIcon.lua:52
CLM.L["Unknown sync state"] = "État de synchronisation inconnu"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:284
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:340
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:170
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:240
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:172
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:34
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:335
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:464
CLM.L["Unknown"] = "Inconnu"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:308
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:87
CLM.L["Unlink Alt"] = "Dissocier Reroll"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:273
CLM.L["Unlock selected"] = "Déverrouiller Sélectionné"
-- ClassicLootManager_Integrations/Migration.lua:144
CLM.L["UpdatePoints(): Empty targets list"] = "Màj des Points(): Liste de cibles vide"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:515
CLM.L["Updated raid <%s> %s joined, %s left, %s benched, %s removed"] = "Raid <%s> mis à jour %s joueurs ont rejoint, %s joueurs sont partis, %s joueurs sur le banc, %s joueurs ont été supprimés"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1160
CLM.L["Use named buttons"] = "Utiliser les boutons nommés"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:16
CLM.L["Vaelastrasz the Corrupt"] = "Vaelastrasz le Corrompu"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:143
CLM.L["Val'kyr Twins"] = "Les jumelles Val'kyr"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:147
CLM.L["Valithria Dreamwalker"] = "Valithria Marcherêve"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:262
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:295
CLM.L["Value"] = "Valeur"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:439
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:556
CLM.L["Vault of Archavon"] = "Caveau d'Archavon"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:31
CLM.L["Verbose"] = "Détaillé"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:133
CLM.L["Version check in guild"] = "Vérification de la version dans la guilde"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:175
CLM.L["Version"] = "Version"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:119
CLM.L["Vesperon"] = "Vespéron"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:696
CLM.L["Vickrey"] = "Vickrey"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:27
CLM.L["Viscidus"] = "Viscidus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:85
CLM.L["Void Reaver"] = "Saccageur du Vide"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:781
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:814
CLM.L["Waist"] = "Taille"
-- .:indirectly
CLM.L["Warlock"] = "Démoniste"
-- .:indirectly
CLM.L["Warrior"] = "Guerrier"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:948
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:109
CLM.L["Weekly cap"] = "Plafond hebdomadaire"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:408
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:411
CLM.L["Weekly gains"] = "Gains hebdomadaires"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:939
CLM.L["Weekly reset timezone"] = "Timer de réinitialisation hebdomadaire"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:112
CLM.L["Weekly reset"] = "Réinitialisation hebdomadaire"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:187
CLM.L["When enabled, this will make loot announcement display only if you're Master Looter or Raid Leader (if there is no Master Looter)."] = "Quand activé, l'annonce du butin s’affichera uniquement si vous êtes Master Loot ou Raid Leader (s'il n'y a pas de Master Loot)."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1161
CLM.L["Will display names of the buttons instead of values in bidding UI"] = "Affichera les noms des boutons au lieu des valeurs dans l'interface d'enchères"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:204
CLM.L["Will hide bidding window if you enter combat and show it again when you exit. Will also delay auto opening if needed."] = "Masquera la fenêtre d'enchères si vous entrez au combat et affichez-la à nouveau lorsque vous quittez. Retardera également l'ouverture automatique si nécessaire."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:154
CLM.L["Wipe events"] = "Effacer les événements"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:39
CLM.L["Wipe"] = "Effacer"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:155
CLM.L["Wipes all events from memory. This will trigger resyncing from other users."] = "Efface tous les événements de la mémoire. Cela déclenchera la resynchronisation depuis les autres utilisateurs."
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:40
CLM.L["Wipes the log history"] = "Efface l'historique du journal"
-- ClassicLootManager_Integrations/Integrations.lua:356
CLM.L["WoW DKP Bot Integration"] = "Intégration WoW DKP Bot"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:648
CLM.L["WotLK - 10"] = "WotLK - 10"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:653
CLM.L["WotLK - 25"] = "WotLK - 25"
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:188
CLM.L["Wowpedia"] = "Wowpedia"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:779
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:812
CLM.L["Wrist"] = "Poignets"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:137
CLM.L["XT-002 Deconstructor"] = "Déconstructeur XT-002"
-- ClassicLootManager/Utils.lua:503
CLM.L["Yes"] = "Oui"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:138
CLM.L["Yogg-Saron"] = "Yogg-Saron"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:308
CLM.L["You are already in an active raid. Leave or finish it before creating new one."] = "Vous êtes déjà dans un raid actif. Quittez-le ou terminez-le avant d'en créer un nouveau."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:730
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:847
CLM.L["You are not allowed to auction items"] = "Vous n'êtes pas autorisé à mettre d’objets aux enchères"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:466
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:500
CLM.L["You are not allowed to control raid."] = "Vous n'êtes pas autorisé à contrôler un raid."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:304
CLM.L["You are not allowed to create raids."] = "Vous n'êtes pas autorisé à créer un raid."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:437
CLM.L["You are not allowed to join raid."] = "Vous n'êtes pas autorisé à rejoindre un raid."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:326
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:398
CLM.L["You are not allowed to start raid."] = "Vous n'êtes pas autorisé à démarrer un raid."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:339
CLM.L["You are not in the raid."] = "Vous n'êtes pas dans le raid."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:627
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:636
CLM.L["You can %s max %d players from standby at the same time to a %s raid."] = "Vous pouvez %s max %d joueurs en attente en même temps à un raid %s."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:582
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:591
CLM.L["You can %s max %d players to standby at the same time to a %s raid."] = "Vous pouvez %s max %d joueurs en attente en même temps à un raid %s."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:470
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:504
CLM.L["You can only add players to standby of a progressing raid."] = "Vous ne pouvez ajouter des joueurs en attente qu’à un raid en cours."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:573
CLM.L["You can only bench players from same roster as the raid (%s)."] = "Vous ne pouvez mettre sur le banc que des joueurs du même roster que le raid (%s)."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:402
CLM.L["You can only end an active raid."] = "Vous ne pouvez terminer qu'un raid actif."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:441
CLM.L["You can only join an active raid."] = "Vous ne pouvez rejoindre qu'un raid actif."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:445
CLM.L["You can only join different raid than your current one."] = "Vous ne pouvez rejoindre qu’un raid différent de celui que vous avez actuellement."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:618
CLM.L["You can only remove from bench players from same roster as the raid (%s)."] = "Vous ne pouvez retirer du banc que les joueurs du même roster que le raid (%s)."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:330
CLM.L["You can only start a freshly created raid."] = "Vous ne pouvez démarrer qu'un raid fraîchement créé."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:670
CLM.L["You can remove max %d players from roster at the same time."] = "Vous pouvez supprimer un maximum de %d joueurs du roster en même temps."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:336
CLM.L["Your bid (%s) was denied: |cffcc0000%s|r"] = "Votre enchère (%s) a été refusée : |cffcc0000%s|r"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:318
CLM.L["Your bid (%s) was |cff00cc00accepted|r"] = "Votre enchère (%s) a été |cff00cc00acceptée|r"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:64
CLM.L["Zero-Sum Bank Inflation"] = "Inflation de banque Zero-Sum"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1222
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:61
CLM.L["Zero-Sum Bank"] = "Banque Zero-Sum"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1230
CLM.L["Zero-Sum Inflation Value"] = "Valeur d'inflation Zero-Sum"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:437
CLM.L["Zero-Sum award"] = "Attribution Zero-Sum"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1216
CLM.L["Zero-Sum"] = "Zero-sum"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:374
CLM.L["Zul'Aman"] = "Zul'Aman"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:263
CLM.L["Zul'Gurub"] = "Zul'Gurub"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:107
CLM.L["Zul'jin"] = "Zul'jin"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:218
CLM.L["[All Roster Configs]: "] = "[Configurations de Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:224
CLM.L["[All Roster Default Slot Values]: "] = "[Toutes les valeurs d'emplacements par défaut de roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:202
CLM.L["[Alt-Main Link]: "] = "[Lien Reroll-Main]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:209
CLM.L["[Create Roster]: "] = "[Créer Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:212
CLM.L["[Delete Roster]: "] = "[Effacer Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:287
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:529
CLM.L["[IGNORE]: Ignoring entry"] = "[IGNORER] : Ignore l'entrée"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:271
CLM.L["[Item Award in Raid]: "] = "[Attribution d'objet en raid]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:268
CLM.L["[Item Award]: "] = "[Attribution d’objet]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:258
CLM.L["[Point Award to raid]: "] = "[Attribution de points au raid]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:255
CLM.L["[Point Award to roster]: "] = "[Attribution de points au Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:249
CLM.L["[Point Award]: "] = "[Attribution de points]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:261
CLM.L["[Point Decay for roster]: "] = "[Réduction de points pour le roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:252
CLM.L["[Point Decay]: "] = "[Réduction de points]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:264
CLM.L["[Point Set]: "] = "[Ensemble de points]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:205
CLM.L["[Profile Lock]: "] = "[Verrouiller le profil]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:275
CLM.L["[Raid Create]: "] = "[Créer le Raid]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:284
CLM.L["[Raid Finish]: "] = "[Terminer le Raid]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:278
CLM.L["[Raid Start]: "] = "[Débuter le Raid]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:281
CLM.L["[Raid Update]: "] = "[Mise à jour du raid]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:199
CLM.L["[Remove Profile]: "] = "[Supprimer le profil]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:215
CLM.L["[Rename Roster]: "] = "[Renommer le Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:242
CLM.L["[Roster Boss Kill Bonus]: "] = "[Bonus de boss tué pour le roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:221
CLM.L["[Roster Config]: "] = "[Configuration du Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:239
CLM.L["[Roster Copy]: "] = "[Copie du Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:227
CLM.L["[Roster Default Slot Value]: "] = "[Valeur d’emplacementpar défaut du roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:245
CLM.L["[Roster Field Rename]: "] = "[Renommer le champ du roster]:"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:233
CLM.L["[Roster Item Value Override Single]: "] = "[Remplacer la valeur d’un seul objet]"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:230
CLM.L["[Roster Item Value Override]: "] = "[Remplacement de la valeur d’objet]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:236
CLM.L["[Roster Update Profiles]: "] = "[Mettre à jour les profils du Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:196
CLM.L["[Update Profile]: "] = "[Mettre à jour le profil]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:405
CLM.L["[config] "] = "[Configuration] "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:407
CLM.L["[item values] "] = "[Valeurs de l'objet] "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:408
CLM.L["[profiles] "] = "[profils] "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:406
CLM.L["[slot defaults] "] = "[Emplacements par défaut] "
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:53
CLM.L["accepted"] = "Accepté"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:583
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:592
CLM.L["add"] = "ajouter"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:40
CLM.L["cancel"] = "annuler"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:592
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:637
CLM.L["created"] = "créé"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:53
CLM.L["denied"] = "refusé"
-- ClassicLootManager_Integrations/Integrations.lua:338
CLM.L["else"] = "sinon"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:462
CLM.L["excluding negatives "] = "à l'exclusion des négatifs"
-- ClassicLootManager_Integrations/Integrations.lua:273
CLM.L["if reason/response contains"] = "Si la raison/réponse contient"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:116
CLM.L["level"] = "niveau"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:42
CLM.L["pass"] = "passer"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:583
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:628
CLM.L["progressing"] = "en progression"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:119
CLM.L["rank"] = "rang"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:628
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:637
CLM.L["remove"] = "retirer"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:139
CLM.L["request"] = "demande"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:42
CLM.L["requested"] = "demandé"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:149
CLM.L["revoke"] = "révoquer"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:72
CLM.L["revoked"] = "révoqué"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:92
CLM.L["roster"] = "roster"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:92
CLM.L["rosters"] = "rosters"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:861
CLM.L["seconds"] = "secondes"
-- ClassicLootManager_Integrations/Integrations.lua:283
CLM.L["then"] = "alors"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:123
CLM.L["unguilded"] = "sans guilde"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1152
CLM.L["|cff00ee44Open:|r English Auction with highest bidder announcement. Highest bidder wins. Two players can not bid same value. Additionally always allows bidding base to accomodate for Swedish Auction flavor.\n\n|cff00ee44Anonymous Open:|r Same as Open but highest bidder name is not disclosed.\n\n|cff00ee44Sealed:|r Bids are not announced. Highest bidder wins.\n\n|cff00ee44Vickrey:|r Same as sealed but winner pays with second-highest bid."] = "|cff00ee44Ouverte:|r Enchère avec annonce de la plus haute offre. Le joueur avec la plus grosse offre remporte l’enchère. Deux joueurs ne peuvent pas proposer la même valeur d’offre.\n\n|cff00ee44Anonyme Ouverte:|r Pareil qu’Ouverte mais le nom du plus haut enchérisseur n’est pas révélé.\n\n|cff00ee44Fermée:|r Offresnon annoncées. L’offre la plus haute l’emporte.\n\n|cff00ee44Vickrey:|r Pareil que fermée mais le vainqueur paie avec la 2e offre la plus élevée."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1037
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1209
CLM.L["|cff00ee44Single-Priced:|r Static value mode. Only bidding Base value is supported.\n\n|cff00ee44Ascending:|r Ranged value mode. Allows bidding any value in |cff44ee00<base, max>|r.\n\n|cff00ee44Tiered:|r Ranged value mode. Allows bidding only specific values. Up to 5 tiers are configurable in |cff44ee00<base, small, medium, large, max>|r."] = "|cff00ee44Prix unique:|r Mode à valeur fixe. Seule la Valeur d’offre de base est supportée.n\n|cff00ee44Montante:|r Mode à intervalle de valeur. Permet d’offrir n’importe quelle valeur entre |cff44ee00<base, max>|r.\n\n|cff00ee44Par niveau:|r Mode à intervalle de valeur. Permet d’offrir uniquement des valeurs spécifiques. Jusqu’à 5 valeurs sont configurables dans |cff44ee00<base, petit, médium, grand, max>|r."
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:52
CLM.L["|cffcc0000Your Classic Loot Manager is significantly out of date.|r AddOn communication has been disabled. Version %s is available. Please update as soon as possible."] = "|cffcc0000Classic Loot Manager est obsolète.|r La communication de l’addon a été désactivée. La version %s est disponible. Veuillez mettre à jour dès que possible."
end