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
GlobalVariable property FPFP_Global_Monthly_MessageType Auto Const Mandatory
GlobalVariable property FPFP_Global_Toggle_Creature_Chances Auto Const Mandatory
GlobalVariable property FPFP_Global_Length_Human Auto Const Mandatory
GlobalVariable property FPFP_Global_Morph_Human Auto Const Mandatory
GlobalVariable property FPFP_Global_Length_Ghoul Auto Const Mandatory
GlobalVariable property FPFP_Global_Morph_Ghoul Auto Const Mandatory
GlobalVariable property FPFP_Global_Chance_Ghoul Auto Const Mandatory
GlobalVariable property FPFP_Global_Viable_Ghoul Auto Const Mandatory
GlobalVariable property FPFP_Global_Cumflation_FemaletoFemale Auto Const Mandatory

;3.85
GlobalVariable property FPFP_Global_BabyToChild_Ghoul auto Const
GlobalVariable property FPFP_Global_ChildToAdult_Ghoul auto Const
GlobalVariable property FPFP_Global_PostPartum Auto Const Mandatory 
GlobalVariable property FPFP_Global_PostPartum_Power Auto Const Mandatory 
GlobalVariable property FPFP_Global_PostPartum_Minimum Auto Const Mandatory
GlobalVariable property FPFP_Internal_UpdateTime auto const
GlobalVariable property FPFP_Internal_UpdateTime_Breeder Auto Const Mandatory
GlobalVariable property FPFP_Internal_UpdateTime_Player Auto Const Mandatory 
GlobalVariable property FPFP_Internal_UpdateTime_PostPartum Auto Const Mandatory 
GlobalVariable property FPFP_Global_Cumflation_Time_Refresh Auto Const Mandatory
GlobalVariable property FPFP_Global_Cumflation_Toggle_IVF Auto Const Mandatory

GlobalVariable property FPFP_Global_Morph_Human_Cumflation Auto Const Mandatory
GlobalVariable property FPFP_Global_Morph_Ghoul_Cumflation Auto Const Mandatory

;4.00
GlobalVariable property FPFP_Global_CSection_Chance Auto Const Mandatory
GlobalVariable property FPFP_Global_CSection_MonthLimit Auto Const Mandatory
GlobalVariable property FPFP_Global_CSection_Alive Auto Const Mandatory
GlobalVariable property FPFP_Global_CSection_Failure_Chance Auto Const Mandatory

GlobalVariable property FPFP_Global_Counter_SexHuman Auto Const Mandatory
GlobalVariable property FPFP_Global_Counter_SexHuman_Player Auto Const Mandatory
GlobalVariable property FPFP_Global_Counter_SexHuman_Player_Choice Auto Const Mandatory
GlobalVariable property FPFP_Global_Counter_SexGhoul Auto Const Mandatory
GlobalVariable property FPFP_Global_Counter_BirthHuman Auto Const Mandatory
GlobalVariable property FPFP_Global_Counter_BirthGhoul Auto Const Mandatory
GlobalVariable property FPFP_Global_Counter_SafeSex Auto Const Mandatory
GlobalVariable property FPFP_Global_ViableMonth Auto Const Mandatory
GlobalVariable property FPFP_Global_ViableMonth_Chance Auto Const Mandatory
GlobalVariable property FPFP_Global_ViableMonth_Perk Auto Const Mandatory

GlobalVariable property FPFP_Global_Fertile_Length auto Const
GlobalVariable property FPFP_Global_Fertile_Toggle auto Const
GlobalVariable property FPFP_Global_LactationMonth Auto Const Mandatory

GlobalVariable property FPFP_Global_Infertile_Length auto Const
GlobalVariable property FPFP_Global_Infertile_Toggle auto Const
GlobalVariable property FPFP_Global_Chance_IVF Auto Const Mandatory




GlobalVariable property FPFP_Global_Mothers_DNA Auto Const Mandatory

GlobalVariable property FPFP_Global_PostPartum_Post Auto Const Mandatory

GlobalVariable property FPFP_Global_Allow_Pregnancy Auto Const Mandatory

GlobalVariable property FPFP_Global_Allow_Pregnancy_Faction Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_STDs Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_STDs_Faction Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_Breeder Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_Breeder_Faction Auto Const Mandatory

GlobalVariable property FPFP_Global_STDChance_BOS Auto Mandatory
GlobalVariable property FPFP_Global_STDChance_COA Auto Mandatory
GlobalVariable property FPFP_Global_STDChance_Gunner Auto Mandatory
GlobalVariable property FPFP_Global_STDChance_Institute Auto Mandatory
GlobalVariable property FPFP_Global_STDChance_Institute_Synth Auto Mandatory
GlobalVariable property FPFP_Global_STDChance_MM Auto Mandatory
GlobalVariable property FPFP_Global_STDChance_Raider Auto Mandatory
GlobalVariable property FPFP_Global_STDChance_RR Auto Mandatory
GlobalVariable property FPFP_Global_STDChance_Settler Auto Mandatory
GlobalVariable property FPFP_Global_STDChance_Vault81 Auto Mandatory
GlobalVariable property FPFP_Global_STDChance_DLC04_Pack Auto Mandatory
GlobalVariable property FPFP_Global_STDChance_DLC04_Operators Auto Mandatory
GlobalVariable property FPFP_Global_STDChance_DLC04_Disciples Auto Mandatory
GlobalVariable property FPFP_Global_STDChance_DLC04_Slaves Auto Mandatory

