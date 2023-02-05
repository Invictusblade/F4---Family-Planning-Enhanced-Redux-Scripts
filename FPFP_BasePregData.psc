Scriptname FPFP_BasePregData Extends ObjectReference

;Technical properties
Group TechnicalProperties
FPFP_Player_Script Property FPE Auto Const Mandatory
FPFP_BabyHandlerScript property FPFP_BabyHandler Auto Const Mandatory
Faction Property FPFP_Preggo Auto Const Mandatory
Keyword Property FPFP_Keyword Auto Const Mandatory
GlobalVariable property FPFP_Global_Day Auto Const Mandatory
GlobalVariable property FPFP_Global_Chance Auto Const Mandatory
GlobalVariable property FPFP_Global_Contra Auto Const Mandatory
GlobalVariable property FPFP_Global_NPCContra Auto Const Mandatory
GlobalVariable property FPFP_Global_Fertile Auto Const Mandatory
GlobalVariable property FPFP_Global_FertileEffects Auto Const Mandatory
GlobalVariable property FPFP_Global_POCNotif Auto Const Mandatory
GlobalVariable property FPFP_Global_CCNotif Auto Const Mandatory
GlobalVariable property FPFP_Global_CNotif Auto Const Mandatory
GlobalVariable property FPFP_Global_BNotif Auto Const Mandatory
GlobalVariable property FPFP_Global_FNotif Auto Const Mandatory
GlobalVariable property FPFP_Global_Power Auto Const Mandatory
GlobalVariable property FPFP_Global_PlayerImpregsOnly Auto Const Mandatory
GlobalVariable property FPFP_Global_FPregPlayerOnly Auto Const Mandatory
GlobalVariable property FPFP_Global_MPreg Auto Const Mandatory
GlobalVariable property FPFP_Global_MPregPlayerOnly Auto Const Mandatory
GlobalVariable property FPFP_Global_AllowNonNPC Auto Const Mandatory
GlobalVariable property FPFP_Global_FemaleToFemaleCum Auto Const Mandatory
GlobalVariable Property FPFP_Global_MultiChance Auto Const Mandatory
GlobalVariable Property FPFP_Global_MultiMax Auto Const Mandatory
GlobalVariable Property FPFP_Global_EquipNewCondom Auto Const Mandatory
GlobalVariable Property FPFP_Global_LastingMorphs Auto Const Mandatory
GlobalVariable Property FPFP_Global_NPCPlayerSexUseContraOption Auto Const Mandatory
GlobalVariable Property FPFP_Global_SynthImpreg Auto Const Mandatory
GlobalVariable property FPFP_Global_AllowFertileNPC Auto Const Mandatory
GlobalVariable property FPFP_Global_FertileNPC Auto Const Mandatory
GlobalVariable property FPFP_Global_Verbose Auto Const Mandatory
GlobalVariable property FPFP_Global_MaleBodyType Auto Const Mandatory
GlobalVariable property FPFP_Global_Impregnation_Notif Auto Const Mandatory
GlobalVariable property FPFP_Global_Impregnation_Notif_boolean Auto Const Mandatory
GlobalVariable property FPFP_Global_Perks_Monthly Auto Const Mandatory
GlobalVariable property FPFP_Global_Perks_Father Auto Const Mandatory
GlobalVariable property FPFP_Global_Perks_Harem Auto Const Mandatory
GlobalVariable property INVB_Global_RequireTags Auto Const Mandatory

Actor Property PlayerREF Auto Const Mandatory
Actor Property MQ101PlayerSpouseMale Auto Const Mandatory
Actor Property MQ101PlayerSpouseFemale Auto Const Mandatory
Potion property FPFP_Fertile Auto Const Mandatory
Potion property FPFP_Pill Auto Const Mandatory
MagicEffect property FPFP_ME_Pill auto const Mandatory
MagicEffect property FPFP_ME_Fertile auto const Mandatory
Keyword property ActorTypeNPC Auto Const Mandatory
Keyword property FPFP_HasData Auto Const Mandatory
String[] property TagsToWatch auto
FormList Property FPFP_ProhibitedKeywords Auto Const Mandatory
EndGroup

;Variable properties
Group VariableProperties
;four_play:Main Property four_play_event Auto 
AAF:AAF_API Property AAF_Events Auto
Actor Property Ourself Auto
{This property holds our NPC}
Float Property IncepDate = -1.0 Auto 
Bool Property IsPregnant Auto 
int Property NumChildren Auto 
Race Property FatherRace Auto 

Float Property OriginalThin Auto 
Float Property OriginalThicc Auto 
Float Property OriginalMuscular Auto 

Bool Property CanGetPreg auto

Bool Property FirstCheck Auto  ; Bool used to track that the next check will be our first check
Bool Property AffectedByMorphs Auto  ; Bool used to track that this character was affected by body morphs. prevents unnecessary morph reset calls

String[] Property OrigMorphNames Auto
Float[] Property OrigMorphValues Auto
EndGroup

Group WastelandDairyFramework
GlobalVariable Property INVB_Global_Preggo_Count_Player Auto Mandatory
GlobalVariable Property INVB_Global_Preggo_Count_Cuck Auto Mandatory
GlobalVariable Property INVB_Global_Preggo_Count_Current Auto Mandatory
GlobalVariable Property INVB_Global_Preggo_Count_Player_Babies Auto Mandatory
GlobalVariable Property FPFP_Global_MultiBirth Auto Mandatory
GlobalVariable property FPFP_Global_Cumflation_Toggle Auto Const Mandatory


Perk Property WLD_Perk_Impregnated_Player Auto
Perk Property WLD_Perk_Impregnated Auto
Perk Property WLD_Perk_Impregnated_5 Auto
Perk Property WLD_Perk_Impregnated_10 Auto
Perk Property WLD_Perk_Impregnated_15 Auto
Perk Property WLD_Perk_Impregnated_30 Auto
Perk Property WLD_Perk_Cuckold Auto
Perk Property WLD_Perk_Pregnancies_5 Auto
Perk[] Property WLD_Perk_Month Auto
Perk Property WLD_Perk_Pregnancy_Freezing Auto

EndGroup
;Startup handling

Group Creature
Float Property Creature_Morph Auto
Float Property Creature_Cycle Auto
bool Property Creature_Cycle_Multi Auto
Float Property Advanced_Start Auto
String Property Creature_String Auto
Potion Property Creature_Cum Auto
Perk Property Creature_Perk Auto
SPELL Property SP_Cumshot_Extra Auto
Actor Property TheFather Auto
EndGroup


Group Invictus_Globals

GlobalVariable property INVB_Global_MessagePlayer_sex Auto Const Mandatory
GlobalVariable property INVB_Global_MessagePlayer_Impreg Auto Const Mandatory

GlobalVariable property INVB_Global_Female_Player_Dominant Auto Const Mandatory
GlobalVariable property INVB_Global_Male_Player_Dominant Auto Const Mandatory
GlobalVariable property FPFP_Global_MaleToMaleCum Auto Const Mandatory

GlobalVariable property INVB_Global_Infect Auto Const Mandatory

GlobalVariable property INVB_Global_Birth_Death_Chance Auto Const Mandatory
GlobalVariable property INVB_Global_Racial_Baby_Chance Auto Const Mandatory



GlobalVariable property FPFP_Global_Chance_Player_M Auto Const Mandatory
GlobalVariable property FPFP_Global_Chance_Player_F Auto Const Mandatory
GlobalVariable Property FPFP_Global_MultiBirth_Modifier Auto Mandatory


GlobalVariable property FPFP_Global_Total_Births Auto Const Mandatory
GlobalVariable property FPFP_Global_Total_Births_Player Auto Const Mandatory
GlobalVariable property FPFP_Global_Current_Births Auto Const Mandatory
GlobalVariable property FPFP_Global_Current_Births_Player Auto Const Mandatory
GlobalVariable property FPFP_Global_Total_Freeze Auto Const Mandatory
GlobalVariable property FPFP_Global_BirthLimit Auto Const Mandatory


GlobalVariable property FPFP_Global_Toggle_Creature_Chances Auto Const Mandatory
GlobalVariable property FPFP_Global_Length_Human Auto Const Mandatory
GlobalVariable property FPFP_Global_Morph_Human Auto Const Mandatory
GlobalVariable property FPFP_Global_Chance_Ghoul Auto Const Mandatory
GlobalVariable property FPFP_Global_Length_Ghoul Auto Const Mandatory
GlobalVariable property FPFP_Global_Morph_Ghoul Auto Const Mandatory


GlobalVariable property FPFP_Global_Cumflation_FemaletoFemale Auto Const Mandatory

GlobalVariable property FPFP_Global_BodyType_CBBE Auto Const Mandatory
GlobalVariable property FPFP_Global_BodyType_FG Auto Const Mandatory

GlobalVariable Property FPFP_Global_Synth_hidden Auto Const Mandatory
GlobalVariable Property FPFP_Global_CreatureDNAOnce Auto Const Mandatory
GlobalVariable property FPFP_Global_Creature_Faction Auto Const Mandatory

EndGroup

Group Invictus_Quests
FPE_Messages Property FPFP_Messages Auto Const Mandatory
FPE_Cumflation Property FPFP_Cumflation Auto Const Mandatory
FPE_STD Property FPFP_STD Auto Const Mandatory
FPE_Surrogate Property FPFP_Surrogate Auto Const Mandatory
EndGroup

Group Effects
GlobalVariable Property FPFP_Global_Cumshot Auto Mandatory
SPELL Property SP_Cumshot Auto
GlobalVariable property FPFP_Global_BloodyBirth Auto Const Mandatory
SPELL Property SP_BloodyBirth Auto
EndGroup




Perk Property WLD_Perk_Romance_Relationship Auto Const
Perk Property WLD_Perk_Romance_Serious Auto Const
Perk Property WLD_Perk_Romance_Hatred Auto Const










Keyword Property fpfp_noDaddy Auto
Keyword Property fpfp_Father Auto
String[] Tags
FPFP_BabyTypeAddon[] AddonBabyTypes
Float Random_Morph = 1.000
Armor property Pipboy auto const Mandatory
Race Property HumanRace Auto 
Race Property GhoulRace Auto 
Faction Creature_Faction
Faction Creature_Faction_Friendly
Perk Property WLD_Perk_Pheromones Auto


Keyword Property fpfp_DNATransfer Auto
Perk Property WLD_Perk_Breeder Auto
GlobalVariable property FPFP_Global_Monthly_MessageType Auto Const Mandatory
int Breeder_mod



Group PostPartum
Bool Property IsPostPartum Auto 
Float Property BirthDate = -1.0 Auto 
GlobalVariable property FPFP_Global_PostPartum Auto Const Mandatory 
GlobalVariable property FPFP_Global_PostPartum_Power Auto Const Mandatory 
GlobalVariable property FPFP_Global_PostPartum_Minimum Auto Const Mandatory 
GlobalVariable property FPFP_Global_PostPartum_Time Auto Const Mandatory 
Perk Property WLD_Perk_PostPartum Auto
GlobalVariable property FPFP_Global_PostPartum_NPC Auto Const Mandatory
GlobalVariable property FPFP_Global_PostPartum_Post Auto Const Mandatory
EndGroup


Group Cumflation
SPELL Property SP_Cumflation_Low Auto Const
SPELL Property SP_Cumflation_Med Auto Const
SPELL Property SP_Cumflation_High Auto Const
EndGroup

bool bool_viable



Group Viable
FPE_ActorValuePerker Property FPFP_ActorValuePerker Auto Const Mandatory
GlobalVariable property FPFP_Global_ViableMonth Auto Const Mandatory
GlobalVariable property FPFP_Global_ViableMonth_Chance Auto Const Mandatory
GlobalVariable property FPFP_Global_ViableMonth_Perk Auto Const Mandatory

Perk Property Medic01 Auto Const Mandatory
Perk Property Medic02 Auto Const Mandatory
Perk Property Medic03 Auto Const Mandatory
Perk Property Medic04 Auto Const Mandatory
EndGroup


Group Fertile
Perk Property WLD_Perk_Fertile Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Both Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Female Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Male Auto Const Mandatory
GlobalVariable property FPFP_Global_Fertile_Toggle auto Const
GlobalVariable property FPFP_Global_LactationMonth Auto Const Mandatory
Perk Property WLD_Perk_Infertile Auto Const Mandatory
Perk Property WLD_Perk_Normal Auto Const Mandatory
SPELL property SP_Infertile Auto Const
EndGroup

GlobalVariable property FPFP_Global_Mothers_DNA Auto Const Mandatory


FPE_NonGrowingBaby Property FPFP_NonGrowingBaby Auto Const Mandatory

Perk Property WLD_Perk_Birth_Nothing Auto Const Mandatory
Perk Property WLD_Perk_Birth_PoorLifestyle Auto Const Mandatory
Perk Property WLD_Perk_Birth_Stillborn Auto Const Mandatory


Keyword Property AnimArchetypeElderly Auto
Keyword Property kw_Elderly Auto
GlobalVariable property FPFP_Global_RequirePipboy Auto Mandatory
GlobalVariable property FPFP_Global_PostPartum_Preg Auto Mandatory
GlobalVariable property FPFP_Global_AllowElder Auto Mandatory


ActorValue Property FPFP_AV_Romance_Sex Auto Const
ActorValue Property FPFP_AV_Romance_Sex_Reveal Auto Const
GlobalVariable property INVB_Global_Marriage_Total Auto Mandatory
ActorValue Property FPFP_AV_Romance_Total Auto Const

FPE_Interests Property FPFP_Interests Auto Const Mandatory

Perk Property WLD_Perk_Married Auto

Perk Property WLD_Perk_Sterile Auto


Perk Property WLD_Perk_Cheater Auto
GlobalVariable property INVB_Global_Marriage_Polygamy Auto
GlobalVariable property FPFP_Global_Power_Advanced Auto Const Mandatory
GlobalVariable property FPFP_Global_Power_Adv_Mod Auto Const Mandatory


GlobalVariable property FPFP_Global_Breeder_Fertile Auto Const Mandatory
GlobalVariable property FPFP_Global_Breeder_Grow Auto Const Mandatory
GlobalVariable property FPFP_Global_Sterile Auto Const Mandatory

Perk Property WLD_Perk_Birth_Nothing_Phantom Auto Const Mandatory
Perk Property WLD_Perk_Birth_Nothing_Infanticide Auto Const Mandatory
Perk Property WLD_Perk_Birth_Nothing_Mutated Auto Const Mandatory


ActorValue Property FPFP_AV_RandomnessIndex Auto Const
GlobalVariable property FPFP_Global_RandomMorphs Auto Const Mandatory
float ActorValue_RandomnessIndex

Keyword Property fpfp_PregnancyIssue Auto
Keyword Property fpfp_Traits Auto

GlobalVariable property FPFP_Global_SexAddiction Auto Const Mandatory
SPELL property SP_Sex_Outcome Auto Const


Perk Property WLD_Perk_Synth_Known Auto Const Mandatory
Perk Property WLD_Perk_Synth_Unknown Auto Const Mandatory
GlobalVariable property FPFP_Global_Synth_Known Auto Const Mandatory

GlobalVariable property FPFP_Global_Notif_Synth Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Ghoul Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Creature Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Pregnant Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Elderly Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_PostPartum Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Sterile Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Pipboy Auto Const Mandatory

GlobalVariable property FPFP_Global_Notif_Debug_Sex Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Debug_Impregnation Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Debug_Pregnancy Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Debug_Birth Auto Const Mandatory

float currentMonth_PP

SPELL Property SP_Faction_Sorter_Traits Auto

Potion FullCondom
Group Condoms

GlobalVariable property FPFP_Global_Condom_Choice Auto Const Mandatory
GlobalVariable property FPFP_Global_CondomOutcome Auto Const Mandatory
Armor property FPFP_Condom auto const Mandatory
Armor property FPFP_Condom_Matte auto const Mandatory
Armor property FPFP_Condom_Glow auto const Mandatory
Armor property FPFP_Condom_Viagra auto const Mandatory
Armor property FPFP_Condom_Viagra_Matte auto const Mandatory
Armor property FPFP_Condom_Viagra_Glow auto const Mandatory
Armor property FPFP_Condom_Empty auto const Mandatory
Armor property FPFP_Condom_Viagra_Empty auto const Mandatory
String[] property Condom_Message auto
EndGroup

Perk Property WLD_Perk_Viable Auto

GlobalVariable property FPFP_Global_PostBirth Auto Const Mandatory
GlobalVariable property FPFP_Global_UndresswhenBirth Auto Const Mandatory

ActorValue Property FPFP_AV_PregnancyStage Auto Const
float ActorValue_PregnancyStage

ActorValue Property FPFP_AV_RemainingPregnancy Auto Const

GlobalVariable property FPFP_Global_FuckifIKnow Auto Const Mandatory


Function Initialize(Actor akTarget) ; Make sure player's version of this is DIFFERENT
	akTarget.AddKeyword(FPFP_HasData)
	Ourself = akTarget
	FPE.AddToDataList(self)
	RegisterForCustomEvent(FPE, "DoUpdate")
	RegisterForCustomEvent(FPE, "DoCleaning")
	RegisterForCustomEvent(FPE, "DoReset")
	RegisterForCustomEvent(FPE, "SendBasePreg")
	RegisterForCustomEvent(FPE, "DebugDataDump")
	RegisterForRemoteEvent(Ourself, "OnUnload")
	RegisterForRemoteEvent(Ourself, "OnDying")
	LoadFP()
	
	TryForFertility()
	
	AddonBabyTypes = new FPFP_BabyTypeAddon[0]
	StartTimer(180)
	Trace("We have initialized!")
