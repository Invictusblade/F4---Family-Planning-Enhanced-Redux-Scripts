Scriptname FPE_Faction_Sorter_Breeder extends activemagiceffect

Actor Property PlayerREF Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_Breeder Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_Breeder_Companion Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_Breeder_Faction Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_Breeder_Elderly Auto Const Mandatory
GlobalVariable property FPFP_Global_WaitTime_Breeder Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Debug_Breeder Auto Const Mandatory

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
GlobalVariable property FPFP_Global_BreederChance_DLC04_Slaves Auto Mandatory
Perk Property WLD_Perk_Breeder Auto

Keyword Property AnimArchetypeElderly Auto
Keyword Property kw_Elderly Auto
Keyword Property kw_SpellWorked_Breeder Auto
WorldSpace Property DiamondCity Auto
WorldSpace Property GoodNeighbor Auto
Cell Property GoodneighborTheThirdRail Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	If akTarget.GetLeveledActorBase().GetName() == PlayerREF.GetLeveledActorBase().GetName()
		if FPFP_Global_Notif_Debug_Breeder.GetValue() >= 1
			debug.trace("PlayerREF Double is detected  for "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
		endIf	
			
		if FPFP_Global_Notif_Debug_Breeder.GetValue() == 2
			debug.trace("PlayerREF Double is detected  for "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
		endIf
	else
		If PlayerREF.GetWorldSpace() == DiamondCity || PlayerREF.GetWorldSpace() == GoodNeighbor || PlayerREF.GetParentCell() == GoodneighborTheThirdRail
			Utility.Wait(Utility.RandomFloat(1, FPFP_Global_WaitTime_Breeder.GetValue()) * 2)
		else	
			Utility.Wait(Utility.RandomFloat(1, FPFP_Global_WaitTime_Breeder.GetValue()))
		endIf
		
		
		if  FPFP_Global_Allow_Breeder_Companion.GetValue() == 0 && (akTarget.IsInFaction(CurrentCompanionFaction) || akTarget.IsInFaction(PotentialCompanionFaction))
			if FPFP_Global_Notif_Debug_Breeder.GetValue() >= 1
				debug.trace("Breeder Virus is Not working for Companion "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
			endIf
			
			akTarget.addKeyword(kw_SpellWorked_Breeder)
			
		elseif !akTarget.HasKeyword(kw_SpellWorked_Breeder)
			if (((!akTarget.HasKeyword(AnimArchetypeElderly) || !akTarget.HasKeyword(kw_Elderly)) && FPFP_Global_Allow_Breeder_Elderly.GetValue() == 0) || FPFP_Global_Allow_Breeder_Elderly.GetValue() == 1) && !akTarget.IsDead()
				if FPFP_Global_Notif_Debug_Breeder.GetValue() >= 1
					debug.trace("Breeder Virus is working for "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
				endIf	
					
				if FPFP_Global_Notif_Debug_Breeder.GetValue() == 2
					debug.notification("Breeder Virus is working for "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
				endIf
				
				akTarget.addKeyword(kw_SpellWorked_Breeder)
				Spread_Breeder(akTarget)
			endIf
		endIf
	endIf
EndEvent


Function Spread_Breeder(Actor akActor)
	if !akActor.IsDead()
		if FPFP_Global_Allow_Breeder_Faction.GetValue() == 1
			if Utility.RandomFloat(1,100) <= FPFP_Global_Allow_Breeder_Companion.GetValue() && akActor.IsInFaction(CurrentCompanionFaction)
				akActor.AddPerk(WLD_Perk_Breeder)
			elseif Utility.RandomFloat(1,100) <= FPFP_Global_BreederChance_BOS.GetValue() && (akActor.IsInFaction(BoSGenericNPCFaction) || akActor.IsInFaction(BrotherhoodofSteelFaction))
				akActor.AddPerk(WLD_Perk_Breeder)
			elseif Utility.RandomFloat(1,100) <= FPFP_Global_BreederChance_COA.GetValue() && akActor.IsInFaction(ChildrenOfAtomFaction)
				akActor.AddPerk(WLD_Perk_Breeder)
			elseif Utility.RandomFloat(1,100) <= FPFP_Global_BreederChance_DLC04_Slaves.GetValue() && akActor.IsInFaction(CaptiveFaction)
				akActor.AddPerk(WLD_Perk_Breeder)
			elseif Utility.RandomFloat(1,100) <= FPFP_Global_BreederChance_Gunner.GetValue() && akActor.IsInFaction(GunnerFaction)
				akActor.AddPerk(WLD_Perk_Breeder)
			elseif Utility.RandomFloat(1,100) <= FPFP_Global_BreederChance_Institute.GetValue() && (akActor.IsInFaction(InstituteFaction) || akActor.IsInFaction(InstituteRefugeeFaction))
				akActor.AddPerk(WLD_Perk_Breeder)
			elseif Utility.RandomFloat(1,100) <= FPFP_Global_BreederChance_Institute_Synth.GetValue() && akActor.IsInFaction(SynthFaction)
				akActor.AddPerk(WLD_Perk_Breeder)
			elseif Utility.RandomFloat(1,100) <= FPFP_Global_BreederChance_MM.GetValue() && akActor.IsInFaction(MinutemenFaction)
				akActor.AddPerk(WLD_Perk_Breeder)
			elseif Utility.RandomFloat(1,100) <= FPFP_Global_BreederChance_Raider.GetValue() && akActor.IsInFaction(RaiderFaction)
				akActor.AddPerk(WLD_Perk_Breeder)
			elseif Utility.RandomFloat(1,100) <= FPFP_Global_BreederChance_RR.GetValue() && akActor.IsInFaction(RailroadFaction)
				akActor.AddPerk(WLD_Perk_Breeder)
			elseif Utility.RandomFloat(1,100) <= FPFP_Global_BreederChance_Vault81.GetValue() && akActor.IsInFaction(CrimeVault81)
				akActor.AddPerk(WLD_Perk_Breeder)
			elseif Utility.RandomFloat(1,100) <= FPFP_Global_BreederChance_Settler.GetValue() && (akActor.IsInFaction(CaravanFaction) || akActor.IsInFaction(CovenantFaction) || akActor.IsInFaction(WorkshopNPCFaction))
				akActor.AddPerk(WLD_Perk_Breeder)
			elseIf Utility.RandomFloat(1,100) <= FPFP_Global_Allow_Breeder.GetValue()
				akActor.AddPerk(WLD_Perk_Breeder)
			endIf
		elseIf Utility.RandomFloat(1,100) <= FPFP_Global_Allow_Breeder.GetValue()
			akActor.AddPerk(WLD_Perk_Breeder)
		endIf	
	endIf
	
	if FPFP_Global_Notif_Debug_Breeder.GetValue() >= 1
		Debug_Messages(akActor)
	endIf	
EndFunction

Function Debug_Messages(Actor akActor)
	if FPFP_Global_Allow_Breeder_Faction.GetValue() == 1
		if FPFP_Global_Allow_Breeder_Companion.GetValue() == 1 && akActor.IsInFaction(CurrentCompanionFaction)
			debug.trace("FPFP_Global_Allow_Breeder_Companion.GetValue() = "+ FPFP_Global_Allow_Breeder_Companion.GetValue())
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has the Breeder Virus")
		elseif FPFP_Global_Allow_Breeder_Companion.GetValue() == 0 && akActor.IsInFaction(CurrentCompanionFaction)	
			debug.trace("FPFP_Global_Allow_Breeder_Companion.GetValue() = "+ FPFP_Global_Allow_Breeder_Companion.GetValue())
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has the Breeder Virus")
		elseif akActor.IsInFaction(BoSGenericNPCFaction) || akActor.IsInFaction(BrotherhoodofSteelFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has the Breeder Virus")
		elseif akActor.IsInFaction(ChildrenOfAtomFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has the Breeder Virus")
		elseif akActor.IsInFaction(CaptiveFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has the Breeder Virus")
		elseif akActor.IsInFaction(GunnerFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has the Breeder Virus")
		elseif akActor.IsInFaction(InstituteFaction) || akActor.IsInFaction(InstituteRefugeeFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has the Breeder Virus")
		elseif akActor.IsInFaction(SynthFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has the Breeder Virus")
		elseif akActor.IsInFaction(MinutemenFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has the Breeder Virus")
		elseif akActor.IsInFaction(RaiderFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has the Breeder Virus")
		elseif akActor.IsInFaction(RailroadFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has the Breeder Virus")
		elseif akActor.IsInFaction(CrimeVault81)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has the Breeder Virus")
		elseif akActor.IsInFaction(CaravanFaction) || akActor.IsInFaction(CovenantFaction) || akActor.IsInFaction(WorkshopNPCFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has the Breeder Virus")
		else
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has the Breeder Virus")
		endIf
	else
		debug.trace("FPFP_Global_Allow_Breeder_Faction.GetValue() = "+ FPFP_Global_Allow_Breeder_Faction.GetValue())
		debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has the Breeder Virus")
	endIf
EndFunction