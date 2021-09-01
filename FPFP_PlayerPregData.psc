Scriptname FPFP_PlayerPregData Extends FPFP_BasePregData

Group PlayerDataTechnicalProperties
	Potion Property Stimpak Auto Const Mandatory
	Potion Property RadAway Auto Const Mandatory
	MagicEffect Property FortifyResistRadsRadX Auto Const Mandatory
	Keyword Property ObjectTypeAlcohol Auto Const Mandatory
	Keyword Property CA_ObjType_ChemBad Auto Const Mandatory
	GlobalVariable Property FPFP_Global_BabyHealth Auto Const Mandatory
	
	Perk Property Cannibal01 Auto Const Mandatory
	Perk Property Cannibal02 Auto Const Mandatory
	Perk Property Cannibal03 Auto Const Mandatory
	Perk Property Ghoulish01 Auto Const Mandatory
	Perk Property Ghoulish02 Auto Const Mandatory
	Perk Property Ghoulish03 Auto Const Mandatory
	Perk Property RadResistant01 Auto Const Mandatory
	Perk Property RadResistant02 Auto Const Mandatory
	Perk Property RadResistant03 Auto Const Mandatory
	Perk Property Toughness01 Auto Const Mandatory
	Perk Property Toughness02 Auto Const Mandatory
	Perk Property Toughness03 Auto Const Mandatory
	Perk Property Toughness04 Auto Const Mandatory
	Perk Property Toughness05 Auto Const Mandatory
	Perk Property LeadBelly01 Auto Const Mandatory

EndGroup

Group PlayerDataVariableProperties
	Float Property BabyHealth Auto 
	Float Property RadiationDamage Auto 
	Float Property LastBabyHealthUpdate Auto
	Bool Property IsGivingBirth Auto
	Bool Property MorningAfterPill Auto
EndGroup

;Perk[] Property WLD_Perk_Month Auto
Perk Property WLD_Perk_Impregnated_Special Auto

;Startup handling

Float Creature_Cycle
bool Creature_Cycle_Multi
Perk Creature_Perk

GlobalVariable property INVB_Global_ForceLabourQuest Auto Const Mandatory
Event OnInit() ; just tell us to initialize
	Initialize(PlayerREF)
EndEvent

Function Initialize(Actor akTarget) 

	RegisterForCustomEvent(FPE, "DoUpdate")
	RegisterForCustomEvent(FPE, "DoCleaning")
	RegisterForCustomEvent(FPE, "DoReset")
	RegisterForPlayerSleep()
	LoadFP()

EndFunction

Function LoadFP()
	;Quest Main = Game.GetFormFromFile(0x02679, "four_play.esp") as quest
	Trace("LoadFP")
	Quest Main = Game.GetFormFromFile(0x01000F99, "AAF.esm") as quest
	If Main
		;four_play_event = Main as four_play:Main
		;RegisterForCustomEvent(four_play_event, "animation_over")
		AAF_Events = Main as AAF:AAF_API
		RegisterForCustomEvent(AAF_Events, "OnAnimationStart")
		RegisterForCustomEvent(AAF_Events, "OnAnimationStop")
		RegisterForCustomEvent(AAF_Events, "OnAnimationChange")
	Else
		utility.wait(0.1)
	Endif
EndFunction

;Gameplay handling - If it isn't listed here, it is assumed to be the same as the base spell

Event OnPlayerSleepStop(bool abInterrupted, ObjectReference akBed)
	If !abInterrupted
		TryForFertility()
	EndIf
EndEvent

Function TryForFertility()

	If Utility.RandomInt(0,99) < FPFP_Global_Fertile.getValueInt() && !PlayerREF.HasMagicEffect(FPFP_ME_Fertile) && !PlayerREF.IsInFaction(FPFP_Preggo)
		MakeFertile()
		If FPFP_Global_FNotif.getValue() == 1
			If PlayerREF.GetLeveledActorBase().GetSex() == 1 && FPFP_Global_FemaleToFemaleCum.GetValue() == 0.0
				debug.notification("I'm feeling fertile today.")
			ElseIf PlayerREF.GetLeveledActorBase().GetSex() == 0 && FPFP_Global_MPreg.GetValue() == 0.0
				debug.notification("I'm feeling virile today.")
			Else
				debug.notification("I'm feeling fertile and virile today.")
			EndIf
		Endif
	Endif

