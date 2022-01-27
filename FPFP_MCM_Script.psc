Scriptname FPFP_MCM_Script extends Quest

Actor Property PlayerRef Auto Const

Quest Property FPE Auto Const

FPFP_BabyHandlerScript Property FPFP_BabyHandler Auto Const

Group GlobalVariables 
; This script holds all the data for FPE globals so that other mods who use the base FPE scripts to add new babies and children don't need the FPE esp as a master to their esp
GlobalVariable property FPFP_Internal_MCMHasLoaded auto const

GlobalVariable property FPFP_Global_Chance auto Const
GlobalVariable property FPFP_Global_Fertile auto Const
GlobalVariable property FPFP_Global_FertileEffects auto  Const
GlobalVariable property FPFP_Global_Contra auto Const
GlobalVariable property FPFP_Global_NPCContra auto Const
GlobalVariable property FPFP_Global_BabyToChild auto Const
GlobalVariable property FPFP_Global_ChildToAdult auto Const
GlobalVariable property FPFP_Global_CNotif auto Const
GlobalVariable property FPFP_Global_FNotif auto Const
GlobalVariable property FPFP_Global_BNotif auto Const
GlobalVariable property FPFP_Global_BGNotif auto Const
GlobalVariable property FPFP_Global_CGNotif auto Const
GlobalVariable property FPFP_Global_Day auto Const
GlobalVariable property FPFP_Global_Power auto Const
GlobalVariable property FPFP_Global_PlayerImpregsOnly auto Const
GlobalVariable property FPFP_Global_FPregPlayerOnly auto Const
GlobalVariable property FPFP_Global_MPreg auto Const
GlobalVariable property FPFP_Global_MPregPlayerOnly auto Const
GlobalVariable property FPFP_Global_AllowNonNPC auto Const
;1.1
GlobalVariable property FPFP_Global_FemaleToFemaleCum auto const
;1.15
GlobalVariable property FPFP_Global_POCNotif auto Const
GlobalVariable property FPFP_Global_CCNotif auto Const
;2.0
GlobalVariable Property FPFP_Global_MultiChance Auto Const Mandatory
GlobalVariable Property FPFP_Global_MultiMax Auto Const Mandatory
GlobalVariable Property FPFP_Global_EquipNewCondom Auto Const Mandatory
GlobalVariable Property FPFP_Global_GhoulifyChildren Auto Const Mandatory
GlobalVariable Property FPFP_Global_BabyHealth Auto Const Mandatory
GlobalVariable Property FPFP_Global_SelfImpreg Auto Const Mandatory
GlobalVariable Property FPFP_Global_LastingMorphs Auto Const Mandatory
GlobalVariable Property FPFP_Global_NPCPlayerSexUseContraOption Auto Const Mandatory
;2.1
GlobalVariable Property FPFP_Global_SynthImpreg Auto Const Mandatory
GlobalVariable property FPFP_Global_AllowFertileNPC Auto Const Mandatory
GlobalVariable property FPFP_Global_FertileNPC Auto Const Mandatory
;2.2
;2.203
GlobalVariable property FPFP_Global_Verbose Auto Const Mandatory
;2.6
GlobalVariable Property FPFP_Global_MaleBodyType Auto Const Mandatory
;3.0
GlobalVariable property FPFP_Global_Cumflation_Power Auto Const Mandatory
GlobalVariable property FPFP_Global_Cumflation_Time Auto Const Mandatory
GlobalVariable property FPFP_Global_Cumflation_Chance Auto Const Mandatory
GlobalVariable property FPFP_Global_Cumflation_Toggle Auto Const Mandatory
GlobalVariable property FPFP_Global_Perks_Monthly Auto Const Mandatory
GlobalVariable property FPFP_Global_Perks_Father Auto Const Mandatory
GlobalVariable property FPFP_Global_Perks_Harem Auto Const Mandatory
GlobalVariable property FPFP_Global_PlayerClone Auto Const Mandatory
GlobalVariable property INVB_Global_RequireTags Auto Const Mandatory
;3.15
GlobalVariable property FPFP_Global_Cumflation_Notif Auto Const Mandatory
GlobalVariable property FPFP_Global_Impregnation_Notif Auto Const Mandatory
;3.175
GlobalVariable property INVB_Global_Baby_Hold Auto Const Mandatory
;3.2
GlobalVariable property INVB_Global_MessageType_Impreg Auto Const Mandatory
GlobalVariable property INVB_Global_MessageType_sex Auto Const Mandatory
GlobalVariable property INVB_Global_Marriage_Polygamy Auto Const Mandatory
GlobalVariable property INVB_Global_MessageType_Wedding Auto Const Mandatory
GlobalVariable property INVB_Global_ForceFatherQuest Auto Const Mandatory
GlobalVariable property INVB_Global_Marriage_Chance Auto Mandatory
GlobalVariable property INVB_Global_Marriage_NPCs Auto Mandatory
GlobalVariable property INVB_Global_Racial_Baby_Chance Auto Const Mandatory
GlobalVariable property INVB_Global_Marriage_AnimeIsekai Auto Const Mandatory
GlobalVariable property FPFP_Global_Cumflation_Notif_Chance Auto Const Mandatory
GlobalVariable property INVB_Global_MessageType_Impreg_Chance Auto Const Mandatory
GlobalVariable property INVB_Global_MessageType_sex_Chance Auto Const Mandatory
GlobalVariable property INVB_Global_MessageType_Move_sex_Chance Auto Const Mandatory
GlobalVariable property INVB_Global_MessagePlayer_sex Auto Const Mandatory
GlobalVariable property INVB_Global_MessagePlayer_Impreg Auto Const Mandatory
GlobalVariable property INVB_Global_Birth_Death_Chance Auto Const Mandatory
GlobalVariable property INVB_Global_MessageType_Birth Auto Const Mandatory
GlobalVariable property INVB_Global_MessageType_Birth_Chance Auto Const Mandatory
;3.25
GlobalVariable property FPFP_Global_Perks_Monthly_Enable Auto Const Mandatory
GlobalVariable property FPFP_Global_Perks_Father_Enable Auto Const Mandatory
GlobalVariable property FPFP_Global_Perks_Harem_Enable Auto Const Mandatory

