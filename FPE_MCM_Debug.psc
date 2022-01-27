Scriptname FPE_MCM_Debug extends Quest

ActorBase Property ac_FatherCum Auto					; changed from Actor
Actor property PlayerRef Auto Const Mandatory
Keyword Property kw_noPreg Auto
Faction Property FPFP_Preggo Auto Const Mandatory
Keyword Property fpfp_noDaddy Auto
FPFP_Player_Script FPE
Form[] Property Armor_Baby Auto Const Mandatory
Perk[] Property Perk_Pregnancies Auto Const Mandatory
Perk[] Property Perk_Months Auto Const Mandatory
Perk[] Property Perk_STD Auto Const Mandatory
Quest property FPFP_Labour auto const

Perk Property WLD_Perk_Surrogate_1 Auto
Perk Property WLD_Perk_Surrogate_2 Auto
Perk Property WLD_Perk_Surrogate_3 Auto
Keyword Property kw_Surrogate02_perk Auto
Keyword Property kw_Surrogate03_perk Auto
Perk Property WLD_Perk_Pregnancy_Freezing Auto

GlobalVariable property FPFP_Global_Current_Births Auto Const Mandatory
GlobalVariable property FPFP_Global_Current_Births_Player Auto Const Mandatory

Faction[] Property Creature_Factions Auto Const
Perk Property WLD_Perk_Pheromones Auto


Function GiveNPCUnderCrosshairs_Surrogate()
	Actor akActor = GetActorUnderCrosshairs()
	
	if akActor.HasPerk(WLD_Perk_Surrogate_1) || akActor.HasPerk(WLD_Perk_Surrogate_2) || akActor.HasPerk(WLD_Perk_Surrogate_3)
		if akActor.HasPerk(WLD_Perk_Surrogate_1) 
			akActor.removePerk(WLD_Perk_Surrogate_1) 
		elseif akActor.HasPerk(WLD_Perk_Surrogate_2)
			akActor.removePerk(WLD_Perk_Surrogate_2)
			akActor.addkeyword(kw_Surrogate02_perk)	 
		elseif akActor.HasPerk(WLD_Perk_Surrogate_3)
			akActor.removePerk(WLD_Perk_Surrogate_3)
			akActor.addkeyword(kw_Surrogate03_perk)	
		endIf
	else	
		if !akActor.haskeyword(kw_Surrogate02_perk) || !akActor.haskeyword(kw_Surrogate03_perk)	
			akActor.addperk(WLD_Perk_Surrogate_1)
		elseif akActor.haskeyword(kw_Surrogate02_perk)
			akActor.addperk(WLD_Perk_Surrogate_2)
			akActor.removekeyword(kw_Surrogate02_perk)	 
		elseif akActor.haskeyword(kw_Surrogate03_perk)	
			akActor.addperk(WLD_Perk_Surrogate_3)
			akActor.removekeyword(kw_Surrogate03_perk)
		endIf
	endIf
	
EndFunction

Function DoLabourQuest()
	
	debug.notification("I'm going into labour. I need to find a doctor as soon as possible!") 
	FPFP_Labour.Start()
	
EndFunction

Actor Function GetActorUnderCrosshairs()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return PlayerRef
	EndIf
	Return ScannedActor
EndFunction


Function GiveNPCUnderCrosshairs_Ghost()
	Actor akActor = GetActorUnderCrosshairs()
	if akActor.IsGhost()
		akActor.SetGhost(false)
	else
		akActor.SetGhost(true)
	endIf	
EndFunction

Function GiveNPCUnderCrosshairs_Impregnate()
	Actor akActor = GetActorUnderCrosshairs()
	ObjectImpregnate(akActor)
EndFunction


Function GiveNPCUnderCrosshairs_Birth()
	Actor akActor = GetActorUnderCrosshairs()
	if akActor.HasPerk(WLD_Perk_Pregnancy_Freezing)
		akActor.RemovePerk(WLD_Perk_Pregnancy_Freezing)
	endIf
	Instant_Birth(akActor)