EndFunction

Bool Function IsValidWoman(Actor akActor) ; Removes player only checks, as if this function should only be called on the player

	Bool akReturn = False
	
	If akActor

		If akActor.GetLeveledActorBase().GetSex() == 1.0 ; If the player is female
			akReturn = True	
		ElseIf FPFP_Global_MPreg.GetValue() == 1.0 ; or if MPreg is allowed
			akReturn = True
		EndIf
		
	EndIf
	
	Return akReturn

EndFunction

Bool Function TrySpermFrom(Actor akMan) ; takes the impregnation result and uses that to either record a partner or set the dad
	
	bool wasImpregnated = parent.TrySpermFrom(akMan)
	If !wasImpregnated
		FPE.RecordPartner(akMan)
	EndIf
	
	return wasImpregnated

EndFunction

Function Impregnate(Actor akMan) ; When called, akWoman is PlayerREF. animation_over event handler in the base script handles player pregnancy
	
	if PlayerREF.HasPerk(WLD_Perk_Pregnancy_Freezing)
		PlayerREF.RemovePerk(WLD_Perk_Pregnancy_Freezing)
		Debug.Notification("FP: Freezing Perk Removed...")
	endIf
	
	bool impregnated = false
	FPE.SetDaddy(akMan) ; Moved setdaddy over to impregnate, as it makes the most sense to record the dad in the incep process then the testing sperm process
	
	if akMan.GetLeveledActorBase().GetRace() == HumanRace
		Creature_Cycle = 9
		Creature_Perk = WLD_Perk_Impregnated_Special
	else
		bool FoundFather_Player = false
		
		FoundFather_Player = FPFP_BabyHandler.FoundtheFather(akMan.GetLeveledActorBase().GetRace())
		if FoundFather_Player
			Creature_Perk = FPFP_BabyHandler.WhatsmyPerk(akMan.GetLeveledActorBase().GetRace())
			Creature_Cycle = FPFP_BabyHandler.Howlongismypregnancy(akMan.GetLeveledActorBase().GetRace())
			Creature_Cycle_Multi = FPFP_BabyHandler.WhatTwins(akMan.GetLeveledActorBase().GetRace())
			Perk Perk_Breeder = Game.GetFormFromFile(0x0059D0, "INVB_WastelandDairy.esp") as Perk
			
			if PlayerREF.HasPerk(Perk_Breeder)
				Creature_Cycle = (Creature_Cycle / 1.5)
			endif
			
		elseIf FoundFather_Player == false
			Creature_Perk = WLD_Perk_Impregnated_Special
			Creature_Cycle = 9
		EndIf
			
	EndIf
	
	if FPFP_Global_Current_Births_Player.GetValue() <= FPFP_Global_Total_Births_Player.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1
		impregnated = true
	elseIf (FPFP_Global_Current_Births_Player.GetValue() >= FPFP_Global_Total_Births_Player.GetValue()) && FPFP_Global_BirthLimit.GetValue() == 1 && FPFP_Global_Total_Freeze.GetValue() > 1
		impregnated = false
	elseif FPFP_Global_BirthLimit.GetValue() == 0
		impregnated = true
	else
		impregnated = false	
	endif

	If PlayerREF.IsInFaction(FPFP_Preggo)
		impregnated = false	
	endif
	
	If impregnated && !PlayerREF.IsInFaction(FPFP_Preggo)
	
		if FPFP_Global_Perks_Father.GetValue() == 1
			PlayerREF.AddPerk(Creature_Perk)
			Creature_Perk = NONE
		endif
		parent.Impregnate(akMan) ; Do everything that is done by default

		;Register for radiation damages and attack damage
		
		RegisterPlayerPregnancyEvents()
		
		;Now make sure everything is set to max at first
		BabyHealth = 100
		RadiationDamage = 0
	endif
	
EndFunction

Function RegisterPlayerPregnancyEvents()
	RegisterForRadiationDamageEvent(PlayerREF)
	RegisterForHitEvent(PlayerREF)
	RegisterForRemoteEvent(Ourself, "OnItemEquipped")
	RegisterForRemoteEvent(Cannibal01, "OnEntryRun")
	RegisterForRemoteEvent(Cannibal02, "OnEntryRun")
	RegisterForRemoteEvent(Cannibal03, "OnEntryRun")
EndFunction