EndFunction

Function LoadFP()
	Trace("LoadFP")
	Quest Main = Game.GetFormFromFile(0x01000F99, "AAF.esm") as quest
	If Main
		AAF_Events = Main as AAF:AAF_API
		RegisterForCustomEvent(AAF_Events, "OnAnimationStart")
		RegisterForCustomEvent(AAF_Events, "OnAnimationStop")
		RegisterForCustomEvent(AAF_Events, "OnAnimationChange")
	Else
		utility.wait(0.1)
	Endif
EndFunction

Event OnTimer(int aiTID)
	Self.Trace("Checking to see if our NPC is still existant", False)
	If (!Ourself || Ourself.IsDeleted())
		
	EndIf
EndEvent

;Gameplay handling

Function TryForFertility()

	If FPFP_Global_Fertile_Toggle.GetValue() > 0
		if !Ourself.IsInFaction(FPFP_Preggo)
			If FPFP_Global_AllowFertileNPC.GetValue() == 1.0
				If Utility.RandomFloat(0,100) <= (FPFP_Global_Fertile.getValue() * FPFP_Global_FertileNPC.GetValue()) && !Ourself.HasMagicEffect(FPFP_ME_Fertile) && !Ourself.HasPerk(WLD_Perk_Fertile) && !Ourself.HasPerk(WLD_Perk_Fertile_Both) && !Ourself.HasPerk(WLD_Perk_Fertile_Female) && !Ourself.HasPerk(WLD_Perk_Fertile_Male) && !Ourself.HasPerk(WLD_Perk_Infertile) && !Ourself.HasPerk(WLD_Perk_Normal) && !Ourself.HasPerk(WLD_Perk_Sterile)
					MakeFertile() 
				Endif
			EndIf
		EndIf	
	EndIf
	
EndFunction

Function MakeFertile()
	Trace(ourself.GetActorBase().GetName() + " is fertile!", true)
	Ourself.EquipItem(FPFP_Fertile, abSilent = True) 
EndFunction

Bool Function IsActorInVarArray(Actor akActor, Var[] akArgs)
	int i = 0
	While i < akArgs.Length
		If akArgs[i] as Actor == akActor
			Return true
		EndIf
		i += 1
	EndWhile
	
	return false
EndFunction

Function CheckWatchedTags(String[] Tag)
	; if we already had a potential fertilization we're done
	If (CanGetPreg == true)
		Return
	EndIf

	Int i = 0
	While (i < Tag.length)
		If TagsToWatch.Find(Tag[i]) >= 0
			Trace("Watched tag " + Tag[i] + " found")
			Return
		Endif
		i += 1
	EndWhile
	
	Trace("Animation OK for pregnancy")
	CanGetPreg = true
EndFunction

Event AAF:AAF_API.OnAnimationStart(AAF:AAF_API akSender, Var[] akArgs)

	if (akArgs[0] as int) != 0
		Trace(akArgs[1] as string)
		return
	endif
	
	Var[] acs = Utility.VarToVarArray(akArgs[1])

	If !IsActorInVarArray(Ourself, acs)
		;Trace("OnAnimationStart was not for us")
		return
	EndIf
	Trace("OnAnimationStart")
	
	CanGetPreg = False
	Tags = Utility.VarToVarArray(akArgs[3]) as String[]
	CheckWatchedTags(Tags)

	;If IsActorInVarArray(Ourself ,akArgs) && IsActorInVarArray(PlayerREF ,akArgs) 
	; Only run this code if we are handling an NPC and the Player was involved in the animation
	If Ourself != PlayerREF && IsActorInVarArray(PlayerREF ,acs) 

		If FPFP_Global_NPCPlayerSexUseContraOption.GetValue() == 1.0 || (Utility.RandomInt(0,99) < FPFP_Global_NPCContra.getValueint()) ; If we're always supposed to use contraception OR if we pass our "NPC uses contraception" chance check
			
			If IsValidWoman(Ourself) && Ourself.GetItemCount(FPFP_Pill) > 0 && !Ourself.HasMagicEffect(FPFP_ME_Pill); handle pill
				Ourself.EquipItem(FPFP_Pill)
			EndIf
			
			If Ourself.GetItemCount(FPFP_Condom) > 0 && !(Ourself.IsEquipped(FPFP_Condom)); handle condom
				Ourself.EquipItem(FPFP_Condom)
			EndIf
			
		EndIf
	
	EndIf
	
	if Ourself.IsEquipped(FPFP_Condom)
		if FPFP_Global_Condom_Choice.GetValue() >= 1.0 ;Both NonViagra
			if FPFP_Global_Condom_Choice.GetValue() == 1.0 ;Both NonViagra
				If Utility.RandomInt(0,1) == 0
					Ourself.EquipItem(FPFP_Condom_Glow, true, true)
				else
					Ourself.EquipItem(FPFP_Condom_Matte, true, true)
				endIf	
			elseif FPFP_Global_Condom_Choice.GetValue() == 2.0 ;Glow NonViagra
				Ourself.EquipItem(FPFP_Condom_Glow, true, true)
			elseif FPFP_Global_Condom_Choice.GetValue() == 3.0 ;Matte NonViagra
				Ourself.EquipItem(FPFP_Condom_Matte, true, true)
			elseif FPFP_Global_Condom_Choice.GetValue() == 4.0 ;Both Viagra
				If Utility.RandomInt(0,1) == 0
					Ourself.EquipItem(FPFP_Condom_Viagra_Glow, true, true)
				else
					Ourself.EquipItem(FPFP_Condom_Viagra_Matte, true, true)
				endIf	
			elseif FPFP_Global_Condom_Choice.GetValue() == 5.0 ;Glow Viagra
				Ourself.EquipItem(FPFP_Condom_Viagra_Glow, true, true)
			elseif FPFP_Global_Condom_Choice.GetValue() == 6.0 ;Matte Viagra
				Ourself.EquipItem(FPFP_Condom_Viagra_Matte, true, true)
			elseif FPFP_Global_Condom_Choice.GetValue() == 7.0 ;Empty
				Ourself.EquipItem(FPFP_Condom_Empty, true, true)
			elseif FPFP_Global_Condom_Choice.GetValue() == 8.0 ;Empty Viagra
				Ourself.EquipItem(FPFP_Condom_Viagra_Empty, true, true)
			endIf
	
			int random_Message = Utility.RandomInt(0, Condom_Message.Length-1)
			Debug.notification(Ourself.GetLeveledActorBase().GetName() +" "+ Condom_Message[random_Message])
		endif
	endIf
EndEvent

Event AAF:AAF_API.OnAnimationChange(AAF:AAF_API akSender, Var[] akArgs)
	If (akArgs[0] as int) != 0
		Trace(akArgs[1] as string)
		return
	EndIf

	Var[] acs = Utility.VarToVarArray(akArgs[1])
	
	If !IsActorInVarArray(Ourself, acs)
		;Trace("OnAnimationChange was not for us")
		return
	EndIf
	Trace("OnAnimationChange")
	
	Tags = Utility.VarToVarArray(akArgs[3]) as String[]
	CheckWatchedTags(Tags)
	
	if (INVB_Global_MessagePlayer_sex.GetValue() == 1 || INVB_Global_MessagePlayer_sex.GetValue() == 2) && (Ourself == PlayerREF || acs[1] as actor == PlayerREF)
		FPFP_Messages.Sex_Movement(Ourself, acs[1] as actor)
	elseif INVB_Global_MessagePlayer_sex.GetValue() == 2
		FPFP_Messages.Sex_Movement(Ourself, acs[1] as actor)
	endif
	
EndEvent

Event AAF:AAF_API.OnAnimationStop(AAF:AAF_API akSender, Var[] akArgs)
	
	if (akArgs[0] as int) != 0
		Trace(akArgs[1] as string)
		return
	endif
	
	Var[] acs = Utility.VarToVarArray(akArgs[1])

	; First checks for a fail early state of not being valid for pregnancy
	If acs == NONE || acs.length < 2 || !IsActorInVarArray(Ourself ,acs) || !IsValidWoman(Ourself)
		;Trace("OnAnimationStop - too few actors OR not for us OR not valid woman, quitting")
		return
	EndIf
	Trace("OnAnimationStop")
	
	; Check animation tags - note we do not need to run CheckWatchedTags() again here
	
	If CanGetPreg == False && INVB_Global_RequireTags.GetValue() == 1
		Trace("Animation tags not appropriate, quitting")
		Return
	Endif
	
	; Check prohibited keywords
	If Ourself.HasKeywordInFormList(FPFP_ProhibitedKeywords) && INVB_Global_RequireTags.GetValue() == 1
		Trace("Actor is prohibited by keyword, quitting")
		Return
	Endif
	
	; Now checks animation arguments to see if we were a part of sex, and if we were the one's who were came into.
	Actor Potential0 ; This is to store one of the two potential daddies in a threesome
	Actor Potential1
	Actor ActorCummedIn ; This stores the person cummed in, but not necessarily us in the pregnancy.
	Actor Man ; This variable stores the person who can be responsible for a pregnancy.
	
	; Determine who got cum inside of them
	;If akArgs[2] is Actor ; Threesome
	If acs.Length > 2 && acs[2] is Actor ; Threesome
		ActorCummedIn = acs[0] as Actor
		Potential0 = acs[1] as Actor
		Potential1 = acs[2] as Actor
	elseIf acs.Length > 2 && acs[2] is Actor && (acs[0] as Actor) == PlayerREF && (PlayerREF.GetLeveledActorBase().GetSex() == 0 && INVB_Global_Male_Player_Dominant.GetValue() == 1 || INVB_Global_Female_Player_Dominant.GetValue() == 1 && PlayerREF.GetLeveledActorBase().GetSex() == 1)
		If Utility.RandomInt(0,1) == 0 ; Play heads or tails to find out which person came inside of you
			ActorCummedIn = acs[1] as Actor
			Potential1 = acs[2] as Actor
		Else
			ActorCummedIn = acs[2] as Actor
			Potential1 = acs[1] as Actor
		EndIf
		Potential0 = acs[0] as Actor
	Else ; Typical sex
		ActorCummedIn = acs[0] as Actor
		Potential0 = acs[1] as Actor
		if ActorCummedIn == PlayerREF && (ActorCummedIn.GetLeveledActorBase().GetSex() == 0 && Potential0.GetLeveledActorBase().GetSex() == 0 && INVB_Global_Male_Player_Dominant.GetValue() == 1) || (INVB_Global_Female_Player_Dominant.GetValue() == 1 && ActorCummedIn.GetLeveledActorBase().GetSex() == 1 && Potential0.GetLeveledActorBase().GetSex() == 1) ; Typical sex
			ActorCummedIn = acs[1] as Actor
			Potential0 = acs[0] as Actor
		Elseif Potential0 == PlayerREF && (ActorCummedIn.GetLeveledActorBase().GetSex() == 0 && Potential0.GetLeveledActorBase().GetSex() == 0 && INVB_Global_Male_Player_Dominant.GetValue() == 1) || (INVB_Global_Female_Player_Dominant.GetValue() == 1 && ActorCummedIn.GetLeveledActorBase().GetSex() == 1 && Potential0.GetLeveledActorBase().GetSex() == 1) ; Typical sex
			ActorCummedIn = acs[0] as Actor
			Potential0 = acs[1] as Actor 
		endIf
	EndIf
	
	if FPFP_Global_Notif_Debug_Sex.GetValue() >= 1
		debug.trace("ActorCummedIn is "+ActorCummedIn.GetLeveledActorBase().GetName() +"("+ActorCummedIn+")")
		If Potential0
			debug.trace("Potential0 is "+Potential0.GetLeveledActorBase().GetName() +"("+Potential0+")")
		endIf
		If Potential1
			debug.trace("Potential1 is "+Potential1.GetLeveledActorBase().GetName() +"("+Potential1+")")
		endIf
	endIf
	
	if FPFP_Global_Notif_Debug_Sex.GetValue() == 2
		debug.notification("ActorCummedIn is "+ActorCummedIn.GetLeveledActorBase().GetName() +"("+ActorCummedIn+")")
		If Potential0
			debug.notification("Potential0 is "+Potential0.GetLeveledActorBase().GetName() +"("+Potential0+")")
		endIf
		If Potential1
			debug.notification("Potential1 is "+Potential1.GetLeveledActorBase().GetName() +"("+Potential1+")")
		endIf
	endIf
	
	If ActorCummedIn != Ourself
		;Trace("Our sex actor cummed into wasn't us, end this thread early")
		return
	EndIf
	
	;Check our potential men
	
	;Trace("Checking potentials")
	Potential0 = DeterminePotentialMan(Potential0)
	
	Potential1 = DeterminePotentialMan(Potential1)
	
	;Trace("Potentials checked, here's the results: " + Potential0 + " and " + Potential1 )
	
	int Sex0 = -2 ; For clarity: -2 will be the number to check if Potential doesn't exist.
	
	int Sex1 = -2
	
	int Sex2 = -2
	
	If ActorCummedIn ; If we have a first actor, set Sex1 equal to their sex
		Sex0 = ActorCummedIn.GetLeveledActorBase().GetSex()
	EndIf

	If Potential0 ; If we have a first actor, set Sex1 equal to their sex
		Sex1 = Potential0.GetLeveledActorBase().GetSex()
	EndIf
	
	If Potential1 ; If we have a second actor, set Sex2 equal to their sex
		Sex2 = Potential1.GetLeveledActorBase().GetSex()
	EndIf
			
	if (INVB_Global_MessagePlayer_sex.GetValue() == 1 || INVB_Global_MessagePlayer_sex.GetValue() == 2) && (ActorCummedIn == PlayerREF || Potential0 == PlayerREF)
		FPFP_Messages.Sex_Message(ActorCummedIn, Potential0)
	elseif INVB_Global_MessagePlayer_sex.GetValue() == 2
		FPFP_Messages.Sex_Message(ActorCummedIn, Potential0)
	elseif INVB_Global_MessagePlayer_sex.GetValue() == 0
	endif
	
	If !ActorCummedIn.HasKeyword(fpfp_Traits) && (ActorCummedIn != PlayerREF && Potential0 == PlayerREF)
		ActorCummedIn.AddSpell(SP_Faction_Sorter_Traits, false)
		Utility.Wait(2)
		ActorCummedIn.RemoveSpell(SP_Faction_Sorter_Traits)
	elseIf !Potential0.HasKeyword(fpfp_Traits) && (Potential0 != PlayerREF && ActorCummedIn == PlayerREF)
		Potential0.AddSpell(SP_Faction_Sorter_Traits, false)
		Utility.Wait(2)
		Potential0.RemoveSpell(SP_Faction_Sorter_Traits)
	endIf

	if ActorCummedIn.GetValue(FPFP_AV_Romance_Total) == 0 && ActorCummedIn != PlayerREF
		int Random_Total = (Utility.RandomInt(INVB_Global_Marriage_Total.GetValue() as int / 10, INVB_Global_Marriage_Total.GetValue() as int / 5))
		ActorCummedIn.SetValue(FPFP_AV_Romance_Total, Random_Total)
	elseif Potential0.GetValue(FPFP_AV_Romance_Total) == 0 && Potential0 != PlayerREF
		int Random_Total = (Utility.RandomInt(INVB_Global_Marriage_Total.GetValue() as int / 10, INVB_Global_Marriage_Total.GetValue() as int / 5))
		Potential0.SetValue(FPFP_AV_Romance_Total, Random_Total)
	endif

	if INVB_Global_Marriage_Polygamy.GetValue() == 0
	
		If Potential1	
			if ActorCummedIn.HasPerk(WLD_Perk_Married) && !Potential0.HasPerk(WLD_Perk_Married) && !Potential1.HasPerk(WLD_Perk_Married)
				ActorCummedIn.addPerk(WLD_Perk_Cheater)
			elseIf !ActorCummedIn.HasPerk(WLD_Perk_Married) && Potential0.HasPerk(WLD_Perk_Married) && !Potential1.HasPerk(WLD_Perk_Married)
				Potential0.addPerk(WLD_Perk_Cheater)
			elseIf !ActorCummedIn.HasPerk(WLD_Perk_Married) && !Potential0.HasPerk(WLD_Perk_Married) && Potential1.HasPerk(WLD_Perk_Married)
				Potential1.addPerk(WLD_Perk_Cheater)
			endif
		elseIf Potential0
			if ActorCummedIn.HasPerk(WLD_Perk_Married) && !Potential0.HasPerk(WLD_Perk_Married)
				ActorCummedIn.addPerk(WLD_Perk_Cheater)
			elseIf !ActorCummedIn.HasPerk(WLD_Perk_Married) && Potential0.HasPerk(WLD_Perk_Married)
				Potential0.addPerk(WLD_Perk_Cheater)
			endif
		endIf
	endIf
	
	if ActorCummedIn == PlayerREF
		if Potential0.GetValue(FPFP_AV_Romance_Sex_Reveal) == 0
			Potential0.SetValue(FPFP_AV_Romance_Sex_Reveal, Utility.RandomInt(1, Potential0.GetValue(FPFP_AV_Romance_Total) as int /10))
		endIf
		float GiftAmount = Potential0.GetValue(FPFP_AV_Romance_Sex) + Utility.RandomInt(1, 10)
		
		if Potential0.HasPerk(WLD_Perk_Romance_Hatred)
			GiftAmount *= 0
		elseIf Potential0.HasPerk(WLD_Perk_Romance_Relationship)
			GiftAmount *= 1.5
		elseIf Potential0.HasPerk(WLD_Perk_Romance_Serious)
			GiftAmount *= 2
		endIf
		
		Potential0.SetValue(FPFP_AV_Romance_Sex, GiftAmount * FPFP_Interests.CheckInterest_Sex(Potential0))
	elseif Potential0 == PlayerREF
		if ActorCummedIn.GetValue(FPFP_AV_Romance_Sex_Reveal) == 0
			ActorCummedIn.SetValue(FPFP_AV_Romance_Sex_Reveal, Utility.RandomInt(1, ActorCummedIn.GetValue(FPFP_AV_Romance_Total) as int /10))
		endIf
		float GiftAmount = ActorCummedIn.GetValue(FPFP_AV_Romance_Sex) + Utility.RandomInt(1, 10)
		
		
		if ActorCummedIn.HasPerk(WLD_Perk_Romance_Hatred)
			GiftAmount *= 0
		elseIf ActorCummedIn.HasPerk(WLD_Perk_Romance_Relationship)
			GiftAmount *= 1.5
		elseIf ActorCummedIn.HasPerk(WLD_Perk_Romance_Serious)
			GiftAmount *= 2
		endIf
		
		
		ActorCummedIn.SetValue(FPFP_AV_Romance_Sex, GiftAmount * FPFP_Interests.CheckInterest_Sex(ActorCummedIn))	
	endIf	
		
	If (ActorCummedIn == PlayerREF && (Sex0 == 0 && Sex1 == 0) && FPFP_Global_MaleToMaleCum.GetValue() == 1 && INVB_Global_Male_Player_Dominant.GetValue() == 1) || (ActorCummedIn == PlayerREF && (Sex0 == 1 && Sex1 == 1) && FPFP_Global_FemaleToFemaleCum.GetValue() == 1 && INVB_Global_Female_Player_Dominant.GetValue() == 1)
		Ourself = Potential0
		Utility.Wait(1)
		TrySpermFrom(PlayerREF)	
	elseIf (ActorCummedIn == PlayerREF && (Sex0 == 0 && Sex1 == 0 && Sex2 == 0) && FPFP_Global_MaleToMaleCum.GetValue() == 1 && INVB_Global_Male_Player_Dominant.GetValue() == 1) || (ActorCummedIn == PlayerREF && (Sex0 == 1 && Sex1 == 1 && Sex2 == 1) && FPFP_Global_FemaleToFemaleCum.GetValue() == 1 && INVB_Global_Female_Player_Dominant.GetValue() == 1)
		If Utility.RandomInt(0,1) == 0 ; Play heads or tails to find out which person came inside of you
			Ourself = Potential0
		Else
			Ourself = Potential1
		EndIf
		Utility.Wait(1)
		TrySpermFrom(PlayerREF)	
	elseif (Sex1 == 0 && Sex2 == 0 && FPFP_Global_MaleToMaleCum.GetValue() == 1) || (Sex1 == 1 && Sex2 == 1 && FPFP_Global_FemaleToFemaleCum.GetValue() == 1)
		If Utility.RandomInt(0,1) == 0 ; Play heads or tails to find out which person came inside of you
			TrySpermFrom(Potential0)
		Else
			TrySpermFrom(Potential1)
		EndIf
		
	elseif (Sex1 == 0 && Sex2 == 1) || (Sex1 == 0 || (Sex1 == 1 && FPFP_Global_FemaleToFemaleCum.GetValue() == 1))
		TrySpermFrom(Potential0)
	elseif (Sex1 == 1 && Sex2 == 0) || (Sex2 == 0 || (Sex2 == 1 && FPFP_Global_FemaleToFemaleCum.GetValue() == 1))
		TrySpermFrom(Potential1)
	EndIf