EndFunction

Function GiveNPCUnderCrosshairs_Unfrozen()
	Actor akActor = GetActorUnderCrosshairs()
	if akActor.HasPerk(WLD_Perk_Pregnancy_Freezing)
		akActor.RemovePerk(WLD_Perk_Pregnancy_Freezing)
		Debug.Notification("Debug: Success- Removed Frozen Pregnancy Perk")
	else
		Debug.Notification("Debug: Failed- Didn't have or didn't remove Perk")
	endIf
EndFunction

Function GiveNPCUnderCrosshairs_GrowBaby()
	Actor akActor = GetActorUnderCrosshairs()
	BabyGrower(akActor)
EndFunction

Function GiveNPCUnderCrosshairs_GrowChild()
	Actor akActor = GetActorUnderCrosshairs()
	ChildGrower(akActor)
	Debug.Notification("Debug: Growing Child")
EndFunction

Function GiveNPCUnderCrosshairs_LeaveHome()
	Actor akActor = GetActorUnderCrosshairs()
	LeaveHome(akActor)
	Debug.Notification("Debug: Exiling NPC")
EndFunction

Function GiveNPCUnderCrosshairs_Reset()
	Actor akActor = GetActorUnderCrosshairs()
	Bodymorph_Reset(akActor)
	Debug.Notification("Debug: Reset Body Morphs")
EndFunction

Function GiveNPCUnderCrosshairs_Regenerate()
	Actor akActor = GetActorUnderCrosshairs()
	Bodygen.RegenerateMorphs(akActor)
	FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akActor)
	tmpData.UpdateBody(tmpData.GetCurrentMonth())
	Debug.Notification("Debug: Regenerating Body Morphs")
EndFunction

Function GiveNPCUnderCrosshairs_Reduce()
	Actor akActor = GetActorUnderCrosshairs()
	Bodymorph_Reduce(akActor)
	Debug.Notification("Debug: Reduce Body Morphs")
EndFunction

Function GiveNPCUnderCrosshairs_Month_Auto() 
	Actor akActor = GetActorUnderCrosshairs()
	FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akActor)
	tmpData.UpdateBody(tmpData.GetCurrentMonth())
	Debug.Notification("Debug: Bodymorphed to Pregnancy point")
EndFunction

Function GiveNPCUnderCrosshairs_Month_1()
	Actor akActor = GetActorUnderCrosshairs()
	Bodymorph_Rebuild_1(akActor)
	Debug.Notification("Debug: Rebuild Bodymorph 01")
EndFunction

Function GiveNPCUnderCrosshairs_Month_2()
	Actor akActor = GetActorUnderCrosshairs()
	Bodymorph_Rebuild_2(akActor)
	Debug.Notification("Debug: Rebuild Bodymorph 02")
EndFunction

Function GiveNPCUnderCrosshairs_Month_3()
	Actor akActor = GetActorUnderCrosshairs()
	Bodymorph_Rebuild_3(akActor)
	Debug.Notification("Debug: Rebuild Bodymorph 03")
EndFunction

Function GiveNPCUnderCrosshairs_Month_4()
	Actor akActor = GetActorUnderCrosshairs()
	Bodymorph_Rebuild_4(akActor)
	Debug.Notification("Debug: Rebuild Bodymorph 04")
EndFunction

Function GiveNPCUnderCrosshairs_Month_5()
	Actor akActor = GetActorUnderCrosshairs()
	Bodymorph_Rebuild_5(akActor)
	Debug.Notification("Debug: Rebuild Bodymorph 05")
EndFunction

Function GiveNPCUnderCrosshairs_Month_6()
	Actor akActor = GetActorUnderCrosshairs()
	Bodymorph_Rebuild_6(akActor)
	Debug.Notification("Debug: Rebuild Bodymorph 06")
