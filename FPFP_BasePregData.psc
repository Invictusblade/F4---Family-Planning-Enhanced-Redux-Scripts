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
Potion property FPFP_Fertile Auto Const Mandatory
Potion property FPFP_Pill Auto Const Mandatory
MagicEffect property FPFP_ME_Pill auto const Mandatory
MagicEffect property FPFP_ME_Fertile auto const Mandatory
Armor property FPFP_Condom auto const Mandatory
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
GlobalVariable property FPFP_Global_Cumflation_Notif_boolean Auto Const Mandatory
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

Float Creature_Morph
Float Creature_Cycle
bool Creature_Cycle_Multi
Float Creature_Start
String Creature_String
bool Creature_Start_1st
Potion Creature_Cum
Perk Creature_Perk
SPELL SP_Cumshot_Extra
Actor TheFather



FPE_Messages Property FPFP_Messages Auto Const Mandatory
FPE_Cumflation Property FPFP_Cumflation Auto Const Mandatory
FPE_STD Property FPFP_STD Auto Const Mandatory

GlobalVariable property INVB_Global_MessagePlayer_sex Auto Const Mandatory
GlobalVariable property INVB_Global_MessagePlayer_Impreg Auto Const Mandatory

GlobalVariable property INVB_Global_Female_Player_Dominant Auto Const Mandatory
GlobalVariable property INVB_Global_Male_Player_Dominant Auto Const Mandatory
GlobalVariable property FPFP_Global_MaleToMaleCum Auto Const Mandatory

GlobalVariable property INVB_Global_Infect Auto Const Mandatory

GlobalVariable property INVB_Global_Birth_Death_Chance Auto Const Mandatory
GlobalVariable property INVB_Global_Racial_Baby_Chance Auto Const Mandatory
Keyword Property fpfp_noDaddy Auto
Keyword Property fpfp_Father Auto

GlobalVariable property FPFP_Global_Chance_Player_M Auto Const Mandatory
GlobalVariable property FPFP_Global_Chance_Player_F Auto Const Mandatory
String[] Tags
Potion FullCondom

FPFP_BabyTypeAddon[] AddonBabyTypes
GlobalVariable Property FPFP_Global_MultiBirth_Modifier Auto Mandatory

GlobalVariable Property FPFP_Global_Cumshot Auto Mandatory
SPELL Property SP_Cumshot Auto
GlobalVariable property FPFP_Global_BloodyBirth Auto Const Mandatory
SPELL Property SP_BloodyBirth Auto

GlobalVariable property FPFP_Global_CondomOutcome Auto Const Mandatory

GlobalVariable property FPFP_Global_Total_Births Auto Const Mandatory
GlobalVariable property FPFP_Global_Total_Births_Player Auto Const Mandatory
GlobalVariable property FPFP_Global_Current_Births Auto Const Mandatory
GlobalVariable property FPFP_Global_Current_Births_Player Auto Const Mandatory
GlobalVariable property FPFP_Global_Total_Freeze Auto Const Mandatory
GlobalVariable property FPFP_Global_BirthLimit Auto Const Mandatory

FPE_Surrogate Property FPFP_Surrogate Auto Const Mandatory
Race Property HumanRace Auto 
Race Property GhoulRace Auto 

GlobalVariable property FPFP_Global_BodyType_CBBE Auto Const Mandatory
GlobalVariable property FPFP_Global_BodyType_FG Auto Const Mandatory


GlobalVariable property FPFP_Global_Creature_Faction Auto Const Mandatory
Faction Creature_Faction

Perk Property WLD_Perk_Pheromones Auto
GlobalVariable Property FPFP_Global_Synth_hidden Auto Const Mandatory
GlobalVariable Property FPFP_Global_CreatureDNAOnce Auto Const Mandatory

Keyword Property fpfp_DNATransfer Auto
Perk Property WLD_Perk_Breeder Auto
GlobalVariable property FPFP_Global_Breeder_modifier Auto Const Mandatory
GlobalVariable property FPFP_Global_Monthly_MessageType Auto Const Mandatory
int Breeder_mod

