local _, CLM = ...
if GetLocale() == "zhTW" then
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:326
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:332
CLM.L[" alt of: "] = " 的主号是: "
-- ClassicLootManager/Utils.lua:493
CLM.L[" more"] = " 更多"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:178
CLM.L[" over "] = " over "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:399
CLM.L[" profile(s)"] = " 角色信息"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:34
CLM.L["!bid"] = "!bid"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:35
CLM.L["!bidos"] = "!bidos"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:63
CLM.L["!dkp"] = "!dkp"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:269
CLM.L["% that will be decayed."] = "% 将要被衰减"
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
CLM.L["%s %% %s decay"] = "%s %% %s 衰减"
-- ClassicLootManager_Alerts/Alerts.lua:12
CLM.L["%s %s"] = "%s %s"
-- ClassicLootManager/Modules/Loot/LootManager/LootManager.lua:142
CLM.L["%s awarded to %s for %s %s"] = "%s 分配给 %s for %s %s"
-- ClassicLootManager/MinimapIcon.lua:37
CLM.L["%s events (%s pending)"] = "%s 记录 (%s pending)"
-- ClassicLootManager/MinimapIcon.lua:39
CLM.L["%s events (0x%x)"] = "%s 记录 (0x%x)"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:40
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:70
CLM.L["%s has %s standby"] = "%s %s 替补"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:107
CLM.L["%s profile exists."] = "%s 角色信息已存在。"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:109
CLM.L["%s profile missing. Adding."] = "%s 角色信息缺失，正在添加。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:483
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:493
CLM.L["%s to %s for %s in <%s>"] = "%s to %s for %s in <%s>"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:115
CLM.L["%s was not found in guild."] = "%s 不在公会中。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:92
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:92
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:93
CLM.L["-- All --"] = "-- 全部 --"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:166
CLM.L["10 Player (Heroic)"] = "10人（英雄）"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:164
CLM.L["10 Player"] = "10人"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:169
CLM.L["20 Player"] = "20人"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:167
CLM.L["25 Player (Heroic)"] = "25人（英雄）"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:165
CLM.L["25 Player"] = "25人"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:168
CLM.L["40 Player"] = "40人"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:96
CLM.L["<CLM> %s not present in any roster."] = "<CLM> %s 不在任何名册中。"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:98
CLM.L["<CLM> %s standings in %d %s:"] = "<CLM> %s 积分榜 in %d %s:"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:107
CLM.L["<CLM> %s: %d DKP (%d this week)."] = "<CLM> %s: %d DKP (%d 本周)."
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:77
CLM.L["<CLM> Missing profile for player %s."] = "<CLM> 角色信息缺失 %s."
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:57
CLM.L["<CLM> Your bid (%s) was %s%s."] = "<CLM> 您的竞拍 (%s) 是 %s%s."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:145
CLM.L["Action context"] = "动作选定范围"
-- ClassicLootManager_Integrations/Integrations.lua:161
CLM.L["Action to take upon Gargul loot award event happening during raid."] = "对团本活动期间发生的 Gargul 战利品分配事件采取的行动。"
-- ClassicLootManager_Integrations/Integrations.lua:266
CLM.L["Action to take upon RCLC loot award event happening during raid. Trigger is based on RCLC award reason or player response if reason is not used. On Integration Enable the buttons will be prefilled with existing ones."] = "对团本活动期间发生的 RCLC 战利品分配事件采取的行动。触发基于 RCLC 分配原因，如果未填写原因，则基于玩家回复。On Integration Enable the buttons will be prefilled with existing ones."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:124
CLM.L["Add currently selected target to list."] = "将当前选中的目标添加到列表中。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:123
CLM.L["Add target"] = "添加目标"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:144
CLM.L["Add to roster"] = "添加到名册"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:567
CLM.L["Add to standby"] = "添加到替补名单"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:399
CLM.L["Add"] = "添加"
-- ClassicLootManager_Integrations/Migration.lua:368
CLM.L["Adding %s loot entries for team to %s"] = "添加 %s 战利品给团队到 %s"
-- ClassicLootManager_Integrations/Migration.lua:227
-- ClassicLootManager_Integrations/Migration.lua:346
CLM.L["Adding %s profiles to %s"] = "添加 %s 角色信息到 %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:944
CLM.L["Adding missing %s players to current roster"] = "添加缺少的 %s 角色到当前名册"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1169
CLM.L["Additional cost (tax) to add to the award value."] = "在物品分值上增加额外的数值（税）。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1137
CLM.L["Additional points to be given to players atop of the split value."] = "Additional points to be given to players atop of the split value."
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:146
CLM.L["Addon sounds"] = "插件声音"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:145
CLM.L["Adds selected players to the selected roster (from dropdown)."] = "将选中的角色添加到选中的名册中。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:266
CLM.L["Affected players:"] = "相关角色："
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:102
CLM.L["Akil'zon"] = "埃基尔松"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:84
CLM.L["Al'ar"] = "奥"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:125
CLM.L["Algalon the Observer"] = "观察者奥尔加隆"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:268
CLM.L["All In"] = "All In"
-- ClassicLootManager_Integrations/Migration.lua:29
CLM.L["All migration entries were commited and executed. Congratulations!"] = "所有迁移条目均已提交并执行。恭喜！"
-- ClassicLootManager/Modules/GUI/Filters.lua:182
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:23
CLM.L["All"] = "全部"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:79
CLM.L["Allow bidding below minimum points"] = "允许低于最低分数的竞拍"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1146
CLM.L["Allow biding more than current standings and ending up with less than minimum standings."] = "允许出价超过个人当前分数，结算后低于最低分数。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1145
CLM.L["Allow biding more than current standings"] = "允许高于当前积分的竞拍"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1004
CLM.L["Allow equal bids"] = "允许出相同竞拍价"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:76
CLM.L["Allow going below minimum points"] = "允许低于最低分数"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:896
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:157
CLM.L["Allow players to subscribe to the bench through Raids menu"] = "允许玩家通过团本活动菜单订阅替补名单"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:895
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:156
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:136
CLM.L["Allow subscription"] = "允许订阅"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:456
CLM.L["Alt"] = "Alt"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:996
CLM.L["Always allow All-In bids"] = "始终允许All-In"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:988
CLM.L["Always allow Base bids"] = "始终允许基础价格"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1012
CLM.L["Always allow cancel/pass"] = "始终允许取消/跳过"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:788
CLM.L["Americas"] = "美洲"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:737
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:770
CLM.L["Ammo"] = "弹药"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:98
CLM.L["Anetheron"] = "安纳塞隆"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:321
CLM.L["Announce award to Guild"] = "通告分配到公会频道"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:168
CLM.L["Announce loot from corpse to Raid"] = "从BOSS尸体上通告战利品到团队频道"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:164
CLM.L["Announce loot"] = "通告战利品"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:186
CLM.L["Announcement loot rarity"] = "通告战利品稀有度"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:636
CLM.L["Anonymous Open"] = "Anonymous Open"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1044
CLM.L["Anti-snipe time"] = "延长时间"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:695
CLM.L["Anti-snipe time: %s."] = "延长时间: %s."
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:237
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:73
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:490
CLM.L["Anti-snipe"] = "延长"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:32
CLM.L["Anub'Rekhan"] = "阿努布雷坎"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:139
CLM.L["Anub'arak"] = "阿努巴拉克"
-- ClassicLootManager/Tooltips.lua:37
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:69
CLM.L["Any"] = "任何"
-- ClassicLootManager_Integrations/GUI.lua:143
CLM.L["April"] = "四月"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:121
CLM.L["Archavon the Stone Watcher"] = "岩石看守者阿尔卡冯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:101
CLM.L["Archimonde"] = "阿克蒙德"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:164
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:320
CLM.L["Are you sure, you want to award %s to %s for %s %s?"] = "你确定，你想要分配 %s 给 %s for %s %s?"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:663
CLM.L["Ascending"] = "Ascending"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:226
CLM.L["Assistant"] = "Assistant"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:359
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:370
CLM.L["Att. [%]"] = "出勤 [%]"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:372
CLM.L["Attendance"] = "出勤"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:64
CLM.L["Attumen the Huntsman"] = "猎手阿图门"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:225
CLM.L["Auction End Countdown"] = "拍卖结束倒计时"
-- ClassicLootManager/MinimapIcon.lua:109
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:219
CLM.L["Auction History"] = "拍卖历史记录"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:209
CLM.L["Auction Start/End"] = "拍卖开始/结束"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:236
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:70
CLM.L["Auction Time"] = "拍卖时间"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:58
CLM.L["Auction Type"] = "拍卖类型"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:608
CLM.L["Auction complete"] = "拍卖完成"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:286
CLM.L["Auction finished"] = "拍卖结束"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1036
CLM.L["Auction length in seconds."] = "拍卖时长（以秒为单位）。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1035
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:480
CLM.L["Auction length"] = "拍卖时长"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:268
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:687
CLM.L["Auction of %s items."] = "拍卖 %s 物品。"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:270
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:689
CLM.L["Auction of %s"] = "拍卖 %s"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:954
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:467
CLM.L["Auction settings"] = "拍卖设置"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:599
CLM.L["Auction stopped by Master Looter"] = "被Master Looter停止拍卖"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:693
CLM.L["Auction time: %s."] = "拍卖时间: %s."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1106
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1178
CLM.L["Auction type"] = "拍卖类型"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:427
CLM.L["Auctioning - Chat Commands"] = "拍卖 - 聊天频道指令"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:60
CLM.L["Auctioning - History"] = "拍卖 - 历史记录"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:349
CLM.L["Auctioning - List Filling"] = "拍卖 - 清单填充"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:573
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:581
CLM.L["Auctioning requires active raid or roster mode."] = "拍卖需要团本活动正在进行或名册模式。"
-- ClassicLootManager/MinimapIcon.lua:104
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:633
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:317
CLM.L["Auctioning"] = "拍卖"
-- ClassicLootManager_Integrations/GUI.lua:147
CLM.L["August"] = "八月"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:126
CLM.L["Auriaya"] = "欧尔莉亚"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:661
CLM.L["Author"] = "执行者"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:903
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:148
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:124
CLM.L["Auto bench leavers"] = "退出团队自动加入替补名单"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:330
CLM.L["Auto-assign from corpse"] = "从尸体上自动分配"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:339
CLM.L["Auto-trade after award"] = "分配后自动交易"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:394
CLM.L["Average weeks"] = "平均周数"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:241
CLM.L["Award %s points to %s selected players."] = "分配 %s 分数给 %s 选中的角色。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:235
CLM.L["Award %s points to everyone in raid."] = "分配 %s 分数给团队中的所有人。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:237
CLM.L["Award %s points to everyone in roster."] = "分配 %s 分数给名册中的所有人。"
-- ClassicLootManager_Integrations/Integrations.lua:650
CLM.L["Award for Base"] = "分配 for Base"
-- ClassicLootManager_Integrations/Integrations.lua:649
CLM.L["Award for Free"] = "分配 for Free"
-- ClassicLootManager_Integrations/Integrations.lua:653
CLM.L["Award for Large"] = "分配 for Large"
-- ClassicLootManager_Integrations/Integrations.lua:654
CLM.L["Award for Max"] = "分配 for Max"
-- ClassicLootManager_Integrations/Integrations.lua:652
CLM.L["Award for Medium"] = "分配 for Medium"
-- ClassicLootManager_Integrations/Integrations.lua:651
CLM.L["Award for Small"] = "分配 for Small"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:839
CLM.L["Award points only to online players"] = "仅对在线角色奖励分数"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:848
CLM.L["Award points only to players in same zone"] = "仅对同一区域的角色奖励分数"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:189
CLM.L["Award points to players based on context."] = "根据所选范围向玩家奖励分数。"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:136
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:178
CLM.L["Award value"] = "分值"
-- ClassicLootManager/MinimapIcon.lua:118
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:145
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:194
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:231
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:188
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:305
CLM.L["Award"] = "分配"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:280
CLM.L["Award:"] = "奖："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:456
CLM.L["Awarded %s points for %s to all players in raid %s"] = "已分配 %s 分数 for %s 给在团本活动 %s 中的所有角色"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:432
CLM.L["Awarded %s points to %s players for %s in <%s>"] = "已分配 %s 分数给 %s 角色 for %s 在 <%s> 中"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:448
CLM.L["Awarded %s points to all players for %s in <%s>"] = "已分配 %s 分数给所有角色 for %s 在 <%s> 中"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:221
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:287
CLM.L["Awarded by"] = "执行者"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:62
CLM.L["Ayamiss the Hunter"] = "狩猎者阿亚米斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:100
CLM.L["Azgalor"] = "阿兹加洛"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:716
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:749
CLM.L["Back"] = "背部"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:736
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:769
CLM.L["Bag"] = "背包"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:156
CLM.L["Baltharus the Warborn"] = "战争之子巴尔萨鲁斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:9
CLM.L["Baron Geddon"] = "迦顿男爵"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:353
CLM.L["Base value for Static-Priced auction.\nMinimum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "静态定价拍卖的基值。\n升序和分层拍卖的最小值。\n\n设置为与其他层相同的值或负值忽略。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:818
CLM.L["Base"] = "Base"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:25
CLM.L["Battleguard Sartura"] = "沙尔图拉"
-- ClassicLootManager_Integrations/GUI.lua:321
-- ClassicLootManager_Integrations/GUI.lua:328
-- ClassicLootManager_Integrations/GUI.lua:335
CLM.L["Begin %d days ago, finish today."] = "Begin %d days ago, finish today."
-- ClassicLootManager_Integrations/GUI.lua:254
CLM.L["Begin Day"] = "开始日"
-- ClassicLootManager_Integrations/GUI.lua:265
CLM.L["Begin Month"] = "开始月份"
-- ClassicLootManager_Integrations/GUI.lua:276
CLM.L["Begin Year"] = "开始年份"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:911
CLM.L["Bench multiplier"] = "替补系数"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:889
CLM.L["Bench"] = "替补名单"
-- ClassicLootManager_Alerts/Alerts.lua:25
CLM.L["Bid %s accepted!"] = "竞拍 %s 被接受！"
-- ClassicLootManager_Alerts/Alerts.lua:33
CLM.L["Bid %s denied!"] = "竞拍 %s 被拒绝！"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1086
CLM.L["Bid cancelling not allowed"] = "不允许取消竞拍"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1084
CLM.L["Bid increment too low"] = "竞拍增量过低"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:164
CLM.L["Bid input values as Main spec bid."] = "竞拍输入值作为主天赋。"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:177
CLM.L["Bid input values as Off spec bid."] = "竞拍输入值作为副天赋。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1082
CLM.L["Bid too high"] = "出价过高"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1081
CLM.L["Bid too low"] = "出价过低"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:269
CLM.L["Bid your current DKP (%s)."] = "Bid your current DKP (%s)."
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:163
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:530
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:396
CLM.L["Bid"] = "竞拍"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1080
CLM.L["Bidding over current standings not allowed"] = "竞拍不允许高于当前积分"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1079
CLM.L["Bidding while below minimum standings not allowed"] = "竞拍不得低于最低积分"
-- ClassicLootManager/MinimapIcon.lua:114
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:974
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:75
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:83
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:638
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:820
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:876
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:515
CLM.L["Bidding"] = "竞拍"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:241
CLM.L["Bids"] = "竞拍"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:122
CLM.L["Bindings"] = "按键绑定"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:336
CLM.L["Black Temple"] = "黑暗神殿"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:201
CLM.L["Blackwing Lair"] = "黑翼之巢"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:144
CLM.L["Blood Council"] = "鲜血王子议会"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:53
CLM.L["Bloodlord Mandokir"] = "血领主曼多基尔"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:755
CLM.L["Bonuses"] = "奖励"
-- ClassicLootManager/ClassicLootManager.lua:224
CLM.L["Boot complete"] = "启动完成"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:432
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:761
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:80
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:238
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:82
CLM.L["Boss Kill Bonus"] = "BOSS击杀奖励"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1073
CLM.L["Boss kill award values"] = "Boss击杀分值"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:17
CLM.L["Broodlord Lashlayer"] = "勒什雷尔"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:109
CLM.L["Brutallus"] = "布鲁塔卢斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:61
CLM.L["Buru the Gorger"] = "吞咽者布鲁"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:920
CLM.L["Button Names"] = "按钮名称"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:31
CLM.L["C'Thun"] = "克苏恩"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:208
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:366
CLM.L["Cancel your bid."] = "取消您的出价。"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:312
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:332
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:419
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:207
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:365
CLM.L["Cancel"] = "取消"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:680
CLM.L["Change roster name."] = "更改名册名称。"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:15
CLM.L["Changelog"] = "更新日志"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1090
CLM.L["Changing bid from Main-spec to Off-Spec not allowed"] = "不允许将出价从主天赋改为副天赋"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:73
CLM.L["Channel for posting bids."] = "通告竞拍的频道。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:217
CLM.L["Chat Commands"] = "聊天频道指令"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:62
CLM.L["Chat bidding is currently disabled."] = "聊天指令竞标目前被禁用。"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:72
CLM.L["Chess Event"] = "国际象棋赛事"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:718
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:751
CLM.L["Chest (robes)"] = "胸部（长袍）"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:717
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:750
CLM.L["Chest"] = "胸部"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:21
CLM.L["Chromaggus"] = "克洛玛古斯"
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:263
CLM.L["Classic Loot Manager %s initialization complete. %s"] = "Classic Loot Manager %s 初始化完成。%s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI.lua:270
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:15
CLM.L["Classic Loot Manager"] = "Classic Loot Manager"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:597
CLM.L["Classic"] = "Classic"
-- ClassicLootManager/Modules/GUI/Filters.lua:196
CLM.L["Clear all classes."] = "清除所有职业。"
-- ClassicLootManager_Integrations/GUI.lua:479
CLM.L["Clear output"] = "清除输出"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:253
CLM.L["Clear"] = "清除"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:68
CLM.L["Close on bid"] = "竞拍后关闭"
-- ClassicLootManager/Utils.lua:868
CLM.L["Common"] = "常见"
-- ClassicLootManager/MinimapIcon.lua:133
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:311
-- ClassicLootManager_Integrations/GUI.lua:23
CLM.L["Configuration"] = "配置"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:716
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:724
CLM.L["Copy settings from selected roster."] = "从选中的名册复制设置。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:709
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:715
CLM.L["Copy settings"] = "复制设置"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:723
CLM.L["Copy source"] = "复制源"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:437
CLM.L["Correcting error"] = "纠正错误"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:196
CLM.L["Create new raid with provided name. You will automatically join this raid and leave any other you are part of."] = "使用提供的名称创建新的团本活动。您将自动加入此团本活动并离开您所属的任何其他活动。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:503
CLM.L["Create raid %s %s in <%s>"] = "创建团本活动 %s %s in <%s>"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:195
CLM.L["Create raid"] = "创建团本活动"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1192
-- ClassicLootManager_Integrations/Integrations.lua:252
CLM.L["Create"] = "新建"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:793
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:263
CLM.L["Created"] = "已创建"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1193
CLM.L["Creates new roster with default configuration"] = "使用默认配置创建新名册"
-- ClassicLootManager_Integrations/Integrations.lua:253
CLM.L["Creates new trigger to be used during RCLC award."] = "创建要在 RCLC 奖励期间使用的新触发器。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:458
CLM.L["Ctrl + Alt"] = "Ctrl + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:455
CLM.L["Ctrl"] = "Ctrl"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:539
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:820
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:405
CLM.L["Current"] = "当前的"
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
CLM.L["Danger Zone - Use at own risk"] = "危险区 - 使用风险自负"
-- ClassicLootManager_Integrations/GUI.lua:227
CLM.L["Data"] = "数据"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:177
CLM.L["Date"] = "日期"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:145
CLM.L["Deathbringer Saurfang"] = "死亡使者萨鲁法尔"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:268
CLM.L["Decay %"] = "衰减 %"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:330
CLM.L["Decay %s%% points to %s selected players."] = "衰减 %s%% 分数对 %s 选中的角色。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:326
CLM.L["Decay %s%% points to everyone in roster."] = "衰减 %s%% 分数对名册中的所有人。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:278
CLM.L["Decay Negatives"] = "衰减负数"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:443
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:292
CLM.L["Decay"] = "衰减"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:440
CLM.L["Decayed %s%% points to %s players in <%s>"] = "衰减 %s%% 分数对 %s 角色在 <%s> 中"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:464
CLM.L["Decayed %s%% points to all players %s in <%s>"] = "衰减 %s%% 分数对所有角色 %s 在 <%s>中"
-- ClassicLootManager_Integrations/GUI.lua:151
CLM.L["December"] = "十二月"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:768
CLM.L["Default Boss Kill Bonus Value"] = "默认BOSS击杀奖励分值"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:85
CLM.L["Default Boss Kill Bonus value"] = "默认BOSS击杀奖励分值"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1055
CLM.L["Default slot values"] = "默认槽位分值"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:660
CLM.L["Description"] = "描述"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:268
CLM.L["Disable data synchronisation"] = "禁用数据同步"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:269
CLM.L["Disable data synchronisation. This might lead to unexpected consequences. Use this at your own risk. Requires /reload to apply."] = "禁用数据同步。这可能会导致意想不到的后果。使用它需要您自担风险。需要 /reload 才能应用。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:453
CLM.L["Disable"] = "禁用"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:39
CLM.L["Disables display of the changelog for any new version."] = "禁止显示任何新版本的更新日志。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:259
CLM.L["Display price"] = "显示物品分值"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:80
CLM.L["Do not show again"] = "不再显示"
-- .:indirectly
CLM.L["Druid"] = "德鲁伊"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:967
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1061
CLM.L["Dynamic Item values"] = "动态物品分值"
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
CLM.L["ERROR - invalid import data"] = "错误 - 无效的导入数据"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:19
CLM.L["Ebonroc"] = "埃博诺克"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:56
CLM.L["Edge of Madness"] = "疯狂之缘"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:122
CLM.L["Emalon the Storm Watcher"] = "风暴看守者埃玛尔隆"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:432
CLM.L["Enable !dkp and !bid through whisper / raid. Change requires /reload."] = "启用 !dkp 和 !bid 通过密语/团队频道 。更改请重新加载界面。"
-- ClassicLootManager_Integrations/Integrations.lua:124
CLM.L["Enable Gargul integration. This will allow Gargul to take control over some aspects of CLM (starting auction from Gargul, and awarding)."] = "启用 Gargul 集成。这将允许 Gargul 控制 CLM 的某些方面（从 Gargul 开始拍卖及分配）。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:981
CLM.L["Enable OS bids"] = "启用副天赋出价"
-- ClassicLootManager_Integrations/Integrations.lua:239
CLM.L["Enable RCLC integration. This will allow awarding DKP/GP points on RCLC item award. Requires /reload."] = "启用 RCLC 集成。这将允许通过 RCLC 物品分配获得DKP/GP分数。更改请重新加载界面。"
-- ClassicLootManager_Integrations/Integrations.lua:362
CLM.L["Enable WoW DKP Bot Integration. This will result in additional data stored upon logout."] = "启用 WoW DKP 机器人集成。这会在注销时存储额外的数据。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:210
CLM.L["Enable announcing auction start and end."] = "启用通告宣布拍卖开始和结束。"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:89
CLM.L["Enable auto-update bid values when current highest bid changes (open auction only)."] = "启用当前最高出价发生变化时自动更新价格（仅限公开拍卖）。"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:88
CLM.L["Enable auto-update bid values"] = "启用自动更新竞拍值"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:431
CLM.L["Enable chat commands"] = "启用聊天频道指令"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:331
CLM.L["Enable loot auto-assign (Master Looter UI) from corpse when item is awarded"] = "启用从尸体上自动分配物品（队长分配）"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1129
CLM.L["Enable paid value splitting amongst raiders."] = "Enable paid value splitting amongst raiders."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:989
CLM.L["Enable to allow base bids even if higher bids are present if player didn't bid yet. Affects Open-Ascending Auction."] = "启用在玩家尚未出价的情况下，即使已有更高的出价，也允许基础出价。影响开放式拍卖(Open-Ascending)。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1005
CLM.L["Enable to allow equal bids. Affects Open-Ascending Auction."] = "启用允许相同的出价。影响开放式拍卖(Open-Ascending)。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:997
CLM.L["Enable to always allow All-In bids. Affects Open-Ascending Auction."] = "启用始终允许All-in出价。影响开放式拍卖(Open-Ascending)。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1013
CLM.L["Enable to always allow cancelling or passing bids. Affects Open-Ascending Auction."] = "启用始终允许取消或跳过出价。影响开放式拍卖(Open-Ascending)。"
-- ClassicLootManager/MinimapIcon.lua:78
CLM.L["Enables / disables minimap Icon"] = "启用/禁用小地图图标"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:34
CLM.L["Enables / disables verbose data printing during logging"] = "启用/禁用在记录期间print详细数据"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:218
CLM.L["Enables announcing chat commands at auction start."] = "启用在拍卖开始时通告聊天频道指令。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:234
CLM.L["Enables announcing loot awards."] = "启用通告战利品。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:242
CLM.L["Enables announcing new highest bid (when applicable)."] = "启用通告新的最高出价（如果适用）。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:201
CLM.L["Enables announcing raid start and end."] = "启用通告团本活动开始和结束。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:340
CLM.L["Enables auto-trade awarded loot after auctioning from bag"] = "启用背包拍卖后自动交易战利品"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:260
CLM.L["Enables displaying item price on tooltip."] = "启用在Tooltip上显示物品分值。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:226
CLM.L["Enables raid-warning countdown for auctions."] = "启用团队通知拍卖倒计时。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:747
CLM.L["End Timetravel"] = "结束时间旅行模式"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:400
CLM.L["End selected raid"] = "结束选中的团本活动"
-- ClassicLootManager/Utils.lua:871
CLM.L["Epic"] = "史诗"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:455
CLM.L["Equation"] = "方程"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:111
CLM.L["Eredar Twins"] = "艾瑞达双子"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:787
CLM.L["Europe"] = "欧洲"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:293
CLM.L["Execute decay for players based on context."] = "根据所选范围为角色执行衰减。"
-- ClassicLootManager_Integrations/Migration.lua:432
CLM.L["Execute migration from MonolithDKP, EssentialDKP, CommunityDKP, BastionLoot or CEPGP"] = "从 MonolithDKP、EssentialDKP, CommunityDKP, BastionLoot 或 CEPGP 执行迁移"
-- ClassicLootManager_Integrations/Migration.lua:52
CLM.L["Executing Addon Migration with comms disabled."] = "在禁用通信的情况下执行插件迁移。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:479
CLM.L["Exponent / Base"] = "指数 /基础"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:474
CLM.L["Exponential scaling value used by the equations (Base for EPGPWeb, or Exponent for WoWpedia)"] = "方程式使用的指数缩放值（EPGPWEB的基础或WoWpedia指数）"
-- ClassicLootManager/MinimapIcon.lua:127
-- ClassicLootManager_Integrations/GUI.lua:403
-- ClassicLootManager_Integrations/GUI.lua:412
-- ClassicLootManager_Integrations/GUI.lua:489
-- ClassicLootManager_Integrations/GUI.lua:490
CLM.L["Export"] = "导出"
-- ClassicLootManager/Modules/GUI/Filters.lua:83
CLM.L["External"] = "公会外"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:140
CLM.L["Faction Champions"] = "阵营冠军"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:40
CLM.L["False"] = "关闭"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:26
CLM.L["Fankriss the Unyielding"] = "顽强的范克瑞斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:81
CLM.L["Fathom-Lord Karathress"] = "深水领主卡拉瑟雷斯"
-- ClassicLootManager_Integrations/GUI.lua:141
CLM.L["February"] = "二月"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:724
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:757
CLM.L["Feet"] = "脚"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:110
CLM.L["Felmyst"] = "菲米丝"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:146
CLM.L["Festergut"] = "烂肠"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:353
CLM.L["Fill auction list from corpse"] = "将尸体掉落添加到拍卖清单"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:354
CLM.L["Fill auction list with items from corpse. Will happen only if you open the corpse loot window."] = "将尸体掉落添加到拍卖清单。只有在打开尸体战利品窗口时才会启用。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:371
CLM.L["Fill auction list with looted items"] = "将获得的战利品添加到拍卖清单"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:372
CLM.L["Fill auction list with looted items. This will automatically add all items you have received."] = "将获得的战利品添加到拍卖清单。这将自动添加您收到的所有物品。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:99
CLM.L["Fill from Guild"] = "从公会导入"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:111
CLM.L["Fill from Raid Roster"] = "从团队导入"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:363
CLM.L["Fill from corpse only if you are the Loot Master."] = "仅当您是Loot Master时才从尸体掉落添加。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:381
CLM.L["Fill from loot only if you are using Group Loot."] = "仅在使用队长分配时才从获得的战利品添加。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:112
CLM.L["Fill profile list with players in current raid roster."] = "从团队导入角色信息。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:100
CLM.L["Fill profile list with players with the minimum level and ranks."] = "根据选择的最低等级和会阶导入角色信息。"
-- ClassicLootManager/Modules/GUI/Filters.lua:167
CLM.L["Filter"] = "过滤器"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:725
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:758
CLM.L["Finger"] = "手指"
-- ClassicLootManager_Integrations/GUI.lua:287
CLM.L["Finish Day"] = "完成日"
-- ClassicLootManager_Integrations/GUI.lua:298
CLM.L["Finish Month"] = "完成月份"
-- ClassicLootManager_Integrations/GUI.lua:309
CLM.L["Finish Year"] = "完成年份"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:527
CLM.L["Finished raid %s"] = "已完成的团本活动 %s"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:795
CLM.L["Finished"] = "已完成"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:18
CLM.L["Firemaw"] = "费尔默"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:127
CLM.L["Flame Leviathan"] = "烈焰巨兽"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:20
CLM.L["Flamegor"] = "弗莱格尔"
-- ClassicLootManager_Integrations/GUI.lua:238
CLM.L["Format"] = "格式"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:104
CLM.L["Found %s in guild."] = "已找到 %s 在公会中。"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:128
CLM.L["Freya"] = "弗蕾亚"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:222
CLM.L["GM"] = "Guild Master"
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
CLM.L["Gahz'ranka"] = "加兹兰卡"
-- ClassicLootManager_Integrations/Integrations.lua:117
-- ClassicLootManager_Integrations/Integrations.lua:123
CLM.L["Gargul Integration"] = "Gargul集成"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:8
CLM.L["Garr"] = "加尔"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:247
CLM.L["Gear Points"] = "GP"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:7
CLM.L["Gehennas"] = "基赫纳斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:59
CLM.L["General Rajaxx"] = "拉贾克斯将军"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:129
CLM.L["General Vezax"] = "维扎克斯将军"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:157
CLM.L["General Zarithrian"] = "萨瑞瑟里安将军"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:674
CLM.L["General settings"] = "通用设置"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:711
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:744
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:97
CLM.L["Global"] = "通用"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:37
CLM.L["Gluth"] = "格拉斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:12
CLM.L["Golemagg the Incinerator"] = "焚化者古雷曼格"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:43
CLM.L["Gothik the Harvester"] = "收割者戈提克"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:33
CLM.L["Grand Widow Faerlina"] = "黑女巫法琳娜"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:36
CLM.L["Grobbulus"] = "格罗布鲁斯"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:380
CLM.L["Group Loot Only"] = "仅组战利品"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:76
CLM.L["Gruul the Dragonkiller"] = "屠龙者格鲁尔"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:299
CLM.L["Gruul's Lair"] = "格鲁尔的巢穴"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:92
CLM.L["Gurtogg Bloodboil"] = "古尔图格·血沸"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:55
CLM.L["Hakkar"] = "哈卡"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:105
CLM.L["Halazzi"] = "哈尔拉兹"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:159
CLM.L["Halion"] = "海里昂"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:721
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:754
CLM.L["Hands"] = "手"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:880
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:109
CLM.L["Hard cap"] = "最大上限"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:712
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:745
CLM.L["Head"] = "头部"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:156
CLM.L["Healer"] = "治疗者"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:40
CLM.L["Heigan the Unclean"] = "肮脏的希尔盖"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:730
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:763
CLM.L["Held In Off-hand"] = "副手物品"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:106
CLM.L["Hex Lord Malacrass"] = "妖术领主玛拉卡斯"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:441
CLM.L["Hides incoming !dkp and !bid whispers. Change requires /reload."] = "隐藏收到的 !dkp 和 !bid 密语。更改需要重新加载界面。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:450
CLM.L["Hides outgoing !dkp and !bid responses. Change requires /reload."] = "隐藏发出的 !dkp 和 !bid 密语。更改需要重新加载界面。"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:86
CLM.L["High Astromancer Solarian"] = "大星术师索兰莉安"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:75
CLM.L["High King Maulgar"] = "莫加尔大王"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:48
CLM.L["High Priest Thekal"] = "高阶祭司塞卡尔"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:49
CLM.L["High Priest Venoxis"] = "高阶祭司温诺希斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:50
CLM.L["High Priestess Arlokk"] = "高阶祭司娅尔罗"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:51
CLM.L["High Priestess Jeklik"] = "高阶祭司耶克里克"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:52
CLM.L["High Priestess Mar'li"] = "高阶祭司玛尔里"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:88
CLM.L["High Warlord Naj'entus"] = "高阶督军纳因图斯"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:127
CLM.L["History type"] = "历史记录类型"
-- .:indirectly
CLM.L["History"] = "历史记录"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:130
CLM.L["Hodir"] = "霍迪尔"
-- .:indirectly
CLM.L["Hunter"] = "猎人"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:78
CLM.L["Hydross the Unstable"] = "不稳定的海度斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:351
CLM.L["Hyjal Summit"] = "海加尔峰"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:468
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:585
CLM.L["Icecrown Citadel"] = "冰冠堡垒"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:148
CLM.L["Icecrown Gunship Battle"] = "冰冠炮舰战斗"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:131
CLM.L["Ignis the Furnace Master"] = "掌炉者伊格尼斯"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:39
CLM.L["Ignore entry"] = "忽略条目"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:408
CLM.L["Ignore"] = "忽略"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:96
CLM.L["Illidan Stormrage"] = "伊利丹·怒风"
-- ClassicLootManager_Integrations/Migration.lua:246
-- ClassicLootManager_Integrations/Migration.lua:380
-- ClassicLootManager_Integrations/Migration.lua:424
CLM.L["Import complete"] = "导入完成"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:442
-- ClassicLootManager_Integrations/ImportCSV.lua:100
-- ClassicLootManager_Integrations/ImportCSV.lua:162
-- ClassicLootManager_Integrations/ImportCSV.lua:163
-- ClassicLootManager_Integrations/ImportCSV.lua:191
CLM.L["Import"] = "导入"
-- ClassicLootManager_Integrations/Migration.lua:197
CLM.L["Importing %s entries from DKPTable"] = "正在导入 %s 条目从 DKPTable"
-- ClassicLootManager_Integrations/Migration.lua:308
CLM.L["Importing profiles from DKPTable"] = "从 DKPTable 导入角色信息"
-- ClassicLootManager/Modules/GUI/Filters.lua:82
CLM.L["In Guild"] = "在公会"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:794
CLM.L["In Progress"] = "进行中"
-- ClassicLootManager/Modules/GUI/Filters.lua:79
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:291
CLM.L["In Raid"] = "在团队"
-- ClassicLootManager/MinimapIcon.lua:48
CLM.L["In-Sync"] = "同步中"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:830
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:140
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:127
CLM.L["Include bench"] = "包括替补"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:831
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:141
CLM.L["Include benched players in all auto-awards"] = "在所有自动奖励中包括替补角色"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:279
CLM.L["Include players with negative standings in decay."] = "包括在衰退中分数是负数的角色。"
-- ClassicLootManager/MinimapIcon.lua:46
CLM.L["Incoherent state"] = "Incoherent state"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:167
CLM.L["Info"] = "信息"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:409
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:415
CLM.L["Information"] = "信息"
-- ClassicLootManager_Integrations/ImportCSV.lua:73
CLM.L["Input CSV Item value override data"] = "输入 CSV 物品分值覆盖数据"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:99
CLM.L["Input name: %s"] = "输入名字: %s"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:42
CLM.L["Instructor Razuvious"] = "教官拉苏维奥斯"
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:138
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:143
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:148
-- ClassicLootManager_Integrations/ClassicLootManager_Integrations.lua:20
CLM.L["Integrations"] = "集成"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:103
CLM.L["Interval Bonus time"] = "时长奖励时间间隔"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:444
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:806
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:117
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:250
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:100
CLM.L["Interval Bonus"] = "时长奖励"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:813
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:124
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:252
CLM.L["Interval Time"] = "间隔时间"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:822
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:132
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:253
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:106
CLM.L["Interval Value"] = "时长奖励分值"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:814
CLM.L["Interval in [minutes] to award bonus points"] = "奖励分数的间隔 [分钟]"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1083
CLM.L["Invalid bid value"] = "无效的竞拍数值"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:324
CLM.L["Invalid context. You should not decay raid only."] = "无效的范围。你不应该只衰减团队。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1089
CLM.L["Invalid item"] = "无效的物品"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:56
CLM.L["Invalid value provided"] = "提供的值无效"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:61
CLM.L["Item Value Mode"] = "物品分值模式"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:959
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1114
CLM.L["Item value mode"] = "物品分值模式"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1067
CLM.L["Item value overrides"] = "物品分数覆盖"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:91
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:99
CLM.L["Item"] = "物品"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:104
CLM.L["Jan'alai"] = "加亚莱"
-- ClassicLootManager_Integrations/GUI.lua:140
CLM.L["January"] = "一月"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:54
CLM.L["Jin'do the Hexxer"] = "妖术师金度"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:82
CLM.L["Join our discord for more info: "] = "加入我们的Discord以获取更多信息："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:414
CLM.L["Join selected raid"] = "加入选中的团本活动"
-- ClassicLootManager_Integrations/GUI.lua:146
CLM.L["July"] = "七月"
-- ClassicLootManager_Integrations/GUI.lua:145
CLM.L["June"] = "六月"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:87
CLM.L["Kael'thas Sunstrider"] = "凯尔萨斯·逐日者"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:108
CLM.L["Kalecgos"] = "卡雷苟斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:282
CLM.L["Karazhan"] = "卡拉赞"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:99
CLM.L["Kaz'rogal"] = "卡兹洛加"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:46
CLM.L["Kel'Thuzad"] = "克尔苏加德"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:113
CLM.L["Kil'jaeden"] = "基尔加丹"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:132
CLM.L["Kologarn"] = "科隆加恩"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:123
CLM.L["Koralon the Flame Watcher"] = "火焰看守者科拉隆"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:58
CLM.L["Kurinnaxx"] = "库林纳克斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:149
CLM.L["Lady Deathwhisper"] = "亡语者女士"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:83
CLM.L["Lady Vashj"] = "瓦丝琪"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:365
CLM.L["Large value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "分级拍卖的大值。\n\n设置为与其他层相同的值或忽略忽略。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:821
CLM.L["Large"] = "Large"
-- ClassicLootManager_Integrations/GUI.lua:327
CLM.L["Last month"] = "上个月"
-- ClassicLootManager_Integrations/GUI.lua:320
CLM.L["Last week"] = "上周"
-- ClassicLootManager_Integrations/GUI.lua:334
CLM.L["Last year"] = "去年"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:429
CLM.L["Latest loot"] = "最新战利品"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:452
CLM.L["Latest points"] = "最新分数"
-- ClassicLootManager/Utils.lua:872
CLM.L["Legendary"] = "传奇"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:723
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:756
CLM.L["Legs"] = "腿部"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:80
CLM.L["Leotheras the Blind"] = "盲眼者莱欧瑟拉斯"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:20
CLM.L["Link Alt to Main"] = "将小号链接到主号"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:445
CLM.L["Linking override"] = "链接覆盖"
-- ClassicLootManager/MinimapIcon.lua:42
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:347
CLM.L["Loading..."] = "正在加载..."
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:41
CLM.L["Loatheb"] = "洛欧塞布"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:266
CLM.L["Lock selected"] = "锁定中的"
-- ClassicLootManager/Modules/GUI/Filters.lua:85
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:397
CLM.L["Locked"] = "锁定"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:24
CLM.L["Logging level"] = "日志记录级别"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:20
CLM.L["Logging"] = "日志记录"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:233
CLM.L["Loot Awards"] = "战利品奖励"
-- ClassicLootManager_Integrations/GUI.lua:26
CLM.L["Loot History"] = "战利品历史记录"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:389
CLM.L["Loot rarity"] = "战利品稀有度"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:24
CLM.L["Loot"] = "战利品"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:141
CLM.L["Lord Jaraxxus"] = "加拉克苏斯大王"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:150
CLM.L["Lord Marrowgar"] = "玛洛加尔领主"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:5
CLM.L["Lucifron"] = "鲁西弗隆"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:112
CLM.L["M'uru"] = "穆鲁"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:416
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:163
-- ClassicLootManager_Integrations/Integrations.lua:137
-- ClassicLootManager_Integrations/Integrations.lua:142
CLM.L["MS"] = "主天赋"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:34
CLM.L["Maexxna"] = "迈克斯纳"
-- .:indirectly
CLM.L["Mage"] = "法师"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:6
CLM.L["Magmadar"] = "玛格曼达"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:77
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:307
CLM.L["Magtheridon"] = "玛瑟里顿"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:66
CLM.L["Maiden of Virtue"] = "贞节圣女"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:728
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:761
CLM.L["Main Hand"] = "主手"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:175
CLM.L["Main"] = "主号"
-- ClassicLootManager/Modules/GUI/Filters.lua:84
CLM.L["Mains"] = "主号"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:13
CLM.L["Majordomo Executus"] = "管理者埃克索图斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:120
CLM.L["Malygos"] = "玛里苟斯"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:141
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:73
CLM.L["Management"] = "管理"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:224
CLM.L["Manager"] = "Manager"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:438
CLM.L["Manual adjustment"] = "手动调整"
-- ClassicLootManager_Integrations/GUI.lua:142
CLM.L["March"] = "三月"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:362
CLM.L["Master Loot Only"] = "仅Master Loot"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:822
CLM.L["Max"] = "Max"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:872
CLM.L["Maximum point cap player can receive per raid week. Set to 0 to disable."] = "每周角色可以获得的最大分数上限。设置为 0 以禁用。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:881
CLM.L["Maximum point cap that player can have. Set to 0 to disable."] = "角色可以拥有的最大分数上限。设置为 0 以禁用。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:369
CLM.L["Maximum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Maximum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."
-- ClassicLootManager_Integrations/GUI.lua:144
CLM.L["May"] = "五月"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:361
CLM.L["Medium value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Medium value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:820
CLM.L["Medium"] = "Medium"
-- ClassicLootManager/MinimapIcon.lua:100
CLM.L["Menu"] = "菜单"
-- ClassicLootManager_Integrations/Migration.lua:184
-- ClassicLootManager_Integrations/Migration.lua:262
-- ClassicLootManager_Integrations/Migration.lua:391
CLM.L["Migrating %s"] = "迁移 %s"
-- ClassicLootManager_Integrations/Migration.lua:66
CLM.L["Migration complete. %s to apply and sync with others or go to %s to discard."] = "迁移完成。 %s 来应用并同步给他人，或者 %s 来删除。"
-- ClassicLootManager_Integrations/Migration.lua:285
CLM.L["Migration failure: Detected 0 teams"] = "迁移失败：检测到 0 个团队"
-- ClassicLootManager_Integrations/Migration.lua:223
-- ClassicLootManager_Integrations/Migration.lua:339
CLM.L["Migration failure: Unable to create profiles"] = "迁移失败：无法创建角色信息"
-- ClassicLootManager_Integrations/Migration.lua:35
CLM.L["Migration ongoing: %s(%s)"] = "Migration ongoing: %s(%s)"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:133
CLM.L["Mimiron"] = "米米尔隆"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:121
CLM.L["Min bid increment"] = "最小竞拍增量"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1159
CLM.L["Minimal increment"] = "最小增量"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1160
CLM.L["Minimal value increment for open auction mode."] = "公开拍卖模式的最小增值。"
-- ClassicLootManager_Integrations/Migration.lua:68
CLM.L["Minimap Icon -> Configuration -> Wipe events"] = "小地图图标 -> 配置 -> 删除事件"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:934
CLM.L["Minimum GP used in calculations when player has less GP than this value."] = "当角色的 GP 低于此值时，计算中使用minGP。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:933
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:145
CLM.L["Minimum GP"] = "最低GP"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:86
CLM.L["Minimum Level"] = "最低等级"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:87
CLM.L["Minimum level of players to fill from guild."] = "从公会导入的最低角色等级。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:142
CLM.L["Minimum points (DKP / EP)"] = "最低分数（DKP / EP）"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1021
CLM.L["Minimum standing required to be allowed to bid."] = "允许参与竞拍的最低分数。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1020
CLM.L["Minimum standing"] = "最低分数"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:233
CLM.L["Missing award value"] = "缺少分值"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:322
CLM.L["Missing decay value"] = "缺少衰减值"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:321
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:393
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:432
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:461
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:495
CLM.L["Missing valid raid"] = "缺少有效的团队/团本活动"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:60
CLM.L["Moam"] = "莫阿姆"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:235
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:398
CLM.L["Modifier combination"] = "修饰符组合"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:185
CLM.L["Molten Core"] = "熔火之心"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:65
CLM.L["Moroes"] = "莫罗斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:82
CLM.L["Morogrim Tidewalker"] = "莫洛格里·踏潮者"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:94
CLM.L["Mother Shahraz"] = "莎赫拉丝主母"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:410
CLM.L["Multiple"] = "多个"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:527
CLM.L["Multiplier for tier %s (if used by the auction type)."] = "系数 for tier %s （如果采用 Tiered 模式）。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:463
CLM.L["Multiplier used by the equations"] = "公式使用的系数"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:468
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:287
CLM.L["Multiplier"] = "系数"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:103
CLM.L["Nalorakk"] = "纳洛拉克"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:679
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:355
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:366
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:261
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:174
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:527
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:393
CLM.L["Name"] = "名字"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:148
CLM.L["Named Buttons"] = "命名按钮"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:230
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:389
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:506
CLM.L["Naxxramas"] = "纳克萨玛斯"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:713
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:746
CLM.L["Neck"] = "颈部"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:22
CLM.L["Nefarian"] = "奈法利安"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:71
CLM.L["Netherspite"] = "虚空幽龙"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:38
CLM.L["Never show changelog"] = "不再显示更新日志"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:911
CLM.L["New highest bid on %s: %s %s %s"] = "给 %s 的新最高出价：%s %s %s"
-- ClassicLootManager_Integrations/Migration.lua:111
CLM.L["New roster: [%s]"] = "新名册: [%s]"
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:61
CLM.L["New version %s of Classic Loot Manager is available. For best experience please update the AddOn."] = "新版本 %s 的 Classic Loot Manager 可用。为了获得最佳体验请更新插件。"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:74
CLM.L["Nightbane"] = "夜之魇"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1085
CLM.L["No auction in progress"] = "没有进行中的拍卖"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:198
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:176
CLM.L["No bids"] = "没有出价"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:446
CLM.L["No loot received"] = "没有收到战利品"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:220
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:311
CLM.L["No players selected"] = "未选择角色"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:475
CLM.L["No points received"] = "未获得分数"
-- ClassicLootManager/Utils.lua:502
CLM.L["No"] = "否"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:735
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:768
CLM.L["Non-equippable"] = "不可装备"
-- ClassicLootManager/Modules/GUI/Filters.lua:195
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:302
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:268
-- ClassicLootManager_Integrations/Integrations.lua:648
CLM.L["None"] = "无"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:142
CLM.L["Northrend Beasts"] = "诺森德猛兽"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1078
CLM.L["Not in a roster"] = "不在名册中"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:570
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:615
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:524
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:255
CLM.L["Not in raid"] = "不在团队/团本活动中"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:156
CLM.L["Note to be added to award. Max 25 characters. It is recommended to not include date nor selected reason here. If you will input encounter ID it will be transformed into boss name."] = "最多 25 个字符。建议不要在此处包含日期或选择的原因。如果您输入BOSS战ID，它将被转换为BOSS名称。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:154
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:278
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:114
CLM.L["Note"] = "备注"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:39
CLM.L["Noth the Plaguebringer"] = "瘟疫使者诺斯"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:190
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:352
CLM.L["Notify that you are passing on the item."] = "通知您正在跳过该物品。"
-- ClassicLootManager_Integrations/GUI.lua:150
CLM.L["November"] = "十一月"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:657
CLM.L["Num"] = "#"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:980
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:417
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:176
-- ClassicLootManager_Integrations/Integrations.lua:147
-- ClassicLootManager_Integrations/Integrations.lua:152
CLM.L["OS"] = "副天赋"
-- ClassicLootManager_Integrations/GUI.lua:149
CLM.L["October"] = "十月"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:729
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:762
CLM.L["Off Hand"] = "副手"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1088
CLM.L["Off-spec bidding not allowed"] = "不允许副天赋出价"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:783
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:94
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:242
CLM.L["On Time Bonus Value"] = "集合奖励分值"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:91
CLM.L["On Time Bonus value"] = "集合奖励分值"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:431
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:776
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:87
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:240
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:88
CLM.L["On Time Bonus"] = "集合奖励"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:727
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:760
CLM.L["One-Hand"] = "单手"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:838
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:130
CLM.L["Online only"] = "仅限在线"
-- ClassicLootManager/Modules/GUI/Filters.lua:80
CLM.L["Online"] = "在线的"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:177
CLM.L["Only when ML/RL"] = "仅当 ML/RL"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:4
CLM.L["Onyxia"] = "奥妮克希亚"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:178
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:486
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:603
CLM.L["Onyxia's Lair"] = "奥妮克希亚的巢穴"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:123
CLM.L["Open Key Bindings UI for AddOns"] = "为插件打开按键绑定界面"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:633
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:640
CLM.L["Open"] = "公开"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:67
CLM.L["Opera Hall"] = "歌剧院"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:63
CLM.L["Ossirian the Unscarred"] = "无疤者奥斯里安"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1153
CLM.L["Other"] = "其他"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:30
CLM.L["Ouro"] = "奥罗"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:76
CLM.L["Overrides"] = "覆盖"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1030
CLM.L["PASS"] = "跳过"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:942
CLM.L["PR Rounding"] = "PR 四舍五入"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:367
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:818
CLM.L["PR"] = "PR"
-- .:indirectly
CLM.L["Paladin"] = "圣骑士"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:289
CLM.L["Participated"] = "参与"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:312
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:332
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:418
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:189
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:351
CLM.L["Pass"] = "跳过"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1087
CLM.L["Passing after bidding not allowed"] = "不允许出价后跳过"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:35
CLM.L["Patchwerk"] = "帕奇维克"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:121
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:115
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:178
CLM.L["Player"] = "角色"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:362
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:375
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:392
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:406
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:420
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:439
CLM.L["Please select a raid"] = "请选择一个团本活动"
-- ClassicLootManager_Integrations/GUI.lua:25
CLM.L["Point History"] = "分数历史记录"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:912
CLM.L["Point award multiplier for players on bench."] = "替补角色获得分数的系数"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:856
CLM.L["Point caps"] = "分数上限"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:686
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1209
CLM.L["Point type"] = "分数类型"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:25
CLM.L["Point"] = "分数"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:179
CLM.L["Points value that will be awarded."] = "将被分配的分值。"
-- ClassicLootManager/Utils.lua:867
CLM.L["Poor"] = "较差的"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:70
CLM.L["Post bids"] = "通告竞拍"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:72
CLM.L["Post channel"] = "发布频道"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:255
CLM.L["Price Tooltips"] = "价格Tooltip"
-- .:indirectly
CLM.L["Priest"] = "牧师"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:73
CLM.L["Prince Malchezaar"] = "玛克扎尔王子"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:28
CLM.L["Princess Huhuran"] = "哈霍兰公主"
-- ClassicLootManager_Integrations/Integrations.lua:142
-- ClassicLootManager_Integrations/Integrations.lua:152
CLM.L["Prioritized"] = "优先"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:151
CLM.L["Professor Putricide"] = "普崔塞德教授"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:257
CLM.L["Profile %s already exists and is used by different GUID %s (%s). "] = "角色信息 %s 已存在，被不同的GUID占用 %s (%s)。 "
-- .:indirectly
CLM.L["Profiles"] = "角色信息"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:434
CLM.L["Progression Bonus"] = "进度奖励"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:377
CLM.L["Provide number of raids needed for 100% attendance in a weekly reset. Between 1 - 50 raids. Defaults to 2. Requires /reload."] = "请提供每周所需参与的团本活动数量以达成 100% 出勤。选择 1 - 50 ，默认值为 2。需要重新加载界面。"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:395
CLM.L["Provide number of weeks that will be accounted for attendance. Between 1 - 1000 weeks. Defaults to 10. Requires /reload."] = "提供将计入出勤的周数。 1 - 1000 周之间。默认为 10。需要 /reload。"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:53
CLM.L["Prune profiles"] = "Prune profiles"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:904
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:149
CLM.L["Put players leaving raid on bench instead of removing them. To remove them completely they will need to be removed manually from the bench."] = "让离开团队的角色加入替补名单。要完全移除他们，需要手动将他们从替补名单中移除。"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:152
CLM.L["Queen Lana'thel"] = "鲜血女王兰娜瑟尔"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:739
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:772
CLM.L["Quiver"] = "箭袋"
-- ClassicLootManager_Integrations/Integrations.lua:232
-- ClassicLootManager_Integrations/Integrations.lua:238
CLM.L["RCLC Integration"] = "RCLC 集成"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:614
CLM.L["ROLL"] = "Roll"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:97
CLM.L["Rage Winterchill"] = "雷基·冬寒"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:14
CLM.L["Ragnaros"] = "拉格纳罗斯"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:247
CLM.L["Raid Completion Bonus Value"] = "解散奖励分值"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:97
CLM.L["Raid Completion Bonus value"] = "解散奖励分值"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:433
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:791
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:102
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:245
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:94
CLM.L["Raid Completion Bonus"] = "解散奖励"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:798
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:109
CLM.L["Raid Completion Value"] = "解散奖励分值"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:185
CLM.L["Raid Name"] = "团本活动名称"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:200
CLM.L["Raid Start/End"] = "团本活动开始/结束"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:196
CLM.L["Raid Warnings"] = "团队通告"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:425
CLM.L["Raid [%s] ended"] = "团本活动 [%s] 已结束"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:373
CLM.L["Raid [%s] started"] = "团本活动 [%s] 已开始"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:311
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:333
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:405
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:448
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:473
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:507
CLM.L["Raid management is disabled during time traveling."] = "在时间旅行模式中禁用团本活动管理。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:747
CLM.L["Raid"] = "团队"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:376
CLM.L["Raids needed in reset"] = "Raids needed in reset"
-- ClassicLootManager_Integrations/GUI.lua:27
CLM.L["Raids"] = "团本活动"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:734
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:767
CLM.L["Ranged (wands)"] = "远程（魔杖）"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:733
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:766
CLM.L["Ranged"] = "远程"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:77
CLM.L["Ranks"] = "会阶"
-- ClassicLootManager/Utils.lua:870
CLM.L["Rare"] = "稀有的"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:15
CLM.L["Razorgore the Untamed"] = "狂野的拉佐格尔"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:134
CLM.L["Razorscale"] = "锋鳞"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:169
CLM.L["Reason"] = "原因"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:358
CLM.L["Received"] = "收入"
-- ClassicLootManager_Integrations/Integrations.lua:137
-- ClassicLootManager_Integrations/Integrations.lua:147
CLM.L["Regular"] = "常规"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:740
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:773
CLM.L["Relic"] = "Relic"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:93
CLM.L["Reliquary of Souls"] = "灵魂之匣"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:254
CLM.L["Remove all items from auction list. Populates new one if there are any pending."] = "从拍卖列表中删除所有项目。如果有任何待处理，将添加到列表。"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:107
CLM.L["Remove all"] = "移除所有"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:83
CLM.L["Remove auction"] = "移除拍卖"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:661
CLM.L["Remove from roster"] = "从名册中删除"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:612
CLM.L["Remove from standby"] = "从替补名单中移除"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:264
CLM.L["Remove item from auction list after it's awarded."] = "分配后，从拍卖列表中移除物品。"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:96
CLM.L["Remove old"] = "移除旧的"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:263
CLM.L["Remove on award"] = "分配后移除"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:580
CLM.L["Remove override"] = "移除覆盖"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:740
CLM.L["Remove roster"] = "移除名册"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:433
CLM.L["Remove selected raid"] = "移除选中的团本活动"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:288
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:436
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:757
CLM.L["Remove selected"] = "移除选中的"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:746
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:399
CLM.L["Remove"] = "移除"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:747
CLM.L["Removes current roster."] = "移除当前名册。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:215
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:637
CLM.L["Removing items not allowed during auction."] = "在拍卖过程中移除不允许的物品。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:356
CLM.L["Request standby"] = "请求替补"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:102
CLM.L["Rescales CLM UI, except Bidding window. You can rescale Bidding window independently by using Ctrl + Mouse Wheel. Some windows may require closing and reopening."] = "重新调整 CLM UI，竞拍窗口除外。您可以使用 Ctrl + 鼠标滚轮独立重新调整竞拍窗口。某些窗口可能需要关闭和重新打开。"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:123
CLM.L["Reset gui positions"] = "重置 gui 位置"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:369
CLM.L["Revoke standby"] = "撤销替补"
-- .:indirectly
CLM.L["Rogue"] = "潜行者"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:176
CLM.L["Role"] = "角色"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:543
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:410
CLM.L["Roll"] = "卷"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1201
CLM.L["Roster Name"] = "名册名称"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1200
CLM.L["Roster name"] = "名册名称"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:109
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:120
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:746
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:308
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:104
-- ClassicLootManager_Integrations/ImportCSV.lua:91
CLM.L["Roster"] = "名册"
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:137
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:142
-- ClassicLootManager/Modules/Common/ConfigManager/ConfigManager.lua:147
CLM.L["Rosters"] = "名册"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:153
CLM.L["Rotface"] = "腐面"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:943
CLM.L["Round PR to selected number of decimals"] = "PR 四舍五入到选定的小数位数"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:700
CLM.L["Round to selected number of decimals"] = "四舍五入到选定的小数位数"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:118
CLM.L["Round to"] = "四舍五入到"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:699
CLM.L["Rounding"] = "四舍五入"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:267
CLM.L["Ruins of Ahn'Qiraj"] = "安其拉废墟"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:615
CLM.L["SK"] = "SK"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:847
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:133
CLM.L["Same zone only"] = "仅限同一区域"
-- ClassicLootManager/MinimapIcon.lua:56
CLM.L["Sandbox mode"] = "沙盒模式"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:45
CLM.L["Sapphiron"] = "萨菲隆"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:116
CLM.L["Sartharion"] = "萨塔里奥"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:158
CLM.L["Saviana Ragefire"] = "塞维娅娜·怒火"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:634
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:641
CLM.L["Sealed"] = "封闭"
-- ClassicLootManager/Modules/GUI/Filters.lua:212
CLM.L["Search for player names. Separate multiple with a comma ','. Minimum 3 characters. Overrides filtering."] = "搜索，用英文逗号','分隔多个。至少3个字母。覆盖过滤器。"
-- ClassicLootManager/Modules/GUI/Filters.lua:211
CLM.L["Search"] = "搜索"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1210
CLM.L["Select DKP or EPGP point system."] = "选择 DKP 或 EPGP 分数系统。"
-- ClassicLootManager_Integrations/GUI.lua:380
CLM.L["Select Profiles to export"] = "选择要导出的角色信息"
-- ClassicLootManager/Modules/Rosters/RosterManager/RosterManager.lua:412
CLM.L["Select Rosters to display"] = "选择要显示的名册"
-- ClassicLootManager_Integrations/GUI.lua:349
CLM.L["Select Rosters to export"] = "选择要导出的名册"
-- ClassicLootManager/Modules/GUI/Filters.lua:183
CLM.L["Select all classes."] = "选择所有职业。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:492
CLM.L["Select equation"] = "选择公式"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:25
CLM.L["Select logging level for troubleshooting"] = "选择日志记录级别以进行故障排除"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:187
CLM.L["Select loot rarity for the annoucement to raid."] = "选择在团队通告的战利品稀有度。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:390
CLM.L["Select loot rarity threshold to used to fill the auction list."] = "选择将会被添加到拍卖列表的战利品稀有度阈值。"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:236
CLM.L["Select modifier combination for awarding."] = "选择用于分配的修饰符组合。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:399
CLM.L["Select modifier combination for filling auction from bags and corpse."] = "选择修饰符组合用以从背包和尸体添加物品到拍卖列表。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:135
CLM.L["Select roster to add profiles to."] = "选择名册以添加角色信息。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:165
CLM.L["Select roster to create raid for."] = "选择要为其创建团本活动的名册。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:164
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:134
CLM.L["Select roster"] = "选择名册"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:863
CLM.L["Select weekly reset timezone. EU: Wed 07:00 GMT or US: Tue 15:00 GMT"] = "选择每周重置时区。EU：周三 07:00 GMT 或 US：周二 15:00 GMT"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:745
CLM.L["Selected"] = "已选中"
-- ClassicLootManager_Integrations/GUI.lua:148
CLM.L["September"] = "九月"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:314
CLM.L["Serpentshrine Cavern"] = "毒蛇神殿"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:472
CLM.L["Set %s points to %s players for %s in <%s>"] = "Set %s points to %s players for %s in <%s>"
-- ClassicLootManager_Integrations/Migration.lua:378
CLM.L["Set points for %s players for team to %s"] = "Set points for %s players for team to %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:186
CLM.L["Set raid name"] = "设置团本活动名称"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:90
CLM.L["Shade of Akama"] = "阿卡玛之影"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:70
CLM.L["Shade of Aran"] = "埃兰之影"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:117
CLM.L["Shadron"] = "沙德隆"
-- .:indirectly
CLM.L["Shaman"] = "萨满"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:10
CLM.L["Shazzrah"] = "沙斯拉尔"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:732
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:765
CLM.L["Shield"] = "盾牌"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:457
CLM.L["Shift + Alt"] = "Shift+Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:460
CLM.L["Shift + Ctrl + Alt"] = "Shift + Ctrl + Alt"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:459
CLM.L["Shift + Ctrl"] = "Shift + Ctrl"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:454
CLM.L["Shift"] = "Shift"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:715
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:748
CLM.L["Shirt"] = "衬衣"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:714
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:747
CLM.L["Shoulder"] = "肩部"
-- ClassicLootManager/Modules/Loot/LootManager/AwardGUI.lua:219
CLM.L["Show Award window"] = "展示奖励窗口"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:24
CLM.L["Silithid Royalty"] = "吉祥三宝"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:154
CLM.L["Sindragosa"] = "辛达苟萨"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:662
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:668
CLM.L["Single-Priced"] = "Single-Priced"
-- ClassicLootManager_Integrations/Migration.lua:179
CLM.L["Skipping %s"] = "跳过 %s"
-- ClassicLootManager_Integrations/Migration.lua:255
CLM.L["Skipping CommunityDKP"] = "跳过 CommunityDKP"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:498
CLM.L["Slot multipliers"] = "槽位系数"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:357
CLM.L["Small value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Small value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:819
CLM.L["Small"] = "Small"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:85
CLM.L["Spec guild request"] = "查看公会请求"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:357
CLM.L["Spent"] = "支出"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:796
CLM.L["Stale"] = "Stale"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:138
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:148
CLM.L["Standby %s has been sent"] = "Standby %s has been sent"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:435
CLM.L["Standby Bonus"] = "替补奖励"
-- ClassicLootManager/Modules/GUI/Filters.lua:81
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:300
CLM.L["Standby"] = "替补"
-- ClassicLootManager_Integrations/GUI.lua:24
CLM.L["Standings"] = "积分榜"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:386
CLM.L["Start selected raid"] = "开始选中的团本活动"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:500
CLM.L["Start"] = "开始"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:511
CLM.L["Started raid %s"] = "已开始团本活动 %s"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:419
CLM.L["Statistics"] = "统计数据"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:262
CLM.L["Status"] = "状态"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:500
CLM.L["Stop"] = "停止"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:64
CLM.L["Store bids"] = "保存竞拍记录"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:65
CLM.L["Store finished auction bids information."] = "保存完成的拍卖信息。"
-- ClassicLootManager_Integrations/ImportCSV.lua:118
CLM.L["Success"] = "成功"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:11
CLM.L["Sulfuron Harbinger"] = "萨弗隆先驱者"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:374
CLM.L["Sunwell Plateau"] = "太阳井高地"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:440
CLM.L["Suppress incoming whispers"] = "隐藏收到的密语"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:449
CLM.L["Suppress outgoing whispers"] = "隐藏发出的密语"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:81
CLM.L["Suppresses changelog display until new version is released"] = "禁止显示更新日志，直到发布新版本"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:89
CLM.L["Supremus"] = "苏普雷姆斯"
-- ClassicLootManager/MinimapIcon.lua:50
CLM.L["Sync ongoing"] = "同步进行中"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:602
CLM.L["TBC"] = "TBC"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:719
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:752
CLM.L["Tabard"] = "战袍"
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:155
CLM.L["Tank"] = "坦克"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1168
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:139
CLM.L["Tax"] = "税"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:326
CLM.L["Tempest Keep"] = "风暴要塞"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:215
CLM.L["Temple of Ahn'Qiraj"] = "安其拉神殿"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:118
CLM.L["Tenebron"] = "塔尼布隆"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:69
CLM.L["Terestian Illhoof"] = "特雷斯坦·邪蹄"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:91
CLM.L["Teron Gorefiend"] = "塔隆·血魔"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:38
CLM.L["Thaddius"] = "塔迪乌斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:135
CLM.L["The Assembly of Iron"] = "钢铁议会"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:68
CLM.L["The Curator"] = "馆长"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:420
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:537
CLM.L["The Eye of Eternity"] = "永恒之眼"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:44
CLM.L["The Four Horsemen"] = "天启四骑士"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:95
CLM.L["The Illidari Council"] = "伊利达雷议会"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:155
CLM.L["The Lich King"] = "巫妖王"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:79
CLM.L["The Lurker Below"] = "鱼斯拉"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:410
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:527
CLM.L["The Obsidian Sanctum"] = "黑曜石圣殿"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:23
CLM.L["The Prophet Skeram"] = "预言者斯克拉姆"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:493
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:610
CLM.L["The Ruby Sanctum"] = "红玉圣殿"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:136
CLM.L["Thorim"] = "托里姆"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:738
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:771
CLM.L["Thrown"] = "投掷"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:519
CLM.L["Tier multipliers"] = "Tier 系数"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:664
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:669
CLM.L["Tiered"] = "Tiered"
-- ClassicLootManager/MinimapIcon.lua:60
CLM.L["Time Traveling"] = "时间旅行模式启用中"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1045
CLM.L["Time in seconds by which auction will be extended if bid is received during last 10 seconds."] = "如果在最后 10 秒内收到出价，拍卖将延长的时间（以秒为单位）。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1029
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:658
CLM.L["Time"] = "时间"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:736
CLM.L["Timetravel"] = "开启时间旅行模式"
-- ClassicLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:305
CLM.L["Toggle Auction History window display"] = "开关拍卖历史窗口显示"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:677
CLM.L["Toggle Auctioning window display"] = "开关拍卖窗口显示"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:79
CLM.L["Toggle Bidding auto-open"] = "开关自动开启竞拍"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:84
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:877
CLM.L["Toggle Bidding window display"] = "开关竞拍窗口显示"
-- ClassicLootManager_Integrations/ImportCSV.lua:216
CLM.L["Toggle CSV import window display"] = "开关 CSV 导入窗口显示"
-- ClassicLootManager/MinimapIcon.lua:77
CLM.L["Toggle Minimap Icon"] = "开关小地图图标"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:80
CLM.L["Toggle auto open and auto close on auction start and stop"] = "开关在拍卖开始和停止时自动打开和自动关闭"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:48
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:160
CLM.L["Toggle changelog window display"] = "开关更新日志窗口"
-- ClassicLootManager/Modules/Common/Changelog/GUI.lua:47
CLM.L["Toggle changelog"] = "开关更新日志"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:69
CLM.L["Toggle closing bidding UI after submitting bid for all items."] = "开关提交所有物品出价后关闭竞拍界面。"
-- ClassicLootManager_Integrations/GUI.lua:518
CLM.L["Toggle export window display"] = "开关导出窗口显示"
-- ClassicLootManager/Modules/GUI/UnifiedGUI.lua:426
CLM.L["Toggle standings window display"] = "开关积分榜窗口显示"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:147
CLM.L["Toggles addon sounds."] = "开关插件声音。"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:169
CLM.L["Toggles loot announcement to raid"] = "开关战利品通告到团队频道"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:322
CLM.L["Toggles loot award announcement to guild"] = "开关战利品分配通告到公会频道"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:357
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:370
CLM.L["Too much data to display"] = "数据过多，无法显示"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:124
CLM.L["Toravon the Ice Watcher"] = "寒冰看守者图拉旺"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:422
CLM.L["Total blocked"] = "共被阻止"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:423
CLM.L["Total decayed"] = "共被衰减"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:421
CLM.L["Total received"] = "共获得"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:420
CLM.L["Total spent"] = "总花费"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:457
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:574
CLM.L["Trial of the Crusader"] = "十字军的试炼"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:726
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:759
CLM.L["Trinket"] = "饰品"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:40
CLM.L["True"] = "开启"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:29
CLM.L["Twin Emperors"] = "双子皇帝"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:247
CLM.L["Two different profiles exist for target GUID %s (%s:%s) and name %s (%s:%s). Verify and clean up profiles before updating."] = "两个不同的角色信息存在对目标 GUID %s (%s:%s) 和名字 %s (%s:%s).。请在更新之前验证并清理角色信息。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:731
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:764
CLM.L["Two-Hand"] = "双手"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:659
CLM.L["Type"] = "类型"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:101
CLM.L["UI Scale"] = "用户界面缩放"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:437
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:554
CLM.L["Ulduar"] = "奥杜尔"
-- ClassicLootManager_Integrations/Migration.lua:48
CLM.L["Unable to execute migration. Entries already exist."] = "无法执行迁移。条目已经存在。"
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:163
CLM.L["Unable to get item info from server. Please try auctioning again"] = "无法从服务器获取物品信息。请重新尝试拍卖"
-- ClassicLootManager/Utils.lua:869
CLM.L["Uncommon"] = "罕见"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:436
CLM.L["Unexcused absence"] = "无故缺席"
-- ClassicLootManager/MinimapIcon.lua:52
CLM.L["Unknown sync state"] = "无需同步"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:286
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Raids.lua:342
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:215
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:285
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:175
-- ClassicLootManager/Modules/Profiles/ProfileManager/Profile.lua:34
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:334
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:434
CLM.L["Unknown"] = "未知"
-- ClassicLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:304
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:29
CLM.L["Unlink Alt"] = "取消链接小号"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:275
CLM.L["Unlock selected"] = "解锁选中的"
-- ClassicLootManager_Integrations/Migration.lua:144
CLM.L["UpdatePoints(): Empty targets list"] = "UpdatePoints()：空目标列表"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:518
CLM.L["Updated raid <%s> %s joined, %s left, %s benched, %s removed"] = "已更新团本活动 <%s> %s 已加入, %s 已离开, %s 已替补, %s 已移除"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1083
CLM.L["Use named buttons"] = "使用命名按钮"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:16
CLM.L["Vaelastrasz the Corrupt"] = "堕落的瓦拉斯塔兹"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:143
CLM.L["Val'kyr Twins"] = "瓦格里双子"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:147
CLM.L["Valithria Dreamwalker"] = "踏梦者瓦莉瑟瑞娅"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_History.lua:168
-- ClassicLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:296
CLM.L["Value"] = "分值"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:427
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:544
CLM.L["Vault of Archavon"] = "阿尔卡冯的宝库"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:33
CLM.L["Verbose"] = "详情显示"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:75
CLM.L["Version check in guild"] = "在公会中进行版本检查"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:177
CLM.L["Version"] = "版本"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:119
CLM.L["Vesperon"] = "维斯匹隆"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:635
CLM.L["Vickrey"] = "Vickrey"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:27
CLM.L["Viscidus"] = "维希度斯"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:85
CLM.L["Void Reaver"] = "空灵机甲"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:722
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:755
CLM.L["Waist"] = "腰部"
-- .:indirectly
CLM.L["Warlock"] = "术士"
-- .:indirectly
CLM.L["Warrior"] = "战士"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:871
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:112
CLM.L["Weekly cap"] = "每周上限"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:413
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:416
CLM.L["Weekly gains"] = "本周收益"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:862
CLM.L["Weekly reset timezone"] = "每周重置时区"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:115
CLM.L["Weekly reset"] = "每周重置"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:178
CLM.L["When enabled, this will make loot announcement display only if you're Master Looter or Raid Leader (if there is no Master Looter)."] = "启用后，只有当您是 Master Looter 或 Raid Leader（如果没有 Master Looter）时，才会显示战利品通告。"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1084
CLM.L["Will display names of the buttons instead of values in bidding UI"] = "将在竞拍界面中显示按钮的名称而不是数值"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:155
CLM.L["Wipe events"] = "删除所有事件"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:41
CLM.L["Wipe"] = "删除"
-- ClassicLootManager/Modules/Global/GlobalConfigs.lua:156
CLM.L["Wipes all events from memory. This will trigger resyncing from other users."] = "从内存中清除所有事件。这将触发来自其他用户的重新同步。"
-- ClassicLootManager/Modules/Common/Logger/Logger.lua:42
CLM.L["Wipes the log history"] = "删除日志历史记录"
-- ClassicLootManager_Integrations/Integrations.lua:361
CLM.L["WoW DKP Bot Integration"] = "WoW DKP Bot集成"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:607
CLM.L["WotLK - 10"] = "WLK - 10人"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:612
CLM.L["WotLK - 25"] = "WLK - 25人"
-- ClassicLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:191
CLM.L["Wowpedia"] = "Wowpedia"
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:720
-- ClassicLootManager/Modules/Rosters/RosterManager/Roster.lua:753
CLM.L["Wrist"] = "手腕"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:137
CLM.L["XT-002 Deconstructor"] = "XT-002拆解者"
-- ClassicLootManager/Utils.lua:497
CLM.L["Yes"] = "是的"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:138
CLM.L["Yogg-Saron"] = "尤格萨隆"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:307
CLM.L["You are already in an active raid. Leave or finish it before creating new one."] = "你已经在一个正在进行的团本活动中。在创建新的之前离开或完成它。"
-- ClassicLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:662
CLM.L["You are not allowed to auction items"] = "您没有权限拍卖物品"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:465
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:499
CLM.L["You are not allowed to control raid."] = "您没有权限控制团本活动。"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:303
CLM.L["You are not allowed to create raids."] = "您没有权限创建团本活动。"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:436
CLM.L["You are not allowed to join raid."] = "您没有权限加入团本活动。"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:325
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:397
CLM.L["You are not allowed to start raid."] = "您没有权限开始团本活动。"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:338
CLM.L["You are not in the raid."] = "你不在团队/团本活动中。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:632
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:641
CLM.L["You can %s max %d players from standby at the same time to a %s raid."] = "您最多可以同时%s %d 名角色从替补名单到 %s 团本活动。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:587
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:596
CLM.L["You can %s max %d players to standby at the same time to a %s raid."] = "您最多可以同时%s %d 名角色到替补名单在 %s 团本活动。"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:469
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:503
CLM.L["You can only add players to standby of a progressing raid."] = "您只能将角色添加到正在进行的团本活动的替补名单。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:578
CLM.L["You can only bench players from same roster as the raid (%s)."] = "你只能从团队活动（%s）的同一个名册中添加替补角色。"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:401
CLM.L["You can only end an active raid."] = "您只能结束正在进行的团本活动。"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:440
CLM.L["You can only join an active raid."] = "你只能加入一个正在进行的团本活动。"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:444
CLM.L["You can only join different raid than your current one."] = "您只能加入与当前团本活动不同的团本活动。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:623
CLM.L["You can only remove from bench players from same roster as the raid (%s)."] = "你只能从团队活动（%s）的同一个名册中移除替补角色。"
-- ClassicLootManager/Modules/Raids/RaidManager/RaidManager.lua:329
CLM.L["You can only start a freshly created raid."] = "您只能开始新创建的团本活动。"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:675
CLM.L["You can remove max %d players from roster at the same time."] = "您最多可以从名册中同时移除 %d 名角色。"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:335
CLM.L["Your bid (%s) was denied: |cffcc0000%s|r"] = "你的竞拍 (%s) 被拒绝: |cffcc0000%s|r"
-- ClassicLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:314
CLM.L["Your bid (%s) was |cff00cc00accepted|r"] = "你的竞拍 (%s) |cff00cc00成功|r"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:67
CLM.L["Zero-Sum Bank Inflation"] = "Zero-Sum Bank Inflation"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1128
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:64
CLM.L["Zero-Sum Bank"] = "Zero-Sum Bank"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1136
CLM.L["Zero-Sum Inflation Value"] = "Zero-Sum Inflation Value"
-- ClassicLootManager/Modules/Points/PointManager/PointManager.lua:439
CLM.L["Zero-Sum award"] = "Zero-Sum award"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1122
CLM.L["Zero-Sum"] = "Zero-Sum"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:362
CLM.L["Zul'Aman"] = "祖阿曼"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:251
CLM.L["Zul'Gurub"] = "祖尔格拉布"
-- ClassicLootManager/Modules/Points/AutoAwardManager/EncounterIDs.lua:107
CLM.L["Zul'jin"] = "祖尔金"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:221
CLM.L["[All Roster Configs]: "] = "[所有名册配置]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:227
CLM.L["[All Roster Default Slot Values]: "] = "[所有名册默认槽位值]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:205
CLM.L["[Alt-Main Link]: "] = "[小号-主号链接]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:212
CLM.L["[Create Roster]: "] = "[创建名册]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:215
CLM.L["[Delete Roster]: "] = "[删除名册]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:290
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:532
CLM.L["[IGNORE]: Ignoring entry"] = "[IGNORE]：忽略条目"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:274
CLM.L["[Item Award in Raid]: "] = "[团本中的物品分配]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:271
CLM.L["[Item Award]: "] = "[物品分配]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:261
CLM.L["[Point Award to raid]: "] = "[团队分数奖励]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:258
CLM.L["[Point Award to roster]: "] = "[名册分数奖励]: "
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:252
CLM.L["[Point Award]: "] = "[分数奖励]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:264
CLM.L["[Point Decay for roster]: "] = "[名册分数衰减]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:255
CLM.L["[Point Decay]: "] = "[分数衰减]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:267
CLM.L["[Point Set]: "] = "[分数设置]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:208
CLM.L["[Profile Lock]: "] = "[角色信息锁定]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:278
CLM.L["[Raid Create]: "] = "[团本活动创建]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:287
CLM.L["[Raid Finish]: "] = "[团本活动结束]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:281
CLM.L["[Raid Start]: "] = "[团本活动开始]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:284
CLM.L["[Raid Update]: "] = "[团本活动更新]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:202
CLM.L["[Remove Profile]: "] = "[删除角色信息]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:218
CLM.L["[Rename Roster]: "] = "[重命名名册]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:245
CLM.L["[Roster Boss Kill Bonus]: "] = "[名册BOSS击杀奖励]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:224
CLM.L["[Roster Config]: "] = "[名册设置]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:242
CLM.L["[Roster Copy]: "] = "[复制名册]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:230
CLM.L["[Roster Default Slot Value]: "] = "[名册默认槽位值]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:248
CLM.L["[Roster Field Rename]: "] = "[名册字段重命名]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:236
CLM.L["[Roster Item Value Override Single]: "] = "[名册物品分数覆盖]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:233
CLM.L["[Roster Item Value Override]: "] = "[名册物品分数覆盖]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:239
CLM.L["[Roster Update Profiles]: "] = "[名册更新角色信息]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:199
CLM.L["[Update Profile]: "] = "[更新角色信息]："
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:408
CLM.L["[config] "] = "[配置]"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:410
CLM.L["[item values] "] = "[物品分数]"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:411
CLM.L["[profiles] "] = "[角色信息]"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:409
CLM.L["[slot defaults] "] = "[槽位默认值]"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:59
CLM.L["accepted"] = "被接受"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:588
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:597
CLM.L["add"] = "添加"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:46
CLM.L["cancel"] = "取消"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:597
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:642
CLM.L["created"] = "已创建"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:59
CLM.L["denied"] = "被拒绝"
-- ClassicLootManager_Integrations/Integrations.lua:343
CLM.L["else"] = "别的"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Audit.lua:465
CLM.L["excluding negatives "] = "不包括负数"
-- ClassicLootManager_Integrations/Integrations.lua:278
CLM.L["if reason/response contains"] = "如果原因/回复包含"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:58
CLM.L["level"] = "等级"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:48
CLM.L["pass"] = "跳过"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:588
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:633
CLM.L["progressing"] = "正在进行"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:61
CLM.L["rank"] = "会阶"
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:633
-- ClassicLootManager/Modules/GUI/UnifiedGUI_Standings.lua:642
CLM.L["remove"] = "移除"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:139
CLM.L["request"] = "请求"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:42
CLM.L["requested"] = "已请求"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:149
CLM.L["revoke"] = "撤销"
-- ClassicLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:72
CLM.L["revoked"] = "已撤销"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:98
CLM.L["roster"] = "名册"
-- ClassicLootManager/Modules/Global/GlobalChatMessageHandlers.lua:98
CLM.L["rosters"] = "名册"
-- ClassicLootManager_Integrations/Integrations.lua:288
CLM.L["then"] = "然后"
-- ClassicLootManager/Modules/Global/GlobalSlashCommands.lua:65
CLM.L["unguilded"] = "不在公会的"
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1107
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1179
CLM.L["|cff00ee44Open:|r English Auction with highest bidder announcement. Highest bidder wins. Two players can not bid same value. Additionally always allows bidding base to accomodate for Swedish Auction flavor.\n\n|cff00ee44Anonymous Open:|r Same as Open but highest bidder name is not disclosed.\n\n|cff00ee44Sealed:|r Bids are not announced. Highest bidder wins.\n\n|cff00ee44Vickrey:|r Same as sealed but winner pays with second-highest bid."] = "|cff00ee44Open:|r English Auction with highest bidder announcement. Highest bidder wins. Two players can not bid same value. Additionally always allows bidding base to accomodate for Swedish Auction flavor.\n\n|cff00ee44Anonymous Open:|r Same as Open but highest bidder name is not disclosed.\n\n|cff00ee44Sealed:|r Bids are not announced. Highest bidder wins.\n\n|cff00ee44Vickrey:|r Same as sealed but winner pays with second-highest bid."
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:960
-- ClassicLootManager/Modules/Rosters/RosterManager/Options.lua:1115
CLM.L["|cff00ee44Single-Priced:|r Static value mode. Only bidding Base value is supported.\n\n|cff00ee44Ascending:|r Ranged value mode. Allows bidding any value in |cff44ee00<base, max>|r.\n\n|cff00ee44Tiered:|r Ranged value mode. Allows bidding only specific values. Up to 5 tiers are configurable in |cff44ee00<base, small, medium, large, max>|r."] = "|cff00ee44Single-Priced:|r Static value mode. Only bidding Base value is supported.\n\n|cff00ee44Ascending:|r Ranged value mode. Allows bidding any value in |cff44ee00<base, max>|r.\n\n|cff00ee44Tiered:|r Ranged value mode. Allows bidding only specific values. Up to 5 tiers are configurable in |cff44ee00<base, small, medium, large, max>|r."
-- ClassicLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:54
CLM.L["|cffcc0000Your Classic Loot Manager is significantly out of date.|r AddOn communication has been disabled. Version %s is available. Please update as soon as possible."] = "|cffcc0000您的 Classic Loot Manager 版本已经严重过期。|r 插件通信已被禁用。有新版本 %s 可用，请尽快更新。"
end