EndFunction

Function GiveNPCUnderCrosshairs_Month_7()
	Actor akActor = GetActorUnderCrosshairs()
	Bodymorph_Rebuild_7(akActor)
	Debug.Notification("Debug: Rebuild Bodymorph 07")
EndFunction

Function GiveNPCUnderCrosshairs_Month_8()
	Actor akActor = GetActorUnderCrosshairs()
	Bodymorph_Rebuild_8(akActor)
	Debug.Notification("Debug: Rebuild Bodymorph 08")
EndFunction

Function GiveNPCUnderCrosshairs_Month_9()
	Actor akActor = GetActorUnderCrosshairs()
	Bodymorph_Rebuild_9(akActor)
	Debug.Notification("Debug: Rebuild Bodymorph 09")
EndFunction

Function GiveNPCUnderCrosshairs_Butcher()
	Actor akActor = GetActorUnderCrosshairs()
	Butcher_NPC(akActor)
	Debug.Notification("Debug: Butchering NPC")
EndFunction

Function GiveNPCUnderCrosshairs_Cage()
	Actor akActor = GetActorUnderCrosshairs()
	Caged_NPC(akActor)
	Debug.Notification("Debug: Caging NPC")
EndFunction

Function GiveNPCUnderCrosshairs_Abort()
	Actor akActor = GetActorUnderCrosshairs()
	Instant_Abort(akActor)
	Debug.Notification("Debug: Aborted Pregnancy")
EndFunction

Function Clear_Factions()
	Actor akActor = GetActorUnderCrosshairs()
	bool Worked = false
	int i
	int int_end = Creature_Factions.Length
	while (i <= Creature_Factions.Length)
		if akActor.IsInFaction(Creature_Factions[i])
			akActor.removeFromFaction(Creature_Factions[i])
			Worked = true
		endIf
		i += 1
	endwhile
	
	if akActor.HasPerk(WLD_Perk_Pheromones)
		akActor.RemovePerk(WLD_Perk_Pheromones)
	endif
	
	if Worked == true
		Debug.Notification("Debug: Success- Removed " + int_end + " Factions")
	else
		Debug.Notification("Debug: Failed- Didn't have or didn't remove Factions")
	endIf	
EndFunction



Function Perk_Remover() 
	Actor akActor = GetActorUnderCrosshairs()
	bool Worked = false
	int i
	int int_end = Perk_Pregnancies.Length
	while (i <= Perk_Pregnancies.Length)
		If akActor.HasPerk(Perk_Pregnancies[i])
			akActor.RemovePerk(Perk_Pregnancies[i])
			Worked = true
		endIf
		i += 1
	endwhile
	
	if Worked == true
		Debug.Notification("Debug: Success- Removed " + int_end + " Perks")
	else
		Debug.Notification("Debug: Failed- Didn't have or didn't remove Perks")
	endIf	
EndFunction

Function Perk_Remover_Month() 
	Actor akActor = GetActorUnderCrosshairs()
	bool Worked = false
	int i
	int int_end = Perk_Months.Length
	while (i <= Perk_Months.Length)
		If akActor.HasPerk(Perk_Months[i])
			akActor.RemovePerk(Perk_Months[i])
			Worked = true
		endIf
		i += 1
	endwhile
	
	if Worked == true
		Debug.Notification("Debug: Success- Removed " + int_end + " Perks")
	else
		Debug.Notification("Debug: Failed- Didn't have or didn't remove Perks")
	endIf	
EndFunction

Function STD_Remover() 
	Actor akActor = GetActorUnderCrosshairs()
	bool Worked = false
	int i
	int int_end = Perk_STD.Length
	while (i <= Perk_STD.Length)
		If akActor.HasPerk(Perk_STD[i])
			akActor.RemovePerk(Perk_STD[i])
			Worked = true
		endIf
		i += 1
	endwhile
	if Worked == true
		Debug.Notification("Debug: Success- Removed STD")
	else
		Debug.Notification("Debug: Failed- Didn't have or didn't remove STD")
	endIf	