GlobalVariable property INVB_Global_Female_Player_Dominant Auto Const Mandatory
GlobalVariable property INVB_Global_Male_Player_Dominant Auto Const Mandatory
GlobalVariable property FPFP_Global_MaleToMaleCum Auto Const Mandatory
GlobalVariable property INVB_Global_ForceLabourQuest Auto Const Mandatory
GlobalVariable property INVB_Global_ForceAbortQuest Auto Const Mandatory
GlobalVariable property INVB_Global_ForceLossQuest Auto Const Mandatory

;3.33
GlobalVariable property INVB_Global_Infect Auto Const Mandatory
GlobalVariable property INVB_Global_Infect_Chance Auto Const Mandatory
GlobalVariable property INVB_Global_Infect_Chance_New Auto Const Mandatory
;3.4

GlobalVariable property FPFP_Global_Chance_Player_M Auto Const Mandatory
GlobalVariable property FPFP_Global_Chance_Player_F Auto Const Mandatory
GlobalVariable property FPFP_Global_Gender_Select Auto Const Mandatory
GlobalVariable property FPFP_Global_Outcome_Animal Auto Const Mandatory
GlobalVariable property FPFP_Global_Outcome_Human Auto Const Mandatory
GlobalVariable property FPFP_Global_Outcome_NonHuman Auto Const Mandatory
GlobalVariable property FPFP_Global_Receiver Auto Const Mandatory
GlobalVariable property FPFP_Global_CGNotif_Type auto Const

;3.5

GlobalVariable Property FPFP_Global_MultiBirth Auto Mandatory
GlobalVariable Property FPFP_Global_MultiBirth_Modifier Auto Mandatory
GlobalVariable Property FPFP_Global_Cumshot Auto Mandatory
GlobalVariable property FPFP_Global_Rename Auto Const Mandatory
GlobalVariable property FPFP_Global_BloodyBirth Auto Const Mandatory
GlobalVariable property FPFP_Global_CondomOutcome Auto Const Mandatory
GlobalVariable property FPFP_Global_ARReceiver Auto Const Mandatory
GlobalVariable property FPFP_Global_ARMessageType Auto Const Mandatory
GlobalVariable property FPFP_Global_AllowNONWDF Auto Const Mandatory
GlobalVariable property FPFP_Global_AllowSettlers Auto Const Mandatory