GlobalVariable property FPFP_Global_Toggle_Creature_Chances Auto Const Mandatory
GlobalVariable property FPFP_Global_Length_Human Auto Const Mandatory
GlobalVariable property FPFP_Global_Morph_Human Auto Const Mandatory
GlobalVariable property FPFP_Global_Chance_Ghoul Auto Const Mandatory
GlobalVariable property FPFP_Global_Length_Ghoul Auto Const Mandatory
GlobalVariable property FPFP_Global_Morph_Ghoul Auto Const Mandatory


GlobalVariable property FPFP_Global_Cumflation_FemaletoFemale Auto Const Mandatory


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

	If FPFP_Global_AllowFertileNPC.GetValue() == 1.0
		If !Ourself.HasMagicEffect(FPFP_ME_Fertile) && Utility.RandomFloat(0,100) <= (FPFP_Global_Fertile.getValue() * FPFP_Global_FertileNPC.GetValue())
			MakeFertile() 
		Endif
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
	elseif INVB_Global_MessagePlayer_sex.GetValue() == 0
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
	
	; Determine who got cum inside of them
	;If akArgs[2] is Actor ; Threesome
	If acs.Length > 2 && acs[2] is Actor ; Threesome
		;Trace("Threesome")
		;ActorCummedIn = akArgs[0] as Actor
		ActorCummedIn = acs[0] as Actor
		;Potential0 = akArgs[1] as Actor
		Potential0 = acs[1] as Actor
		;Potential1 = akArgs[2] as Actor
		Potential1 = acs[2] as Actor
	Else ; Typical sex
		;Trace("2some")
		;ActorCummedIn = akArgs[1] as Actor
		ActorCummedIn = acs[0] as Actor
		;Potential0 = akArgs[0] as Actor
		Potential0 = acs[1] as Actor
		;Trace("2some with " +ActorCummedIn+ " and " +Potential0)
		;Trace("Ourself - " + Ourself)
	EndIf
	
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

		
	If ActorCummedIn == PlayerREF && (Sex0 == 0 && Sex1 == 0) && FPFP_Global_MaleToMaleCum.GetValue() == 1 && INVB_Global_Male_Player_Dominant.GetValue() == 1
		Ourself = Potential0
		TrySpermFrom(PlayerREF)	
	elseIf ActorCummedIn == PlayerREF && (Sex0 == 1 && Sex1 == 1) && FPFP_Global_FemaleToFemaleCum.GetValue() == 1 && INVB_Global_Female_Player_Dominant.GetValue() == 1
		Ourself = Potential0
		TrySpermFrom(PlayerREF)
	elseIf ActorCummedIn == PlayerREF && (Sex0 == 0 && Sex1 == 0 && Sex2 == 0) && FPFP_Global_MaleToMaleCum.GetValue() == 1 && INVB_Global_Male_Player_Dominant.GetValue() == 1
		If Utility.RandomInt(0,1) == 0 ; Play heads or tails to find out which person came inside of you
			Ourself = Potential0
		Else
			Ourself = Potential1
		EndIf
		TrySpermFrom(PlayerREF)	
	elseIf ActorCummedIn == PlayerREF && (Sex0 == 1 && Sex1 == 1 && Sex2 == 1) && FPFP_Global_FemaleToFemaleCum.GetValue() == 1 && INVB_Global_Female_Player_Dominant.GetValue() == 1
		If Utility.RandomInt(0,1) == 0 ; Play heads or tails to find out which person came inside of you
			Ourself = Potential0
		Else
			Ourself = Potential1
		EndIf
		TrySpermFrom(PlayerREF)
	elseif Sex1 == 0 && Sex2 == 0 && FPFP_Global_MaleToMaleCum.GetValue() == 1
		If Utility.RandomInt(0,1) == 0 ; Play heads or tails to find out which person came inside of you
			TrySpermFrom(Potential0)
		Else
			TrySpermFrom(Potential1)
		EndIf
	elseif Sex1 == 1 && Sex2 == 1 && FPFP_Global_FemaleToFemaleCum.GetValue() == 1
		If Utility.RandomInt(0,1) == 0 ; Play heads or tails to find out which person came inside of you
			TrySpermFrom(Potential0)
		Else
			TrySpermFrom(Potential1)
		EndIf
	elseif Sex1 == 0 && Sex2 == 1
		TrySpermFrom(Potential0)	
	elseif Sex1 == 1 && Sex2 == 0
		TrySpermFrom(Potential1)
	elseif Sex1 == 0 || (Sex1 == 1 && FPFP_Global_FemaleToFemaleCum.GetValue() == 1)
		TrySpermFrom(Potential0)
	elseif Sex2 == 0 || (Sex2 == 1 && FPFP_Global_FemaleToFemaleCum.GetValue() == 1)
		TrySpermFrom(Potential1)
	EndIf