EndFunction

Function BabyGrower(Actor akActor)    
	int i
	bool Worked = false
	int int_end = Armor_Baby.Length
	while (i <= Armor_Baby.Length)
		If (akActor.GetItemCount(Armor_Baby[i]) >= 1)
			DropAndGrowIntoChild(akActor, Armor_Baby[i])
			Worked = true
			i = int_end
		endIf
		i += 1
	endwhile
	 
	if Worked == true
		Debug.Notification("Debug: Success- Growing Baby Now")
	else
		Debug.Notification("Debug: Failed- Didn't Grow Baby")
	endIf	
EndFunction

Function LeaveHome(Actor akActor)    
	If (akActor as FPFP_GrowingChildScript)
		(akActor as FPFP_GrowingChildScript).LeavingHome()
	endIf
EndFunction

Function Butcher_NPC(Actor akActor)    
	If (akActor as FPFP_GrowingChildScript)
		(akActor as FPFP_GrowingChildScript).Butchered()
	endIf
EndFunction

Function Caged_NPC(Actor akActor)    
	If (akActor as FPFP_GrowingChildScript)
		(akActor as FPFP_GrowingChildScript).Caged()
	endIf
EndFunction

Function ChildGrower(Actor akActor)    
	If (akActor as FPFP_GrowingChildScript)
		(akActor as FPFP_GrowingChildScript).GrowUp()
	endIf
EndFunction

Function DropAndGrowIntoChild(Actor akActor, Form BabyType)
	; Drop one baby
	akActor.DropObject(BabyType)
    Utility.Wait(0.5)
	; Find the dropped baby
	ObjectReference TheBaby = Game.FindClosestReferenceOfTypeFromRef(BabyType, akActor, 100)
      
	; Grow up the dropped baby
	(TheBaby as FPFP_BabyScript).GrowIntoChild()
EndFunction

Function Instant_Abort(actor akFemale)
    FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
	tmpData.GiveBirth(false)
EndFunction

Function Bodymorph_Reset(actor akFemale)
    FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
	tmpData.ResetBody()
EndFunction

Function Bodymorph_Reduce(actor akFemale)
    FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
	tmpData.ReduceBelly()
EndFunction

Function Bodymorph_Rebuild_1(actor akFemale)
    FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
	tmpData.UpdateBody(1)
EndFunction

Function Bodymorph_Rebuild_2(actor akFemale)
    FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
	tmpData.UpdateBody(2)
EndFunction

Function Bodymorph_Rebuild_3(actor akFemale)
    FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
	tmpData.UpdateBody(3)
EndFunction

Function Bodymorph_Rebuild_4(actor akFemale)
    FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
	tmpData.UpdateBody(4)
EndFunction

Function Bodymorph_Rebuild_5(actor akFemale)
    FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
	tmpData.UpdateBody(5)
EndFunction

Function Bodymorph_Rebuild_6(actor akFemale)
    FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
	tmpData.UpdateBody(6)
EndFunction

Function Bodymorph_Rebuild_7(actor akFemale)
    FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
	tmpData.UpdateBody(7)
EndFunction

Function Bodymorph_Rebuild_8(actor akFemale)
    FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
	tmpData.UpdateBody(8)
EndFunction

Function Bodymorph_Rebuild_9(actor akFemale)
    FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
	tmpData.UpdateBody(9)
EndFunction

Function Instant_Birth(actor akFemale)
	bool Worked = false
	if akFemale.IsInFaction(FPFP_Preggo)
		FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
			Worked = true
		tmpData.GiveBirth(true)
	endIf
	 
	if Worked == true
		Debug.Notification("Debug: Giving Birth Now")
	else
		Debug.Notification("Debug: Failed- Failed to give birth")
	endIf	
EndFunction

