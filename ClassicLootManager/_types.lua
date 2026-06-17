-- LuaLS type definitions for the CLM shared namespace.
-- This file is not loaded at runtime; it exists solely for IDE type inference.

---@meta _

-- ────────────────────────────────────────────────────────────
-- CONSTANTS sub-types
-- ────────────────────────────────────────────────────────────

---@class CLMConstantsACLLevel
---@field PLEBS number
---@field ASSISTANT number
---@field MANAGER number
---@field GUILD_MASTER number

---@class CLMConstantsACL
---@field LEVEL CLMConstantsACLLevel
---@field LEVELS table

---@class CLMConstantsAuctionCommType
---@field START_AUCTION number
---@field STOP_AUCTION number
---@field ANTISNIPE number
---@field ACCEPT_BID number
---@field DENY_BID number
---@field DISTRIBUTE_BID number

---@class CLMConstantsAuctionCommDenyBidReason
---@field NOT_IN_ROSTER number
---@field BELOW_MIN_BIDDER number
---@field NEGATIVE_STANDING_AFTER number
---@field BID_VALUE_TOO_LOW number
---@field BID_VALUE_TOO_HIGH number
---@field BID_VALUE_INVALID number
---@field BID_INCREMENT_TOO_LOW number
---@field NO_AUCTION_IN_PROGRESS number
---@field CANCELLING_NOT_ALLOWED number
---@field PASSING_NOT_ALLOWED number
---@field OFF_SPEC_NOT_ALLOWED number
---@field INVALID_ITEM number
---@field SPEC_CHANGE number

---@class CLMConstantsAuctionComm
---@field CURRENT_VERSION number
---@field BID_PASS string
---@field NUM_ANNOUNCE_CHANNELS number
---@field TYPE CLMConstantsAuctionCommType
---@field TYPES table
---@field DENY_BID_REASON CLMConstantsAuctionCommDenyBidReason

---@class CLMConstantsBiddingCommType
---@field SUBMIT_BID number
---@field NOTIFY_CANTUSE number

---@class CLMConstantsBiddingComm
---@field TYPE CLMConstantsBiddingCommType
---@field TYPES table

---@class CLMConstantsBidType
---@field MAIN_SPEC number
---@field OFF_SPEC number
---@field PASS number
---@field CANCEL number

---@class CLMConstantsAuctionInfoState
---@field NOT_CONFIGURED number
---@field IDLE number
---@field IN_PROGRESS number
---@field COMPLETE number

---@class CLMConstantsAuctionInfo
---@field STATE CLMConstantsAuctionInfoState
---@field STATES_ALLOW_ADDING_ITEMS table

---@class CLMConstantsAuctionType
---@field OPEN number
---@field SEALED number
---@field VICKREY number
---@field ANONYMOUS_OPEN number

---@class CLMConstantsSlotValueTier
---@field BASE string
---@field SMALL string
---@field MEDIUM string
---@field LARGE string
---@field MAX string

---@class CLMConstantsPointType
---@field DKP number
---@field EPGP number

---@class CLMConstantsPointChangeType
---@field TOTAL number
---@field POINTS number
---@field SPENT number

---@class CLMConstantsPointChangeReason
---@field ON_TIME_BONUS number
---@field BOSS_KILL_BONUS number
---@field RAID_COMPLETION_BONUS number
---@field PROGRESSION_BONUS number
---@field STANDBY_BONUS number
---@field UNEXCUSED_ABSENCE number
---@field CORRECTING_ERROR number
---@field MANUAL_ADJUSTMENT number
---@field ZERO_SUM_AWARD number
---@field IMPORT number
---@field DECAY number
---@field INTERVAL_BONUS number
---@field LINKING_OVERRIDE number
---@field ROSTER_JOIN number

---@class CLMConstantsPointManagerAction
---@field MODIFY number
---@field SET number
---@field DECAY number

---@class CLMConstantsItemValueMode
---@field SINGLE_PRICED number
---@field ASCENDING number
---@field TIERED number

---@class CLMConstantsItemValueEquation
---@field EPGPWEB number
---@field WOWPEDIA number

---@class CLMConstantsRaidStatus
---@field CREATED number
---@field IN_PROGRESS number
---@field FINISHED number
---@field STALE number

---@class CLMConstantsCommsDistribution
---@field WHISPER string
---@field GROUP string
---@field GUILD string
---@field BATTLEGROUND string
---@field RAID string

