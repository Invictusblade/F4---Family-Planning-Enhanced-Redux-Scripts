Scriptname FPE_NonGrowingBaby extends Quest

Actor Property PlayerREF Auto Const Mandatory

;Companion
Faction Property CurrentCompanionFaction Auto Const Mandatory
Faction Property PotentialCompanionFaction Auto Const Mandatory
;BoS
Faction Property BoSGenericNPCFaction Auto Const Mandatory
Faction Property BrotherhoodofSteelFaction Auto Const Mandatory
;CoA
Faction Property ChildrenOfAtomFaction Auto Const Mandatory
;DLC04Slaves
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

GlobalVariable property FPFP_Global_NonGrowingBaby Auto Mandatory
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
GlobalVariable property FPFP_Global_NonGrowingBaby_DLC04_Slaves Auto Mandatory

int Function NonGrowingBaby(Actor akActor)
	if !akActor.IsDead()
		if akActor.IsInFaction(CurrentCompanionFaction) || akActor.IsInFaction(PotentialCompanionFaction)
			return FPFP_Global_NonGrowingBaby_Companion.GetValue() as int
		elseif (akActor.IsInFaction(BoSGenericNPCFaction) || akActor.IsInFaction(BrotherhoodofSteelFaction))
			return FPFP_Global_NonGrowingBaby_BOS.GetValue() as int
		elseif akActor.IsInFaction(ChildrenOfAtomFaction)
			return FPFP_Global_NonGrowingBaby_COA.GetValue() as int
		elseif akActor.IsInFaction(CaptiveFaction)
			return FPFP_Global_NonGrowingBaby_DLC04_Slaves.GetValue() as int
		elseif akActor.IsInFaction(GunnerFaction)
			return FPFP_Global_NonGrowingBaby_Gunner.GetValue() as int
		elseif (akActor.IsInFaction(InstituteFaction) || akActor.IsInFaction(InstituteRefugeeFaction))
			return FPFP_Global_NonGrowingBaby_Institute.GetValue() as int
		elseif akActor.IsInFaction(SynthFaction)
			return FPFP_Global_NonGrowingBaby_Institute_Synth.GetValue() as int
		elseif akActor.IsInFaction(MinutemenFaction)
			return FPFP_Global_NonGrowingBaby_MM.GetValue() as int
		elseif akActor.IsInFaction(RaiderFaction)
			return FPFP_Global_NonGrowingBaby_Raider.GetValue() as int
		elseif akActor.IsInFaction(RailroadFaction)
			return FPFP_Global_NonGrowingBaby_RR.GetValue() as int
		elseif akActor.IsInFaction(CrimeVault81)
			return FPFP_Global_NonGrowingBaby_Vault81.GetValue() as int
		elseif (akActor.IsInFaction(CaravanFaction) || akActor.IsInFaction(CovenantFaction) || akActor.IsInFaction(WorkshopNPCFaction))
			return FPFP_Global_NonGrowingBaby_Settler.GetValue() as int
		elseIf !akActor == PlayerREF
			return FPFP_Global_NonGrowingBaby.GetValue() as int
		endIf
		
		return 0
	endIf
EndFunction