EndEvent

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

Bool Function TrySpermFrom(Actor akMan) ; This should only be called when the actor with this active magic effect get's cummed in
	float chance
	if akMan.GetLeveledActorBase().GetRace() == GhoulRace
		chance = FPFP_Global_Chance_Ghoul.getValue()	
	elseif FPFP_Global_Toggle_Creature_Chances.GetValue() == 1 && !akMan.GetLeveledActorBase().GetRace() == HumanRace
		chance = FPFP_BabyHandler.WhatsmyChances(akMan.GetLeveledActorBase().GetRace())
	elseIf akMan == PlayerREF
		chance = FPFP_Global_Chance_Player_M.getValue() ;Sender
	elseIf Ourself == PlayerREF
		chance = FPFP_Global_Chance_Player_F.getValue() ;Receiver
	else
		chance = FPFP_Global_Chance.getValue()	
	endif
	
	If akMan.HasPerk(WLD_Perk_Breeder) || Ourself.HasPerk(WLD_Perk_Breeder)
		chance *= FPFP_Global_Breeder_modifier.GetValue()
	endIf
	
	bool impregnated = false
	
	if !akMan.GetLeveledActorBase().GetRace() == HumanRace
		Creature_Cum = FPFP_BabyHandler.WhatsmyDNA(akMan.GetLeveledActorBase().GetRace())	
	endif
	
	if FPFP_BabyHandler.WhatBallsdoIHave(akMan) && akMan.HasKeyword(fpfp_DNATransfer)
		Actor SemenDonor = akMan.PlaceAtMe(FPFP_BabyHandler.NewFather(akMan), abInitiallyDisabled = true) as Actor
		Creature_Cum = FPFP_BabyHandler.WhatsmyDNA(SemenDonor.GetLeveledActorBase().GetRace())
		SemenDonor.delete()
	endIf		
	
	If akMan == PlayerREF || Ourself == PlayerREF; involves player, more extreme checks can happen
		
		If Ourself.HasMagicEffect(FPFP_ME_Fertile) ; Is the woman fertile?
			chance *= FPFP_Global_FertileEffects.getValue()
		Endif
		
		If akMan.HasMagicEffect(FPFP_ME_Fertile) ; Is the man virile?
			chance *= FPFP_Global_FertileEffects.getValue()
		Endif
		
		If Ourself.HasMagicEffect(FPFP_ME_Pill) ; Is the woman on the pill?
			chance *= ((100 - FPFP_Global_Contra.getValue()) * 0.01)
		Endif
		
		If Ourself.IsEquipped(FPFP_Condom) ; Does the woman have a condom in her cooch? 
			Ourself.UnequipItem(FPFP_Condom, false, true)
			Ourself.RemoveItem(FPFP_Condom, 1)
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
					
				elseif !akMan.GetLeveledActorBase().GetRace() == HumanRace && Creature_Cum != None
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
		elseIf akMan.IsEquipped(FPFP_Condom) ; Does the man wear a condom on his jimmy?
			akMan.UnequipItem(FPFP_Condom, false, true)
			akMan.RemoveItem(FPFP_Condom, 1)
			
			if (Game.IsPluginInstalled("Zaz INVB_WastelandDairy.esp") == TRUE)
			
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
					
				elseif !akMan.GetLeveledActorBase().GetRace() == HumanRace && Creature_Cum != None
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
				if !akMan.GetLeveledActorBase().GetRace() == HumanRace
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
			
			
			if FPFP_Global_Cumflation_FemaletoFemale.GetValue() == 1 || (FPFP_Global_Cumflation_FemaletoFemale.GetValue() == 0 && akMan.GetLeveledActorBase().GetSex() == 0)
				if FPFP_Global_Cumflation_Toggle.GetValue() == 1 && FPFP_Global_Cumflation_Notif_boolean.GetValue() == 0
					FPFP_Global_Cumflation_Notif_boolean.SetValue(1)
						FPFP_Cumflation.Cumflation_Up(Ourself, akMan)
					FPFP_Global_Cumflation_Notif_boolean.SetValue(0)
				endif
			endIf
			
			
			
			if INVB_Global_Infect.GetValue() == 1
				FPFP_STD.Infect(Ourself, akMan)
			endif
		Endif
	
	Else; involves NPC-NPC ; means that we shouldn't be doing extreme checks, just in case orgies are happening
		If Utility.RandomInt(0,99) < 10; fertile 
			chance *= 5 ; lower chance for NPC fertile to save resources
		Endif
		
		if akMan.IsEquipped(FPFP_Condom)
			chance *= ((100 - FPFP_Global_Contra.getValue()) * 0.01)
			akMan.UnequipItem(FPFP_Condom, false, true)
			akMan.RemoveItem(FPFP_Condom, 1)
			if (Game.IsPluginInstalled("Zaz INVB_WastelandDairy.esp") == TRUE)
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
			Ourself.UnequipItem(FPFP_Condom, false, true)
			Ourself.RemoveItem(FPFP_Condom, 1)
			if (Game.IsPluginInstalled("Zaz INVB_WastelandDairy.esp") == TRUE)
			
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
			akMan.UnequipItem(FPFP_Condom, false, true)
			akMan.RemoveItem(FPFP_Condom, 1)
			
			if (Game.IsPluginInstalled("Zaz INVB_WastelandDairy.esp") == TRUE)
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
				if !akMan.GetLeveledActorBase().GetRace() == HumanRace
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
			
			if FPFP_Global_Cumflation_FemaletoFemale.GetValue() == 1 || (FPFP_Global_Cumflation_FemaletoFemale.GetValue() == 0 && akMan.GetLeveledActorBase().GetSex() == 0)
				if FPFP_Global_Cumflation_Toggle.GetValue() == 1 && FPFP_Global_Cumflation_Notif_boolean.GetValue() == 0
					FPFP_Global_Cumflation_Notif_boolean.SetValue(1)
						FPFP_Cumflation.Cumflation_Up(Ourself, akMan)
					FPFP_Global_Cumflation_Notif_boolean.SetValue(0)
				endif
			endIf
			
			if INVB_Global_Infect.GetValue() == 1
				FPFP_STD.Infect(Ourself, akMan)
			endif
		
		Endif
	Endif
	
	
	If !Ourself.IsInFaction(FPFP_Preggo) && Utility.RandomFloat(0,100) <= chance
		if FPFP_Global_Current_Births.GetValue() <= FPFP_Global_Total_Births.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1
			impregnated = true
		elseIf (FPFP_Global_Current_Births.GetValue() >= FPFP_Global_Total_Births.GetValue()) && FPFP_Global_BirthLimit.GetValue() == 1 && (FPFP_Global_Total_Freeze.GetValue() == 1 || FPFP_Global_Total_Freeze.GetValue() == 2)
			impregnated = false
			Debug.notification("Birth Limit has been reached, Will not Impregnate")
		elseif FPFP_Global_BirthLimit.GetValue() == 0
			impregnated = true
		else
			impregnated = false	
		endif
	Endif

	workshopnpcscript Ourself_Synth = Ourself as workshopnpcscript
	workshopnpcscript akMan_Synth = akMan as workshopnpcscript

	If Impregnated && FPFP_Global_Synth_hidden.GetValue() == 0 && (Ourself_Synth.bIsSynth || akMan_Synth.bIsSynth)
		impregnated = false
	endIf
	
	if Impregnated && FPFP_Global_SynthImpreg.GetValue() == 0 && akMan.GetLeveledActorBase().GetRace() == GhoulRace
		impregnated = false
	elseif Impregnated && FPFP_Global_AllowNonNPC.GetValue() <= 1 && !akMan.GetLeveledActorBase().GetRace() == HumanRace 
		impregnated = false	
	endif
	
	If Ourself.IsInFaction(FPFP_Preggo)
		impregnated = false	
	endif
	
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
	
	if FPFP_Global_Cumflation_FemaletoFemale.GetValue() == 1 || (FPFP_Global_Cumflation_FemaletoFemale.GetValue() == 0 && akMan.GetLeveledActorBase().GetSex() == 0)
		if FPFP_Global_Cumflation_Toggle.GetValue() == 1 && FPFP_Global_Cumflation_Notif_boolean.GetValue() == 0
			FPFP_Global_Cumflation_Notif_boolean.SetValue(1)
			FPFP_Cumflation.Cumflation_Down(Ourself, akMan)
			FPFP_Global_Cumflation_Notif_boolean.SetValue(0)
		endif
	endIf
	
	If impregnated && !Ourself.IsInFaction(FPFP_Preggo)
		int random_seed = Utility.RandomInt(1, 100)
		if (random_seed <= INVB_Global_Racial_Baby_Chance.GetValue()) && akMan.HasKeyword(fpfp_DNATransfer)
			if FPFP_BabyHandler.WhatBallsdoIHave(akMan)
				Actor tempActor = akMan.PlaceAtMe(FPFP_BabyHandler.NewFather(akMan), abInitiallyDisabled = true) as Actor
				if akMan == PlayerREF
					tempActor.AddKeyword(fpfp_Father)
					tempActor.AddKeyword(fpfp_noDaddy)
				else
					tempActor.AddKeyword(fpfp_noDaddy)
				endif
				Impregnate(tempActor)
				tempActor.delete()
				
				if FPFP_Global_CreatureDNAOnce.GetValue() == 1
					akMan.RemovePerk(FPFP_BabyHandler.WhatBallsdoIHave(akMan))
					akMan.RemoveKeyword(fpfp_DNATransfer)
				endIf
			else
				Impregnate(akMan)
			Endif
		else
			Impregnate(akMan)
		Endif	
	Endif
	
	
	
	Return impregnated