---@class CLMConstantsCommsPriority
---@field ALERT string
---@field NORMAL string
---@field BULK string

---@class CLMConstantsComms
---@field SEPARATOR string
---@field PRIORITIES table
---@field PRIORITY CLMConstantsCommsPriority
---@field DISTRIBUTION CLMConstantsCommsDistribution

---@class CLMConstantsConfigsGroup
---@field GLOBAL string
---@field ROSTER string

---@class CLMConstantsConfigs
---@field GROUPS table
---@field ORDERED_GROUPS table
---@field GROUP CLMConstantsConfigsGroup

---@class CLMConstantsEvents
---@field USER_RECEIVED_ITEM string
---@field USER_RECEIVED_POINTS string
---@field USER_BID_ACCEPTED string
---@field USER_BID_DENIED string
---@field GLOBAL_LOOT_REMOVED string

---@class CLMConstantsFilter
---@field IN_RAID number
---@field ONLINE number
---@field STANDBY number
---@field IN_GUILD number
---@field NOT_IN_GUILD number
---@field MAINS_ONLY number
---@field LOCKED_ONLY number

---@class CLMConstantsActionContext
---@field SELECTED number
---@field ROSTER number
---@field RAID number

---@class CLMConstantsModifierCombination
---@field DISABLED string
---@field ALT string
---@field SHIFT string
---@field CTRL string
---@field ALT_SHIFT string
---@field ALT_CTRL string
---@field SHIFT_CTRL string
---@field ALT_SHIFT_CTRL string

---@class CLMConstantsWeeklyReset
---@field EU number
---@field US number

---@class CLMConstantsHistoryType
---@field ALL number
---@field LOOT number
---@field POINT number

---@class CLMConstantsProfileInfoCommType
---@field ANNOUNCE_VERSION number
---@field REQUEST_VERSION number

---@class CLMConstantsProfileInfoComm
---@field TYPE CLMConstantsProfileInfoCommType
---@field TYPES table

---@class CLMConstantsStandbyStagingCommType
---@field SUBSCRIBE number
---@field REVOKE number

---@class CLMConstantsStandbyStagingComm
---@field TYPE CLMConstantsStandbyStagingCommType
---@field TYPES table

-- ────────────────────────────────────────────────────────────
-- Top-level CONSTANTS class
-- ────────────────────────────────────────────────────────────

