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
	GlobalVariable property FPFP_Global_NonGrowingBaby_Player Auto Mandatory
	GlobalVariable property FPFP_Global_Craving Auto Mandatory
	GlobalVariable property FPFP_Global_Craving_Chance Auto Mandatory
	GlobalVariable property FPFP_Global_Craving_Cycle Auto Mandatory
	Perk[] Property WLD_Perk_Craving Auto
	GlobalVariable property FPFP_Global_Craving_Message Auto Mandatory
	GlobalVariable property FPFP_Global_PostPartum_Player Auto Mandatory
	
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

Faction Creature_Faction
Faction Creature_Faction_Friendly
int Breeder_mod
int int_monthlycount
bool Married = false
float currentMonth_PP

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

Bool Function IsMenstruating()
	Bool abReturn = False
	
	If Game.IsPluginInstalled("Flashy_PersonalEssentials.esp")
		GlobalVariable Flashy_NeedsHygieneMensus = Game.GetFormFromFile(0x034ECF, "Flashy_PersonalEssentials.esp") as GlobalVariable
		If (Flashy_NeedsHygieneMensus.GetValue() == 1 as float)
			Trace("Player is menstruating", True)
			abReturn = True
		Else
			Trace("Player is not menstruating", True)
		EndIf
	Else
		Trace("AN76 is not installed")
	EndIf
	
	Return abReturn
EndFunction

Function TryForFertility()
	If FPFP_Global_Fertile_Toggle.GetValue() > 0
		If Utility.RandomInt(0,99) < FPFP_Global_Fertile.getValueInt() && !PlayerREF.IsInFaction(FPFP_Preggo) && IsPostPartum == false && !PlayerREF.HasMagicEffect(FPFP_ME_Fertile) && !PlayerREF.HasPerk(WLD_Perk_Fertile) && !PlayerREF.HasPerk(WLD_Perk_Fertile_Both) && !PlayerREF.HasPerk(WLD_Perk_Fertile_Female) && !PlayerREF.HasPerk(WLD_Perk_Fertile_Male) && !PlayerREF.HasPerk(WLD_Perk_Infertile) && !PlayerREF.HasPerk(WLD_Perk_Normal) && !PlayerREF.HasPerk(WLD_Perk_Sterile)
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
	
	;If IsMenstruating()
	;	Trace("Player is menstruating, not valid for pregnancy")
	;	akReturn = False
	;EndIf
					
	Return akReturn

EndFunction

Bool Function TrySpermFrom(Actor akMan) ; takes the impregnation result and uses that to either record a partner or set the dad
		
	bool wasImpregnated = parent.TrySpermFrom(akMan)
	If !wasImpregnated
		FPE.RecordPartner(akMan)
	EndIf
	
	return wasImpregnated

EndFunction