EndFunction


Function Impregnate(Actor akMan) ; akMan is the father of the baby

	if Ourself.HasPerk(WLD_Perk_Pregnancy_Freezing)
		Ourself.RemovePerk(WLD_Perk_Pregnancy_Freezing)
	endIf

	BecomePreggo(akMan) ; Does faction registration too.
	
	IncepDate = Utility.GetCurrentGameTime()
	
	If akMan
		FatherRace = akMan.GetLeveledActorBase().GetRace()
	Else
		FatherRace = Ourself.GetLeveledActorBase().GetRace()
	EndIf
	
	NumChildren = 1
	
	float theDiceResult = Utility.RandomFloat(0.0,100.0) ; Don't want to take any chances that the script system only will have 1 run of the random function in the while condition
	
	float multiChance = FPFP_Global_MultiChance.GetValue() ; Called multiple times in the while loop, so to save us some performance, store it
	int multiMax = FPFP_Global_MultiMax.GetValueInt() ; stored for ditto reason as above
	
	While NumChildren < multiMax && (theDiceResult <= multiChance / NumChildren)
	
		NumChildren += 1
		
		theDiceResult = Utility.RandomFloat(0.0,100.0)
		
	EndWhile
	
	FirstCheck = True
	
	if Ourself.HasPerk(WLD_Perk_Breeder)
		StartTimerGameTime(FPE.GetUpdateTime_Breeder())
	else
		StartTimerGameTime(FPE.GetUpdateTime())
	endif
	
	FPE.SendPregEvent(Ourself, akMan, NumChildren)
	
	if Creature_Start_1st == true
		UpdateBody(Creature_Start)
		if Creature_Start <= 1				
			Ourself.AddPerk(WLD_Perk_Month[Creature_Start as int])
		endif					
		Creature_Start_1st = false
	endif
	