Function UnregisterPlayerPregnancyEvents()
	UnregisterForAllRadiationDamageEvents()
	UnregisterForAllHitEvents()
	UnregisterForRemoteEvent(Ourself, "OnItemEquipped")
	UnregisterForRemoteEvent(Cannibal01, "OnEntryRun")
	UnregisterForRemoteEvent(Cannibal02, "OnEntryRun")
	UnregisterForRemoteEvent(Cannibal03, "OnEntryRun")
EndFunction

Event OnTimerGameTime(int aiTID)

If !PlayerREF.HasPerk(WLD_Perk_Pregnancy_Freezing)
	If !IsPregnant || IsGivingBirth
		return ; Don't do any of this stuff while we are not pregnant, or in labor
	EndIf
	
	If MorningAfterPill ; the player has taken the pill during the first month
		GiveBirth(False)
		INVB_Global_Preggo_Count_Player_Babies.SetValue(INVB_Global_Preggo_Count_Player_Babies.getValue() - 1)
		Debug.MessageBox("The contraceptive you took forced a period.")
		Return
	EndIf
	
	float currentMonth = GetCurrentMonth()
	
	If currentMonth < Creature_Cycle
		UpdateBody(currentMonth)
				
		if (FPFP_Global_Perks_Monthly.GetValue() == 1)
			PlayerREF.RemovePerk(WLD_Perk_Month[0])
			PlayerREF.RemovePerk(WLD_Perk_Month[1])
			PlayerREF.RemovePerk(WLD_Perk_Month[2])
			PlayerREF.RemovePerk(WLD_Perk_Month[3])
			PlayerREF.RemovePerk(WLD_Perk_Month[4])
			PlayerREF.RemovePerk(WLD_Perk_Month[5])
			PlayerREF.RemovePerk(WLD_Perk_Month[6])
			PlayerREF.RemovePerk(WLD_Perk_Month[7])
			PlayerREF.RemovePerk(WLD_Perk_Month[8])
			PlayerREF.RemovePerk(WLD_Perk_Month[9])	
			PlayerREF.AddPerk(WLD_Perk_Month[currentMonth as int])
			
		endif
	else
		UpdateBody(Creature_Cycle)
		
		if (FPFP_Global_Perks_Monthly.GetValue() == 1)
			PlayerREF.RemovePerk(WLD_Perk_Month[0])
			PlayerREF.RemovePerk(WLD_Perk_Month[1])
			PlayerREF.RemovePerk(WLD_Perk_Month[2])
			PlayerREF.RemovePerk(WLD_Perk_Month[3])
			PlayerREF.RemovePerk(WLD_Perk_Month[4])
			PlayerREF.RemovePerk(WLD_Perk_Month[5])
			PlayerREF.RemovePerk(WLD_Perk_Month[6])
			PlayerREF.RemovePerk(WLD_Perk_Month[7])
			PlayerREF.RemovePerk(WLD_Perk_Month[8])
			PlayerREF.RemovePerk(WLD_Perk_Month[9])
			
			if currentMonth == Creature_Cycle
				PlayerREF.AddPerk(WLD_Perk_Month[Creature_Cycle as int])	
			else
				if Creature_Cycle > 9
					PlayerREF.AddPerk(WLD_Perk_Month[9])
				else
					PlayerREF.AddPerk(WLD_Perk_Month[currentMonth as int])
				endIf	
			endif	
		endif
	EndIf
			
	
	If currentMonth > 0 && currentMonth < Creature_Cycle
		If FirstCheck
			debug.notification("There's no mistake about it: I'm pregnant!")
			StartFPEPlayerQuests()
			FirstCheck = False
		EndIf
		debug.notification("It's the "+ GetMonthString(currentMonth) +" month of my pregnancy.")
		If currentMonth >= (Creature_Cycle / 3)
			FPE.TooLateToAbort()
		EndIf
		UpdateBabyHealth()
	ElseIf currentMonth >= Creature_Cycle && FPFP_Global_Current_Births_Player.GetValue() < FPFP_Global_Total_Births_Player.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1
		FPFP_Global_Current_Births_Player.setValue(FPFP_Global_Current_Births_Player.GetValue() + 1)
		DoLabour()
		;Sthan:  I am adding these parentheses
	elseIf currentMonth >= Creature_Cycle && FPFP_Global_Current_Births_Player.GetValue() >= FPFP_Global_Total_Births_Player.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1 && (FPFP_Global_Total_Freeze.GetValue() == 0 || FPFP_Global_Total_Freeze.GetValue() == 2)
		PlayerREF.AddPerk(WLD_Perk_Pregnancy_Freezing)
	elseIf currentMonth >= Creature_Cycle && FPFP_Global_Current_Births_Player.GetValue() >= FPFP_Global_Total_Births_Player.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1 && FPFP_Global_Total_Freeze.GetValue() == 3
		FPFP_Surrogate.Surrogate(false, PlayerREF, FatherRace, NumChildren)
	ElseIf currentMonth >= Creature_Cycle && FPFP_Global_BirthLimit.GetValue() == 0
		DoLabour()	
	EndIf
	
	if !PlayerREF.HasPerk(WLD_Perk_Pregnancy_Freezing) && FPFP_Global_MultiBirth.GetValue() == 1
		if Creature_Cycle_Multi == true && FPFP_Global_Current_Births_Player.GetValue() < FPFP_Global_Total_Births_Player.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1
			if currentMonth > (Creature_Cycle - FPFP_Global_MultiBirth_Modifier.GetValue())
			FPFP_Global_Current_Births_Player.setValue(FPFP_Global_Current_Births_Player.GetValue() + 1)
			GiveBirth_Multi()
			endif
		elseIf Creature_Cycle_Multi == true && currentMonth >= Creature_Cycle && FPFP_Global_Current_Births_Player.GetValue() >= FPFP_Global_Total_Births_Player.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1 && (FPFP_Global_Total_Freeze.GetValue() == 0 || FPFP_Global_Total_Freeze.GetValue() == 2)
			PlayerREF.AddPerk(WLD_Perk_Pregnancy_Freezing)
			debug.Notification("Added Freezing Perk:" + "Creature Cycle: ")
		elseif Creature_Cycle_Multi == true && FPFP_Global_BirthLimit.GetValue() == 0
			if currentMonth > (Creature_Cycle - FPFP_Global_MultiBirth_Modifier.GetValue())
				GiveBirth_Multi()
			endif
		endif
	endif
	
	If IsPregnant && !IsGivingBirth
		StartTimerGameTime(FPE.GetUpdateTime())
	EndIf