GlobalVariable property FPFP_Global_BreederChance_BOS Auto Mandatory
GlobalVariable property FPFP_Global_BreederChance_COA Auto Mandatory
GlobalVariable property FPFP_Global_BreederChance_Gunner Auto Mandatory
GlobalVariable property FPFP_Global_BreederChance_Institute Auto Mandatory
GlobalVariable property FPFP_Global_BreederChance_Institute_Synth Auto Mandatory
GlobalVariable property FPFP_Global_BreederChance_MM Auto Mandatory
GlobalVariable property FPFP_Global_BreederChance_Raider Auto Mandatory
GlobalVariable property FPFP_Global_BreederChance_RR Auto Mandatory
GlobalVariable property FPFP_Global_BreederChance_Settler Auto Mandatory
GlobalVariable property FPFP_Global_BreederChance_Vault81 Auto Mandatory
GlobalVariable property FPFP_Global_BreederChance_DLC04_Pack Auto Mandatory
GlobalVariable property FPFP_Global_BreederChance_DLC04_Operators Auto Mandatory
GlobalVariable property FPFP_Global_BreederChance_DLC04_Disciples Auto Mandatory
GlobalVariable property FPFP_Global_BreederChance_DLC04_Slaves Auto Mandatory

GlobalVariable property FPFP_Global_PregnantChance_BOS Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChance_COA Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChance_Gunner Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChance_Institute Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChance_Institute_Synth Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChance_MM Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChance_Raider Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChance_RR Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChance_Settler Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChance_Vault81 Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChance_DLC04_Pack Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChance_DLC04_Operators Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChance_DLC04_Disciples Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChance_DLC04_Slaves Auto Mandatory


GlobalVariable property FPFP_Global_PregnantChoice Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChoice_BOS Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChoice_COA Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChoice_Gunner Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChoice_Institute Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChoice_Institute_Synth Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChoice_MM Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChoice_Raider Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChoice_RR Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChoice_Settler Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChoice_Vault81 Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChoice_DLC04_Pack Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChoice_DLC04_Operators Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChoice_DLC04_Disciples Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChoice_DLC04_Slaves Auto Mandatory

GlobalVariable property FPFP_Global_Allow_Pregnancy_Companion Auto Mandatory
GlobalVariable property FPFP_Global_PregnantChoice_Companion Auto Mandatory
GlobalVariable property FPFP_Global_Allow_STDs_Companion Auto Mandatory
GlobalVariable property FPFP_Global_Allow_Breeder_Companion Auto Mandatory

;4.01
GlobalVariable property FPFP_Global_BirthingChoice Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_BOS Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_Companion Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_COA Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_Gunner Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_Institute Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_Institute_Synth Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_MM Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_Raider Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_RR Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_Settler Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_Vault81 Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_DLC04_Pack Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_DLC04_Operators Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_DLC04_Disciples Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_DLC04_Slaves Auto Mandatory
GlobalVariable property FPFP_Global_BlackTakeover Auto Mandatory
GlobalVariable property FPFP_Global_Vault81Takeover Auto Mandatory

GlobalVariable property FPFP_Global_FakeAV Auto Mandatory

GlobalVariable property FPFP_Global_RequirePipboy Auto Mandatory
GlobalVariable property FPFP_Global_PostPartum_Preg Auto Mandatory
GlobalVariable property FPFP_Global_AllowElder Auto Mandatory

;4.02
GlobalVariable property INVB_Global_Marriage_Total Auto Mandatory

;4.03

GlobalVariable property FPFP_Global_Allow_Pregnancy_Elderly Auto Mandatory
GlobalVariable property FPFP_Global_Allow_STDs_Elderly Auto Mandatory
GlobalVariable property FPFP_Global_Allow_Breeder_Elderly Auto Mandatory
GlobalVariable property FPFP_Global_Allow_Romance_Elderly Auto Mandatory


GlobalVariable property FPFP_Global_Allow_Pregnancy_Outcomes Auto Mandatory
GlobalVariable property FPFP_Global_Allow_Pregnancy_Outcomes_Elderly Auto Mandatory

GlobalVariable property FPFP_Global_Traits_Drugs Auto Mandatory
GlobalVariable property FPFP_Global_Traits_Gifts Auto Mandatory
GlobalVariable property FPFP_Global_Traits_Sexually Auto Mandatory

GlobalVariable property FPFP_Global_Deadbaby_Length Auto Mandatory
GlobalVariable property FPFP_Global_GiftSex_Chances Auto
GlobalVariable property FPFP_Global_GiftSex_Duration Auto
;4.05
GlobalVariable property FPFP_Global_Birth_Ghoul Auto Const
GlobalVariable property FPFP_Global_Birth_Human Auto Const
GlobalVariable property FPFP_Global_Birth_Human_BoS Auto Const
GlobalVariable property FPFP_Global_Birth_Human_Gunner Auto Const
GlobalVariable property FPFP_Global_Birth_Human_Raider Auto Const
GlobalVariable property FPFP_Global_Birth_Human_V81 Auto Const

GlobalVariable property FPFP_Global_Power_Advanced Auto Const Mandatory
GlobalVariable property FPFP_Global_Power_Adv_Mod Auto Const Mandatory

GlobalVariable property FPFP_Global_Existence Auto Mandatory
GlobalVariable property FPFP_Global_BodyType_CBBE_CF Auto Const Mandatory
GlobalVariable property FPFP_Global_BodyType_FG_CF Auto Const Mandatory
GlobalVariable property FPFP_Global_Cumflation_Male Auto Const Mandatory

GlobalVariable property FPFP_Global_Breeder_Viable Auto Const Mandatory
GlobalVariable property FPFP_Global_Breeder_Fertile Auto Const Mandatory
GlobalVariable property FPFP_Global_Breeder_Grow Auto Const Mandatory

GlobalVariable property FPFP_Global_Sterile Auto Const Mandatory

;4.06

GlobalVariable property FPFP_Global_Gift_Delay_Drug Auto Mandatory
GlobalVariable property FPFP_Global_Gift_Delay_Gift Auto Mandatory
GlobalVariable property FPFP_Global_Gift_Delay_Sex Auto Mandatory