EndFunction

Function BecomePreggo(Actor akMan)
	IsPregnant = True
	
	If Ourself != PlayerREF
	
		If akMan == PlayerREF || akMan.HasKeyword(fpfp_Father)
			INVB_Global_Preggo_Count_Player.SetValue(INVB_Global_Preggo_Count_Player.getValue() + 1)
			INVB_Global_Preggo_Count_Current.SetValue(INVB_Global_Preggo_Count_Current.getValue() + 1) 
			
			if FPFP_Global_Perks_Father.GetValue() == 1
				Ourself.AddPerk(WLD_Perk_Impregnated_Player)
			endif
			
			Creature_Cycle = FPFP_Global_Length_Human.GetValue()
			Creature_Morph = FPFP_Global_Morph_Ghoul.GetValue()
			
		elseif akMan.GetLeveledActorBase().GetRace() == HumanRace
			INVB_Global_Preggo_Count_Cuck.SetValue(INVB_Global_Preggo_Count_Cuck.getValue() + 1)
			
			if FPFP_Global_Perks_Father.GetValue() == 1
				Ourself.AddPerk(WLD_Perk_Impregnated)
			endif
			
			Creature_Cycle = FPFP_Global_Length_Human.GetValue()
			Creature_Morph = FPFP_Global_Morph_Human.GetValue()
		elseif akMan.GetLeveledActorBase().GetRace() == GhoulRace
			INVB_Global_Preggo_Count_Cuck.SetValue(INVB_Global_Preggo_Count_Cuck.getValue() + 1)
			
			if FPFP_Global_Perks_Father.GetValue() == 1
				Ourself.AddPerk(WLD_Perk_Impregnated)
			endif
			
			Creature_Cycle = FPFP_Global_Length_Ghoul.GetValue()
			Creature_Morph = FPFP_Global_Morph_Ghoul.GetValue()	
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
				
				if Creature_Start == 0
					Creature_Start_1st = FPFP_BabyHandler.WhendoIStart(akMan.GetLeveledActorBase().GetRace())
					if Creature_Start_1st == true
						GlobalVariable Power_Creature = Game.GetFormFromFile(0x004F39, "INVB_WastelandDairy.esp") as GlobalVariable
						Creature_Start = Utility.RandomFloat(5 - Power_Creature.GetValue(), 5 + Power_Creature.GetValue())
					endif
				endif
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
	
	if Ourself.HasPerk(WLD_Perk_Pregnancy_Freezing)
		Ourself.RemovePerk(WLD_Perk_Pregnancy_Freezing)
	endIf
	
	if FPFP_BabyHandler.FoundtheFather(akDadRace)
		Creature_Perk = FPFP_BabyHandler.WhatsmyPerk(akDadRace)
		
		Creature_Faction = FPFP_BabyHandler.WhatFaction(akDadRace)
		
		if Ourself.IsInFaction(Creature_Faction)
			Ourself.removeFromFaction(Creature_Faction)
		endIf
		
		if Ourself.HasPerk(WLD_Perk_Pheromones)
			Ourself.RemovePerk(WLD_Perk_Pheromones)
		endif
		
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
	
	if FPFP_Global_Perks_Monthly.GetValue() == 1 && Ourself != NONE	
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
	
	float currentMonth
	if Ourself.HasPerk(WLD_Perk_Breeder)
		currentMonth = GetCurrentMonth() + Creature_Start + Breeder_mod
	else
		currentMonth = GetCurrentMonth() + Creature_Start
	endif
	

	If Ourself.IsDeleted()
		GiveBirth(false)
	ElseIf IsPregnant
	
		If currentMonth < Creature_Cycle
			UpdateBody(currentMonth)
					
			if (FPFP_Global_Perks_Monthly.GetValue() == 1)
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
			
			if (FPFP_Global_Perks_Monthly.GetValue() == 1)
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
		
		If currentMonth > 0 && currentMonth < Creature_Cycle
			If FirstCheck
				FirstCheck = False
			EndIf
		ElseIf currentMonth >= Creature_Cycle && FPFP_Global_Current_Births.GetValue() < FPFP_Global_Total_Births.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1
			FPFP_Global_Current_Births.setValue(FPFP_Global_Current_Births.GetValue() + 1)
			Breeder_mod = 0
			GiveBirth()
		elseIf currentMonth >= Creature_Cycle && FPFP_Global_Current_Births.GetValue() >= FPFP_Global_Total_Births.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1 && FPFP_Global_Total_Freeze.GetValue() == 0 || FPFP_Global_Total_Freeze.GetValue() == 2
			Ourself.AddPerk(WLD_Perk_Pregnancy_Freezing)
			Breeder_mod = 0
			Debug.notification("Birth Limit has been reached, Applying Frozen Pregnancy Perk")
		elseIf currentMonth >= Creature_Cycle && FPFP_Global_Current_Births.GetValue() >= FPFP_Global_Total_Births.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1 && FPFP_Global_Total_Freeze.GetValue() == 3
			Breeder_mod = 0
			FPFP_Surrogate.Surrogate(false, Ourself, FatherRace, NumChildren)
		ElseIf currentMonth >= Creature_Cycle && FPFP_Global_BirthLimit.GetValue() == 0
			Breeder_mod = 0
			GiveBirth()
		EndIf
		
		if !Ourself.HasPerk(WLD_Perk_Pregnancy_Freezing) && FPFP_Global_MultiBirth.GetValue() == 1
			if Creature_Cycle_Multi == true && FPFP_Global_Current_Births.GetValue() <= FPFP_Global_Total_Births.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1
				if currentMonth > (Creature_Cycle - FPFP_Global_MultiBirth_Modifier.GetValue())
				FPFP_Global_Current_Births.setValue(FPFP_Global_Current_Births.GetValue() + 1)
					GiveBirth_Multi()
				endif
			elseIf Creature_Cycle_Multi == true && currentMonth >= Creature_Cycle && FPFP_Global_Current_Births.GetValue() >= FPFP_Global_Total_Births.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1 && FPFP_Global_Total_Freeze.GetValue() == 0 || FPFP_Global_Total_Freeze.GetValue() == 2
				Ourself.AddPerk(WLD_Perk_Pregnancy_Freezing)
			elseif Creature_Cycle_Multi == true && FPFP_Global_BirthLimit.GetValue() == 0
				if currentMonth > (Creature_Cycle - FPFP_Global_MultiBirth_Modifier.GetValue())
					GiveBirth_Multi()
				endif
			endif
		EndIf
	Endif
	
	If IsPregnant ; If we're still pregnant, start a new timer
		if Ourself.HasPerk(WLD_Perk_Breeder)
			Breeder_mod += 1
			StartTimerGameTime(FPE.GetUpdateTime_Breeder())
		else
			StartTimerGameTime(FPE.GetUpdateTime())
		endif
	EndIf
