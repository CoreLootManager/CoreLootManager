local _, CLM = ...
if GetLocale() == "zhCN" then
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:323
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:349
CLM.L[" alt of: "] = " 的主号是: "
-- ClassicLootManager/Utils.lua:584
CLM.L[" more"] = " 更多"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:173
CLM.L[" over "] = " over "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:396
CLM.L[" profile(s)"] = " 角色信息"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:28
CLM.L["!bid"] = "!bid"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:29
CLM.L["!bidos"] = "!bidos"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:57
CLM.L["!dkp"] = "!dkp"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:278
CLM.L["% that will be decayed."] = "% 将要被衰减"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:344
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:393
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:408
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:454
CLM.L["%Y/%m/%d %H:%M:%S (%A)"] = "%Y/%m/%d %H:%M:%S (%A)"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:253
-- ClassicLootManager_Integrations/Models/Exporter.lua:331
-- ClassicLootManager_Integrations/Models/Exporter.lua:332
CLM.L["%Y/%m/%d %a %H:%M:%S"] = "%Y/%m/%d %a %H:%M:%S"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:591
CLM.L["%d/%m/%Y %H:%M:%S"] = "%d/%m/%Y %H:%M:%S"
-- ClassicLootManager_Alerts/Alerts.lua:23
CLM.L["%s %% %s decay"] = "%s %% %s 衰减"
-- ClassicLootManager_Alerts/Alerts.lua:21
CLM.L["%s %s"] = "%s %s"
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:191
CLM.L["%s awarded to %s for %s %s"] = "%s 分配给 %s for %s %s"
-- ClassicLootManager/MinimapIcon.lua:37
CLM.L["%s events (%s pending)"] = "%s 记录 (%s pending)"
-- ClassicLootManager/MinimapIcon.lua:39
CLM.L["%s events (0x%x)"] = "%s 记录 (0x%x)"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:38
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:68
CLM.L["%s has %s standby"] = "%s %s 替补"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:59
CLM.L["%s is not part of the %s roster"] = "%s 不在名册 %s 中"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:166
CLM.L["%s profile exists."] = "%s 角色信息已存在。"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:168
CLM.L["%s profile missing. Adding."] = "%s 角色信息缺失，正在添加。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:480
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:490
CLM.L["%s to %s for %s in <%s>"] = "%s to %s for %s in <%s>"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:989
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:997
CLM.L["%s to be awarded to player when joining roster."] = "%s 将奖励给加入名单时的玩家。"
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:172
CLM.L["%s trade me for %s"] = "%s 交易我为 %s"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:174
CLM.L["%s was not found in guild."] = "%s 不在公会中。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:101
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:101
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:102
CLM.L["-- All --"] = "-- 全部 --"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:170
CLM.L["10 Player (Heroic)"] = "10人（英雄）"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:168
CLM.L["10 Player"] = "10人"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:173
CLM.L["20 Player"] = "20人"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:171
CLM.L["25 Player (Heroic)"] = "25人（英雄）"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:169
CLM.L["25 Player"] = "25人"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:172
CLM.L["40 Player"] = "40人"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:90
CLM.L["<CLM> %s not present in any roster."] = "<CLM> %s 不在任何名册中。"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:92
CLM.L["<CLM> %s standings in %d %s:"] = "<CLM> %s 积分榜 in %d %s:"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:101
CLM.L["<CLM> %s: %d DKP (%d this week)."] = "<CLM> %s: %d DKP (%d 本周)."
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:71
CLM.L["<CLM> Missing profile for player %s."] = "<CLM> 角色信息缺失 %s."
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:51
CLM.L["<CLM> Your bid (%s) was %s%s."] = "<CLM> 您的竞拍 (%s) 是 %s%s."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:889
CLM.L["Accepting rolls on %s for %s %s"] = "接受 %s 以 %s %s 接受卷"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:150
CLM.L["Action context"] = "动作选定范围"
-- ClassicLootManager_Integrations/Integrations.lua:160
CLM.L["Action to take upon Gargul loot award event happening during raid."] = "对团本活动期间发生的 Gargul 战利品分配事件采取的行动。"
-- ClassicLootManager_Integrations/Integrations.lua:265
CLM.L["Action to take upon RCLC loot award event happening during raid. Trigger is based on RCLC award reason or player response if reason is not used. On Integration Enable the buttons will be prefilled with existing ones."] = "对团本活动期间发生的 RCLC 战利品分配事件采取的行动。触发基于 RCLC 分配原因，如果未填写原因，则基于玩家回复。On Integration Enable the buttons will be prefilled with existing ones."
-- ClassicLootManager_Integrations/GenericImport.lua:181
CLM.L["Add Profiles to Rosters"] = "将角色信息添加到名册"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:122
CLM.L["Add currently selected target to list."] = "将当前选中的目标添加到列表中。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:121
CLM.L["Add target"] = "添加目标"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:142
CLM.L["Add to roster"] = "添加到名册"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:592
CLM.L["Add to standby"] = "添加到替补名单"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:396
CLM.L["Add"] = "添加"
-- ClassicLootManager_Integrations/Migration.lua:381
CLM.L["Adding %s loot entries for team to %s"] = "添加 %s 战利品给团队到 %s"
-- ClassicLootManager_Integrations/Migration.lua:240
-- ClassicLootManager_Integrations/Migration.lua:359
CLM.L["Adding %s profiles to %s"] = "添加 %s 角色信息到 %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:1009
CLM.L["Adding missing %s players to current roster"] = "添加缺少的 %s 角色到当前名册"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1310
CLM.L["Additional cost (tax) to add to the award value."] = "在物品分值上增加额外的数值（税）。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1278
CLM.L["Additional points to be given to players atop of the split value."] = "Additional points to be given to players atop of the split value."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:151
CLM.L["Addon sounds"] = "插件声音"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:143
CLM.L["Adds selected players to the selected roster (from dropdown)."] = "将选中的角色添加到选中的名册中。"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:162
CLM.L["Advance to next item after bid"] = "出价后前往下一个项目"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:221
CLM.L["Affected players:"] = "相关角色："
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:105
CLM.L["Akil'zon"] = "埃基尔松"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:87
CLM.L["Al'ar"] = "奥"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:128
CLM.L["Algalon the Observer"] = "观察者奥尔加隆"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:406
CLM.L["All In"] = "All In"
-- ClassicLootManager_Integrations/Migration.lua:29
CLM.L["All migration entries were commited and executed. Congratulations!"] = "所有迁移条目均已提交并执行。恭喜！"
-- ClassicLootManager/Modules/GUI/Filters.lua:178
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:20
CLM.L["All"] = "全部"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:76
CLM.L["Allow bidding below minimum points"] = "允许低于最低分数的竞拍"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1287
CLM.L["Allow biding more than current standings and ending up with less than minimum standings."] = "允许出价超过个人当前分数，结算后低于最低分数。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1286
CLM.L["Allow biding more than current standings"] = "允许高于当前积分的竞拍"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1247
CLM.L["Allow equal bids"] = "允许出相同竞拍价"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:73
CLM.L["Allow going below minimum points"] = "允许低于最低分数"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:156
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1012
CLM.L["Allow players to subscribe to the bench through Raids menu"] = "允许玩家通过团本活动菜单订阅替补名单"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:155
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:133
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1011
CLM.L["Allow subscription"] = "允许订阅"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:581
CLM.L["Alt"] = "Alt"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1239
CLM.L["Always allow All-In bids"] = "始终允许All-In"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1231
CLM.L["Always allow Base bids"] = "始终允许基础价格"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1113
CLM.L["Always allow cancel/pass"] = "始终允许取消/跳过"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:75
CLM.L["Always show"] = "Always show"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:871
CLM.L["Americas"] = "美洲"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:820
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:853
CLM.L["Ammo"] = "弹药"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:101
CLM.L["Anetheron"] = "安纳塞隆"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:349
CLM.L["Announce award to Guild"] = "通告分配到公会频道"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:183
CLM.L["Announce loot from corpse to Raid"] = "从BOSS尸体上通告战利品到团队频道"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:179
CLM.L["Announce loot"] = "通告战利品"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:201
CLM.L["Announcement loot rarity"] = "通告战利品稀有度"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:721
CLM.L["Anonymous Open"] = "Anonymous Open"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1136
CLM.L["Anti-snipe time"] = "延长时间"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:783
CLM.L["Anti-snipe time: %s."] = "延长时间: %s."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:236
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:70
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:502
CLM.L["Anti-snipe"] = "延长"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:35
CLM.L["Anub'Rekhan"] = "阿努布雷坎"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:142
CLM.L["Anub'arak"] = "阿努巴拉克"
-- ClassicLootManager/Tooltips.lua:37
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:67
CLM.L["Any"] = "任何"
-- ClassicLootManager_Integrations/GUI.lua:138
CLM.L["April"] = "四月"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:124
CLM.L["Archavon the Stone Watcher"] = "岩石看守者阿尔卡冯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:104
CLM.L["Archimonde"] = "阿克蒙德"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:168
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:331
CLM.L["Are you sure, you want to award %s to %s for %s %s?"] = "你确定，你想要分配 %s 给 %s for %s %s?"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:359
CLM.L["Are you sure, you want to disenchant %s?"] = "您确定，您想贬低%s吗？"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:748
CLM.L["Ascending"] = "Ascending"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:224
CLM.L["Assistant"] = "Assistant"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:388
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:399
CLM.L["Att. [%]"] = "出勤 [%]"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:408
CLM.L["Attendance"] = "出勤"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:67
CLM.L["Attumen the Huntsman"] = "猎手阿图门"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:254
CLM.L["Auction End Countdown"] = "拍卖结束倒计时"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:222
-- ClassicLootManager/MinimapIcon.lua:109
CLM.L["Auction History"] = "拍卖历史记录"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:238
CLM.L["Auction Start/End"] = "拍卖开始/结束"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:235
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:67
CLM.L["Auction Time"] = "拍卖时间"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:55
CLM.L["Auction Type"] = "拍卖类型"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:83
CLM.L["Auction column"] = "Auction column"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:675
CLM.L["Auction complete"] = "拍卖完成"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:272
CLM.L["Auction finished"] = "拍卖结束"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1128
CLM.L["Auction length in seconds."] = "拍卖时长（以秒为单位）。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:492
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1127
CLM.L["Auction length"] = "拍卖时长"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:775
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:252
CLM.L["Auction of %s items."] = "拍卖 %s 物品。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:777
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:256
CLM.L["Auction of %s"] = "拍卖 %s"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:479
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1070
CLM.L["Auction settings"] = "拍卖设置"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:666
CLM.L["Auction stopped by Master Looter"] = "被Master Looter停止拍卖"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:781
CLM.L["Auction time: %s."] = "拍卖时间: %s."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:171
CLM.L["Auction timer bar width"] = "拍卖定时器条宽度"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1198
CLM.L["Auction type"] = "拍卖类型"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:475
CLM.L["Auctioning - Chat Commands"] = "拍卖 - 聊天频道指令"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:55
CLM.L["Auctioning - History"] = "拍卖 - 历史记录"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:386
CLM.L["Auctioning - List Filling"] = "拍卖 - 清单填充"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:622
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:630
CLM.L["Auctioning requires active raid or roster mode."] = "拍卖需要团本活动正在进行或名册模式。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:668
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:345
-- ClassicLootManager/MinimapIcon.lua:104
CLM.L["Auctioning"] = "拍卖"
-- ClassicLootManager_Integrations/GUI.lua:142
CLM.L["August"] = "八月"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:129
CLM.L["Auriaya"] = "欧尔莉亚"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:658
CLM.L["Author"] = "执行者"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:147
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:121
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1019
CLM.L["Auto bench leavers"] = "退出团队自动加入替补名单"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:367
CLM.L["Auto-assign from corpse"] = "从尸体上自动分配"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:376
CLM.L["Auto-trade after award"] = "分配后自动交易"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:455
CLM.L["Automatically mark auto-removed items as disenchanted"] = "自动将自动驱动的物品标记为污点"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:430
CLM.L["Average weeks"] = "平均周数"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:248
CLM.L["Award %s %s to %s selected players."] = "分配 %s %s 分数给 %s 选中的角色。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:242
CLM.L["Award %s %s to everyone in raid."] = "分配 %s %s 分数给团队中的所有人。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:244
CLM.L["Award %s %s to everyone in roster."] = "分配 %s %s 分数给名册中的所有人。"
-- ClassicLootManager_Integrations/Integrations.lua:675
CLM.L["Award for Base"] = "分配 for Base"
-- ClassicLootManager_Integrations/Integrations.lua:674
CLM.L["Award for Free"] = "分配 for Free"
-- ClassicLootManager_Integrations/Integrations.lua:678
CLM.L["Award for Large"] = "分配 for Large"
-- ClassicLootManager_Integrations/Integrations.lua:679
CLM.L["Award for Max"] = "分配 for Max"
-- ClassicLootManager_Integrations/Integrations.lua:677
CLM.L["Award for Medium"] = "分配 for Medium"
-- ClassicLootManager_Integrations/Integrations.lua:676
CLM.L["Award for Small"] = "分配 for Small"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:195
CLM.L["Award item"] = "分配物品"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:932
CLM.L["Award points only to online players"] = "仅对在线角色奖励分数"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:941
CLM.L["Award points only to players in same zone"] = "仅对同一区域的角色奖励分数"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:194
CLM.L["Award points to players based on context."] = "根据所选范围向玩家奖励分数。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:183
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:136
CLM.L["Award value"] = "分值"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:193
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:145
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:198
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:235
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:268
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1170
-- ClassicLootManager/MinimapIcon.lua:123
CLM.L["Award"] = "分配"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:453
CLM.L["Awarded %s points for %s to all players in raid %s"] = "已分配 %s 分数 for %s 给在团本活动 %s 中的所有角色"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:429
CLM.L["Awarded %s points to %s players for %s in <%s>"] = "已分配 %s 分数给 %s 角色 for %s 在 <%s> 中"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:445
CLM.L["Awarded %s points to all players for %s in <%s>"] = "已分配 %s 分数给所有角色 for %s 在 <%s> 中"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:176
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:242
CLM.L["Awarded by"] = "执行者"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:65
CLM.L["Ayamiss the Hunter"] = "狩猎者阿亚米斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:103
CLM.L["Azgalor"] = "阿兹加洛"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:799
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:832
CLM.L["Back"] = "背部"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:819
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:852
CLM.L["Bag"] = "背包"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:159
CLM.L["Baltharus the Warborn"] = "战争之子巴尔萨鲁斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:12
CLM.L["Baron Geddon"] = "迦顿男爵"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:374
CLM.L["Base value for Static-Priced auction.\nMinimum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "静态定价拍卖的基值。\n升序和分层拍卖的最小值。\n\n设置为与其他层相同的值或负值忽略。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:901
CLM.L["Base"] = "Base"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:28
CLM.L["Battleguard Sartura"] = "沙尔图拉"
-- ClassicLootManager_Integrations/GUI.lua:316
-- ClassicLootManager_Integrations/GUI.lua:323
-- ClassicLootManager_Integrations/GUI.lua:330
CLM.L["Begin %d days ago, finish today."] = "Begin %d days ago, finish today."
-- ClassicLootManager_Integrations/GUI.lua:249
CLM.L["Begin Day"] = "开始日"
-- ClassicLootManager_Integrations/GUI.lua:260
CLM.L["Begin Month"] = "开始月份"
-- ClassicLootManager_Integrations/GUI.lua:271
CLM.L["Begin Year"] = "开始年份"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1027
CLM.L["Bench multiplier"] = "替补系数"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1005
CLM.L["Bench"] = "替补名单"
-- ClassicLootManager_Alerts/Alerts.lua:33
CLM.L["Bid %s accepted!"] = "竞拍 %s 被接受！"
-- ClassicLootManager_Alerts/Alerts.lua:41
CLM.L["Bid %s denied!"] = "竞拍 %s 被拒绝！"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:862
CLM.L["Bid accepted!"] = "竞拍 被接受！"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1314
CLM.L["Bid cancelling not allowed"] = "不允许取消竞拍"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:866
CLM.L["Bid denied!"] = "竞拍 被拒绝！"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1312
CLM.L["Bid increment too low"] = "竞拍增量过低"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:325
CLM.L["Bid input values as Main spec bid."] = "竞拍输入值作为主天赋。"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:351
CLM.L["Bid input values as Off spec bid."] = "竞拍输入值作为副天赋。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1310
CLM.L["Bid too high"] = "出价过高"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1309
CLM.L["Bid too low"] = "出价过低"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:407
CLM.L["Bid your current DKP (%s)."] = "Bid your current DKP (%s)."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:745
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:324
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:697
CLM.L["Bid"] = "竞拍"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1308
CLM.L["Bidding over current standings not allowed"] = "竞拍不允许高于当前积分"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1307
CLM.L["Bidding while below minimum standings not allowed"] = "竞拍不得低于最低积分"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:550
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:132
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:219
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:808
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1098
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1191
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1090
-- ClassicLootManager/MinimapIcon.lua:119
CLM.L["Bidding"] = "竞拍"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:270
CLM.L["Bids"] = "竞拍"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:127
CLM.L["Bindings"] = "按键绑定"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:354
CLM.L["Black Temple"] = "黑暗神殿"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:217
CLM.L["Blackwing Lair"] = "黑翼之巢"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:147
CLM.L["Blood Council"] = "鲜血王子议会"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:56
CLM.L["Bloodlord Mandokir"] = "血领主曼多基尔"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:848
CLM.L["Bonuses"] = "奖励"
-- ClassicLootManager/ClassicLootManager.lua:271
CLM.L["Boot complete"] = "启动完成"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:79
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:237
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:79
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:521
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:854
CLM.L["Boss Kill Bonus"] = "BOSS击杀奖励"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1189
CLM.L["Boss kill award values"] = "Boss击杀分值"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:20
CLM.L["Broodlord Lashlayer"] = "勒什雷尔"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:112
CLM.L["Brutallus"] = "布鲁塔卢斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:64
CLM.L["Buru the Gorger"] = "吞咽者布鲁"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1036
CLM.L["Button Names"] = "按钮名称"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:34
CLM.L["C'Thun"] = "克苏恩"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:855
CLM.L["Can't use"] = "无法使用"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:337
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:504
CLM.L["Cancel your bid."] = "取消您的出价。"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:295
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:423
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:336
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:503
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:859
CLM.L["Cancel"] = "取消"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:773
CLM.L["Change roster name."] = "更改名册名称。"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:13
CLM.L["Changelog"] = "更新日志"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:172
CLM.L["Changes auction timer bar width."] = "更改拍卖定时器条宽度。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1318
CLM.L["Changing bid from Main-spec to Off-Spec not allowed"] = "不允许将出价从主天赋改为副天赋"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:68
CLM.L["Channel for posting bids."] = "通告竞拍的频道。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:246
CLM.L["Chat Commands"] = "聊天频道指令"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:56
CLM.L["Chat bidding is currently disabled."] = "聊天指令竞标目前被禁用。"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:75
CLM.L["Chess Event"] = "国际象棋赛事"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:801
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:834
CLM.L["Chest (robes)"] = "胸部（长袍）"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:800
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:833
CLM.L["Chest"] = "胸部"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:24
CLM.L["Chromaggus"] = "克洛玛古斯"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:653
CLM.L["Classic"] = "Classic"
-- ClassicLootManager/Modules/GUI/Filters.lua:192
CLM.L["Clear all classes."] = "清除所有职业。"
-- ClassicLootManager_Integrations/GUI.lua:474
CLM.L["Clear output"] = "清除输出"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:274
CLM.L["Clear"] = "清除"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:154
CLM.L["Close on bid"] = "竞拍后关闭"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:217
CLM.L["Comma-separated (CSV) list of disenchanter names. Case insensitive."] = "逗号分隔（CSV）删除名称列表。 不区分大小写。"
-- ClassicLootManager/Utils.lua:1063
CLM.L["Common"] = "常见"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:310
-- ClassicLootManager/MinimapIcon.lua:138
-- ClassicLootManager_Integrations/GUI.lua:18
CLM.L["Configuration"] = "配置"
-- ClassicLootManager_Integrations/GenericImport.lua:175
CLM.L["Configure Rosters"] = "配置名单"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:809
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:817
CLM.L["Copy settings from selected roster."] = "从选中的名册复制设置。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:802
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:808
CLM.L["Copy settings"] = "复制设置"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:816
CLM.L["Copy source"] = "复制源"
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:259
CLM.L["Core Loot Manager %s initialization complete. %s"] = "Core Loot Manager %s 初始化完成。%s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI.lua:271
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:13
CLM.L["Core Loot Manager"] = "Core Loot Manager"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:526
CLM.L["Correcting error"] = "纠正错误"
-- ClassicLootManager_Tracker/Auction.lua:10
CLM.L["Count"] = "Count"
-- ClassicLootManager_Integrations/GenericImport.lua:178
CLM.L["Create Profiles"] = "创建角色信息"
-- ClassicLootManager_Integrations/GenericImport.lua:172
CLM.L["Create Rosters"] = "创建名册"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:195
CLM.L["Create new raid with provided name. You will automatically join this raid and leave any other you are part of."] = "使用提供的名称创建新的团本活动。您将自动加入此团本活动并离开您所属的任何其他活动。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:500
CLM.L["Create raid %s %s in <%s>"] = "创建团本活动 %s %s in <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:194
CLM.L["Create raid"] = "创建团本活动"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1324
-- ClassicLootManager_Integrations/Integrations.lua:251
CLM.L["Create"] = "新建"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:812
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:262
CLM.L["Created"] = "已创建"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1325
CLM.L["Creates new roster with default configuration"] = "使用默认配置创建新名册"
-- ClassicLootManager_Integrations/Integrations.lua:252
CLM.L["Creates new trigger to be used during RCLC award."] = "创建要在 RCLC 奖励期间使用的新触发器。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:583
CLM.L["Ctrl + Alt"] = "Ctrl + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:580
CLM.L["Ctrl"] = "Ctrl"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:754
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:706
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1098
CLM.L["Current"] = "当前的"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:657
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:658
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:659
CLM.L["DF"] = "DF"
-- ClassicLootManager/Tooltips.lua:114
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:385
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:448
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:458
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:481
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:387
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:172
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:188
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:186
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:335
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1133
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:298
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1094
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:697
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:988
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:989
-- ClassicLootManager/Utils.lua:1048
CLM.L["DKP"] = "DKP"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:157
CLM.L["DPS"] = "DPS"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:336
CLM.L["Danger Zone - Use at own risk"] = "危险区 - 使用风险自负"
-- ClassicLootManager_Integrations/GUI.lua:222
CLM.L["Data"] = "数据"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:271
CLM.L["Date"] = "日期"
-- .:indirectly
CLM.L["Death Knight"] = "Death Knight"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:148
CLM.L["Deathbringer Saurfang"] = "死亡使者萨鲁法尔"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:277
CLM.L["Decay %"] = "衰减 %"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:359
CLM.L["Decay %s%% %s to %s selected players."] = "衰减 %s%% %s 分数对 %s 选中的角色。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:355
CLM.L["Decay %s%% %s to everyone in roster."] = "衰减 %s%% %s 分数对名册中的所有人。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:305
CLM.L["Decay Negatives"] = "衰减负数"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:319
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:532
CLM.L["Decay"] = "衰减"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:437
CLM.L["Decayed %s%% points to %s players in <%s>"] = "衰减 %s%% 分数对 %s 角色在 <%s> 中"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:461
CLM.L["Decayed %s%% points to all players %s in <%s>"] = "衰减 %s%% 分数对所有角色 %s 在 <%s>中"
-- ClassicLootManager_Integrations/GUI.lua:146
CLM.L["December"] = "十二月"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:861
CLM.L["Default Boss Kill Bonus Value"] = "默认BOSS击杀奖励分值"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:82
CLM.L["Default Boss Kill Bonus value"] = "默认BOSS击杀奖励分值"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1164
CLM.L["Default slot values"] = "默认槽位分值"
-- .:indirectly
CLM.L["Demon Hunter"] = "Demon Hunter"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:657
CLM.L["Description"] = "描述"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:341
CLM.L["Disable data synchronisation"] = "禁用数据同步"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:342
CLM.L["Disable data synchronisation. This might lead to unexpected consequences. Use this at your own risk. Requires /reload to apply."] = "禁用数据同步。这可能会导致意想不到的后果。使用它需要您自担风险。需要 /reload 才能应用。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:578
CLM.L["Disable"] = "禁用"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:37
CLM.L["Disables display of the changelog for any new version."] = "禁止显示任何新版本的更新日志。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:454
CLM.L["Disenchant removed items"] = "删除的物品"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:343
-- ClassicLootManager/Utils.lua:1075
-- ClassicLootManager_Integrations/Integrations.lua:680
CLM.L["Disenchant"] = "脱心"
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:242
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:26
CLM.L["Disenchanted"] = "被迷住了"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:211
CLM.L["Disenchanters"] = "脱衣机"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:283
CLM.L["Display price"] = "显示物品分值"
-- ClassicLootManager/Utils.lua:1071
--CLM.L["Do Nothing"] = ""
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:78
CLM.L["Do not show again"] = "不再显示"
-- .:indirectly
CLM.L["Druid"] = "德鲁伊"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1083
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1183
CLM.L["Dynamic Item values"] = "动态物品分值"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:397
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:440
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:442
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:551
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:558
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:988
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:989
-- ClassicLootManager/Utils.lua:1053
CLM.L["EP"] = "EP"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:557
-- ClassicLootManager/Utils.lua:1055
CLM.L["EP/GP"] = "EP/GP"
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:196
CLM.L["EPGP WEB"] = "EPGP WEB"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:698
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1042
CLM.L["EPGP"] = "EPGP"
-- ClassicLootManager_Integrations/GenericImport.lua:246
-- ClassicLootManager_Integrations/ImportCSV.lua:153
CLM.L["ERROR - invalid import data"] = "错误 - 无效的导入数据"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:22
CLM.L["Ebonroc"] = "埃博诺克"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:59
CLM.L["Edge of Madness"] = "疯狂之缘"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:125
CLM.L["Emalon the Storm Watcher"] = "风暴看守者埃玛尔隆"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:480
CLM.L["Enable !dkp and !bid through whisper / raid. Change requires /reload."] = "启用 !dkp 和 !bid 通过密语/团队频道 。更改请重新加载界面。"
-- ClassicLootManager_Integrations/Integrations.lua:123
CLM.L["Enable Gargul integration. This will allow Gargul to take control over some aspects of CLM (starting auction from Gargul, and awarding)."] = "启用 Gargul 集成。这将允许 Gargul 控制 CLM 的某些方面（从 Gargul 开始拍卖及分配）。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1106
CLM.L["Enable OS bids"] = "启用副天赋出价"
-- ClassicLootManager_Integrations/Integrations.lua:238
CLM.L["Enable RCLC integration. This will allow awarding DKP/GP points on RCLC item award. Requires /reload."] = "启用 RCLC 集成。这将允许通过 RCLC 物品分配获得DKP/GP分数。更改请重新加载界面。"
-- ClassicLootManager_Integrations/Integrations.lua:361
CLM.L["Enable WoW DKP Bot Integration. This will result in additional data stored upon logout."] = "启用 WoW DKP 机器人集成。这会在注销时存储额外的数据。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:239
CLM.L["Enable announcing auction start and end."] = "启用通告宣布拍卖开始和结束。"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:137
CLM.L["Enable auto-update bid values when current highest bid changes (open auction only)."] = "启用当前最高出价发生变化时自动更新价格（仅限公开拍卖）。"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:136
CLM.L["Enable auto-update bid values"] = "启用自动更新竞拍值"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:479
CLM.L["Enable chat commands"] = "启用聊天频道指令"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:59
CLM.L["Enable item tracking information in tooltip display."] = "Enable item tracking information in tooltip display."
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:368
CLM.L["Enable loot auto-assign (Master Looter UI) from corpse when item is awarded"] = "启用从尸体上自动分配物品（队长分配）"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1270
CLM.L["Enable paid value splitting amongst raiders."] = "Enable paid value splitting amongst raiders."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1232
CLM.L["Enable to allow base bids even if higher bids are present if player didn't bid yet. Affects Open-Ascending Auction."] = "启用在玩家尚未出价的情况下，即使已有更高的出价，也允许基础出价。影响开放式拍卖(Open-Ascending)。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1248
CLM.L["Enable to allow equal bids. Affects Open-Ascending Auction."] = "启用允许相同的出价。影响开放式拍卖(Open-Ascending)。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1240
CLM.L["Enable to always allow All-In bids. Affects Open-Ascending Auction."] = "启用始终允许All-in出价。影响开放式拍卖(Open-Ascending)。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1114
CLM.L["Enable to always allow cancelling or passing bids. Affects Open-Ascending Auction."] = "启用始终允许取消或跳过出价。影响开放式拍卖(Open-Ascending)。"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:58
CLM.L["Enable tooltip display"] = "Enable tooltip display"
-- ClassicLootManager/MinimapIcon.lua:78
CLM.L["Enables / disables minimap Icon"] = "启用/禁用小地图图标"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:32
CLM.L["Enables / disables verbose data printing during logging"] = "启用/禁用在记录期间print详细数据"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:247
CLM.L["Enables announcing chat commands at auction start."] = "启用在拍卖开始时通告聊天频道指令。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:263
CLM.L["Enables announcing loot awards."] = "启用通告战利品。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:271
CLM.L["Enables announcing new highest bid (when applicable)."] = "启用通告新的最高出价（如果适用）。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:230
CLM.L["Enables announcing raid start and end."] = "启用通告团本活动开始和结束。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:377
CLM.L["Enables auto-trade awarded loot after auctioning from bag"] = "启用背包拍卖后自动交易战利品"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:284
CLM.L["Enables displaying item price on tooltip."] = "启用在Tooltip上显示物品分值。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:255
CLM.L["Enables raid-warning countdown for auctions."] = "启用团队通知拍卖倒计时。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:744
CLM.L["End Timetravel"] = "结束时间旅行模式"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:401
CLM.L["End selected raid"] = "结束选中的团本活动"
-- ClassicLootManager/Utils.lua:1066
CLM.L["Epic"] = "史诗"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:478
CLM.L["Equation"] = "方程"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:114
CLM.L["Eredar Twins"] = "艾瑞达双子"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:870
CLM.L["Europe"] = "欧洲"
-- .:indirectly
CLM.L["Evoker"] = "Evoker"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:320
CLM.L["Execute decay for players based on context."] = "根据所选范围为角色执行衰减。"
-- ClassicLootManager_Integrations/Migration.lua:53
CLM.L["Execute migration again if you are sure this is correct."] = "如果您确定这是正确的，请再次执行迁移。"
-- ClassicLootManager_Integrations/Migration.lua:444
CLM.L["Execute migration from MonolithDKP, EssentialDKP, CommunityDKP, BastionLoot or CEPGP"] = "从 MonolithDKP、EssentialDKP, CommunityDKP, BastionLoot 或 CEPGP 执行迁移"
-- ClassicLootManager_Integrations/Migration.lua:59
CLM.L["Executing Addon Migration with comms disabled."] = "在禁用通信的情况下执行插件迁移。"
-- ClassicLootManager_Integrations/Migration.lua:50
CLM.L["Executing migration even though ledger is not empty."] = "执行迁移，即使Ledger不是空的。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:508
CLM.L["Exponent / Base"] = "指数 /基础"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:500
CLM.L["Exponential scaling value used by the equations (Base for EPGPWeb, or Exponent for WoWpedia)"] = "方程式使用的指数缩放值（EPGPWEB的基础或WoWpedia指数）"
-- ClassicLootManager/MinimapIcon.lua:132
-- ClassicLootManager_Integrations/GUI.lua:398
-- ClassicLootManager_Integrations/GUI.lua:407
-- ClassicLootManager_Integrations/GUI.lua:484
-- ClassicLootManager_Integrations/GUI.lua:485
CLM.L["Export"] = "导出"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:84
CLM.L["Extend auction bid list with received item count information. Requires reload."] = "Extend auction bid list with received item count information. Requires reload."
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:67
CLM.L["Extend tooltip with more specific loot information."] = "Extend tooltip with more specific loot information."
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:66
CLM.L["Extended tooltip"] = "Extended tooltip"
-- ClassicLootManager/Modules/GUI/Filters.lua:79
CLM.L["External"] = "公会外"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:143
CLM.L["Faction Champions"] = "阵营冠军"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:37
CLM.L["False"] = "关闭"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:29
CLM.L["Fankriss the Unyielding"] = "顽强的范克瑞斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:84
CLM.L["Fathom-Lord Karathress"] = "深水领主卡拉瑟雷斯"
-- ClassicLootManager_Integrations/GUI.lua:136
CLM.L["February"] = "二月"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:807
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:840
CLM.L["Feet"] = "脚"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:113
CLM.L["Felmyst"] = "菲米丝"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:149
CLM.L["Festergut"] = "烂肠"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:390
CLM.L["Fill auction list from corpse"] = "将尸体掉落添加到拍卖清单"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:391
CLM.L["Fill auction list with items from corpse. Will happen only if you open the corpse loot window."] = "将尸体掉落添加到拍卖清单。只有在打开尸体战利品窗口时才会启用。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:408
CLM.L["Fill auction list with looted items"] = "将获得的战利品添加到拍卖清单"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:409
CLM.L["Fill auction list with looted items. This will automatically add all items you have received."] = "将获得的战利品添加到拍卖清单。这将自动添加您收到的所有物品。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:97
CLM.L["Fill from Guild"] = "从公会导入"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:109
CLM.L["Fill from Raid Roster"] = "从团队导入"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:400
CLM.L["Fill from corpse only if you are the Loot Master."] = "仅当您是Loot Master时才从尸体掉落添加。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:418
CLM.L["Fill from loot only if you are using Group Loot."] = "仅在使用队长分配时才从获得的战利品添加。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:110
CLM.L["Fill profile list with players in current raid roster."] = "从团队导入角色信息。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:98
CLM.L["Fill profile list with players with the minimum level and ranks."] = "根据选择的最低等级和会阶导入角色信息。"
-- ClassicLootManager/Modules/GUI/Filters.lua:163
CLM.L["Filter"] = "过滤器"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:808
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:841
CLM.L["Finger"] = "手指"
-- ClassicLootManager_Integrations/GUI.lua:282
CLM.L["Finish Day"] = "完成日"
-- ClassicLootManager_Integrations/GUI.lua:293
CLM.L["Finish Month"] = "完成月份"
-- ClassicLootManager_Integrations/GUI.lua:304
CLM.L["Finish Year"] = "完成年份"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:524
CLM.L["Finished raid %s"] = "已完成的团本活动 %s"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:814
CLM.L["Finished"] = "已完成"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:21
CLM.L["Firemaw"] = "费尔默"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:130
CLM.L["Flame Leviathan"] = "烈焰巨兽"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:23
CLM.L["Flamegor"] = "弗莱格尔"
-- ClassicLootManager_Integrations/GUI.lua:233
CLM.L["Format"] = "格式"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:163
CLM.L["Found %s in guild."] = "已找到 %s 在公会中。"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:131
CLM.L["Freya"] = "弗蕾亚"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:220
CLM.L["GM"] = "Guild Master"
-- ClassicLootManager/Tooltips.lua:114
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:398
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:441
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:469
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:385
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:552
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:559
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:172
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:188
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:186
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:335
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1133
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:298
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:996
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:997
-- ClassicLootManager/Utils.lua:1051
CLM.L["GP"] = "GP"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:60
CLM.L["Gahz'ranka"] = "加兹兰卡"
-- ClassicLootManager_Integrations/Integrations.lua:116
-- ClassicLootManager_Integrations/Integrations.lua:122
CLM.L["Gargul Integration"] = "Gargul集成"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:11
CLM.L["Garr"] = "加尔"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:10
CLM.L["Gehennas"] = "基赫纳斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:62
CLM.L["General Rajaxx"] = "拉贾克斯将军"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:132
CLM.L["General Vezax"] = "维扎克斯将军"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:160
CLM.L["General Zarithrian"] = "萨瑞瑟里安将军"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:767
CLM.L["General settings"] = "通用设置"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:102
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:794
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:827
CLM.L["Global"] = "通用"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:40
CLM.L["Gluth"] = "格拉斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:15
CLM.L["Golemagg the Incinerator"] = "焚化者古雷曼格"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:46
CLM.L["Gothik the Harvester"] = "收割者戈提克"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:36
CLM.L["Grand Widow Faerlina"] = "黑女巫法琳娜"
-- ClassicLootManager/Utils.lua:1074
--CLM.L["Greed"] = ""
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:39
CLM.L["Grobbulus"] = "格罗布鲁斯"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:417
CLM.L["Group Loot Only"] = "仅组战利品"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:79
CLM.L["Gruul the Dragonkiller"] = "屠龙者格鲁尔"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:317
CLM.L["Gruul's Lair"] = "格鲁尔的巢穴"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:95
CLM.L["Gurtogg Bloodboil"] = "古尔图格·血沸"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:58
CLM.L["Hakkar"] = "哈卡"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:108
CLM.L["Halazzi"] = "哈尔拉兹"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:162
CLM.L["Halion"] = "海里昂"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:804
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:837
CLM.L["Hands"] = "手"
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:91
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:634
CLM.L["Hard Mode"] = "困难模式"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:106
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:973
CLM.L["Hard cap"] = "最大上限"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:795
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:828
CLM.L["Head"] = "头部"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:156
CLM.L["Healer"] = "治疗者"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:43
CLM.L["Heigan the Unclean"] = "肮脏的希尔盖"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:813
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:846
CLM.L["Held In Off-hand"] = "副手物品"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs_Retail.lua:41
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:658
CLM.L["Heroic"] = "Heroic"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:109
CLM.L["Hex Lord Malacrass"] = "妖术领主玛拉卡斯"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:203
CLM.L["Hide in combat"] = "隐藏在战斗中"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:489
CLM.L["Hides incoming !dkp and !bid whispers. Change requires /reload."] = "隐藏收到的 !dkp 和 !bid 密语。更改需要重新加载界面。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:498
CLM.L["Hides outgoing !dkp and !bid responses. Change requires /reload."] = "隐藏发出的 !dkp 和 !bid 密语。更改需要重新加载界面。"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:89
CLM.L["High Astromancer Solarian"] = "大星术师索兰莉安"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:78
CLM.L["High King Maulgar"] = "莫加尔大王"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:51
CLM.L["High Priest Thekal"] = "高阶祭司塞卡尔"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:52
CLM.L["High Priest Venoxis"] = "高阶祭司温诺希斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:53
CLM.L["High Priestess Arlokk"] = "高阶祭司娅尔罗"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:54
CLM.L["High Priestess Jeklik"] = "高阶祭司耶克里克"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:55
CLM.L["High Priestess Mar'li"] = "高阶祭司玛尔里"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:91
CLM.L["High Warlord Naj'entus"] = "高阶督军纳因图斯"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:136
CLM.L["History type"] = "历史记录类型"
-- .:indirectly
CLM.L["History"] = "历史记录"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:133
CLM.L["Hodir"] = "霍迪尔"
-- .:indirectly
CLM.L["Hunter"] = "猎人"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:81
CLM.L["Hydross the Unstable"] = "不稳定的海度斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:369
CLM.L["Hyjal Summit"] = "海加尔峰"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:486
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:603
CLM.L["Icecrown Citadel"] = "冰冠堡垒"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:151
CLM.L["Icecrown Gunship Battle"] = "冰冠炮舰战斗"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:134
CLM.L["Ignis the Furnace Master"] = "掌炉者伊格尼斯"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:98
CLM.L["Ignore entry"] = "忽略条目"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:463
CLM.L["Ignore"] = "忽略"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:99
CLM.L["Illidan Stormrage"] = "伊利丹·怒风"
-- ClassicLootManager_Integrations/Migration.lua:259
-- ClassicLootManager_Integrations/Migration.lua:393
-- ClassicLootManager_Integrations/Migration.lua:436
CLM.L["Import complete"] = "导入完成"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:531
-- ClassicLootManager_Integrations/GenericImport.lua:222
-- ClassicLootManager_Integrations/GenericImport.lua:255
-- ClassicLootManager_Integrations/GenericImport.lua:256
-- ClassicLootManager_Integrations/GenericImport.lua:263
-- ClassicLootManager_Integrations/ImportCSV.lua:100
-- ClassicLootManager_Integrations/ImportCSV.lua:162
-- ClassicLootManager_Integrations/ImportCSV.lua:163
-- ClassicLootManager_Integrations/ImportCSV.lua:191
CLM.L["Import"] = "导入"
-- ClassicLootManager_Integrations/Migration.lua:210
CLM.L["Importing %s entries from DKPTable"] = "正在导入 %s 条目从 DKPTable"
-- ClassicLootManager_Integrations/Migration.lua:321
CLM.L["Importing profiles from DKPTable"] = "从 DKPTable 导入角色信息"
-- ClassicLootManager/Modules/GUI/Filters.lua:78
CLM.L["In Guild"] = "在公会"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:813
CLM.L["In Progress"] = "进行中"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:290
-- ClassicLootManager/Modules/GUI/Filters.lua:75
CLM.L["In Raid"] = "在团队"
-- ClassicLootManager/MinimapIcon.lua:48
CLM.L["In-Sync"] = "同步中"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:139
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:124
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:923
CLM.L["Include bench"] = "包括替补"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:140
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:924
CLM.L["Include benched players in all auto-awards"] = "在所有自动奖励中包括替补角色"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:306
CLM.L["Include players with negative standings in decay."] = "包括在衰退中分数是负数的角色。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:311
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:319
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:327
--CLM.L["Include"] = ""
-- ClassicLootManager/MinimapIcon.lua:46
CLM.L["Incoherent state"] = "Incoherent state"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:261
CLM.L["Info"] = "信息"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:438
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:444
CLM.L["Information"] = "信息"
-- ClassicLootManager_Integrations/ImportCSV.lua:73
CLM.L["Input CSV Item value override data"] = "输入 CSV 物品分值覆盖数据"
-- ClassicLootManager_Integrations/GenericImport.lua:199
CLM.L["Input JSON exported standings"] = "输入 JSON 导出积分榜"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:158
CLM.L["Input name: %s"] = "输入名字: %s"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:45
CLM.L["Instructor Razuvious"] = "教官拉苏维奥斯"
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:136
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:141
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:146
-- ClassicLootManager_Integrations/ClassicLootManager_Integrations.lua:20
CLM.L["Integrations"] = "集成"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:100
CLM.L["Interval Bonus time"] = "时长奖励时间间隔"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:116
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:249
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:97
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:533
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:899
CLM.L["Interval Bonus"] = "时长奖励"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:123
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:251
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:906
CLM.L["Interval Time"] = "间隔时间"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:131
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:252
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:103
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:915
CLM.L["Interval Value"] = "时长奖励分值"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:907
CLM.L["Interval in [minutes] to award bonus points"] = "奖励分数的间隔 [分钟]"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1311
CLM.L["Invalid bid value"] = "无效的竞拍数值"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:353
CLM.L["Invalid context. You should not decay raid only."] = "无效的范围。你不应该只衰减团队。"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:16
CLM.L["Invalid item link"] = "无效的物品链接"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1317
CLM.L["Invalid item"] = "无效的物品"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:50
CLM.L["Invalid value provided"] = "提供的值无效"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:58
CLM.L["Item Value Mode"] = "物品分值模式"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1075
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1255
CLM.L["Item value mode"] = "物品分值模式"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:22
CLM.L["Item value must be positive"] = "物品分数必须为正"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1177
CLM.L["Item value overrides"] = "物品分数覆盖"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:90
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:100
CLM.L["Item"] = "物品"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:107
CLM.L["Jan'alai"] = "加亚莱"
-- ClassicLootManager_Integrations/GUI.lua:135
CLM.L["January"] = "一月"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:57
CLM.L["Jin'do the Hexxer"] = "妖术师金度"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:87
CLM.L["Join our discord for more info: "] = "加入我们的Discord以获取更多信息："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:415
CLM.L["Join selected raid"] = "加入选中的团本活动"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:535
CLM.L["Joining roster"] = "加入名册"
-- ClassicLootManager_Integrations/GUI.lua:141
CLM.L["July"] = "七月"
-- ClassicLootManager_Integrations/GUI.lua:140
CLM.L["June"] = "六月"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:90
CLM.L["Kael'thas Sunstrider"] = "凯尔萨斯·逐日者"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:111
CLM.L["Kalecgos"] = "卡雷苟斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:300
CLM.L["Karazhan"] = "卡拉赞"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:102
CLM.L["Kaz'rogal"] = "卡兹洛加"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:49
CLM.L["Kel'Thuzad"] = "克尔苏加德"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:116
CLM.L["Kil'jaeden"] = "基尔加丹"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:135
CLM.L["Kologarn"] = "科隆加恩"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:126
CLM.L["Koralon the Flame Watcher"] = "火焰看守者科拉隆"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:61
CLM.L["Kurinnaxx"] = "库林纳克斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:152
CLM.L["Lady Deathwhisper"] = "亡语者女士"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:86
CLM.L["Lady Vashj"] = "瓦丝琪"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:386
CLM.L["Large value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "分级拍卖的大值。\n\n设置为与其他层相同的值或忽略忽略。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:904
CLM.L["Large"] = "Large"
-- ClassicLootManager_Integrations/GUI.lua:322
CLM.L["Last month"] = "上个月"
-- ClassicLootManager_Integrations/GUI.lua:315
CLM.L["Last week"] = "上周"
-- ClassicLootManager_Integrations/GUI.lua:329
CLM.L["Last year"] = "去年"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:458
CLM.L["Latest loot"] = "最新战利品"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:481
CLM.L["Latest points"] = "最新分数"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:311
-- ClassicLootManager/Utils.lua:1067
CLM.L["Legendary"] = "传奇"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:806
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:839
CLM.L["Legs"] = "腿部"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:83
CLM.L["Leotheras the Blind"] = "盲眼者莱欧瑟拉斯"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:79
CLM.L["Link Alt to Main"] = "将小号链接到主号"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:534
CLM.L["Linking override"] = "链接覆盖"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:378
-- ClassicLootManager/MinimapIcon.lua:42
CLM.L["Loading..."] = "正在加载..."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:44
CLM.L["Loatheb"] = "洛欧塞布"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:264
CLM.L["Lock selected"] = "锁定中的"
-- ClassicLootManager/Modules/GUI/Filters.lua:81
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:426
CLM.L["Locked"] = "锁定"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:22
CLM.L["Logging level"] = "日志记录级别"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:18
CLM.L["Logging"] = "日志记录"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:262
CLM.L["Loot Awards"] = "战利品奖励"
-- ClassicLootManager_Integrations/GUI.lua:21
CLM.L["Loot History"] = "战利品历史记录"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:292
--CLM.L["Loot Rolling"] = ""
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:426
CLM.L["Loot rarity"] = "战利品稀有度"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:21
CLM.L["Loot"] = "战利品"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:144
CLM.L["Lord Jaraxxus"] = "加拉克苏斯大王"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:153
CLM.L["Lord Marrowgar"] = "玛洛加尔领主"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:8
CLM.L["Lucifron"] = "鲁西弗隆"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:115
CLM.L["M'uru"] = "穆鲁"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:420
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:324
-- ClassicLootManager_Integrations/Integrations.lua:136
-- ClassicLootManager_Integrations/Integrations.lua:141
CLM.L["MS"] = "主天赋"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:37
CLM.L["Maexxna"] = "迈克斯纳"
-- .:indirectly
CLM.L["Mage"] = "法师"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:9
CLM.L["Magmadar"] = "玛格曼达"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:80
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:325
CLM.L["Magtheridon"] = "玛瑟里顿"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:69
CLM.L["Maiden of Virtue"] = "贞节圣女"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:811
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:844
CLM.L["Main Hand"] = "主手"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:173
CLM.L["Main"] = "主号"
-- ClassicLootManager/Modules/GUI/Filters.lua:80
CLM.L["Mains"] = "主号"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:16
CLM.L["Majordomo Executus"] = "管理者埃克索图斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:123
CLM.L["Malygos"] = "玛里苟斯"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:71
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:146
CLM.L["Management"] = "管理"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:222
CLM.L["Manager"] = "Manager"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:527
CLM.L["Manual adjustment"] = "手动调整"
-- ClassicLootManager_Integrations/GUI.lua:137
CLM.L["March"] = "三月"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:399
CLM.L["Master Loot Only"] = "仅Master Loot"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:905
CLM.L["Max"] = "Max"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:965
CLM.L["Maximum point cap player can receive per raid week. Set to 0 to disable."] = "每周角色可以获得的最大分数上限。设置为 0 以禁用。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:974
CLM.L["Maximum point cap that player can have. Set to 0 to disable."] = "角色可以拥有的最大分数上限。设置为 0 以禁用。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:390
CLM.L["Maximum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Maximum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."
-- ClassicLootManager_Integrations/GUI.lua:139
CLM.L["May"] = "五月"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:382
CLM.L["Medium value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Medium value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:903
CLM.L["Medium"] = "Medium"
-- ClassicLootManager/MinimapIcon.lua:100
CLM.L["Menu"] = "菜单"
-- ClassicLootManager_Integrations/Migration.lua:197
-- ClassicLootManager_Integrations/Migration.lua:275
-- ClassicLootManager_Integrations/Migration.lua:404
CLM.L["Migrating %s"] = "迁移 %s"
-- ClassicLootManager_Integrations/Migration.lua:74
CLM.L["Migration complete. %s to apply and sync with others or go to %s to discard."] = "迁移完成。 %s 来应用并同步给他人，或者 %s 来删除。"
-- ClassicLootManager_Integrations/Migration.lua:298
CLM.L["Migration failure: Detected 0 teams"] = "迁移失败：检测到 0 个团队"
-- ClassicLootManager_Integrations/Migration.lua:236
-- ClassicLootManager_Integrations/Migration.lua:352
CLM.L["Migration failure: Unable to create profiles"] = "迁移失败：无法创建角色信息"
-- ClassicLootManager_Integrations/Migration.lua:35
CLM.L["Migration ongoing: %s(%s)"] = "Migration ongoing: %s(%s)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:136
CLM.L["Mimiron"] = "米米尔隆"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:118
CLM.L["Min bid increment"] = "最小竞拍增量"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1300
CLM.L["Minimal increment"] = "最小增量"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1301
CLM.L["Minimal value increment for open auction mode."] = "公开拍卖模式的最小增值。"
-- ClassicLootManager_Integrations/Migration.lua:76
CLM.L["Minimap Icon -> Configuration -> Wipe events"] = "小地图图标 -> 配置 -> 删除事件"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1050
CLM.L["Minimum GP used in calculations when player has less GP than this value."] = "当角色的 GP 低于此值时，计算中使用minGP。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:142
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1049
CLM.L["Minimum GP"] = "最低GP"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:84
CLM.L["Minimum Level"] = "最低等级"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:85
CLM.L["Minimum level of players to fill from guild."] = "从公会导入的最低角色等级。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:139
CLM.L["Minimum points (DKP / EP)"] = "最低分数（DKP / EP）"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1097
CLM.L["Minimum standing required to be allowed to bid."] = "允许参与竞拍的最低分数。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1096
CLM.L["Minimum standing"] = "最低分数"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:238
CLM.L["Missing award value"] = "缺少分值"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:349
CLM.L["Missing decay value"] = "缺少衰减值"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:55
CLM.L["Missing profile %s"] = "缺失角色信息 %s"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:33
CLM.L["Missing roster name and you are not in raid"] = "缺少名册名称并且您不在团队中"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:37
CLM.L["Missing roster name. Using Raid Info"] = "缺少名册名称。使用团本活动信息"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:326
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:398
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:437
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:466
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:500
CLM.L["Missing valid raid"] = "缺少有效的团队/团本活动"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:63
CLM.L["Moam"] = "莫阿姆"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:239
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:435
CLM.L["Modifier combination"] = "修饰符组合"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:201
CLM.L["Molten Core"] = "熔火之心"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:68
CLM.L["Moroes"] = "莫罗斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:85
CLM.L["Morogrim Tidewalker"] = "莫洛格里·踏潮者"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:97
CLM.L["Mother Shahraz"] = "莎赫拉丝主母"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:232
CLM.L["Moving %s from current queue to pending queue."] = "将 %s 从当前队列移动到等待队列。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:444
CLM.L["Multiple"] = "多个"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:563
CLM.L["Multiplier for tier %s (if used by the auction type)."] = "系数 for tier %s （如果采用 Tiered 模式）。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:486
CLM.L["Multiplier used by the equations"] = "公式使用的系数"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:295
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:494
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1170
CLM.L["Multiplier"] = "系数"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1146
CLM.L["Multiply auction time by the number of items to increase auction time lineary."] = "將拍賣時間乘以物品數量以線性增加拍賣時間。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1145
CLM.L["Multiply time"] = "倍增時間"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs_Retail.lua:42
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:659
CLM.L["Mythic"] = "Mythic"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:106
CLM.L["Nalorakk"] = "纳洛拉克"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:172
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:260
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:384
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:395
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:742
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:694
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:772
CLM.L["Name"] = "名字"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:145
CLM.L["Named Buttons"] = "命名按钮"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:246
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:407
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:524
CLM.L["Naxxramas"] = "纳克萨玛斯"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:796
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:829
CLM.L["Neck"] = "颈部"
-- ClassicLootManager/Utils.lua:1073
--CLM.L["Need"] = ""
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:25
CLM.L["Nefarian"] = "奈法利安"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:74
CLM.L["Netherspite"] = "虚空幽龙"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:36
CLM.L["Never show changelog"] = "不再显示更新日志"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1130
CLM.L["New highest bid on %s: %s %s %s"] = "给 %s 的新最高出价：%s %s %s"
-- ClassicLootManager_Integrations/GenericImport.lua:105
CLM.L["New roster: %s"] = "新名册: %s"
-- ClassicLootManager_Integrations/Migration.lua:124
CLM.L["New roster: [%s]"] = "新名册: [%s]"
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:57
CLM.L["New version %s of Core Loot Manager is available. For best experience please update the AddOn."] = "新版本 %s 的 Core Loot Manager 可用。为了获得最佳体验请更新插件。"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:561
CLM.L["Next item"] = "下一項"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:560
CLM.L["Next"] = "下一個"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:77
CLM.L["Nightbane"] = "夜之魇"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1313
CLM.L["No auction in progress"] = "没有进行中的拍卖"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:179
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:193
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:894
CLM.L["No bids"] = "没有出价"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:475
CLM.L["No loot received"] = "没有收到战利品"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:225
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:338
CLM.L["No players selected"] = "未选择角色"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:500
CLM.L["No points received"] = "未获得分数"
-- ClassicLootManager/Utils.lua:602
CLM.L["No"] = "否"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:818
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:851
CLM.L["Non-equippable"] = "不可装备"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:301
-- ClassicLootManager/Modules/GUI/Filters.lua:191
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:223
-- ClassicLootManager_Integrations/Integrations.lua:673
CLM.L["None"] = "无"
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:90
CLM.L["Normal Mode"] = "正常模式"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs_Retail.lua:40
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:657
CLM.L["Normal"] = "Normal"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:145
CLM.L["Northrend Beasts"] = "诺森德猛兽"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1306
CLM.L["Not in a roster"] = "不在名册中"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:595
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:640
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:279
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:559
CLM.L["Not in raid"] = "不在团队/团本活动中"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:161
CLM.L["Note to be added to award. Max 25 characters. It is recommended to not include date nor selected reason here. If you will input encounter ID it will be transformed into boss name."] = "最多 25 个字符。建议不要在此处包含日期或选择的原因。如果您输入BOSS战ID，它将被转换为BOSS名称。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:159
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:233
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:119
CLM.L["Note"] = "备注"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:42
CLM.L["Noth the Plaguebringer"] = "瘟疫使者诺斯"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:489
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:577
CLM.L["Notify that you are passing on the item."] = "通知您正在跳过该物品。"
-- ClassicLootManager_Integrations/GUI.lua:145
CLM.L["November"] = "十一月"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:654
CLM.L["Num"] = "#"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:421
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:350
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1105
-- ClassicLootManager_Integrations/Integrations.lua:146
-- ClassicLootManager_Integrations/Integrations.lua:151
CLM.L["OS"] = "副天赋"
-- ClassicLootManager_Integrations/GUI.lua:144
CLM.L["October"] = "十月"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:812
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:845
CLM.L["Off Hand"] = "副手"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1316
CLM.L["Off-spec bidding not allowed"] = "不允许副天赋出价"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:93
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:241
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:876
CLM.L["On Time Bonus Value"] = "集合奖励分值"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:88
CLM.L["On Time Bonus value"] = "集合奖励分值"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:86
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:239
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:85
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:520
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:869
CLM.L["On Time Bonus"] = "集合奖励"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:810
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:843
CLM.L["One-Hand"] = "单手"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:127
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:931
CLM.L["Online only"] = "仅限在线"
-- ClassicLootManager/Modules/GUI/Filters.lua:76
CLM.L["Online"] = "在线的"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:192
CLM.L["Only when ML/RL"] = "仅当 ML/RL"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:7
CLM.L["Onyxia"] = "奥妮克希亚"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:194
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:504
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:621
CLM.L["Onyxia's Lair"] = "奥妮克希亚的巢穴"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:128
CLM.L["Open Key Bindings UI for AddOns"] = "为插件打开按键绑定界面"
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:55
CLM.L["Open trade"] = "公开贸易"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:718
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:725
CLM.L["Open"] = "公开"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:70
CLM.L["Opera Hall"] = "歌剧院"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:66
CLM.L["Ossirian the Unscarred"] = "无疤者奥斯里安"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1294
CLM.L["Other"] = "其他"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:33
CLM.L["Ouro"] = "奥罗"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:75
CLM.L["Overrides"] = "覆盖"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1258
CLM.L["PASS"] = "跳过"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1058
CLM.L["PR Rounding"] = "PR 四舍五入"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:396
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1096
CLM.L["PR"] = "PR"
-- .:indirectly
CLM.L["Paladin"] = "圣骑士"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:288
CLM.L["Participated"] = "参与"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:295
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:422
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:488
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:576
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:859
-- ClassicLootManager/Utils.lua:1072
CLM.L["Pass"] = "跳过"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1315
CLM.L["Passing after bidding not allowed"] = "不允许出价后跳过"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:38
CLM.L["Patchwerk"] = "帕奇维克"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:327
--CLM.L["Patterns"] = ""
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:124
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:272
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:121
CLM.L["Player"] = "角色"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:363
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:376
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:393
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:407
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:421
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:440
CLM.L["Please select a raid"] = "请选择一个团本活动"
-- ClassicLootManager_Integrations/GUI.lua:20
CLM.L["Point History"] = "分数历史记录"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1028
CLM.L["Point award multiplier for players on bench."] = "替补角色获得分数的系数"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:949
CLM.L["Point caps"] = "分数上限"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:779
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1341
CLM.L["Point type"] = "分数类型"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:22
CLM.L["Point"] = "分数"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:184
CLM.L["Points value that will be awarded."] = "将被分配的分值。"
-- ClassicLootManager/Utils.lua:1062
CLM.L["Poor"] = "较差的"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:67
CLM.L["Post bids"] = "通告竞拍"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:67
CLM.L["Post channel"] = "发布频道"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:279
CLM.L["Price Tooltips"] = "价格Tooltip"
-- .:indirectly
CLM.L["Priest"] = "牧师"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:76
CLM.L["Prince Malchezaar"] = "玛克扎尔王子"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:31
CLM.L["Princess Huhuran"] = "哈霍兰公主"
-- ClassicLootManager_Integrations/Integrations.lua:141
-- ClassicLootManager_Integrations/Integrations.lua:151
CLM.L["Prioritized"] = "优先"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:154
CLM.L["Professor Putricide"] = "普崔塞德教授"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:274
CLM.L["Profile %s already exists and is used by different GUID %s (%s). "] = "角色信息 %s 已存在，被不同的GUID占用 %s (%s)。 "
-- .:indirectly
CLM.L["Profiles"] = "角色信息"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:523
CLM.L["Progression Bonus"] = "进度奖励"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:413
CLM.L["Provide number of raids needed for 100% attendance in a weekly reset. Between 1 - 50 raids. Defaults to 2. Requires /reload."] = "请提供每周所需参与的团本活动数量以达成 100% 出勤。选择 1 - 50 ，默认值为 2。需要重新加载界面。"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:431
CLM.L["Provide number of weeks that will be accounted for attendance. Between 1 - 1000 weeks. Defaults to 10. Requires /reload."] = "提供将计入出勤的周数。 1 - 1000 周之间。默认为 10。需要 /reload。"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:112
CLM.L["Prune profiles"] = "Prune profiles"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:148
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1020
CLM.L["Put players leaving raid on bench instead of removing them. To remove them completely they will need to be removed manually from the bench."] = "让离开团队的角色加入替补名单。要完全移除他们，需要手动将他们从替补名单中移除。"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:155
CLM.L["Queen Lana'thel"] = "鲜血女王兰娜瑟尔"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:822
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:855
CLM.L["Quiver"] = "箭袋"
-- ClassicLootManager_Integrations/Integrations.lua:231
-- ClassicLootManager_Integrations/Integrations.lua:237
CLM.L["RCLC Integration"] = "RCLC 集成"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:699
CLM.L["ROLL"] = "Roll"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:100
CLM.L["Rage Winterchill"] = "雷基·冬寒"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:17
CLM.L["Ragnaros"] = "拉格纳罗斯"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:246
CLM.L["Raid Completion Bonus Value"] = "解散奖励分值"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:94
CLM.L["Raid Completion Bonus value"] = "解散奖励分值"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:101
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:244
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:91
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:522
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:884
CLM.L["Raid Completion Bonus"] = "解散奖励"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:108
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:891
CLM.L["Raid Completion Value"] = "解散奖励分值"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:184
CLM.L["Raid Name"] = "团本活动名称"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:229
CLM.L["Raid Start/End"] = "团本活动开始/结束"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:225
CLM.L["Raid Warnings"] = "团队通告"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:430
CLM.L["Raid [%s] ended"] = "团本活动 [%s] 已结束"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:378
CLM.L["Raid [%s] started"] = "团本活动 [%s] 已开始"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:316
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:338
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:410
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:453
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:478
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:512
CLM.L["Raid management is disabled during time traveling."] = "在时间旅行模式中禁用团本活动管理。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:774
CLM.L["Raid"] = "团队"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:39
CLM.L["Raid: %s Roster: %s"] = "Raid: %s Roster: %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:412
CLM.L["Raids needed in reset"] = "Raids needed in reset"
-- ClassicLootManager_Integrations/GUI.lua:22
CLM.L["Raids"] = "团本活动"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:817
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:850
CLM.L["Ranged (wands)"] = "远程（魔杖）"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:816
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:849
CLM.L["Ranged"] = "远程"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:75
CLM.L["Ranks"] = "会阶"
-- ClassicLootManager/Utils.lua:1065
CLM.L["Rare"] = "稀有的"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:18
CLM.L["Razorgore the Untamed"] = "狂野的拉佐格尔"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:137
CLM.L["Razorscale"] = "锋鳞"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:174
CLM.L["Reason"] = "原因"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:387
CLM.L["Received"] = "收入"
-- ClassicLootManager_Integrations/Integrations.lua:136
-- ClassicLootManager_Integrations/Integrations.lua:146
CLM.L["Regular"] = "常规"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:823
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:856
CLM.L["Relic"] = "Relic"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:96
CLM.L["Reliquary of Souls"] = "灵魂之匣"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:275
CLM.L["Remove all items from auction list. Populates new one if there are any pending."] = "从拍卖列表中删除所有项目。如果有任何待处理，将添加到列表。"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:104
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:81
CLM.L["Remove all"] = "移除所有"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:80
CLM.L["Remove auction"] = "移除拍卖"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:686
CLM.L["Remove from roster"] = "从名册中删除"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:637
CLM.L["Remove from standby"] = "从替补名单中移除"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:286
CLM.L["Remove item from auction list after it's awarded."] = "分配后，从拍卖列表中移除物品。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:446
CLM.L["Remove items without bids from auction list. This will make marking items as disenchanted not possible."] = "从拍卖列表中删除没有投标的项目。 这将使标记物品变得不可能。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:445
CLM.L["Remove items without bids"] = "删除没有投标的项目"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:93
CLM.L["Remove old"] = "移除旧的"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:284
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:358
CLM.L["Remove on award"] = "分配后移除"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:620
CLM.L["Remove override"] = "移除覆盖"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:833
CLM.L["Remove roster"] = "移除名册"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:434
CLM.L["Remove selected raid"] = "移除选中的团本活动"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:286
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:754
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:470
CLM.L["Remove selected"] = "移除选中的"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:396
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:68
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:285
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:839
CLM.L["Remove"] = "移除"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:840
CLM.L["Removes current roster."] = "移除当前名册。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:228
CLM.L["Removing %s from current queue."] = "从当前队列中删除 %s。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:225
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:638
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:716
CLM.L["Removing items not allowed during auction."] = "在拍卖过程中移除不允许的物品。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:357
CLM.L["Request standby"] = "请求替补"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:107
CLM.L["Rescales CLM UI, except Bidding window. You can rescale Bidding window independently by using Ctrl + Mouse Wheel. Some windows may require closing and reopening."] = "重新调整 CLM UI，竞拍窗口除外。您可以使用 Ctrl + 鼠标滚轮独立重新调整竞拍窗口。某些窗口可能需要关闭和重新打开。"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:182
CLM.L["Reset gui positions"] = "重置 gui 位置"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:370
CLM.L["Revoke standby"] = "撤销替补"
-- .:indirectly
CLM.L["Rogue"] = "潜行者"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:174
CLM.L["Role"] = "角色"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:296
--CLM.L["Roll on Loot"] = ""
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:530
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:759
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:710
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1153
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1154
CLM.L["Roll"] = "卷"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:922
CLM.L["Rolling complete"] = "滚动完成"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1333
CLM.L["Roster Name"] = "名册名称"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1332
CLM.L["Roster name"] = "名册名称"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:307
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:125
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:773
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:113
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:108
-- ClassicLootManager_Integrations/ImportCSV.lua:91
CLM.L["Roster"] = "名册"
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:135
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:140
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:145
CLM.L["Rosters"] = "名册"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:156
CLM.L["Rotface"] = "腐面"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1059
CLM.L["Round PR to selected number of decimals"] = "PR 四舍五入到选定的小数位数"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:793
CLM.L["Round to selected number of decimals"] = "四舍五入到选定的小数位数"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:115
CLM.L["Round to"] = "四舍五入到"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:792
CLM.L["Rounding"] = "四舍五入"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:283
CLM.L["Ruins of Ahn'Qiraj"] = "安其拉废墟"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:700
CLM.L["SK"] = "SK"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:130
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:940
CLM.L["Same zone only"] = "仅限同一区域"
-- ClassicLootManager/MinimapIcon.lua:56
CLM.L["Sandbox mode"] = "沙盒模式"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:48
CLM.L["Sapphiron"] = "萨菲隆"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:119
CLM.L["Sartharion"] = "萨塔里奥"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:161
CLM.L["Saviana Ragefire"] = "塞维娅娜·怒火"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:719
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:726
CLM.L["Sealed"] = "封闭"
-- ClassicLootManager/Modules/GUI/Filters.lua:208
CLM.L["Search for player names. Separate multiple with a comma ','. Minimum 3 characters. Overrides filtering."] = "搜索，用英文逗号','分隔多个。至少3个字母。覆盖过滤器。"
-- ClassicLootManager/Modules/GUI/Filters.lua:207
CLM.L["Search"] = "搜索"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1342
CLM.L["Select DKP or EPGP point system."] = "选择 DKP 或 EPGP 分数系统。"
-- ClassicLootManager_Integrations/GUI.lua:375
CLM.L["Select Profiles to export"] = "选择要导出的角色信息"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:448
CLM.L["Select Rosters to display"] = "选择要显示的名册"
-- ClassicLootManager_Integrations/GUI.lua:344
CLM.L["Select Rosters to export"] = "选择要导出的名册"
-- ClassicLootManager/Modules/GUI/Filters.lua:179
CLM.L["Select all classes."] = "选择所有职业。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:297
--CLM.L["Select default behavior whenever group loot rolling window gets opened. This will be active only during CLM Raid and while in Raid instance."] = ""
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:524
CLM.L["Select equation"] = "选择公式"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:23
CLM.L["Select logging level for troubleshooting"] = "选择日志记录级别以进行故障排除"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:202
CLM.L["Select loot rarity for the annoucement to raid."] = "选择在团队通告的战利品稀有度。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:427
CLM.L["Select loot rarity threshold to used to fill the auction list."] = "选择将会被添加到拍卖列表的战利品稀有度阈值。"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:240
CLM.L["Select modifier combination for awarding."] = "选择用于分配的修饰符组合。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:436
CLM.L["Select modifier combination for filling auction from bags and corpse."] = "选择修饰符组合用以从背包和尸体添加物品到拍卖列表。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:133
CLM.L["Select roster to add profiles to."] = "选择名册以添加角色信息。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:164
CLM.L["Select roster to create raid for."] = "选择要为其创建团本活动的名册。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:132
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:163
CLM.L["Select roster"] = "选择名册"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:956
CLM.L["Select weekly reset timezone. EU: Wed 07:00 GMT or US: Tue 15:00 GMT"] = "选择每周重置时区。EU：周三 07:00 GMT 或 US：周二 15:00 GMT"
-- ClassicLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:89
CLM.L["Select |cffeeee00%s|r encounter difficulty for bonus value award (%s)."] = "选择| cffeee00%s | r的奖金价值奖（%s）遇到困难。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:772
CLM.L["Selected"] = "已选中"
-- ClassicLootManager_Integrations/GUI.lua:143
CLM.L["September"] = "九月"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:332
CLM.L["Serpentshrine Cavern"] = "毒蛇神殿"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:469
CLM.L["Set %s points to %s players for %s in <%s>"] = "Set %s points to %s players for %s in <%s>"
-- ClassicLootManager_Integrations/GenericImport.lua:184
CLM.L["Set Profiles standings in Rosters"] = "在名册中设置角色信息"
-- ClassicLootManager_Integrations/Migration.lua:391
CLM.L["Set points for %s players for team to %s"] = "Set points for %s players for team to %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:185
CLM.L["Set raid name"] = "设置团本活动名称"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:93
CLM.L["Shade of Akama"] = "阿卡玛之影"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:73
CLM.L["Shade of Aran"] = "埃兰之影"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:120
CLM.L["Shadron"] = "沙德隆"
-- .:indirectly
CLM.L["Shaman"] = "萨满"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:13
CLM.L["Shazzrah"] = "沙斯拉尔"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:815
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:848
CLM.L["Shield"] = "盾牌"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:582
CLM.L["Shift + Alt"] = "Shift+Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:585
CLM.L["Shift + Ctrl + Alt"] = "Shift + Ctrl + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:584
CLM.L["Shift + Ctrl"] = "Shift + Ctrl"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:579
CLM.L["Shift"] = "Shift"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:798
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:831
CLM.L["Shirt"] = "衬衣"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:797
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:830
CLM.L["Shoulder"] = "肩部"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:223
CLM.L["Show Award window"] = "展示奖励窗口"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:76
CLM.L["Show tooltip info even outside of CLM raid."] = "Show tooltip info even outside of CLM raid."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:27
CLM.L["Silithid Royalty"] = "吉祥三宝"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:157
CLM.L["Sindragosa"] = "辛达苟萨"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:747
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:753
CLM.L["Single-Priced"] = "Single-Priced"
-- ClassicLootManager_Integrations/Migration.lua:192
CLM.L["Skipping %s"] = "跳过 %s"
-- ClassicLootManager_Integrations/Migration.lua:268
CLM.L["Skipping CommunityDKP"] = "跳过 CommunityDKP"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:530
CLM.L["Slot multipliers"] = "槽位系数"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:378
CLM.L["Small value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Small value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:902
CLM.L["Small"] = "Small"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:144
CLM.L["Spec guild request"] = "查看公会请求"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:386
CLM.L["Spent"] = "支出"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:319
--CLM.L["Stacking"] = ""
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:815
CLM.L["Stale"] = "Stale"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:136
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:146
CLM.L["Standby %s has been sent"] = "Standby %s has been sent"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:524
CLM.L["Standby Bonus"] = "替补奖励"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:299
-- ClassicLootManager/Modules/GUI/Filters.lua:77
CLM.L["Standby"] = "替补"
-- ClassicLootManager_Integrations/GUI.lua:19
CLM.L["Standings"] = "积分榜"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:387
CLM.L["Start selected raid"] = "开始选中的团本活动"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:512
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:530
CLM.L["Start"] = "开始"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:508
CLM.L["Started raid %s"] = "已开始团本活动 %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:988
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:996
CLM.L["Starting %s"] = "开始 %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:982
CLM.L["Starting points"] = "起点"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:448
CLM.L["Statistics"] = "统计数据"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:261
CLM.L["Status"] = "状态"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:512
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:530
CLM.L["Stop"] = "停止"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:59
CLM.L["Store bids"] = "保存竞拍记录"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:60
CLM.L["Store finished auction bids information."] = "保存完成的拍卖信息。"
-- ClassicLootManager_Integrations/GenericImport.lua:238
-- ClassicLootManager_Integrations/ImportCSV.lua:118
CLM.L["Success"] = "成功"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:14
CLM.L["Sulfuron Harbinger"] = "萨弗隆先驱者"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:392
CLM.L["Sunwell Plateau"] = "太阳井高地"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:488
CLM.L["Suppress incoming whispers"] = "隐藏收到的密语"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:497
CLM.L["Suppress outgoing whispers"] = "隐藏发出的密语"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:79
CLM.L["Suppresses changelog display until new version is released"] = "禁止显示更新日志，直到发布新版本"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:92
CLM.L["Supremus"] = "苏普雷姆斯"
-- ClassicLootManager/MinimapIcon.lua:50
CLM.L["Sync ongoing"] = "同步进行中"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:654
CLM.L["TBC"] = "TBC"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:802
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:835
CLM.L["Tabard"] = "战袍"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:155
CLM.L["Tank"] = "坦克"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:136
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1309
CLM.L["Tax"] = "税"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:344
CLM.L["Tempest Keep"] = "风暴要塞"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:231
CLM.L["Temple of Ahn'Qiraj"] = "安其拉神殿"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:121
CLM.L["Tenebron"] = "塔尼布隆"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:72
CLM.L["Terestian Illhoof"] = "特雷斯坦·邪蹄"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:94
CLM.L["Teron Gorefiend"] = "塔隆·血魔"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:41
CLM.L["Thaddius"] = "塔迪乌斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:138
CLM.L["The Assembly of Iron"] = "钢铁议会"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:71
CLM.L["The Curator"] = "馆长"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:438
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:555
CLM.L["The Eye of Eternity"] = "永恒之眼"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:47
CLM.L["The Four Horsemen"] = "天启四骑士"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:98
CLM.L["The Illidari Council"] = "伊利达雷议会"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:158
CLM.L["The Lich King"] = "巫妖王"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:82
CLM.L["The Lurker Below"] = "鱼斯拉"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:428
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:545
CLM.L["The Obsidian Sanctum"] = "黑曜石圣殿"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:26
CLM.L["The Prophet Skeram"] = "预言者斯克拉姆"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:511
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:628
CLM.L["The Ruby Sanctum"] = "红玉圣殿"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:139
CLM.L["Thorim"] = "托里姆"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:821
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:854
CLM.L["Thrown"] = "投掷"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:554
CLM.L["Tier multipliers"] = "Tier 系数"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:749
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:754
CLM.L["Tiered"] = "Tiered"
-- ClassicLootManager/MinimapIcon.lua:60
CLM.L["Time Traveling"] = "时间旅行模式启用中"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1137
CLM.L["Time in seconds by which auction will be extended if bid is received during last 10 seconds."] = "如果在最后 10 秒内收到出价，拍卖将延长的时间（以秒为单位）。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:655
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1121
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1153
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1154
CLM.L["Time"] = "时间"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:733
CLM.L["Timetravel"] = "开启时间旅行模式"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:309
CLM.L["Toggle Auction History window display"] = "开关拍卖历史窗口显示"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:712
CLM.L["Toggle Auctioning window display"] = "开关拍卖窗口显示"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:145
CLM.L["Toggle Bidding auto-open"] = "开关自动开启竞拍"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:220
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1192
CLM.L["Toggle Bidding window display"] = "开关竞拍窗口显示"
-- ClassicLootManager_Integrations/ImportCSV.lua:216
CLM.L["Toggle CSV import window display"] = "开关 CSV 导入窗口显示"
-- ClassicLootManager/MinimapIcon.lua:77
CLM.L["Toggle Minimap Icon"] = "开关小地图图标"
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:283
CLM.L["Toggle Trade List window display"] = "切换贸易列表窗口显示"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:163
CLM.L["Toggle advancing to next item on the list after bid."] = "出价后切换到列表中的下一个项目。"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:146
CLM.L["Toggle auto open and auto close on auction start and stop"] = "开关在拍卖开始和停止时自动打开和自动关闭"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:46
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:158
CLM.L["Toggle changelog window display"] = "开关更新日志窗口"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:45
CLM.L["Toggle changelog"] = "开关更新日志"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:155
CLM.L["Toggle closing bidding UI after submitting bid for all items."] = "开关提交所有物品出价后关闭竞拍界面。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:359
CLM.L["Toggle default behavior of remove on award field in auctioning ui"] = "在拍卖UI中，在奖励字段中删除删除的默认行为"
-- ClassicLootManager_Integrations/GUI.lua:513
CLM.L["Toggle export window display"] = "开关导出窗口显示"
-- ClassicLootManager_Integrations/GenericImport.lua:281
CLM.L["Toggle import window display"] = "开关导入窗口显示"
-- ClassicLootManager/Modules/GUI/UnifiedGUI.lua:428
CLM.L["Toggle standings window display"] = "开关积分榜窗口显示"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:203
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:194
CLM.L["Toggle test bar"] = "切换测试栏"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:152
CLM.L["Toggles addon sounds."] = "开关插件声音。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:312
--CLM.L["Toggles auto-rolling on legendary items."] = ""
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:328
--CLM.L["Toggles auto-rolling on patterns."] = ""
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:320
--CLM.L["Toggles auto-rolling on stacking items."] = ""
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:184
CLM.L["Toggles loot announcement to raid"] = "开关战利品通告到团队频道"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:350
CLM.L["Toggles loot award announcement to guild"] = "开关战利品分配通告到公会频道"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:354
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:367
CLM.L["Too much data to display"] = "数据过多，无法显示"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:127
CLM.L["Toravon the Ice Watcher"] = "寒冰看守者图拉旺"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:451
CLM.L["Total blocked"] = "共被阻止"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:452
CLM.L["Total decayed"] = "共被衰减"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:450
CLM.L["Total received"] = "共获得"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:449
CLM.L["Total spent"] = "总花费"
-- ClassicLootManager_Tracker/ClassicLootManager_Tracker.lua:110
CLM.L["Tracker"] = "Tracker"
-- ClassicLootManager/Modules/Auctioning/AutoAssign/GUI.lua:193
-- ClassicLootManager/MinimapIcon.lua:114
CLM.L["Trade List"] = "贸易清单"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:475
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:592
CLM.L["Trial of the Crusader"] = "十字军的试炼"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:809
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:842
CLM.L["Trinket"] = "饰品"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:37
CLM.L["True"] = "开启"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:32
CLM.L["Twin Emperors"] = "双子皇帝"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:264
CLM.L["Two different profiles exist for target GUID %s (%s:%s) and name %s (%s:%s). Verify and clean up profiles before updating."] = "两个不同的角色信息存在对目标 GUID %s (%s:%s) 和名字 %s (%s:%s).。请在更新之前验证并清理角色信息。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:814
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:847
CLM.L["Two-Hand"] = "双手"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:254
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:287
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:656
CLM.L["Type"] = "类型"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:106
CLM.L["UI Scale"] = "用户界面缩放"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:455
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:572
CLM.L["Ulduar"] = "奥杜尔"
-- ClassicLootManager_Integrations/Migration.lua:52
CLM.L["Unable to execute migration. Entries already exist."] = "无法执行迁移。条目已经存在。"
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:169
CLM.L["Unable to get item info from server. Please try auctioning again"] = "无法从服务器获取物品信息。请重新尝试拍卖"
-- ClassicLootManager/Utils.lua:1064
CLM.L["Uncommon"] = "罕见"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:525
CLM.L["Unexcused absence"] = "无故缺席"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:44
CLM.L["Unknown roster %s"] = "找不到名册 %s"
-- ClassicLootManager/MinimapIcon.lua:52
CLM.L["Unknown sync state"] = "无需同步"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:285
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:343
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:172
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:170
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:240
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:443
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:338
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:34
CLM.L["Unknown"] = "未知"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:88
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:321
CLM.L["Unlink Alt"] = "取消链接小号"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:273
CLM.L["Unlock selected"] = "解锁选中的"
-- ClassicLootManager_Integrations/Migration.lua:157
CLM.L["UpdatePoints(): Empty targets list"] = "UpdatePoints()：空目标列表"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:515
CLM.L["Updated raid <%s> %s joined, %s left, %s benched, %s removed"] = "已更新团本活动 <%s> %s 已加入, %s 已离开, %s 已替补, %s 已移除"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1207
CLM.L["Use named buttons"] = "使用命名按钮"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:19
CLM.L["Vaelastrasz the Corrupt"] = "堕落的瓦拉斯塔兹"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:146
CLM.L["Val'kyr Twins"] = "瓦格里双子"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:150
CLM.L["Valithria Dreamwalker"] = "踏梦者瓦莉瑟瑞娅"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:262
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:304
CLM.L["Value"] = "分值"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:445
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:562
CLM.L["Vault of Archavon"] = "阿尔卡冯的宝库"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:31
CLM.L["Verbose"] = "详情显示"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:134
CLM.L["Version check in guild"] = "在公会中进行版本检查"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:175
CLM.L["Version"] = "版本"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:122
CLM.L["Vesperon"] = "维斯匹隆"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:720
CLM.L["Vickrey"] = "Vickrey"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:30
CLM.L["Viscidus"] = "维希度斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:88
CLM.L["Void Reaver"] = "空灵机甲"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:805
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:838
CLM.L["Waist"] = "腰部"
-- .:indirectly
CLM.L["Warlock"] = "术士"
-- .:indirectly
CLM.L["Warrior"] = "战士"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:109
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:964
CLM.L["Weekly cap"] = "每周上限"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:442
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:445
CLM.L["Weekly gains"] = "本周收益"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:955
CLM.L["Weekly reset timezone"] = "每周重置时区"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:112
CLM.L["Weekly reset"] = "每周重置"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:193
CLM.L["When enabled, this will make loot announcement display only if you're Master Looter or Raid Leader (if there is no Master Looter)."] = "启用后，只有当您是 Master Looter 或 Raid Leader（如果没有 Master Looter）时，才会显示战利品通告。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1208
CLM.L["Will display names of the buttons instead of values in bidding UI"] = "将在竞拍界面中显示按钮的名称而不是数值"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:204
CLM.L["Will hide bidding window if you enter combat and show it again when you exit. Will also delay auto opening if needed."] = "如果您输入战斗并在退出时再次显示出来，将隐藏出价窗口。 如果需要，还将延迟自动打开。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:160
CLM.L["Wipe events"] = "删除所有事件"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:39
CLM.L["Wipe"] = "删除"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:161
CLM.L["Wipes all events from memory. This will trigger resyncing from other users."] = "从内存中清除所有事件。这将触发来自其他用户的重新同步。"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:40
CLM.L["Wipes the log history"] = "删除日志历史记录"
-- ClassicLootManager_Integrations/Integrations.lua:360
CLM.L["WoW DKP Bot Integration"] = "WoW DKP Bot集成"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:655
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:656
CLM.L["WotLK"] = "WLK"
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:197
CLM.L["Wowpedia"] = "Wowpedia"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:803
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:836
CLM.L["Wrist"] = "手腕"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:140
CLM.L["XT-002 Deconstructor"] = "XT-002拆解者"
-- ClassicLootManager/Utils.lua:597
CLM.L["Yes"] = "是的"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:141
CLM.L["Yogg-Saron"] = "尤格萨隆"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:311
CLM.L["You are already in an active raid. Leave or finish it before creating new one."] = "你已经在一个正在进行的团本活动中。在创建新的之前离开或完成它。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:746
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:875
CLM.L["You are not allowed to auction items"] = "您没有权限拍卖物品"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:470
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:504
CLM.L["You are not allowed to control raid."] = "您没有权限控制团本活动。"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:307
CLM.L["You are not allowed to create raids."] = "您没有权限创建团本活动。"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:441
CLM.L["You are not allowed to join raid."] = "您没有权限加入团本活动。"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:330
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:402
CLM.L["You are not allowed to start raid."] = "您没有权限开始团本活动。"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:343
CLM.L["You are not in the raid."] = "你不在团队/团本活动中。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:657
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:666
CLM.L["You can %s max %d players from standby at the same time to a %s raid."] = "您最多可以同时%s %d 名角色从替补名单到 %s 团本活动。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:612
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:621
CLM.L["You can %s max %d players to standby at the same time to a %s raid."] = "您最多可以同时%s %d 名角色到替补名单在 %s 团本活动。"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:474
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:508
CLM.L["You can only add players to standby of a progressing raid."] = "您只能将角色添加到正在进行的团本活动的替补名单。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:603
CLM.L["You can only bench players from same roster as the raid (%s)."] = "你只能从团队活动（%s）的同一个名册中添加替补角色。"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:406
CLM.L["You can only end an active raid."] = "您只能结束正在进行的团本活动。"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:445
CLM.L["You can only join an active raid."] = "你只能加入一个正在进行的团本活动。"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:449
CLM.L["You can only join different raid than your current one."] = "您只能加入与当前团本活动不同的团本活动。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:648
CLM.L["You can only remove from bench players from same roster as the raid (%s)."] = "你只能从团队活动（%s）的同一个名册中移除替补角色。"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:334
CLM.L["You can only start a freshly created raid."] = "您只能开始新创建的团本活动。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:700
CLM.L["You can remove max %d players from roster at the same time."] = "您最多可以从名册中同时移除 %d 名角色。"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:339
CLM.L["Your bid (%s) was denied: |cffcc0000%s|r"] = "你的竞拍 (%s) 被拒绝: |cffcc0000%s|r"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:321
CLM.L["Your bid (%s) was |cff00cc00accepted|r"] = "你的竞拍 (%s) |cff00cc00成功|r"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:64
CLM.L["Zero-Sum Bank Inflation"] = "Zero-Sum Bank Inflation"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:61
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1269
CLM.L["Zero-Sum Bank"] = "Zero-Sum Bank"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1277
CLM.L["Zero-Sum Inflation Value"] = "Zero-Sum Inflation Value"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:528
CLM.L["Zero-Sum award"] = "Zero-Sum award"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1263
CLM.L["Zero-Sum"] = "Zero-Sum"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:380
CLM.L["Zul'Aman"] = "祖阿曼"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:267
CLM.L["Zul'Gurub"] = "祖尔格拉布"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:110
CLM.L["Zul'jin"] = "祖尔金"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:218
CLM.L["[All Roster Configs]: "] = "[所有名册配置]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:224
CLM.L["[All Roster Default Slot Values]: "] = "[所有名册默认槽位值]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:202
CLM.L["[Alt-Main Link]: "] = "[小号-主号链接]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:209
CLM.L["[Create Roster]: "] = "[创建名册]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:212
CLM.L["[Delete Roster]: "] = "[删除名册]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:287
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:529
CLM.L["[IGNORE]: Ignoring entry"] = "[IGNORE]：忽略条目"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:271
CLM.L["[Item Award in Raid]: "] = "[团本中的物品分配]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:268
CLM.L["[Item Award]: "] = "[物品分配]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:258
CLM.L["[Point Award to raid]: "] = "[团队分数奖励]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:255
CLM.L["[Point Award to roster]: "] = "[名册分数奖励]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:249
CLM.L["[Point Award]: "] = "[分数奖励]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:261
CLM.L["[Point Decay for roster]: "] = "[名册分数衰减]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:252
CLM.L["[Point Decay]: "] = "[分数衰减]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:264
CLM.L["[Point Set]: "] = "[分数设置]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:205
CLM.L["[Profile Lock]: "] = "[角色信息锁定]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:275
CLM.L["[Raid Create]: "] = "[团本活动创建]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:284
CLM.L["[Raid Finish]: "] = "[团本活动结束]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:278
CLM.L["[Raid Start]: "] = "[团本活动开始]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:281
CLM.L["[Raid Update]: "] = "[团本活动更新]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:199
CLM.L["[Remove Profile]: "] = "[删除角色信息]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:215
CLM.L["[Rename Roster]: "] = "[重命名名册]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:242
CLM.L["[Roster Boss Kill Bonus]: "] = "[名册BOSS击杀奖励]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:221
CLM.L["[Roster Config]: "] = "[名册设置]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:239
CLM.L["[Roster Copy]: "] = "[复制名册]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:227
CLM.L["[Roster Default Slot Value]: "] = "[名册默认槽位值]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:245
CLM.L["[Roster Field Rename]: "] = "[名册字段重命名]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:233
CLM.L["[Roster Item Value Override Single]: "] = "[名册物品分数覆盖]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:230
CLM.L["[Roster Item Value Override]: "] = "[名册物品分数覆盖]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:236
CLM.L["[Roster Update Profiles]: "] = "[名册更新角色信息]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:196
CLM.L["[Update Profile]: "] = "[更新角色信息]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:405
CLM.L["[config] "] = "[配置]"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:407
CLM.L["[item values] "] = "[物品分数]"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:408
CLM.L["[profiles] "] = "[角色信息]"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:406
CLM.L["[slot defaults] "] = "[槽位默认值]"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:53
CLM.L["accepted"] = "被接受"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:613
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:622
CLM.L["add"] = "添加"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:40
CLM.L["cancel"] = "取消"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:622
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:667
CLM.L["created"] = "已创建"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:53
CLM.L["denied"] = "被拒绝"
-- ClassicLootManager_Integrations/Integrations.lua:342
CLM.L["else"] = "别的"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:462
CLM.L["excluding negatives "] = "不包括负数"
-- ClassicLootManager_Integrations/Integrations.lua:277
CLM.L["if reason/response contains"] = "如果原因/回复包含"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:117
CLM.L["level"] = "等级"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:42
CLM.L["pass"] = "跳过"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:613
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:658
CLM.L["progressing"] = "正在进行"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:120
CLM.L["rank"] = "会阶"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:658
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:667
CLM.L["remove"] = "移除"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:137
CLM.L["request"] = "请求"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:40
CLM.L["requested"] = "已请求"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:147
CLM.L["revoke"] = "撤销"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:70
CLM.L["revoked"] = "已撤销"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:92
CLM.L["roster"] = "名册"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:92
CLM.L["rosters"] = "名册"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:889
CLM.L["seconds"] = "秒"
-- ClassicLootManager_Integrations/Integrations.lua:287
CLM.L["then"] = "然后"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:124
CLM.L["unguilded"] = "不在公会的"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1199
CLM.L["|cff00ee44Open:|r English Auction with highest bidder announcement. Highest bidder wins. Two players can not bid same value. Additionally always allows bidding base to accomodate for Swedish Auction flavor.\n\n|cff00ee44Anonymous Open:|r Same as Open but highest bidder name is not disclosed.\n\n|cff00ee44Sealed:|r Bids are not announced. Highest bidder wins.\n\n|cff00ee44Vickrey:|r Same as sealed but winner pays with second-highest bid."] = "|cff00ee44Open:|r English Auction with highest bidder announcement. Highest bidder wins. Two players can not bid same value. Additionally always allows bidding base to accomodate for Swedish Auction flavor.\n\n|cff00ee44Anonymous Open:|r Same as Open but highest bidder name is not disclosed.\n\n|cff00ee44Sealed:|r Bids are not announced. Highest bidder wins.\n\n|cff00ee44Vickrey:|r Same as sealed but winner pays with second-highest bid."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1076
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1256
CLM.L["|cff00ee44Single-Priced:|r Static value mode. Only bidding Base value is supported.\n\n|cff00ee44Ascending:|r Ranged value mode. Allows bidding any value in |cff44ee00<base, max>|r.\n\n|cff00ee44Tiered:|r Ranged value mode. Allows bidding only specific values. Up to 5 tiers are configurable in |cff44ee00<base, small, medium, large, max>|r."] = "|cff00ee44Single-Priced:|r Static value mode. Only bidding Base value is supported.\n\n|cff00ee44Ascending:|r Ranged value mode. Allows bidding any value in |cff44ee00<base, max>|r.\n\n|cff00ee44Tiered:|r Ranged value mode. Allows bidding only specific values. Up to 5 tiers are configurable in |cff44ee00<base, small, medium, large, max>|r."
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:50
CLM.L["|cffcc0000Your Core Loot Manager is significantly out of date.|r AddOn communication has been disabled. Version %s is available. Please update as soon as possible."] = "|cffcc0000您的 Core Loot Manager 版本已经严重过期。|r 插件通信已被禁用。有新版本 %s 可用，请尽快更新。"
end