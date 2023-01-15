local _, CLM = ...
if GetLocale() == "frFR" then
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:326
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:332
CLM.L[" alt of: "] = " reroll de "
-- ClassicLootManager/Utils.lua:509
CLM.L[" more"] = " suite "
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:178
CLM.L[" over "] = " plus de "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:399
CLM.L[" profile(s)"] = " profil(s)"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:34
CLM.L["!bid"] = "!bid"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:35
CLM.L["!bidos"] = "!bidos"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:63
CLM.L["!dkp"] = "!dkp"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:269
CLM.L["% that will be decayed."] = "% qui sera réduit"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:343
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:362
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:420
CLM.L["%Y/%m/%d %H:%M:%S (%A)"] = "%d/%m/%Y %H:%M:%S (%A)"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:250
-- ClassicLootManager_Integrations/Models/Exporter.lua:317
-- ClassicLootManager_Integrations/Models/Exporter.lua:318
CLM.L["%Y/%m/%d %a %H:%M:%S"] = "%a %d/%m/%Y %H:%M:%S"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:594
CLM.L["%d/%m/%Y %H:%M:%S"] = "%d/%m/%Y %H:%M:%S"
-- ClassicLootManager_Alerts/Alerts.lua:15
CLM.L["%s %% %s decay"] = "%s %% %s Réduction"
-- ClassicLootManager_Alerts/Alerts.lua:12
CLM.L["%s %s"] = "%s %s"
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:142
CLM.L["%s awarded to %s for %s %s"] = "%s attribué à %s pour %s %s"
-- ClassicLootManager/MinimapIcon.lua:37
CLM.L["%s events (%s pending)"] = "%s événements (%s en attente)"
-- ClassicLootManager/MinimapIcon.lua:39
CLM.L["%s events (0x%x)"] = "%s événements (0x%x)"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:40
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:70
CLM.L["%s has %s standby"] = "%s a %s en veille"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:107
CLM.L["%s profile exists."] = "%s Profil existant."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:109
CLM.L["%s profile missing. Adding."] = "%s profil manquant. Ajouter."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:483
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:493
CLM.L["%s to %s for %s in <%s>"] = "%s à %s pour %s dans <%s>"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:115
CLM.L["%s was not found in guild."] = "%s introuvable dans la guilde."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:92
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:92
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:93
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
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:96
CLM.L["<CLM> %s not present in any roster."] = "<CLM> %s n'est présent dans aucun roster."
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:98
CLM.L["<CLM> %s standings in %d %s:"] = "<CLM> %s Classé dans %d %s:"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:107
CLM.L["<CLM> %s: %d DKP (%d this week)."] = "<CLM> %s: %d DKP (%d cette semaine)."
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:77
CLM.L["<CLM> Missing profile for player %s."] = "<CLM> Profil manquant pour le joueur %s."
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:57
CLM.L["<CLM> Your bid (%s) was %s%s."] = "<CLM> Ton enchère (%s) est %s%s."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:145
CLM.L["Action context"] = "Contexte de l'action"
-- ClassicLootManager_Integrations/Integrations.lua:161
CLM.L["Action to take upon Gargul loot award event happening during raid."] = "Action à effectuer lorsqu'un event Gargul d'attribution de loot eu lieu en raid."
-- ClassicLootManager_Integrations/Integrations.lua:266
CLM.L["Action to take upon RCLC loot award event happening during raid. Trigger is based on RCLC award reason or player response if reason is not used. On Integration Enable the buttons will be prefilled with existing ones."] = "Action à effectuer lors de l'attribution d'objets RCLC en raid. Le déclencheur est basé sur la raison d'attribution RCLC ou sur la réponse du joueur si pas de raison. Si l'intégration est activée, le label des boutons sera pré-rempli."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:124
CLM.L["Add currently selected target to list."] = "ajouter la cible actuellement sélectionnée au roster."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:123
CLM.L["Add target"] = "Ajouter cible"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:144
CLM.L["Add to roster"] = "Ajouter au Roster"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:567
CLM.L["Add to standby"] = "Ajouter en veille"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:399
CLM.L["Add"] = "Ajouté"
-- ClassicLootManager_Integrations/Migration.lua:368
CLM.L["Adding %s loot entries for team to %s"] = "Ajout de %s entrées de butin pour l'équipe à %s"
-- ClassicLootManager_Integrations/Migration.lua:227
-- ClassicLootManager_Integrations/Migration.lua:346
CLM.L["Adding %s profiles to %s"] = "Ajout %s profils à %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:944
CLM.L["Adding missing %s players to current roster"] = "Ajout de %s joueurs manquants au roster actuel"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1189
CLM.L["Additional cost (tax) to add to the award value."] = "Coût supplémentaire (taxe) à ajouter à la valeur de la récompense."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1157
CLM.L["Additional points to be given to players atop of the split value."] = "Points supplémentaires à attribuer aux joueurs en plus de la valeur partagée."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:146
CLM.L["Addon sounds"] = "Sons de l'addon"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:145
CLM.L["Adds selected players to the selected roster (from dropdown)."] = "Ajoute les joueurs sélectionnés au roster sélectionné depuis la liste déroulante."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:86
--CLM.L["Advance to next item after bid"] = ""
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:266
CLM.L["Affected players:"] = "Joueurs concernés:"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:102
CLM.L["Akil'zon"] = "Akil'zon"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:84
CLM.L["Al'ar"] = "Al'ar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:125
CLM.L["Algalon the Observer"] = "Algalon l'observateur"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:291
CLM.L["All In"] = "Offre max"
-- ClassicLootManager_Integrations/Migration.lua:29
CLM.L["All migration entries were commited and executed. Congratulations!"] = "Toutes les entrées de migration ont été validées et exécutées. Toutes nos félicitations!"
-- ClassicLootManager/Modules/GUI/Filters.lua:182
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:23
CLM.L["All"] = "Tout"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:79
CLM.L["Allow bidding below minimum points"] = "Permettre d'enchérir en-dessous du minimum de points"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1166
CLM.L["Allow biding more than current standings and ending up with less than minimum standings."] = "Autoriser d'enchérir plus que son capital actuel et terminer avec un capital inférieur au minimum"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1165
CLM.L["Allow biding more than current standings"] = "Permettre de placer une offre supérieure au points actuellement détenus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1024
CLM.L["Allow equal bids"] = "Autoriser les offres à valeur égale"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:76
CLM.L["Allow going below minimum points"] = "Permettre d'aller en-dessous du minimum de points"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:916
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:157
CLM.L["Allow players to subscribe to the bench through Raids menu"] = "Autoriser les joueurs à se placer sur le banc via le menu Raids"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:915
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:156
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:136
CLM.L["Allow subscription"] = "Autoriser l'abonnement"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:456
CLM.L["Alt"] = "Alt"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1016
CLM.L["Always allow All-In bids"] = "Toujours autoriser les offres all-in"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1008
CLM.L["Always allow Base bids"] = "Toujours autoriser les offres à valeur de base"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1032
CLM.L["Always allow cancel/pass"] = "Toujours autoriser à passer ou annuler"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:798
CLM.L["Americas"] = "Amériques"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:747
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:780
CLM.L["Ammo"] = "Munitions"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:98
CLM.L["Anetheron"] = "Anetheron"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:268
CLM.L["Announce award to Guild"] = "Annoncer la récompense à la guilde"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:168
CLM.L["Announce loot from corpse to Raid"] = "Annoncer le butin ramassé au raid"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:164
CLM.L["Announce loot"] = "Annoncer le butin"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:186
CLM.L["Announcement loot rarity"] = "Annonce de la rareté du butin"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:646
CLM.L["Anonymous Open"] = "Anonyme Ouvert"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1064
CLM.L["Anti-snipe time"] = "Temps anti-snipe"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:642
CLM.L["Anti-snipe time: %s."] = "Temps anti-snipe : %s."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:237
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:73
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:491
CLM.L["Anti-snipe"] = "Anti-snipe"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:32
CLM.L["Anub'Rekhan"] = "Anub'Rekhan"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:139
CLM.L["Anub'arak"] = "Anub'arak"
-- ClassicLootManager/Tooltips.lua:37
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:69
CLM.L["Any"] = "Tout"
-- ClassicLootManager_Integrations/GUI.lua:143
CLM.L["April"] = "Avril"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:121
CLM.L["Archavon the Stone Watcher"] = "Archavon le Gardien des pierres"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:101
CLM.L["Archimonde"] = "Archimonde"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:164
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:321
CLM.L["Are you sure, you want to award %s to %s for %s %s?"] = "Êtes-vous sûr de vouloir attribuer %s à %s pour %s %s ?"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:673
CLM.L["Ascending"] = "Ascendant"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:226
CLM.L["Assistant"] = "Assistant"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:359
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:370
CLM.L["Att. [%]"] = "Prés. [%]"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:372
CLM.L["Attendance"] = "Présence"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:64
CLM.L["Attumen the Huntsman"] = "Attumen le Veneur"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:225
CLM.L["Auction End Countdown"] = "Compte à rebours de fin d'enchères"
-- ClassicLootManager/MinimapIcon.lua:109
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:219
CLM.L["Auction History"] = "Historique de l'enchère"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:209
CLM.L["Auction Start/End"] = "Début/Fin de l'enchère"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:236
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:70
CLM.L["Auction Time"] = "Temps de l'enchère"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:58
CLM.L["Auction Type"] = "Type d'enchère"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:555
CLM.L["Auction complete"] = "Enchère terminée"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:284
CLM.L["Auction finished"] = "Enchère terminée"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1056
CLM.L["Auction length in seconds."] = "Durée de l'enchère en secondes."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1055
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:481
CLM.L["Auction length"] = "Durée de l'enchère"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:265
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:634
CLM.L["Auction of %s items."] = "Enchères de % items"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:268
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:636
CLM.L["Auction of %s"] = "Enchère de %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:974
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:468
CLM.L["Auction settings"] = "Configuration des enchères"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:546
CLM.L["Auction stopped by Master Looter"] = "Enchères arrêtées par le maître du butin"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:640
CLM.L["Auction time: %s."] = "Temps de l'enchère: %s."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1126
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1198
CLM.L["Auction type"] = "Type d'enchère"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:374
CLM.L["Auctioning - Chat Commands"] = "Enchères - Commandes de chat"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:60
CLM.L["Auctioning - History"] = "Vente aux enchères - Historique"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:296
CLM.L["Auctioning - List Filling"] = "Enchères - Remplissage de liste"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:520
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:528
CLM.L["Auctioning requires active raid or roster mode."] = "Les enchères nécessite un raid actif ou le mode roster"
-- ClassicLootManager/MinimapIcon.lua:104
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:634
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:264
CLM.L["Auctioning"] = "Vente aux enchères"
-- ClassicLootManager_Integrations/GUI.lua:147
CLM.L["August"] = "Aout"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:126
CLM.L["Auriaya"] = "Auriaya"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:661
CLM.L["Author"] = "Auteur"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:923
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:148
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:124
CLM.L["Auto bench leavers"] = "Automatiquement mettre sur le banc les sortants"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:277
CLM.L["Auto-assign from corpse"] = "Assignation automatique depuis le cadavre"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:286
CLM.L["Auto-trade after award"] = "Echange automatique après attribution"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:394
CLM.L["Average weeks"] = "Semaines moyennes"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:241
CLM.L["Award %s points to %s selected players."] = "Attribuer %s points aux %s joueurs sélectionnés."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:235
CLM.L["Award %s points to everyone in raid."] = "Attribuer %s points à tous les membres du raid."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:237
CLM.L["Award %s points to everyone in roster."] = "Attribuer %s points à tout le roster."
-- ClassicLootManager_Integrations/Integrations.lua:650
CLM.L["Award for Base"] = "Récompense de base"
-- ClassicLootManager_Integrations/Integrations.lua:649
CLM.L["Award for Free"] = "Récompense gratuite"
-- ClassicLootManager_Integrations/Integrations.lua:653
CLM.L["Award for Large"] = "Récompense grande"
-- ClassicLootManager_Integrations/Integrations.lua:654
CLM.L["Award for Max"] = "Récompense Max"
-- ClassicLootManager_Integrations/Integrations.lua:652
CLM.L["Award for Medium"] = "Récompense médium"
-- ClassicLootManager_Integrations/Integrations.lua:651
CLM.L["Award for Small"] = "Récompense petite"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:859
CLM.L["Award points only to online players"] = "Attribuer des points uniquement aux joueurs en ligne"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:868
CLM.L["Award points only to players in same zone"] = "Attribuer des points uniquement aux joueurs dans la même zone"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:189
CLM.L["Award points to players based on context."] = "Attribuer des points aux joueurs en fonction du contexte."
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:136
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:178
CLM.L["Award value"] = "Valeur attribuée"
-- ClassicLootManager/MinimapIcon.lua:118
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:145
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:194
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:231
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:188
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:306
CLM.L["Award"] = "Récompense"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:281
CLM.L["Award:"] = "Attribuer"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:456
CLM.L["Awarded %s points for %s to all players in raid %s"] = "Attribution de %s points pour %s à tous les joueurs du raid %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:432
CLM.L["Awarded %s points to %s players for %s in <%s>"] = "Attribution de %s points à %s joueurs pour %s dans <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:448
CLM.L["Awarded %s points to all players for %s in <%s>"] = "Attribution de %s points à tous les joueurs pour %s dans <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:221
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:287
CLM.L["Awarded by"] = "Attribué par"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:62
CLM.L["Ayamiss the Hunter"] = "Ayamiss le Chasseur"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:100
CLM.L["Azgalor"] = "Azgalor"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:726
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:759
CLM.L["Back"] = "Dos"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:746
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:779
CLM.L["Bag"] = "Sac"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:156
CLM.L["Baltharus the Warborn"] = "Baltharus l'Enfant de la guerre"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:9
CLM.L["Baron Geddon"] = "Baron Geddon"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:353
CLM.L["Base value for Static-Priced auction.\nMinimum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Valeur de base pour les enchères à prix fixe. \nValeur minimum pour les enchères montantes et par palier.\n\nRemplissez la même valeur que les autres paliers ou une valeur négative pour ignorer"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:828
CLM.L["Base"] = "Base"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:25
CLM.L["Battleguard Sartura"] = "Garde de guerre Sartura"
-- ClassicLootManager_Integrations/GUI.lua:321
-- ClassicLootManager_Integrations/GUI.lua:328
-- ClassicLootManager_Integrations/GUI.lua:335
CLM.L["Begin %d days ago, finish today."] = "Début il y a %d jours, fin aujourd'hui."
-- ClassicLootManager_Integrations/GUI.lua:254
CLM.L["Begin Day"] = "Jour de début"
-- ClassicLootManager_Integrations/GUI.lua:265
CLM.L["Begin Month"] = "Mois de début"
-- ClassicLootManager_Integrations/GUI.lua:276
CLM.L["Begin Year"] = "Année de début"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:931
CLM.L["Bench multiplier"] = "Multiplicateur du banc"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:909
CLM.L["Bench"] = "Banc"
-- ClassicLootManager_Alerts/Alerts.lua:25
CLM.L["Bid %s accepted!"] = "Enchère %s acceptée !"
-- ClassicLootManager_Alerts/Alerts.lua:33
CLM.L["Bid %s denied!"] = "Enchère %s refusée !"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:719
CLM.L["Bid accepted!"] = "Enchère acceptée !"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1033
CLM.L["Bid cancelling not allowed"] = "Annulation d'enchère non autorisée"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:723
CLM.L["Bid denied!"] = "Enchère refusée !"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1031
CLM.L["Bid increment too low"] = "Incrémentation d'enchère trop basse"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:182
CLM.L["Bid input values as Main spec bid."] = "Entrer une offre pour une enchère de Main Spec"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:196
CLM.L["Bid input values as Off spec bid."] = "Entrer une pour une enchère d'Off Spec"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1029
CLM.L["Bid too high"] = "Enchère trop élevée"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1028
CLM.L["Bid too low"] = "Enchère trop basse"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:292
CLM.L["Bid your current DKP (%s)."] = "Enchérissez tous vos DKP actuels (%s)."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:181
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:557
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:397
CLM.L["Bid"] = "Offre d'achat"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1027
CLM.L["Bidding over current standings not allowed"] = "Vous ne pouvez pas faire d’offre supérieure à votre montant actuel de points"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1026
CLM.L["Bidding while below minimum standings not allowed"] = "Vous ne pouvez pas faire d’offre quand vous êtes sous le minimum de points"
-- ClassicLootManager/MinimapIcon.lua:114
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:994
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:75
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:101
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:665
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:882
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:938
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:516
CLM.L["Bidding"] = "Enchère"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:241
CLM.L["Bids"] = "Enchères"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:122
CLM.L["Bindings"] = "Raccourcis clavier"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:348
CLM.L["Black Temple"] = "Temple noir"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:213
CLM.L["Blackwing Lair"] = "Repaire de l'Aile noire"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:144
CLM.L["Blood Council"] = "Conseil des princes de sang"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:53
CLM.L["Bloodlord Mandokir"] = "Seigneur sanglant Mandokir"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:775
CLM.L["Bonuses"] = "Bonus"
-- ClassicLootManager/ClassicLootManager.lua:225
CLM.L["Boot complete"] = "Démarrage terminé"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:432
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:781
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:80
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:238
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:82
CLM.L["Boss Kill Bonus"] = "Bonus par boss tué"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1093
CLM.L["Boss kill award values"] = "Valeurs de récompense par boss tué"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:17
CLM.L["Broodlord Lashlayer"] = "Seigneur des couvées Lanistaire"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:109
CLM.L["Brutallus"] = "Brutallus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:61
CLM.L["Buru the Gorger"] = "Buru Grandgosier"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:940
CLM.L["Button Names"] = "Noms des boutons"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:31
CLM.L["C'Thun"] = "C'Thun"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:712
--CLM.L["Can't use"] = ""
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:229
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:392
CLM.L["Cancel your bid."] = "Annulez votre offre."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:310
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:330
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:417
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:228
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:391
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:716
CLM.L["Cancel"] = "Annuler"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:700
CLM.L["Change roster name."] = "Changer le nom du Roster."
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:15
CLM.L["Changelog"] = "Journal des modifications"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1037
CLM.L["Changing bid from Main-spec to Off-Spec not allowed"] = "Changer une offre depuis mainspec vers offspec non autorisé"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:73
CLM.L["Channel for posting bids."] = "Canal où annoncer les enchères."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:217
CLM.L["Chat Commands"] = "Commandes de discussion"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:62
CLM.L["Chat bidding is currently disabled."] = "Offres d'enchères par chat désactivées"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:72
CLM.L["Chess Event"] = "Chess Event"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:728
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:761
CLM.L["Chest (robes)"] = "Torse (robes)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:727
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:760
CLM.L["Chest"] = "Torse"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:21
CLM.L["Chromaggus"] = "Chromaggus"
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:263
CLM.L["Classic Loot Manager %s initialization complete. %s"] = "Classic Loot Manager %s initialisation terminée. %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI.lua:270
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:15
CLM.L["Classic Loot Manager"] = "Classic Loot Manager"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:616
CLM.L["Classic"] = "Classic"
-- ClassicLootManager/Modules/GUI/Filters.lua:196
CLM.L["Clear all classes."] = "Effacer toutes les classes."
-- ClassicLootManager_Integrations/GUI.lua:479
CLM.L["Clear output"] = "Effacer la sortie"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:254
CLM.L["Clear"] = "Effacer"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:78
CLM.L["Close on bid"] = "Fermer après l'offre"
-- ClassicLootManager/Utils.lua:892
CLM.L["Common"] = "Commun"
-- ClassicLootManager/MinimapIcon.lua:133
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:311
-- ClassicLootManager_Integrations/GUI.lua:23
CLM.L["Configuration"] = "Configuration"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:736
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:744
CLM.L["Copy settings from selected roster."] = "Copier les paramètres du roster sélectionné."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:729
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:735
CLM.L["Copy settings"] = "Copier les paramètres"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:743
CLM.L["Copy source"] = "Copier la source"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:437
CLM.L["Correcting error"] = "Correction d'erreur"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:196
CLM.L["Create new raid with provided name. You will automatically join this raid and leave any other you are part of."] = "Créez un nouveau raid avec le nom fourni. Vous rejoindrez automatiquement ce raid et quitterez tout autre dont vous faites partie."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:503
CLM.L["Create raid %s %s in <%s>"] = "Créer raid %s %s dans <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:195
CLM.L["Create raid"] = "Créer raid"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1212
-- ClassicLootManager_Integrations/Integrations.lua:252
CLM.L["Create"] = "Créer"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:793
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:263
CLM.L["Created"] = "Créé"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1213
CLM.L["Creates new roster with default configuration"] = "Crée un nouveau roster avec la configuration par défaut"
-- ClassicLootManager_Integrations/Integrations.lua:253
CLM.L["Creates new trigger to be used during RCLC award."] = "Crée un nouveau déclencheur utilisé lors de l'attribution RCLC."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:458
CLM.L["Ctrl + Alt"] = "Ctrl + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:455
CLM.L["Ctrl"] = "Ctrl"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:566
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:882
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:406
CLM.L["Current"] = "Actuel"
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
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:878
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:325
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:861
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:191
-- ClassicLootManager_Alerts/Alerts.lua:14
CLM.L["DKP"] = "DKP"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:157
CLM.L["DPS"] = "DPS"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:250
CLM.L["Danger Zone - Use at own risk"] = "Zone de danger - Utilisation à vos risques et périls"
-- ClassicLootManager_Integrations/GUI.lua:227
CLM.L["Data"] = "Donnés"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:177
CLM.L["Date"] = "Date"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:145
CLM.L["Deathbringer Saurfang"] = "Porte-mort Saurcroc"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:268
CLM.L["Decay %"] = "Réduction %"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:330
CLM.L["Decay %s%% points to %s selected players."] = "Réduction de %s%% points aux %s joueurs sélectionnés."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:326
CLM.L["Decay %s%% points to everyone in roster."] = "Réduction de %s%%  points à tout le roster."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:278
CLM.L["Decay Negatives"] = "La réduction impacte les points négatifs"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:443
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:292
CLM.L["Decay"] = "Réduction"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:440
CLM.L["Decayed %s%% points to %s players in <%s>"] = "Réduction de %s%% points pour %s joueurs dans <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:464
CLM.L["Decayed %s%% points to all players %s in <%s>"] = "Réduction de %s%% points pour tous les joueurs %s dans <%s>"
-- ClassicLootManager_Integrations/GUI.lua:151
CLM.L["December"] = "Décembre"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:788
CLM.L["Default Boss Kill Bonus Value"] = "Valeur par défaut du bonus de Boss tué"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:85
CLM.L["Default Boss Kill Bonus value"] = "Valeur par défaut du bonus de Boss tué"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1075
CLM.L["Default slot values"] = "Valeurs d'emplacement par défaut"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:660
CLM.L["Description"] = "Description"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:268
CLM.L["Disable data synchronisation"] = "Désactiver la synchronisation des données"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:269
CLM.L["Disable data synchronisation. This might lead to unexpected consequences. Use this at your own risk. Requires /reload to apply."] = "Désactiver la synchro des données. Peut entraîner des conséquences inattendues. Utilisez à vos risques et périls. Nécessite /reload pour appliquer."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:453
CLM.L["Disable"] = "Désactiver"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:39
CLM.L["Disables display of the changelog for any new version."] = "Désactiver l'affichage du changelog pour toute nouvelle version."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:259
CLM.L["Display price"] = "Prix affiché"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:80
CLM.L["Do not show again"] = "Ne pas montrer à nouveau"
-- .:indirectly
CLM.L["Druid"] = "Druide"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:987
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1081
CLM.L["Dynamic Item values"] = "Valeur d'objet dynamique"
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
CLM.L["ERROR - invalid import data"] = "Erreur - données d'importation non valides"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:19
CLM.L["Ebonroc"] = "Rochébène"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:56
CLM.L["Edge of Madness"] = "Frontière de la folie"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:122
CLM.L["Emalon the Storm Watcher"] = "Emalon le Guetteur d'orage"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:379
CLM.L["Enable !dkp and !bid through whisper / raid. Change requires /reload."] = "Activez !dkp et !bid via chuchotement / raid. Le changement nécessite /reload."
-- ClassicLootManager_Integrations/Integrations.lua:124
CLM.L["Enable Gargul integration. This will allow Gargul to take control over some aspects of CLM (starting auction from Gargul, and awarding)."] = "Activer l'intégration de Gargul. Permettra à Gargul de prendre le contrôle de certains aspects de CLM (Démarrer les enchères et attributions via Gargul)."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1001
CLM.L["Enable OS bids"] = "Activer les offres OS"
-- ClassicLootManager_Integrations/Integrations.lua:239
CLM.L["Enable RCLC integration. This will allow awarding DKP/GP points on RCLC item award. Requires /reload."] = "Activer l'intégration RCLC. Cela permet de donner des DKP/GP via l'attribution d'objets RCLC. Nécessite /reload."
-- ClassicLootManager_Integrations/Integrations.lua:362
CLM.L["Enable WoW DKP Bot Integration. This will result in additional data stored upon logout."] = "Activez l'intégration de WoW DKP Bot. Cela entraînera le stockage de données supplémentaires lors de la déconnexion."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:210
CLM.L["Enable announcing auction start and end."] = "Activer l'annonce de début et fin des enchères."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:89
CLM.L["Enable auto-update bid values when current highest bid changes (open auction only)."] = "Activer la mise à jour automatique des valeurs d'enchères lorsque l'enchère actuelle la plus élevée change (enchère ouverte uniquement)."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:88
CLM.L["Enable auto-update bid values"] = "Activer la mise à jour automatique des valeurs d'enchère"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:378
CLM.L["Enable chat commands"] = "Activer les commandes de chat"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:278
CLM.L["Enable loot auto-assign (Master Looter UI) from corpse when item is awarded"] = "Active l'assignation automatique du butin (Interface du maitre du butin) depuis le cadavre lorsque l'item est attribué"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1149
CLM.L["Enable paid value splitting amongst raiders."] = "Activez la répartition de la valeur payée entre les raiders."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1009
CLM.L["Enable to allow base bids even if higher bids are present if player didn't bid yet. Affects Open-Ascending Auction."] = "Activer pour autoriser les joueurs n'ayant pas encore fait d'offre à poster des offres à valeur de base même si des offres plus hautes existent déjà"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1025
CLM.L["Enable to allow equal bids. Affects Open-Ascending Auction."] = "Activer pour autoriser les offres à valeur égale. Affecte les enchères ouvertes ascendantes"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1017
CLM.L["Enable to always allow All-In bids. Affects Open-Ascending Auction."] = "Activer pour toujours autoriser les offres all-in. Affecte les enchères ouvertes ascendantes"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1033
CLM.L["Enable to always allow cancelling or passing bids. Affects Open-Ascending Auction."] = "Activer pour toujours autoriser à passer/annuler. Affecte els enchères ouvertes ascendantes"
-- ClassicLootManager/MinimapIcon.lua:78
CLM.L["Enables / disables minimap Icon"] = "Active/désactive l'icône de minimap"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:34
CLM.L["Enables / disables verbose data printing during logging"] = "Active/désactive l'impression de données détaillées dans les logs"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:218
CLM.L["Enables announcing chat commands at auction start."] = "Permet d'annoncer les commandes de discussion au début de l'enchère."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:234
CLM.L["Enables announcing loot awards."] = "Active l'annonce des récompenses de butin."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:242
CLM.L["Enables announcing new highest bid (when applicable)."] = "Active l'annonce de la nouvelle offre la plus élevée (le cas échéant)."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:201
CLM.L["Enables announcing raid start and end."] = "Active l'annonce de début et fin du raid."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:287
CLM.L["Enables auto-trade awarded loot after auctioning from bag"] = "Active l'échange automatique du butin après la vente aux enchères depuis l’inventaire"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:260
CLM.L["Enables displaying item price on tooltip."] = "Active l'affichage du prix en infobulle"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:226
CLM.L["Enables raid-warning countdown for auctions."] = "Active le compte à rebours en avertissement de raid pour les enchères."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:747
CLM.L["End Timetravel"] = "Mettre fin au Timetravel"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:400
CLM.L["End selected raid"] = "Mettre fin au raid sélectionné"
-- ClassicLootManager/Utils.lua:895
CLM.L["Epic"] = "Épique"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:455
CLM.L["Equation"] = "Equation"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:111
CLM.L["Eredar Twins"] = "Jumelles érédars"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:797
CLM.L["Europe"] = "Europe"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:293
CLM.L["Execute decay for players based on context."] = "Appliquer la réduction aux joueurs en fonction du contexte"
-- ClassicLootManager_Integrations/Migration.lua:432
CLM.L["Execute migration from MonolithDKP, EssentialDKP, CommunityDKP, BastionLoot or CEPGP"] = "Exécuter la migration depuis MonolithDKP, EssentialDKP, CommunityDKP, BastionLoot ou CEPGP"
-- ClassicLootManager_Integrations/Migration.lua:52
CLM.L["Executing Addon Migration with comms disabled."] = "Exécution de la migration des modules complémentaires avec les communications désactivées."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:479
CLM.L["Exponent / Base"] = "Exposant / base"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:474
CLM.L["Exponential scaling value used by the equations (Base for EPGPWeb, or Exponent for WoWpedia)"] = "Valeur de mise à l'échelle exponentielle utilisée par les équations (base pour epgpweb, ou exposant pour wowpedia)"
-- ClassicLootManager/MinimapIcon.lua:127
-- ClassicLootManager_Integrations/GUI.lua:403
-- ClassicLootManager_Integrations/GUI.lua:412
-- ClassicLootManager_Integrations/GUI.lua:489
-- ClassicLootManager_Integrations/GUI.lua:490
CLM.L["Export"] = "Exporter"
-- ClassicLootManager/Modules/GUI/Filters.lua:83
CLM.L["External"] = "Externe"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:140
CLM.L["Faction Champions"] = "Champions de faction"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:40
CLM.L["False"] = "Faux"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:26
CLM.L["Fankriss the Unyielding"] = "Fankriss l'Inflexible"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:81
CLM.L["Fathom-Lord Karathress"] = "Seigneur des fonds Karathress"
-- ClassicLootManager_Integrations/GUI.lua:141
CLM.L["February"] = "Février"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:734
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:767
CLM.L["Feet"] = "Pieds"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:110
CLM.L["Felmyst"] = "Gangrebrume"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:146
CLM.L["Festergut"] = "Pulentraille"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:300
CLM.L["Fill auction list from corpse"] = "Remplir la liste d'enchère depuis le cadavre"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:301
CLM.L["Fill auction list with items from corpse. Will happen only if you open the corpse loot window."] = "Remplir la liste d'enchère avec les items présents sur le cadavre. Se produira seulement si vous ouvrez la fenêtre de butin du cadavre"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:318
CLM.L["Fill auction list with looted items"] = "Remplir la liste d'enchères avec les items"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:319
CLM.L["Fill auction list with looted items. This will automatically add all items you have received."] = "Remplir la liste d'enchères avec les items. Ajoutera automatiquement tous les items que vous avez reçu"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:99
CLM.L["Fill from Guild"] = "Remplir depuis la guilde"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:111
CLM.L["Fill from Raid Roster"] = "Remplir à partir du groupe de raid"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:310
CLM.L["Fill from corpse only if you are the Loot Master."] = "Remplir depuis le cadavre uniquement si vous êtes maitre du butin"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:328
CLM.L["Fill from loot only if you are using Group Loot."] = "Remplir depuis le butin uniquement si vous utilisez le butin de groupe"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:112
CLM.L["Fill profile list with players in current raid roster."] = "Remplir la liste de profils avec les joueurs dans le groupe de raid."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:100
CLM.L["Fill profile list with players with the minimum level and ranks."] = "Remplir la liste de profils avec les joueurs ayant le niveau et les rangs minimum."
-- ClassicLootManager/Modules/GUI/Filters.lua:167
CLM.L["Filter"] = "Filtre"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:735
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:768
CLM.L["Finger"] = "Doigt"
-- ClassicLootManager_Integrations/GUI.lua:287
CLM.L["Finish Day"] = "Jour de fin"
-- ClassicLootManager_Integrations/GUI.lua:298
CLM.L["Finish Month"] = "Mois de fin"
-- ClassicLootManager_Integrations/GUI.lua:309
CLM.L["Finish Year"] = "Année de fin"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:527
CLM.L["Finished raid %s"] = "Raid %s terminé"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:795
CLM.L["Finished"] = "Terminé"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:18
CLM.L["Firemaw"] = "Gueule-de-feu"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:127
CLM.L["Flame Leviathan"] = "Léviathan des flammes"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:20
CLM.L["Flamegor"] = "Flamegor"
-- ClassicLootManager_Integrations/GUI.lua:238
CLM.L["Format"] = "Format"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:104
CLM.L["Found %s in guild."] = "Trouvé %s dans la guilde."
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
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:325
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:861
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:191
CLM.L["GP"] = "GP"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:57
CLM.L["Gahz'ranka"] = "Gahz'ranka"
-- ClassicLootManager_Integrations/Integrations.lua:117
-- ClassicLootManager_Integrations/Integrations.lua:123
CLM.L["Gargul Integration"] = "Intégration Gargul"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:8
CLM.L["Garr"] = "Garr"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:247
CLM.L["Gear Points"] = "Points de vitesse"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:7
CLM.L["Gehennas"] = "Gehennas"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:59
CLM.L["General Rajaxx"] = "Général Rajaxx"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:129
CLM.L["General Vezax"] = "Général Vezax"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:157
CLM.L["General Zarithrian"] = "Général Zarithrian"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:694
CLM.L["General settings"] = "Options générales"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:721
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:754
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:97
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
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:327
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
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:731
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:764
CLM.L["Hands"] = "Mains"
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:57
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:594
--CLM.L["Hard Mode"] = ""
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:900
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:109
CLM.L["Hard cap"] = "Hard cap"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:722
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:755
CLM.L["Head"] = "Tête"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:156
CLM.L["Healer"] = "Soigneur"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:40
CLM.L["Heigan the Unclean"] = "Heigan l'Impur"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:740
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:773
CLM.L["Held In Off-hand"] = "Tenu en main gauche"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:106
CLM.L["Hex Lord Malacrass"] = "Seigneur des maléfices Malacrass"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:388
CLM.L["Hides incoming !dkp and !bid whispers. Change requires /reload."] = "Masque les chuchotements entrants !dkp et !bid. Le changement nécessite /reload."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:397
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
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:127
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
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:39
CLM.L["Ignore entry"] = "Ignorer la saisie"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:355
CLM.L["Ignore"] = "Ignorer"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:96
CLM.L["Illidan Stormrage"] = "Illidan Hurlorage"
-- ClassicLootManager_Integrations/Migration.lua:246
-- ClassicLootManager_Integrations/Migration.lua:380
-- ClassicLootManager_Integrations/Migration.lua:424
CLM.L["Import complete"] = "Importation terminée"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:442
-- ClassicLootManager_Integrations/ImportCSV.lua:100
-- ClassicLootManager_Integrations/ImportCSV.lua:162
-- ClassicLootManager_Integrations/ImportCSV.lua:163
-- ClassicLootManager_Integrations/ImportCSV.lua:191
CLM.L["Import"] = "Importer"
-- ClassicLootManager_Integrations/Migration.lua:197
CLM.L["Importing %s entries from DKPTable"] = "Importation de %s entrées  depuis la table DKP"
-- ClassicLootManager_Integrations/Migration.lua:308
CLM.L["Importing profiles from DKPTable"] = "Importation de profils depuis la table DKP"
-- ClassicLootManager/Modules/GUI/Filters.lua:82
CLM.L["In Guild"] = "Dans la guilde"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:794
CLM.L["In Progress"] = "En cours"
-- ClassicLootManager/Modules/GUI/Filters.lua:79
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:291
CLM.L["In Raid"] = "En Raid"
-- ClassicLootManager/MinimapIcon.lua:48
CLM.L["In-Sync"] = "En synchronisation"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:850
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:140
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:127
CLM.L["Include bench"] = "Inclure banc"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:851
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:141
CLM.L["Include benched players in all auto-awards"] = "Inclure les joueurs sur le banc dans toutes les récompenses automatiques"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:279
CLM.L["Include players with negative standings in decay."] = "Inclure les joueurs avec un total de points négatifs à la réduction"
-- ClassicLootManager/MinimapIcon.lua:46
CLM.L["Incoherent state"] = "État incohérent"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:167
CLM.L["Info"] = "Info"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:409
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:415
CLM.L["Information"] = "Information"
-- ClassicLootManager_Integrations/ImportCSV.lua:73
CLM.L["Input CSV Item value override data"] = "Entrer les données de remplacement de valeur au format CSV"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:99
CLM.L["Input name: %s"] = "Nom d'entrée: %s"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:42
CLM.L["Instructor Razuvious"] = "Instructeur Razuvious"
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:138
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:143
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:148
-- ClassicLootManager_Integrations/ClassicLootManager_Integrations.lua:20
CLM.L["Integrations"] = "Intégrations"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:103
CLM.L["Interval Bonus time"] = "Intervalle de temps du bonus"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:444
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:826
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:117
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:250
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:100
CLM.L["Interval Bonus"] = "Bonus d'intervalle"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:833
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:124
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:252
CLM.L["Interval Time"] = "Intervalle de temps"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:842
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:132
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:253
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:106
CLM.L["Interval Value"] = "Valeur du bonus d'intervalle"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:834
CLM.L["Interval in [minutes] to award bonus points"] = "Intervalle en [minutes] pour attribuer des points bonus"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1030
CLM.L["Invalid bid value"] = "Valeur d'enchère non valide"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:324
CLM.L["Invalid context. You should not decay raid only."] = "Contexte non valide. Vous ne devriez pas faire de réduction uniquement sur le raid."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1036
CLM.L["Invalid item"] = "Item invalide"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:56
CLM.L["Invalid value provided"] = "Valeur fournie non valide"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:61
CLM.L["Item Value Mode"] = "Mode de Valeur de l'objet"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:979
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1134
CLM.L["Item value mode"] = "Mode de Valeur de l'objet"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1087
CLM.L["Item value overrides"] = "Remplacements de la valeur de l'objet"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:91
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:100
CLM.L["Item"] = "Objet"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:104
CLM.L["Jan'alai"] = "Jan'alai"
-- ClassicLootManager_Integrations/GUI.lua:140
CLM.L["January"] = "Janvier"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:54
CLM.L["Jin'do the Hexxer"] = "Jin'do le Maléficieur"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:82
CLM.L["Join our discord for more info: "] = "Rejoignez notre discord pour plus d'infos : "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:414
CLM.L["Join selected raid"] = "Rejoindre le raid sélectionné"
-- ClassicLootManager_Integrations/GUI.lua:146
CLM.L["July"] = "Juillet"
-- ClassicLootManager_Integrations/GUI.lua:145
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
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:365
CLM.L["Large value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Grande valeur pour les enchères par palier. \n\nRemplissez la même valeur que les autres paliers ou une valeur négative pour ignorer"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:831
CLM.L["Large"] = "Grand"
-- ClassicLootManager_Integrations/GUI.lua:327
CLM.L["Last month"] = "Le mois dernier"
-- ClassicLootManager_Integrations/GUI.lua:320
CLM.L["Last week"] = "La semaine dernière"
-- ClassicLootManager_Integrations/GUI.lua:334
CLM.L["Last year"] = "L'année dernière"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:429
CLM.L["Latest loot"] = "Dernier butin"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:452
CLM.L["Latest points"] = "Derniers points"
-- ClassicLootManager/Utils.lua:896
CLM.L["Legendary"] = "Légendaire"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:733
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:766
CLM.L["Legs"] = "Jambes"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:80
CLM.L["Leotheras the Blind"] = "Leotheras l'Aveugle"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:20
CLM.L["Link Alt to Main"] = "Lier Reroll au Main"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:445
CLM.L["Linking override"] = "Remplacement de la liaison"
-- ClassicLootManager/MinimapIcon.lua:42
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:347
CLM.L["Loading..."] = "Chargement..."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:41
CLM.L["Loatheb"] = "Horreb"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:266
CLM.L["Lock selected"] = "Verrouillage sélectionné"
-- ClassicLootManager/Modules/GUI/Filters.lua:85
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:397
CLM.L["Locked"] = "Fermé"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:24
CLM.L["Logging level"] = "Niveau Enregistrement"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:20
CLM.L["Logging"] = "Enregistrement"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:233
CLM.L["Loot Awards"] = "Récompenses de butin"
-- ClassicLootManager_Integrations/GUI.lua:26
CLM.L["Loot History"] = "Historique du butin"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:336
CLM.L["Loot rarity"] = "Rareté de butin"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:24
CLM.L["Loot"] = "Butin"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:141
CLM.L["Lord Jaraxxus"] = "Seigneur Jaraxxus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:150
CLM.L["Lord Marrowgar"] = "Seigneur Gargamoelle"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:5
CLM.L["Lucifron"] = "Lucifron"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:112
CLM.L["M'uru"] = "M'uru"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:414
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:181
-- ClassicLootManager_Integrations/Integrations.lua:137
-- ClassicLootManager_Integrations/Integrations.lua:142
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
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:738
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:771
CLM.L["Main Hand"] = "Main droite"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:175
CLM.L["Main"] = "Main"
-- ClassicLootManager/Modules/GUI/Filters.lua:84
CLM.L["Mains"] = "Mains"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:13
CLM.L["Majordomo Executus"] = "Chambellan Executus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:120
CLM.L["Malygos"] = "Malygos"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:141
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:73
CLM.L["Management"] = "Gestion"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:224
CLM.L["Manager"] = "Admin"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:438
CLM.L["Manual adjustment"] = "Réglage manuel"
-- ClassicLootManager_Integrations/GUI.lua:142
CLM.L["March"] = "Mars"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:309
CLM.L["Master Loot Only"] = "Maitre du butin uniquement"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:832
CLM.L["Max"] = "Маx"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:892
CLM.L["Maximum point cap player can receive per raid week. Set to 0 to disable."] = "Le nombre maximum de points qu’un joueur peut recevoir par semaine de raid. Réglez sur 0 pour désactiver."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:901
CLM.L["Maximum point cap that player can have. Set to 0 to disable."] = "Limite maximale de points qu’un joueur peut avoir. Réglez sur 0 pour désactiver."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:369
CLM.L["Maximum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Valeur maximum pour les enchères montantes ou par palier.\n\nRemplissez la même valeur que les autres paliers ou une valeur négative pour ignorer"
-- ClassicLootManager_Integrations/GUI.lua:144
CLM.L["May"] = "Mai"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:361
CLM.L["Medium value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Valeur Médium pour les enchères par palier. \n\nRemplissez la même valeur que les autres paliers ou une valeur négative pour ignorer"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:830
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
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:121
CLM.L["Min bid increment"] = "Incrément d'enchère minimum"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1179
CLM.L["Minimal increment"] = "Incrément minimal"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1180
CLM.L["Minimal value increment for open auction mode."] = "Valeur minimale d’incrément en mode d'enchères ouvertes."
-- ClassicLootManager_Integrations/Migration.lua:68
CLM.L["Minimap Icon -> Configuration -> Wipe events"] = "Icône de minicarte -> Configuration -> Effacer les événements"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:954
CLM.L["Minimum GP used in calculations when player has less GP than this value."] = "GP minimum utilisés dans les calculs lorsque le joueur a moins de GP que cette valeur."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:953
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:145
CLM.L["Minimum GP"] = "GP minimum"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:86
CLM.L["Minimum Level"] = "Niveau minimum"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:87
CLM.L["Minimum level of players to fill from guild."] = "Niveau minimum des joueurs à remplir depuis guilde."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:142
CLM.L["Minimum points (DKP / EP)"] = "Points minimums (DKP / EP)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1041
CLM.L["Minimum standing required to be allowed to bid."] = "Capital minimum pour avoir le droit d'enchérir"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1040
CLM.L["Minimum standing"] = "Capital minimum"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:233
CLM.L["Missing award value"] = "Valeur de récompense manquante"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:322
CLM.L["Missing decay value"] = "Valeur de réduction manquante"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:321
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:393
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:432
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:461
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:495
CLM.L["Missing valid raid"] = "Raid valide manquant"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:60
CLM.L["Moam"] = "Moam"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:235
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:345
CLM.L["Modifier combination"] = "Modifier la combinaison de touche"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:197
CLM.L["Molten Core"] = "Cœur du Magma"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:65
CLM.L["Moroes"] = "Moroes"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:82
CLM.L["Morogrim Tidewalker"] = "Morogrim Marcheur-des-flots"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:94
CLM.L["Mother Shahraz"] = "Mère Shahraz"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:410
CLM.L["Multiple"] = "Multiple"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:527
CLM.L["Multiplier for tier %s (if used by the auction type)."] = "Multiplicateur du palier %s (si utilisé par le type d'enchère)."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:463
CLM.L["Multiplier used by the equations"] = "Multiplicateur utilisé par l'équation"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:468
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:288
CLM.L["Multiplier"] = "Mutiplicateur"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:103
CLM.L["Nalorakk"] = "Nalorakk"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:699
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:355
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:366
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:261
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:174
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:554
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:394
CLM.L["Name"] = "Nom"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:148
CLM.L["Named Buttons"] = "Boutons nommés"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:242
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:401
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:518
CLM.L["Naxxramas"] = "Naxxramas"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:723
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:756
CLM.L["Neck"] = "Cou"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:22
CLM.L["Nefarian"] = "Nefarian"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:71
CLM.L["Netherspite"] = "Dédain-du-Néant"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:38
CLM.L["Never show changelog"] = "Ne jamais afficher le journal des modifications"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:858
CLM.L["New highest bid on %s: %s %s %s"] = "Nouvelle offre la plus haute %s: %d %s %s"
-- ClassicLootManager_Integrations/Migration.lua:111
CLM.L["New roster: [%s]"] = "Nouveau roster : [%s]"
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:61
CLM.L["New version %s of Classic Loot Manager is available. For best experience please update the AddOn."] = "La nouvelle version %s de Classic Loot Manager est disponible. Pour une meilleure expérience, veuillez mettre à jour l'Addon."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:74
CLM.L["Nightbane"] = "Plaie-de-nuit"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1032
CLM.L["No auction in progress"] = "Aucune enchère en cours"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:198
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:176
CLM.L["No bids"] = "Aucune enchère"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:446
CLM.L["No loot received"] = "Aucun butin reçu"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:220
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:311
CLM.L["No players selected"] = "Aucun joueur sélectionné."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:475
CLM.L["No points received"] = "Aucun point reçu"
-- ClassicLootManager/Utils.lua:518
CLM.L["No"] = "Non"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:745
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:778
CLM.L["Non-equippable"] = "Non-équipable"
-- ClassicLootManager/Modules/GUI/Filters.lua:195
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:302
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:268
-- ClassicLootManager_Integrations/Integrations.lua:648
CLM.L["None"] = "Aucun"
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:56
--CLM.L["Normal Mode"] = ""
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:142
CLM.L["Northrend Beasts"] = "Les bêtes du Norfendre"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1025
CLM.L["Not in a roster"] = "Pas dans un roster"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:570
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:615
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:525
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:255
CLM.L["Not in raid"] = "Pas en raid"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:156
CLM.L["Note to be added to award. Max 25 characters. It is recommended to not include date nor selected reason here. If you will input encounter ID it will be transformed into boss name."] = "Ajouter une note à l’attrib. de points. Maximum 25 lettres. Il est recommandé de ne pas inclure de date ni la raison ici. Si vous entrer l'ID de la rencontre, il sera transformé en nom du boss"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:154
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:278
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:115
CLM.L["Note"] = "Note"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:39
CLM.L["Noth the Plaguebringer"] = "Noth le Porte-peste"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:210
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:377
CLM.L["Notify that you are passing on the item."] = "Avertissez que vous passez sur l'objet."
-- ClassicLootManager_Integrations/GUI.lua:150
CLM.L["November"] = "Novembre"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:657
CLM.L["Num"] = "Nombre"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1000
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:415
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:195
-- ClassicLootManager_Integrations/Integrations.lua:147
-- ClassicLootManager_Integrations/Integrations.lua:152
CLM.L["OS"] = "OS"
-- ClassicLootManager_Integrations/GUI.lua:149
CLM.L["October"] = "Octobre"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:739
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:772
CLM.L["Off Hand"] = "Main gauche"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1035
CLM.L["Off-spec bidding not allowed"] = "Les enchères hors spécifications non autorisées"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:803
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:94
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:242
CLM.L["On Time Bonus Value"] = "Valeur du bonus de début de raid"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:91
CLM.L["On Time Bonus value"] = "Valeur du bonus de début de raid"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:431
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:796
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:87
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:240
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:88
CLM.L["On Time Bonus"] = "Bonus de début de raid"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:737
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:770
CLM.L["One-Hand"] = "Une main"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:858
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:130
CLM.L["Online only"] = "En ligne seulement"
-- ClassicLootManager/Modules/GUI/Filters.lua:80
CLM.L["Online"] = "En ligne"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:177
CLM.L["Only when ML/RL"] = "Uniquement lorsque ML/RL"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:4
CLM.L["Onyxia"] = "Onyxia"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:190
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:498
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:615
CLM.L["Onyxia's Lair"] = "Repaire d'Onyxia"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:123
CLM.L["Open Key Bindings UI for AddOns"] = "Ouvrir les raccourcis clavier pour les addons"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:643
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:650
CLM.L["Open"] = "Ouvert"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:67
CLM.L["Opera Hall"] = "L'Opéra"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:63
CLM.L["Ossirian the Unscarred"] = "Ossirian l'Intouché"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1173
CLM.L["Other"] = "Autre"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:30
CLM.L["Ouro"] = "Ouro"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:76
CLM.L["Overrides"] = "Paramètres"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:977
CLM.L["PASS"] = "PASSE"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:962
CLM.L["PR Rounding"] = "PR Arrondi"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:367
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:880
CLM.L["PR"] = "PR"
-- .:indirectly
CLM.L["Paladin"] = "Paladin"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:289
CLM.L["Participated"] = "Participé"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:310
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:330
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:416
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:209
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:376
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:716
CLM.L["Pass"] = "Passe"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1034
CLM.L["Passing after bidding not allowed"] = "Passer après une enchère n'est pas autorisé"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:35
CLM.L["Patchwerk"] = "Le Recousu"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:121
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:115
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:178
CLM.L["Player"] = "Joueur"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:362
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:375
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:392
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:406
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:420
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:439
CLM.L["Please select a raid"] = "Veuillez sélectionner un raid"
-- ClassicLootManager_Integrations/GUI.lua:25
CLM.L["Point History"] = "Historique des points"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:932
CLM.L["Point award multiplier for players on bench."] = "Multiplicateur de récompense pour les joueurs sur le banc"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:876
CLM.L["Point caps"] = "Point caps"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:706
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1229
CLM.L["Point type"] = "Type de point"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:25
CLM.L["Point"] = "Point"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:179
CLM.L["Points value that will be awarded."] = "Valeur des points qui seront attribués"
-- ClassicLootManager/Utils.lua:891
CLM.L["Poor"] = "Médiocre"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:70
CLM.L["Post bids"] = "Annoncer les offres"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:72
CLM.L["Post channel"] = "Canal d’annonce"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:255
CLM.L["Price Tooltips"] = "Infobulle de prix"
-- .:indirectly
CLM.L["Priest"] = "Prêtre"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:73
CLM.L["Prince Malchezaar"] = "Prince Malchezaar"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:28
CLM.L["Princess Huhuran"] = "Princesse Huhuran"
-- ClassicLootManager_Integrations/Integrations.lua:142
-- ClassicLootManager_Integrations/Integrations.lua:152
CLM.L["Prioritized"] = "Priorisé"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:151
CLM.L["Professor Putricide"] = "Professeur Putricide"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:257
CLM.L["Profile %s already exists and is used by different GUID %s (%s). "] = "Le profil %s existe déjà et est utilisé par un différent GUID %s (%s)."
-- .:indirectly
CLM.L["Profiles"] = "Profils"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:434
CLM.L["Progression Bonus"] = "Bonus de progression"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:377
CLM.L["Provide number of raids needed for 100% attendance in a weekly reset. Between 1 - 50 raids. Defaults to 2. Requires /reload."] = "Indiquez le nombre de raids nécessaires pour une participation à 100% lors d'une réinitialisation hebdomadaire. Entre 1 et 50 raids. La valeur par défaut est 2. Nécessite /reload."
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:395
CLM.L["Provide number of weeks that will be accounted for attendance. Between 1 - 1000 weeks. Defaults to 10. Requires /reload."] = "Indiquez sur combien de semaines sera calculée la fréquentation. Entre 1 et 1000 semaines. La valeur par défaut est 10. Nécessite /reload."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:53
CLM.L["Prune profiles"] = "Nettoyer les profils"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:924
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:149
CLM.L["Put players leaving raid on bench instead of removing them. To remove them completely they will need to be removed manually from the bench."] = "Mettez les joueurs quittant le raid sur le banc au lieu de les retirer. Pour les retirer complètement, ils devront être retirés manuellement du banc."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:152
CLM.L["Queen Lana'thel"] = "Reine de sang Lana'thel"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:749
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:782
CLM.L["Quiver"] = "Carquois"
-- ClassicLootManager_Integrations/Integrations.lua:232
-- ClassicLootManager_Integrations/Integrations.lua:238
CLM.L["RCLC Integration"] = "Integration RCLC"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:624
CLM.L["ROLL"] = "Jet de dés"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:97
CLM.L["Rage Winterchill"] = "Rage Froidhiver"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:14
CLM.L["Ragnaros"] = "Ragnaros"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:247
CLM.L["Raid Completion Bonus Value"] = "Valeur du bonus de fin de raid"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:97
CLM.L["Raid Completion Bonus value"] = "Valeur du bonus de fin de raid"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:433
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:811
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:102
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:245
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:94
CLM.L["Raid Completion Bonus"] = "Bonus de fin de raid"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:818
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:109
CLM.L["Raid Completion Value"] = "Valeur de fin de raid"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:185
CLM.L["Raid Name"] = "Nom du raid"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:200
CLM.L["Raid Start/End"] = "Début/Fin du Raid"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:196
CLM.L["Raid Warnings"] = "Avertissements de raid"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:425
CLM.L["Raid [%s] ended"] = "Raid [%s] terminé"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:373
CLM.L["Raid [%s] started"] = "Le raid [%s] a commencé"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:311
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:333
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:405
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:448
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:473
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:507
CLM.L["Raid management is disabled during time traveling."] = "La gestion des raids est désactivée pendant le Time-traveling"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:747
CLM.L["Raid"] = "Raid"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:376
CLM.L["Raids needed in reset"] = "Raids nécessaires à la réinitialisation"
-- ClassicLootManager_Integrations/GUI.lua:27
CLM.L["Raids"] = "Raids"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:744
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:777
CLM.L["Ranged (wands)"] = "À distance (baguettes)"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:743
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:776
CLM.L["Ranged"] = "À distance"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:77
CLM.L["Ranks"] = "Rangs"
-- ClassicLootManager/Utils.lua:894
CLM.L["Rare"] = "Rare"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:15
CLM.L["Razorgore the Untamed"] = "Tranchetripe l'Indompté"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:134
CLM.L["Razorscale"] = "Tranchécaille"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:169
CLM.L["Reason"] = "Raison"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:358
CLM.L["Received"] = "Reçu"
-- ClassicLootManager_Integrations/Integrations.lua:137
-- ClassicLootManager_Integrations/Integrations.lua:147
CLM.L["Regular"] = "Standard"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:750
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:783
CLM.L["Relic"] = "Relique"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:93
CLM.L["Reliquary of Souls"] = "Reliquaire des âmes"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:255
CLM.L["Remove all items from auction list. Populates new one if there are any pending."] = "Retirer tous les items de la liste d'enchères. Recréé une nouvelle liste si des items sont encore en attente"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:107
CLM.L["Remove all"] = "Supprimer tout"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:83
CLM.L["Remove auction"] = "Supprimer l'enchère"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:661
CLM.L["Remove from roster"] = "Retirer du roster"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:612
CLM.L["Remove from standby"] = "Retirer du mode veille"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:265
CLM.L["Remove item from auction list after it's awarded."] = "Retirer l'item de la liste d'enchères lorsqu'il est attribué"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:96
CLM.L["Remove old"] = "Supprimer l'ancien"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:264
CLM.L["Remove on award"] = "Retirer lors de l'attribution"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:580
CLM.L["Remove override"] = "Supprimer le remplacement"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:760
CLM.L["Remove roster"] = "Supprimer le roster"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:433
CLM.L["Remove selected raid"] = "Supprimer le raid sélectionné"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:288
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:436
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:757
CLM.L["Remove selected"] = "Supprimer la sélection"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:766
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:399
CLM.L["Remove"] = "Supprimer"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:767
CLM.L["Removes current roster."] = "Supprime le roster actuel."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:216
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:584
CLM.L["Removing items not allowed during auction."] = "Interdiction de retirer des objets en cours d'enchère"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:356
CLM.L["Request standby"] = "Demander une mise en veille"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:102
CLM.L["Rescales CLM UI, except Bidding window. You can rescale Bidding window independently by using Ctrl + Mouse Wheel. Some windows may require closing and reopening."] = "Modifie l'échelle d'interface CLM, sauf la fenêtre d'Enchère. Vous pouvez modifier l'échelle de la fenêtre d'enchère indépendamment en utilisant Ctrl + Molette de la souris. Certaines fenêtres devront être fermées et rouvertes."
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:123
CLM.L["Reset gui positions"] = "Réinitialiser les positions de l'interface graphique"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:369
CLM.L["Revoke standby"] = "Révoquer la mise en veille"
-- .:indirectly
CLM.L["Rogue"] = "Voleur"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:176
CLM.L["Role"] = "Rôle"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:570
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:411
CLM.L["Roll"] = "Roll"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1221
CLM.L["Roster Name"] = "Nom de roster"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1220
CLM.L["Roster name"] = "Nom de roster"
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
CLM.L["Rotface"] = "Trognepus"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:963
CLM.L["Round PR to selected number of decimals"] = "Arrondir PR au nombre de décimales sélectionné"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:720
CLM.L["Round to selected number of decimals"] = "Arrondir au nombre de décimales sélectionné"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:118
CLM.L["Round to"] = "Arrondir à"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:719
CLM.L["Rounding"] = "Arrondi"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:279
CLM.L["Ruins of Ahn'Qiraj"] = "Ruines d'Ahn'Qiraj"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:625
CLM.L["SK"] = "SK"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:867
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:133
CLM.L["Same zone only"] = "Même zone uniquement"
-- ClassicLootManager/MinimapIcon.lua:56
CLM.L["Sandbox mode"] = "Mode Sandbox"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:45
CLM.L["Sapphiron"] = "Saphiron"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:116
CLM.L["Sartharion"] = "Sartharion"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:158
CLM.L["Saviana Ragefire"] = "Saviana Ragefeu"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:644
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:651
CLM.L["Sealed"] = "Fermée"
-- ClassicLootManager/Modules/GUI/Filters.lua:212
CLM.L["Search for player names. Separate multiple with a comma ','. Minimum 3 characters. Overrides filtering."] = "Rechercher des noms de joueurs. Séparez les multiples par une virgule ','. 3 caractères minimum. Remplace le filtrage."
-- ClassicLootManager/Modules/GUI/Filters.lua:211
CLM.L["Search"] = "Chercher"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1230
CLM.L["Select DKP or EPGP point system."] = "Sélectionner un système de point : DKP ou EPGP"
-- ClassicLootManager_Integrations/GUI.lua:380
CLM.L["Select Profiles to export"] = "Sélectionnez les profils à exporter"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:412
CLM.L["Select Rosters to display"] = "Sélectionner les rosters à afficher"
-- ClassicLootManager_Integrations/GUI.lua:349
CLM.L["Select Rosters to export"] = "Sélectionnez les rosters à exporter"
-- ClassicLootManager/Modules/GUI/Filters.lua:183
CLM.L["Select all classes."] = "Sélectionnez toutes les classes."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:492
CLM.L["Select equation"] = "Sélectionner l'équation"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:25
CLM.L["Select logging level for troubleshooting"] = "Sélectionnez le niveau du journal pour le dépannage"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:187
CLM.L["Select loot rarity for the annoucement to raid."] = "Sélectionnez la rareté du butin annoncé au raid."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:337
CLM.L["Select loot rarity threshold to used to fill the auction list."] = "Sélectionnez le seuil de rareté de butin utilisé pour remplir la liste d'enchères"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:236
CLM.L["Select modifier combination for awarding."] = "Sélectionnez la combinaison de modificateurs pour l'attribution."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:346
CLM.L["Select modifier combination for filling auction from bags and corpse."] = "Sélectionnez la combinaison de modificateurs gouvernant le remplissage depuis les sacs et cadavre"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:135
CLM.L["Select roster to add profiles to."] = "Sélectionner le roster auquel ajouter des profils."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:165
CLM.L["Select roster to create raid for."] = "Sélectionner le roster pour lequel créer un raid."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:164
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:134
CLM.L["Select roster"] = "Sélectionner le roster"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:883
CLM.L["Select weekly reset timezone. EU: Wed 07:00 GMT or US: Tue 15:00 GMT"] = "Sélectionnez le fuseau horaire de réinitialisation hebdomadaire. UE : Mercredi 07h00 GMT ou États-Unis : Mar 15h00 GMT"
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:55
--CLM.L["Select |cffeeee00%s|r encounter difficulty for bonus value award (%s)."] = ""
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:745
CLM.L["Selected"] = "Sélectionné"
-- ClassicLootManager_Integrations/GUI.lua:148
CLM.L["September"] = "Septembre"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:326
CLM.L["Serpentshrine Cavern"] = "Caverne du sanctuaire du Serpent"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:472
CLM.L["Set %s points to %s players for %s in <%s>"] = "Définir %s points sur %s joueurs pour %s dans <%s>"
-- ClassicLootManager_Integrations/Migration.lua:378
CLM.L["Set points for %s players for team to %s"] = "Définir des points pour %s joueurs pour l'équipe pour %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:186
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
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:742
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:775
CLM.L["Shield"] = "Bouclier"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:457
CLM.L["Shift + Alt"] = "Shift + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:460
CLM.L["Shift + Ctrl + Alt"] = "Shift + Ctrl + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:459
CLM.L["Shift + Ctrl"] = "Shift + Ctrl"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:454
CLM.L["Shift"] = "Shift"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:725
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:758
CLM.L["Shirt"] = "Chemise"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:724
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:757
CLM.L["Shoulder"] = "Épaule"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:219
CLM.L["Show Award window"] = "Fenêtre de récompense de spectacles"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:24
CLM.L["Silithid Royalty"] = "Bug Trio"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:154
CLM.L["Sindragosa"] = "Sindragosa"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:672
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:678
CLM.L["Single-Priced"] = "Prix unique"
-- ClassicLootManager_Integrations/Migration.lua:179
CLM.L["Skipping %s"] = "%s ignoré"
-- ClassicLootManager_Integrations/Migration.lua:255
CLM.L["Skipping CommunityDKP"] = "Ignorer CommunityDKP"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:498
CLM.L["Slot multipliers"] = "Multiplicateurs d'emplacement"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:357
CLM.L["Small value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Petite valeur pour les enchères par palier. \n\nRemplissez la même valeur que les autres paliers ou une valeur négative pour ignorer"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:829
CLM.L["Small"] = "Petit"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:85
CLM.L["Spec guild request"] = "Demande pour spé guilde"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:357
CLM.L["Spent"] = "Dépensé"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:796
CLM.L["Stale"] = "Périmé"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:138
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:148
CLM.L["Standby %s has been sent"] = "Veille %s a été envoyé"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:435
CLM.L["Standby Bonus"] = "Bonus d'attente"
-- ClassicLootManager/Modules/GUI/Filters.lua:81
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:300
CLM.L["Standby"] = "En attente"
-- ClassicLootManager_Integrations/GUI.lua:24
CLM.L["Standings"] = "Aperçu roster"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:386
CLM.L["Start selected raid"] = "Commencer le raid sélectionné"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:501
CLM.L["Start"] = "Début"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:511
CLM.L["Started raid %s"] = "Raid %s commencé"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:419
CLM.L["Statistics"] = "Statistiques"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:262
CLM.L["Status"] = "Status"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:501
CLM.L["Stop"] = "Stop"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:64
CLM.L["Store bids"] = "Sauvegarder les enchères"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:65
CLM.L["Store finished auction bids information."] = "Sauvegarder les informations d’enchères terminées."
-- ClassicLootManager_Integrations/ImportCSV.lua:118
CLM.L["Success"] = "Succès"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:11
CLM.L["Sulfuron Harbinger"] = "Messager de Sulfuron"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:386
CLM.L["Sunwell Plateau"] = "Plateau du Puits de soleil"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:387
CLM.L["Suppress incoming whispers"] = "Supprimer les chuchotements entrants"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:396
CLM.L["Suppress outgoing whispers"] = "Supprimer les chuchotements sortants"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:81
CLM.L["Suppresses changelog display until new version is released"] = "Supprimer l'affichage du journal des modifications jusqu'à ce qu'une nouvelle version soit publiée"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:89
CLM.L["Supremus"] = "Supremus"
-- ClassicLootManager/MinimapIcon.lua:50
CLM.L["Sync ongoing"] = "Synchronisation en cours"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:621
CLM.L["TBC"] = "TBC"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:729
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:762
CLM.L["Tabard"] = "Tabard"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:155
CLM.L["Tank"] = "Tank"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1188
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:139
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
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:748
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:781
CLM.L["Thrown"] = "Arme de jet"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:519
CLM.L["Tier multipliers"] = "Multiplicateur de palier"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:674
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:679
CLM.L["Tiered"] = "Par niveau"
-- ClassicLootManager/MinimapIcon.lua:60
CLM.L["Time Traveling"] = "Voyager dans le temps"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1065
CLM.L["Time in seconds by which auction will be extended if bid is received during last 10 seconds."] = "Durée en secondes ajoutée à l’enchère si une offre est reçue au cours des 10 dernières secondes."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1049
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:658
CLM.L["Time"] = "Temps"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:736
CLM.L["Timetravel"] = "Timetravel"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:305
CLM.L["Toggle Auction History window display"] = "Activer l'affichage de la fenêtre Historique des enchères"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:678
CLM.L["Toggle Auctioning window display"] = "Activer l'affichage de la fenêtre d'enchères"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:79
CLM.L["Toggle Bidding auto-open"] = "Activer l'ouverture automatique des enchères"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:102
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:939
CLM.L["Toggle Bidding window display"] = "Activer l'affichage de la fenêtre d'enchères"
-- ClassicLootManager_Integrations/ImportCSV.lua:216
CLM.L["Toggle CSV import window display"] = "Activer l’affichage de la fenêtre d'importation CSV"
-- ClassicLootManager/MinimapIcon.lua:77
CLM.L["Toggle Minimap Icon"] = "Afficher l'icône de minimap"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:87
--CLM.L["Toggle advancing to next item on the list after bid."] = ""
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:80
CLM.L["Toggle auto open and auto close on auction start and stop"] = "Activer l'ouverture et la fermeture automatiques au début et à l'arrêt des enchères"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:48
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:160
CLM.L["Toggle changelog window display"] = "Activer l'affichage de la fenêtre du journal des modifications"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:47
CLM.L["Toggle changelog"] = "Activer le journal des modifications"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:79
CLM.L["Toggle closing bidding UI after submitting bid for all items."] = "Basculer la fermeture de l'interface après avoir soumis les offres pour tous les items"
-- ClassicLootManager_Integrations/GUI.lua:518
CLM.L["Toggle export window display"] = "Activer l’affichage de la fenêtre d'exportation"
-- ClassicLootManager/Modules/GUI/UnifiedGUI.lua:426
CLM.L["Toggle standings window display"] = "Activer l'affichage de la fenêtre de l’aperçu roster"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:147
CLM.L["Toggles addon sounds."] = "Activer les sons de l'addon"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:169
CLM.L["Toggles loot announcement to raid"] = "Activer l'annonce de butin en raid"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:269
CLM.L["Toggles loot award announcement to guild"] = "Activer l'annonce de récompense de butin à la guilde"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:357
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:370
CLM.L["Too much data to display"] = "Trop de données à afficher "
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:124
CLM.L["Toravon the Ice Watcher"] = "Toravon la Sentinelle de glace"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:422
CLM.L["Total blocked"] = "Total bloqué"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:423
CLM.L["Total decayed"] = "Total de points réduits"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:421
CLM.L["Total received"] = "Total reçu"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:420
CLM.L["Total spent"] = "Total dépensé"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:469
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:586
CLM.L["Trial of the Crusader"] = "Epreuve du Croisé"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:736
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:769
CLM.L["Trinket"] = "Bijou"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:40
CLM.L["True"] = "Vrai"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:29
CLM.L["Twin Emperors"] = "Les Empereurs jumeaux"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:247
CLM.L["Two different profiles exist for target GUID %s (%s:%s) and name %s (%s:%s). Verify and clean up profiles before updating."] = "Deux profils différents existent pour le GUID %s (%s:%s) et le nom %s (%s:%s). Vérifiez et nettoyez les profils avant de mettre à jour."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:741
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:774
CLM.L["Two-Hand"] = "Deux mains"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:659
CLM.L["Type"] = "Type"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:101
CLM.L["UI Scale"] = "Echelle d'interface"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:449
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:566
CLM.L["Ulduar"] = "Ulduar"
-- ClassicLootManager_Integrations/Migration.lua:48
CLM.L["Unable to execute migration. Entries already exist."] = "Impossible d'exécuter la migration. Les entrées existent déjà."
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:163
CLM.L["Unable to get item info from server. Please try auctioning again"] = "Impossible de récupérer les infos de l'objet depuis le serveur. Essayez de relancer l'enchère"
-- ClassicLootManager/Utils.lua:893
CLM.L["Uncommon"] = "Commun"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:436
CLM.L["Unexcused absence"] = "Absence injustifiée"
-- ClassicLootManager/MinimapIcon.lua:52
CLM.L["Unknown sync state"] = "État de synchronisation inconnu"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:286
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:342
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:215
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:285
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:175
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:34
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:332
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:435
CLM.L["Unknown"] = "Inconnu"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:304
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:29
CLM.L["Unlink Alt"] = "Dissocier Reroll"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:275
CLM.L["Unlock selected"] = "Déverrouiller Sélectionné"
-- ClassicLootManager_Integrations/Migration.lua:144
CLM.L["UpdatePoints(): Empty targets list"] = "Màj des Points(): Liste de cibles vide"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:518
CLM.L["Updated raid <%s> %s joined, %s left, %s benched, %s removed"] = "Raid <%s> mis à jour %s joueurs ont rejoint, %s joueurs sont partis, %s joueurs sur le banc, %s joueurs ont été supprimés"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1103
CLM.L["Use named buttons"] = "Utiliser les boutons nommés"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:16
CLM.L["Vaelastrasz the Corrupt"] = "Vaelastrasz le Corrompu"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:143
CLM.L["Val'kyr Twins"] = "Les jumelles Val'kyr"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:147
CLM.L["Valithria Dreamwalker"] = "Valithria Marcherêve"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:168
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:297
CLM.L["Value"] = "Valeur"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:439
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:556
CLM.L["Vault of Archavon"] = "Caveau d'Archavon"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:33
CLM.L["Verbose"] = "Détaillé"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:75
CLM.L["Version check in guild"] = "Vérification de la version dans la guilde"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:177
CLM.L["Version"] = "Version"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:119
CLM.L["Vesperon"] = "Vespéron"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:645
CLM.L["Vickrey"] = "Vickrey"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:27
CLM.L["Viscidus"] = "Viscidus"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:85
CLM.L["Void Reaver"] = "Saccageur du Vide"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:732
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:765
CLM.L["Waist"] = "Taille"
-- .:indirectly
CLM.L["Warlock"] = "Démoniste"
-- .:indirectly
CLM.L["Warrior"] = "Guerrier"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:891
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:112
CLM.L["Weekly cap"] = "Plafond hebdomadaire"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:413
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:416
CLM.L["Weekly gains"] = "Gains hebdomadaires"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:882
CLM.L["Weekly reset timezone"] = "Timer de réinitialisation hebdomadaire"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:115
CLM.L["Weekly reset"] = "Réinitialisation hebdomadaire"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:178
CLM.L["When enabled, this will make loot announcement display only if you're Master Looter or Raid Leader (if there is no Master Looter)."] = "Quand activé, l'annonce du butin s’affichera uniquement si vous êtes Master Loot ou Raid Leader (s'il n'y a pas de Master Loot)."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1104
CLM.L["Will display names of the buttons instead of values in bidding UI"] = "Affichera les noms des boutons au lieu des valeurs dans l'interface d'enchères"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:155
CLM.L["Wipe events"] = "Effacer les événements"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:41
CLM.L["Wipe"] = "Effacer"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:156
CLM.L["Wipes all events from memory. This will trigger resyncing from other users."] = "Efface tous les événements de la mémoire. Cela déclenchera la resynchronisation depuis les autres utilisateurs."
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:42
CLM.L["Wipes the log history"] = "Efface l'historique du journal"
-- ClassicLootManager_Integrations/Integrations.lua:361
CLM.L["WoW DKP Bot Integration"] = "Intégration WoW DKP Bot"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:626
CLM.L["WotLK - 10"] = "WotLK - 10"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:631
CLM.L["WotLK - 25"] = "WotLK - 25"
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:191
CLM.L["Wowpedia"] = "Wowpedia"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:730
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:763
CLM.L["Wrist"] = "Poignets"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:137
CLM.L["XT-002 Deconstructor"] = "Déconstructeur XT-002"
-- ClassicLootManager/Utils.lua:513
CLM.L["Yes"] = "Oui"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:138
CLM.L["Yogg-Saron"] = "Yogg-Saron"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:307
CLM.L["You are already in an active raid. Leave or finish it before creating new one."] = "Vous êtes déjà dans un raid actif. Quittez-le ou terminez-le avant d'en créer un nouveau."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:609
CLM.L["You are not allowed to auction items"] = "Vous n'êtes pas autorisé à mettre d’objets aux enchères"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:465
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:499
CLM.L["You are not allowed to control raid."] = "Vous n'êtes pas autorisé à contrôler un raid."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:303
CLM.L["You are not allowed to create raids."] = "Vous n'êtes pas autorisé à créer un raid."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:436
CLM.L["You are not allowed to join raid."] = "Vous n'êtes pas autorisé à rejoindre un raid."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:325
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:397
CLM.L["You are not allowed to start raid."] = "Vous n'êtes pas autorisé à démarrer un raid."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:338
CLM.L["You are not in the raid."] = "Vous n'êtes pas dans le raid."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:632
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:641
CLM.L["You can %s max %d players from standby at the same time to a %s raid."] = "Vous pouvez %s max %d joueurs en attente en même temps à un raid %s."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:587
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:596
CLM.L["You can %s max %d players to standby at the same time to a %s raid."] = "Vous pouvez %s max %d joueurs en attente en même temps à un raid %s."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:469
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:503
CLM.L["You can only add players to standby of a progressing raid."] = "Vous ne pouvez ajouter des joueurs en attente qu’à un raid en cours."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:578
CLM.L["You can only bench players from same roster as the raid (%s)."] = "Vous ne pouvez mettre sur le banc que des joueurs du même roster que le raid (%s)."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:401
CLM.L["You can only end an active raid."] = "Vous ne pouvez terminer qu'un raid actif."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:440
CLM.L["You can only join an active raid."] = "Vous ne pouvez rejoindre qu'un raid actif."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:444
CLM.L["You can only join different raid than your current one."] = "Vous ne pouvez rejoindre qu’un raid différent de celui que vous avez actuellement."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:623
CLM.L["You can only remove from bench players from same roster as the raid (%s)."] = "Vous ne pouvez retirer du banc que les joueurs du même roster que le raid (%s)."
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:329
CLM.L["You can only start a freshly created raid."] = "Vous ne pouvez démarrer qu'un raid fraîchement créé."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:675
CLM.L["You can remove max %d players from roster at the same time."] = "Vous pouvez supprimer un maximum de %d joueurs du roster en même temps."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:333
CLM.L["Your bid (%s) was denied: |cffcc0000%s|r"] = "Votre enchère (%s) a été refusée : |cffcc0000%s|r"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:312
CLM.L["Your bid (%s) was |cff00cc00accepted|r"] = "Votre enchère (%s) a été |cff00cc00acceptée|r"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:67
CLM.L["Zero-Sum Bank Inflation"] = "Inflation de banque Zero-Sum"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1148
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:64
CLM.L["Zero-Sum Bank"] = "Banque Zero-Sum"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1156
CLM.L["Zero-Sum Inflation Value"] = "Valeur d'inflation Zero-Sum"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:439
CLM.L["Zero-Sum award"] = "Attribution Zero-Sum"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1142
CLM.L["Zero-Sum"] = "Zero-sum"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:374
CLM.L["Zul'Aman"] = "Zul'Aman"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:263
CLM.L["Zul'Gurub"] = "Zul'Gurub"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:107
CLM.L["Zul'jin"] = "Zul'jin"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:221
CLM.L["[All Roster Configs]: "] = "[Configurations de Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:227
CLM.L["[All Roster Default Slot Values]: "] = "[Toutes les valeurs d'emplacements par défaut de roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:205
CLM.L["[Alt-Main Link]: "] = "[Lien Reroll-Main]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:212
CLM.L["[Create Roster]: "] = "[Créer Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:215
CLM.L["[Delete Roster]: "] = "[Effacer Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:290
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:532
CLM.L["[IGNORE]: Ignoring entry"] = "[IGNORER] : Ignore l'entrée"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:274
CLM.L["[Item Award in Raid]: "] = "[Attribution d'objet en raid]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:271
CLM.L["[Item Award]: "] = "[Attribution d’objet]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:261
CLM.L["[Point Award to raid]: "] = "[Attribution de points au raid]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:258
CLM.L["[Point Award to roster]: "] = "[Attribution de points au Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:252
CLM.L["[Point Award]: "] = "[Attribution de points]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:264
CLM.L["[Point Decay for roster]: "] = "[Réduction de points pour le roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:255
CLM.L["[Point Decay]: "] = "[Réduction de points]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:267
CLM.L["[Point Set]: "] = "[Ensemble de points]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:208
CLM.L["[Profile Lock]: "] = "[Verrouiller le profil]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:278
CLM.L["[Raid Create]: "] = "[Créer le Raid]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:287
CLM.L["[Raid Finish]: "] = "[Terminer le Raid]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:281
CLM.L["[Raid Start]: "] = "[Débuter le Raid]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:284
CLM.L["[Raid Update]: "] = "[Mise à jour du raid]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:202
CLM.L["[Remove Profile]: "] = "[Supprimer le profil]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:218
CLM.L["[Rename Roster]: "] = "[Renommer le Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:245
CLM.L["[Roster Boss Kill Bonus]: "] = "[Bonus de boss tué pour le roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:224
CLM.L["[Roster Config]: "] = "[Configuration du Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:242
CLM.L["[Roster Copy]: "] = "[Copie du Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:230
CLM.L["[Roster Default Slot Value]: "] = "[Valeur d’emplacementpar défaut du roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:248
CLM.L["[Roster Field Rename]: "] = "[Renommer le champ du roster]:"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:236
CLM.L["[Roster Item Value Override Single]: "] = "[Remplacer la valeur d’un seul objet]"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:233
CLM.L["[Roster Item Value Override]: "] = "[Remplacement de la valeur d’objet]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:239
CLM.L["[Roster Update Profiles]: "] = "[Mettre à jour les profils du Roster]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:199
CLM.L["[Update Profile]: "] = "[Mettre à jour le profil]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:408
CLM.L["[config] "] = "[Configuration] "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:410
CLM.L["[item values] "] = "[Valeurs de l'objet] "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:411
CLM.L["[profiles] "] = "[profils] "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:409
CLM.L["[slot defaults] "] = "[Emplacements par défaut] "
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:59
CLM.L["accepted"] = "Accepté"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:588
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:597
CLM.L["add"] = "ajouter"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:46
CLM.L["cancel"] = "annuler"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:597
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:642
CLM.L["created"] = "créé"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:59
CLM.L["denied"] = "refusé"
-- ClassicLootManager_Integrations/Integrations.lua:343
CLM.L["else"] = "sinon"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:465
CLM.L["excluding negatives "] = "à l'exclusion des négatifs"
-- ClassicLootManager_Integrations/Integrations.lua:278
CLM.L["if reason/response contains"] = "Si la raison/réponse contient"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:58
CLM.L["level"] = "niveau"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:48
CLM.L["pass"] = "passer"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:588
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:633
CLM.L["progressing"] = "en progression"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:61
CLM.L["rank"] = "rang"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:633
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:642
CLM.L["remove"] = "retirer"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:139
CLM.L["request"] = "demande"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:42
CLM.L["requested"] = "demandé"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:149
CLM.L["revoke"] = "révoquer"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:72
CLM.L["revoked"] = "révoqué"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:98
CLM.L["roster"] = "roster"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:98
CLM.L["rosters"] = "rosters"
-- ClassicLootManager_Integrations/Integrations.lua:288
CLM.L["then"] = "alors"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:65
CLM.L["unguilded"] = "sans guilde"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1127
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1199
CLM.L["|cff00ee44Open:|r English Auction with highest bidder announcement. Highest bidder wins. Two players can not bid same value. Additionally always allows bidding base to accomodate for Swedish Auction flavor.\n\n|cff00ee44Anonymous Open:|r Same as Open but highest bidder name is not disclosed.\n\n|cff00ee44Sealed:|r Bids are not announced. Highest bidder wins.\n\n|cff00ee44Vickrey:|r Same as sealed but winner pays with second-highest bid."] = "|cff00ee44Ouverte:|r Enchère avec annonce de la plus haute offre. Le joueur avec la plus grosse offre remporte l’enchère. Deux joueurs ne peuvent pas proposer la même valeur d’offre.\n\n|cff00ee44Anonyme Ouverte:|r Pareil qu’Ouverte mais le nom du plus haut enchérisseur n’est pas révélé.\n\n|cff00ee44Fermée:|r Offresnon annoncées. L’offre la plus haute l’emporte.\n\n|cff00ee44Vickrey:|r Pareil que fermée mais le vainqueur paie avec la 2e offre la plus élevée."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:980
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1135
CLM.L["|cff00ee44Single-Priced:|r Static value mode. Only bidding Base value is supported.\n\n|cff00ee44Ascending:|r Ranged value mode. Allows bidding any value in |cff44ee00<base, max>|r.\n\n|cff00ee44Tiered:|r Ranged value mode. Allows bidding only specific values. Up to 5 tiers are configurable in |cff44ee00<base, small, medium, large, max>|r."] = "|cff00ee44Prix unique:|r Mode à valeur fixe. Seule la Valeur d’offre de base est supportée.n\n|cff00ee44Montante:|r Mode à intervalle de valeur. Permet d’offrir n’importe quelle valeur entre |cff44ee00<base, max>|r.\n\n|cff00ee44Par niveau:|r Mode à intervalle de valeur. Permet d’offrir uniquement des valeurs spécifiques. Jusqu’à 5 valeurs sont configurables dans |cff44ee00<base, petit, médium, grand, max>|r."
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:54
CLM.L["|cffcc0000Your Classic Loot Manager is significantly out of date.|r AddOn communication has been disabled. Version %s is available. Please update as soon as possible."] = "|cffcc0000Classic Loot Manager est obsolète.|r La communication de l’addon a été désactivée. La version %s est disponible. Veuillez mettre à jour dès que possible."
end