EndIf
EndEvent

String Function GetMonthString(float theCurrentProgress)

	String theReturn = Math.Ceiling(theCurrentProgress)
	
	If theReturn == "1"
		theReturn += "st"
	ElseIf theReturn == "2"
		theReturn += "nd"
	ElseIf theReturn == "3"
		theReturn += "rd"
	Else
		theReturn += "th"
	EndIf
	
	Return theReturn

EndFunction

Bool Function GiveBirth_Multi()
	Game.FadeOutGame(true, true, 0, 1, true)
	Utility.Wait(1)
	Debug.notification("I am giving birth to the first of many.")
	if FPFP_Global_BloodyBirth.GetValue() == 1
		SP_BloodyBirth.Cast(PlayerREF, PlayerREF)
	endif
	
	if FPFP_Surrogate.CheckPerk(Ourself)
		FPFP_Surrogate.Surrogate(false, PlayerREF, FatherRace, NumChildren)
	else
		FPFP_BabyHandler.AddBaby(PlayerREF, FatherRace, NumChildren, RadiationDamage)
	Endif
	Game.FadeOutGame(false, true, 0, 1)
	
EndFunction

Function RemovePerks(Race akDadRace)
	
	if PlayerREF.HasPerk(WLD_Perk_Pregnancy_Freezing)
		PlayerREF.RemovePerk(WLD_Perk_Pregnancy_Freezing)
	endIf
	
	if FPFP_BabyHandler.FoundtheFather(akDadRace)
		Creature_Perk = FPFP_BabyHandler.WhatsmyPerk(akDadRace)
		if PlayerREF.HasPerk(Creature_Perk)
			PlayerREF.RemovePerk(Creature_Perk)
		endif
	endif
	
	if PlayerREF.HasPerk(WLD_Perk_Impregnated_Special)
		PlayerREF.RemovePerk(WLD_Perk_Impregnated_Special)
	endif
	
	if FPFP_Global_Perks_Monthly.GetValue() == 1	
		PlayerREF.RemovePerk(WLD_Perk_Month[0])
		PlayerREF.RemovePerk(WLD_Perk_Month[1])
		PlayerREF.RemovePerk(WLD_Perk_Month[2])
		PlayerREF.RemovePerk(WLD_Perk_Month[3])
		PlayerREF.RemovePerk(WLD_Perk_Month[4])
		PlayerREF.RemovePerk(WLD_Perk_Month[5])
		PlayerREF.RemovePerk(WLD_Perk_Month[6])
		PlayerREF.RemovePerk(WLD_Perk_Month[7])
		PlayerREF.RemovePerk(WLD_Perk_Month[8])
		PlayerREF.RemovePerk(WLD_Perk_Month[9])	
	endif
	