GlobalVariable property FPFP_Global_Total_Births Auto Const Mandatory
GlobalVariable property FPFP_Global_Total_Births_Player Auto Const Mandatory
GlobalVariable property FPFP_Global_Total_Freeze Auto Const Mandatory
GlobalVariable property FPFP_Global_BirthLimit Auto Const Mandatory
GlobalVariable property INVB_Global_Marriage_Command_Duration Auto Const Mandatory
GlobalVariable property INVB_Global_Marriage_Command_Chance Auto Const Mandatory
GlobalVariable property INVB_Global_Marriage_Honeynoon Auto
GlobalVariable property INVB_Global_Marriage_Honeynoon_Duration Auto


GlobalVariable property FPFP_Global_Rename_Baby Auto
GlobalVariable property FPFP_Global_Allow_ReRenaming Auto Const Mandatory

;3.7
GlobalVariable property INVB_Global_MessageType_Roleplay Auto Const Mandatory
GlobalVariable property FPFP_Global_BodyType_CBBE Auto Const Mandatory
GlobalVariable property FPFP_Global_BodyType_FG Auto Const Mandatory
GlobalVariable property FPFP_Global_Creature_Faction Auto Const Mandatory
;3.75
GlobalVariable Property FPFP_Global_Synth_hidden Auto Const Mandatory
GlobalVariable Property FPFP_Global_CreatureDNAOnce Auto Const Mandatory
GlobalVariable property INVB_Global_Infect_Strength Auto Const Mandatory
GlobalVariable property FPFP_Global_Viable Auto Const Mandatory
GlobalVariable property FPFP_Global_Viable_Renaming Auto Const Mandatory

;3.80
GlobalVariable property FPFP_Global_Breeder_modifier Auto Const Mandatory
GlobalVariable property FPFP_Global_Monthly_MessageType Auto Const Mandatory
GlobalVariable property FPFP_Global_Toggle_Creature_Chances Auto Const Mandatory
GlobalVariable property FPFP_Global_Length_Human Auto Const Mandatory
GlobalVariable property FPFP_Global_Morph_Human Auto Const Mandatory
GlobalVariable property FPFP_Global_Length_Ghoul Auto Const Mandatory
GlobalVariable property FPFP_Global_Morph_Ghoul Auto Const Mandatory
GlobalVariable property FPFP_Global_Chance_Ghoul Auto Const Mandatory
GlobalVariable property FPFP_Global_Viable_Ghoul Auto Const Mandatory
GlobalVariable property FPFP_Global_Cumflation_FemaletoFemale Auto Const Mandatory

EndGroup

String ThisMod = "FP_FamilyPlanningEnhanced"

Event OnQuestInit()

	FPFP_Internal_MCMHasLoaded.SetValue(0)

	If CheckForMCM(true)
	
		UpdateSettings(true)
	
	EndIf
	
	RegisterForRemoteEvent(PlayerRef, "OnPlayerLoadGame")

	RegisterForExternalEvent("OnMCMSettingChange|"+ThisMod, "OnMCMSettingChange")
	
	FPFP_Internal_MCMHasLoaded.SetValue(1)

EndEvent

Function OnMCMSettingChange(string modName, string id)
	;UnregisterForExternalEvent("OnMCMSettingChange|"+ThisMod)
	If modName == ThisMod	
		UpdateSettings()
	EndIf
	;RegisterForExternalEvent("OnMCMSettingChange|"+ThisMod, "OnMCMSettingChange")
EndFunction

