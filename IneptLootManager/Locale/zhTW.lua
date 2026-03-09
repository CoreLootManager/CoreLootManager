local _, ILM = ...
if GetLocale() == "zhTW" then
-- IneptLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:351
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:323
ILM.L[" alt of: "] = " 的主号是: "
-- IneptLootManager/Utils.lua:584
ILM.L[" more"] = " 更多"
-- IneptLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:172
ILM.L[" over "] = " over "
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:396
ILM.L[" profile(s)"] = " 角色信息"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:321
ILM.L["% that will be decayed."] = "% 将要被衰减"
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:393
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:408
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:454
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:344
ILM.L["%Y/%m/%d %H:%M:%S (%A)"] = "%Y/%m/%d %H:%M:%S (%A)"
-- IneptLootManager_Integrations/Models/Exporter.lua:326
-- IneptLootManager_Integrations/Models/Exporter.lua:327
-- IneptLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:253
ILM.L["%Y/%m/%d %a %H:%M:%S"] = "%Y/%m/%d %a %H:%M:%S"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:591
ILM.L["%d/%m/%Y %H:%M:%S"] = "%d/%m/%Y %H:%M:%S"
-- IneptLootManager_Alerts/Alerts.lua:22
ILM.L["%s %% %s decay"] = "%s %% %s 衰减"
-- IneptLootManager_Alerts/Alerts.lua:20
ILM.L["%s %s"] = "%s %s"
-- IneptLootManager/Modules/Loot/LootManager/LootManager.lua:183
ILM.L["%s awarded to %s for %s %s"] = "%s 分配给 %s for %s %s"
-- IneptLootManager/MinimapIcon.lua:39
ILM.L["%s events (%s pending)"] = "%s 记录 (%s pending)"
-- IneptLootManager/MinimapIcon.lua:41
ILM.L["%s events (0x%x)"] = "%s 记录 (0x%x)"
-- IneptLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:38
-- IneptLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:68
ILM.L["%s has %s standby"] = "%s %s 替补"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:59
ILM.L["%s is not part of the %s roster"] = "%s 不在名册 %s 中"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:135
ILM.L["%s profile exists."] = "%s 角色信息已存在。"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:137
ILM.L["%s profile missing. Adding."] = "%s 角色信息缺失，正在添加。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:480
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:490
ILM.L["%s to %s for %s in <%s>"] = "%s to %s for %s in <%s>"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1038
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1046
ILM.L["%s to be awarded to player when joining roster."] = "%s 將獎勵給加入名單時的玩家。"
-- IneptLootManager/Modules/Auctioning/AutoAssign/GUI.lua:172
ILM.L["%s trade me for %s"] = "%s 交易我為 %s"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:143
ILM.L["%s was not found in guild."] = "%s 不在公会中。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:101
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:101
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:102
ILM.L["-- All --"] = "-- 全部 --"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:26
ILM.L["10 Player (Heroic)"] = "10人（英雄）"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:24
ILM.L["10 Player"] = "10人"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:25
ILM.L["20 Player"] = "20人"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:28
ILM.L["25 Player (Heroic)"] = "25人（英雄）"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:27
ILM.L["25 Player"] = "25人"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:22
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:23
ILM.L["40 Player"] = "40人"
-- IneptLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:19
ILM.L["Accept from"] = "接受"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:910
ILM.L["Accepting rolls on %s for %s %s"] = "接受 %s 以 %s %s 接受擲骰"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:150
ILM.L["Action context"] = "动作选定范围"
-- IneptLootManager_Integrations/Integrations.lua:163
ILM.L["Action to take upon Gargul loot award event happening during raid."] = "对团本活动期间发生的 Gargul 战利品分配事件采取的行动。"
-- IneptLootManager_Integrations/Integrations.lua:268
ILM.L["Action to take upon RCLC loot award event happening during raid. Trigger is based on RCLC award reason or player response if reason is not used. On Integration Enable the buttons will be prefilled with existing ones."] = "对团本活动期间发生的 RCLC 战利品分配事件采取的行动。触发基于 RCLC 分配原因，如果未填写原因，则基于玩家回复。On Integration Enable the buttons will be prefilled with existing ones."
-- IneptLootManager_Integrations/GenericImport.lua:180
ILM.L["Add Profiles to Rosters"] = "将角色信息添加到名册"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:129
ILM.L["Add currently selected target to list."] = "将当前选中的目标添加到列表中。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:128
ILM.L["Add target"] = "添加目标"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:149
ILM.L["Add to roster"] = "添加到名册"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:635
ILM.L["Add to standby"] = "添加到替补名单"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:396
ILM.L["Add"] = "添加"
-- IneptLootManager_Integrations/Migration.lua:401
ILM.L["Adding %s loot entries for team to %s"] = "添加 %s 战利品给团队到 %s"
-- IneptLootManager_Integrations/Migration.lua:260
-- IneptLootManager_Integrations/Migration.lua:379
ILM.L["Adding %s profiles to %s"] = "添加 %s 角色信息到 %s"
-- IneptLootManager/Modules/Rosters/RosterManager/RosterManager.lua:1009
ILM.L["Adding missing %s players to current roster"] = "添加缺少的 %s 角色到当前名册"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1368
ILM.L["Additional cost (tax) to add to the award value."] = "在物品分值上增加额外的数值（税）。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1336
ILM.L["Additional points to be given to players atop of the split value."] = "Additional points to be given to players atop of the split value."
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:153
ILM.L["Addon sounds"] = "插件声音"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:150
ILM.L["Adds selected players to the selected roster (from dropdown)."] = "将选中的角色添加到选中的名册中。"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:213
ILM.L["Advance to next item after bid"] = "出價後前往下一個項目"
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:221
ILM.L["Affected players:"] = "相关角色："
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:175
ILM.L["Akil'zon"] = "埃基尔松"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:43
ILM.L["Aku'mai"] = "Aku'mai"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:253
ILM.L["Al'Akir"] = "Al'Akir"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:157
ILM.L["Al'ar"] = "奥"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:198
ILM.L["Algalon the Observer"] = "观察者奥尔加隆"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:237
ILM.L["Alizabal"] = "Alizabal"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:642
ILM.L["All In"] = "All In"
-- IneptLootManager_Integrations/Migration.lua:29
ILM.L["All migration entries were commited and executed. Congratulations!"] = "所有迁移条目均已提交并执行。恭喜！"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:242
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:20
-- IneptLootManager/Modules/GUI/Filters.lua:178
ILM.L["All"] = "全部"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:76
ILM.L["Allow bidding below minimum points"] = "允许低于最低分数的竞拍"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1345
ILM.L["Allow biding more than current standings and ending up with less than minimum standings."] = "允许出价超过个人当前分数，结算后低于最低分数。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1344
ILM.L["Allow biding more than current standings"] = "允许高于当前积分的竞拍"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1297
ILM.L["Allow equal bids"] = "允许出相同竞拍价"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:73
ILM.L["Allow going below minimum points"] = "允许低于最低分数"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1061
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:156
ILM.L["Allow players to subscribe to the bench through Raids menu"] = "允许玩家通过团本活动菜单订阅替补名单"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1060
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:155
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:133
ILM.L["Allow subscription"] = "允许订阅"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:623
-- IneptLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:53
ILM.L["Alt"] = "Alt"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1305
ILM.L["Always allow 0 bids"] = "始终允许0"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1289
ILM.L["Always allow All-In bids"] = "始终允许All-In"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1281
ILM.L["Always allow Base bids"] = "始终允许基础价格"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1162
ILM.L["Always allow cancel/pass"] = "始终允许取消/跳过"
-- IneptLootManager_Tracker/IneptLootManager_Tracker.lua:73
ILM.L["Always show"] = "Always show"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:258
ILM.L["Alysrazor"] = "Alysrazor"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:871
ILM.L["Americas"] = "美洲"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:820
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:853
ILM.L["Ammo"] = "弹药"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:171
ILM.L["Anetheron"] = "安纳塞隆"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:373
ILM.L["Announce award to Guild"] = "通告分配到公会频道"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:185
ILM.L["Announce loot from corpse to Raid"] = "从BOSS尸体上通告战利品到团队频道"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:181
ILM.L["Announce loot"] = "通告战利品"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:203
ILM.L["Announcement loot rarity"] = "通告战利品稀有度"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:721
ILM.L["Anonymous Open"] = "Anonymous Open"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1185
ILM.L["Anti-snipe time"] = "延长时间"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:807
ILM.L["Anti-snipe time: %s."] = "延长时间: %s."
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:503
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:236
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:70
ILM.L["Anti-snipe"] = "延长"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:105
ILM.L["Anub'Rekhan"] = "阿努布雷坎"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:212
ILM.L["Anub'arak"] = "阿努巴拉克"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:67
-- IneptLootManager/Tooltips.lua:37
-- IneptLootManager/Utils.lua:1135
ILM.L["Any"] = "任何"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:654
ILM.L["Applies all changes and exits sandbox mode"] = "應用所有更改並退出沙盒模式"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:653
ILM.L["Apply changes"] = "應用更改"
-- IneptLootManager_Integrations/GUI.lua:137
ILM.L["April"] = "四月"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:194
ILM.L["Archavon the Stone Watcher"] = "岩石看守者阿尔卡冯"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:174
ILM.L["Archimonde"] = "阿克蒙德"
-- IneptLootManager/Modules/Loot/LootManager/AwardGUI.lua:177
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:332
ILM.L["Are you sure, you want to award %s to %s for %s %s?"] = "你确定，你想要分配 %s 给 %s for %s %s?"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:542
ILM.L["Are you sure, you want to bid on an unusable item %s?"] = "您確定，您想競標不可用的項目 %s 嗎？"
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:360
ILM.L["Are you sure, you want to disenchant %s?"] = "您確定，您想貶低%s嗎？"
-- IneptLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:79
ILM.L["Are you sure, you want to link %s as alt of %s?"] = "您確定，您想將%s鏈接為 %s 嗎？"
-- IneptLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:96
ILM.L["Are you sure, you want to unlink %s from its main?"] = "Are you sure, you want to unlink %s from its main?"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:235
ILM.L["Argaloth"] = "Argaloth"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:248
ILM.L["Ascendant Council"] = "Ascendant Council"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:748
ILM.L["Ascending"] = "Ascending"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:231
ILM.L["Assistant"] = "Assistant"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:55
ILM.L["Atal'ai Defenders"] = "Atal'ai Defenders"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:52
ILM.L["Atal'alarion"] = "Atal'alarion"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:242
ILM.L["Atramedes"] = "Atramedes"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:431
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:442
ILM.L["Att. [%]"] = "出勤 [%]"
-- IneptLootManager/Modules/Rosters/RosterManager/RosterManager.lua:408
ILM.L["Attendance"] = "出勤"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:137
ILM.L["Attumen the Huntsman"] = "猎手阿图门"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:248
ILM.L["Auction End Countdown"] = "拍卖结束倒计时"
-- IneptLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:222
-- IneptLootManager/MinimapIcon.lua:130
ILM.L["Auction History"] = "拍卖历史记录"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:240
ILM.L["Auction Start/End"] = "拍卖开始/结束"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:235
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:67
ILM.L["Auction Time"] = "拍卖时间"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:55
ILM.L["Auction Type"] = "拍卖类型"
-- IneptLootManager_Tracker/IneptLootManager_Tracker.lua:81
ILM.L["Auction column"] = "Auction column"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:699
ILM.L["Auction complete"] = "拍卖完成"
-- IneptLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:278
ILM.L["Auction finished"] = "拍卖结束"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1177
ILM.L["Auction length in seconds."] = "拍卖时长（以秒为单位）。"
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:493
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1176
ILM.L["Auction length"] = "拍卖时长"
-- IneptLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:258
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:799
ILM.L["Auction of %s items."] = "拍卖 %s 物品。"
-- IneptLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:262
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:801
ILM.L["Auction of %s"] = "拍卖 %s"
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:480
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1119
ILM.L["Auction settings"] = "拍卖设置"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:690
ILM.L["Auction stopped by the Master Looter"] = "被Master Looter停止拍卖"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:805
ILM.L["Auction time: %s."] = "拍卖时间: %s."
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:285
ILM.L["Auction timer bar font size"] = "拍賣計時器條形字體尺寸"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:268
ILM.L["Auction timer bar font"] = "拍賣計時器欄字體"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:245
ILM.L["Auction timer bar height"] = "拍賣計時器條高度"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:308
ILM.L["Auction timer bar texture"] = "拍賣計時器條紋理"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:222
ILM.L["Auction timer bar width"] = "拍賣定時器條寬度"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1248
ILM.L["Auction type"] = "拍卖类型"
-- IneptLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:55
ILM.L["Auctioning - History"] = "拍卖 - 历史记录"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:428
ILM.L["Auctioning - List Filling"] = "拍卖 - 清单填充"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:646
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:654
ILM.L["Auctioning requires active raid or roster mode."] = "拍卖需要团本活动正在进行或名册模式。"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:369
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:669
-- IneptLootManager/MinimapIcon.lua:125
ILM.L["Auctioning"] = "拍卖"
-- IneptLootManager_Integrations/GUI.lua:141
ILM.L["August"] = "八月"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:199
ILM.L["Auriaya"] = "欧尔莉亚"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:708
ILM.L["Author"] = "执行者"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1068
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:147
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:121
ILM.L["Auto bench leavers"] = "退出团队自动加入替补名单"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:391
ILM.L["Auto-assign from corpse"] = "从尸体上自动分配"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:400
ILM.L["Auto-trade after award"] = "分配后自动交易"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:497
ILM.L["Automatically mark auto-removed items as disenchanted"] = "自動將自動驅動的物品標記為污點"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:59
ILM.L["Avatar of Hakkar"] = "Avatar of Hakkar"
-- IneptLootManager/Modules/Rosters/RosterManager/RosterManager.lua:430
ILM.L["Average weeks"] = "平均周数"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:291
ILM.L["Award %s %s to %s selected players."] = "分配 %s %s 分数给 %s 选中的角色。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:285
ILM.L["Award %s %s to everyone in raid."] = "分配 %s %s 分数给团队中的所有人。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:287
ILM.L["Award %s %s to everyone in roster."] = "分配 %s %s 分数给名册中的所有人。"
-- IneptLootManager_Integrations/Integrations.lua:682
ILM.L["Award for Base"] = "分配 for Base"
-- IneptLootManager_Integrations/Integrations.lua:681
ILM.L["Award for Free"] = "分配 for Free"
-- IneptLootManager_Integrations/Integrations.lua:685
ILM.L["Award for Large"] = "分配 for Large"
-- IneptLootManager_Integrations/Integrations.lua:686
ILM.L["Award for Max"] = "分配 for Max"
-- IneptLootManager_Integrations/Integrations.lua:684
ILM.L["Award for Medium"] = "分配 for Medium"
-- IneptLootManager_Integrations/Integrations.lua:683
ILM.L["Award for Small"] = "分配 for Small"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:164
ILM.L["Award item"] = "分配物品"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:981
ILM.L["Award points only to online players"] = "仅对在线角色奖励分数"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:990
ILM.L["Award points only to players in same zone"] = "仅对同一区域的角色奖励分数"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:194
ILM.L["Award points to players based on context."] = "根据所选范围向玩家奖励分数。"
-- IneptLootManager/Modules/Loot/LootManager/AwardGUI.lua:144
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:183
ILM.L["Award value"] = "分值"
-- IneptLootManager/Modules/Loot/LootManager/AwardGUI.lua:153
-- IneptLootManager/Modules/Loot/LootManager/AwardGUI.lua:207
-- IneptLootManager/Modules/Loot/LootManager/AwardGUI.lua:244
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:269
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1219
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:193
-- IneptLootManager/MinimapIcon.lua:144
ILM.L["Award"] = "分配"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:224
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:453
ILM.L["Awarded %s points for %s to all players in raid %s"] = "已分配 %s 分数 for %s 给在团本活动 %s 中的所有角色"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:241
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:266
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:429
ILM.L["Awarded %s points to %s player(s) for %s in <%s>"] = "已分配 %s 分数给 %s 角色 for %s 在 <%s> 中"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:445
ILM.L["Awarded %s points to all players for %s in <%s>"] = "已分配 %s 分数给所有角色 for %s 在 <%s> 中"
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:176
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:242
ILM.L["Awarded by"] = "执行者"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:135
ILM.L["Ayamiss the Hunter"] = "狩猎者阿亚米斯"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:173
ILM.L["Azgalor"] = "阿兹加洛"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:63
ILM.L["Azuregos"] = "Azuregos"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:799
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:832
ILM.L["Back"] = "背部"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:819
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:852
ILM.L["Bag"] = "背包"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:259
ILM.L["Baleroc"] = "Baleroc"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:68
ILM.L["Balnazzar"] = "Balnazzar"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:229
ILM.L["Baltharus the Warborn"] = "战争之子巴尔萨鲁斯"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_4_Cata.lua:8
ILM.L["Baradin Hold"] = "Baradin Hold"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:37
ILM.L["Baron Aquanis"] = "Baron Aquanis"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:82
ILM.L["Baron Geddon"] = "迦顿男爵"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:398
ILM.L["Base value for Static-Priced auction.\nMinimum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "静态定价拍卖的基值。\n升序和分层拍卖的最小值。\n\n设置为与其他层相同的值或负值忽略。"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:901
ILM.L["Base"] = "Base"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:98
ILM.L["Battleguard Sartura"] = "沙尔图拉"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:74
ILM.L["Beastmaster"] = "Beastmaster"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:70
ILM.L["Beatrix"] = "Beatrix"
-- IneptLootManager_Integrations/GUI.lua:315
-- IneptLootManager_Integrations/GUI.lua:322
-- IneptLootManager_Integrations/GUI.lua:329
ILM.L["Begin %d days ago, finish today."] = "Begin %d days ago, finish today."
-- IneptLootManager_Integrations/GUI.lua:248
ILM.L["Begin Day"] = "开始日"
-- IneptLootManager_Integrations/GUI.lua:259
ILM.L["Begin Month"] = "开始月份"
-- IneptLootManager_Integrations/GUI.lua:270
ILM.L["Begin Year"] = "开始年份"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1076
ILM.L["Bench multiplier"] = "替补系数"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1054
ILM.L["Bench"] = "替补名单"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:257
ILM.L["Beth'tilac"] = "Beth'tilac"
-- IneptLootManager_Alerts/Alerts.lua:32
ILM.L["Bid %s accepted!"] = "竞拍 %s 被接受！"
-- IneptLootManager_Alerts/Alerts.lua:40
ILM.L["Bid %s denied!"] = "竞拍 %s 被拒绝！"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1100
ILM.L["Bid accepted!"] = "竞拍 被接受！"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1349
ILM.L["Bid cancelling not allowed"] = "不允许取消竞拍"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1104
ILM.L["Bid denied!"] = "竞拍 被拒绝！"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1347
ILM.L["Bid increment too low"] = "竞拍增量过低"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:558
ILM.L["Bid input values as Main spec bid."] = "竞拍输入值作为主天赋。"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:585
ILM.L["Bid input values as Off spec bid."] = "竞拍输入值作为副天赋。"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1345
ILM.L["Bid too high"] = "出价过高"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1344
ILM.L["Bid too low"] = "出价过低"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:643
ILM.L["Bid your current DKP (%s)."] = "Bid your current DKP (%s)."
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:557
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:934
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:746
ILM.L["Bid"] = "竞拍"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1343
ILM.L["Bidding over current standings not allowed"] = "竞拍不允许高于当前积分"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1342
ILM.L["Bidding while below minimum standings not allowed"] = "竞拍不得低于最低积分"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:174
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:392
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1045
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1335
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1425
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:551
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1139
-- IneptLootManager/MinimapIcon.lua:140
ILM.L["Bidding"] = "竞拍"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:264
ILM.L["Bids"] = "竞拍"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:129
ILM.L["Bindings"] = "按键绑定"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:62
ILM.L["Black Temple"] = "黑暗神殿"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:7
ILM.L["Blackfathom Deeps"] = "Blackfathom Deeps"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_4_Cata.lua:17
ILM.L["Blackwing Descent"] = "Blackwing Descent"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:94
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:30
ILM.L["Blackwing Lair"] = "黑翼之巢"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:217
ILM.L["Blood Council"] = "鲜血王子议会"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:126
ILM.L["Bloodlord Mandokir"] = "血领主曼多基尔"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:897
ILM.L["Bonuses"] = "奖励"
-- IneptLootManager/IneptLootManager.lua:255
ILM.L["Boot complete"] = "启动完成"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:903
-- IneptLootManager/Modules/Points/PointManager/PointManager.lua:521
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:79
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:237
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:79
ILM.L["Boss Kill Bonus"] = "BOSS击杀奖励"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1238
ILM.L["Boss kill award values"] = "Boss击杀分值"
-- IneptLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:21
ILM.L["Both"] = "兩個都"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:90
ILM.L["Broodlord Lashlayer"] = "勒什雷尔"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:182
ILM.L["Brutallus"] = "布鲁塔卢斯"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:134
ILM.L["Buru the Gorger"] = "吞咽者布鲁"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1085
ILM.L["Button Names"] = "按钮名称"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:104
ILM.L["C'Thun"] = "克苏恩"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:72
ILM.L["Caldoran"] = "Caldoran"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1093
ILM.L["Can't use"] = "無法使用"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:571
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:739
ILM.L["Cancel your bid."] = "取消您的出价。"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:570
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:738
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1097
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1261
-- IneptLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:301
-- IneptLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:429
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:847
ILM.L["Cancel"] = "取消"
-- IneptLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:133
ILM.L["Case-sensitive Player name in the format: Player-RealmName"] = "案例敏感的播放器名稱格式：player-realmname"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:686
ILM.L["Cataclysm"] = "Cataclysm"
-- IneptLootManager_Integrations/Migration.lua:519
ILM.L["Change migration notes source"] = "更改遷移說明來源"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:822
ILM.L["Change roster name."] = "更改名册名称。"
-- IneptLootManager/Modules/Common/Changelog/GUI.lua:13
ILM.L["Changelog"] = "更新日志"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:286
ILM.L["Changes auction timer bar font size."] = "更改拍賣定時器欄字體大小。"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:269
ILM.L["Changes auction timer bar font."] = "更改拍賣定時器欄字體。"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:246
ILM.L["Changes auction timer bar height."] = "更改拍賣定時器條高度。"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:309
ILM.L["Changes auction timer bar texture."] = "更改拍賣計時器條紋理。"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:223
ILM.L["Changes auction timer bar width."] = "更改拍賣定時器條寬度。"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1353
ILM.L["Changing bid from Main-spec to Off-Spec not allowed"] = "不允许将出价从主天赋改为副天赋"
-- IneptLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:68
ILM.L["Channel for posting bids."] = "通告竞拍的频道。"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:145
ILM.L["Chess Event"] = "国际象棋赛事"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:801
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:834
ILM.L["Chest (robes)"] = "胸部（长袍）"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:800
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:833
ILM.L["Chest"] = "胸部"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:243
ILM.L["Chimaeron"] = "Chimaeron"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:249
ILM.L["Cho'gall"] = "Cho'gall"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:94
ILM.L["Chromaggus"] = "克洛玛古斯"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:683
ILM.L["Classic"] = "Classic"
-- IneptLootManager/Modules/GUI/Filters.lua:192
ILM.L["Clear all classes."] = "清除所有职业。"
-- IneptLootManager_Integrations/GUI.lua:473
ILM.L["Clear output"] = "清除输出"
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:275
ILM.L["Clear"] = "清除"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:196
ILM.L["Close on bid"] = "竞拍后关闭"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:219
ILM.L["Comma-separated (CSV) list of disenchanter names. Case insensitive. Player-RealmName."] = "逗號分隔（CSV）刪除名稱列表。 不區分大小寫。Player-RealmName"
-- IneptLootManager/Utils.lua:1125
ILM.L["Common"] = "常见"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:252
ILM.L["Conclave of Wind"] = "Conclave of Wind"
-- IneptLootManager_Integrations/GUI.lua:17
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:310
-- IneptLootManager/MinimapIcon.lua:159
ILM.L["Configuration"] = "配置"
-- IneptLootManager_Integrations/GenericImport.lua:174
ILM.L["Configure Rosters"] = "配置名單"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:858
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:866
ILM.L["Copy settings from selected roster."] = "从选中的名册复制设置。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:851
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:857
ILM.L["Copy settings"] = "复制设置"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:865
ILM.L["Copy source"] = "复制源"
-- IneptLootManager/Modules/Profiles/ProfileInfoManager/ProfileInfoManager.lua:119
ILM.L["Inept Loot Manager %s initialization complete. %s"] = "Inept Loot Manager %s 初始化完成。%s"
-- IneptLootManager/Modules/Common/Changelog/GUI.lua:13
-- IneptLootManager/Modules/GUI/UnifiedGUI.lua:277
ILM.L["Inept Loot Manager"] = "Inept Loot Manager"
-- IneptLootManager/Modules/Points/PointManager/PointManager.lua:526
ILM.L["Correcting error"] = "纠正错误"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:345
ILM.L["Cosmetics"] = "化妝品"
-- IneptLootManager_Tracker/Auction.lua:9
ILM.L["Count"] = "Count"
-- IneptLootManager_Integrations/GenericImport.lua:177
ILM.L["Create Profiles"] = "创建角色信息"
-- IneptLootManager_Integrations/GenericImport.lua:171
ILM.L["Create Rosters"] = "创建名册"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:195
ILM.L["Create new raid with provided name. You will automatically join this raid and leave any other you are part of."] = "使用提供的名称创建新的团本活动。您将自动加入此团本活动并离开您所属的任何其他活动。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:500
ILM.L["Create raid %s %s in <%s>"] = "创建团本活动 %s %s in <%s>"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:194
ILM.L["Create raid"] = "创建团本活动"
-- IneptLootManager_Integrations/Integrations.lua:254
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1382
ILM.L["Create"] = "新建"
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:811
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:262
ILM.L["Created"] = "已创建"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1383
ILM.L["Creates new roster with default configuration"] = "使用默认配置创建新名册"
-- IneptLootManager_Integrations/Integrations.lua:255
ILM.L["Creates new trigger to be used during RCLC award."] = "创建要在 RCLC 奖励期间使用的新触发器。"
-- IneptLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:9
ILM.L["Cross-guild sync"] = "交叉恆定同步"
-- IneptLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:122
ILM.L["Cross-guild synchronisation allows connecting two guild data through proxy mechanism called tunneling. Three types of connection are available: Send to, Accept from or Both. |cff00cc00Accepting data from another player will merge the two guilds databases.|r Use this functionality only if you are absolutely sure you know what you are doing."] = "跨晶體同步允許通過稱為隧道的代理機制連接兩個公會數據。 可以使用三種類型的連接：發送到，接受或兩者。 |cff00cc00accept來自另一個玩家的數據將合併兩個公會數據庫。|r僅在您絕對確定自己知道自己在做什麼時才使用此功能。"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:48
ILM.L["Crowd Pummeler 9-60"] = "Crowd Pummeler 9-60"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:625
ILM.L["Ctrl + Alt"] = "Ctrl + Alt"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:622
ILM.L["Ctrl"] = "Ctrl"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:943
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1335
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:755
ILM.L["Current"] = "当前的"
-- IneptLootManager/Modules/Loot/LootManager/AwardGUI.lua:181
-- IneptLootManager/Modules/Loot/LootManager/LootManager.lua:180
-- IneptLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:185
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1331
-- IneptLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:304
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1163
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:336
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:697
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1037
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1038
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:428
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:491
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:501
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:524
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:387
-- IneptLootManager/Tooltips.lua:121
-- IneptLootManager/Utils.lua:1053
ILM.L["DKP"] = "DKP"
-- IneptLootManager/Modules/Profiles/ProfileManager/Profile.lua:135
ILM.L["DPS"] = "DPS"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:354
ILM.L["Danger Zone - Use at own risk"] = "危险区 - 使用风险自负"
-- IneptLootManager_Integrations/GUI.lua:221
ILM.L["Data"] = "数据"
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:271
ILM.L["Date"] = "日期"
-- .:indirectly
ILM.L["Death Knight"] = "Death Knight"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:218
ILM.L["Deathbringer Saurfang"] = "死亡使者萨鲁法尔"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:320
ILM.L["Decay %"] = "衰减 %"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:402
ILM.L["Decay %s%% %s to %s selected players."] = "衰减 %s%% %s 分数对 %s 选中的角色。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:398
ILM.L["Decay %s%% %s to everyone in roster."] = "衰减 %s%% %s 分数对名册中的所有人。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:348
ILM.L["Decay Negatives"] = "衰减负数"
-- IneptLootManager/Modules/Points/PointManager/PointManager.lua:532
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:362
ILM.L["Decay"] = "衰减"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:437
ILM.L["Decayed %s%% points to %s players in <%s>"] = "衰减 %s%% 分数对 %s 角色在 <%s> 中"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:461
ILM.L["Decayed %s%% points to all players %s in <%s>"] = "衰减 %s%% 分数对所有角色 %s 在 <%s>中"
-- IneptLootManager_Integrations/GUI.lua:145
ILM.L["December"] = "十二月"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:910
ILM.L["Default Boss Kill Bonus Value"] = "默认BOSS击杀奖励分值"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:82
ILM.L["Default Boss Kill Bonus value"] = "默认BOSS击杀奖励分值"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1213
ILM.L["Default slot values"] = "默认槽位分值"
-- .:indirectly
ILM.L["Demon Hunter"] = "Demon Hunter"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:707
ILM.L["Description"] = "描述"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:359
ILM.L["Disable data synchronisation"] = "禁用数据同步"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:360
ILM.L["Disable data synchronisation. This might lead to unexpected consequences. Use this at your own risk. Requires /reload to apply."] = "禁用数据同步。这可能会导致意想不到的后果。使用它需要您自担风险。需要 /reload 才能应用。"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:620
ILM.L["Disable"] = "禁用"
-- IneptLootManager/MinimapIcon.lua:54
ILM.L["Disabled"] = "禁用"
-- IneptLootManager/Modules/Common/Changelog/GUI.lua:37
ILM.L["Disables display of the changelog for any new version."] = "禁止显示任何新版本的更新日志。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:663
ILM.L["Discard changes"] = "放棄更改"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:664
ILM.L["Discards all changes and exits sandbox mode"] = "丟棄所有更改並退出沙盒模式"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:496
ILM.L["Disenchant removed items"] = "刪除的物品"
-- IneptLootManager_Integrations/Integrations.lua:687
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:344
ILM.L["Disenchant"] = "脫心"
-- IneptLootManager/Modules/Loot/LootManager/LootManager.lua:230
-- IneptLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:28
ILM.L["Disenchanted"] = "被迷住了"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:213
ILM.L["Disenchanters"] = "脫衣機"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:277
ILM.L["Display price"] = "显示物品分值"
-- IneptLootManager/Utils.lua:1136
ILM.L["Do Nothing"] = "沒做什麼"
-- IneptLootManager/Modules/Common/Changelog/GUI.lua:78
ILM.L["Do not show again"] = "不再显示"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_4_Cata.lua:61
ILM.L["Dragon Soul"] = "Dragon Soul"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:688
ILM.L["Dragonflight"] = "Dragonflight"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:54
ILM.L["Dreamscythe and Weaver"] = "Dreamscythe and Weaver"
-- .:indirectly
ILM.L["Druid"] = "德鲁伊"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1132
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1232
ILM.L["Dynamic Item values"] = "动态物品分值"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1037
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1038
-- IneptLootManager/Modules/Points/PointManager/PointManager.lua:551
-- IneptLootManager/Modules/Points/PointManager/PointManager.lua:558
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:440
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:483
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:485
-- IneptLootManager/Utils.lua:1058
ILM.L["EP"] = "EP"
-- IneptLootManager/Modules/Points/PointManager/PointManager.lua:557
-- IneptLootManager/Utils.lua:1060
ILM.L["EP/GP"] = "EP/GP"
-- IneptLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:196
ILM.L["EPGP WEB"] = "EPGP WEB"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:698
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1091
ILM.L["EPGP"] = "EPGP"
-- IneptLootManager_Integrations/GenericImport.lua:245
-- IneptLootManager_Integrations/ImportCSV.lua:152
ILM.L["ERROR - invalid import data"] = "错误 - 无效的导入数据"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:92
ILM.L["Ebonroc"] = "埃博诺克"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:129
ILM.L["Edge of Madness"] = "疯狂之缘"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:47
ILM.L["Electrocutioner 6000"] = "Electrocutioner 6000"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:195
ILM.L["Emalon the Storm Watcher"] = "风暴看守者埃玛尔隆"
-- IneptLootManager_Integrations/Integrations.lua:118
ILM.L["Enable Gargul integration. This will allow Gargul to take control over some aspects of ILM (starting auction from Gargul, and awarding)."] = "启用 Gargul 集成。这将允许 Gargul 控制 ILM 的某些方面（从 Gargul 开始拍卖及分配）。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1155
ILM.L["Enable OS bids"] = "启用副天赋出价"
-- IneptLootManager_Integrations/Integrations.lua:241
ILM.L["Enable RCLC integration. This will allow awarding DKP/GP points on RCLC item award. Requires /reload."] = "启用 RCLC 集成。这将允许通过 RCLC 物品分配获得DKP/GP分数。更改请重新加载界面。"
-- IneptLootManager_Integrations/Integrations.lua:364
ILM.L["Enable WoW DKP Bot Integration. This will result in additional data stored upon logout."] = "启用 WoW DKP 机器人集成。这会在注销时存储额外的数据。"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:241
ILM.L["Enable announcing auction start and end."] = "启用通告宣布拍卖开始和结束。"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:179
ILM.L["Enable auto-update bid values when current highest bid changes (open auction only)."] = "启用当前最高出价发生变化时自动更新价格（仅限公开拍卖）。"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:178
ILM.L["Enable auto-update bid values"] = "启用自动更新竞拍值"
-- IneptLootManager_Tracker/IneptLootManager_Tracker.lua:57
ILM.L["Enable item tracking information in tooltip display."] = "Enable item tracking information in tooltip display."
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:392
ILM.L["Enable loot auto-assign (Master Looter UI) from corpse when item is awarded"] = "启用从尸体上自动分配物品（队长分配）"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1328
ILM.L["Enable paid value splitting amongst raiders."] = "Enable paid value splitting amongst raiders."
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1282
ILM.L["Enable to allow base bids even if higher bids are present if player didn't bid yet. Affects Open-Ascending Auction."] = "启用在玩家尚未出价的情况下，即使已有更高的出价，也允许基础出价。影响开放式拍卖(Open-Ascending)。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1298
ILM.L["Enable to allow equal bids. Affects Open-Ascending Auction."] = "启用允许相同的出价。影响开放式拍卖(Open-Ascending)。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1306
ILM.L["Enable to always allow 0 bids. Affects ascending item value mode."] = "启用始终允许0出价。影响开放式拍卖(Ascending)。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1290
ILM.L["Enable to always allow All-In bids. Affects Open-Ascending Auction."] = "启用始终允许All-in出价。影响开放式拍卖(Open-Ascending)。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1163
ILM.L["Enable to always allow cancelling or passing bids. Affects Open-Ascending Auction."] = "启用始终允许取消或跳过出价。影响开放式拍卖(Open-Ascending)。"
-- IneptLootManager_Tracker/IneptLootManager_Tracker.lua:56
ILM.L["Enable tooltip display"] = "Enable tooltip display"
-- IneptLootManager/MinimapIcon.lua:83
ILM.L["Enables / disables minimap Icon"] = "启用/禁用小地图图标"
-- IneptLootManager/Modules/Common/Logger/Logger.lua:32
ILM.L["Enables / disables verbose data printing during logging"] = "启用/禁用在记录期间print详细数据"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:257
ILM.L["Enables announcing loot awards."] = "启用通告战利品。"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:265
ILM.L["Enables announcing new highest bid (when applicable)."] = "启用通告新的最高出价（如果适用）。"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:232
ILM.L["Enables announcing raid start and end."] = "启用通告团本活动开始和结束。"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:401
ILM.L["Enables auto-trade awarded loot after auctioning from bag"] = "启用背包拍卖后自动交易战利品"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:278
ILM.L["Enables displaying item price on tooltip."] = "启用在Tooltip上显示物品分值。"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:249
ILM.L["Enables raid-warning countdown for auctions."] = "启用团队通知拍卖倒计时。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:794
ILM.L["End Timetravel"] = "结束时间旅行模式"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:401
ILM.L["End selected raid"] = "结束选中的团本活动"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:644
ILM.L["Enter sandbox"] = "輸入沙箱"
-- IneptLootManager/Utils.lua:1128
ILM.L["Epic"] = "史诗"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:502
ILM.L["Equation"] = "方程"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:184
ILM.L["Eredar Twins"] = "艾瑞达双子"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:870
ILM.L["Europe"] = "欧洲"
-- .:indirectly
ILM.L["Evoker"] = "Evoker"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:363
ILM.L["Execute decay for players based on context."] = "根据所选范围为角色执行衰减。"
-- IneptLootManager_Integrations/Migration.lua:67
ILM.L["Execute migration again if you are sure this is correct."] = "如果您確定這是正確的，請再次執行遷移。"
-- IneptLootManager_Integrations/Migration.lua:512
ILM.L["Execute migration"] = "执行迁移"
-- IneptLootManager_Integrations/Migration.lua:73
ILM.L["Executing Addon Migration with comms disabled."] = "在禁用通信的情况下执行插件迁移。"
-- IneptLootManager_Integrations/Migration.lua:64
ILM.L["Executing migration even though ledger is not empty."] = "執行遷移，即使Ledger不是空的。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:532
ILM.L["Exponent / Base"] = "指数 /基础"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:524
ILM.L["Exponential scaling value used by the equations (Base for EPGPWeb, or Exponent for WoWpedia)"] = "方程式使用的指数缩放值（EPGPWEB的基础或WoWpedia指数）"
-- IneptLootManager_Integrations/GUI.lua:397
-- IneptLootManager_Integrations/GUI.lua:406
-- IneptLootManager_Integrations/GUI.lua:483
-- IneptLootManager_Integrations/GUI.lua:484
-- IneptLootManager/MinimapIcon.lua:153
ILM.L["Export"] = "导出"
-- IneptLootManager_Tracker/IneptLootManager_Tracker.lua:82
ILM.L["Extend auction bid list with received item count information. Requires reload."] = "Extend auction bid list with received item count information. Requires reload."
-- IneptLootManager_Tracker/IneptLootManager_Tracker.lua:65
ILM.L["Extend tooltip with more specific loot information."] = "Extend tooltip with more specific loot information."
-- IneptLootManager_Tracker/IneptLootManager_Tracker.lua:64
ILM.L["Extended tooltip"] = "Extended tooltip"
-- IneptLootManager/Modules/GUI/Filters.lua:79
ILM.L["External"] = "公会外"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:213
ILM.L["Faction Champions"] = "阵营冠军"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:37
ILM.L["False"] = "关闭"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:99
ILM.L["Fankriss the Unyielding"] = "顽强的范克瑞斯"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:154
ILM.L["Fathom-Lord Karathress"] = "深水领主卡拉瑟雷斯"
-- IneptLootManager_Integrations/GUI.lua:135
ILM.L["February"] = "二月"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:807
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:840
ILM.L["Feet"] = "脚"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:183
ILM.L["Felmyst"] = "菲米丝"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:219
ILM.L["Festergut"] = "烂肠"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:53
ILM.L["Festering Rotslime"] = "Festering Rotslime"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:432
ILM.L["Fill auction list from corpse"] = "将尸体掉落添加到拍卖清单"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:433
ILM.L["Fill auction list with items from corpse. Will happen only if you open the corpse loot window."] = "将尸体掉落添加到拍卖清单。只有在打开尸体战利品窗口时才会启用。"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:450
ILM.L["Fill auction list with looted items"] = "将获得的战利品添加到拍卖清单"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:451
ILM.L["Fill auction list with looted items. This will automatically add all items you have received."] = "将获得的战利品添加到拍卖清单。这将自动添加您收到的所有物品。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:104
ILM.L["Fill from Guild"] = "从公会导入"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:116
ILM.L["Fill from Raid Roster"] = "从团队导入"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:442
ILM.L["Fill from corpse only if you are the Loot Master."] = "仅当您是Loot Master时才从尸体掉落添加。"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:460
ILM.L["Fill from loot only if you are using Group Loot."] = "仅在使用队长分配时才从获得的战利品添加。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:117
ILM.L["Fill profile list with players in current raid roster."] = "从团队导入角色信息。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:105
ILM.L["Fill profile list with players with the minimum level and ranks."] = "根据选择的最低等级和会阶导入角色信息。"
-- IneptLootManager/Modules/GUI/Filters.lua:163
ILM.L["Filter"] = "过滤器"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:808
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:841
ILM.L["Finger"] = "手指"
-- IneptLootManager_Integrations/GUI.lua:281
ILM.L["Finish Day"] = "完成日"
-- IneptLootManager_Integrations/GUI.lua:292
ILM.L["Finish Month"] = "完成月份"
-- IneptLootManager_Integrations/GUI.lua:303
ILM.L["Finish Year"] = "完成年份"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:524
ILM.L["Finished raid %s"] = "已完成的团本活动 %s"
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:813
ILM.L["Finished"] = "已完成"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_4_Cata.lua:48
ILM.L["Firelands"] = "Firelands"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:91
ILM.L["Firemaw"] = "费尔默"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:200
ILM.L["Flame Leviathan"] = "烈焰巨兽"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:93
ILM.L["Flamegor"] = "弗莱格尔"
-- IneptLootManager_Integrations/GUI.lua:232
ILM.L["Format"] = "格式"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:132
ILM.L["Found %s in guild."] = "已找到 %s 在公会中。"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:201
ILM.L["Freya"] = "弗蕾亚"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:227
ILM.L["GM"] = "Guild Master"
-- IneptLootManager/Modules/Loot/LootManager/AwardGUI.lua:181
-- IneptLootManager/Modules/Loot/LootManager/LootManager.lua:180
-- IneptLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:185
-- IneptLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:304
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1163
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:336
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1045
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1046
-- IneptLootManager/Modules/Points/PointManager/PointManager.lua:552
-- IneptLootManager/Modules/Points/PointManager/PointManager.lua:559
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:441
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:484
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:512
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:385
-- IneptLootManager/Tooltips.lua:121
-- IneptLootManager/Utils.lua:1056
ILM.L["GP"] = "GP"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:130
ILM.L["Gahz'ranka"] = "加兹兰卡"
-- IneptLootManager_Integrations/Integrations.lua:111
-- IneptLootManager_Integrations/Integrations.lua:117
ILM.L["Gargul Integration"] = "Gargul集成"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:81
ILM.L["Garr"] = "加尔"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:80
ILM.L["Gehennas"] = "基赫纳斯"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:40
ILM.L["Gelihast"] = "Gelihast"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:132
ILM.L["General Rajaxx"] = "拉贾克斯将军"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:202
ILM.L["General Vezax"] = "维扎克斯将军"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:230
ILM.L["General Zarithrian"] = "萨瑞瑟里安将军"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:816
ILM.L["General settings"] = "通用设置"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:38
ILM.L["Ghamoo-ra"] = "Ghamoo-ra"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:104
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:794
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:827
ILM.L["Global"] = "通用"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:110
ILM.L["Gluth"] = "格拉斯"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:20
ILM.L["Gnomeregan"] = "Gnomeregan"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:85
ILM.L["Golemagg the Incinerator"] = "焚化者古雷曼格"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:116
ILM.L["Gothik the Harvester"] = "收割者戈提克"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:106
ILM.L["Grand Widow Faerlina"] = "黑女巫法琳娜"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:109
ILM.L["Grobbulus"] = "格罗布鲁斯"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:459
ILM.L["Group Loot Only"] = "仅组战利品"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:45
ILM.L["Grubbis"] = "Grubbis"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:149
ILM.L["Gruul the Dragonkiller"] = "屠龙者格鲁尔"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:25
ILM.L["Gruul's Lair"] = "格鲁尔的巢穴"
-- IneptLootManager/Modules/Global/GlobalGuildChangeHandler.lua:18
ILM.L["Guild change detected. Disabling synchronisation until UI reload."] = "檢測到公會變更。 禁用同步直到UI重新加載。"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:165
ILM.L["Gurtogg Bloodboil"] = "古尔图格·血沸"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:266
ILM.L["Hagara the Stormbinder"] = "Hagara the Stormbinder"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:128
ILM.L["Hakkar"] = "哈卡"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:178
ILM.L["Halazzi"] = "哈尔拉兹"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:246
ILM.L["Halfus Wyrmbreaker"] = "Halfus Wyrmbreaker"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:232
ILM.L["Halion"] = "海里昂"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:804
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:837
ILM.L["Hands"] = "手"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:658
-- IneptLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:104
ILM.L["Hard Mode"] = "困難模式"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1022
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:106
ILM.L["Hard cap"] = "最大上限"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:181
ILM.L["Hash"] = "哈希"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:795
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:828
ILM.L["Head"] = "头部"
-- IneptLootManager/Modules/Profiles/ProfileManager/Profile.lua:134
ILM.L["Healer"] = "治疗者"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:113
ILM.L["Heigan the Unclean"] = "肮脏的希尔盖"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:813
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:846
ILM.L["Held In Off-hand"] = "副手物品"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:30
ILM.L["Heroic"] = "Heroic"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:179
ILM.L["Hex Lord Malacrass"] = "妖术领主玛拉卡斯"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:358
ILM.L["Hide in combat"] = "隱藏在戰鬥中"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:159
ILM.L["High Astromancer Solarian"] = "大星术师索兰莉安"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:148
ILM.L["High King Maulgar"] = "莫加尔大王"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:121
ILM.L["High Priest Thekal"] = "高阶祭司塞卡尔"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:122
ILM.L["High Priest Venoxis"] = "高阶祭司温诺希斯"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:123
ILM.L["High Priestess Arlokk"] = "高阶祭司娅尔罗"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:124
ILM.L["High Priestess Jeklik"] = "高阶祭司耶克里克"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:125
ILM.L["High Priestess Mar'li"] = "高阶祭司玛尔里"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:161
ILM.L["High Warlord Naj'entus"] = "高阶督军纳因图斯"
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:136
ILM.L["History type"] = "历史记录类型"
-- .:indirectly
ILM.L["History"] = "历史记录"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:203
ILM.L["Hodir"] = "霍迪尔"
-- .:indirectly
ILM.L["Hunter"] = "猎人"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:151
ILM.L["Hydross the Unstable"] = "不稳定的海度斯"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:77
ILM.L["Hyjal Summit"] = "海加尔峰"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:87
ILM.L["Icecrown Citadel"] = "冰冠堡垒"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:221
ILM.L["Icecrown Gunship Battle"] = "冰冠炮舰战斗"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:204
ILM.L["Ignis the Furnace Master"] = "掌炉者伊格尼斯"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:78
ILM.L["Ignore entry"] = "忽略条目"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:205
ILM.L["Ignore unusable items"] = "忽略無法使用的項目"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:505
ILM.L["Ignore"] = "忽略"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:206
ILM.L["Ignores unusable items. They will not be added to bidding window."] = "忽略無法使用的項目。 它們不會添加到競標窗口中。"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:169
ILM.L["Illidan Stormrage"] = "伊利丹·怒风"
-- IneptLootManager_Integrations/Migration.lua:279
-- IneptLootManager_Integrations/Migration.lua:413
-- IneptLootManager_Integrations/Migration.lua:455
-- IneptLootManager_Integrations/Migration.lua:504
ILM.L["Import complete"] = "导入完成"
-- IneptLootManager_Integrations/GenericImport.lua:221
-- IneptLootManager_Integrations/GenericImport.lua:254
-- IneptLootManager_Integrations/GenericImport.lua:255
-- IneptLootManager_Integrations/GenericImport.lua:262
-- IneptLootManager_Integrations/ImportCSV.lua:99
-- IneptLootManager_Integrations/ImportCSV.lua:161
-- IneptLootManager_Integrations/ImportCSV.lua:162
-- IneptLootManager_Integrations/ImportCSV.lua:190
-- IneptLootManager/Modules/Points/PointManager/PointManager.lua:531
ILM.L["Import"] = "导入"
-- IneptLootManager_Integrations/Migration.lua:230
ILM.L["Importing %s entries from DKPTable"] = "正在导入 %s 条目从 DKPTable"
-- IneptLootManager_Integrations/Migration.lua:341
ILM.L["Importing profiles from DKPTable"] = "从 DKPTable 导入角色信息"
-- IneptLootManager/Modules/GUI/Filters.lua:78
ILM.L["In Guild"] = "在公会"
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:812
ILM.L["In Progress"] = "进行中"
-- IneptLootManager/Modules/GUI/Filters.lua:75
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:290
ILM.L["In Raid"] = "在团队"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:645
ILM.L["In sandbox mode all communication is disabled and changes are local until applied. Click Apply changes to store changes and exit sandbox mode. Click Discard to undo changes and exit sandbox mode. /reload will discard changes. Entering sandbox mode will cancel time travel."] = "在沙盒模式下，所有通信都是禁用的，並且更改為本地，直到應用為止。 單擊“應用更改”以存儲更改和退出沙盒模式。 單擊丟棄以撤消更改和退出沙盒模式。 /重新加載將丟棄更改。 輸入沙盒模式將取消時間旅行。"
-- IneptLootManager/MinimapIcon.lua:50
ILM.L["In-Sync"] = "同步中"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:972
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:139
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:124
ILM.L["Include bench"] = "包括替补"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:973
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:140
ILM.L["Include benched players in all auto-awards"] = "在所有自动奖励中包括替补角色"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:377
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:419
ILM.L["Include cancels in bid list in open auction mode."] = "在開放拍賣模式下將CAMCELS包括在投標列表中。"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:376
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:418
ILM.L["Include cancels"] = "包括取消"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:368
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:410
ILM.L["Include passes in bid list in open auction mode."] = "在開放拍賣模式下包括通過投標列表中的通行證。"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:367
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:409
ILM.L["Include passes"] = "包括通行證"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:349
ILM.L["Include players with negative standings in decay."] = "包括在衰退中分数是负数的角色。"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:305
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:313
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:321
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:329
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:337
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:345
ILM.L["Include"] = "包括"
-- IneptLootManager/MinimapIcon.lua:48
ILM.L["Incoherent state"] = "Incoherent state"
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:261
ILM.L["Info"] = "信息"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:481
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:487
ILM.L["Information"] = "信息"
-- IneptLootManager_Integrations/ImportCSV.lua:72
ILM.L["Input CSV Item value override data"] = "输入 CSV 物品分值覆盖数据"
-- IneptLootManager_Integrations/GenericImport.lua:198
ILM.L["Input JSON exported standings"] = "输入 JSON 导出积分榜"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:127
ILM.L["Input name: %s"] = "输入名字: %s"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:115
ILM.L["Instructor Razuvious"] = "教官拉苏维奥斯"
-- IneptLootManager_Integrations/IneptLootManager_Integrations.lua:18
ILM.L["Integrations"] = "集成"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:100
ILM.L["Interval Bonus time"] = "时长奖励时间间隔"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:948
-- IneptLootManager/Modules/Points/PointManager/PointManager.lua:533
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:116
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:249
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:97
ILM.L["Interval Bonus"] = "时长奖励"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:955
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:123
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:251
ILM.L["Interval Time"] = "间隔时间"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:964
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:131
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:252
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:103
ILM.L["Interval Value"] = "时长奖励分值"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:956
ILM.L["Interval in [minutes] to award bonus points"] = "奖励分数的间隔 [分钟]"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1346
ILM.L["Invalid bid value"] = "无效的竞拍数值"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:396
ILM.L["Invalid context. You should not decay raid only."] = "无效的范围。你不应该只衰减团队。"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:16
ILM.L["Invalid item link"] = "无效的物品链接"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1352
ILM.L["Invalid item"] = "无效的物品"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1124
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1313
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:58
ILM.L["Item value mode"] = "物品分值模式"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:22
ILM.L["Item value must be positive"] = "物品分数必须为正"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1226
ILM.L["Item value overrides"] = "物品分数覆盖"
-- IneptLootManager/Modules/Loot/LootManager/AwardGUI.lua:91
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:101
ILM.L["Item"] = "物品"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:56
ILM.L["Jammal'an and Ogom"] = "Jammal'an and Ogom"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:177
ILM.L["Jan'alai"] = "加亚莱"
-- IneptLootManager_Integrations/GUI.lua:134
ILM.L["January"] = "一月"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:127
ILM.L["Jin'do the Hexxer"] = "妖术师金度"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:89
ILM.L["Join our discord for more info: "] = "加入我们的Discord以获取更多信息："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:415
ILM.L["Join selected raid"] = "加入选中的团本活动"
-- IneptLootManager/Modules/Points/PointManager/PointManager.lua:535
ILM.L["Joining roster"] = "加入名冊"
-- IneptLootManager_Integrations/GUI.lua:140
ILM.L["July"] = "七月"
-- IneptLootManager_Integrations/GUI.lua:139
ILM.L["June"] = "六月"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:160
ILM.L["Kael'thas Sunstrider"] = "凯尔萨斯·逐日者"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:181
ILM.L["Kalecgos"] = "卡雷苟斯"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:8
ILM.L["Karazhan"] = "卡拉赞"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:172
ILM.L["Kaz'rogal"] = "卡兹洛加"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:119
ILM.L["Kel'Thuzad"] = "克尔苏加德"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:186
ILM.L["Kil'jaeden"] = "基尔加丹"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:205
ILM.L["Kologarn"] = "科隆加恩"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:196
ILM.L["Koralon the Flame Watcher"] = "火焰看守者科拉隆"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:131
ILM.L["Kurinnaxx"] = "库林纳克斯"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:32
ILM.L["LFR"] = "LFR"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:222
ILM.L["Lady Deathwhisper"] = "亡语者女士"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:39
ILM.L["Lady Sarevess"] = "Lady Sarevess"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:156
ILM.L["Lady Vashj"] = "瓦丝琪"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:410
ILM.L["Large value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "分级拍卖的大值。\n\n设置为与其他层相同的值或忽略忽略。"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:904
ILM.L["Large"] = "Large"
-- IneptLootManager_Integrations/GUI.lua:321
ILM.L["Last month"] = "上个月"
-- IneptLootManager_Integrations/GUI.lua:314
ILM.L["Last week"] = "上周"
-- IneptLootManager_Integrations/GUI.lua:328
ILM.L["Last year"] = "去年"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:501
ILM.L["Latest loot"] = "最新战利品"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:524
ILM.L["Latest points"] = "最新分数"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:305
-- IneptLootManager/Utils.lua:1129
ILM.L["Legendary"] = "传奇"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:806
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:839
ILM.L["Legs"] = "腿部"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:153
ILM.L["Leotheras the Blind"] = "盲眼者莱欧瑟拉斯"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:73
ILM.L["Lillian Voss"] = "Lillian Voss"
-- IneptLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:71
-- IneptLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:122
-- IneptLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:147
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:77
ILM.L["Link Alt to Main"] = "将小号链接到主号"
-- IneptLootManager/Modules/Points/PointManager/PointManager.lua:534
ILM.L["Linking override"] = "链接覆盖"
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:378
-- IneptLootManager/MinimapIcon.lua:44
ILM.L["Loading..."] = "正在加载..."
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:114
ILM.L["Loatheb"] = "洛欧塞布"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:271
ILM.L["Lock selected"] = "锁定中的"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:469
-- IneptLootManager/Modules/GUI/Filters.lua:81
ILM.L["Locked"] = "锁定"
-- IneptLootManager/Modules/Common/Logger/Logger.lua:22
ILM.L["Logging level"] = "日志记录级别"
-- IneptLootManager/Modules/Common/Logger/Logger.lua:18
ILM.L["Logging"] = "日志记录"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:256
ILM.L["Loot Awards"] = "战利品奖励"
-- IneptLootManager_Integrations/GUI.lua:20
ILM.L["Loot History"] = "战利品历史记录"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:286
ILM.L["Loot Rolling"] = "戰利品擲骰"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:468
ILM.L["Loot rarity"] = "战利品稀有度"
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:21
ILM.L["Loot"] = "战利品"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:214
ILM.L["Lord Jaraxxus"] = "加拉克苏斯大王"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:64
ILM.L["Lord Kazzak"] = "Lord Kazzak"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:223
ILM.L["Lord Marrowgar"] = "玛洛加尔领主"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:256
ILM.L["Lord Rhyolith"] = "Lord Rhyolith"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:41
ILM.L["Lorgus Jett"] = "Lorgus Jett"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:78
ILM.L["Lucifron"] = "鲁西弗隆"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:185
ILM.L["M'uru"] = "穆鲁"
-- IneptLootManager_Integrations/Integrations.lua:129
-- IneptLootManager_Integrations/Integrations.lua:134
-- IneptLootManager_Integrations/Integrations.lua:139
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:557
-- IneptLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:426
ILM.L["MS"] = "主天赋"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:270
ILM.L["Madness of Deathwing"] = "Madness of Deathwing"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:107
ILM.L["Maexxna"] = "迈克斯纳"
-- .:indirectly
ILM.L["Mage"] = "法师"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:79
ILM.L["Magmadar"] = "玛格曼达"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:239
ILM.L["Magmaw"] = "Magmaw"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:33
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:150
ILM.L["Magtheridon"] = "玛瑟里顿"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:139
ILM.L["Maiden of Virtue"] = "贞节圣女"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:811
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:844
ILM.L["Main Hand"] = "主手"
-- IneptLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:62
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:180
ILM.L["Main"] = "主号"
-- IneptLootManager/Modules/GUI/Filters.lua:80
ILM.L["Mains"] = "主号"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:86
ILM.L["Majordomo Executus"] = "管理者埃克索图斯"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:260
ILM.L["Majordomo Staghelm"] = "Majordomo Staghelm"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:241
ILM.L["Maloriak"] = "Maloriak"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:193
ILM.L["Malygos"] = "玛里苟斯"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:146
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:71
ILM.L["Management"] = "管理"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:229
ILM.L["Manager"] = "Manager"
-- IneptLootManager/Modules/Points/PointManager/PointManager.lua:527
ILM.L["Manual adjustment"] = "手动调整"
-- IneptLootManager_Integrations/GUI.lua:136
ILM.L["March"] = "三月"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:75
ILM.L["Mason"] = "Mason"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:441
ILM.L["Master Loot Only"] = "仅Master Loot"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:905
ILM.L["Max"] = "Max"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1014
ILM.L["Maximum point cap player can receive per raid week. Set to 0 to disable."] = "每周角色可以获得的最大分数上限。设置为 0 以禁用。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1023
ILM.L["Maximum point cap that player can have. Set to 0 to disable."] = "角色可以拥有的最大分数上限。设置为 0 以禁用。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:414
ILM.L["Maximum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Maximum value for Ascending and Tiered auction.\n\nSet to same value as other tier or negative to ignore."
-- IneptLootManager_Integrations/GUI.lua:138
ILM.L["May"] = "五月"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:49
ILM.L["Mechanical Menagerie"] = "Mechanical Menagerie"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:406
ILM.L["Medium value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Medium value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:903
ILM.L["Medium"] = "Medium"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:50
ILM.L["Mekgineer Thermaplugg"] = "Mekgineer Thermaplugg"
-- IneptLootManager/MinimapIcon.lua:121
ILM.L["Menu"] = "菜单"
-- IneptLootManager_Integrations/Migration.lua:217
-- IneptLootManager_Integrations/Migration.lua:295
-- IneptLootManager_Integrations/Migration.lua:423
-- IneptLootManager_Integrations/Migration.lua:466
ILM.L["Migrating %s"] = "迁移 %s"
-- IneptLootManager_Integrations/Migration.lua:89
ILM.L["Migration complete. %s to apply and sync with others or go to %s to discard."] = "迁移完成。 %s 来应用并同步给他人，或者 %s 来删除。"
-- IneptLootManager_Integrations/Migration.lua:318
ILM.L["Migration failure: Detected 0 teams"] = "迁移失败：检测到 0 个团队"
-- IneptLootManager_Integrations/Migration.lua:256
-- IneptLootManager_Integrations/Migration.lua:372
ILM.L["Migration failure: Unable to create profiles"] = "迁移失败：无法创建角色信息"
-- IneptLootManager_Integrations/Migration.lua:35
ILM.L["Migration ongoing: %s(%s)"] = "Migration ongoing: %s(%s)"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:206
ILM.L["Mimiron"] = "米米尔隆"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:118
ILM.L["Min bid increment"] = "最小竞拍增量"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1358
ILM.L["Minimal increment"] = "最小增量"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1359
ILM.L["Minimal value increment for open auction mode."] = "公开拍卖模式的最小增值。"
-- IneptLootManager_Integrations/Migration.lua:91
ILM.L["Minimap Icon -> Configuration -> Wipe events"] = "小地图图标 -> 配置 -> 删除事件"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1099
ILM.L["Minimum GP used in calculations when player has less GP than this value."] = "当角色的 GP 低于此值时，计算中使用minGP。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1098
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:142
ILM.L["Minimum GP"] = "最低GP"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:91
ILM.L["Minimum Level"] = "最低等级"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:92
ILM.L["Minimum level of players to fill from guild."] = "从公会导入的最低角色等级。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:139
ILM.L["Minimum points (DKP / EP)"] = "最低分数（DKP / EP）"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1146
ILM.L["Minimum standing required to be allowed to bid."] = "允许参与竞拍的最低分数。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1145
ILM.L["Minimum standing"] = "最低分数"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:281
ILM.L["Missing award value"] = "缺少分值"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:392
ILM.L["Missing decay value"] = "缺少衰减值"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:55
ILM.L["Missing profile %s"] = "缺失角色信息 %s"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:33
ILM.L["Missing roster name and you are not in raid"] = "缺少名册名称并且您不在团队中"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:37
ILM.L["Missing roster name. Using Raid Info"] = "缺少名册名称。使用团本活动信息"
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:325
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:397
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:436
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:465
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:499
ILM.L["Missing valid raid"] = "缺少有效的团队/团本活动"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:687
ILM.L["Mists of Pandaria"] = "Mists of Pandaria"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:133
ILM.L["Moam"] = "莫阿姆"
-- IneptLootManager/Modules/Loot/LootManager/AwardGUI.lua:248
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:477
ILM.L["Modifier combination"] = "修饰符组合"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:53
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:61
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:14
ILM.L["Molten Core"] = "熔火之心"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:263
ILM.L["Morchok"] = "Morchok"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:138
ILM.L["Moroes"] = "莫罗斯"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:155
ILM.L["Morogrim Tidewalker"] = "莫洛格里·踏潮者"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:57
ILM.L["Morphaz and Hazzas"] = "Morphaz and Hazzas"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:167
ILM.L["Mother Shahraz"] = "莎赫拉丝主母"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:329
ILM.L["Mounts"] = "坐騎"
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:233
ILM.L["Moving %s from current queue to pending queue."] = "將 %s 從當前隊列移動到等待隊列。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:444
ILM.L["Multiple"] = "多个"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:587
ILM.L["Multiplier for tier %s (if used by the auction type)."] = "系数 for tier %s （如果采用 Tiered 模式）。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:510
ILM.L["Multiplier used by the equations"] = "公式使用的系数"
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:296
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:518
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1219
ILM.L["Multiplier"] = "系数"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1195
ILM.L["Multiply auction time by the number of items to increase auction time lineary."] = "將拍賣時間乘以物品數量以線性增加拍賣時間。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1194
ILM.L["Multiply time"] = "倍增時間"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:31
ILM.L["Mythic"] = "Mythic"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:176
ILM.L["Nalorakk"] = "纳洛拉克"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:931
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:743
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:821
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:427
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:438
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:179
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:260
ILM.L["Name"] = "名字"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:145
ILM.L["Named Buttons"] = "命名按钮"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:130
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:59
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:8
ILM.L["Naxxramas"] = "纳克萨玛斯"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:796
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:829
ILM.L["Neck"] = "颈部"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:95
ILM.L["Nefarian"] = "奈法利安"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:244
ILM.L["Nefarian's End"] = "Nefarian's End"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:144
ILM.L["Netherspite"] = "虚空幽龙"
-- IneptLootManager/Modules/Common/Changelog/GUI.lua:36
ILM.L["Never show changelog"] = "不再显示更新日志"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1160
ILM.L["New highest bid on %s: %s %s %s"] = "给 %s 的新最高出价：%s %s %s"
-- IneptLootManager_Integrations/Migration.lua:47
ILM.L["New migration source for note-based AddOns: %s"] = "基於註釋的插件的新遷移源：%s"
-- IneptLootManager_Integrations/GenericImport.lua:104
ILM.L["New roster: %s"] = "新名册: %s"
-- IneptLootManager_Integrations/Migration.lua:144
ILM.L["New roster: [%s]"] = "新名册: [%s]"
-- IneptLootManager/Modules/Common/Version/Version.lua:76
ILM.L["New version of Inept Loot Manager is available. For best experience please update the AddOn."] = "新版本 的 Inept Loot Manager 可用。为了获得最佳体验请更新插件。"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:796
ILM.L["Next item"] = "下一項"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:795
ILM.L["Next"] = "下一個"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:147
ILM.L["Nightbane"] = "夜之魇"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1348
ILM.L["No auction in progress"] = "没有进行中的拍卖"
-- IneptLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:192
-- IneptLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:179
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:902
ILM.L["No bids"] = "没有出价"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:518
ILM.L["No loot received"] = "没有收到战利品"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:255
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:381
ILM.L["No players selected"] = "未选择角色"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:543
ILM.L["No points received"] = "未获得分数"
-- IneptLootManager/Utils.lua:602
ILM.L["No"] = "否"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:818
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:851
ILM.L["Non-equippable"] = "不可装备"
-- IneptLootManager_Integrations/Integrations.lua:680
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:223
-- IneptLootManager/Modules/GUI/Filters.lua:191
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:301
ILM.L["None"] = "无"
-- IneptLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:103
ILM.L["Normal Mode"] = "正常模式"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:29
ILM.L["Normal"] = "Normal"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:215
ILM.L["Northrend Beasts"] = "诺森德猛兽"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1341
ILM.L["Not in a roster"] = "不在名册中"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:273
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:560
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:638
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:683
ILM.L["Not in raid"] = "不在团队/团本活动中"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:161
ILM.L["Note to be added to award. Max 25 characters. It is recommended to not include date nor selected reason here. If you will input encounter ID it will be transformed into boss name."] = "最多 25 个字符。建议不要在此处包含日期或选择的原因。如果您输入BOSS战ID，它将被转换为BOSS名称。"
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:120
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:159
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:233
ILM.L["Note"] = "备注"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:112
ILM.L["Noth the Plaguebringer"] = "瘟疫使者诺斯"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:727
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:812
ILM.L["Notify that you are passing on the item."] = "通知您正在跳过该物品。"
-- IneptLootManager_Integrations/GUI.lua:144
ILM.L["November"] = "十一月"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:704
ILM.L["Num"] = "#"
-- IneptLootManager_Integrations/Integrations.lua:144
-- IneptLootManager_Integrations/Integrations.lua:149
-- IneptLootManager_Integrations/Integrations.lua:154
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:584
-- IneptLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:427
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1154
ILM.L["OS"] = "副天赋"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:236
ILM.L["Occu'thar"] = "Occu'thar"
-- IneptLootManager_Integrations/GUI.lua:143
ILM.L["October"] = "十月"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:812
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:845
ILM.L["Off Hand"] = "副手"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1351
ILM.L["Off-spec bidding not allowed"] = "不允许副天赋出价"
-- IneptLootManager_Integrations/Migration.lua:50
ILM.L["Officer notes"] = "軍官筆記"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:240
ILM.L["Omnotron Defense System"] = "Omnotron Defense System"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:925
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:93
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:241
ILM.L["On Time Bonus Value"] = "集合奖励分值"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:88
ILM.L["On Time Bonus value"] = "集合奖励分值"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:918
-- IneptLootManager/Modules/Points/PointManager/PointManager.lua:520
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:86
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:239
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:85
ILM.L["On Time Bonus"] = "集合奖励"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:810
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:843
ILM.L["One-Hand"] = "单手"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:980
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:127
ILM.L["Online only"] = "仅限在线"
-- IneptLootManager/Modules/GUI/Filters.lua:76
ILM.L["Online"] = "在线的"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:194
ILM.L["Only when ML/RL"] = "仅当 ML/RL"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:77
ILM.L["Onyxia"] = "奥妮克希亚"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:46
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:7
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:105
ILM.L["Onyxia's Lair"] = "奥妮克希亚的巢穴"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:130
ILM.L["Open Key Bindings UI for AddOns"] = "为插件打开按键绑定界面"
-- IneptLootManager/Modules/Auctioning/AutoAssign/GUI.lua:55
ILM.L["Open trade"] = "公開貿易"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:718
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:725
ILM.L["Open"] = "公开"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:140
ILM.L["Opera Hall"] = "歌剧院"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:136
ILM.L["Ossirian the Unscarred"] = "无疤者奥斯里安"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1352
ILM.L["Other"] = "其他"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:103
ILM.L["Ouro"] = "奥罗"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:75
ILM.L["Overrides"] = "覆盖"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1292
ILM.L["PASS"] = "跳过"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1107
ILM.L["PR Rounding"] = "PR 四舍五入"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1333
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:439
ILM.L["PR"] = "PR"
-- .:indirectly
ILM.L["Paladin"] = "圣骑士"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:288
ILM.L["Participated"] = "参与"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:726
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:811
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1097
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1261
-- IneptLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:301
-- IneptLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:428
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:847
ILM.L["Pass"] = "跳过"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:1350
ILM.L["Passing after bidding not allowed"] = "不允许出价后跳过"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:108
ILM.L["Patchwerk"] = "帕奇维克"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:321
ILM.L["Patterns"] = "模式"
-- IneptLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:132
-- IneptLootManager/Modules/Loot/LootManager/AwardGUI.lua:129
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:124
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:272
ILM.L["Player"] = "角色"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:363
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:376
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:393
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:407
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:421
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:440
ILM.L["Please select a raid"] = "请选择一个团本活动"
-- IneptLootManager_Integrations/GUI.lua:19
ILM.L["Point History"] = "分数历史记录"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1077
ILM.L["Point award multiplier for players on bench."] = "替补角色获得分数的系数"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:998
ILM.L["Point caps"] = "分数上限"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:828
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1399
ILM.L["Point type"] = "分数类型"
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:22
ILM.L["Point"] = "分数"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:184
ILM.L["Points value that will be awarded."] = "将被分配的分值。"
-- IneptLootManager/Utils.lua:1124
ILM.L["Poor"] = "较差的"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:517
ILM.L["Post all bids after awarding item"] = "授予所有投標"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:516
ILM.L["Post all bids on award"] = "發布所有出價"
-- IneptLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:67
ILM.L["Post bids"] = "通告竞拍"
-- IneptLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:67
ILM.L["Post channel"] = "发布频道"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:273
ILM.L["Price Tooltips"] = "价格Tooltip"
-- .:indirectly
ILM.L["Priest"] = "牧师"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:146
ILM.L["Prince Malchezaar"] = "玛克扎尔王子"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:66
ILM.L["Prince Thunderaan"] = "Prince Thunderaan"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:101
ILM.L["Princess Huhuran"] = "哈霍兰公主"
-- IneptLootManager_Integrations/Integrations.lua:139
-- IneptLootManager_Integrations/Integrations.lua:154
ILM.L["Prioritized"] = "优先"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:224
ILM.L["Professor Putricide"] = "普崔塞德教授"
-- IneptLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:276
ILM.L["Profile %s already exists and is used by different GUID %s (%s). "] = "角色信息 %s 已存在，被不同的GUID占用 %s (%s)。 "
-- .:indirectly
ILM.L["Profiles"] = "角色信息"
-- IneptLootManager/Modules/Points/PointManager/PointManager.lua:523
ILM.L["Progression Bonus"] = "进度奖励"
-- IneptLootManager/Modules/Rosters/RosterManager/RosterManager.lua:413
ILM.L["Provide number of raids needed for 100% attendance in a weekly reset. Between 1 - 50 raids. Defaults to 2. Requires /reload."] = "请提供每周所需参与的团本活动数量以达成 100% 出勤。选择 1 - 50 ，默认值为 2。需要重新加载界面。"
-- IneptLootManager/Modules/Rosters/RosterManager/RosterManager.lua:431
ILM.L["Provide number of weeks that will be accounted for attendance. Between 1 - 1000 weeks. Defaults to 10. Requires /reload."] = "提供将计入出勤的周数。 1 - 1000 周之间。默认为 10。需要 /reload。"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:92
ILM.L["Prune profiles"] = "Prune profiles"
-- IneptLootManager_Integrations/Migration.lua:52
ILM.L["Public notes"] = "公共筆記"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1069
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:148
ILM.L["Put players leaving raid on bench instead of removing them. To remove them completely they will need to be removed manually from the bench."] = "让离开团队的角色加入替补名单。要完全移除他们，需要手动将他们从替补名单中移除。"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:225
ILM.L["Queen Lana'thel"] = "鲜血女王兰娜瑟尔"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:822
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:855
ILM.L["Quiver"] = "箭袋"
-- IneptLootManager_Integrations/Integrations.lua:234
-- IneptLootManager_Integrations/Integrations.lua:240
ILM.L["RCLC Integration"] = "RCLC 集成"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:699
ILM.L["ROLL"] = "Roll"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:170
ILM.L["Rage Winterchill"] = "雷基·冬寒"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:87
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:261
ILM.L["Ragnaros"] = "拉格纳罗斯"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:246
ILM.L["Raid Completion Bonus Value"] = "解散奖励分值"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:94
ILM.L["Raid Completion Bonus value"] = "解散奖励分值"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:933
-- IneptLootManager/Modules/Points/PointManager/PointManager.lua:522
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:101
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:244
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:91
ILM.L["Raid Completion Bonus"] = "解散奖励"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:940
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:108
ILM.L["Raid Completion Value"] = "解散奖励分值"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:184
ILM.L["Raid Name"] = "团本活动名称"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:231
ILM.L["Raid Start/End"] = "团本活动开始/结束"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:227
ILM.L["Raid Warnings"] = "团队通告"
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:429
ILM.L["Raid [%s] ended"] = "团本活动 [%s] 已结束"
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:377
ILM.L["Raid [%s] started"] = "团本活动 [%s] 已开始"
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:315
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:337
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:409
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:452
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:477
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:511
ILM.L["Raid management is disabled during time traveling."] = "在时间旅行模式中禁用团本活动管理。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:819
ILM.L["Raid"] = "团队"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:39
ILM.L["Raid: %s Roster: %s"] = "Raid: %s Roster: %s"
-- IneptLootManager/Modules/Rosters/RosterManager/RosterManager.lua:412
ILM.L["Raids needed in reset"] = "Raids needed in reset"
-- IneptLootManager_Integrations/GUI.lua:21
ILM.L["Raids"] = "团本活动"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:817
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:850
ILM.L["Ranged (wands)"] = "远程（魔杖）"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:816
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:849
ILM.L["Ranged"] = "远程"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:82
ILM.L["Ranks"] = "会阶"
-- IneptLootManager/Utils.lua:1127
ILM.L["Rare"] = "稀有的"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:88
ILM.L["Razorgore the Untamed"] = "狂野的拉佐格尔"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:207
ILM.L["Razorscale"] = "锋鳞"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:174
ILM.L["Reason"] = "原因"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:71
ILM.L["Reborn Council"] = "Reborn Council"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:430
ILM.L["Received"] = "收入"
-- IneptLootManager_Integrations/Integrations.lua:134
-- IneptLootManager_Integrations/Integrations.lua:149
ILM.L["Regular"] = "常规"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:823
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:856
ILM.L["Relic"] = "Relic"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:166
ILM.L["Reliquary of Souls"] = "灵魂之匣"
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:276
ILM.L["Remove all items from auction list. Populates new one if there are any pending."] = "从拍卖列表中删除所有项目。如果有任何待处理，将添加到列表。"
-- IneptLootManager/Modules/Auctioning/AutoAssign/GUI.lua:81
-- IneptLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:104
ILM.L["Remove all"] = "移除所有"
-- IneptLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:80
ILM.L["Remove auction"] = "移除拍卖"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:729
ILM.L["Remove from roster"] = "从名册中删除"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:680
ILM.L["Remove from standby"] = "从替补名单中移除"
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:287
ILM.L["Remove item from auction list after it's awarded."] = "分配后，从拍卖列表中移除物品。"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:488
ILM.L["Remove items without bids from auction list. This will make marking items as disenchanted not possible."] = "從拍賣列表中刪除沒有投標的項目。 這將使標記物品變得不可能。"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:487
ILM.L["Remove items without bids"] = "刪除沒有投標的項目"
-- IneptLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:93
ILM.L["Remove old"] = "移除旧的"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:382
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:285
ILM.L["Remove on award"] = "分配后移除"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:644
ILM.L["Remove override"] = "移除覆盖"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:882
ILM.L["Remove roster"] = "移除名册"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:434
ILM.L["Remove selected raid"] = "移除选中的团本活动"
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:470
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:293
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:804
ILM.L["Remove selected"] = "移除选中的"
-- IneptLootManager/Modules/Auctioning/AutoAssign/GUI.lua:68
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:286
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:888
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:396
ILM.L["Remove"] = "移除"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:889
ILM.L["Removes current roster."] = "移除当前名册。"
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:229
ILM.L["Removing %s from current queue."] = "從當前隊列中刪除 %s。"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:662
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:740
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:226
ILM.L["Removing items not allowed during auction."] = "在拍卖过程中移除不允许的物品。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:357
ILM.L["Request standby"] = "请求替补"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:109
ILM.L["Rescales ILM UI, except Bidding window. You can rescale Bidding window independently by using Ctrl + Mouse Wheel. Some windows may require closing and reopening."] = "重新调整 ILM UI，竞拍窗口除外。您可以使用 Ctrl + 鼠标滚轮独立重新调整竞拍窗口。某些窗口可能需要关闭和重新打开。"
-- IneptLootManager_Integrations/Integrations.lua:129
-- IneptLootManager_Integrations/Integrations.lua:144
ILM.L["Reserved"] = "預訂的"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:151
ILM.L["Reset gui positions"] = "重置 gui 位置"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:335
ILM.L["Restore bar defaults"] = "還原條默認值"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:370
ILM.L["Revoke standby"] = "撤销替补"
-- .:indirectly
ILM.L["Rogue"] = "潜行者"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:290
ILM.L["Roll on Loot"] = "在戰利品上擲骰"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:947
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:531
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:760
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1202
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1203
ILM.L["Roll"] = "擲骰"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:943
ILM.L["Rolling complete"] = "擲骰完成"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1391
ILM.L["Roster Name"] = "名册名称"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1390
ILM.L["Roster name"] = "名册名称"
-- IneptLootManager_Integrations/ImportCSV.lua:90
-- IneptLootManager/Modules/Loot/LootManager/AwardGUI.lua:116
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:125
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:818
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:113
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:307
ILM.L["Roster"] = "名册"
-- IneptLootManager/Modules/Common/ConfigManager/ConfigManager.lua:134
-- IneptLootManager/Modules/Common/ConfigManager/ConfigManager.lua:138
-- IneptLootManager/Modules/Common/ConfigManager/ConfigManager.lua:142
ILM.L["Rosters"] = "名册"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:226
ILM.L["Rotface"] = "腐面"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1108
ILM.L["Round PR to selected number of decimals"] = "PR 四舍五入到选定的小数位数"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:842
ILM.L["Round to selected number of decimals"] = "四舍五入到选定的小数位数"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:115
ILM.L["Round to"] = "四舍五入到"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:841
ILM.L["Rounding"] = "四舍五入"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:96
ILM.L["Ruins of Ahn'Qiraj"] = "安其拉废墟"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:700
ILM.L["SK"] = "SK"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:989
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:130
ILM.L["Same zone only"] = "仅限同一区域"
-- IneptLootManager/MinimapIcon.lua:61
ILM.L["Sandbox mode"] = "沙盒模式"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:676
ILM.L["Sandbox"] = "沙箱"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:118
ILM.L["Sapphiron"] = "萨菲隆"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:189
ILM.L["Sartharion"] = "萨塔里奥"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:231
ILM.L["Saviana Ragefire"] = "塞维娅娜·怒火"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:151
ILM.L["Scarlet Enclave"] = "Scarlet Enclave"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:719
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:726
ILM.L["Sealed"] = "封闭"
-- IneptLootManager/Modules/GUI/Filters.lua:208
ILM.L["Search for player names. Separate multiple with a comma ','. Minimum 3 characters. Overrides filtering."] = "搜索，用英文逗号','分隔多个。至少3个字母。覆盖过滤器。"
-- IneptLootManager/Modules/GUI/Filters.lua:207
ILM.L["Search"] = "搜索"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:690
ILM.L["Season of Discovery"] = "Season of Discovery"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1400
ILM.L["Select DKP or EPGP point system."] = "选择 DKP 或 EPGP 分数系统。"
-- IneptLootManager_Integrations/GUI.lua:374
ILM.L["Select Profiles to export"] = "选择要导出的角色信息"
-- IneptLootManager/Modules/Rosters/RosterManager/RosterManager.lua:448
ILM.L["Select Rosters to display"] = "选择要显示的名册"
-- IneptLootManager_Integrations/GUI.lua:343
ILM.L["Select Rosters to export"] = "选择要导出的名册"
-- IneptLootManager/Modules/GUI/Filters.lua:179
ILM.L["Select all classes."] = "选择所有职业。"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:291
ILM.L["Select default behavior whenever group loot rolling window gets opened. This will be active only during ILM Raid and while in Raid instance."] = "每當打開“組戰利擲骰”窗口時，請選擇默認行為。 這僅在ILM RAID期間和在突襲實例中處於活動狀態。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:548
ILM.L["Select equation"] = "选择公式"
-- IneptLootManager/Modules/Common/Logger/Logger.lua:23
ILM.L["Select logging level for troubleshooting"] = "选择日志记录级别以进行故障排除"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:204
ILM.L["Select loot rarity for the annoucement to raid."] = "选择在团队通告的战利品稀有度。"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:469
ILM.L["Select loot rarity threshold to used to fill the auction list."] = "选择将会被添加到拍卖列表的战利品稀有度阈值。"
-- IneptLootManager/Modules/Loot/LootManager/AwardGUI.lua:249
ILM.L["Select modifier combination for awarding."] = "选择用于分配的修饰符组合。"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:478
ILM.L["Select modifier combination for filling auction from bags and corpse."] = "选择修饰符组合用以从背包和尸体添加物品到拍卖列表。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:140
ILM.L["Select roster to add profiles to."] = "选择名册以添加角色信息。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:164
ILM.L["Select roster to create raid for."] = "选择要为其创建团本活动的名册。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:139
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:163
ILM.L["Select roster"] = "选择名册"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1005
ILM.L["Select weekly reset timezone. EU: Wed 07:00 GMT or US: Tue 15:00 GMT"] = "选择每周重置时区。EU：周三 07:00 GMT 或 US：周二 15:00 GMT"
-- IneptLootManager/Modules/Points/AutoAwardManager/AutoAwardManager.lua:102
ILM.L["Select |cffeeee00%s|r encounter difficulty for bonus value award (%s)."] = "選擇|cffeee00%s |r的獎金價值獎（%s）遇到困難。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:817
ILM.L["Selected"] = "已选中"
-- IneptLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:20
ILM.L["Send to"] = "發給"
-- IneptLootManager_Integrations/GUI.lua:142
ILM.L["September"] = "九月"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:40
ILM.L["Serpentshrine Cavern"] = "毒蛇神殿"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:469
ILM.L["Set %s points to %s players for %s in <%s>"] = "Set %s points to %s players for %s in <%s>"
-- IneptLootManager_Integrations/GenericImport.lua:183
ILM.L["Set Profiles standings in Rosters"] = "在名册中设置角色信息"
-- IneptLootManager_Integrations/Migration.lua:411
ILM.L["Set points for %s players for team to %s"] = "Set points for %s players for team to %s"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:185
ILM.L["Set raid name"] = "设置团本活动名称"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:163
ILM.L["Shade of Akama"] = "阿卡玛之影"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:143
ILM.L["Shade of Aran"] = "埃兰之影"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:58
ILM.L["Shade of Eranikus"] = "Shade of Eranikus"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:190
ILM.L["Shadron"] = "沙德隆"
-- .:indirectly
ILM.L["Shaman"] = "萨满"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:255
ILM.L["Shannox"] = "Shannox"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:83
ILM.L["Shazzrah"] = "沙斯拉尔"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:815
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:848
ILM.L["Shield"] = "盾牌"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:624
ILM.L["Shift + Alt"] = "Shift+Alt"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:627
ILM.L["Shift + Ctrl + Alt"] = "Shift + Ctrl + Alt"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:626
ILM.L["Shift + Ctrl"] = "Shift + Ctrl"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:621
ILM.L["Shift"] = "Shift"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:798
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:831
ILM.L["Shirt"] = "衬衣"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:797
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:830
ILM.L["Shoulder"] = "肩部"
-- IneptLootManager/Modules/Loot/LootManager/AwardGUI.lua:232
ILM.L["Show Award window"] = "展示奖励窗口"
-- IneptLootManager_Tracker/IneptLootManager_Tracker.lua:74
ILM.L["Show tooltip info even outside of ILM raid."] = "Show tooltip info even outside of ILM raid."
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:97
ILM.L["Silithid Royalty"] = "吉祥三宝"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:227
ILM.L["Sindragosa"] = "辛达苟萨"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:250
ILM.L["Sinestra"] = "Sinestra"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:747
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:753
ILM.L["Single-Priced"] = "Single-Priced"
-- IneptLootManager_Integrations/Migration.lua:212
ILM.L["Skipping %s"] = "跳过 %s"
-- IneptLootManager_Integrations/Migration.lua:288
ILM.L["Skipping CommunityDKP"] = "跳过 CommunityDKP"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:554
ILM.L["Slot multipliers"] = "槽位系数"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:402
ILM.L["Small value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."] = "Small value for Tiered auction.\n\nSet to same value as other tier or negative to ignore."
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:902
ILM.L["Small"] = "Small"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:69
ILM.L["Solistrasza"] = "Solistrasza"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:429
ILM.L["Spent"] = "支出"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:269
ILM.L["Spine of Deathwing"] = "Spine of Deathwing"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:313
ILM.L["Stacking"] = "堆疊"
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:814
ILM.L["Stale"] = "Stale"
-- IneptLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:136
-- IneptLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:146
ILM.L["Standby %s has been sent"] = "Standby %s has been sent"
-- IneptLootManager/Modules/Points/PointManager/PointManager.lua:524
ILM.L["Standby Bonus"] = "替补奖励"
-- IneptLootManager/Modules/GUI/Filters.lua:77
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:299
ILM.L["Standby"] = "替补"
-- IneptLootManager_Integrations/GUI.lua:18
ILM.L["Standings"] = "积分榜"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:387
ILM.L["Start selected raid"] = "开始选中的团本活动"
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:513
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:531
ILM.L["Start"] = "开始"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:508
ILM.L["Started raid %s"] = "已开始团本活动 %s"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1037
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1045
ILM.L["Starting %s"] = "開始 %s"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1031
ILM.L["Starting points"] = "起點"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:491
ILM.L["Statistics"] = "统计数据"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:261
ILM.L["Status"] = "状态"
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:513
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:531
ILM.L["Stop"] = "停止"
-- IneptLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:59
ILM.L["Store bids"] = "保存竞拍记录"
-- IneptLootManager/Modules/Auctioning/AuctionHistoryManager/AuctionHistoryManager.lua:60
ILM.L["Store finished auction bids information."] = "保存完成的拍卖信息。"
-- IneptLootManager_Integrations/GenericImport.lua:237
-- IneptLootManager_Integrations/ImportCSV.lua:117
ILM.L["Success"] = "成功"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:84
ILM.L["Sulfuron Harbinger"] = "萨弗隆先驱者"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:32
ILM.L["Sunken Temple"] = "Sunken Temple"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:100
ILM.L["Sunwell Plateau"] = "太阳井高地"
-- IneptLootManager/Modules/Common/Changelog/GUI.lua:79
ILM.L["Suppresses changelog display until new version is released"] = "禁止显示更新日志，直到发布新版本"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:162
ILM.L["Supremus"] = "苏普雷姆斯"
-- IneptLootManager/MinimapIcon.lua:52
ILM.L["Sync ongoing"] = "同步进行中"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:802
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:835
ILM.L["Tabard"] = "战袍"
-- IneptLootManager/Modules/Profiles/ProfileManager/Profile.lua:133
ILM.L["Tank"] = "坦克"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1367
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:136
ILM.L["Tax"] = "税"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:52
ILM.L["Tempest Keep"] = "风暴要塞"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:115
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:44
ILM.L["Temple of Ahn'Qiraj"] = "安其拉神殿"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:191
ILM.L["Tenebron"] = "塔尼布隆"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:142
ILM.L["Terestian Illhoof"] = "特雷斯坦·邪蹄"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:164
ILM.L["Teron Gorefiend"] = "塔隆·血魔"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:111
ILM.L["Thaddius"] = "塔迪乌斯"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:208
ILM.L["The Assembly of Iron"] = "钢铁议会"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_4_Cata.lua:29
ILM.L["The Bastion of Twilight"] = "The Bastion of Twilight"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:684
ILM.L["The Burning Crusade"] = "The Burning Crusade"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:108
ILM.L["The Crystal Vale"] = "The Crystal Vale"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:141
ILM.L["The Curator"] = "馆长"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:39
ILM.L["The Eye of Eternity"] = "永恒之眼"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:117
ILM.L["The Four Horsemen"] = "天启四骑士"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:168
ILM.L["The Illidari Council"] = "伊利达雷议会"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:228
ILM.L["The Lich King"] = "巫妖王"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:152
ILM.L["The Lurker Below"] = "鱼斯拉"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:29
ILM.L["The Obsidian Sanctum"] = "黑曜石圣殿"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:96
ILM.L["The Prophet Skeram"] = "预言者斯克拉姆"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:112
ILM.L["The Ruby Sanctum"] = "红玉圣殿"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:689
ILM.L["The War Within"] = "The War Within"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:247
ILM.L["Theralion and Valiona"] = "Theralion and Valiona"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:209
ILM.L["Thorim"] = "托里姆"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_4_Cata.lua:40
ILM.L["Throne of the Four Winds"] = "Throne of the Four Winds"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:821
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:854
ILM.L["Thrown"] = "投掷"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:578
ILM.L["Tier multipliers"] = "Tier 系数"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:749
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:754
ILM.L["Tiered"] = "Tiered"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:678
-- IneptLootManager/MinimapIcon.lua:65
ILM.L["Time Traveling"] = "时间旅行模式启用中"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1186
ILM.L["Time in seconds by which auction will be extended if bid is received during last 10 seconds."] = "如果在最后 10 秒内收到出价，拍卖将延长的时间（以秒为单位）。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1170
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1202
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1203
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:705
ILM.L["Time"] = "时间"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:783
ILM.L["Timetravel"] = "开启时间旅行模式"
-- IneptLootManager/Modules/Auctioning/AuctionHistoryManager/GUI.lua:309
ILM.L["Toggle Auction History window display"] = "开关拍卖历史窗口显示"
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:713
ILM.L["Toggle Auctioning window display"] = "开关拍卖窗口显示"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:187
ILM.L["Toggle Bidding auto-open"] = "开关自动开启竞拍"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:393
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:1426
ILM.L["Toggle Bidding window display"] = "开关竞拍窗口显示"
-- IneptLootManager_Integrations/ImportCSV.lua:215
ILM.L["Toggle CSV import window display"] = "开关 CSV 导入窗口显示"
-- IneptLootManager/MinimapIcon.lua:82
ILM.L["Toggle Minimap Icon"] = "开关小地图图标"
-- IneptLootManager/Modules/Auctioning/AutoAssign/GUI.lua:283
ILM.L["Toggle Trade List window display"] = "切換貿易列表窗口顯示"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:214
ILM.L["Toggle advancing to next item on the list after bid."] = "出價後切換到列表中的下一個項目。"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:188
ILM.L["Toggle auto open and auto close on auction start and stop"] = "开关在拍卖开始和停止时自动打开和自动关闭"
-- IneptLootManager/Modules/Common/Changelog/GUI.lua:46
-- IneptLootManager/Modules/Common/Changelog/GUI.lua:158
ILM.L["Toggle changelog window display"] = "开关更新日志窗口"
-- IneptLootManager/Modules/Common/Changelog/GUI.lua:45
ILM.L["Toggle changelog"] = "开关更新日志"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:197
ILM.L["Toggle closing bidding UI after submitting bid for all items."] = "开关提交所有物品出价后关闭竞拍界面。"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:383
ILM.L["Toggle default behavior of remove on award field in auctioning ui"] = "在拍賣UI中，在獎勵字段中刪除刪除的默認行為"
-- IneptLootManager_Integrations/GUI.lua:512
ILM.L["Toggle export window display"] = "开关导出窗口显示"
-- IneptLootManager_Integrations/GenericImport.lua:280
ILM.L["Toggle import window display"] = "开关导入窗口显示"
-- IneptLootManager/Modules/GUI/UnifiedGUI.lua:436
ILM.L["Toggle standings window display"] = "开关积分榜窗口显示"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:172
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:326
ILM.L["Toggle test bar"] = "切換測試欄"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:154
ILM.L["Toggles addon sounds."] = "开关插件声音。"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:346
ILM.L["Toggles auto-rolling on cosmetics."] = "在化妝品上切換自動滾動。"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:306
ILM.L["Toggles auto-rolling on legendary items."] = "在傳奇項目上切換自動擲骰。"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:330
ILM.L["Toggles auto-rolling on mounts."] = "在安裝座上切換自動滾動。"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:322
ILM.L["Toggles auto-rolling on patterns."] = "在配方上切換自動擲骰。"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:314
ILM.L["Toggles auto-rolling on stacking items."] = "在可堆疊項目上切換自動擲骰。"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:338
ILM.L["Toggles auto-rolling on toys."] = "切換自動滾動玩具。"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:374
ILM.L["Toggles loot and point award announcement to guild"] = "开关战利品分配通告到公会频道"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:186
ILM.L["Toggles loot announcement to raid"] = "开关战利品通告到团队频道"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:354
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:367
ILM.L["Too much data to display"] = "数据过多，无法显示"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:197
ILM.L["Toravon the Ice Watcher"] = "寒冰看守者图拉旺"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:494
ILM.L["Total blocked"] = "共被阻止"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:495
ILM.L["Total decayed"] = "共被衰减"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:493
ILM.L["Total received"] = "共获得"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:492
ILM.L["Total spent"] = "总花费"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:337
ILM.L["Toys"] = "玩具"
-- IneptLootManager_Tracker/IneptLootManager_Tracker.lua:108
ILM.L["Tracker"] = "Tracker"
-- IneptLootManager/Modules/Auctioning/AutoAssign/GUI.lua:193
-- IneptLootManager/MinimapIcon.lua:135
ILM.L["Trade List"] = "貿易清單"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:76
ILM.L["Trial of the Crusader"] = "十字军的试炼"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:809
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:842
ILM.L["Trinket"] = "饰品"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:37
ILM.L["True"] = "开启"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:42
ILM.L["Twilight Lord Kelris"] = "Twilight Lord Kelris"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:102
ILM.L["Twin Emperors"] = "双子皇帝"
-- IneptLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:266
ILM.L["Two different profiles exist for target GUID %s (%s:%s) and name %s (%s:%s). Verify and clean up profiles before updating."] = "两个不同的角色信息存在对目标 GUID %s (%s:%s) 和名字 %s (%s:%s).。请在更新之前验证并清理角色信息。"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:814
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:847
ILM.L["Two-Hand"] = "双手"
-- IneptLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:141
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:297
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:330
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:706
ILM.L["Type"] = "类型"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:108
ILM.L["UI Scale"] = "用户界面缩放"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:56
ILM.L["Ulduar"] = "奥杜尔"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:267
ILM.L["Ultraxion"] = "Ultraxion"
-- IneptLootManager_Integrations/Migration.lua:66
ILM.L["Unable to execute migration. Entries already exist."] = "无法执行迁移。条目已经存在。"
-- IneptLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:169
ILM.L["Unable to get item info from server. Please try auctioning again"] = "无法从服务器获取物品信息。请重新尝试拍卖"
-- IneptLootManager/Utils.lua:1126
ILM.L["Uncommon"] = "罕见"
-- IneptLootManager/Modules/Points/PointManager/PointManager.lua:525
ILM.L["Unexcused absence"] = "无故缺席"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:44
ILM.L["Unknown roster %s"] = "找不到名册 %s"
-- IneptLootManager/MinimapIcon.lua:56
ILM.L["Unknown sync state"] = "无需同步"
-- IneptLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:344
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:444
-- IneptLootManager/Modules/Profiles/ProfileManager/Profile.lua:32
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:170
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:240
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:285
-- IneptLootManager/Modules/GUI/UnifiedGUI_Raids.lua:343
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:172
ILM.L["Unknown"] = "未知"
-- IneptLootManager/Modules/Profiles/ProfileManager/ProfileManager.lua:323
-- IneptLootManager/Modules/Profiles/ProfileManager/AltMainLinkingGUI.lua:88
ILM.L["Unlink Alt"] = "取消链接小号"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:280
ILM.L["Unlock selected"] = "解锁选中的"
-- IneptLootManager_Integrations/Migration.lua:177
ILM.L["UpdatePoints(): Empty targets list"] = "UpdatePoints()：空目标列表"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:515
ILM.L["Updated raid <%s> %s joined, %s left, %s benched, %s removed"] = "已更新团本活动 <%s> %s 已加入, %s 已离开, %s 已替补, %s 已移除"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1257
ILM.L["Use named buttons"] = "使用命名按钮"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:89
ILM.L["Vaelastrasz the Corrupt"] = "堕落的瓦拉斯塔兹"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:216
ILM.L["Val'kyr Twins"] = "瓦格里双子"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:220
ILM.L["Valithria Dreamwalker"] = "踏梦者瓦莉瑟瑞娅"
-- IneptLootManager/Modules/Auctioning/AuctionManager/MultiGUI.lua:305
-- IneptLootManager/Modules/GUI/UnifiedGUI_History.lua:262
ILM.L["Value"] = "分值"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_3_WotLK.lua:46
ILM.L["Vault of Archavon"] = "阿尔卡冯的宝库"
-- IneptLootManager/Modules/Common/Logger/Logger.lua:31
ILM.L["Verbose"] = "详情显示"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:114
ILM.L["Version check in guild"] = "在公会中进行版本检查"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Profiles.lua:182
ILM.L["Version"] = "版本"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:192
ILM.L["Vesperon"] = "维斯匹隆"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:720
ILM.L["Vickrey"] = "Vickrey"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:100
ILM.L["Viscidus"] = "维希度斯"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:46
ILM.L["Viscous Fallout"] = "Viscous Fallout"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:158
ILM.L["Void Reaver"] = "空灵机甲"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:805
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:838
ILM.L["Waist"] = "腰部"
-- .:indirectly
ILM.L["Warlock"] = "术士"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:264
ILM.L["Warlord Zon'ozz"] = "Warlord Zon'ozz"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:268
ILM.L["Warmaster Blackhorn"] = "Warmaster Blackhorn"
-- .:indirectly
ILM.L["Warrior"] = "战士"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1013
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:109
ILM.L["Weekly cap"] = "每周上限"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:485
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:488
ILM.L["Weekly gains"] = "本周收益"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1004
ILM.L["Weekly reset timezone"] = "每周重置时区"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:112
ILM.L["Weekly reset"] = "每周重置"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:195
ILM.L["When enabled, this will make loot announcement display only if you're Master Looter or Raid Leader (if there is no Master Looter)."] = "启用后，只有当您是 Master Looter 或 Raid Leader（如果没有 Master Looter）时，才会显示战利品通告。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1258
ILM.L["Will display names of the buttons instead of values in bidding UI"] = "将在竞拍界面中显示按钮的名称而不是数值"
-- IneptLootManager/Modules/Auctioning/BiddingManager/MultiGUI.lua:359
ILM.L["Will hide bidding window if you enter combat and show it again when you exit. Will also delay auto opening if needed."] = "如果您輸入戰鬥並在退出時再次顯示出來，將隱藏出價窗口。 如果需要，還將延遲自動打開。"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:162
ILM.L["Wipe events"] = "删除所有事件"
-- IneptLootManager/Modules/Common/Logger/Logger.lua:39
ILM.L["Wipe"] = "删除"
-- IneptLootManager/Modules/Global/GlobalConfigs.lua:163
ILM.L["Wipes all events from memory. This will trigger resyncing from other users."] = "从内存中清除所有事件。这将触发来自其他用户的重新同步。"
-- IneptLootManager/Modules/Common/Logger/Logger.lua:40
ILM.L["Wipes the log history"] = "删除日志历史记录"
-- IneptLootManager_Integrations/Integrations.lua:363
ILM.L["WoW DKP Bot Integration"] = "WoW DKP Bot集成"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:70
ILM.L["World Bosses"] = "World Bosses"
-- IneptLootManager/Modules/Rosters/RosterManager/ItemValueCalculator.lua:197
ILM.L["Wowpedia"] = "Wowpedia"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:685
ILM.L["Wrath of the Lich King"] = "Wrath of the Lich King"
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:803
-- IneptLootManager/Modules/Rosters/RosterManager/Roster.lua:836
ILM.L["Wrist"] = "手腕"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:210
ILM.L["XT-002 Deconstructor"] = "XT-002拆解者"
-- IneptLootManager/Utils.lua:597
ILM.L["Yes"] = "是的"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:211
ILM.L["Yogg-Saron"] = "尤格萨隆"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:265
ILM.L["Yor'sahj the Unsleeping"] = "Yor'sahj the Unsleeping"
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:310
ILM.L["You are already in an active raid. Leave or finish it before creating new one."] = "你已经在一个正在进行的团本活动中。在创建新的之前离开或完成它。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:364
ILM.L["You are changing roster settings during active raid. You can continue without any issues however the settings will not get applied until you start a new one."] = "您將在主動突襲過程中更改名冊設置。 您可以繼續沒有任何問題，但是在開始新的問題之前，這些設置將不會應用。"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:770
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:897
ILM.L["You are not allowed to auction items"] = "您没有权限拍卖物品"
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:469
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:503
ILM.L["You are not allowed to control raid."] = "您没有权限控制团本活动。"
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:306
ILM.L["You are not allowed to create raids."] = "您没有权限创建团本活动。"
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:440
ILM.L["You are not allowed to join raid."] = "您没有权限加入团本活动。"
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:329
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:401
ILM.L["You are not allowed to start raid."] = "您没有权限开始团本活动。"
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:342
ILM.L["You are not in the raid."] = "你不在团队/团本活动中。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:700
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:709
ILM.L["You can %s max %d players from standby at the same time to a %s raid."] = "您最多可以同时%s %d 名角色从替补名单到 %s 团本活动。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:655
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:664
ILM.L["You can %s max %d players to standby at the same time to a %s raid."] = "您最多可以同时%s %d 名角色到替补名单在 %s 团本活动。"
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:473
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:507
ILM.L["You can only add players to standby of a progressing raid."] = "您只能将角色添加到正在进行的团本活动的替补名单。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:646
ILM.L["You can only bench players from same roster as the raid (%s)."] = "你只能从团队活动（%s）的同一个名册中添加替补角色。"
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:405
ILM.L["You can only end an active raid."] = "您只能结束正在进行的团本活动。"
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:444
ILM.L["You can only join an active raid."] = "你只能加入一个正在进行的团本活动。"
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:448
ILM.L["You can only join different raid than your current one."] = "您只能加入与当前团本活动不同的团本活动。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:691
ILM.L["You can only remove from bench players from same roster as the raid (%s)."] = "你只能从团队活动（%s）的同一个名册中移除替补角色。"
-- IneptLootManager/Modules/Raids/RaidManager/RaidManager.lua:333
ILM.L["You can only start a freshly created raid."] = "您只能开始新创建的团本活动。"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:743
ILM.L["You can remove max %d players from roster at the same time."] = "您最多可以从名册中同时移除 %d 名角色。"
-- IneptLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:345
ILM.L["Your bid (%s) was denied: |cffcc0000%s|r"] = "你的竞拍 (%s) 被拒绝: |cffcc0000%s|r"
-- IneptLootManager/Modules/Auctioning/BiddingManager/BiddingManager.lua:327
ILM.L["Your bid (%s) was |cff00cc00accepted|r"] = "你的竞拍 (%s) |cff00cc00成功|r"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:64
ILM.L["Zero-Sum Bank Inflation"] = "Zero-Sum Bank Inflation"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1327
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:61
ILM.L["Zero-Sum Bank"] = "Zero-Sum Bank"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1335
ILM.L["Zero-Sum Inflation Value"] = "Zero-Sum Inflation Value"
-- IneptLootManager/Modules/Points/PointManager/PointManager.lua:528
ILM.L["Zero-Sum award"] = "Zero-Sum award"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1321
ILM.L["Zero-Sum"] = "Zero-Sum"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_2_TBC.lua:88
ILM.L["Zul'Aman"] = "祖阿曼"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_S_SoD.lua:78
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs_1_Classic.lua:80
ILM.L["Zul'Gurub"] = "祖尔格拉布"
-- IneptLootManager/Modules/Points/AutoAwardManager/Encounters/EncounterIDs___Base.lua:180
ILM.L["Zul'jin"] = "祖尔金"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:218
ILM.L["[All Roster Configs]: "] = "[所有名册配置]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:224
ILM.L["[All Roster Default Slot Values]: "] = "[所有名册默认槽位值]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:202
ILM.L["[Alt-Main Link]: "] = "[小号-主号链接]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:209
ILM.L["[Create Roster]: "] = "[创建名册]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:212
ILM.L["[Delete Roster]: "] = "[删除名册]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:287
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:529
ILM.L["[IGNORE]: Ignoring entry"] = "[IGNORE]：忽略条目"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:271
ILM.L["[Item Award in Raid]: "] = "[团本中的物品分配]: "
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:268
ILM.L["[Item Award]: "] = "[物品分配]: "
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:258
ILM.L["[Point Award to raid]: "] = "[团队分数奖励]: "
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:255
ILM.L["[Point Award to roster]: "] = "[名册分数奖励]: "
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:249
ILM.L["[Point Award]: "] = "[分数奖励]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:261
ILM.L["[Point Decay for roster]: "] = "[名册分数衰减]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:252
ILM.L["[Point Decay]: "] = "[分数衰减]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:264
ILM.L["[Point Set]: "] = "[分数设置]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:205
ILM.L["[Profile Lock]: "] = "[角色信息锁定]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:275
ILM.L["[Raid Create]: "] = "[团本活动创建]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:284
ILM.L["[Raid Finish]: "] = "[团本活动结束]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:278
ILM.L["[Raid Start]: "] = "[团本活动开始]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:281
ILM.L["[Raid Update]: "] = "[团本活动更新]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:199
ILM.L["[Remove Profile]: "] = "[删除角色信息]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:215
ILM.L["[Rename Roster]: "] = "[重命名名册]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:242
ILM.L["[Roster Boss Kill Bonus]: "] = "[名册BOSS击杀奖励]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:221
ILM.L["[Roster Config]: "] = "[名册设置]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:239
ILM.L["[Roster Copy]: "] = "[复制名册]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:227
ILM.L["[Roster Default Slot Value]: "] = "[名册默认槽位值]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:245
ILM.L["[Roster Field Rename]: "] = "[名册字段重命名]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:233
ILM.L["[Roster Item Value Override Single]: "] = "[名册物品分数覆盖]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:230
ILM.L["[Roster Item Value Override]: "] = "[名册物品分数覆盖]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:236
ILM.L["[Roster Update Profiles]: "] = "[名册更新角色信息]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:196
ILM.L["[Update Profile]: "] = "[更新角色信息]："
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:405
ILM.L["[config] "] = "[配置]"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:407
ILM.L["[item values] "] = "[物品分数]"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:408
ILM.L["[profiles] "] = "[角色信息]"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:406
ILM.L["[slot defaults] "] = "[槽位默认值]"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:656
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:665
ILM.L["add"] = "添加"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:665
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:710
ILM.L["created"] = "已创建"
-- IneptLootManager_Integrations/Integrations.lua:345
ILM.L["else"] = "别的"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Audit.lua:462
ILM.L["excluding negatives "] = "不包括负数"
-- IneptLootManager_Integrations/Integrations.lua:280
ILM.L["if reason/response contains"] = "如果原因/回复包含"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:97
ILM.L["level"] = "等级"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:656
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:701
ILM.L["progressing"] = "正在进行"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:100
ILM.L["rank"] = "会阶"
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:701
-- IneptLootManager/Modules/GUI/UnifiedGUI_Standings.lua:710
ILM.L["remove"] = "移除"
-- IneptLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:137
ILM.L["request"] = "请求"
-- IneptLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:40
ILM.L["requested"] = "已请求"
-- IneptLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:147
ILM.L["revoke"] = "撤销"
-- IneptLootManager/Modules/Raids/StandbyStagingManager/StandbyStagingManager.lua:70
ILM.L["revoked"] = "已撤销"
-- IneptLootManager/Modules/Auctioning/AuctionManager/AuctionManager.lua:910
ILM.L["seconds"] = "秒"
-- IneptLootManager_Integrations/Integrations.lua:290
ILM.L["then"] = "然后"
-- IneptLootManager/Modules/Global/GlobalSlashCommands.lua:104
ILM.L["unguilded"] = "不在公会的"
-- IneptLootManager/Modules/Ledger/CrossGuildSyncManager/CrossGuildSyncManager.lua:142
ILM.L["|cff00cc00Send to:|r If you are trusted in your guild, you will also send whisper syncs to the player.\n|cff00cc00Accept from:|r You will be accepting syncs from the player.\n|cff00cc00Both:|r Both of the above."] = "|cff00cc00send to：|r如果您對公會受到信任，您還將向播放器發送竊竊私語。以上。"
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1249
ILM.L["|cff00ee44Open:|r English Auction with highest bidder announcement. Highest bidder wins. Two players can not bid same value. Additionally always allows bidding base to accomodate for Swedish Auction flavor.\n\n|cff00ee44Anonymous Open:|r Same as Open but highest bidder name is not disclosed.\n\n|cff00ee44Sealed:|r Bids are not announced. Highest bidder wins.\n\n|cff00ee44Vickrey:|r Same as sealed but winner pays with second-highest bid."] = "|cff00ee44Open:|r English Auction with highest bidder announcement. Highest bidder wins. Two players can not bid same value. Additionally always allows bidding base to accomodate for Swedish Auction flavor.\n\n|cff00ee44Anonymous Open:|r Same as Open but highest bidder name is not disclosed.\n\n|cff00ee44Sealed:|r Bids are not announced. Highest bidder wins.\n\n|cff00ee44Vickrey:|r Same as sealed but winner pays with second-highest bid."
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1125
-- IneptLootManager/Modules/Rosters/RosterManager/Options.lua:1314
ILM.L["|cff00ee44Single-Priced:|r Static value mode. Only bidding Base value is supported.\n\n|cff00ee44Ascending:|r Ranged value mode. Allows bidding any value in |cff44ee00<base, max>|r.\n\n|cff00ee44Tiered:|r Ranged value mode. Allows bidding only specific values. Up to 5 tiers are configurable in |cff44ee00<base, small, medium, large, max>|r."] = "|cff00ee44Single-Priced:|r Static value mode. Only bidding Base value is supported.\n\n|cff00ee44Ascending:|r Ranged value mode. Allows bidding any value in |cff44ee00<base, max>|r.\n\n|cff00ee44Tiered:|r Ranged value mode. Allows bidding only specific values. Up to 5 tiers are configurable in |cff44ee00<base, small, medium, large, max>|r."
-- IneptLootManager/Modules/Common/Version/Version.lua:69
ILM.L["|cffcc0000Your Inept Loot Manager is significantly out of date.|r AddOn communication has been disabled. Please update as soon as possible."] = "|cffcc0000您的 Inept Loot Manager 版本已经严重过期。|r 插件通信已被禁用。请尽快更新。"
end