;4.1
GlobalVariable property FPFP_Global_NonGrowingBaby Auto Mandatory
GlobalVariable property FPFP_Global_NonGrowingBaby_Player Auto Mandatory
GlobalVariable property FPFP_Global_NonGrowingBaby_BOS Auto Mandatory
GlobalVariable property FPFP_Global_NonGrowingBaby_Companion Auto Const Mandatory
GlobalVariable property FPFP_Global_NonGrowingBaby_COA Auto Mandatory
GlobalVariable property FPFP_Global_NonGrowingBaby_Gunner Auto Mandatory
GlobalVariable property FPFP_Global_NonGrowingBaby_Institute Auto Mandatory
GlobalVariable property FPFP_Global_NonGrowingBaby_Institute_Synth Auto Mandatory
GlobalVariable property FPFP_Global_NonGrowingBaby_MM Auto Mandatory
GlobalVariable property FPFP_Global_NonGrowingBaby_Raider Auto Mandatory
GlobalVariable property FPFP_Global_NonGrowingBaby_RR Auto Mandatory
GlobalVariable property FPFP_Global_NonGrowingBaby_Settler Auto Mandatory
GlobalVariable property FPFP_Global_NonGrowingBaby_Vault81 Auto Mandatory
GlobalVariable property FPFP_Global_NonGrowingBaby_DLC04_Pack Auto Mandatory
GlobalVariable property FPFP_Global_NonGrowingBaby_DLC04_Operators Auto Mandatory
GlobalVariable property FPFP_Global_NonGrowingBaby_DLC04_Disciples Auto Mandatory
GlobalVariable property FPFP_Global_NonGrowingBaby_DLC04_Slaves Auto Mandatory

GlobalVariable property FPFP_Global_Craving Auto Mandatory
GlobalVariable property FPFP_Global_Craving_Cycle Auto Mandatory
GlobalVariable property FPFP_Global_Craving_Chance Auto Mandatory
GlobalVariable property FPFP_Global_RandomMorphs Auto Const Mandatory
GlobalVariable property FPFP_Global_Craving_Message Auto Mandatory
GlobalVariable property FPFP_Global_Condom_Choice Auto Const Mandatory


GlobalVariable property FPFP_Global_PregnancyIssues Auto Const Mandatory
GlobalVariable property FPFP_Global_Traits Auto Const Mandatory
;4.2
GlobalVariable property FPFP_Global_PostPartum_NPC Auto Const Mandatory
GlobalVariable property FPFP_Global_Infect_Message Auto Const Mandatory

GlobalVariable property FPFP_Global_AddictionSex Auto Const Mandatory
GlobalVariable property FPFP_Global_AddictionSex_Length Auto Const Mandatory
GlobalVariable property FPFP_Global_AddictionSex_Chance Auto Const Mandatory
GlobalVariable property FPFP_Global_AddictionSex_Messages Auto Const Mandatory

GlobalVariable property FPFP_Global_Notif_Synth Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Ghoul Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Creature Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Pregnant Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Elderly Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_PostPartum Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Sterile Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Pipboy Auto Const Mandatory
GlobalVariable property FPFP_Global_Synth_Known Auto Const Mandatory


GlobalVariable property FPFP_Global_Notif_Debug_Sex Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Debug_Impregnation Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Debug_Pregnancy Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Debug_Birth Auto Const Mandatory


GlobalVariable property FPFP_Global_Notif_Debug_Breeder Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Debug_Pregnancy_Distr Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Debug_STDs Auto Const Mandatory
GlobalVariable property FPFP_Global_WaitTime_Breeder Auto Const Mandatory
GlobalVariable property FPFP_Global_WaitTime_Pregnancy Auto Const Mandatory
GlobalVariable property FPFP_Global_WaitTime_STDs Auto Const Mandatory

GlobalVariable property FPFP_Global_Allow_Traits Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_Traits_Companion Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_Traits_Faction Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_Traits_Elderly Auto Const Mandatory
GlobalVariable property FPFP_Global_WaitTime_Traits Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Debug_Traits Auto Const Mandatory