Function UpdateSettings(bool firstLoad = false)

	LoadSetting(FPFP_Global_Chance, "fChance:Chances", 0.0, 100.0)
	LoadSetting(FPFP_Global_Chance_Player_F, "fChance_Player_F:Chances", 0.0, 100.0)
	LoadSetting(FPFP_Global_Chance_Player_M, "fChance_Player_M:Chances", 0.0, 100.0)
	LoadSetting(FPFP_Global_Gender_Select, "fChance_Gender:Chances", 0.0, 100.0)	
	LoadSetting(FPFP_Global_Contra, "fContra:Chances", 0.0, 100.0)
	LoadSetting(FPFP_Global_Fertile, "fFertile:Chances", 0.0, 100.0)
	LoadSetting(FPFP_Global_FertileEffects, "fFertileEffects:Chances", 1.0, 100.0)
	LoadSetting(FPFP_Global_NPCContra, "fNPCContra:Chances", 0.0, 100.0)
	LoadSpecialSetting(FPFP_Global_BabyToChild, "fBabyToChild:Baby", 1.0, 60.0,"BabyToChild")
	LoadSpecialSetting(FPFP_Global_ChildToAdult, "fChildToAdult:Baby", 1.0, 180.0,"ChildToAdult")
	LoadSetting(FPFP_Global_POCNotif, "fPOCNotif:Notifs", 0.0, 1.0)
	LoadSetting(FPFP_Global_CCNotif, "fCCNotif:Notifs", 0.0, 1.0)
	LoadSetting(FPFP_Global_CNotif, "fCNotif:Notifs", 0.0, 1.0)
	LoadSetting(FPFP_Global_FNotif, "fFNotif:Notifs", 0.0, 1.0)
	LoadSetting(FPFP_Global_BNotif, "fBNotif:Notifs", 0.0, 1.0)
	LoadSetting(FPFP_Global_BGNotif, "fBGNotif:Notifs", 0.0, 1.0)
	LoadSetting(FPFP_Global_CGNotif, "fCGNotif:Notifs", 0.0, 1.0)
	LoadSpecialSetting(FPFP_Global_Day, "fDay:Misc", 1.0, 31.0,"Day")
	LoadSetting(FPFP_Global_Power, "fPower:Misc", 0.0, 20.0)
	LoadSetting(FPFP_Global_PlayerImpregsOnly, "fPlayerImpregsOnly:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_FPregPlayerOnly, "fFPregPlayerOnly:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_MPreg, "fMPreg:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_MPregPlayerOnly, "fMPregPlayerOnly:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_AllowNonNPC, "fAllowNonNPC:Misc", 0.0, 2.0)
	LoadSetting(FPFP_Global_FemaleToFemaleCum, "fFemaleToFemaleCum:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_MultiChance, "fMultiChance:Chances", 0.0, 100.0)
	LoadSetting(FPFP_Global_MultiMax, "fMultiMax:Baby", 1.0, 30.0)
	LoadSetting(FPFP_Global_EquipNewCondom, "fEquipNewCondom:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_BabyHealth, "fBabyHealth:Baby", 0.0, 1.0)
	LoadSetting(FPFP_Global_GhoulifyChildren, "fGhoulifyChildren:Baby", 0.0, 1.0)
	LoadSetting(FPFP_Global_SelfImpreg, "fSelfImpreg:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_LastingMorphs, "fLastingMorphs:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_NPCPlayerSexUseContraOption, "fNPCPlayerSexUseContraOption:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_SynthImpreg, "fSynthImpreg:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_AllowFertileNPC, "fAllowFertileNPC:Chances", 0.0, 1.0)
	LoadSetting(FPFP_Global_FertileNPC, "fFertileNPC:Chances", 0.1, 10.0)
	LoadSetting(FPFP_Global_Verbose, "fVerboseLogging:Debugging", 0.0, 1.0)
	LoadSetting(FPFP_Global_MaleBodyType, "fMaleBodyType:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_Cumflation_Chance, "fCumflation_chance:Cumflation", 0.0, 100.0)
	LoadSetting(FPFP_Global_Cumflation_Power, "fCumflation_power:Cumflation", 0.1, 2.0)
	LoadSetting(FPFP_Global_Cumflation_Time, "fCumflation_time:Cumflation", 10.0, 240.0)
	LoadSetting(FPFP_Global_Cumflation_Toggle, "fCumflation_toggle:Cumflation", 0.0, 1.0)
	LoadSetting(FPFP_Global_Perks_Monthly, "fPerks_Monthly:Preg_Perks", 0.0, 2.0)
	LoadSetting(FPFP_Global_Perks_Father, "fPerks_Father:Preg_Perks", 0.0, 1.0)
	LoadSetting(FPFP_Global_Perks_Harem, "fPerks_Harem:Preg_Perks", 0.0, 1.0)
	LoadSetting(FPFP_Global_PlayerClone, "fPlayerClone:Misc", 0.0, 1.0)
	LoadSetting(INVB_Global_RequireTags, "fRequireTags:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_Cumflation_Notif, "fCumflation_Notif:Cumflation", 0.0, 1.0)
	LoadSetting(FPFP_Global_Impregnation_Notif, "fImpregnation_Notif:Misc", 0.0, 2.0)
	LoadSetting(INVB_Global_Baby_Hold, "fBaby_Holding:Baby", 0.0, 3.0)
	LoadSetting(INVB_Global_ForceFatherQuest, "fFatherQuest:Misc", 0.0, 1.0)
	LoadSetting(INVB_Global_MessageType_Impreg, "fMessageImpreg_Notif:Misc", 0.0, 2.0)
	LoadSetting(INVB_Global_MessageType_sex, "fMessageSex_Notif:Misc", 0.0, 2.0)
	LoadSetting(INVB_Global_MessageType_Wedding, "fMessageMarriage_Notif:Marriage", 0.0, 2.0)
	LoadSetting(INVB_Global_Marriage_Polygamy, "fMarriage_Poly:Marriage", 0.0, 1.0)
	LoadSetting(INVB_Global_Marriage_AnimeIsekai, "fMarriage_AnimeIsekai:Marriage", 0.0, 1.0)
	LoadSetting(INVB_Global_Marriage_Chance, "fMarriage_chance:Marriage", 0.0, 100.0)
	LoadSetting(INVB_Global_Marriage_NPCs, "fMarriage_NPC:Marriage", 0.0, 1.0)
	LoadSetting(INVB_Global_Racial_Baby_Chance, "fRacialBaby_chance:Baby", 0.0, 100.0)
	LoadSetting(FPFP_Global_Cumflation_Notif_Chance, "fCumflation_Notif_chance:Cumflation", 0.0, 100.0)	
	LoadSetting(INVB_Global_MessageType_Impreg_Chance, "fMessageImpreg_Notif_chance:Misc", 0.0, 100.0)	
	LoadSetting(INVB_Global_MessageType_sex_Chance, "fMessageSex_Notif_chance:Misc", 0.0, 100.0)	
	LoadSetting(INVB_Global_MessageType_Move_sex_Chance, "fMessageSexMove_Notif_chance:Misc", 0.0, 100.0)
	LoadSetting(INVB_Global_MessagePlayer_Impreg, "fMessageImpreg_Player:Misc", 0.0, 2.0)	
	LoadSetting(INVB_Global_MessagePlayer_sex, "fMessageSex_Player:Misc", 0.0, 2.0)
	
	LoadSetting(INVB_Global_Birth_Death_Chance, "fBirth_Death_chance:Chances", 0.0, 100.0)	
	LoadSetting(INVB_Global_MessageType_Birth_Chance, "fMessageBirth_Notif_chance:Misc", 0.0, 100.0)
	LoadSetting(INVB_Global_MessageType_Birth, "fMessageBirth_Notif:Misc", 0.0, 2.0)
	
	LoadSetting(FPFP_Global_Perks_Monthly_Enable, "fPerks_Monthly_Enable:Preg_Perks", 0.0, 2.0)
	LoadSetting(FPFP_Global_Perks_Father_Enable, "fPerks_Father_Enable:Preg_Perks", 0.0, 2.0)
	LoadSetting(FPFP_Global_Perks_Harem_Enable, "fPerks_Harem_Enable:Preg_Perks", 0.0, 2.0)
	
	LoadSetting(INVB_Global_Male_Player_Dominant, "fMale_Dominant_NPC:Misc", 0.0, 1.0)
	LoadSetting(INVB_Global_Female_Player_Dominant, "fFemale_Dominant_NPC:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_MaleToMaleCum, "fMaleToMaleCum:Misc", 0.0, 1.0)
	
	LoadSetting(INVB_Global_ForceAbortQuest, "fAbortQuest:Misc", 0.0, 1.0)
	LoadSetting(INVB_Global_ForceLabourQuest, "fLabourQuest:Misc", 0.0, 2.0)
	LoadSetting(INVB_Global_ForceLossQuest, "fLossQuest:Misc", 0.0, 1.0)
	
	
	LoadSetting(INVB_Global_Infect, "fInfect:Misc", 0.0, 1.0)
	LoadSetting(INVB_Global_Infect_Chance, "fInfect_Chance:Misc", 0.0, 100.0)
	LoadSetting(INVB_Global_Infect_Chance_New, "fInfect_Chance_new:Misc", 0.0, 100.0)
	
	LoadSetting(FPFP_Global_Receiver, "fReceiver:Outcome", 0.0, 1.0)
	LoadSetting(FPFP_Global_Outcome_Animal, "fOutcome_Animal:Outcome", 0.0, 1.0)
	LoadSetting(FPFP_Global_Outcome_Human, "fOutcome_Human:Outcome", 0.0, 1.0)
	LoadSetting(FPFP_Global_Outcome_NonHuman, "fOutcome_NonHuman:Outcome", 0.0, 1.0)
	LoadSetting(FPFP_Global_CGNotif_Type, "fCGNotif_Type:Notifs", 0.0, 1.0)	
	LoadSetting(FPFP_Global_MultiBirth, "fMultiBirth:Multiple", 0.0, 1.0)
	LoadSetting(FPFP_Global_MultiBirth_Modifier, "fMultiBirth_Mod:Multiple", 0.0, 5.0)
	LoadSetting(FPFP_Global_Cumshot, "fCumshot:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_BloodyBirth, "fBloodyBirth:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_Rename, "fRename:Baby", 0.0, 1.0)
	LoadSetting(FPFP_Global_Rename_Baby, "fRename_Baby:Baby", 0.0, 1.0)
	LoadSetting(FPFP_Global_CondomOutcome, "fCondomOutcome:Misc", 0.0, 4.0)
	
	
	LoadSetting(FPFP_Global_ARReceiver, "fReceiverAR:AdultResources", 0.0, 1.0)
	LoadSetting(FPFP_Global_ARMessageType, "fMessageAR_Type:AdultResources", 0.0, 2.0)
	LoadSetting(FPFP_Global_AllowNONWDF, "fAllowNONWDF:AdultResources", 0.0, 1.0)
	LoadSetting(FPFP_Global_AllowSettlers, "fAllowSettlers:AdultResources", 0.0, 1.0)
	
	LoadSetting(FPFP_Global_Total_Births, "fTotal_Births:Limits", 0.0, 250.0)
	LoadSetting(FPFP_Global_Total_Births_Player, "fTotal_Births_Player:Limits", 0.0, 250.0)
	LoadSetting(FPFP_Global_Total_Freeze, "fTotal_Freeze:Limits", 0.0, 2.0)
	LoadSetting(FPFP_Global_BirthLimit, "fBirthLimit:Limits", 0.0, 1.0)
	
	LoadSetting(INVB_Global_Marriage_Honeynoon, "fHoneynoon:Marriage", 0.0, 1.0)
	LoadSetting(INVB_Global_Marriage_Honeynoon_Duration, "fHoneynoon_Duration:Marriage", 0.0, 300.0)
	LoadSetting(INVB_Global_Marriage_Command_Duration, "fMarriageSex_Duration:Marriage", 0.0, 300.0)
	LoadSetting(INVB_Global_Marriage_Command_Chance, "fMarriageSex_Chances:Marriage", 1.0, 100.0)
	
	

	LoadSetting(FPFP_Global_Allow_ReRenaming, "fAllow_ReRenaming:Baby", 0.0, 1.0)
	
	
	
	LoadSetting(INVB_Global_MessageType_Roleplay, "fMessageRoleplay:Misc", 0.0, 5.0)
	LoadSetting(FPFP_Global_BodyType_CBBE, "fBodyType_CBBE:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_BodyType_FG, "fBodyType_FG:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_Creature_Faction, "fCreature_Faction:Creature", 0.0, 4.0)
	
	
	LoadSetting(FPFP_Global_Synth_hidden, "fSynthHidden:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_CreatureDNAOnce, "fCreature_DNA:Creature", 0.0, 1.0)
	
	LoadSetting(INVB_Global_Infect_Strength, "fInfect_Strength:Misc", 0.0, 2.0)
	
	LoadSetting(FPFP_Global_Viable, "fChance_Viable:Chances", 0.0, 100.0)
	
	LoadSetting(FPFP_Global_Viable_Renaming, "fChance_Viable_Renaming:Baby", 0.0, 2.0)
	
	
	LoadSetting(FPFP_Global_Breeder_modifier, "fBreeder_modifier:Preg_Perks", 0.0, 4.0)
	LoadSetting(FPFP_Global_Monthly_MessageType, "fMonthNotif:Notifs", 0.0, 2.0)
	
	
	
	
	
	LoadSetting(FPFP_Global_Toggle_Creature_Chances, "fCreature_Chances_Toggle:Chances", 0.0, 1.0)
	LoadSetting(FPFP_Global_Length_Human, "fPregnancyLength_Human:Misc", 1.0, 20.0)
	LoadSetting(FPFP_Global_Morph_Human, "fMorph_Human:Misc", 0.0, 2.0)
	
	LoadSetting(FPFP_Global_Length_Ghoul, "fPregnancyLength_Ghoul:Misc", 1.0, 20.0)
	LoadSetting(FPFP_Global_Morph_Ghoul, "fMorph_Ghoul:Misc", 0.0, 2.0)	
	LoadSetting(FPFP_Global_Chance_Ghoul, "fChance_Ghoul:Chances", 0.0, 100.0)
	LoadSetting(FPFP_Global_Viable_Ghoul, "fChance_Viable_Ghoul:Chances", 0.0, 100.0)
	
	LoadSetting(FPFP_Global_Cumflation_FemaletoFemale, "fCumflation_FemaletoFemale:Cumflation", 0.0, 1.0)
	
EndFunction

Function LoadSetting(GlobalVariable akGlobal, string asSetting, float afMin, float afMax)

	float settingBuffer = MCM.GetModSettingFloat(ThisMod, asSetting)
	
	If settingBuffer != akGlobal.GetValue() ;1.15 - If the value changed

		If settingBuffer <= afMax && settingBuffer >= afMin ; The setting is within the range of values 
	
			akGlobal.SetValue(settingBuffer)
	
		ElseIf settingBuffer < afMin ; The setting is improperly less than the minimum
	
			akGlobal.SetValue(afMin)
		
			MCM.SetModSettingFloat(ThisMod, asSetting, afMin)
	
		ElseIf settingBuffer > afMax ; The setting is improperly greater than the max
	
			akGlobal.SetValue(afMax)
		
			MCM.SetModSettingFloat(ThisMod, asSetting, afMax)
	
		EndIf
		
	EndIf

EndFunction

Function LoadSpecialSetting(GlobalVariable akGlobal, string asSetting, float afMin, float afMax, string asHandle)

	Float buffer = akGlobal.GetValue()
	
	LoadSetting(akGlobal, asSetting, afMin, afMax)
	
	If buffer != akGlobal.GetValue()
	
		FPFP_BabyHandler.HandleMCMUpdate(asHandle)
	
	EndIf

EndFunction

Event Actor.OnPlayerLoadGame(Actor akSender)

	If CheckForMCM()
		UpdateSettings()
	EndIf

EndEvent

bool Function CheckForMCM(bool FirstLoad = false)

	If !MCM.IsInstalled()
	
		If FirstLoad
			
			Utility.Wait(1.0)
			DEBUG.Notification("AAF Family Planning Enhanced: Please install Mod Configuration Menu. Reset Family Planning Enhanced's MCM to get the MCM working.")
			DEBUG.Notification("AAF Family Planning Enhanced: Please install Mod Configuration Menu. Reset Family Planning Enhanced's MCM to get the MCM working.")
			DEBUG.Notification("AAF Family Planning Enhanced: Please install Mod Configuration Menu. Reset Family Planning Enhanced's MCM to get the MCM working.")
			
		Else
		
			DEBUG.MessageBox("AAF Family Planning Enhanced: Please re-install Mod Configuration Menu. Reset Family Planning Enhanced's MCM to get the MCM working.")
		
		EndIf
		
		Return False
	
	EndIf
	
	Return True

EndFunction