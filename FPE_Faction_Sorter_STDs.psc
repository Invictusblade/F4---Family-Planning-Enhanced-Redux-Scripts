Scriptname FPE_Faction_Sorter_STDs extends activemagiceffect

Actor Property PlayerREF Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_STDs Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_STDs_Companion Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_STDs_Faction Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_STDs_Elderly Auto Const Mandatory
GlobalVariable property FPFP_Global_WaitTime_STDs Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Debug_STDs Auto Const Mandatory
FPE_STD Property FPFP_STD Auto Const Mandatory

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
GlobalVariable property FPFP_Global_STDChance_DLC04_Slaves Auto Mandatory

;Companion
Faction Property CurrentCompanionFaction Auto Const Mandatory
Faction Property PotentialCompanionFaction Auto Const Mandatory

;BoS
Faction Property BoSGenericNPCFaction Auto Const Mandatory
Faction Property BrotherhoodofSteelFaction Auto Const Mandatory
;CoA
Faction Property ChildrenOfAtomFaction Auto Const Mandatory
;Captive
Faction Property CaptiveFaction Auto Const Mandatory
;Gunner
Faction Property GunnerFaction Auto Const Mandatory
;Institute
Faction Property InstituteFaction Auto Const Mandatory
Faction Property InstituteRefugeeFaction Auto Const Mandatory
;Synth
Faction Property SynthFaction Auto Const Mandatory
;Minutemen
Faction Property MinutemenFaction Auto Const Mandatory
;Raider
Faction Property RaiderFaction Auto Const Mandatory
;Railroad
Faction Property RailroadFaction Auto Const Mandatory
;Settler
Faction Property CaravanFaction Auto Const Mandatory
Faction Property CovenantFaction Auto Const Mandatory
Faction Property WorkshopNPCFaction Auto Const Mandatory
;Vault81
Faction Property CrimeVault81 Auto Const Mandatory


GlobalVariable property FPFP_Global_FakeAV Auto Mandatory
ActorValue Property FPFP_AV_SexHuman Auto Const
ActorValue Property FPFP_AV_SafeSex Auto Const
float ActorValue_Sex