EndEvent

Bool Function IsMale(int theSex) ; works for both scripts

	float FemToFemCum = FPFP_Global_FemaleToFemaleCum.GetValue()
	
	If FemToFemCum == 1.0
		Return True
	ElseIf theSex == 0 || theSex == -1
		Return True
	EndIf

	Return False
	
EndFunction

Bool Function IsValidWoman(Actor akActor) 

	Bool akReturn = False
	
	If akActor

		If akActor.GetLeveledActorBase().GetSex() == 1 && FPFP_Global_FPregPlayerOnly.GetValue() == 0.0 ; If the actor is female and player only FPreg is disabled...
			akReturn = True	
		ElseIf FPFP_Global_MPreg.GetValue() == 1.0 && FPFP_Global_MPregPlayerOnly.GetValue() == 0.0 ; or if MPreg is allowed and player only MPreg is disabled...
			akReturn = True
		EndIf
		
	EndIf
	
	Return akReturn

EndFunction



Bool Function IsNPC(actor akActor) ; works for both scripts
	Return akActor.HasKeyword(ActorTypeNPC)
EndFunction

Actor Function DeterminePotentialMan(Actor akActor) ; works for both scripts

	Actor akReturn
	
	If akActor
		If FPFP_Global_PlayerImpregsOnly.GetValue() == 0.0 || (FPFP_Global_PlayerImpregsOnly.GetValue() == 1.0 && akActor == PlayerREF) ; If anyone can impregnate OR if only the player impregnates, and the actor is the player...
			If FPFP_Global_AllowNonNPC.GetValue() >= 1.0 || IsNPC(akActor) && FPFP_Global_AllowNonNPC.GetValue() <= 1.0 ; If non-npcs can impregnate, OR if the actor is an NPC and only NPCs can impregnate...
				akReturn = akActor ; Return our actor
			EndIf
		EndIf
	EndIf
	
	Return akReturn

EndFunction

Function Condom_Unequiping(Actor akActor)
	akActor.UnequipItem(FPFP_Condom, false, true)
	akActor.RemoveItem(FPFP_Condom, 1)
	
	If akActor.IsEquipped(FPFP_Condom_Glow)
		akActor.UnequipItem(FPFP_Condom_Glow, false, true)
		akActor.RemoveItem(FPFP_Condom_Glow, 1)
	elseIf akActor.IsEquipped(FPFP_Condom_Matte)
		akActor.UnequipItem(FPFP_Condom_Matte, false, true)
		akActor.RemoveItem(FPFP_Condom_Matte, 1)
	elseIf akActor.IsEquipped(FPFP_Condom_Viagra)
		akActor.UnequipItem(FPFP_Condom_Viagra, false, true)
		akActor.RemoveItem(FPFP_Condom_Viagra, 1)
	elseIf akActor.IsEquipped(FPFP_Condom_Viagra_Glow)
		akActor.UnequipItem(FPFP_Condom_Viagra_Glow, false, true)
		akActor.RemoveItem(FPFP_Condom_Viagra_Glow, 1)
	elseIf akActor.IsEquipped(FPFP_Condom_Viagra_Matte)
		akActor.UnequipItem(FPFP_Condom_Viagra_Matte, false, true)
		akActor.RemoveItem(FPFP_Condom_Viagra_Matte, 1)
	endif

EndFunction