EndFunction


Bool Function GiveBirth(bool akBirth = True) ; returns whether or not a birth happened so that miscarriage can still happen during labor and dialogue can be written for it

	UnBecomePreggo()
	
	
	
	RemovePerks(FatherRace)

	GlobalVariable Enable_Lactation = Game.GetFormFromFile(0x005A3F, "INVB_WastelandDairy.esp") as GlobalVariable
	Perk Perk_Lactation = Game.GetFormFromFile(0x005A3E, "INVB_WastelandDairy.esp") as Perk
	if Enable_Lactation.getValue() == 1 && akBirth && !PlayerREF.HasPerk(Perk_Lactation)
		PlayerREF.AddPerk(Perk_Lactation)
	endif
	
	UnregisterPlayerPregnancyEvents()
	
	FPE.StopBabyGeneral()
	FPE.StopDNAQuest()
	FPE.StopDaddyQuest()
	FPE.StopAbortQuest()
	
	If BabyHealth <= 0 || RadiationDamage >= 500
	
		akBirth = False
	
	EndIf

	Game.FadeOutGame(true, true, 0, 1, true)
	Utility.Wait(1)
	
	if FPFP_Global_BloodyBirth.GetValue() == 1
		SP_BloodyBirth.Cast(PlayerREF, PlayerREF)
	endif
		
	if FPFP_Surrogate.CheckPerk(PlayerREF)
		FPFP_Surrogate.Surrogate(true, PlayerREF, FatherRace, NumChildren)
	elseIf akBirth
		FPFP_BabyHandler.AddBaby(PlayerREF, FatherRace, NumChildren, RadiationDamage); TODO Need to figure out algo for birthing
			
	Endif

	Game.FadeOutGame(false, true, 0, 1)
	
	DetermineBodyAfterBirth()
	
	ResetVarProps()
	
	FPE.SendBirthEvent(Ourself, akBirth)
	
	Return akBirth

EndFunction

Function ResetVarProps()

	NumChildren = 0 ; All children evac'd
	
	IncepDate = -1.0
	
	LastBabyHealthUpdate = 0 ; make sure that we don't have an update date
	
	IsGivingBirth = False
	
	MorningAfterPill = False
	
	FatherRace = NONE
	
EndFunction

; Player-Only Baby Health functions

Function UpdateBabyHealth()

	If FPFP_Global_BabyHealth.GetValue() == 1.0 ; if the baby health option is enabled

		If BabyHealth <= 0 || RadiationDamage >= 500
		
			DoMiscarriage()
		
		EndIf
		
		float currentTime = Utility.GetCurrentGameTime()
		
		If LastBabyHealthUpdate == 0.0 ; if this is our first check for baby health
			LastBabyHealthUpdate = currentTime
		EndIf
		
		float healAmount = 10 * (currentTime - LastBabyHealthUpdate) / FPFP_Global_Day.GetValue(); how many months have passed since the last check multiplied by 10
		
		ModBabyHealth(healAmount) 
		
		LastBabyHealthUpdate = Utility.GetCurrentGameTime()
		
	EndIf

EndFunction

Event Perk.OnEntryRun(Perk akSender, int auiEntryID, ObjectReference akTarget, Actor akOwner)

	Trace("Perk handler is a go")

	If akOwner == PlayerREF ; if the perk is sending the event from our player...
		
		If FPFP_Global_BabyHealth.GetValue() == 1.0 ; if baby health is on
			If akSender == Cannibal01 || akSender == Cannibal02 || akSender == Cannibal03
				Trace("Cannibal handler is a go")
				
				int multiplier = 1
				If akSender == Cannibal02
					multiplier = 2
				ElseIf akSender == Cannibal03
					multiplier = 3
				EndIf
				
				Utility.Wait(0.6) ; wait as long as the cannibal perk takes
				
				ModBabyHealth(10 * multiplier)
				
			EndIf
		EndIf
		
	EndIf