GlobalVariable property FPFP_Global_UndresswhenBirth Auto Const Mandatory
GlobalVariable property FPFP_Global_Debug_Bodymonth Auto Const Mandatory

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
	LoadSetting(FPFP_Global_Cumflation_Time, "fCumflation_time:Cumflation", 0.1, 2.0)
	LoadSetting(FPFP_Global_Cumflation_Time_Refresh, "fCumflation_time_Refresh:Cumflation", 10.0, 240.0)
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
	LoadSetting(INVB_Global_Marriage_AnimeIsekai, "fMarriage_AnimeIsekai:Marriage", 0.0, 2.0)
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
	LoadSetting(FPFP_Global_Total_Freeze, "fTotal_Freeze:Limits", 0.0, 4.0)
	LoadSetting(FPFP_Global_BirthLimit, "fBirthLimit:Limits", 0.0, 1.0)
	
	LoadSetting(INVB_Global_Marriage_Honeynoon, "fHoneynoon:Marriage", 0.0, 1.0)
	LoadSetting(INVB_Global_Marriage_Honeynoon_Duration, "fHoneynoon_Duration:Marriage", 0.0, 300.0)
	LoadSetting(INVB_Global_Marriage_Command_Duration, "fMarriageSex_Duration:Marriage", 0.0, 300.0)
	LoadSetting(INVB_Global_Marriage_Command_Chance, "fMarriageSex_Chances:Marriage", 1.0, 100.0)
	
	

	LoadSetting(FPFP_Global_Allow_ReRenaming, "fAllow_ReRenaming:Baby", 0.0, 1.0)
	
	
	
	LoadSetting(INVB_Global_MessageType_Roleplay, "fMessageRoleplay:Misc", 0.0, 5.0)
	LoadSetting(FPFP_Global_BodyType_CBBE, "fBodyType_CBBE:Misc", 0.0, 2.0)
	LoadSetting(FPFP_Global_BodyType_FG, "fBodyType_FG:Misc", 0.0, 2.0)
	LoadSetting(FPFP_Global_Creature_Faction, "fCreature_Faction:Creature", 0.0, 4.0)
	
	
	LoadSetting(FPFP_Global_Synth_hidden, "fSynthHidden:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_CreatureDNAOnce, "fCreature_DNA:Creature", 0.0, 1.0)
	
	LoadSetting(INVB_Global_Infect_Strength, "fInfect_Strength:Misc", 0.0, 2.0)
	
	LoadSetting(FPFP_Global_Viable, "fChance_Viable:Chances", 0.0, 100.0)
	
	LoadSetting(FPFP_Global_Viable_Renaming, "fChance_Viable_Renaming:Baby", 0.0, 2.0)
	
	

	LoadSetting(FPFP_Global_Monthly_MessageType, "fMonthNotif:Notifs", 0.0, 2.0)
	
	
	
	
	
	LoadSetting(FPFP_Global_Toggle_Creature_Chances, "fCreature_Chances_Toggle:Chances", 0.0, 1.0)
	LoadSetting(FPFP_Global_Length_Human, "fPregnancyLength_Human:Misc", 0.0, 20.0)
	LoadSetting(FPFP_Global_Morph_Human, "fMorph_Human:Misc", 0.0, 2.0)
	
	LoadSetting(FPFP_Global_Length_Ghoul, "fPregnancyLength_Ghoul:Misc", 0.0, 20.0)
	LoadSetting(FPFP_Global_Morph_Ghoul, "fMorph_Ghoul:Misc", 0.0, 2.0)	
	LoadSetting(FPFP_Global_Chance_Ghoul, "fChance_Ghoul:Chances", 0.0, 100.0)
	LoadSetting(FPFP_Global_Viable_Ghoul, "fChance_Viable_Ghoul:Chances", 0.0, 100.0)
	
	LoadSetting(FPFP_Global_Cumflation_FemaletoFemale, "fCumflation_FemaletoFemale:Cumflation", 0.0, 1.0)
	
	LoadSpecialSetting(FPFP_Global_BabyToChild_Ghoul, "fBabyToChild_Ghoul:Baby", 1.0, 60.0,"BabyToChild")
	LoadSpecialSetting(FPFP_Global_ChildToAdult_Ghoul, "fChildToAdult_Ghoul:Baby", 1.0, 180.0,"ChildToAdult")
	
	LoadSetting(FPFP_Global_PostPartum, "fPostPartum_Toggle:PostPartum", 0.0, 3.0)
	LoadSetting(FPFP_Global_PostPartum_Minimum, "fPostPartum_Minimum:PostPartum", 0.0, 5.0)
	LoadSetting(FPFP_Global_PostPartum_Power, "fPostPartum_Power:PostPartum", 0.0, 5.0)
	
	LoadSetting(FPFP_Internal_UpdateTime, "fTime_NPC:Misc", 1.0, 12.0)
	LoadSetting(FPFP_Internal_UpdateTime_Player, "fTime_Player:Misc", 1.0, 12.0)
	LoadSetting(FPFP_Internal_UpdateTime_Breeder, "fTime_Breeder:Preg_Perks", 0.0, 12.0)
	LoadSetting(FPFP_Internal_UpdateTime_PostPartum, "fTime_PostPartum:PostPartum", 1.0, 12.0)
	
	
	LoadSetting(FPFP_Global_Cumflation_Toggle_IVF, "fCumflation_toggle_IVF:Cumflation", 0.0, 1.0)
	
	
	LoadSetting(FPFP_Global_Morph_Human_Cumflation, "fMorph_Human_Cumflation:Cumflation", 0.0, 3.0)
	LoadSetting(FPFP_Global_Morph_Ghoul_Cumflation, "fMorph_Ghoul_Cumflation:Cumflation", 0.0, 3.0)
	
	
	LoadSetting(FPFP_Global_CSection_Chance, "fCSection_Chance:CSection", 1.0, 100.0)
	LoadSetting(FPFP_Global_CSection_MonthLimit, "fCSection_MonthLimit:CSection", 1.0, 12.0)
	LoadSetting(FPFP_Global_CSection_Alive, "fCSection_Alive:CSection", 0.0, 1.0)
	LoadSetting(FPFP_Global_CSection_Failure_Chance, "fCSection_Failure_Chance:CSection", 1.0, 100.0)
	
	
	LoadSetting(FPFP_Global_Counter_SexHuman, "fCounter_SexHuman:Counter", 1.0, 100.0)	
	LoadSetting(FPFP_Global_Counter_SexHuman_Player, "fCounter_SexHuman_Player:Counter", 1.0, 100.0)
	LoadSetting(FPFP_Global_Counter_SexGhoul, "fCounter_SexGhoul:Counter", 1.0, 100.0)
	LoadSetting(FPFP_Global_Counter_BirthHuman, "fCounter_BirthHuman:Counter", 1.0, 100.0)
	LoadSetting(FPFP_Global_Counter_BirthGhoul, "fCounter_BirthGhoul:Counter", 1.0, 100.0)
	LoadSetting(FPFP_Global_Counter_SafeSex, "fCounter_SafeSex:Counter", 1.0, 100.0)
	
	
	LoadSetting(FPFP_Global_ViableMonth, "fViableMonth:Misc", 0.0, 6.0)
	LoadSetting(FPFP_Global_ViableMonth_Chance, "fViableMonth_Chance:Misc", 1.0, 100.0)
	LoadSetting(FPFP_Global_ViableMonth_Perk, "fViableMonth_Perk:Misc", 0.0, 1.0)
	
	LoadSetting(FPFP_Global_Fertile_Toggle, "fFertile_Toggle:Chances", 0.0, 2.0)
	LoadSetting(FPFP_Global_Fertile_Length, "fFertile_Length:Chances", 0.0, 30.0)
	
	LoadSetting(FPFP_Global_Infertile_Toggle, "fInfertile_Toggle:Chances", 0.0, 2.0)
	LoadSetting(FPFP_Global_Infertile_Length, "fInfertile_Length:Chances", 0.0, 30.0)
	
	LoadSetting(FPFP_Global_LactationMonth, "fLactationMonth:Misc", 0.0, 6.0)
	LoadSetting(FPFP_Global_Chance_IVF, "fChanceIVF:Chances", 0.0, 100.0)
	LoadSetting(FPFP_Global_Counter_SexHuman_Player_Choice, "fCounter_SexHuman_Player_Choice:Counter", 0.0, 9.0)
	

	
	LoadSetting(FPFP_Global_Mothers_DNA, "fMothersDNA_chance:Baby", 0.0, 100.0)
	
	LoadSetting(FPFP_Global_PostPartum_Post, "fPostPartum_Infertile:PostPartum", 0.0, 1.0)
	
	LoadSetting(FPFP_Global_Power_Advanced, "fPower_Advanced:Misc", 0.0, 9.0)
	LoadSetting(FPFP_Global_Power_Adv_Mod, "fPower_Adv_Mod:Misc", 0.0, 3.0)
	
	LoadSetting(FPFP_Global_Allow_Breeder, "fAllow_Breeder:Misc", 0.0, 100.0)
	LoadSetting(FPFP_Global_Allow_Pregnancy, "fAllow_Pregnancy:Misc", 0.0, 100.0)
	LoadSetting(FPFP_Global_Allow_STDs, "fAllow_STDs:Misc", 0.0, 100.0)
	
	LoadSetting(FPFP_Global_Allow_Breeder_Companion, "fAllow_Breeder_Companion:Misc", 0.0, 100.0)
	LoadSetting(FPFP_Global_Allow_Pregnancy_Companion, "fAllow_Pregnancy_Companion:Misc", 0.0, 100.0)
	LoadSetting(FPFP_Global_Allow_STDs_Companion, "fAllow_STDs_Companion:Misc", 0.0, 100.0)
	
	LoadSetting(FPFP_Global_Allow_Breeder_Faction, "fAllow_Breeder_Faction:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_Allow_Pregnancy_Faction, "fAllow_Pregnancy_Faction:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_Allow_STDs_Faction, "fAllow_STDs_Faction:Misc", 0.0, 1.0)
	
	

	
	
	LoadSetting(FPFP_Global_STDChance_BOS, "fSTDChance_BOS:STDChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_STDChance_COA, "fSTDChance_COA:STDChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_STDChance_Gunner, "fSTDChance_Gunner:STDChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_STDChance_Institute, "fSTDChance_Institute:STDChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_STDChance_Institute_Synth, "fSTDChance_Institute_Synth:STDChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_STDChance_MM, "fSTDChance_MM:STDChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_STDChance_Raider, "fSTDChance_Raider:STDChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_STDChance_RR, "fSTDChance_RR:STDChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_STDChance_Settler, "fSTDChance_Settler:STDChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_STDChance_Vault81, "fSTDChance_Vault81:STDChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_STDChance_DLC04_Pack, "fSTDChance_DLC04_Pack:STDChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_STDChance_DLC04_Operators, "fSTDChance_DLC04_Operators:STDChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_STDChance_DLC04_Disciples, "fSTDChance_DLC04_Disciples:STDChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_STDChance_DLC04_Slaves, "fSTDChance_DLC04_Slaves:STDChance", 0.0, 100.0)
	
	
	
	LoadSetting(FPFP_Global_BreederChance_BOS, "fBreederChance_BOS:BreederChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_BreederChance_COA, "fBreederChance_COA:BreederChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_BreederChance_Gunner, "fBreederChance_Gunner:BreederChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_BreederChance_Institute, "fBreederChance_Institute:BreederChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_BreederChance_Institute_Synth, "fBreederChance_Institute_Synth:BreederChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_BreederChance_MM, "fBreederChance_MM:BreederChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_BreederChance_Raider, "fBreederChance_Raider:BreederChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_BreederChance_RR, "fBreederChance_RR:BreederChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_BreederChance_Settler, "fBreederChance_Settler:BreederChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_BreederChance_Vault81, "fBreederChance_Vault81:BreederChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_BreederChance_DLC04_Pack, "fBreederChance_DLC04_Pack:BreederChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_BreederChance_DLC04_Operators, "fBreederChance_DLC04_Operators:BreederChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_BreederChance_DLC04_Disciples, "fBreederChance_DLC04_Disciples:BreederChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_BreederChance_DLC04_Slaves, "fBreederChance_DLC04_Slaves:BreederChance", 0.0, 100.0)
	
	LoadSetting(FPFP_Global_PregnantChance_BOS, "fPregnantChance_BOS:PregnantChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_PregnantChance_COA, "fPregnantChance_COA:PregnantChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_PregnantChance_Gunner, "fPregnantChance_Gunner:PregnantChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_PregnantChance_Institute, "fPregnantChance_Institute:PregnantChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_PregnantChance_Institute_Synth, "fPregnantChance_Institute_Synth:PregnantChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_PregnantChance_MM, "fPregnantChance_MM:PregnantChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_PregnantChance_Raider, "fPregnantChance_Raider:PregnantChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_PregnantChance_RR, "fPregnantChance_RR:PregnantChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_PregnantChance_Settler, "fPregnantChance_Settler:PregnantChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_PregnantChance_Vault81, "fPregnantChance_Vault81:PregnantChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_PregnantChance_DLC04_Pack, "fPregnantChance_DLC04_Pack:PregnantChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_PregnantChance_DLC04_Operators, "fPregnantChance_DLC04_Operators:PregnantChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_PregnantChance_DLC04_Disciples, "fPregnantChance_DLC04_Disciples:PregnantChance", 0.0, 100.0)
	LoadSetting(FPFP_Global_PregnantChance_DLC04_Slaves, "fPregnantChance_DLC04_Slaves:PregnantChance", 0.0, 100.0)
	
	
	LoadSetting(FPFP_Global_PregnantChoice, "fPregnantChoice:PregnantChoice", 0.0, 5.0)
	LoadSetting(FPFP_Global_PregnantChoice_BOS, "fPregnantChoice_BOS:PregnantChoice", 0.0, 5.0)
	LoadSetting(FPFP_Global_PregnantChoice_COA, "fPregnantChoice_COA:PregnantChoice", 0.0, 5.0)
	LoadSetting(FPFP_Global_PregnantChoice_Gunner, "fPregnantChoice_Gunner:PregnantChoice", 0.0, 5.0)
	LoadSetting(FPFP_Global_PregnantChoice_Institute, "fPregnantChoice_Institute:PregnantChoice", 0.0, 5.0)
	LoadSetting(FPFP_Global_PregnantChoice_Institute_Synth, "fPregnantChoice_Institute_Synth:PregnantChoice", 0.0, 5.0)
	LoadSetting(FPFP_Global_PregnantChoice_MM, "fPregnantChoice_MM:PregnantChoice", 0.0, 5.0)
	LoadSetting(FPFP_Global_PregnantChoice_Raider, "fPregnantChoice_Raider:PregnantChoice", 0.0, 5.0)
	LoadSetting(FPFP_Global_PregnantChoice_RR, "fPregnantChoice_RR:PregnantChoice", 0.0, 5.0)
	LoadSetting(FPFP_Global_PregnantChoice_Settler, "fPregnantChoice_Settler:PregnantChoice", 0.0, 5.0)
	LoadSetting(FPFP_Global_PregnantChoice_Vault81, "fPregnantChoice_Vault81:PregnantChoice", 0.0, 5.0)
	LoadSetting(FPFP_Global_PregnantChoice_DLC04_Pack, "fPregnantChoice_DLC04_Pack:PregnantChoice", 0.0, 5.0)
	LoadSetting(FPFP_Global_PregnantChoice_DLC04_Operators, "fPregnantChoice_DLC04_Operators:PregnantChoice", 0.0, 5.0)
	LoadSetting(FPFP_Global_PregnantChoice_DLC04_Disciples, "fPregnantChoice_DLC04_Disciples:PregnantChoice", 0.0, 5.0)
	LoadSetting(FPFP_Global_PregnantChoice_DLC04_Slaves, "fPregnantChoice_DLC04_Slaves:PregnantChoice", 0.0, 5.0)
	LoadSetting(FPFP_Global_PregnantChoice_Companion, "fPregnantChoice_Companion:PregnantChoice", 0.0, 5.0)
	
	
	
	LoadSetting(FPFP_Global_BirthingChoice, "fBirthingChoice:BirthingChoice", 0.0, 10.0)
	LoadSetting(FPFP_Global_BirthingChoice_BOS, "fBirthingChoice_BOS:BirthingChoice", 0.0, 10.0)
	LoadSetting(FPFP_Global_BirthingChoice_COA, "fBirthingChoice_COA:BirthingChoice", 0.0, 10.0)
	LoadSetting(FPFP_Global_BirthingChoice_Gunner, "fBirthingChoice_Gunner:BirthingChoice", 0.0, 10.0)
	LoadSetting(FPFP_Global_BirthingChoice_Institute, "fBirthingChoice_Institute:BirthingChoice", 0.0, 10.0)
	LoadSetting(FPFP_Global_BirthingChoice_Institute_Synth, "fBirthingChoice_Institute_Synth:BirthingChoice", 0.0, 10.0)
	LoadSetting(FPFP_Global_BirthingChoice_MM, "fBirthingChoice_MM:BirthingChoice", 0.0, 10.0)
	LoadSetting(FPFP_Global_BirthingChoice_Raider, "fBirthingChoice_Raider:BirthingChoice", 0.0, 10.0)
	LoadSetting(FPFP_Global_BirthingChoice_RR, "fBirthingChoice_RR:BirthingChoice", 0.0, 10.0)
	LoadSetting(FPFP_Global_BirthingChoice_Settler, "fBirthingChoice_Settler:BirthingChoice", 0.0, 10.0)
	LoadSetting(FPFP_Global_BirthingChoice_Vault81, "fBirthingChoice_Vault81:BirthingChoice", 0.0, 10.0)
	LoadSetting(FPFP_Global_BirthingChoice_DLC04_Pack, "fBirthingChoice_DLC04_Pack:BirthingChoice", 0.0, 10.0)
	LoadSetting(FPFP_Global_BirthingChoice_DLC04_Operators, "fBirthingChoice_DLC04_Operators:BirthingChoice", 0.0, 10.0)
	LoadSetting(FPFP_Global_BirthingChoice_DLC04_Disciples, "fBirthingChoice_DLC04_Disciples:BirthingChoice", 0.0, 10.0)
	LoadSetting(FPFP_Global_BirthingChoice_DLC04_Slaves, "fBirthingChoice_DLC04_Slaves:BirthingChoice", 0.0, 10.0)
	LoadSetting(FPFP_Global_BirthingChoice_Companion, "fBirthingChoice_Companion:BirthingChoice", 0.0, 10.0)
	

	LoadSetting(FPFP_Global_BlackTakeover, "fTakeoverBlack:Takeover", 0.0, 100.0)
	LoadSetting(FPFP_Global_Vault81Takeover, "fTakeoverVault81:Takeover", 0.0, 100.0)
	
	LoadSetting(FPFP_Global_FakeAV, "fFakeAV:Misc", 0.0, 4.0)
	LoadSetting(FPFP_Global_RequirePipboy, "fRequirePipboy:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_AllowElder, "fAllowElder:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_PostPartum_Preg, "fPostPartum_Pregnant:PostPartum", 0.0, 1.0)
	
	LoadSetting(INVB_Global_Marriage_Total, "fMarriageSex_Total:Marriage", 30.0, 600.0)
	
	
	LoadSetting(FPFP_Global_Allow_Breeder_Elderly, "fAllow_Breeder_Elderly:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_Allow_Pregnancy_Elderly, "fAllow_Pregnancy_Elderly:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_Allow_STDs_Elderly, "fAllow_STDs_Elderly:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_Allow_Romance_Elderly, "fAllow_Romance_Elderly:Misc", 0.0, 1.0)
	
	
	LoadSetting(FPFP_Global_Allow_Pregnancy_Outcomes, "fBirthingOutcome:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_Allow_Pregnancy_Outcomes_Elderly, "fBirthingOutcome_Elderly:Misc", 0.0, 1.0)
	
	LoadSetting(FPFP_Global_Traits_Drugs, "fTraits_Drugs:Traits", 0.0, 1.0)
	LoadSetting(FPFP_Global_Traits_Gifts, "fTraits_Gifts:Traits", 0.0, 1.0)
	LoadSetting(FPFP_Global_Traits_Sexually, "fTraits_Sexually:Traits", 0.0, 3.0)
	
	LoadSetting(FPFP_Global_Deadbaby_Length, "fDeadbaby_Length:Chances", 0.0, 30.0)
	LoadSetting(FPFP_Global_GiftSex_Chances, "fGiftSex_Chances:Marriage", 0.0, 100.0)
	LoadSetting(FPFP_Global_GiftSex_Duration, "fGiftSex_Duration:Marriage", 0.0, 300.0)

	LoadSetting(FPFP_Global_Birth_Ghoul, "fBirth_Ghoul:Birth", 0.0, 2.0)
	LoadSetting(FPFP_Global_Birth_Human, "fBirth_Human:Birth", 0.0, 2.0)	
	
	LoadSetting(FPFP_Global_Birth_Human_BoS, "fBirth_Human_BoS:Birth", 0.0, 2.0)
	LoadSetting(FPFP_Global_Birth_Human_Gunner, "fBirth_Human_Gunner:Birth", 0.0, 2.0)
	LoadSetting(FPFP_Global_Birth_Human_Raider, "fBirth_Human_Raider:Birth", 0.0, 2.0)
	LoadSetting(FPFP_Global_Birth_Human_V81, "fBirth_Human_V81:Birth", 0.0, 2.0)
	
	LoadSetting(FPFP_Global_Existence, "fExistence_Toggle:Misc", 0.0, 1.0)
	
	LoadSetting(FPFP_Global_BodyType_CBBE_CF, "fBodyType_CBBE_CF:Cumflation", 0.0, 2.0)
	LoadSetting(FPFP_Global_BodyType_FG_CF, "fBodyType_FG_CF:Cumflation", 0.0, 2.0)
	LoadSetting(FPFP_Global_Cumflation_Male, "fCumflation_Male:Cumflation", 0.0, 1.0)
	
	
	LoadSetting(FPFP_Global_Breeder_Viable, "fBreeder_Viable:Breeder", 0.0, 10.0)
	LoadSetting(FPFP_Global_Breeder_Fertile, "fBreeder_Fertile:Breeder", 0.0, 1.0)
	LoadSetting(FPFP_Global_Breeder_Grow, "fBreeder_Grow:Breeder", 0.0, 1.0)
	LoadSetting(FPFP_Global_Sterile, "fSterile:Misc", 0.0, 1.0)
	
	
	LoadSetting(FPFP_Global_Gift_Delay_Drug, "fDelay_Drug:Marriage", 0.0, 48.0)
	LoadSetting(FPFP_Global_Gift_Delay_Gift, "fDelay_Gift:Marriage", 0.0, 48.0)
	LoadSetting(FPFP_Global_Gift_Delay_Sex, "fDelay_Sex:Marriage", 0.0, 48.0)
	
	
	LoadSetting(FPFP_Global_NonGrowingBaby, "fNonGrowingBaby:NonGrowingBaby", 0.0, 3.0)
	LoadSetting(FPFP_Global_NonGrowingBaby_Player, "fNonGrowingBaby_Player:NonGrowingBaby", 0.0, 3.0)
	LoadSetting(FPFP_Global_NonGrowingBaby_BOS, "fNonGrowingBaby_BOS:NonGrowingBaby", 0.0, 3.0)
	LoadSetting(FPFP_Global_NonGrowingBaby_COA, "fNonGrowingBaby_COA:NonGrowingBaby", 0.0, 3.0)
	LoadSetting(FPFP_Global_NonGrowingBaby_Gunner, "fNonGrowingBaby_Gunner:NonGrowingBaby", 0.0, 3.0)
	LoadSetting(FPFP_Global_NonGrowingBaby_Institute, "fNonGrowingBaby_Institute:NonGrowingBaby", 0.0, 3.0)
	LoadSetting(FPFP_Global_NonGrowingBaby_Institute_Synth, "fNonGrowingBaby_Institute_Synth:NonGrowingBaby", 0.0, 3.0)
	LoadSetting(FPFP_Global_NonGrowingBaby_MM, "fNonGrowingBaby_MM:NonGrowingBaby", 0.0, 3.0)
	LoadSetting(FPFP_Global_NonGrowingBaby_Raider, "fNonGrowingBaby_Raider:NonGrowingBaby", 0.0, 3.0)
	LoadSetting(FPFP_Global_NonGrowingBaby_RR, "fNonGrowingBaby_RR:NonGrowingBaby", 0.0, 3.0)
	LoadSetting(FPFP_Global_NonGrowingBaby_Settler, "fNonGrowingBaby_Settler:NonGrowingBaby", 0.0, 3.0)
	LoadSetting(FPFP_Global_NonGrowingBaby_Vault81, "fNonGrowingBaby_Vault81:NonGrowingBaby", 0.0, 3.0)
	LoadSetting(FPFP_Global_NonGrowingBaby_DLC04_Pack, "fNonGrowingBaby_DLC04_Pack:NonGrowingBaby", 0.0, 3.0)
	LoadSetting(FPFP_Global_NonGrowingBaby_DLC04_Operators, "fNonGrowingBaby_DLC04_Operators:NonGrowingBaby", 0.0, 3.0)
	LoadSetting(FPFP_Global_NonGrowingBaby_DLC04_Disciples, "fNonGrowingBaby_DLC04_Disciples:NonGrowingBaby", 0.0, 3.0)
	LoadSetting(FPFP_Global_NonGrowingBaby_DLC04_Slaves, "fNonGrowingBaby_DLC04_Slaves:NonGrowingBaby", 0.0, 3.0)
	LoadSetting(FPFP_Global_NonGrowingBaby_Companion, "fNonGrowingBaby_Companion:NonGrowingBaby", 0.0, 3.0)
	
	
	LoadSetting(FPFP_Global_Craving, "fCraving_Toggle:Craving", 0.0, 3.0)
	LoadSetting(FPFP_Global_Craving_Cycle, "fCraving_Cycle:Craving", 0.0, 1.0)
	LoadSetting(FPFP_Global_Craving_Message, "fCraving_Message:Craving", 0.0, 1.0)
	LoadSetting(FPFP_Global_Craving_Chance, "fCraving_Chances:Craving", 0.0, 100.0)
	
	
	LoadSetting(FPFP_Global_RandomMorphs, "fRandomMorphs:Misc", 0.0, 2.0)
	LoadSetting(FPFP_Global_Condom_Choice, "fCondom_Choice:Misc", 0.0, 8.0)
	
	
	LoadSetting(FPFP_Global_PregnancyIssues, "fPregnancyIssues:Misc", 0.0, 2.0)
	LoadSetting(FPFP_Global_Traits, "fTraits:Misc", 0.0, 2.0)
	
	LoadSetting(FPFP_Global_PostPartum_NPC, "fPostPartum_NPC:PostPartum", 0.0, 1.0)
	LoadSetting(FPFP_Global_Infect_Message, "fInfect_Message:Misc", 0.0, 2.0)
	
	LoadSetting(FPFP_Global_AddictionSex, "fAddictionSex_Toggle:Addict", 0.0, 2.0)
	LoadSetting(FPFP_Global_AddictionSex_Chance, "fAddictionSex_Chance:Addict", 0.0, 100.0)
	LoadSetting(FPFP_Global_AddictionSex_Length, "fAddictionSex_Length:Addict", 1.0, 10.0)
	LoadSetting(FPFP_Global_AddictionSex_Messages, "fAddictionSex_Messages:Addict", 0.0, 1.0)
	
	
	LoadSetting(FPFP_Global_Notif_Synth, "fNotif_Synth:Notifs", 0.0, 2.0)
	LoadSetting(FPFP_Global_Notif_Ghoul, "fNotif_Ghoul:Notifs", 0.0, 2.0)
	LoadSetting(FPFP_Global_Notif_Creature, "fNotif_Creature:Notifs", 0.0, 2.0)
	LoadSetting(FPFP_Global_Notif_Pregnant, "fNotif_Pregnant:Notifs", 0.0, 2.0)
	LoadSetting(FPFP_Global_Notif_Elderly, "fNotif_Elderly:Notifs", 0.0, 2.0)
	LoadSetting(FPFP_Global_Notif_PostPartum, "fNotif_PostPartum:Notifs", 0.0, 2.0)
	LoadSetting(FPFP_Global_Notif_Sterile, "fNotif_Sterile:Notifs", 0.0, 2.0)
	LoadSetting(FPFP_Global_Notif_Pipboy, "fNotif_Pipboy:Notifs", 0.0, 2.0)
	LoadSetting(FPFP_Global_Synth_Known, "fSynth_Known:Misc", 0.0, 2.0)


	LoadSetting(FPFP_Global_Notif_Debug_Sex, "fDebug_Sex:Notifs", 0.0, 2.0)
	LoadSetting(FPFP_Global_Notif_Debug_Impregnation, "fDebug_Impregnation:Notifs", 0.0, 2.0)
	LoadSetting(FPFP_Global_Notif_Debug_Pregnancy, "fDebug_Pregnancy:Notifs", 0.0, 2.0)
	LoadSetting(FPFP_Global_Notif_Debug_Birth, "fDebug_Birth:Notifs", 0.0, 2.0)

	LoadSetting(FPFP_Global_Notif_Debug_Breeder, "fDebug_Breeder:Notifs", 0.0, 2.0)
	LoadSetting(FPFP_Global_Notif_Debug_Pregnancy_Distr, "fDebug_Pregnancy_Distr:Notifs", 0.0, 2.0)
	LoadSetting(FPFP_Global_Notif_Debug_STDs, "fDebug_STDs:Notifs", 0.0, 2.0)

	LoadSetting(FPFP_Global_WaitTime_Breeder, "fWaitTime_Breeder:Misc", 0.0, 25.0)
	LoadSetting(FPFP_Global_WaitTime_Pregnancy, "fWaitTime_Pregnancy:Misc", 0.0, 25.0)
	LoadSetting(FPFP_Global_WaitTime_STDs, "fWaitTime_STDs:Misc", 0.0, 25.0)
	
	
	LoadSetting(FPFP_Global_Allow_Traits, "fAllow_Traits:Misc", 0.0, 100.0)
	LoadSetting(FPFP_Global_Allow_Traits_Companion, "fAllow_Traits_Companion:Misc", 0.0, 100.0)
	LoadSetting(FPFP_Global_Allow_Traits_Faction, "fAllow_Traits_Faction:Misc", 0.0, 1.0)
	
	LoadSetting(FPFP_Global_Allow_Traits_Elderly, "fAllow_Traits_Elderly:Misc", 0.0, 1.0)
	LoadSetting(FPFP_Global_Notif_Debug_Traits, "fDebug_Traits:Notifs", 0.0, 2.0)
	LoadSetting(FPFP_Global_WaitTime_Traits, "fWaitTime_Traits:Misc", 0.0, 25.0)
	LoadSetting(FPFP_Global_UndresswhenBirth, "fUndress:Misc", 0.0, 2.0)
	LoadSetting(FPFP_Global_Debug_Bodymonth, "fDebug_Bodymonth:Debugging", 0.0, 15.0)
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