Function Impregnate(Actor akMan, bool advanced = false) ; When called, akWoman is PlayerREF. animation_over event handler in the base script handles player pregnancy
	
	if PlayerREF.HasPerk(WLD_Perk_Pregnancy_Freezing)
		PlayerREF.RemovePerk(WLD_Perk_Pregnancy_Freezing)
		Debug.Notification("FP: Freezing Perk Removed...")
	endIf
	
	bool impregnated = true
	
	if PlayerREF.HasPerk(WLD_Perk_Married) && akMan.HasPerk(WLD_Perk_Married)
		Married = true
	else
		FPE.SetDaddy(akMan) ; Moved setdaddy over to impregnate, as it makes the most sense to record the dad in the incep process then the testing sperm process
	endIf
	
	if akMan.GetLeveledActorBase().GetRace() == HumanRace
		Creature_Cycle = FPFP_Global_Length_Human.GetValue()
		Creature_Perk = WLD_Perk_Impregnated_Special
		
		if Creature_Cycle == 0
			Creature_Cycle = 9
		endIf	
	else
		bool FoundFather_Player = false
		
		FoundFather_Player = FPFP_BabyHandler.FoundtheFather(akMan.GetLeveledActorBase().GetRace())
		if FoundFather_Player
			Creature_Perk = FPFP_BabyHandler.WhatsmyPerk(akMan.GetLeveledActorBase().GetRace())
			Creature_Cycle = FPFP_BabyHandler.Howlongismypregnancy(akMan.GetLeveledActorBase().GetRace())
			Creature_Cycle_Multi = FPFP_BabyHandler.WhatTwins(akMan.GetLeveledActorBase().GetRace())
			if FPFP_Global_Creature_Faction.GetValue() == 1 || FPFP_Global_Creature_Faction.GetValue() == 3
				Creature_Faction = FPFP_BabyHandler.WhatFaction(akMan.GetLeveledActorBase().GetRace())
			elseif FPFP_Global_Creature_Faction.GetValue() == 2 || FPFP_Global_Creature_Faction.GetValue() == 4
				Creature_Faction = FPFP_BabyHandler.WhatFaction_Friendly(akMan.GetLeveledActorBase().GetRace())
			endIf
			
			if Creature_Cycle == 0
				Creature_Cycle = 9
			endIf	
			
		elseIf FoundFather_Player == false
			Creature_Perk = WLD_Perk_Impregnated_Special
			Creature_Cycle = FPFP_Global_Length_Human.GetValue()
		
				if Creature_Cycle == 0
					Creature_Cycle = 9
				endIf	
		EndIf
			
	EndIf
	
	
	if FPFP_Global_Notif_Debug_Impregnation.GetValue() >= 1
		debug.trace("Creature_Cycle for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Creature_Cycle)
		debug.trace("Creature_Faction for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Creature_Faction)
		debug.trace("Creature_Perk for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Creature_Perk)
	endIf
	
	if FPFP_Global_Notif_Debug_Impregnation.GetValue() == 2
		debug.notification("Creature_Cycle for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Creature_Cycle)
		debug.notification("Creature_Faction for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Creature_Faction)
		debug.notification("Creature_Perk for "+Ourself.GetLeveledActorBase().GetName() +"("+Ourself+") is "+ Creature_Perk)
	endIf
	
	If PlayerREF.IsInFaction(FPFP_Preggo)
		impregnated = false
		
		if FPFP_Global_Notif_Pregnant.getValue() > 0
			Debug.trace("You are currently Pregnant")
			Debug.notification("You are currently Pregnant")
		endif
	endif
	
	If IsPostPartum == true && FPFP_Global_PostPartum_Preg.GetValue() == 0
		impregnated = false
		
		if FPFP_Global_Notif_PostPartum.getValue() > 0
			Debug.trace("You are experiencing Post Partum")
			Debug.notification("You are experiencing Post Partum")
		endif
	endif
	
	if !PlayerREF.IsEquipped(Pipboy) && FPFP_Global_RequirePipboy.GetValue() == 1
		impregnated = false
		
		if FPFP_Global_Notif_Pipboy.getValue() > 0
			Debug.trace("Pipboy is not equipped")
			Debug.notification("Pipboy is not equipped")
		endif
	endif
	
	If impregnated && !PlayerREF.IsInFaction(FPFP_Preggo)
	
		if FPFP_Global_Perks_Father.GetValue() == 1
			PlayerREF.AddPerk(Creature_Perk)
			Creature_Perk = NONE
		endif
		
		if FPFP_Global_Creature_Faction.GetValue() >= 2
			if Creature_Faction != None
				PlayerREF.setFactionRank(Creature_Faction, 0)
				if PlayerREF.IsInFaction(Creature_Faction)
					PlayerREF.AddPerk(WLD_Perk_Pheromones)
				endIf
			endIf
		endif
		
		parent.Impregnate(akMan, advanced) ; Do everything that is done by default

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
		
		If IsPregnant
		
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
		
			If !IsPregnant || IsGivingBirth
				return ; Don't do any of this stuff while we are not pregnant, or in labor
			EndIf
			
			If MorningAfterPill ; the player has taken the pill during the first month
				GiveBirth(False)
				INVB_Global_Preggo_Count_Player_Babies.SetValue(INVB_Global_Preggo_Count_Player_Babies.getValue() - 1)
				Debug.MessageBox("The contraceptive you took forced a period.")
				Return
			EndIf
			
			float currentMonth = 0
			
			if Ourself.HasPerk(WLD_Perk_Breeder) && FPFP_Global_Breeder_Grow.GetValue() == 1
				currentMonth = GetCurrentMonth() + Advanced_Start + Breeder_mod
			else
				currentMonth = GetCurrentMonth() + Advanced_Start
			endif
			
			If currentMonth < Creature_Cycle
				UpdateBody(currentMonth)
			else
				UpdateBody(Creature_Cycle)
			EndIf
			
			PlayerREF.SetValue(FPFP_AV_RemainingPregnancy, Creature_Cycle - currentMonth) ;Sets FPFP_AV_RemainingPregnancy to Creature_Cycle
			
			if FPFP_Global_Notif_Debug_Pregnancy.GetValue() >= 1
				debug.trace("currentMonth for "+PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") is "+ currentMonth)
				debug.trace("Creature_Cycle for "+PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") is "+ Creature_Cycle)
				debug.trace("FatherRace for "+PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") is "+ FatherRace)
				debug.trace("NumChildren for "+PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") is "+ NumChildren)
				
				if Creature_Cycle != Creature_Cycle_new
					debug.trace("Creature_Cycle_new for "+PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") is "+ Creature_Cycle_new)
				endIf
			
			endIf
			
			if FPFP_Global_Notif_Debug_Pregnancy.GetValue() == 2
				debug.notification("currentMonth for "+PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") is "+ currentMonth)
				debug.notification("Creature_Cycle for "+PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") is "+ Creature_Cycle)
				debug.notification("FatherRace for "+PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") is "+ FatherRace)
				debug.notification("NumChildren for "+PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") is "+ NumChildren)
				
				if Creature_Cycle != Creature_Cycle_new
					debug.notification("Creature_Cycle_new for "+PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") is "+ Creature_Cycle_new)
				endIf
			endIf
			

			
			if FPFP_Global_Craving_Cycle.GetValue() == 1 && FPFP_Global_Craving.GetValue() >= 1
			
				Int i = 0
				While (i < WLD_Perk_Craving.Length)
					If PlayerREF.HasPerk(WLD_Perk_Craving[i])
						PlayerREF.RemovePerk(WLD_Perk_Craving[i])
					EndIf
					i += 1
				EndWhile
								
				If Utility.RandomInt(0,99) < FPFP_Global_Craving_Chance.getValueInt()
					int int_Craving = Utility.RandomInt(0,WLD_Perk_Craving.Length-1)
					PlayerREF.addperk(WLD_Perk_Craving[int_Craving])
					
					if FPFP_Global_Craving_Message.GetValue() == 0
						Debug.Notification("You have an intense "+ WLD_Perk_Craving[int_Craving].GetName())
					elseif FPFP_Global_Craving_Message.GetValue() == 1
						Debug.MessageBox("You have an intense "+ WLD_Perk_Craving[int_Craving].GetName())
					endIf
				endIf	
			endIf	
			
			If currentMonth < Creature_Cycle && currentMonth >= int_monthlycount
				
				if (FPFP_Global_Perks_Monthly.GetValue() >= 1)
					Int i = 0
					While (i < WLD_Perk_Month.Length)
						If PlayerREF.HasPerk(WLD_Perk_Month[i])
							PlayerREF.RemovePerk(WLD_Perk_Month[i])
						EndIf
						i += 1
					EndWhile

					PlayerREF.AddPerk(WLD_Perk_Month[currentMonth as int])
				endif
				
				if FPFP_Global_Craving_Cycle.GetValue() == 0 && FPFP_Global_Craving.GetValue() >= 1
					Int i = 0
					While (i < WLD_Perk_Craving.Length)
						If PlayerREF.HasPerk(WLD_Perk_Craving[i])
							PlayerREF.RemovePerk(WLD_Perk_Craving[i])
						EndIf
						i += 1
					EndWhile
					
					If Utility.RandomInt(0,99) < FPFP_Global_Craving_Chance.getValueInt()
						int int_Craving = Utility.RandomInt(0,WLD_Perk_Craving.Length-1)
						PlayerREF.addperk(WLD_Perk_Craving[int_Craving])
						
						if FPFP_Global_Craving_Message.GetValue() == 0
							Debug.Notification("You have an intense "+ WLD_Perk_Craving[int_Craving].GetName())
						elseif FPFP_Global_Craving_Message.GetValue() == 1
							Debug.MessageBox("You have an intense "+ WLD_Perk_Craving[int_Craving].GetName())
						endIf
					endIf	
				endIf		
			else
				
				if (FPFP_Global_Perks_Monthly.GetValue() >= 1)
					Int i = 0
					While (i < WLD_Perk_Month.Length)
						If PlayerREF.HasPerk(WLD_Perk_Month[i])
							PlayerREF.RemovePerk(WLD_Perk_Month[i])
						EndIf
						i += 1
					EndWhile
					
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

			If currentMonth >= (Creature_Cycle - FPFP_Global_LactationMonth.GetValue()) && !PlayerREF.HasPerk(Game.GetFormFromFile(0x01012358, "INVB_WastelandDairy.esp") as perk) && !PlayerREF.HasPerk(Game.GetFormFromFile(0x01012359, "INVB_WastelandDairy.esp") as perk) && !PlayerREF.HasPerk(Game.GetFormFromFile(0x0101235C, "INVB_WastelandDairy.esp") as perk)
				PlayerREF.EquipItem(Game.GetFormFromFile(0x0101236E, "INVB_WastelandDairy.esp"), abSilent = True)
			endIf
			
			If currentMonth > 0 && currentMonth < Creature_Cycle && currentMonth >= int_monthlycount
				If FirstCheck
					debug.notification("There's no mistake about it: I'm pregnant!")
					
					if Married == false
						StartFPEPlayerQuests()
					else
						StartFPEPlayerQuests_Married()
					endIf
					
					FirstCheck = False
				EndIf
				
				if PlayerREF.HasPerk(WLD_Perk_Breeder) && FPFP_Global_Breeder_Grow.GetValue() == 1
					if FPFP_Global_Monthly_MessageType.GetValue() == 1
						debug.notification("It now looks like I am in the "+ GetMonthString(currentMonth) +" month of my pregnancy because of the Breeder Virus [The pregnancy is expected to be "+ Creature_Cycle as int +" Months Long].")
					elseif FPFP_Global_Monthly_MessageType.GetValue() == 2
						debug.MessageBox("It now looks like I am in the "+ GetMonthString(currentMonth) +" month of my pregnancy because of the Breeder Virus [The pregnancy is expected to be "+ Creature_Cycle as int +" Months Long].")
					endIf
				else
					if FPFP_Global_Monthly_MessageType.GetValue() == 1		
						debug.notification("It's the "+ GetMonthString(currentMonth) +" month of my pregnancy [The pregnancy is expected to be "+ Creature_Cycle as int +" Months Long].")
					elseif FPFP_Global_Monthly_MessageType.GetValue() == 2
						debug.MessageBox("It's the "+ GetMonthString(currentMonth) +" month of my pregnancy [The pregnancy is expected to be "+ Creature_Cycle as int +" Months Long].")
					endIf
				endIf
				
				If currentMonth >= (Creature_Cycle / 3)
					FPE.TooLateToAbort()
				EndIf
				
				If currentMonth >= (Creature_Cycle / 3)
					PlayerREF.SetValue(FPFP_AV_PregnancyStage, 2) ;Sets FPFP_AV_PregnancyStage to 2 after a abortion is impossible
				EndIf
				
				
				if (currentMonth >= (Creature_Cycle - FPFP_Global_ViableMonth.GetValue())) && FPFP_Global_ViableMonth.GetValue() == 1
					PlayerREF.SetValue(FPFP_AV_PregnancyStage, 3) ;Sets FPFP_AV_PregnancyStage to 3 that it is possible to safely give birth at this stage
				endIf
				
				UpdateBabyHealth()
				
				int_monthlycount = (currentMonth as int) + 1
				
			ElseIf currentMonth >= Creature_Cycle && FPFP_Global_Current_Births_Player.GetValue() < FPFP_Global_Total_Births_Player.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1
				currentMonth_PP = currentMonth
				FPFP_Global_Current_Births_Player.setValue(FPFP_Global_Current_Births_Player.GetValue() + 1)
				Breeder_mod = 0
				
				DoLabour()
				
				;Sthan:  I am adding these parentheses
			elseIf currentMonth >= Creature_Cycle && FPFP_Global_Current_Births_Player.GetValue() >= FPFP_Global_Total_Births_Player.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1 && FPFP_Global_Total_Freeze.GetValue() == 1
				PlayerREF.AddPerk(WLD_Perk_Pregnancy_Freezing)
				Breeder_mod = 0
				Debug.notification("Birth Limit has been reached, Applying Frozen Pregnancy Perk")
			elseIf currentMonth >= Creature_Cycle && FPFP_Global_Current_Births_Player.GetValue() >= FPFP_Global_Total_Births_Player.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1 && FPFP_Global_Total_Freeze.GetValue() == 2
				PlayerREF.AddPerk(WLD_Perk_Birth_Nothing)
				Breeder_mod = 0
				currentMonth_PP = currentMonth
				Debug.notification("Birth Limit has been reached, Applying Nothing Perk(No Baby)")
				GiveBirth()
			elseIf currentMonth >= Creature_Cycle && FPFP_Global_Current_Births_Player.GetValue() >= FPFP_Global_Total_Births_Player.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1 && FPFP_Global_Total_Freeze.GetValue() == 3
				Breeder_mod = 0
				currentMonth_PP = currentMonth
				FPFP_Surrogate.Surrogate(false, PlayerREF, FatherRace, NumChildren)
			elseIf currentMonth >= Creature_Cycle && FPFP_Global_Current_Births_Player.GetValue() >= FPFP_Global_Total_Births_Player.GetValue() && FPFP_Global_BirthLimit.GetValue() == 1 && FPFP_Global_Total_Freeze.GetValue() == 4
				Breeder_mod = 0
				currentMonth_PP = currentMonth
				FPFP_BabyHandler.AddBaby_nongrowing(PlayerREF, FatherRace, NumChildren); TODO Need to figure out algo for birthing
			ElseIf currentMonth >= Creature_Cycle && FPFP_Global_BirthLimit.GetValue() == 0
				Breeder_mod = 0
				currentMonth_PP = currentMonth
				
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
		ElseIf IsPostPartum
		
			if currentMonth_PP > 0
				currentMonth_PP = currentMonth_PP - (FPFP_Global_PostPartum_Power.GetValue() / (FPFP_Global_Day.GetValue() * 2))
			endif

			float total_Sum = currentMonth_PP - (FPFP_Global_PostPartum_Power.GetValue() / (FPFP_Global_Day.GetValue() * 2))
			
			if FPFP_Global_Notif_Debug_Pregnancy.GetValue() >= 1
				debug.trace("currentMonth(PostPartum) for "+PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") is "+ currentMonth_PP)
				Debug.Trace("The total is "+ total_Sum)
				debug.trace("BirthDate for "+PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") is "+ BirthDate)
				debug.trace("IsPostPartum for "+PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") is "+ IsPostPartum)
				debug.trace("NumChildren(Used for Belly size) for "+PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") is "+ NumChildren)
			endIf
			
			if FPFP_Global_Notif_Debug_Pregnancy.GetValue() == 2
				debug.notification("currentMonth(PostPartum) for "+PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") is "+ currentMonth_PP)
				Debug.notification("The total is "+ total_Sum)
				debug.notification("BirthDate for "+PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") is "+ BirthDate)
				debug.notification("IsPostPartum for "+PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") is "+ IsPostPartum)
				debug.notification("NumChildren(Used for Belly size) for "+PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") is "+ NumChildren)
			endIf
			
			UpdateBody(currentMonth_PP)
			
			If (currentMonth_PP <= FPFP_Global_PostPartum_Minimum.GetValue()) 
				FinishPostPartum_Player()
			EndIf
		Endif
		
		If IsPregnant && !IsGivingBirth
			if PlayerREF.HasPerk(WLD_Perk_Breeder) && FPFP_Global_Breeder_Grow.GetValue() == 1
				Breeder_mod += 1
				StartTimerGameTime(FPE.GetUpdateTime_Breeder())
			else
				StartTimerGameTime(FPE.GetUpdateTime_Player())
			endif
		ElseIf IsPostPartum	
			StartTimerGameTime(FPE.GetUpdateTime_PostPartum())
		EndIf
	else
		StartTimerGameTime(FPE.GetUpdateTime_Player())
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
	
	if FPFP_Global_BNotif.GetValue() == 1
		Debug.notification("I am giving birth to the first of many.")
	endif
	
	if FPFP_Global_BloodyBirth.GetValue() == 1
		SP_BloodyBirth.Cast(PlayerREF, PlayerREF)
	endif
	
	PlayerREF.removeFromFaction(FPFP_Preggo)
	
	if FPFP_Surrogate.CheckPerk(PlayerREF)
		FPFP_Surrogate.Surrogate(false, PlayerREF, FatherRace, NumChildren)
	else
		FPFP_BabyHandler.AddBaby(PlayerREF, FatherRace, NumChildren, RadiationDamage)
	Endif
	Game.FadeOutGame(false, true, 0, 1)
	
EndFunction

Function RemovePerks(Race akDadRace)
	
	Int u = 0
	While (u < WLD_Perk_Craving.Length)
		If PlayerREF.HasPerk(WLD_Perk_Craving[u])
			PlayerREF.RemovePerk(WLD_Perk_Craving[u])
		EndIf
		u += 1
	EndWhile
	
	if PlayerREF.HasPerk(WLD_Perk_Pregnancy_Freezing)
		PlayerREF.RemovePerk(WLD_Perk_Pregnancy_Freezing)
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
			
			if PlayerREF.IsInFaction(Creature_Faction)
				PlayerREF.removeFromFaction(Creature_Faction)
			endIf
				
			if PlayerREF.IsInFaction(Creature_Faction_Friendly)
				PlayerREF.removeFromFaction(Creature_Faction_Friendly)
			endIf
				
			if PlayerREF.HasPerk(WLD_Perk_Pheromones)
				PlayerREF.RemovePerk(WLD_Perk_Pheromones)
			endif
		endIf
		
		if PlayerREF.HasPerk(Creature_Perk)
			PlayerREF.RemovePerk(Creature_Perk)
		endif
	endif
	
	if PlayerREF.HasPerk(WLD_Perk_Impregnated_Special)
		PlayerREF.RemovePerk(WLD_Perk_Impregnated_Special)
	endif
	
	if FPFP_Global_Perks_Monthly.GetValue() >= 1	
		Int i = 0
		While (i < WLD_Perk_Month.Length)
			If PlayerREF.HasPerk(WLD_Perk_Month[i])
				PlayerREF.RemovePerk(WLD_Perk_Month[i])
			EndIf
			i += 1
		EndWhile
	endif
	
EndFunction


Function FinishPostPartum_Player() 
		
	BirthDate = -1.0
	currentMonth_PP = 0
	IsPostPartum = false
	
	FatherRace = NONE
	NumChildren = 0 ; All children evac'd
	
	If !Ourself.IsDead()
		DetermineBodyAfterBirth()
	EndIf
		
	if FPFP_Global_PostPartum_Post.GetValue() == 1
		Debug.notification("God, I feel so much better now but I still need some time to recover.")
		PlayerREF.removeperk(WLD_Perk_PostPartum)
		SP_Infertile.Cast(PlayerREF, PlayerREF)
	elseif FPFP_Global_PostPartum.GetValue() >= 1
		Debug.notification("God, I feel so much better now")
		PlayerREF.removeperk(WLD_Perk_PostPartum)	
	endif
	
	PlayerREF.removeFromFaction(FPFP_Preggo)
	
	If !Ourself.Is3DLoaded() || Ourself.IsDeleted() ; we must check that we are unloaded so that we can remove our data. After all, there's no need for pregnancy data if there's no real data to store on an unloaded npc
		Uninitialize()
	EndIf

EndFunction

Bool Function GiveBirth(bool akBirth = True) ; returns whether or not a birth happened so that miscarriage can still happen during labor and dialogue can be written for it
	if PlayerREF.GetValue(FPFP_AV_PregnancyStage) >= 3
		PlayerREF.SetValue(FPFP_AV_PregnancyStage, 0) ;Sets FPFP_AV_PregnancyStage to 0

		if FPFP_Global_UndresswhenBirth.GetValue() >= 1
			if PlayerREF.IsEquipped(Pipboy)
				PlayerREF.unequipall()
				PlayerREF.EquipItem(Pipboy, false, true)
			else
				PlayerREF.unequipall()		
			endIf
		endIf
		

		UnBecomePreggo()
		
		RemovePerks(FatherRace)
		
		If !PlayerREF.HasPerk(Game.GetFormFromFile(0x01012358, "INVB_WastelandDairy.esp") as perk)&& !PlayerREF.HasPerk(Game.GetFormFromFile(0x01012359, "INVB_WastelandDairy.esp") as perk) && !PlayerREF.HasPerk(Game.GetFormFromFile(0x0101235C, "INVB_WastelandDairy.esp") as perk)
			PlayerREF.EquipItem(Game.GetFormFromFile(0x0101236E, "INVB_WastelandDairy.esp"), abSilent = True)
		endIf
		
		UnregisterPlayerPregnancyEvents()
		
		PlayerREF.removeFromFaction(FPFP_Preggo)
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
			
		if FPFP_Global_Notif_Debug_Birth.GetValue() >= 1
			If PlayerREF.HasPerk(WLD_Perk_Birth_Nothing)
				debug.trace(PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") has WLD_Perk_Birth_Nothing")
			elseIf PlayerREF.HasPerk(WLD_Perk_Birth_Nothing_Infanticide)
				debug.trace(PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") has WLD_Perk_Birth_Nothing_Infanticide")
			elseIf PlayerREF.HasPerk(WLD_Perk_Birth_Nothing_Mutated)
				debug.trace(PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") has WLD_Perk_Birth_Nothing_Mutated")
			elseIf PlayerREF.HasPerk(WLD_Perk_Birth_Nothing_Phantom)
				debug.trace(PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") has WLD_Perk_Birth_Nothing_Phantom")
			endif
		endIf
			
		if FPFP_Global_Notif_Debug_Birth.GetValue() == 2
			If PlayerREF.HasPerk(WLD_Perk_Birth_Nothing)
				debug.notification(PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") has WLD_Perk_Birth_Nothing")
			elseIf PlayerREF.HasPerk(WLD_Perk_Birth_Nothing_Infanticide)
				debug.notification(PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") has WLD_Perk_Birth_Nothing_Infanticide")
			elseIf PlayerREF.HasPerk(WLD_Perk_Birth_Nothing_Mutated)
				debug.notification(PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") has WLD_Perk_Birth_Nothing_Mutated")
			elseIf PlayerREF.HasPerk(WLD_Perk_Birth_Nothing_Phantom)
				debug.notification(PlayerREF.GetLeveledActorBase().GetName() +"("+PlayerREF+") has WLD_Perk_Birth_Nothing_Phantom")
			endif
		endIf
		
		if FPFP_Surrogate.CheckPerk(PlayerREF)
			FPFP_Surrogate.Surrogate(true, PlayerREF, FatherRace, NumChildren)
		elseIf PlayerREF.HasPerk(WLD_Perk_Birth_Nothing)
			;Nothing Here
			PlayerREF.RemovePerk(WLD_Perk_Birth_Nothing)	
		elseIf PlayerREF.HasPerk(WLD_Perk_Birth_Nothing_Infanticide)
			;Nothing Here
			PlayerREF.RemovePerk(WLD_Perk_Birth_Nothing_Infanticide)		
		elseIf PlayerREF.HasPerk(WLD_Perk_Birth_Nothing_Mutated)
			;Nothing Here
		elseIf PlayerREF.HasPerk(WLD_Perk_Birth_Nothing_Phantom)
			;Nothing Here
			PlayerREF.RemovePerk(WLD_Perk_Birth_Nothing_Phantom)
			
		elseIf akBirth
			if FPFP_Global_NonGrowingBaby_Player.GetValue() == 2
				FPFP_BabyHandler.AddBaby_dead(PlayerREF, FatherRace, NumChildren); TODO Need to figure out algo for birthing
			elseif FPFP_Global_NonGrowingBaby_Player.GetValue() == 1
				FPFP_BabyHandler.AddBaby_nongrowing(PlayerREF, FatherRace, NumChildren); TODO Need to figure out algo for birthing
			elseif FPFP_Global_NonGrowingBaby_Player.GetValue() == 0
				FPFP_BabyHandler.AddBaby(PlayerREF, FatherRace, NumChildren); TODO Need to figure out algo for birthing
			endIf	
		Endif

		Game.FadeOutGame(false, true, 0, 1)
		
		if FPFP_Global_PostPartum.GetValue() == 0
			DetermineBodyAfterBirth()
		elseif FPFP_Global_PostPartum.GetValue() >= 1
			BirthDate = Utility.GetCurrentGameTime()
			IsPostPartum = true
			NumChildren = 1
			if FPFP_Global_PostPartum_Player.GetValue() == 1 && FPFP_Global_PostPartum.GetValue() >= 1
				PlayerREF.addperk(WLD_Perk_PostPartum)
			endIf
		endIf
		
		ResetVarProps()
		
		FPE.SendBirthEvent(Ourself, akBirth)
		
		Return akBirth

	elseif PlayerREF.GetValue(FPFP_AV_PregnancyStage) >= 1
		PlayerREF.SetValue(FPFP_AV_PregnancyStage, 0) ;Sets FPFP_AV_PregnancyStage to 0
		PlayerREF.SetValue(FPFP_AV_RemainingPregnancy, 0) ;Sets FPFP_AV_RemainingPregnancy to 0
		
		Game.FadeOutGame(true, true, 0, 1, true)
		Utility.Wait(1)
		
		UnregisterPlayerPregnancyEvents()
		
		PlayerREF.removeFromFaction(FPFP_Preggo)
		FPE.StopBabyGeneral()
		FPE.StopDNAQuest()
		FPE.StopDaddyQuest()
		FPE.StopAbortQuest()
		
		If BabyHealth <= 0 || RadiationDamage >= 500
			akBirth = False
		EndIf
		
		RemovePerks(FatherRace)
		
		UnBecomePreggo()
				
		If !PlayerREF.IsDead()
			FatherRace = NONE
			DetermineBodyAfterBirth()
		EndIf
		
		ResetVarProps()
		
		FPE.SendBirthEvent(Ourself, akBirth)
				
		Game.FadeOutGame(false, true, 0, 1)
		
		Return akBirth
		
	endIf
EndFunction

Function ResetVarProps()
	if FPFP_Global_PostPartum.GetValue() == 0
		NumChildren = 0 ; All children evac'd
		BirthDate = -1.0
		IsPostPartum = false
		FatherRace = NONE
	endIf
	
	IncepDate = -1.0
	
	
	LastBabyHealthUpdate = 0 ; make sure that we don't have an update date
	
	IsGivingBirth = False
	
	MorningAfterPill = False
	
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

Function StartFPEPlayerQuests_Married()

	FPE.StartBabyGeneral()
	
	FPE.StartAbort()

EndFunction

Function DoLabour()

	if FPFP_Global_PostPartum.GetValue() >= 1
		IsPostPartum = true
	endIf
	
	PlayerREF.SetValue(FPFP_AV_PregnancyStage, 4) ;Sets FPFP_AV_PregnancyStage to 4 that it is possible to safely give birth at this stage
	
	If !IsPregnant || IsGivingBirth
		Debug.Trace("FPE Player Pregnancy Info Script: Cannot trigger labor right now! We could either not be pregnant, labor is happening, or miscarriage is happening!")
		return ; Don't do any of this stuff while we are not pregnant
	EndIf
	
	IsGivingBirth = True
	
	FPFP_ActorValuePerker.BirthCounter(PlayerREF, FatherRace)
	
	If !PlayerREF.HasPerk(Game.GetFormFromFile(0x01012358, "INVB_WastelandDairy.esp") as perk)&& !PlayerREF.HasPerk(Game.GetFormFromFile(0x01012359, "INVB_WastelandDairy.esp") as perk) && !PlayerREF.HasPerk(Game.GetFormFromFile(0x0101235C, "INVB_WastelandDairy.esp") as perk)
		PlayerREF.EquipItem(Game.GetFormFromFile(0x0101236E, "INVB_WastelandDairy.esp"), abSilent = True)
	endIf
	
	if INVB_Global_ForceLabourQuest.GetValue() == 0
		FPE.DoLabourQuest()
			
	elseif INVB_Global_ForceLabourQuest.GetValue() == 1
		GiveBirth()
	else
		debug.notification("Strange, I should be giving birth around now") 
	endif
	
	
EndFunction

Function StartPostPartum()
	if FPFP_Global_PostPartum.GetValue() >= 1
		IsPostPartum = true
	endIf
	
	If IsPostPartum	
		StartTimerGameTime(FPE.GetUpdateTime_PostPartum())
	EndIf
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