EndEvent

Event Actor.OnItemEquipped(Actor akSender, Form akBaseObject, ObjectReference akReference)

	;check if baby health option is on, then do alcohol damage or chem damage as needed
	
	If akBaseObject == FPFP_Pill && GetCurrentMonth() < 1.0
		MorningAfterPill = True
		return
	EndIf
	
	If FPFP_Global_BabyHealth.GetValue() == 1.0 ; if baby health option is enabled

		If akBaseObject == Stimpak
			ModBabyHealth(10)
		ElseIf akBaseObject == RadAway 
			ModRadDamage(-100)
		EndIf
		
		int itemDanger = ItemLevelOfDanger(akBaseObject)
		
		If itemDanger > 0
			float theDamage = Utility.RandomFloat(1.0,3.0) * itemDanger
			ModBabyHealth(-theDamage)
		EndIf
		
	EndIf

endEvent

Int Function ItemLevelOfDanger(Form akItem)

	If akItem.HasKeyword(ObjectTypeAlcohol)
	
		Return 1
	
	ElseIf akItem.HasKeyword(CA_ObjType_ChemBad) || akItem == FPFP_Pill
	
		Return 2
	
	EndIf
	
	Return 0

EndFunction

Event OnRadiationDamage(ObjectReference akPlayerRef, bool abIngested)
	
	If FPFP_Global_BabyHealth.GetValue() == 1.0 ; if the baby health option is enabled
		
		Debug.Trace("FPE Player Pregnancy Data has detected radiation.")
		
		; first, do total rad damage calc
		float theDamage = 1
		
		If abIngested && !PlayerREF.HasPerk(LeadBelly01)
			theDamage *= Utility.RandomFloat(1.0,5.0)
		EndIf
		
		If PlayerREF.HasMagicEffect(FortifyResistRadsRadX)
			theDamage /= 2
		EndIf
		
		; then,  do the ghoulish health healing bits
		int playerGhoulishMult = 1
		If PlayerREF.HasPerk(Ghoulish01)
			If PlayerREF.HasPerk(Ghoulish02)
				playerGhoulishMult += 1
				If PlayerREF.HasPerk(Ghoulish03)
					playerGhoulishMult += 1
				EndIf
			EndIf
			ModBabyHealth(theDamage/3 * playerGhoulishMult)
		EndIf
		
		; then,  do the actual reductions based off rad resistance perks
		int playerResistMult = 1
		If PlayerREF.HasPerk(RadResistant01)
			If PlayerREF.HasPerk(RadResistant02)
				playerResistMult += 1
				If PlayerREF.HasPerk(RadResistant03)
					playerResistMult += 1
				EndIf
			EndIf
			theDamage *= (3 - playerResistMult) / 3 ; reduce the rad damage done to the baby
		EndIf
		; then,  do the rad damage in the end
		ModRadDamage(theDamage)
		
	EndIf
	
	If !abIngested
		Utility.Wait(1)
	EndIf
	
	If IsPregnant
	
		RegisterForRadiationDamageEvent(PlayerREF)
	
	EndIf

EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial) ; This still needs work TODO
  
	Trace("The Player was registered as being hit by the object "+akSource)

	If FPFP_Global_BabyHealth.GetValue() == 1.0 && akSource && akSource as Weapon; if the baby health option is enabled and we were hit with a weapon
	
		If !abHitBlocked

			; do random amount of damage
			float theDamage = Utility.RandomFloat(0.0,1.0)
			
			int playerToughness = 1
			If PlayerREF.HasPerk(Toughness01)
				If PlayerREF.HasPerk(Toughness02)
					playerToughness += 1
					If PlayerREF.HasPerk(Toughness03)
						playerToughness += 1
						If PlayerREF.HasPerk(Toughness04)
							playerToughness += 1
							If PlayerREF.HasPerk(Toughness05)
								playerToughness += 1
							EndIf
						EndIf
					EndIf
				EndIf
				theDamage *= (5 - playerToughness) / 5
			EndIf
			
			ModBabyHealth(-theDamage)
		  
		EndIf
	
	EndIf
	
	Utility.Wait(3.0)
	
	If IsPregnant
		RegisterForHitEvent(PlayerREF)
	EndIf
	