Bool Function TrySpermFrom(Actor akMan) ; This should only be called when the actor with this active magic effect gets cummed in
	float chance
				
	chance = FPFP_Global_Chance.getValue()	
	
	If Ourself == PlayerREF
		chance = FPFP_Global_Chance_Player_F.getValue() ;Receiver
	endif
	
	If akMan == PlayerREF
		chance = FPFP_Global_Chance_Player_M.getValue() ;Sender
	endif
	
	if FPFP_Global_Toggle_Creature_Chances.GetValue() == 1 && akMan.GetLeveledActorBase().GetRace() != HumanRace
		chance = FPFP_BabyHandler.WhatsmyChances(akMan.GetLeveledActorBase().GetRace())
	endif
	
	if akMan.GetLeveledActorBase().GetRace() == GhoulRace
		chance = FPFP_Global_Chance_Ghoul.getValue()	
	endif

	Debug.Trace("Base Chance: " + chance)

	OurSelf.SetGhost(false)
	
	;Checking for Section Addition
	If FPFP_Global_SexAddiction.GetValue() >= 1 
		if akMan == PlayerREF
			If (Ourself.HasSpell(SP_Sex_Outcome))
				Ourself.RemoveSpell(SP_Sex_Outcome)
				Utility.Wait(2)
			EndIF
			Ourself.AddSpell(SP_Sex_Outcome, false)
		elseif Ourself == PlayerREF
			If (Ourself.HasSpell(SP_Sex_Outcome))
				Ourself.RemoveSpell(SP_Sex_Outcome)
				Utility.Wait(2)
			EndIF
			Ourself.AddSpell(SP_Sex_Outcome, false)
		endIf	
	endIf

	; Checking for Breeder Virus
	If (akMan.HasPerk(WLD_Perk_Breeder) || Ourself.HasPerk(WLD_Perk_Breeder)) && FPFP_Global_Breeder_Fertile.GetValue() == 1
		chance *= FPFP_Global_FertileEffects.getValue()
		Debug.Trace("Breeder Chance: " + Chance)
	endIf
	
	
	bool impregnated = false
	
	if akMan.GetLeveledActorBase().GetRace() != HumanRace
		Creature_Cum = FPFP_BabyHandler.WhatsmyDNA(akMan.GetLeveledActorBase().GetRace())
	endif
	
	if akMan.HasKeyword(fpfp_DNATransfer)
		if FPFP_BabyHandler.WhatBallsdoIHave(akMan)
			Actor SemenDonor = akMan.PlaceAtMe(FPFP_BabyHandler.NewFather(akMan), abInitiallyDisabled = true) as Actor
			Creature_Cum = FPFP_BabyHandler.WhatsmyDNA(SemenDonor.GetLeveledActorBase().GetRace())
			SemenDonor.delete()
		endIf		
	endIf
	
	;This is the player part of the branch		
	If Ourself.IsEquipped(FPFP_Condom) && akMan.IsEquipped(FPFP_Condom) ;if both partners are wearing a condom then both will rip 
		Condom_Unequiping(Ourself)
		Condom_Unequiping(akMan)
		debug.notification("Both Condoms ripped open because of the friction")
	elseIf Ourself.IsEquipped(FPFP_Condom) && Utility.RandomInt(0,100) >= 95
		Condom_Unequiping(Ourself)
		debug.notification("The Condom ripped open because of the friction")
	elseIf akMan.IsEquipped(FPFP_Condom) && Utility.RandomInt(0,100) >= 95
		Condom_Unequiping(akMan)
		debug.notification("The Condom ripped open because of the friction")
	endif	
	
	If akMan == PlayerREF || Ourself == PlayerREF; involves player, more extreme checks can happen
		
		If Ourself.HasMagicEffect(FPFP_ME_Fertile) ; Is the woman fertile?
			chance *= FPFP_Global_FertileEffects.getValue()
		Endif
		
		If akMan.HasMagicEffect(FPFP_ME_Fertile) ; Is the man virile?
			chance *= FPFP_Global_FertileEffects.getValue()
		Endif
		
		if Ourself.HasPerk(WLD_Perk_Fertile_Both) || Ourself.HasPerk(WLD_Perk_Fertile_Female) || Ourself.HasPerk(WLD_Perk_Fertile_Male) || Ourself.HasPerk(WLD_Perk_Fertile)
			chance *= FPFP_Global_FertileEffects.getValue()
		Endif
		
		if akMan.HasPerk(WLD_Perk_Fertile_Both) || akMan.HasPerk(WLD_Perk_Fertile_Female) || akMan.HasPerk(WLD_Perk_Fertile_Male) || akMan.HasPerk(WLD_Perk_Fertile)
			chance *= FPFP_Global_FertileEffects.getValue()
		Endif
		
		if Ourself.HasPerk(WLD_Perk_Infertile) || akMan.HasPerk(WLD_Perk_Infertile)
			chance *= ((100 - FPFP_Global_Contra.getValue()) * 0.01)
		Endif
		
		If Ourself.HasMagicEffect(FPFP_ME_Pill) || akMan.HasMagicEffect(FPFP_ME_Pill) ; Is the woman on the pill?
			chance *= ((100 - FPFP_Global_Contra.getValue()) * 0.01)
		Endif

		Debug.Trace("Fertility Chance:" + chance)
		
		FPFP_ActorValuePerker.SexCounter_Player(Ourself, akMan)
		
		if (Ourself.HasPerk(WLD_Perk_Sterile) || akMan.HasPerk(WLD_Perk_Sterile)) && FPFP_Global_Sterile.GetValue() == 1
			chance = 0
		Endif
		
		
		If Ourself.IsEquipped(FPFP_Condom); Does the woman have a condom in her cooch? 
			Condom_Unequiping(Ourself)
			
			FPFP_ActorValuePerker.SexCounter_SafeSex(Ourself, akMan)
			
			if (Game.IsPluginInstalled("INVB_WastelandDairy.esp") == TRUE)
			
				if akMan.GetLeveledActorBase().GetRace() == HumanRace
					FullCondom = Game.GetFormFromFile(0x0010D3, "INVB_WastelandDairy.esp") as Potion
					if FPFP_Global_CondomOutcome.GetValue() == 3 || FPFP_Global_CondomOutcome.GetValue() == 4 ;Adds to NPC
						Ourself.addItem(FullCondom, 1)
					elseif FPFP_Global_CondomOutcome.GetValue() == 1 || FPFP_Global_CondomOutcome.GetValue() == 2 ;drops
						Ourself.placeatme(FullCondom, 1)
					endif
					
				elseif akMan.GetLeveledActorBase().GetRace() == HumanRace && Creature_Cum != None
					if FPFP_Global_CondomOutcome.GetValue() == 4 ;Adds to NPC if Creature
						Ourself.addItem(Creature_Cum, 1)
					elseif FPFP_Global_CondomOutcome.GetValue() == 2 ;drops
						Ourself.placeatme(Creature_Cum, 1)
					endif	
						
					if FPFP_Global_CreatureDNAOnce.GetValue() == 1
						akMan.RemovePerk(FPFP_BabyHandler.WhatBallsdoIHave(akMan))
						akMan.RemoveKeyword(fpfp_DNATransfer)
					endIf
					
				elseif akMan.GetLeveledActorBase().GetRace() != HumanRace && Creature_Cum != None
					if FPFP_Global_CondomOutcome.GetValue() == 4 ;Adds to NPC if Creature
						Ourself.addItem(Creature_Cum, 1)
					elseif FPFP_Global_CondomOutcome.GetValue() == 2 ;drops
						Ourself.placeatme(Creature_Cum, 1)
					endif	
				endif
			endif
			chance *= ((100 - FPFP_Global_Contra.getValue()) * 0.01)
			If FPFP_Global_EquipNewCondom.GetValue() == 1 && Ourself.GetItemCount(FPFP_Condom) > 0 ; If we have equip a new condom setting on AND we have more condoms.
				Ourself.EquipItem(FPFP_Condom)
			EndIf
		elseIf akMan.IsEquipped(FPFP_Condom); Does the man wear a condom on his jimmy?
			Condom_Unequiping(akMan)

			FPFP_ActorValuePerker.SexCounter_SafeSex(Ourself, akMan)
			
			if (Game.IsPluginInstalled("INVB_WastelandDairy.esp") == TRUE)
			
				if akMan.GetLeveledActorBase().GetRace() == HumanRace
					FullCondom = Game.GetFormFromFile(0x0010D3, "INVB_WastelandDairy.esp") as Potion
					if FPFP_Global_CondomOutcome.GetValue() == 3 || FPFP_Global_CondomOutcome.GetValue() == 4 ;Adds to NPC
						akMan.addItem(FullCondom, 1)
					elseif FPFP_Global_CondomOutcome.GetValue() == 1 || FPFP_Global_CondomOutcome.GetValue() == 2 ;drops
						akMan.placeatme(FullCondom, 1)
					endif
					
				elseif akMan.GetLeveledActorBase().GetRace() == HumanRace && Creature_Cum != None
					if FPFP_Global_CondomOutcome.GetValue() == 4 ;Adds to NPC if Creature
						akMan.addItem(Creature_Cum, 1)
					elseif FPFP_Global_CondomOutcome.GetValue() == 2 ;drops
						akMan.placeatme(Creature_Cum, 1)
					endif				
				
					if FPFP_Global_CreatureDNAOnce.GetValue() == 1
						akMan.RemovePerk(FPFP_BabyHandler.WhatBallsdoIHave(akMan))
						akMan.RemoveKeyword(fpfp_DNATransfer)
					endIf
					
				elseif akMan.GetLeveledActorBase().GetRace() != HumanRace && Creature_Cum != None
					if FPFP_Global_CondomOutcome.GetValue() == 4 ;Adds to NPC if Creature
						akMan.addItem(Creature_Cum, 1)
					elseif FPFP_Global_CondomOutcome.GetValue() == 2 ;drops
						akMan.placeatme(Creature_Cum, 1)
					endif
					
				endif
			endif
			chance *= ((100 - FPFP_Global_Contra.getValue()) * 0.01)
			If FPFP_Global_EquipNewCondom.GetValue() == 1 && akMan.GetItemCount(FPFP_Condom) > 0
				akMan.EquipItem(FPFP_Condom)
			EndIf
		else
			if FPFP_Global_Cumshot.GetValue() == 1
				if akMan.GetLeveledActorBase().GetRace() != HumanRace
					SP_Cumshot_Extra = FPFP_BabyHandler.WhatColourisMyCum(akMan.GetLeveledActorBase().GetRace())
					if SP_Cumshot_Extra != None
						SP_Cumshot_Extra.Cast(Ourself, Ourself)
					else
						SP_Cumshot.Cast(Ourself, Ourself)
					endif
				else
					SP_Cumshot.Cast(akMan, akMan)
					SP_Cumshot.Cast(Ourself, Ourself)
				endif
			endif
			
			OurSelf.SetGhost(false)
			PlayerREF.SetGhost(false)
			
			
			Debug.Trace("Final Chance:" + chance)

			float cmonth = GetCurrentMonth()
			bool canCumflate = false 

			if (!impregnated)
				canCumflate = true
			ElseIf (cmonth <=3)
				canCumflate = true
			EndIf

			if FPFP_Global_Cumflation_Toggle.GetValue() == 1 && canCumflate
				if FPFP_Global_Cumflation_FemaletoFemale.GetValue() == 1 && akMan.GetLeveledActorBase().GetSex() == 1 && ourself.GetLeveledActorBase().GetSex() == 1
					Ourself.AddSpell(SP_Cumflation_Low, false)
				else
					if akMan.GetLeveledActorBase().GetRace() != HumanRace
						int cum_choice = FPFP_BabyHandler.HowBig_Cumflation(akMan.GetLeveledActorBase().GetRace()) as int
						if cum_choice == 1
							Ourself.AddSpell(SP_Cumflation_Low, false)
						elseif cum_choice == 2
							Ourself.AddSpell(SP_Cumflation_Med, false)
						elseif cum_choice == 3
							Ourself.AddSpell(SP_Cumflation_High, false)
						else
							Ourself.AddSpell(SP_Cumflation_Med, false)
							
						endIf	
					else
						Ourself.AddSpell(SP_Cumflation_Low, false)
						
					endIf
				endif	
			endif
			
			
			FPFP_ActorValuePerker.SexCounter(Ourself, akMan)
			
			if INVB_Global_Infect.GetValue() == 1
				FPFP_STD.Infect(Ourself, akMan)
			endif
		Endif
			; Keeps this spell from persisting
			Ourself.RemoveSpell(SP_Cumflation_High)
			Ourself.RemoveSpell(SP_Cumflation_Med)
			Ourself.RemoveSpell(SP_Cumflation_Low)
	
	Else; involves NPC-NPC ; means that we shouldn't be doing extreme checks, just in case orgies are happening
		If Utility.RandomInt(0,99) < 10; fertile 
			chance *= 5 ; lower chance for NPC fertile to save resources
		Endif
		
		if akMan.IsEquipped(FPFP_Condom)
			chance *= ((100 - FPFP_Global_Contra.getValue()) * 0.01)
			Condom_Unequiping(akMan)
			
			FPFP_ActorValuePerker.SexCounter_SafeSex(Ourself, akMan)
			
			if (Game.IsPluginInstalled("INVB_WastelandDairy.esp") == TRUE)
				if akMan.GetLeveledActorBase().GetRace() == HumanRace
					FullCondom = Game.GetFormFromFile(0x0010D3, "INVB_WastelandDairy.esp") as Potion
					if FPFP_Global_CondomOutcome.GetValue() == 3 || FPFP_Global_CondomOutcome.GetValue() == 4 ;Adds to NPC
						akMan.addItem(FullCondom, 1)
					elseif FPFP_Global_CondomOutcome.GetValue() == 1 || FPFP_Global_CondomOutcome.GetValue() == 2 ;drops
						akMan.placeatme(FullCondom, 1)
					endif
				else
					if FPFP_Global_CondomOutcome.GetValue() == 4 ;Adds to NPC if Creature
						akMan.addItem(Creature_Cum, 1)
					elseif FPFP_Global_CondomOutcome.GetValue() == 2 ;drops
						akMan.placeatme(Creature_Cum, 1)
					endif
				endif
			endif
			
		elseif Ourself.IsEquipped(FPFP_Condom)
			chance *= ((100 - FPFP_Global_Contra.getValue()) * 0.01)
			Condom_Unequiping(Ourself)
			
			FPFP_ActorValuePerker.SexCounter_SafeSex(Ourself, akMan)
			
			if (Game.IsPluginInstalled("INVB_WastelandDairy.esp") == TRUE)
			
				if Ourself.GetLeveledActorBase().GetRace() == HumanRace
					FullCondom = Game.GetFormFromFile(0x0010D3, "INVB_WastelandDairy.esp") as Potion
					if FPFP_Global_CondomOutcome.GetValue() == 3 || FPFP_Global_CondomOutcome.GetValue() == 4 ;Adds to NPC
						Ourself.addItem(FullCondom, 1)
					elseif FPFP_Global_CondomOutcome.GetValue() == 1 || FPFP_Global_CondomOutcome.GetValue() == 2 ;drops
						Ourself.placeatme(FullCondom, 1)
					endif
				else
					if FPFP_Global_CondomOutcome.GetValue() == 4 ;Adds to NPC if Creature
						Ourself.addItem(Creature_Cum, 1)
					elseif FPFP_Global_CondomOutcome.GetValue() == 2 ;drops
						Ourself.placeatme(Creature_Cum, 1)
					endif
				endif	
			endif
			
		elseIf Utility.RandomInt(0,99) < FPFP_Global_NPCContra.getValueint(); NPCs used contraception
			chance *= ((100 - FPFP_Global_Contra.getValue()) * 0.01)
			Condom_Unequiping(akMan)
			
			FPFP_ActorValuePerker.SexCounter_SafeSex(Ourself, akMan)
			
			if (Game.IsPluginInstalled("INVB_WastelandDairy.esp") == TRUE)
				if akMan.GetLeveledActorBase().GetRace() == HumanRace
					FullCondom = Game.GetFormFromFile(0x0010D3, "INVB_WastelandDairy.esp") as Potion
					if FPFP_Global_CondomOutcome.GetValue() == 3 || FPFP_Global_CondomOutcome.GetValue() == 4 ;Adds to NPC
						akMan.addItem(FullCondom, 1)
					else
						akMan.placeatme(FullCondom, 1)
					endif
				else
					if FPFP_Global_CondomOutcome.GetValue() == 4 ;Adds to NPC if Creature
						akMan.addItem(Creature_Cum, 1)
					else
						akMan.placeatme(Creature_Cum, 1)
					endif
				endif
			endif	
		else
			if FPFP_Global_Cumshot.GetValue() == 1
				if akMan.GetLeveledActorBase().GetRace() != HumanRace
					SP_Cumshot_Extra = FPFP_BabyHandler.WhatColourisMyCum(akMan.GetLeveledActorBase().GetRace())
					if SP_Cumshot_Extra != None
						SP_Cumshot_Extra.Cast(Ourself, Ourself)
					else
						SP_Cumshot.Cast(Ourself, Ourself)
					endif
				else
					SP_Cumshot.Cast(akMan, akMan)
					SP_Cumshot.Cast(Ourself, Ourself)
				endif
			endif
			
			OurSelf.SetGhost(false)

			float cmonth = GetCurrentMonth()
			bool canCumflate = false 

			if (!impregnated)
				canCumflate = true
			ElseIf (cmonth <=3)
				canCumflate = true
			EndIf
			
			if FPFP_Global_Cumflation_Toggle.GetValue() == 1 && canCumflate
				if FPFP_Global_Cumflation_FemaletoFemale.GetValue() == 1 && akMan.GetLeveledActorBase().GetSex() == 1 && ourself.GetLeveledActorBase().GetSex() == 1
					; If Ourself.HasSpell(SP_Cumflation_Low)
					; 			Ourself.RemoveSpell(SP_Cumflation_Low)
					; 			Utility.Wait(2)
					; EndIF
					Ourself.AddSpell(SP_Cumflation_Low, false)
				else
					if akMan.GetLeveledActorBase().GetRace() != HumanRace
						int cum_choice = FPFP_BabyHandler.HowBig_Cumflation(akMan.GetLeveledActorBase().GetRace()) as int
						if cum_choice == 1
							; If Ourself.HasSpell(SP_Cumflation_Low)
								
							; 	Ourself.RemoveSpell(SP_Cumflation_Low)
								
							; EndIF
							Ourself.AddSpell(SP_Cumflation_Low, false)
						elseif cum_choice == 2
							; If Ourself.HasSpell(SP_Cumflation_Med)
							; 	Ourself.RemoveSpell(SP_Cumflation_Med)
							; 	Utility.Wait(2)
							; EndIF
							Ourself.AddSpell(SP_Cumflation_Med, false)
						elseif cum_choice == 3
							; If Ourself.HasSpell(SP_Cumflation_High)
							; 	Ourself.RemoveSpell(SP_Cumflation_High)
							; 	Utility.Wait(2)
							; EndIF
							Ourself.AddSpell(SP_Cumflation_High, false)
						endIf	
					else
							; If Ourself.HasSpell(SP_Cumflation_Low)
							; 	Ourself.RemoveSpell(SP_Cumflation_Low)
							; 	Utility.Wait(2)
							; EndIF
							Ourself.AddSpell(SP_Cumflation_Low, false)
					endIf
				endif	
			endif
			
			FPFP_ActorValuePerker.SexCounter(Ourself, akMan)
			
			if INVB_Global_Infect.GetValue() == 1
				FPFP_STD.Infect_NPC(Ourself, akMan)
			endif
				; Keeps this spell from persisting
			Ourself.RemoveSpell(SP_Cumflation_High)
			Ourself.RemoveSpell(SP_Cumflation_Med)
			Ourself.RemoveSpell(SP_Cumflation_Low)
		Endif
	Endif
	
	
	if FPFP_Global_Notif_Debug_Sex.GetValue() >= 1
		debug.trace("FPFP_Global_Chance.getValue() is "+ FPFP_Global_Chance.getValue())
		debug.trace("FPFP_Global_Chance_Player_F.getValue() is "+ FPFP_Global_Chance_Player_F.getValue())
		debug.trace("FPFP_Global_Chance_Player_M.getValue() is "+ FPFP_Global_Chance_Player_M.getValue())
		debug.trace("FPFP_BabyHandler.WhatsmyChances(akMan.GetLeveledActorBase().GetRace()) is "+ FPFP_BabyHandler.WhatsmyChances(akMan.GetLeveledActorBase().GetRace()))
		debug.trace("Final chance is "+ chance)
	endIf
	
	if FPFP_Global_Notif_Debug_Sex.GetValue() == 2
		debug.notification("FPFP_Global_Chance.getValue() is "+ FPFP_Global_Chance.getValue())
		debug.notification("FPFP_Global_Chance_Player_F.getValue() is "+ FPFP_Global_Chance_Player_F.getValue())
		debug.notification("FPFP_Global_Chance_Player_M.getValue() is "+ FPFP_Global_Chance_Player_M.getValue())
		debug.notification("FPFP_BabyHandler.WhatsmyChances(akMan.GetLeveledActorBase().GetRace()) is "+ FPFP_BabyHandler.WhatsmyChances(akMan.GetLeveledActorBase().GetRace()))
		debug.notification("Final chance is "+ chance)
	endIf
	
	If !Ourself.IsInFaction(FPFP_Preggo) && Utility.RandomFloat(0,100) <= chance
		impregnated = true
	Endif

	if akMan.GetLeveledActorBase().GetRace() == HumanRace && ourself.GetLeveledActorBase().GetRace() == HumanRace
		workshopnpcscript Ourself_Synth = Ourself as workshopnpcscript
		workshopnpcscript akMan_Synth = akMan as workshopnpcscript
		bool isSynth_M = false
		bool isSynth_F = false
		
		if FPFP_Global_Synth_Known.GetValue() > 1 && Ourself.HasPerk(WLD_Perk_Synth_Unknown) || Ourself.HasPerk(WLD_Perk_Synth_Known)
			isSynth_F = true
		elseif FPFP_Global_Synth_Known.GetValue() > 1 && akMan.HasPerk(WLD_Perk_Synth_Unknown) || akMan.HasPerk(WLD_Perk_Synth_Known)
			isSynth_M = true
		elseif FPFP_Global_Synth_Known.GetValue() == 1 && Ourself.HasPerk(WLD_Perk_Synth_Known)
			isSynth_F = true
		elseif FPFP_Global_Synth_Known.GetValue() == 1 && akMan.HasPerk(WLD_Perk_Synth_Known)
			isSynth_M = true
		elseif FPFP_Global_Synth_hidden.GetValue() == 1 && Ourself_Synth.bIsSynth
			isSynth_F = true
		elseIf FPFP_Global_Synth_hidden.GetValue() == 1 && akMan_Synth.bIsSynth
			isSynth_M = true
		endIf

		If Impregnated && (isSynth_F == true || isSynth_M == true)
			impregnated = false
			if isSynth_F == true && ((FPFP_Global_Notif_Synth.getValue() == 1 && Ourself.GetDistance(PlayerREF as ObjectReference) > 256) || FPFP_Global_Notif_Synth.getValue() == 2)
				Debug.trace(RenameAnything.GetRefName(Ourself) +" is a Hidden Synth")
				Debug.notification(RenameAnything.GetRefName(Ourself) +" is a Hidden Synth")
			elseif isSynth_M == true && ((FPFP_Global_Notif_Synth.getValue() == 1 && akMan.GetDistance(PlayerREF as ObjectReference) > 256) || FPFP_Global_Notif_Synth.getValue() == 2)
				Debug.trace(RenameAnything.GetRefName(akMan) +" is a Hidden Synth")
				Debug.notification(RenameAnything.GetRefName(akMan) +" is a Hidden Synth")
			endIf	
		endIf
	Endif
	
	if Impregnated && FPFP_Global_SynthImpreg.GetValue() == 0 && akMan.GetLeveledActorBase().GetRace() == GhoulRace
		impregnated = false
		if (FPFP_Global_Notif_Ghoul.getValue() == 1 && akMan.GetDistance(PlayerREF as ObjectReference) > 256) || FPFP_Global_Notif_Ghoul.getValue() == 2
			Debug.trace(RenameAnything.GetRefName(akMan) +" is a ghoul")
			Debug.notification(RenameAnything.GetRefName(akMan) +" is a ghoul")
		endIf
	elseif Impregnated && FPFP_Global_AllowNonNPC.GetValue() <= 1 && akMan.GetLeveledActorBase().GetRace() != HumanRace 
		impregnated = false	
		if (FPFP_Global_Notif_Creature.getValue() == 1 && akMan.GetDistance(PlayerREF as ObjectReference) > 256) || FPFP_Global_Notif_Creature.getValue() == 2
			Debug.trace(RenameAnything.GetRefName(akMan) +" is Not Allowed")
			Debug.notification(RenameAnything.GetRefName(akMan) +" is Not Allowed")
		endIf
	endif
	
	If Ourself.IsInFaction(FPFP_Preggo)
		impregnated = false	
		if (FPFP_Global_Notif_Pregnant.getValue() == 1 && Ourself.GetDistance(PlayerREF as ObjectReference) > 256) || FPFP_Global_Notif_Pregnant.getValue() == 2
			Debug.trace(RenameAnything.GetRefName(Ourself) +" is currently Pregnant")
			Debug.notification(RenameAnything.GetRefName(Ourself) +" is currently Pregnant")
		endIf
	endif
	
	if ((ourself.HasKeyword(AnimArchetypeElderly) || ourself.HasKeyword(kw_Elderly)) && FPFP_Global_AllowElder.GetValue() == 0)
		impregnated = false
		if (FPFP_Global_Notif_Elderly.getValue() == 1 && Ourself.GetDistance(PlayerREF as ObjectReference) > 256) || FPFP_Global_Notif_Elderly.getValue() == 2
			Debug.trace(RenameAnything.GetRefName(Ourself) +" is Elderly")
			Debug.notification(RenameAnything.GetRefName(Ourself) +" is Elderly")	
		endIf
	endif
	
	If IsPostPartum == true && FPFP_Global_PostPartum_Preg.GetValue() == 0
		impregnated = false	
		if (FPFP_Global_Notif_PostPartum.getValue() == 1 && Ourself.GetDistance(PlayerREF as ObjectReference) > 256) || FPFP_Global_Notif_PostPartum.getValue() == 2
			Debug.trace(RenameAnything.GetRefName(Ourself) +" is experiencing Post Partum")
			Debug.notification(RenameAnything.GetRefName(Ourself) +" is experiencing Post Partum")
		endIf
	endif
	
	if (Ourself.HasPerk(WLD_Perk_Sterile) || akMan.HasPerk(WLD_Perk_Sterile)) && FPFP_Global_Sterile.GetValue() == 1
		impregnated = false
		if Ourself.HasPerk(WLD_Perk_Sterile) && (FPFP_Global_Notif_Sterile.getValue() == 1 && Ourself.GetDistance(PlayerREF as ObjectReference) > 256) || FPFP_Global_Notif_Sterile.getValue() == 2
			Debug.trace(RenameAnything.GetRefName(Ourself) +" is Sterile")
			Debug.notification(RenameAnything.GetRefName(Ourself) +" is Sterile")
		elseif akMan.HasPerk(WLD_Perk_Sterile) && (FPFP_Global_Notif_Sterile.getValue() == 1 && akMan.GetDistance(PlayerREF as ObjectReference) > 256) || FPFP_Global_Notif_Sterile.getValue() == 2
			Debug.trace(RenameAnything.GetRefName(akMan) +" is Sterile")
			Debug.notification(RenameAnything.GetRefName(akMan) +" is Sterile")
		Endif
	Endif
	
	if FPFP_Global_Impregnation_Notif_boolean.GetValue() == 0 && impregnated && !Ourself.IsInFaction(FPFP_Preggo)
		FPFP_Global_Impregnation_Notif_boolean.SetValue(1)
		if FPFP_Global_Impregnation_Notif.GetValue() == 0
			FPE.ConceptionNotifications(Ourself, akMan, chance, impregnated, NumChildren) 
		elseif FPFP_Global_Impregnation_Notif.GetValue() == 1
			if (INVB_Global_MessagePlayer_Impreg.GetValue() == 1 || INVB_Global_MessagePlayer_Impreg.GetValue() == 2) && (Ourself == PlayerREF || akMan == PlayerREF)
				FPFP_Messages.Impregnation_Message(Ourself, akMan)
			elseif INVB_Global_MessagePlayer_Impreg.GetValue() == 2
				FPFP_Messages.Impregnation_Message(Ourself, akMan)
			elseif INVB_Global_MessagePlayer_Impreg.GetValue() == 0
			endif
		elseif FPFP_Global_Impregnation_Notif.GetValue() == 2
			int random_Notif = Utility.RandomInt(1, 2)
			if (random_Notif == 1)
				if (INVB_Global_MessagePlayer_Impreg.GetValue() == 1 || INVB_Global_MessagePlayer_Impreg.GetValue() == 2) && (Ourself == PlayerREF || akMan == PlayerREF)
					FPFP_Messages.Impregnation_Message(Ourself, akMan)
				elseif INVB_Global_MessagePlayer_Impreg.GetValue() == 2
					FPFP_Messages.Impregnation_Message(Ourself, akMan)
				elseif INVB_Global_MessagePlayer_Impreg.GetValue() == 0
				endif
			elseif (random_Notif == 2)
				FPE.ConceptionNotifications(Ourself, akMan, chance, impregnated, NumChildren) 
			endif
		endif
		
		FPFP_Global_Impregnation_Notif_boolean.SetValue(0)
	endif
	
	if impregnated == false
		FPE.ConceptionNotifications(Ourself, akMan, chance, impregnated, NumChildren) 
	endif
	
	if impregnated && !Ourself.IsInFaction(FPFP_Preggo) 
		if akMan.HasKeyword(fpfp_DNATransfer) && Ourself.HasKeyword(fpfp_DNATransfer) && akMan.GetLeveledActorBase().GetRace() == HumanRace 
			If (Utility.RandomInt(1, 100) <= FPFP_Global_Mothers_DNA.GetValue())
				int random_seed = Utility.RandomInt(1, 100)
				if (random_seed <= INVB_Global_Racial_Baby_Chance.GetValue())
					if FPFP_BabyHandler.WhatBallsdoIHave(Ourself)
						Actor tempActor = Ourself.PlaceAtMe(FPFP_BabyHandler.NewFather(Ourself), abInitiallyDisabled = true) as Actor
						if Ourself == PlayerREF
							tempActor.AddKeyword(fpfp_Father)
							tempActor.AddKeyword(fpfp_noDaddy)
						else
							tempActor.AddKeyword(fpfp_noDaddy)
						endif
						Impregnate(tempActor, false)
						tempActor.delete()
						
						if FPFP_Global_CreatureDNAOnce.GetValue() == 1
							Ourself.RemovePerk(FPFP_BabyHandler.WhatBallsdoIHave(Ourself))
							Ourself.RemoveKeyword(fpfp_DNATransfer)
						endIf
					else
						Impregnate(Ourself, false)
					Endif
				else
					Impregnate(akMan, false)
				Endif
			else
				int random_seed = Utility.RandomInt(1, 100)
				if (random_seed <= INVB_Global_Racial_Baby_Chance.GetValue())
					if FPFP_BabyHandler.WhatBallsdoIHave(akMan)
						Actor tempActor = akMan.PlaceAtMe(FPFP_BabyHandler.NewFather(akMan), abInitiallyDisabled = true) as Actor
						if akMan == PlayerREF
							tempActor.AddKeyword(fpfp_Father)
							tempActor.AddKeyword(fpfp_noDaddy)
						else
							tempActor.AddKeyword(fpfp_noDaddy)
						endif
						Impregnate(tempActor, false)
						tempActor.delete()
						
						if FPFP_Global_CreatureDNAOnce.GetValue() == 1
							akMan.RemovePerk(FPFP_BabyHandler.WhatBallsdoIHave(akMan))
							akMan.RemoveKeyword(fpfp_DNATransfer)
						endIf
					else
						Impregnate(akMan, false)
					Endif
				else
					Impregnate(akMan, false)
				Endif
			Endif
				
		elseif akMan.HasKeyword(fpfp_DNATransfer) && akMan.GetLeveledActorBase().GetRace() == HumanRace 
			int random_seed = Utility.RandomInt(1, 100)
			if (random_seed <= INVB_Global_Racial_Baby_Chance.GetValue())
				if FPFP_BabyHandler.WhatBallsdoIHave(akMan)
					Actor tempActor = akMan.PlaceAtMe(FPFP_BabyHandler.NewFather(akMan), abInitiallyDisabled = true) as Actor
					if akMan == PlayerREF
						tempActor.AddKeyword(fpfp_Father)
						tempActor.AddKeyword(fpfp_noDaddy)
					else
						tempActor.AddKeyword(fpfp_noDaddy)
					endif
					Impregnate(tempActor, false)
					tempActor.delete()
					
					if FPFP_Global_CreatureDNAOnce.GetValue() == 1
						akMan.RemovePerk(FPFP_BabyHandler.WhatBallsdoIHave(akMan))
						akMan.RemoveKeyword(fpfp_DNATransfer)
					endIf
				else
					Impregnate(akMan, false)
				Endif
			else
				Impregnate(akMan, false)
			Endif
		elseif Ourself.HasKeyword(fpfp_DNATransfer) && akMan.GetLeveledActorBase().GetRace() == HumanRace
			int random_seed = Utility.RandomInt(1, 100)
			if (random_seed <= INVB_Global_Racial_Baby_Chance.GetValue())
				if FPFP_BabyHandler.WhatBallsdoIHave(Ourself)
					Actor tempActor = Ourself.PlaceAtMe(FPFP_BabyHandler.NewFather(Ourself), abInitiallyDisabled = true) as Actor
					if Ourself == PlayerREF
						tempActor.AddKeyword(fpfp_Father)
						tempActor.AddKeyword(fpfp_noDaddy)
					else
						tempActor.AddKeyword(fpfp_noDaddy)
					endif
					Impregnate(tempActor, false)
					tempActor.delete()
					
					if FPFP_Global_CreatureDNAOnce.GetValue() == 1
						Ourself.RemovePerk(FPFP_BabyHandler.WhatBallsdoIHave(Ourself))
						Ourself.RemoveKeyword(fpfp_DNATransfer)
					endIf
				else
					Impregnate(Ourself, false)
				Endif
			else
				Impregnate(akMan, false)
			Endif
		else
			Impregnate(akMan, false)
		Endif
	Endif
	Return impregnated