---@class CLMConstants
---@field ACL CLMConstantsACL
---@field AUCTION_COMM CLMConstantsAuctionComm
---@field BIDDING_COMM CLMConstantsBiddingComm
---@field BID_TYPE CLMConstantsBidType
---@field BID_TYPES table
---@field BID_TYPE_HIDDEN table
---@field BID_TYPE_NOT_AFFECTING_HIGHEST_BID table
---@field BID_TYPE_REMOVING_BIDS table
---@field BID_TYPE_ORDER_DSC table
---@field BID_TYPE_NAMES table
---@field AUCTION_INFO CLMConstantsAuctionInfo
---@field AUCTION_TYPE CLMConstantsAuctionType
---@field AUCTION_TYPES table
---@field AUCTION_TYPES_GUI table
---@field AUCTION_TYPES_EPGP_GUI table
---@field AUCTION_TYPES_OPEN table
---@field SLOT_VALUE_TIER CLMConstantsSlotValueTier
---@field SLOT_VALUE_TIERS table
---@field SLOT_VALUE_TIERS_GUI table
---@field SLOT_VALUE_TIERS_ORDERED table
---@field SLOT_VALUE_TIERS_ORDERED_REVERSED table
---@field POINT_TYPE CLMConstantsPointType
---@field POINT_TYPES table
---@field POINT_TYPES_GUI table
---@field POINT_CHANGE_TYPE CLMConstantsPointChangeType
---@field POINT_AWARD_TYPES table
---@field POINT_DECAY_TYPES table
---@field POINT_CHANGE_REASON CLMConstantsPointChangeReason
---@field POINT_CHANGE_REASONS table
---@field POINT_MANAGER_ACTION CLMConstantsPointManagerAction
---@field POINT_MANAGER_ACTIONS table
---@field EPGP_POINT_AWARD_TYPES_GUI table
---@field EPGP_POINT_DECAY_TYPES_GUI table
---@field ITEM_VALUE_MODE CLMConstantsItemValueMode
---@field ITEM_VALUE_MODES table
---@field ITEM_VALUE_MODES_GUI table
---@field ITEM_VALUE_MODES_EPGP_GUI table
---@field ITEM_VALUE_EQUATION CLMConstantsItemValueEquation
---@field ITEM_VALUE_EQUATIONS table
---@field ITEM_VALUE_EQUATIONS_GUI table
---@field ITEM_VALUE_EQUATIONS_ORDERED table
---@field ITEM_SLOT_MULTIPLIERS table
---@field ITEM_QUALITY table
---@field INVENTORY_TYPES table
---@field INVENTORY_TYPES_GUI table
---@field INVENTORY_TYPES_SET table
---@field INVENTORY_TYPES_SORTED table
---@field RAID_STATUS CLMConstantsRaidStatus
---@field RAID_STATUS_ACTIVE number
---@field RAID_STATUSES table
---@field RAID_STATUS_GUI table
---@field COMMS CLMConstantsComms
---@field CONFIGS CLMConstantsConfigs
---@field EVENTS CLMConstantsEvents
---@field FILTER CLMConstantsFilter
---@field FILTERS_GUI table
---@field ACTION_CONTEXT CLMConstantsActionContext
---@field ACTION_CONTEXT_GUI table
---@field ACTION_CONTEXT_LIST table
---@field MODIFIER_COMBINATION CLMConstantsModifierCombination
---@field MODIFIER_COMBINATIONS table
---@field MODIFIER_COMBINATIONS_GUI table
---@field MODIFIER_COMBINATIONS_SORTED table
---@field WEEKLY_RESET CLMConstantsWeeklyReset
---@field WEEKLY_RESETS table
---@field WEEKLY_RESETS_GUI table
---@field ALLOWED_ROUNDINGS table
---@field ALLOWED_ROUNDINGS_GUI table
---@field HISTORY_TYPE CLMConstantsHistoryType
---@field HISTORY_TYPES table
---@field HISTORY_TYPES_GUI table
---@field PROFILE_INFO_COMM CLMConstantsProfileInfoComm
---@field PROFILE_ROLES_GUI table
---@field STANDBY_STAGING_COMM CLMConstantsStandbyStagingComm
---@field ROLL_TYPE table
---@field LOOT_ROLL_TYPE_ANY number
---@field LOOT_ROLL_TYPE_IGNORE number
---@field LOOT_ROLL_TYPE_TRANSMOG number
---@field ROSTER_NAME_GENERATOR table
---@field INTEGRATIONS table
---@field EXTERNAL_LOOT_AWARD_ACTION table
---@field EXTERNAL_LOOT_AWARD_ACTIONS table
---@field EXTERNAL_LOOT_AWARD_ACTIONS_GUI table
---@field EXTERNAL_LOOT_AWARD_ACTIONS_ORDERED table
---@field EXTERNAL_LOOT_AWARD_ACTION_HANDLER table
---@field EXTERNAL_LOOT_AWARD_ACTION_HANDLERS table
---@field FORMAT_VALUE table
---@field FORMAT_VALUES table
---@field EXPORT_DATA_TYPE table
---@field TIMEFRAME_SCALE_VALUE table
---@field TIMEFRAME_SCALE_VALUES table
---@field REGEXP_FLOAT string
---@field REGEXP_FLOAT_POSITIVE string
---@field TRACKER table

-- ────────────────────────────────────────────────────────────
-- Ledger sub-namespaces
-- ────────────────────────────────────────────────────────────

---@class CLMLedgerNS
---@field LOOT CLMLedgerLoot
---@field POINTS CLMLedgerPoints
---@field PROFILE CLMLedgerProfile
---@field RAID CLMLedgerRaid
---@field ROSTER CLMLedgerRoster

---@class CLMLedgerLoot
---@field Award table
---@field RaidAward table
---@field Disenchant table
---@field RaidDisenchant table

---@class CLMLedgerPoints
---@field Modify table
---@field ModifyRaid table
---@field ModifyRoster table
---@field Set table
---@field Decay table
---@field DecayRoster table

---@class CLMLedgerProfile
---@field Update table
---@field Remove table
---@field Link table
---@field Lock table

---@class CLMLedgerRaid
---@field Create table
---@field Start table
---@field End table
---@field Update table