else
	if Ourself.HasPerk(WLD_Perk_Breeder)
		StartTimerGameTime(FPE.GetUpdateTime_Breeder())
	else
		StartTimerGameTime(FPE.GetUpdateTime())
	endif
EndIf	
EndEvent

Float Function GetCurrentMonth()
	Return ((Utility.GetCurrentGameTime() - IncepDate) / FPFP_Global_Day.GetValue())
EndFunction

Bool Function GiveBirth_Multi()
	Debug.notification("Giving Birth to the first of many.")
	
	if FPFP_Global_BloodyBirth.GetValue() == 1
		SP_BloodyBirth.Cast(Ourself, Ourself)
	endif
	if FPFP_Surrogate.CheckPerk(Ourself)
		FPFP_Surrogate.Surrogate(false, Ourself, FatherRace, NumChildren)	
	else
		FPFP_BabyHandler.AddBaby(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
	Endif
EndFunction

Bool Function GiveBirth(bool akBirth = True) 
	
	RemovePerks(FatherRace)
	
	UnBecomePreggo()
	
	
	if FPFP_Global_BloodyBirth.GetValue() == 1
		SP_BloodyBirth.Cast(Ourself, Ourself)
	endif
	
	GlobalVariable Enable_Lactation = Game.GetFormFromFile(0x005A3F, "INVB_WastelandDairy.esp") as GlobalVariable
	Perk Perk_Lactation = Game.GetFormFromFile(0x005A3E, "INVB_WastelandDairy.esp") as Perk
	if Enable_Lactation.getValue() == 1 && akBirth && !Ourself.HasPerk(Perk_Lactation)
		Ourself.AddPerk(Perk_Lactation)
	endif

	If !Ourself.IsDead()
		FPFP_Messages.BirthMessage(Ourself, FatherRace)
	EndIf
	
	if FPFP_Surrogate.CheckPerk(Ourself)
		FPFP_Surrogate.Surrogate(true, Ourself, FatherRace, NumChildren)
	elseIf akBirth
		FPFP_BabyHandler.AddBaby(Ourself, FatherRace, NumChildren); TODO Need to figure out algo for birthing
	Endif
	
	NumChildren = 0 ; All children evac'd
	FatherRace = NONE
	IncepDate = -1.0
	
	If !Ourself.IsDead()
		DetermineBodyAfterBirth()
	EndIf
	
	If akBirth
		FPE.AnnounceBirth(Ourself)
	EndIf
	
	FPE.SendBirthEvent(Ourself, akBirth)
	
	If !Ourself.Is3DLoaded() || Ourself.IsDeleted() ; we must check that we are unloaded so that we can remove our data. After all, there's no need for pregnancy data if there's no real data to store on an unloaded npc
		Uninitialize()
	EndIf
	
	Return akBirth

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
	If (OrigMorphNames.Length)
		int idx = OrigMorphNames.Find(MorphName)
		If (idx > -1)
			;Trace(Ourself.GetLeveledActorBase().GetName() + " found morph " + MorphName + " value " + OrigMorphValues[idx])
			Return OrigMorphValues[idx]
		EndIf
	EndIf
	Return 0.0
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
			
			float power = (akMonth * FPFP_Global_Power.getValue() * 0.015 * Utility.RandomFloat(0.8, 1.2)) * Math.Sqrt(NumChildren)
			BodyGen.SetMorph(Ourself, false, "Mpreg", FPFP_Keyword, power + OrigValue("Mpreg"))
			BodyGen.UpdateMorphs(Ourself)
			Trace("Updating morphs, month " + akMonth + " OrigValue " + OrigValue("Mpreg") + " NewValue " +  power + OrigValue("Mpreg"))
		EndIf
		
	Else
	
		If FirstCheck
			GetOriginalMorphs()
		EndIf
	
		float power = (akMonth * FPFP_Global_Power.getValue() * Creature_Morph * 0.015 * Utility.RandomFloat(0.8, 1.2)) * Math.Sqrt(NumChildren)
		float maxMorphValue = FPFP_Global_Power.getValue() / 5.0
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
				Ourself.QueueUpdate(False, 12)
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