Bool Function LoadFPE()
	If Game.IsPluginInstalled("FP_FamilyPlanningEnhanced.esp")
		FPE = FPFP_Player_Script.GetAPI()
		Return True
	Else
		Return false
	EndIf
EndFunction

Function Setup()
    OpenLog()
	If LoadFPE() == true
;		Debug.Trace("FPE Cum Inject: Family Planning Enhanced is loaded")
	Else
;		Debug.Trace("FPE Cum Inject: Family Planning Enhanced not found")
	EndIf
EndFunction


;
; This function takes into account the MCM options like chance of pregnancy, etc
Function TryToMakePregnant(actor akFemale, actor akMale)
	FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
	If (tmpData)
		If (tmpData.DeterminePotentialMan(akMale) != None) && (tmpData.IsValidWoman(akFemale) == true)
			tmpData.TrySpermFrom(akMale)
		EndIf
	EndIf
EndFunction	

;
; This function ignores most MCM settings and simply tries to make the female pregnant
Function MakePregnant(actor akFemale, actor akMale)
    FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
    If (tmpData)
        If (tmpData.IsValidWoman(akFemale) == true)
            tmpData.Impregnate(akMale)
        EndIf
    EndIf
EndFunction

Function ObjectImpregnate(Actor akActor)
	bool Worked = false
	
	If akActor.HasKeyword(kw_noPreg) || akActor.IsInFaction(FPFP_Preggo)

	else
		If akActor.GetLeveledActorBase().GetSex() == 0
		
		else
			Actor tempActor = akActor.PlaceAtMe(ac_FatherCum, abInitiallyDisabled = true) as Actor

			tempActor.AddKeyword(fpfp_noDaddy)
			LogInfo("Equipped Cum Injector")
			if akActor.GetLeveledActorBase().GetSex() == 1
				MakePregnant(akActor, tempActor)
				Worked = true
			endif
		
			tempActor.delete()
		EndIf
	EndIf
	
	if Worked == true
		Debug.Notification("Debug: Success- Has been Impregnated")
	else
		Debug.Notification("Debug: Failed- Didn't get Impregnated")
	endIf
EndFunction


Function Reset_Current_Births_Player()
	Debug.notification("Current Player Births is " + FPFP_Global_Current_Births_Player.getvalue())
	FPFP_Global_Current_Births_Player.setvalue(0)
	Debug.notification("Current Player Births is " + FPFP_Global_Current_Births_Player.getvalue())
EndFunction

Function Reset_Current_Births()
	Debug.notification("Current NPC Births is " + FPFP_Global_Current_Births.getvalue())
	FPFP_Global_Current_Births.setvalue(0)
	Debug.notification("Current NPC Births is " + FPFP_Global_Current_Births.getvalue())
EndFunction

Event OnInit()
	LogMessage("FPE_MCM_Debug OnInit")
	Setup()
EndEvent
;-- Debug/Logging Functions -------------------------

bool Function InDevelopmentMode() DebugOnly
    return False
EndFunction

Function OpenLog() DebugOnly
    Debug.OpenUserLog("Cum Injection")
EndFunction

Function DisplayDebugMessage(string asMessage) DebugOnly
    LogMessage(asMessage, 0)
    If (InDevelopmentMode())
        Debug.Notification(asMessage)
    EndIf
EndFunction

Function LogMessage(string asMessage, int aiSeverity = 0)
    If (InDevelopmentMode())
        Debug.Trace(self + ": " + asMessage, aiSeverity)
    EndIf
    Debug.TraceUser("Cum Injection", self + ": " + asMessage, aiSeverity);
EndFunction

Function LogInfo(string asMessage) DebugOnly
    LogMessage(asMessage, 0)
EndFunction

Function LogWarning(string asMessage) DebugOnly
    LogMessage(asMessage, 1)
EndFunction

Function LogError(string asMessage) DebugOnly
    LogMessage(asMessage, 2)
EndFunction