EndEvent

Function ModBabyHealth(Float afAmount)
	
	float newHealth = BabyHealth + afAmount
	
	If newHealth > 100
		BabyHealth = 100
	Else
		BabyHealth = newHealth
	EndIf
	
EndFunction

Function ModRadDamage(Float afAmount)

	float newDamage = RadiationDamage + afAmount
	
	If newDamage < 0
		RadiationDamage = 0
	Else
		RadiationDamage = newDamage
	EndIf
	
EndFunction

; Quest functions

Function StartFPEPlayerQuests()

	FPE.StartBabyGeneral()
	
	FPE.StartAbort()
	
	FPE.TryToStartDaddy()

EndFunction

Function DoLabour()

	If !IsPregnant || IsGivingBirth
		Debug.Trace("FPE Player Pregnancy Info Script: Cannot trigger labor right now! We could either not be pregnant, labor is happening, or miscarriage is happening!")
		return ; Don't do any of this stuff while we are not pregnant
	EndIf
	
	IsGivingBirth = True
	
	if INVB_Global_ForceLabourQuest.GetValue() == 0
		FPE.DoLabourQuest()
	elseif INVB_Global_ForceLabourQuest.GetValue() == 1
		GiveBirth()
	else
		debug.notification("Strange, I should be giving birth around now") 
	endif
EndFunction

Function DoMiscarriage()

	If !IsPregnant
		Debug.Trace("FPE Player Pregnancy Info Script: Cannot trigger miscarriage right now! We could either not be pregnant, labor is happening, or miscarriage is happening!")
		return ; Don't do any of this stuff while we are not pregnant, or in labor
	EndIf
	
	If !IsGivingBirth ; if labor isn't running, kill the child and start the miscarriage quest

		UnBecomePreggo()
		INVB_Global_Preggo_Count_Player_Babies.SetValue(INVB_Global_Preggo_Count_Player_Babies.getValue() - 1)
		
		UnregisterPlayerPregnancyEvents()
		
		FPE.StopBabyGeneral()
		FPE.StopDNAQuest()
		FPE.StopDaddyQuest()
		FPE.StopAbortQuest()
		
		FPE.StartLOSSQuest()
		
	Else ; otherwise kill the baby by setting its health to 0 so when the labor quest does its birth, it returns as an abort
	
		BabyHealth = 0.0
	
	EndIf

EndFunction

Function FullyHealBaby()

	BabyHealth = 100
	
	RadiationDamage = 0
	
	Debug.Notification("The baby has been healed.")

EndFunction

; Technical Handling

Event FPFP_Player_Script.DoUpdate(FPFP_Player_Script akSender, Var[] akVars)

	;Update code goes here...
	
	Trace("Doing Update")
	
	int lastVer = akVars[0] as Int
	
	LoadFP()
	
	if lastVer < 2100
		RegisterForCustomEvent(FPE,"DoCleaning")
	EndIf
	
EndEvent

Event FPFP_Player_Script.DoCleaning(FPFP_Player_Script akSender, Var[] akVars)

	Trace("Doing clean on player data")

EndEvent

Event FPFP_Player_Script.DoReset(FPFP_Player_Script akSender, Var[] akVars)

	Trace("Doing reset on player data")

	Uninitialize(TRUE)

EndEvent

Function Uninitialize(Bool abFPEReset = FALSE) ; This version in the player script should only be called when FPE is reset, as we don't delete this reference

	If abFPEReset
	
		;prevent any timers and events
		CancelTimerGameTime() 
		UnregisterForAllRadiationDamageEvents()
		UnregisterForAllHitEvents()
		;completely wipe everything
		UnBecomePreggo() 
		IncepDate = -1.0
		NumChildren = 0
		FatherRace = NONE
		LastBabyHealthUpdate = 0.0
		FirstCheck = false
		
		If AffectedByMorphs
			ResetBody()
		EndIf
		
		OriginalThin = 0.0
		OriginalThicc = 0.0
		OriginalMuscular = 0.0
		
	EndIf
	
EndFunction

Function Trace(String theText, Bool forceLog = FALSE)

	Debug.TraceConditional("FPE "+self+" holding actor "+Ourself+" | "+theText, forceLog || FPFP_Global_Verbose.GetValue() )

EndFunction