---@class CLMLedgerRoster
---@field Create table
---@field Delete table
---@field Rename table
---@field CopyData table
---@field FieldRename table
---@field UpdateConfigSingle table
---@field UpdateDefaultSingle table
---@field UpdateProfiles table
---@field UpdateOverrides table
---@field UpdateOverridesSingle table
---@field RemoveOverrides table
---@field AwardMultiplier table
---@field BossKillBonus table
---@field DynamicItemValueEquation table
---@field DynamicItemValueExpvar table
---@field DynamicItemValueMultiplier table
---@field DynamicItemValueSlotMultiplier table
---@field DynamicItemValueTierMultiplier table

-- ────────────────────────────────────────────────────────────
-- CLM.MODELS namespace
-- ────────────────────────────────────────────────────────────

---@class CLMModelsNS
---@field Profile Profile
---@field Roster Roster
---@field Raid Raid
---@field Loot Loot
---@field PointHistory PointHistory
---@field FakePointHistory FakePointHistory
---@field PruneLog PruneLog
---@field ProfilePruneLog PruneLog
---@field AuctionItem AuctionItem
---@field AuctionInfo AuctionInfo
---@field UserResponse UserResponse
---@field BidInfoSender BidInfoSender
---@field BiddingTimerBar BiddingTimerBar
---@field AuctionCommStartAuction AuctionCommStartAuction
---@field AuctionCommDenyBid AuctionCommDenyBid
---@field AuctionCommDistributeBid AuctionCommDistributeBid
---@field AuctionCommStructure AuctionCommStructure
---@field BiddingCommSubmitBid BiddingCommSubmitBid
---@field BiddingCommStructure BiddingCommStructure
---@field ProfileInfoCommAnnounceVersion ProfileInfoCommAnnounceVersion
---@field ProfileInfoCommStructure ProfileInfoCommStructure
---@field StandbyStagingCommSubscribe StandbyStagingCommSubscribe
---@field StandbyStagingCommRevoke StandbyStagingCommRevoke
---@field StandbyStagingCommResponse StandbyStagingCommResponse
---@field StandbyStagingCommStructure StandbyStagingCommStructure
---@field RosterConfiguration RosterConfiguration
---@field PointInfo PointInfo
---@field AttendanceTracker AttendanceTracker
---@field ItemValueCalculator ItemValueCalculator
---@field Filters Filters
---@field LEDGER CLMLedgerNS

-- ────────────────────────────────────────────────────────────
-- CLM.MODULES namespace
-- ────────────────────────────────────────────────────────────

---@class CLMModulesNS
---@field ACL ACL
---@field TrustInfoProvider TrustInfoProvider
---@field Version Version
---@field EventManager EventManager
---@field Logger Logger
---@field DB DB
---@field Comms Comms
---@field ConfigManager ConfigManager
---@field Hooks Hooks
---@field ProfileManager ProfileManager
---@field ProfileInfoManager ProfileInfoManager
---@field RosterManager RosterManager
---@field RaidManager RaidManager
---@field LootManager LootManager
---@field PointManager PointManager
---@field LedgerManager LedgerManager
---@field AuctionManager AuctionManager
---@field AuctionHistoryManager AuctionHistoryManager
---@field BiddingManager BiddingManager
---@field AutoAssign AutoAssign
---@field AutoAwardManager AutoAwardManager
---@field CrossGuildSyncManager CrossGuildSyncManager
---@field SandboxManager SandboxManager
---@field StandbyStagingManager StandbyStagingManager
---@field Minimap Minimap
---@field UnifiedGUI UnifiedGUI

-- ────────────────────────────────────────────────────────────
-- Root CLM namespace
-- ────────────────────────────────────────────────────────────

---@class CLMNamespace
---@field MODULES CLMModulesNS
---@field MODELS CLMModelsNS
---@field CONSTANTS CLMConstants
---@field UTILS UTILS
---@field LOG Logger
---@field L table
---@field AUTOVERSION string
---@field CORE table
---@field GUI table
---@field OPTIONS table
---@field ALERTS table
---@field EXTERNAL table
---@field COMM_CHANNEL table
---@field AF boolean
---@field GlobalConfigs GlobalConfigs
---@field GlobalSlashCommands GlobalSlashCommands
---@field GlobalChatMessageHandlers GlobalChatMessageHandlers
---@field GlobalUIHandlers GlobalUIHandlers
---@field GlobalGuildChangeHandler GlobalGuildChangeHandler