EndFunction


Function Impregnate(Actor akMan, bool advanced = false) ; akMan is the father of the baby

	if Ourself.HasPerk(WLD_Perk_Pregnancy_Freezing)
		Ourself.RemovePerk(WLD_Perk_Pregnancy_Freezing)
	endIf

	Ourself.SetValue(FPFP_AV_PregnancyStage, 1) ;Sets FPFP_AV_PregnancyStage to 1

	if advanced == false
		BecomePreggo(akMan, false) ; Does faction registration too.
	elseif advanced == true
		BecomePreggo(akMan, true) ; Does faction registration too.
	endIf
	
	IncepDate = Utility.GetCurrentGameTime()
	
	If akMan
		FatherRace = akMan.GetLeveledActorBase().GetRace()
	Else
		FatherRace = Ourself.GetLeveledActorBase().GetRace()
	EndIf
	
	if Utility.RandomFloat(1,100) <= FPFP_Global_MultiChance.GetValue()
        float chance = Utility.RandomFloat(0.0,100.0)
		if (chance < 35) && (chance > 15) && FPFP_Global_MultiMax.GetValueInt() > 2  ;20%
			NumChildren = 3
		elseif (chance < 15) && (chance > 5) && FPFP_Global_MultiMax.GetValueInt() > 3 ;10%
			NumChildren = 4
		elseif (chance < 5) && FPFP_Global_MultiMax.GetValueInt() == 5 ;5%
			NumChildren = 5
		else
			NumChildren = 2
		endif
	else
		NumChildren = 1
	endIf
	
	
	if FPFP_Global_Notif_Debug_Impregnation.GetValue() >= 1
		debug.trace("Number of Children for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ NumChildren)
		debug.trace("advanced pregnancy for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ advanced)
	endIf
	
	if FPFP_Global_Notif_Debug_Impregnation.GetValue() == 2
		debug.notification("Number of Children for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ NumChildren)
		debug.notification("advanced pregnancy for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ advanced)
	endIf
	
	FirstCheck = True
	
	if Ourself.HasPerk(WLD_Perk_Breeder) && FPFP_Global_Breeder_Grow.GetValue() == 1
		StartTimerGameTime(FPE.GetUpdateTime_Breeder())
	else
		StartTimerGameTime(FPE.GetUpdateTime())
	endif
	
	FPE.SendPregEvent(Ourself, akMan, NumChildren)
	
	if advanced == true
	
		UpdateBody(Advanced_Start)
	endif
	
EndFunction

Function BecomePreggo(Actor akMan, bool advanced)
	IsPregnant = True
	IsPostPartum = false
	
	If FPFP_Global_RandomMorphs.GetValue() == 0 ;On
		Random_Morph = Utility.RandomFloat(0.8, 1.2)
	elseIf FPFP_Global_RandomMorphs.GetValue() == 2 && Ourself.GetValue(FPFP_AV_RandomnessIndex) == 0
		ActorValue_RandomnessIndex = Ourself.GetValue(FPFP_AV_RandomnessIndex)
		Ourself.SetValue(FPFP_AV_RandomnessIndex, (Utility.RandomFloat(0.8, 1.2)))
		Random_Morph = Ourself.GetValue(FPFP_AV_RandomnessIndex)
	elseIf FPFP_Global_RandomMorphs.GetValue() == 2 && Ourself.GetValue(FPFP_AV_RandomnessIndex) > 0
		Random_Morph = Ourself.GetValue(FPFP_AV_RandomnessIndex)
	endIf
	
	
	
	If Ourself != PlayerREF
		If akMan == PlayerREF || akMan.HasKeyword(fpfp_Father)
			INVB_Global_Preggo_Count_Player.SetValue(INVB_Global_Preggo_Count_Player.getValue() + 1)
			INVB_Global_Preggo_Count_Current.SetValue(INVB_Global_Preggo_Count_Current.getValue() + 1) 
			
			if FPFP_Global_Perks_Father.GetValue() == 1
				Ourself.AddPerk(WLD_Perk_Impregnated_Player)
			endif
			
			Creature_Cycle = FPFP_Global_Length_Human.GetValue()
			Creature_Morph = FPFP_Global_Morph_Ghoul.GetValue()
			
				if Creature_Cycle == 0
					Creature_Cycle = 9
				endIf	
			
		elseif akMan.GetLeveledActorBase().GetRace() == HumanRace
			INVB_Global_Preggo_Count_Cuck.SetValue(INVB_Global_Preggo_Count_Cuck.getValue() + 1)
			
			if FPFP_Global_Perks_Father.GetValue() == 1
				Ourself.AddPerk(WLD_Perk_Impregnated)
			endif
			
			Creature_Cycle = FPFP_Global_Length_Human.GetValue()
			Creature_Morph = FPFP_Global_Morph_Human.GetValue()
		
			if Creature_Cycle == 0
				Creature_Cycle = 9
			endIf	
		elseif akMan.GetLeveledActorBase().GetRace() == GhoulRace
			INVB_Global_Preggo_Count_Cuck.SetValue(INVB_Global_Preggo_Count_Cuck.getValue() + 1)
			
			if FPFP_Global_Perks_Father.GetValue() == 1
				Ourself.AddPerk(WLD_Perk_Impregnated)
			endif
			
			Creature_Cycle = FPFP_Global_Length_Ghoul.GetValue()
			Creature_Morph = FPFP_Global_Morph_Ghoul.GetValue()
		
			if Creature_Cycle == 0
				Creature_Cycle = 9
			endIf		
		else
			
			bool FoundFather = false
			
			FoundFather = FPFP_BabyHandler.FoundtheFather(akMan.GetLeveledActorBase().GetRace())
			
			if FoundFather
				Creature_Perk = FPFP_BabyHandler.WhatsmyPerk(akMan.GetLeveledActorBase().GetRace())
				Creature_Cycle = FPFP_BabyHandler.Howlongismypregnancy(akMan.GetLeveledActorBase().GetRace())
				Creature_Cycle_Multi = FPFP_BabyHandler.WhatTwins(akMan.GetLeveledActorBase().GetRace())
				Creature_Morph = FPFP_BabyHandler.HowBig(akMan.GetLeveledActorBase().GetRace())
				
				if FPFP_Global_Creature_Faction.GetValue() == 1 || FPFP_Global_Creature_Faction.GetValue() == 3
					Creature_Faction = FPFP_BabyHandler.WhatFaction(akMan.GetLeveledActorBase().GetRace())
				elseif FPFP_Global_Creature_Faction.GetValue() == 2 || FPFP_Global_Creature_Faction.GetValue() == 4
					Creature_Faction = FPFP_BabyHandler.WhatFaction_Friendly(akMan.GetLeveledActorBase().GetRace())
				endIf
				
			elseIf FoundFather == false
				Creature_Perk = WLD_Perk_Impregnated
				Creature_Cycle = FPFP_Global_Length_Human.GetValue()
				Creature_Morph = FPFP_Global_Morph_Human.GetValue()
			EndIf
			
			if FPFP_Global_Perks_Father.GetValue() == 1 && Creature_Perk != None
				Ourself.AddPerk(Creature_Perk)
			endif

			if FPFP_Global_Creature_Faction.GetValue() >= 1
				if Creature_Faction != None
					Ourself.setFactionRank(Creature_Faction, 0)
					if Ourself.IsInFaction(Creature_Faction)
						Ourself.AddPerk(WLD_Perk_Pheromones)
					endIf
				endIf
			endif
			
			if Creature_Cycle == 0
				Creature_Cycle = 9
			endIf
			
			
			Ourself.SetValue(FPFP_AV_RemainingPregnancy, Creature_Cycle) ;Sets FPFP_AV_RemainingPregnancy to Creature_Cycle
	
		endif
	else
		if akMan.GetLeveledActorBase().GetRace() == HumanRace
			Creature_Morph = FPFP_Global_Morph_Human.GetValue()
		else
			bool FoundFather = false
			
			FoundFather = FPFP_BabyHandler.FoundtheFather(akMan.GetLeveledActorBase().GetRace())
			
			if FoundFather
				Creature_Morph = FPFP_BabyHandler.HowBig(akMan.GetLeveledActorBase().GetRace())
			else
				Creature_Morph = FPFP_Global_Morph_Human.GetValue()
			EndIf
			
			INVB_Global_Preggo_Count_Player_Babies.SetValue(INVB_Global_Preggo_Count_Player_Babies.getValue() + 1)
			
		endif
	endif
	
	if FPFP_Global_Notif_Debug_Impregnation.GetValue() >= 1
		debug.trace("Random_Morph for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Random_Morph)
		debug.trace("Creature_Cycle for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Creature_Cycle)
		debug.trace("Creature_Faction for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Creature_Faction)
		debug.trace("Creature_Morph for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Creature_Morph)
		debug.trace("Creature_Perk for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Creature_Perk)
	endIf
	
	if FPFP_Global_Notif_Debug_Impregnation.GetValue() == 2
		debug.notification("Random_Morph for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Random_Morph)
		debug.notification("Creature_Cycle for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Creature_Cycle)
		debug.notification("Creature_Faction for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Creature_Faction)
		debug.notification("Creature_Morph for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Creature_Morph)
		debug.notification("Creature_Perk for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Creature_Perk)
	endIf
	
	if advanced == true
		Advanced_Start = Utility.RandomFloat(FPFP_Global_Power_Advanced.GetValue() - FPFP_Global_Power_Adv_Mod.GetValue(), FPFP_Global_Power_Advanced.GetValue() + FPFP_Global_Power_Adv_Mod.GetValue())
		
		if Advanced_Start < 1
			Advanced_Start = 2
		elseif Advanced_Start > 9
			Advanced_Start = 8
		endIf
		
			Ourself.SetValue(FPFP_AV_RemainingPregnancy, Creature_Cycle - Advanced_Start) ;Sets FPFP_AV_RemainingPregnancy to Creature_Cycle - Advanced_Start
			
			If Advanced_Start <= (Creature_Cycle / 3)
				Ourself.SetValue(FPFP_AV_PregnancyStage, 1) ;Sets FPFP_AV_PregnancyStage to 1
			elseIf Advanced_Start >= (Creature_Cycle / 3)
				Ourself.SetValue(FPFP_AV_PregnancyStage, 2) ;Sets FPFP_AV_PregnancyStage to 2
			else
				Ourself.SetValue(FPFP_AV_PregnancyStage, 3) ;Sets FPFP_AV_PregnancyStage to 3			
			EndIf

			if FPFP_Global_Notif_Debug_Impregnation.GetValue() >= 1
				debug.trace("Advanced_Start for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Advanced_Start)
			endIf
		
			if FPFP_Global_Notif_Debug_Impregnation.GetValue() == 2
				debug.notification("Advanced_Start for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Advanced_Start)
			endIf
			
		Ourself.AddPerk(WLD_Perk_Month[Advanced_Start as int])
		UpdateBody(Advanced_Start)
	endif
	
	
	
	if FPFP_Global_Perks_Harem.GetValue() == 1 && Ourself != NONE	
		if (INVB_Global_Preggo_Count_Player.getValue() >= 30)
			PlayerREF.AddPerk(WLD_Perk_Impregnated_30)
			PlayerREF.RemovePerk(WLD_Perk_Impregnated_15)
		elseif (INVB_Global_Preggo_Count_Player.getValue() >= 15)
			PlayerREF.AddPerk(WLD_Perk_Impregnated_15)
			PlayerREF.RemovePerk(WLD_Perk_Impregnated_10)
		elseif (INVB_Global_Preggo_Count_Player.getValue() >= 10)
			PlayerREF.AddPerk(WLD_Perk_Impregnated_10)
			PlayerREF.RemovePerk(WLD_Perk_Impregnated_5)
		elseif (INVB_Global_Preggo_Count_Player.getValue() >= 5)
			PlayerREF.AddPerk(WLD_Perk_Impregnated_5)
		endif
	
		if (INVB_Global_Preggo_Count_Cuck.getValue() >= 10) && (INVB_Global_Preggo_Count_Player.getValue() == 0)
			PlayerREF.AddPerk(WLD_Perk_Cuckold)
		elseif (INVB_Global_Preggo_Count_Player.getValue() <= 1)
			PlayerREF.RemovePerk(WLD_Perk_Cuckold)		
		endif
	
		if (INVB_Global_Preggo_Count_Current.getValue() >= 5)
			PlayerREF.AddPerk(WLD_Perk_Pregnancies_5)
		elseif (INVB_Global_Preggo_Count_Current.getValue() < 5)
			PlayerREF.RemovePerk(WLD_Perk_Pregnancies_5)	
		endif	
	endif
		
	Ourself.setFactionRank(FPFP_Preggo, 0) ; set them to be in preggo faction
EndFunction

Function UnBecomePreggo()
	IsPregnant = False
	Ourself.removeFromFaction(FPFP_Preggo)
	
	Trace("Pregnancy Removed from " + Ourself.GetActorBase().GetName())
EndFunction

Function RemovePerks(Race akDadRace)
	
	if Ourself.HasPerk(WLD_Perk_Viable)
		Ourself.RemovePerk(WLD_Perk_Viable)
	endIf
	
	if Ourself.HasPerk(WLD_Perk_Pregnancy_Freezing)
		Ourself.RemovePerk(WLD_Perk_Pregnancy_Freezing)
	endIf
	
	if FPFP_BabyHandler.FoundtheFather(akDadRace)
		Creature_Perk = FPFP_BabyHandler.WhatsmyPerk(akDadRace)
		
		if FPFP_Global_Creature_Faction.GetValue() <= 2
		;1 = Until Birth - Tainted
		;2 = Until Birth - Friendly
		;3 = Forever - Tainted
		;4 = Forever - Friendly
		
			Creature_Faction = FPFP_BabyHandler.WhatFaction(akDadRace)
			Creature_Faction_Friendly = FPFP_BabyHandler.WhatFaction_Friendly(akDadRace)
			
			
			if Ourself.IsInFaction(Creature_Faction)
				Ourself.removeFromFaction(Creature_Faction)
			endIf
				
			if Ourself.IsInFaction(Creature_Faction_Friendly)
				Ourself.removeFromFaction(Creature_Faction_Friendly)
			endIf

			if Ourself.HasPerk(WLD_Perk_Pheromones)
				Ourself.RemovePerk(WLD_Perk_Pheromones)
			endif
		endIf
		
		if Ourself.HasPerk(Creature_Perk)
			Ourself.RemovePerk(Creature_Perk)
		endif
	endif
	
	
	
	if FPFP_Global_Perks_Father.GetValue() == 1
		if Ourself.HasPerk(WLD_Perk_Impregnated_Player)
			INVB_Global_Preggo_Count_Current.SetValue(INVB_Global_Preggo_Count_Current.getValue() - 1) 
			Ourself.RemovePerk(WLD_Perk_Impregnated_Player)
		elseif Ourself.HasPerk(WLD_Perk_Impregnated)
			Ourself.RemovePerk(WLD_Perk_Impregnated)
		endif
	endif
	
	if FPFP_Global_Perks_Harem.GetValue() == 1
		if INVB_Global_Preggo_Count_Current.getValue() < 5
			PlayerREF.RemovePerk(WLD_Perk_Pregnancies_5)	
		endif
	endif
	
	if FPFP_Global_Perks_Monthly.GetValue() >= 1 && Ourself != NONE	
		Ourself.RemovePerk(WLD_Perk_Month[0])
		Ourself.RemovePerk(WLD_Perk_Month[1])
		Ourself.RemovePerk(WLD_Perk_Month[2])
		Ourself.RemovePerk(WLD_Perk_Month[3])
		Ourself.RemovePerk(WLD_Perk_Month[4])
		Ourself.RemovePerk(WLD_Perk_Month[5])
		Ourself.RemovePerk(WLD_Perk_Month[6])
		Ourself.RemovePerk(WLD_Perk_Month[7])
		Ourself.RemovePerk(WLD_Perk_Month[8])
		Ourself.RemovePerk(WLD_Perk_Month[9])
	endif
EndFunction


Event OnTimerGameTime(int aiTID)
	if !Ourself.HasPerk(WLD_Perk_Pregnancy_Freezing)

		Float Creature_Cycle_new = FPFP_BabyHandler.Howlongismypregnancy(FatherRace)
		if Creature_Cycle != Creature_Cycle_new
			if FatherRace == HumanRace
				Creature_Cycle = FPFP_Global_Length_Human.GetValue()
			elseIf FatherRace == GhoulRace
				Creature_Cycle = FPFP_Global_Length_Ghoul.GetValue()
			else 
				Creature_Cycle = FPFP_BabyHandler.Howlongismypregnancy(FatherRace)
			endIf
		endIf
		
		if Creature_Cycle == 0
			Creature_Cycle = 9
		endIf

		float currentMonth = 0
		if Ourself.HasPerk(WLD_Perk_Breeder) && FPFP_Global_Breeder_Grow.GetValue() == 1
			currentMonth = GetCurrentMonth() + Advanced_Start + Breeder_mod
		else
			currentMonth = GetCurrentMonth() + Advanced_Start
		endif
		
		if FPFP_Global_Notif_Debug_Pregnancy.GetValue() >= 1
			debug.trace("currentMonth for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ currentMonth)
			debug.trace("Creature_Cycle for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Creature_Cycle)
			
			if Creature_Cycle != Creature_Cycle_new
				debug.trace("Creature_Cycle_new for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Creature_Cycle_new)
			endIf
		endIf

		if FPFP_Global_Notif_Debug_Pregnancy.GetValue() == 2
			debug.notification("currentMonth for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ currentMonth)
			debug.notification("Creature_Cycle for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Creature_Cycle)
			
			if Creature_Cycle != Creature_Cycle_new
				debug.notification("Creature_Cycle_new for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Creature_Cycle_new)
			endIf
		endIf

		If Ourself.IsDeleted()
			GiveBirth(false)	
		ElseIf IsPregnant
		
			If currentMonth < Creature_Cycle
				UpdateBody(currentMonth)
						
				if (FPFP_Global_Perks_Monthly.GetValue() >= 1)
					Ourself.RemovePerk(WLD_Perk_Month[0])
					Ourself.RemovePerk(WLD_Perk_Month[1])
					Ourself.RemovePerk(WLD_Perk_Month[2])
					Ourself.RemovePerk(WLD_Perk_Month[3])
					Ourself.RemovePerk(WLD_Perk_Month[4])
					Ourself.RemovePerk(WLD_Perk_Month[5])
					Ourself.RemovePerk(WLD_Perk_Month[6])
					Ourself.RemovePerk(WLD_Perk_Month[7])
					Ourself.RemovePerk(WLD_Perk_Month[8])
					Ourself.RemovePerk(WLD_Perk_Month[9])	
					Ourself.AddPerk(WLD_Perk_Month[currentMonth as int])
					
				endif
			else
				UpdateBody(Creature_Cycle)
				
				if (FPFP_Global_Perks_Monthly.GetValue() >= 1)
					Ourself.RemovePerk(WLD_Perk_Month[0])
					Ourself.RemovePerk(WLD_Perk_Month[1])
					Ourself.RemovePerk(WLD_Perk_Month[2])
					Ourself.RemovePerk(WLD_Perk_Month[3])
					Ourself.RemovePerk(WLD_Perk_Month[4])
					Ourself.RemovePerk(WLD_Perk_Month[5])
					Ourself.RemovePerk(WLD_Perk_Month[6])
					Ourself.RemovePerk(WLD_Perk_Month[7])
					Ourself.RemovePerk(WLD_Perk_Month[8])
					Ourself.RemovePerk(WLD_Perk_Month[9])
					
					if currentMonth == Creature_Cycle
						Ourself.AddPerk(WLD_Perk_Month[Creature_Cycle as int])	
					else
						if Creature_Cycle > 9
							Ourself.AddPerk(WLD_Perk_Month[9])
						else
							Ourself.AddPerk(WLD_Perk_Month[currentMonth as int])
						endIf	
					endif	
				endif
			EndIf
			
			Ourself.SetValue(FPFP_AV_RemainingPregnancy, Creature_Cycle - currentMonth) ;Sets FPFP_AV_RemainingPregnancy to Creature_Cycle
	
			
			If (currentMonth >= (Creature_Cycle - FPFP_Global_LactationMonth.GetValue())) && !Ourself.HasPerk(Game.GetFormFromFile(0x01012358, "INVB_WastelandDairy.esp") as perk) && !Ourself.HasPerk(Game.GetFormFromFile(0x01012359, "INVB_WastelandDairy.esp") as perk) && !Ourself.HasPerk(Game.GetFormFromFile(0x0101235C, "INVB_WastelandDairy.esp") as perk)
				Ourself.EquipItem(Game.GetFormFromFile(0x0101236E, "INVB_WastelandDairy.esp"), abSilent = True)
			endIf
			
			If currentMonth >= (Creature_Cycle / 3)
				Ourself.SetValue(FPFP_AV_PregnancyStage, 2) ;Sets FPFP_AV_PregnancyStage to 2 after a abortion is impossible
			EndIf
			
			If (currentMonth >= (Creature_Cycle / 2)) && !Ourself.HasKeyword(fpfp_PregnancyIssue)
				;SP_Faction_Sorter_Traits.Cast(Ourself, Ourself)
				if (Ourself.HasSpell(SP_Faction_Sorter_Traits))
					Ourself.RemoveSpell(SP_Faction_Sorter_Traits)
					Utility.Wait(2)
				EndIf
				Ourself.AddSpell(SP_Faction_Sorter_Traits, false)
			endIf
			
			if (currentMonth >= (Creature_Cycle - FPFP_Global_ViableMonth.GetValue())) && FPFP_Global_ViableMonth.GetValue() == 1
				bool_viable = true
				Ourself.SetValue(FPFP_AV_PregnancyStage, 3) ;Sets FPFP_AV_PregnancyStage to 3 that it is possible to safely give birth at this stage
			endIf
			
			If (currentMonth > 0) && (currentMonth < Creature_Cycle)
				If FirstCheck
					FirstCheck = False
				EndIf
			ElseIf (currentMonth >= Creature_Cycle) && (FPFP_Global_Current_Births.GetValue() < FPFP_Global_Total_Births.GetValue()) && (FPFP_Global_BirthLimit.GetValue() == 1)
				FPFP_Global_Current_Births.setValue(FPFP_Global_Current_Births.GetValue() + 1)
				Breeder_mod = 0
				
				GiveBirth()
				currentMonth_PP = currentMonth
				
			elseIf currentMonth >= Creature_Cycle && FPFP_Global_Current_Births.GetValue() >= FPFP_Global_Total_Births.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1 && FPFP_Global_Total_Freeze.GetValue() == 1
				Ourself.AddPerk(WLD_Perk_Pregnancy_Freezing)
				Breeder_mod = 0
				Debug.notification("Birth Limit has been reached, Applying Frozen Pregnancy Perk")
			elseIf currentMonth >= Creature_Cycle && FPFP_Global_Current_Births.GetValue() >= FPFP_Global_Total_Births.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1 && FPFP_Global_Total_Freeze.GetValue() == 2
				
				If Utility.RandomFloat(1,4) == 1
					Ourself.AddPerk(WLD_Perk_Birth_Nothing)
				elseIf Utility.RandomFloat(1,4) == 2
					Ourself.AddPerk(WLD_Perk_Birth_Nothing_Infanticide)
				elseIf Utility.RandomFloat(1,4) == 3
					Ourself.AddPerk(WLD_Perk_Birth_Nothing_Mutated)
				elseIf Utility.RandomFloat(1,4) == 4
					Ourself.AddPerk(WLD_Perk_Birth_Nothing_Phantom)
				endIf
				
				Breeder_mod = 0
				Debug.notification("Birth Limit has been reached, Applying Nothing Perk(No Baby)")	
			elseIf currentMonth >= Creature_Cycle && FPFP_Global_Current_Births.GetValue() >= FPFP_Global_Total_Births.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1 && FPFP_Global_Total_Freeze.GetValue() == 3
				Breeder_mod = 0
				FPFP_Surrogate.Surrogate(false, Ourself, FatherRace, NumChildren)
				currentMonth_PP = currentMonth
			elseIf currentMonth >= Creature_Cycle && FPFP_Global_Current_Births.GetValue() >= FPFP_Global_Total_Births.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1 && FPFP_Global_Total_Freeze.GetValue() == 4
				Breeder_mod = 0
				FPFP_BabyHandler.AddBaby_nongrowing(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
				currentMonth_PP = currentMonth
			ElseIf currentMonth >= Creature_Cycle && FPFP_Global_BirthLimit.GetValue() == 0
				Breeder_mod = 0
				GiveBirth()
				currentMonth_PP = currentMonth
			EndIf
			
		ElseIf IsPostPartum
			Random_Morph = 1
			
			if currentMonth_PP > 0
				currentMonth_PP = currentMonth_PP - (FPFP_Global_PostPartum_Power.GetValue() / (FPFP_Global_Day.GetValue() / FPFP_Global_PostPartum_Time.GetValue()))
			endif
			
			float total_Sum = currentMonth_PP - (FPFP_Global_PostPartum_Power.GetValue() / (FPFP_Global_Day.GetValue() * 2))
			
			if FPFP_Global_Notif_Debug_Pregnancy.GetValue() >= 1
				debug.trace("currentMonth(PostPartum) for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ currentMonth_PP)
				Debug.Trace("The total is "+ total_Sum)
				debug.trace("BirthDate for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ BirthDate)
				debug.trace("IsPostPartum for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ IsPostPartum)
				debug.trace("NumChildren(Used for Belly size) for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ NumChildren)
			endIf
			
			if FPFP_Global_Notif_Debug_Pregnancy.GetValue() == 2
				debug.notification("currentMonth(PostPartum) for "+Ourself.GetLeveledActorBase().GetName() +"("+PlayerREF+") is "+ currentMonth_PP)
				Debug.notification("The total is "+ total_Sum)
				debug.notification("BirthDate for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ BirthDate)
				debug.notification("IsPostPartum for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ IsPostPartum)
				debug.notification("NumChildren(Used for Belly size) for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ NumChildren)
			endIf
			
			UpdateBody(currentMonth_PP)
			
			If (currentMonth_PP <= FPFP_Global_PostPartum_Minimum.GetValue()) 
				FinishPostPartum()
			EndIf
		Endif
		
		If IsPregnant ; If we're still pregnant, start a new timer
			if Ourself.HasPerk(WLD_Perk_Breeder) && FPFP_Global_Breeder_Grow.GetValue() == 1
				Breeder_mod += 1
				StartTimerGameTime(FPE.GetUpdateTime_Breeder())
			else
				StartTimerGameTime(FPE.GetUpdateTime())
			endif
		ElseIf IsPostPartum	
			StartTimerGameTime(FPE.GetUpdateTime_PostPartum())
		EndIf
	else
		StartTimerGameTime(FPE.GetUpdateTime())
	EndIf	
EndEvent

Float Function GetCurrentMonth()
	Return ((Utility.GetCurrentGameTime() - IncepDate) / FPFP_Global_Day.GetValue())
EndFunction

Float Function GetCurrentMonth_PP()
	Return ((Utility.GetCurrentGameTime() - BirthDate) / FPFP_Global_Day.GetValue())
EndFunction

Bool Function GiveBirth_Multi()

	if FPFP_Global_BNotif.GetValue() == 1
		Debug.notification("Giving Birth to the first of many.")
	endIf
	
	if FPFP_Global_BloodyBirth.GetValue() == 1
		SP_BloodyBirth.Cast(Ourself, Ourself)
	endif
	if FPFP_Surrogate.CheckPerk(Ourself)
		FPFP_Surrogate.Surrogate(false, Ourself, FatherRace, NumChildren)	
	else
		if FPFP_NonGrowingBaby.NonGrowingBaby(Ourself) == 2
			FPFP_BabyHandler.AddBaby_dead(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
		elseif FPFP_NonGrowingBaby.NonGrowingBaby(Ourself) == 1
			FPFP_BabyHandler.AddBaby_nongrowing(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
		elseif FPFP_NonGrowingBaby.NonGrowingBaby(Ourself) == 0
			FPFP_BabyHandler.AddBaby(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
		endIf
	Endif
EndFunction

Bool Function GiveBirth(bool akBirth = True) 
	if Ourself.GetValue(FPFP_AV_PregnancyStage) >= 3
		Ourself.SetValue(FPFP_AV_PregnancyStage, 0) ;Sets FPFP_AV_PregnancyStage to 0
		Ourself.SetValue(FPFP_AV_RemainingPregnancy, 0) ;Sets FPFP_AV_RemainingPregnancy to 0
		
		if FPFP_Global_UndresswhenBirth.GetValue() == 2
			if Ourself.IsEquipped(Pipboy)
				Ourself.unequipall()
				Ourself.EquipItem(Pipboy, false, true)
			else
				Ourself.unequipall()		
			endIf
		endIf
		
		RemovePerks(FatherRace)
		
		FPFP_ActorValuePerker.BirthCounter(Ourself, FatherRace)
		
		UnBecomePreggo()
		
		
		If !Ourself.HasPerk(Game.GetFormFromFile(0x01012358, "INVB_WastelandDairy.esp") as perk) && !Ourself.HasPerk(Game.GetFormFromFile(0x01012359, "INVB_WastelandDairy.esp") as perk) && !Ourself.HasPerk(Game.GetFormFromFile(0x0101235C, "INVB_WastelandDairy.esp") as perk)
			Ourself.EquipItem(Game.GetFormFromFile(0x0101236E, "INVB_WastelandDairy.esp"), abSilent = True)
		endIf
		
		if FPFP_Global_BloodyBirth.GetValue() == 1
			SP_BloodyBirth.Cast(Ourself, Ourself)
		endif
		
		If !Ourself.IsDead() && Ourself.GetDistance(PlayerRef) < 1024.000 && akBirth == true
			FPFP_Messages.BirthMessage(Ourself, FatherRace)
		EndIf
		
		if FPFP_Surrogate.CheckPerk(Ourself)
			FPFP_Surrogate.Surrogate(true, Ourself, FatherRace, NumChildren)
		elseIf Ourself.HasPerk(WLD_Perk_Birth_Nothing) || Ourself.HasPerk(WLD_Perk_Birth_Nothing_Infanticide) || Ourself.HasPerk(WLD_Perk_Birth_Nothing_Mutated) || Ourself.HasPerk(WLD_Perk_Birth_Nothing_Phantom)
			;Nothing Here
			if FPFP_Global_Notif_Debug_Birth.GetValue() >= 1
				If Ourself.HasPerk(WLD_Perk_Birth_Nothing)
					debug.trace(Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") has WLD_Perk_Birth_Nothing")
				elseIf Ourself.HasPerk(WLD_Perk_Birth_Nothing_Infanticide)
					debug.trace(Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") has WLD_Perk_Birth_Nothing_Infanticide")
				elseIf Ourself.HasPerk(WLD_Perk_Birth_Nothing_Mutated)
					debug.trace(Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") has WLD_Perk_Birth_Nothing_Mutated")
				elseIf Ourself.HasPerk(WLD_Perk_Birth_Nothing_Phantom)
					debug.trace(Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") has WLD_Perk_Birth_Nothing_Phantom")
				endif
			endIf
			
			if FPFP_Global_Notif_Debug_Birth.GetValue() == 2
				If Ourself.HasPerk(WLD_Perk_Birth_Nothing)
					debug.notification(Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") has WLD_Perk_Birth_Nothing")
				elseIf Ourself.HasPerk(WLD_Perk_Birth_Nothing_Infanticide)
					debug.notification(Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") has WLD_Perk_Birth_Nothing_Infanticide")
				elseIf Ourself.HasPerk(WLD_Perk_Birth_Nothing_Mutated)
					debug.notification(Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") has WLD_Perk_Birth_Nothing_Mutated")
				elseIf Ourself.HasPerk(WLD_Perk_Birth_Nothing_Phantom)
					debug.notification(Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") has WLD_Perk_Birth_Nothing_Phantom")
				endif
			endIf
			
		elseIf Ourself.HasPerk(WLD_Perk_Birth_PoorLifestyle)
			if (Utility.RandomInt(1, 100) <= FPFP_Global_ViableMonth_Chance.GetValue())
			
				if FPFP_NonGrowingBaby.NonGrowingBaby(Ourself) == 2
					FPFP_BabyHandler.AddBaby_dead(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
				elseif FPFP_NonGrowingBaby.NonGrowingBaby(Ourself) == 1
					FPFP_BabyHandler.AddBaby_nongrowing(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
				elseif FPFP_NonGrowingBaby.NonGrowingBaby(Ourself) == 0
					FPFP_BabyHandler.AddBaby(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
				endIf
				
			else
				FPFP_BabyHandler.AddBaby_dead(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
			endIf
		elseIf Ourself.HasPerk(WLD_Perk_Birth_Stillborn)
		
			if FPFP_Global_Notif_Debug_Birth.GetValue() >= 1
				debug.trace("Stillborn for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+")")
			endIf
		
			if FPFP_Global_Notif_Debug_Birth.GetValue() == 2
				debug.notification("Stillborn for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+")")
			endIf
		elseIf akBirth == true
			if FPFP_NonGrowingBaby.NonGrowingBaby(Ourself) == 2
				FPFP_BabyHandler.AddBaby_dead(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
			elseif FPFP_NonGrowingBaby.NonGrowingBaby(Ourself) == 1
				FPFP_BabyHandler.AddBaby_nongrowing(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
			elseif FPFP_NonGrowingBaby.NonGrowingBaby(Ourself) == 0
				FPFP_BabyHandler.AddBaby(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
			endIf
		elseIf akBirth == false && bool_viable == true && FPFP_Global_ViableMonth.GetValue() == 1
			int random_LList_Viable = Utility.RandomInt(1, 100)
			
			if FPFP_Global_ViableMonth_Perk.GetValue() == 1
				If PlayerREF.HasPerk(Medic04)
					if FPFP_NonGrowingBaby.NonGrowingBaby(Ourself) == 2
						FPFP_BabyHandler.AddBaby_dead(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
					elseif FPFP_NonGrowingBaby.NonGrowingBaby(Ourself) == 1
						FPFP_BabyHandler.AddBaby_nongrowing(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
					elseif FPFP_NonGrowingBaby.NonGrowingBaby(Ourself) == 0
						FPFP_BabyHandler.AddBaby(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
					endIf
				elseIf PlayerREF.HasPerk(Medic03)
					if (random_LList_Viable <= FPFP_Global_ViableMonth_Chance.GetValue())
						if FPFP_NonGrowingBaby.NonGrowingBaby(Ourself) == 2
							FPFP_BabyHandler.AddBaby_dead(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
						elseif FPFP_NonGrowingBaby.NonGrowingBaby(Ourself) == 1
							FPFP_BabyHandler.AddBaby_nongrowing(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
						elseif FPFP_NonGrowingBaby.NonGrowingBaby(Ourself) == 0
							FPFP_BabyHandler.AddBaby(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
						endIf
					else
						FPFP_BabyHandler.AddBaby_dead(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
					endIf
				elseIf PlayerREF.HasPerk(Medic01) || PlayerREF.HasPerk(Medic02)
					if (random_LList_Viable <= FPFP_Global_ViableMonth_Chance.GetValue())
						FPFP_BabyHandler.AddBaby_dead(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing	
					endIf	
				endIf	
			else
				if (random_LList_Viable <= FPFP_Global_ViableMonth_Chance.GetValue())
					FPFP_BabyHandler.AddBaby_dead(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing	
				endIf
			endIf
			
		Endif
		
		Ourself.removeFromFaction(FPFP_Preggo)
		
		if FPFP_Global_PostPartum.GetValue() < 2
			BirthDate = -1.0
			NumChildren = 0 ; All children evac'd
			FatherRace = NONE
			
			if FPFP_Global_PostBirth.GetValue() == 1 ;if active(see global then there will be a period of infertility)
				SP_Infertile.Cast(Ourself, Ourself)
			endif
			
		elseif FPFP_Global_PostPartum.GetValue() == 2 && akBirth == true && Ourself.GetDistance(PlayerRef) < 1024.000
			BirthDate = Utility.GetCurrentGameTime()
			IsPostPartum = true
			
			if FPFP_Global_PostPartum_NPC.GetValue() == 1
				Ourself.AddPerk(WLD_Perk_PostPartum)
			endif
			
			NumChildren = 1
			Random_Morph = 1
		elseif FPFP_Global_PostPartum.GetValue() == 3 && akBirth == true
			BirthDate = Utility.GetCurrentGameTime()
			IsPostPartum = true
			
			if FPFP_Global_PostPartum_NPC.GetValue() == 1
				Ourself.AddPerk(WLD_Perk_PostPartum)
			endif
			
			NumChildren = 1
			Random_Morph = 1
		endIf
		
		
		IncepDate = -1.0
		
		If !Ourself.IsDead() && FPFP_Global_PostPartum.GetValue() < 2
			FatherRace = NONE
			DetermineBodyAfterBirth()
		EndIf
		
		If akBirth
			FPE.AnnounceBirth(Ourself)
		EndIf
		
		FPE.SendBirthEvent(Ourself, akBirth)
		
		If (!Ourself.Is3DLoaded() || Ourself.IsDeleted()) && FPFP_Global_PostPartum.GetValue() < 2  ; we must check that we are unloaded so that we can remove our data. After all, there's no need for pregnancy data if there's no real data to store on an unloaded npc
			Uninitialize()
		EndIf
		
		Return akBirth
		
	elseif Ourself.GetValue(FPFP_AV_PregnancyStage) >= 1
		Ourself.SetValue(FPFP_AV_PregnancyStage, 0) ;Sets FPFP_AV_PregnancyStage to 0
		Ourself.SetValue(FPFP_AV_RemainingPregnancy, 0) ;Sets FPFP_AV_RemainingPregnancy to 0
		
		RemovePerks(FatherRace)
		
		UnBecomePreggo()
		
		Ourself.removeFromFaction(FPFP_Preggo)
		IncepDate = -1.0
		
		If !Ourself.IsDead()
			FatherRace = NONE
			DetermineBodyAfterBirth()
		EndIf
		
		FPE.SendBirthEvent(Ourself, akBirth)
		
		If (!Ourself.Is3DLoaded() || Ourself.IsDeleted()) && FPFP_Global_PostPartum.GetValue() < 2  ; we must check that we are unloaded so that we can remove our data. After all, there's no need for pregnancy data if there's no real data to store on an unloaded npc
			Uninitialize()
		EndIf
		
		Return akBirth
		
	endIf
			

EndFunction



Function FinishPostPartum() 

	IsPostPartum = false
	currentMonth_PP = 0
	If !Ourself.IsDead()
		DetermineBodyAfterBirth()
	EndIf
	BirthDate = -1.0
	NumChildren = 0 ; All children evac'd
	FatherRace = NONE
	
	Ourself.RemovePerk(WLD_Perk_PostPartum)
	Ourself.removeFromFaction(FPFP_Preggo)
	
	if FPFP_Global_PostPartum_Post.GetValue() == 2
		SP_Infertile.Cast(Ourself, Ourself)
	endif
	
	If !Ourself.Is3DLoaded() || Ourself.IsDeleted() ; we must check that we are unloaded so that we can remove our data. After all, there's no need for pregnancy data if there's no real data to store on an unloaded npc
		Uninitialize()
	EndIf

EndFunction

; Visuals handling

Function GetOriginalMorphs()
	Bool isFemale = (Ourself.GetLeveledActorBase().GetSex() == 1)
	
	OrigMorphNames = BodyGen.GetMorphs(Ourself, isFemale)
	If (OrigMorphNames.Length)
		OrigMorphValues = New Float[OrigMorphNames.Length]
		int i = 0
		While (i < OrigMorphNames.Length)
			Keyword[] MorphKeywords = BodyGen.GetKeywords(Ourself, isFemale, OrigMorphNames[i])
			Keyword MyKeyword = None
			If (MorphKeywords.Length)
				MyKeyword = MorphKeywords[MorphKeywords.Length - 1] ; always get the last keyword 
			EndIf
			
			OrigMorphValues[i] = BodyGen.GetMorph(Ourself, isFemale, OrigMorphNames[i], MyKeyword)
			;Trace(Ourself.GetLeveledActorBase().GetName() + " found morph " + OrigMorphNames[i] + " value " + OrigMorphValues[i] + " keyword " + MyKeyword)
			i += 1
		EndWhile
	EndIf
EndFunction

Float Function OrigValue(String MorphName)
	If FPFP_Global_FuckifIKnow.GetValue() == 1
		If (OrigMorphNames.Length)
			int idx = OrigMorphNames.Find(MorphName)
			If (idx > -1)
				;Trace(Ourself.GetLeveledActorBase().GetName() + " found morph " + MorphName + " value " + OrigMorphValues[idx])
				;Return OrigMorphValues[idx]
			EndIf
		EndIf
		
		Return 0.0
	Else
		Return 0.0
	EndIf
EndFunction

Function UpdateBody(Float akMonth)
	AffectedByMorphs = True
	If Ourself.GetLeveledActorBase().GetSex() != 1
	
		If (FPFP_Global_MaleBodyType.GetValue() == 0)	; male body with no morphs
			ActorBase:BodyWeight newWeight = Ourself.GetLeveledActorBase().GetBodyWeight()
			
			If FirstCheck ; first check on our pregnancy, so we set up our actor values to store what they originally were before we update
				OriginalThin = newWeight.thin
				OriginalThicc = newWeight.large
				OriginalMuscular = newWeight.muscular
			EndIf
			
			newWeight.large = OriginalThicc + ((1 - OriginalThicc) * (akMonth)/10.0 )
			float ratio = 0.0
			
			If OriginalThin + OriginalMuscular > 0 ; Make sure the divisors aren't zero.
				ratio = (1 - newWeight.large) / (OriginalThin + OriginalMuscular)
			EndIf
			
			newWeight.thin = OriginalThin * ratio
			newWeight.muscular = OriginalMuscular * ratio
			Ourself.GetLeveledActorBase().SetBodyWeight(newWeight)
			Ourself.QueueUpdate(flags = 0xC)
		Else ; male body that can morph
		
			If FirstCheck
				GetOriginalMorphs()
			EndIf
			
			
			float power = (akMonth * FPFP_Global_Power.getValue() * Creature_Morph * 0.015 * Random_Morph) * Math.Sqrt(NumChildren)
						
			BodyGen.SetMorph(Ourself, false, "Mpreg", FPFP_Keyword, power + OrigValue("Mpreg"))
			BodyGen.UpdateMorphs(Ourself)
			Trace("Updating morphs, month " + akMonth + " OrigValue " + OrigValue("Mpreg") + " NewValue " +  power + OrigValue("Mpreg"))
		EndIf
		
	Else
		If FirstCheck
			GetOriginalMorphs()
		EndIf
	
		float power = (akMonth * FPFP_Global_Power.getValue() * Creature_Morph * 0.015 * Random_Morph) * Math.Sqrt(NumChildren)
		float maxMorphValue = FPFP_Global_Power.getValue() / 5.0
		
		if FPFP_Global_Notif_Debug_Pregnancy.GetValue() >= 1
			debug.trace("akMonth for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ akMonth)
			debug.trace("Random_Morph for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Random_Morph)
			debug.trace("power for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ power)
			debug.trace("OrigValue(PregnancyBelly) for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ OrigValue("PregnancyBelly"))
			debug.trace("(power + OrigValue(PregnancyBelly))equal for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ (power + OrigValue("PregnancyBelly")))
			debug.trace("maxMorphValue for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ maxMorphValue)
			
		endIf
		
		if FPFP_Global_Notif_Debug_Pregnancy.GetValue() == 2
			debug.notification("akMonth for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ akMonth)
			debug.notification("Random_Morph for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Random_Morph)
			debug.notification("power for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ power)
			debug.notification("OrigValue(PregnancyBelly) for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ OrigValue("PregnancyBelly"))
			debug.notification("(power + OrigValue(PregnancyBelly))equal for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ (power + OrigValue("PregnancyBelly")))
			debug.notification("maxMorphValue for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ maxMorphValue)
			
		endIf
		
		If (FPFP_Global_BodyType_CBBE.GetValue() == 0) ; CBBE Original
			BodyGen.SetMorph(Ourself, true, "PregnancyBelly", FPFP_Keyword, power + OrigValue("PregnancyBelly"))
			BodyGen.SetMorph(Ourself, true, "DoubleMelon", FPFP_Keyword, (power/2) + OrigValue("DoubleMelon"))
			BodyGen.SetMorph(Ourself, true, "BigButt", FPFP_Keyword, Math.Min((power/2) + OrigValue("BigButt"), maxMorphValue))
		ElseIf (FPFP_Global_BodyType_CBBE.GetValue() == 1) ; CBBE Redux
            BodyGen.SetMorph(Ourself, true, "Breasts", FPFP_Keyword, power*0.9 + OrigValue("Breasts"))
            BodyGen.SetMorph(Ourself, true, "BreastsNewSH", FPFP_Keyword, power*0.2 + OrigValue("BreastsNewSH"))
            BodyGen.SetMorph(Ourself, true, "BreastFantasy", FPFP_Keyword, power*0.25 + OrigValue("BreastFantasy"))
            BodyGen.SetMorph(Ourself, true, "NippleLength", FPFP_Keyword, power*0.58 + OrigValue("NippleLength"))
            BodyGen.SetMorph(Ourself, true, "NipplePerk2", FPFP_Keyword, power*0.5 + OrigValue("NipplePerk2"))
            BodyGen.SetMorph(Ourself, true, "AppleCheeks", FPFP_Keyword, power*0.4 + OrigValue("AppleCheeks"))
            BodyGen.SetMorph(Ourself, true, "Butt", FPFP_Keyword, power*0.45 + OrigValue("Butt"))
            BodyGen.SetMorph(Ourself, true, "BreastWidth", FPFP_Keyword, power*0.5 + OrigValue("BreastWidth"))
            BodyGen.SetMorph(Ourself, true, "ChubbyLegs", FPFP_Keyword, power*0.23 + OrigValue("ChubbyLegs"))
            BodyGen.SetMorph(Ourself, true, "Giant belly (coldsteelj)", FPFP_Keyword, power*0.8 + OrigValue("Giant belly (coldsteelj)"))
            BodyGen.SetMorph(Ourself, true, "PregnancyBelly", FPFP_Keyword, power*0.35 + OrigValue("PregnancyBelly"))
            BodyGen.SetMorph(Ourself, true, "Giant belly up", FPFP_Keyword, power*0.4 + OrigValue("Giant belly up"))
            BodyGen.SetMorph(Ourself, true, "ButtSmall", FPFP_Keyword, power*-0.4 + OrigValue("ButtSmall"))
            BodyGen.SetMorph(Ourself, true, "BreastHeight", FPFP_Keyword, power*0.55 + OrigValue("BreastHeight"))
            BodyGen.SetMorph(Ourself, true, "BreastGravity2", FPFP_Keyword, power*-0.5 + OrigValue("BreastGravity2")) 
		else
			BodyGen.SetMorph(Ourself, true, "PregnancyBelly", FPFP_Keyword, power + OrigValue("PregnancyBelly"))
		endIf
		If (FPFP_Global_BodyType_FG.GetValue() == 0) ; Fusion Girl Original
			BodyGen.SetMorph(Ourself, true, "Belly Pregnant", FPFP_Keyword, power + OrigValue("Belly Pregnant"))
			BodyGen.SetMorph(Ourself, true, "Boobs Yuge", FPFP_Keyword, (power/2) + OrigValue("Boobs Yuge"))
			BodyGen.SetMorph(Ourself, true, "Bum Chubby", FPFP_Keyword, Math.Min((power/2) + OrigValue("Bum Chubby"), maxMorphValue))
			BodyGen.SetMorph(Ourself, true, "Waist Size", FPFP_Keyword, Math.Min((power/2) + OrigValue("Waist Size"), maxMorphValue))
			BodyGen.SetMorph(Ourself, true, "Waist Line", FPFP_Keyword, Math.Min(power/2 + OrigValue("Waist Line"), maxMorphValue))
			BodyGen.SetMorph(Ourself, true, "Back Size", FPFP_Keyword, Math.Min(power/2 + OrigValue("Back Size"), maxMorphValue))
			BodyGen.SetMorph(Ourself, true, "Back Arch", FPFP_Keyword, Math.Min((power/2) + OrigValue("Back Arch"), maxMorphValue))
			BodyGen.SetMorph(Ourself, true, "Boobs Top Slope", FPFP_Keyword, Math.Min((power/2) + OrigValue("Boobs Top Slope"), maxMorphValue))
			BodyGen.SetMorph(Ourself, true, "Hips Upper Width", FPFP_Keyword, Math.Min((power/4) + OrigValue("Hips Upper Width"), maxMorphValue))
			BodyGen.SetMorph(Ourself, true, "Hips Size", FPFP_Keyword, Math.Min((power/2) + OrigValue("Hips Size"), maxMorphValue))
			BodyGen.SetMorph(Ourself, true, "Legs Chubby", FPFP_Keyword, Math.Min((power/2) + OrigValue("Legs Chubby"), maxMorphValue))
			BodyGen.SetMorph(Ourself, true, "Arms Chubby", FPFP_Keyword, Math.Min((power/2) + OrigValue("Arms Chubby"), maxMorphValue))	
		ElseIf (FPFP_Global_BodyType_FG.GetValue() == 1) ; Fusion Girl Redux
			bodygen.SetMorph(Ourself, True, "Belly Pregnant", FPFP_Keyword, power + Self.OrigValue("Belly Pregnant"))
			bodygen.SetMorph(Ourself, True, "Boobs Yuge", FPFP_Keyword, power / 2 as float + Self.OrigValue("Boobs Yuge"))
			bodygen.SetMorph(Ourself, True, "Boobs Tiny", FPFP_Keyword, power / (-4) as float + Self.OrigValue("Boobs Tiny"))
			bodygen.SetMorph(Ourself, True, "Boobs Flat", FPFP_Keyword, power / (-4) as float + Self.OrigValue("Boobs Flat"))
			BodyGen.SetMorph(Ourself, true, "Bum Chubby", FPFP_Keyword, Math.Min((power/2) + OrigValue("Bum Chubby"), maxMorphValue))
			BodyGen.SetMorph(Ourself, true, "Waist Size", FPFP_Keyword, Math.Min((power/4) + OrigValue("Waist Size"), maxMorphValue))
			BodyGen.SetMorph(Ourself, true, "Waist Line", FPFP_Keyword, Math.Min(power/4 + OrigValue("Waist Line"), maxMorphValue))
			BodyGen.SetMorph(Ourself, true, "Back Size", FPFP_Keyword, Math.Min(power/4 + OrigValue("Back Size"), maxMorphValue))
			BodyGen.SetMorph(Ourself, true, "Back Arch", FPFP_Keyword, Math.Min((power/4) + OrigValue("Back Arch"), maxMorphValue))
			BodyGen.SetMorph(Ourself, true, "Boobs Top Slope", FPFP_Keyword, Math.Min((power/4) + OrigValue("Boobs Top Slope"), maxMorphValue))
			BodyGen.SetMorph(Ourself, true, "Hips Upper Width", FPFP_Keyword, Math.Min((power/4) + OrigValue("Hips Upper Width"), maxMorphValue))
			BodyGen.SetMorph(Ourself, true, "Hips Size", FPFP_Keyword, Math.Min((power/4) + OrigValue("Hips Size"), maxMorphValue))
			BodyGen.SetMorph(Ourself, true, "Legs Chubby", FPFP_Keyword, Math.Min((power/4) + OrigValue("Legs Chubby"), maxMorphValue))
			BodyGen.SetMorph(Ourself, true, "Arms Chubby", FPFP_Keyword, Math.Min((power/4) + OrigValue("Arms Chubby"), maxMorphValue))		
		Else
			bodygen.SetMorph(Ourself, True, "Belly Pregnant", FPFP_Keyword, power + Self.OrigValue("Belly Pregnant"))
		endIf
		; JaneBod
			BodyGen.SetMorph(Ourself, true, "BreastsNaturalTypeSeven", FPFP_Keyword, (power/2) + OrigValue("BreastsNaturalTypeSeven"))
			BodyGen.SetMorph(Ourself, true, "BreastSize",FPFP_Keyword, (power/2) + OrigValue("BreastSize"))
			BodyGen.SetMorph(Ourself, true, "NippleShapeLargerSeven", FPFP_Keyword, (power/2) + OrigValue("NippleShapeLargerSeven"))
			BodyGen.SetMorph(Ourself, true, "WaistWidth", FPFP_Keyword, (power/2) + OrigValue("WaistWidth"))
			BodyGen.SetMorph(Ourself, true, "WaistDepthOut", FPFP_Keyword, (power/2) + OrigValue("WaistDepthOut"))
			BodyGen.SetMorph(Ourself, true, "LoveHandles", FPFP_Keyword, (power/2) + OrigValue("LoveHandles"))
			BodyGen.SetMorph(Ourself, true, "CheekWider", FPFP_Keyword, (power/2) + OrigValue("CheekWider"))
			BodyGen.SetMorph(Ourself, true, "GluteLowerFatOut", FPFP_Keyword, power/2 + OrigValue("GluteLowerFatOut"))
			BodyGen.SetMorph(Ourself, true, "GluteLowerHeightDown", FPFP_Keyword, power/4 + OrigValue("GluteLowerHeightDown"))
			BodyGen.SetMorph(Ourself, true, "HipFatter", FPFP_Keyword, (power/2) + OrigValue("HipFatter"))
			BodyGen.SetMorph(Ourself, true, "ThighSize", FPFP_Keyword, (power/2) + OrigValue("ThighSize"))
			BodyGen.SetMorph(Ourself, true, "UpperArmSize", FPFP_Keyword, (power/2) + OrigValue("UpperArmSize"))
			BodyGen.SetMorph(Ourself, true, "Pregnant", FPFP_Keyword, (power) + OrigValue("Pregnant"))
		BodyGen.UpdateMorphs(Ourself)
	EndIf
EndFunction

Function DetermineBodyAfterBirth()

	If FPFP_Global_LastingMorphs.GetValue() == 0.0
		ResetBody()
	Else
		ReduceBelly()
	EndIf
	
EndFunction

Function ReduceBelly()
	If Ourself.GetLeveledActorBase().GetSex() != 1 
		If (FPFP_Global_MaleBodyType.GetValue() == 0)
			If OriginalThin != 0.0 || OriginalThicc != 0.0 || OriginalMuscular != 0.0 ; if we have values for preggo return to normalcy
				ActorBase:BodyWeight newWeight = new ActorBase:BodyWeight
				newWeight.large = OriginalThicc
				newWeight.thin = OriginalThin
				newWeight.muscular = OriginalMuscular
				Ourself.GetLeveledActorBase().SetBodyWeight(newWeight)
				;Ourself.QueueUpdate(False, 12)
				Ourself.QueueUpdate(flags = 0xC)
			EndIf
		Else
			BodyGen.SetMorph(Ourself, false, "Mpreg", FPFP_Keyword, Utility.RandomFloat(0,0.15) + OrigValue("Mpreg"))
			BodyGen.UpdateMorphs(Ourself)
		EndIf
	Else
		BodyGen.SetMorph(Ourself, true, "PregnancyBelly", FPFP_Keyword, Utility.RandomFloat(0,0.15) + OrigValue("PregnancyBelly"))
		BodyGen.SetMorph(Ourself, true, "DoubleMelon", FPFP_Keyword, (BodyGen.getMorph(Ourself, true, "DoubleMelon", FPFP_Keyword) * Utility.RandomFloat(1.1,1.5)))
		BodyGen.SetMorph(Ourself, true, "Belly Pregnant", FPFP_Keyword, Utility.RandomFloat(0,0.15)  + OrigValue("Belly Pregnant"))
		BodyGen.SetMorph(Ourself, true, "Boobs Yuge", FPFP_Keyword, (BodyGen.getMorph(Ourself, true, "Boobs Yuge", FPFP_Keyword) * Utility.RandomFloat(1.1,1.5)))
		BodyGen.SetMorph(Ourself, true, "Pregnant", FPFP_Keyword, Utility.RandomFloat(0,0.15) + OrigValue("Pregnant"))
		BodyGen.SetMorph(Ourself, true, "BreastSize", FPFP_Keyword, (BodyGen.getMorph(Ourself, true, "Boobs Yuge", FPFP_Keyword) * Utility.RandomFloat(1.1,1.5)))
		BodyGen.UpdateMorphs(Ourself)
	EndIf
EndFunction

Function ResetBody()
		
	If (Ourself.GetLeveledActorBase().GetSex() != 1)
		If (FPFP_Global_MaleBodyType.GetValue() == 0)
			If OriginalThin != 0.0 || OriginalThicc != 0.0 || OriginalMuscular != 0.0 ; if we have values for preggo return to normalcy
				ActorBase:BodyWeight newWeight = new ActorBase:BodyWeight
				newWeight.large = OriginalThicc
				newWeight.thin = OriginalThin
				newWeight.muscular = OriginalMuscular
				Ourself.GetLeveledActorBase().SetBodyWeight(newWeight)
				Ourself.QueueUpdate(flags = 0xC)
			EndIf
		Else
			BodyGen.RemoveMorphsByKeyword(Ourself, false, FPFP_Keyword)
			BodyGen.UpdateMorphs(Ourself)
		EndIf
	Else
		BodyGen.RemoveMorphsByKeyword(Ourself, true, FPFP_Keyword)
		BodyGen.UpdateMorphs(Ourself)
	EndIf
	
	AffectedByMorphs = False
	
EndFunction

; Technical handling

Event FPFP_Player_Script.DoUpdate(FPFP_Player_Script akSender, Var[] akVars)

	;... Update code goes here
	Trace("Doing Update")
	int lastVer = akVars[0] as Int
	
	LoadFP()
	
	if lastVer < 2100
		RegisterForCustomEvent(FPE,"DoCleaning")
	EndIf

EndEvent

Event FPFP_Player_Script.DoCleaning(FPFP_Player_Script akSender, Var[] akVars)
	
	Trace("Doing cleaning")
	
	If !Ourself || Ourself.IsDeleted()
		Uninitialize()
	EndIf

EndEvent

Event FPFP_Player_Script.DoReset(FPFP_Player_Script akSender, Var[] akVars)
	
	Trace("Doing reset")
	
	Uninitialize(TRUE)

EndEvent

Event FPFP_Player_Script.SendBasePreg(FPFP_Player_Script akSender, Var[] akVars); We want to send our information over to the FPE quest so it can be read by other mods
	If akVars[0] as Actor == Ourself
		FPE.I_SendBackBasePreg(self as FPFP_BasePregData)
	EndIf
EndEvent

Event FPFP_Player_Script.DebugDataDump(FPFP_Player_Script akSender, Var[] akVars); We want to send our information over to the FPE quest so it can be read by other mods
	TraceDataDump()
EndEvent

Function TraceDataDump()

	string theMessage
	
	theMessage += "IsPregnant: " + IsPregnant + " | "
	theMessage += "IncepDate: " + IncepDate + " | "
	theMessage += "FatherRace: " + FatherRace + " | "
	theMessage += "NumChildren: " + NumChildren + " | "
	;theMessage += "Four-Play: " + (four_play_event != NONE)
	theMessage += "AAF: " + (AAF_Events != NONE)
	
	Trace(theMessage)
	
EndFunction

Event ObjectReference.OnUnload(ObjectReference akSender)

	Trace("Unloaded actor") 

	If !IsPregnant || Ourself.IsDeleted()
		
		Uninitialize()
	
	EndIf

EndEvent

Event Actor.OnDying(Actor akSender, Actor akKiller)

	Trace("Actor has died")
	
	If IsPregnant
	
		GiveBirth(False)
		
	EndIf
	
	Uninitialize()

EndEvent

Function Uninitialize(Bool abFPEReset = FALSE) 
	Utility.wait(1)
	UnregisterForAllEvents()

	Trace("Uninitializing")

	If Ourself
	
		If IsPregnant
			UnBecomePreggo()
		EndIf
		
		If AffectedByMorphs && abFPEReset ; If this npc was affected by morphs, AND we're doing a reset. This means that preggo or no and having residual morphs, body resets only happen during reset.
			ResetBody()
		EndIf
		
		Ourself.RemoveKeyword(FPFP_HasData)
		Ourself = NONE
		
	EndIf

	FPE.RemoveFromDataList(self)
	Utility.wait(1)
	Delete()

EndFunction

Function Trace(String theText, Bool forceLog = FALSE)

	Debug.TraceConditional("FPE "+self+" holding actor "+Ourself+" | "+theText, forceLog || FPFP_Global_Verbose.GetValue() )

EndFunction