Keyword Property AnimArchetypeElderly Auto
Keyword Property kw_SpellWorked_STD Auto
WorldSpace Property DiamondCity Auto
WorldSpace Property GoodNeighbor Auto
Cell Property GoodneighborTheThirdRail Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	If akTarget.GetLeveledActorBase().GetName() == PlayerREF.GetLeveledActorBase().GetName()
		if FPFP_Global_Notif_Debug_STDs.GetValue() >= 1
			debug.trace("PlayerREF Double is detected  for "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
		endIf	
			
		if FPFP_Global_Notif_Debug_STDs.GetValue() == 2
			debug.trace("PlayerREF Double is detected  for "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
		endIf
	else
		If PlayerREF.GetWorldSpace() == DiamondCity || PlayerREF.GetWorldSpace() == GoodNeighbor || PlayerREF.GetParentCell() == GoodneighborTheThirdRail
			Utility.Wait(Utility.RandomFloat(1, FPFP_Global_WaitTime_STDs.GetValue()) * 2)
		else	
			Utility.Wait(Utility.RandomFloat(1, FPFP_Global_WaitTime_STDs.GetValue()))
		endIf
		
		
		if  FPFP_Global_Allow_STDs_Companion.GetValue() == 0 && (akTarget.IsInFaction(CurrentCompanionFaction) || akTarget.IsInFaction(PotentialCompanionFaction))
			if FPFP_Global_Notif_Debug_STDs.GetValue() >= 1
				debug.trace("STDs is Not working for Companion "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
			endIf
			
			akTarget.addKeyword(kw_SpellWorked_STD)
			
		elseif !akTarget.HasKeyword(kw_SpellWorked_STD)
			if ((!akTarget.HasKeyword(AnimArchetypeElderly) && FPFP_Global_Allow_STDs_Elderly.GetValue() == 0) || FPFP_Global_Allow_STDs_Elderly.GetValue() == 1)
				
				if FPFP_Global_Notif_Debug_STDs.GetValue() >= 1
					debug.trace("STDs is working for "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
				endIf	
					
				if FPFP_Global_Notif_Debug_STDs.GetValue() == 2
					debug.notification("STDs is working for "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
				endIf
				
				akTarget.addKeyword(kw_SpellWorked_STD)
				Spread_STD(akTarget)
			endIf
		endIf
	endIf
EndEvent

Function Spread_STD(Actor akActor)
	if !akActor.IsDead()
		bool HasSTD = false
		if Utility.RandomFloat(1,100) <= FPFP_Global_Allow_STDs_Companion.GetValue() && akActor.IsInFaction(CurrentCompanionFaction)
			HasSTD = true
			ActorValue_Sex = Utility.RandomFloat(1,10)
			FPFP_STD.Infect_Init(akActor)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_STDChance_BOS.GetValue() && (akActor.IsInFaction(BoSGenericNPCFaction) || akActor.IsInFaction(BrotherhoodofSteelFaction))
			HasSTD = true
			ActorValue_Sex = Utility.RandomFloat(1,10)
			FPFP_STD.Infect_Init(akActor)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_STDChance_COA.GetValue() && akActor.IsInFaction(ChildrenOfAtomFaction)
			FPFP_STD.Infect_Init(akActor)
			HasSTD = true
			ActorValue_Sex = Utility.RandomFloat(1,10)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_STDChance_DLC04_Slaves.GetValue() && akActor.IsInFaction(CaptiveFaction)
			FPFP_STD.Infect_Init(akActor)
			HasSTD = true
			ActorValue_Sex = Utility.RandomFloat(1,100)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_STDChance_Gunner.GetValue() && akActor.IsInFaction(GunnerFaction)
			FPFP_STD.Infect_Init(akActor)
			HasSTD = true
			ActorValue_Sex = Utility.RandomFloat(1,50)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_STDChance_Institute.GetValue() && (akActor.IsInFaction(InstituteFaction) || akActor.IsInFaction(InstituteRefugeeFaction))
			FPFP_STD.Infect_Init(akActor)
			HasSTD = true
			ActorValue_Sex = Utility.RandomFloat(1,5)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_STDChance_Institute_Synth.GetValue() && akActor.IsInFaction(SynthFaction)
			FPFP_STD.Infect_Init(akActor)
			HasSTD = true
			ActorValue_Sex = Utility.RandomFloat(1,10)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_STDChance_MM.GetValue() && akActor.IsInFaction(MinutemenFaction)
			FPFP_STD.Infect_Init(akActor)
			HasSTD = true
			ActorValue_Sex = Utility.RandomFloat(1,10)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_STDChance_Raider.GetValue() && akActor.IsInFaction(RaiderFaction)
			FPFP_STD.Infect_Init(akActor)
			HasSTD = true
			ActorValue_Sex = Utility.RandomFloat(1,100)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_STDChance_RR.GetValue() && akActor.IsInFaction(RailroadFaction)
			FPFP_STD.Infect_Init(akActor)
			HasSTD = true
			ActorValue_Sex = Utility.RandomFloat(1,10)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_STDChance_Vault81.GetValue() && akActor.IsInFaction(CrimeVault81)
			FPFP_STD.Infect_Init(akActor)
			HasSTD = true
			ActorValue_Sex = Utility.RandomFloat(1,5)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_STDChance_Settler.GetValue() && (akActor.IsInFaction(CaravanFaction) || akActor.IsInFaction(CovenantFaction) || akActor.IsInFaction(WorkshopNPCFaction))
			FPFP_STD.Infect_Init(akActor)
			HasSTD = true
			ActorValue_Sex = Utility.RandomFloat(1,10)
		elseIf Utility.RandomFloat(1,100) <= FPFP_Global_Allow_STDs.GetValue()
			FPFP_STD.Infect_Init(akActor)
			HasSTD = true
			ActorValue_Sex = Utility.RandomFloat(1,10)
		endIf

		if FPFP_Global_FakeAV.GetValue() > 1 && HasSTD == true
			akActor.SetValue(FPFP_AV_SexHuman, ActorValue_Sex)
		elseif FPFP_Global_FakeAV.GetValue() == 1
			akActor.SetValue(FPFP_AV_SafeSex, Utility.RandomFloat(1,10))
		endIf
		
		if FPFP_Global_Notif_Debug_STDs.GetValue() >= 1
			Debug_Messages(akActor)
		endIf		
	endIf	
EndFunction


Function Debug_Messages(Actor akActor)
	if FPFP_Global_Allow_STDs_Faction.GetValue() == 1
		if FPFP_Global_Allow_STDs_Companion.GetValue() == 1 && akActor.IsInFaction(CurrentCompanionFaction)
			debug.trace("FPFP_Global_Allow_STDs_Companion.GetValue() = "+ FPFP_Global_Allow_STDs_Companion.GetValue())
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has a STD")
		elseif FPFP_Global_Allow_STDs_Companion.GetValue() == 0 && akActor.IsInFaction(CurrentCompanionFaction)	
			debug.trace("FPFP_Global_Allow_STDs_Companion.GetValue() = "+ FPFP_Global_Allow_STDs_Companion.GetValue())
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has a STD")
		elseif akActor.IsInFaction(BoSGenericNPCFaction) || akActor.IsInFaction(BrotherhoodofSteelFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has a STD")
		elseif akActor.IsInFaction(ChildrenOfAtomFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has a STD")
		elseif akActor.IsInFaction(CaptiveFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has a STD")
		elseif akActor.IsInFaction(GunnerFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has a STD")
		elseif akActor.IsInFaction(InstituteFaction) || akActor.IsInFaction(InstituteRefugeeFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has a STD")
		elseif akActor.IsInFaction(SynthFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has a STD")
		elseif akActor.IsInFaction(MinutemenFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has a STD")
		elseif akActor.IsInFaction(RaiderFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has a STD")
		elseif akActor.IsInFaction(RailroadFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has a STD")
		elseif akActor.IsInFaction(CrimeVault81)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has a STD")
		elseif akActor.IsInFaction(CaravanFaction) || akActor.IsInFaction(CovenantFaction) || akActor.IsInFaction(WorkshopNPCFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has a STD")
		else
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has a STD")
		endIf
	else
		debug.trace("FPFP_Global_Allow_STDs_Faction.GetValue() = "+ FPFP_Global_Allow_STDs_Faction.GetValue())
		debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has a STD")
	endIf
EndFunction