Scriptname FPE_Faction_Sorter_Pregnancy extends activemagiceffect

Actor Property PlayerREF Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_Pregnancy Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_Pregnancy_Companion Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_Pregnancy_Faction Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_Pregnancy_Elderly Auto Const Mandatory
GlobalVariable property FPFP_Global_WaitTime_Pregnancy Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Debug_Pregnancy_Distr Auto Const Mandatory

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
GlobalVariable property FPFP_Global_PregnantChance_DLC04_Slaves Auto Mandatory

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
GlobalVariable property FPFP_Global_PregnantChoice_DLC04_Slaves Auto Mandatory

GlobalVariable property FPFP_Global_PregnantChoice Auto Const Mandatory
GlobalVariable property FPFP_Global_PregnantChoice_Companion Auto Const Mandatory

GlobalVariable property FPFP_Global_BirthingChoice Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_BOS Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_Companion Auto Const Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_COA Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_Gunner Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_Institute Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_Institute_Synth Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_MM Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_Raider Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_RR Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_Settler Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_Vault81 Auto Mandatory
GlobalVariable property FPFP_Global_BirthingChoice_DLC04_Slaves Auto Mandatory

GlobalVariable property FPFP_Global_Allow_Pregnancy_Outcomes Auto Mandatory
GlobalVariable property FPFP_Global_Allow_Pregnancy_Outcomes_Elderly Auto Mandatory

Perk Property WLD_Perk_Birth_Nothing Auto Const Mandatory
Perk Property WLD_Perk_Birth_PoorLifestyle Auto Const Mandatory
Perk Property WLD_Perk_Birth_Stillborn Auto Const Mandatory
Perk Property WLD_Perk_Surrogate_1 Auto
Perk Property WLD_Perk_Pregnant_Frozen Auto
Perk Property WLD_Perk_Birth_Nothing_Phantom Auto Const Mandatory
Perk Property WLD_Perk_Birth_Nothing_Infanticide Auto Const Mandatory
Perk Property WLD_Perk_Birth_Nothing_Mutated Auto Const Mandatory

LeveledItem Property FPFP_Everything Auto Const Mandatory
LeveledItem Property FPFP_Pregnant_Both Auto Const Mandatory
LeveledItem Property FPFP_Pregnant_Human Auto Const Mandatory
LeveledItem Property FPFP_Pregnant_Creature Auto Const Mandatory
LeveledItem Property FPFP_Pregnant_Creature_Fuck Auto Const Mandatory
LeveledItem Property FPFP_Baby Auto Const Mandatory

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


bool Pregnant_BoS = false
bool Pregnant_V81 = false
bool bool_Sterile = false
bool Pregnant_Gunner = false
bool Pregnant_Raider = false

LeveledItem Property FPFP_Everything_BoS Auto Const Mandatory
LeveledItem Property FPFP_Pregnant_Both_BoS Auto Const Mandatory
LeveledItem Property FPFP_Pregnant_Human_BoS Auto Const Mandatory
LeveledItem Property FPFP_Pregnant_Creature_BoS Auto Const Mandatory
LeveledItem Property FPFP_Pregnant_Creature_BoS_Fuck Auto Const Mandatory
LeveledItem Property FPFP_Baby_BoS Auto Const Mandatory

LeveledItem Property FPFP_Baby_V81 Auto Const Mandatory
LeveledItem Property FPFP_Pregnant_Human_V81 Auto Const Mandatory

LeveledItem Property FPFP_Everything_Gunner Auto Const Mandatory
LeveledItem Property FPFP_Pregnant_Both_Gunner Auto Const Mandatory
LeveledItem Property FPFP_Pregnant_Human_Gunner Auto Const Mandatory
LeveledItem Property FPFP_Pregnant_Creature_Gunner Auto Const Mandatory
LeveledItem Property FPFP_Pregnant_Creature_Gunner_Fuck Auto Const Mandatory
LeveledItem Property FPFP_Baby_Gunner Auto Const Mandatory

LeveledItem Property FPFP_Everything_Raider Auto Const Mandatory
LeveledItem Property FPFP_Pregnant_Both_Raider Auto Const Mandatory
LeveledItem Property FPFP_Pregnant_Human_Raider Auto Const Mandatory
LeveledItem Property FPFP_Pregnant_Creature_Raider Auto Const Mandatory
LeveledItem Property FPFP_Pregnant_Creature_Raider_Fuck Auto Const Mandatory
LeveledItem Property FPFP_Baby_Raider Auto Const Mandatory

GlobalVariable property FPFP_Global_Sterile Auto Const Mandatory

Perk Property WLD_Perk_Sterile Auto


GlobalVariable property FPFP_Global_PregnancyIssues Auto Const Mandatory

Keyword Property fpfp_PregnancyIssue Auto


GlobalVariable property FPFP_Global_FakeAV Auto Mandatory
ActorValue Property FPFP_AV_SexHuman Auto Const
ActorValue Property FPFP_AV_BirthHuman Auto Const
Keyword Property AnimArchetypeElderly Auto
Keyword Property kw_Elderly Auto
Keyword Property kw_SpellWorked_Pregnancy Auto
WorldSpace Property DiamondCity Auto
WorldSpace Property GoodNeighbor Auto
Cell Property GoodneighborTheThirdRail Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	If akTarget.GetLeveledActorBase().GetName() == PlayerREF.GetLeveledActorBase().GetName()
		if FPFP_Global_Notif_Debug_Pregnancy_Distr.GetValue() >= 1
			debug.trace("PlayerREF Double is detected  for "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
		endIf	
			
		if FPFP_Global_Notif_Debug_Pregnancy_Distr.GetValue() == 2
			debug.trace("PlayerREF Double is detected  for "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
		endIf
	else
		If PlayerREF.GetWorldSpace() == DiamondCity || PlayerREF.GetWorldSpace() == GoodNeighbor || PlayerREF.GetParentCell() == GoodneighborTheThirdRail
			Utility.Wait(Utility.RandomFloat(1, FPFP_Global_WaitTime_Pregnancy.GetValue()) * 2)
		else	
			Utility.Wait(Utility.RandomFloat(1, FPFP_Global_WaitTime_Pregnancy.GetValue()))
		endIf
		
		
		if  FPFP_Global_Allow_Pregnancy_Companion.GetValue() == 0 && (akTarget.IsInFaction(CurrentCompanionFaction) || akTarget.IsInFaction(PotentialCompanionFaction))
			if FPFP_Global_Notif_Debug_Pregnancy_Distr.GetValue() >= 1
				debug.trace("Pregnancy is Not working for Companion "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
			endIf
			
			akTarget.addKeyword(kw_SpellWorked_Pregnancy)
			
		elseif !akTarget.HasKeyword(kw_SpellWorked_Pregnancy)
			if ((!akTarget.HasKeyword(AnimArchetypeElderly) && FPFP_Global_Allow_Pregnancy_Elderly.GetValue() == 0) || FPFP_Global_Allow_Pregnancy_Elderly.GetValue() == 1) && FPFP_Global_Allow_Pregnancy.GetValue() != 0
				
				if FPFP_Global_Notif_Debug_Pregnancy_Distr.GetValue() >= 1
					debug.trace("Pregnancy is working for "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
				endIf	
					
				if FPFP_Global_Notif_Debug_Pregnancy_Distr.GetValue() == 2
					debug.notification("Pregnancy is working for "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
				endIf
				
				If FPFP_Global_PregnancyIssues.GetValue() == 1 && !akTarget.HasKeyword(fpfp_PregnancyIssue)
					Spread_Pregnancy_Traits(akTarget)
					akTarget.AddKeyword(fpfp_PregnancyIssue)
				endIf
				
				akTarget.addKeyword(kw_SpellWorked_Pregnancy)
				Spread_Pregnancy(akTarget)
			endIf
		endIf
	endIf
EndEvent


Function Spread_Pregnancy(Actor akActor)
	if ((bool_Sterile) || !akActor.hasPerk(WLD_Perk_Sterile)) && !akActor.IsDead()
		if Utility.RandomFloat(1,100) <= FPFP_Global_Allow_Pregnancy_Companion.GetValue() && akActor.IsInFaction(CurrentCompanionFaction)
			Pregnancy_Action(akActor, FPFP_Global_PregnantChoice_Companion.GetValue() as int)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_PregnantChance_BOS.GetValue() && (akActor.IsInFaction(BoSGenericNPCFaction) || akActor.IsInFaction(BrotherhoodofSteelFaction))
			Pregnant_BoS = true
			Pregnancy_Action(akActor, FPFP_Global_PregnantChoice_BOS.GetValue() as int)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_PregnantChance_COA.GetValue() && akActor.IsInFaction(ChildrenOfAtomFaction)
			Pregnancy_Action(akActor, FPFP_Global_PregnantChoice_COA.GetValue() as int)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_PregnantChance_DLC04_Slaves.GetValue() && akActor.IsInFaction(CaptiveFaction)
			Pregnancy_Action(akActor, FPFP_Global_PregnantChoice_DLC04_Slaves.GetValue() as int)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_PregnantChance_Gunner.GetValue() && akActor.IsInFaction(GunnerFaction)
			Pregnant_Gunner = true
			Pregnancy_Action(akActor, FPFP_Global_PregnantChoice_Gunner.GetValue() as int)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_PregnantChance_Institute.GetValue() && (akActor.IsInFaction(InstituteFaction) || akActor.IsInFaction(InstituteRefugeeFaction))
			Pregnancy_Action(akActor, FPFP_Global_PregnantChoice_Institute.GetValue() as int)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_PregnantChance_Institute_Synth.GetValue() && akActor.IsInFaction(SynthFaction)
			Pregnancy_Action(akActor, FPFP_Global_PregnantChoice_Institute_Synth.GetValue() as int)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_PregnantChance_MM.GetValue() && akActor.IsInFaction(MinutemenFaction)
			Pregnancy_Action(akActor, FPFP_Global_PregnantChoice_MM.GetValue() as int)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_PregnantChance_Raider.GetValue() && akActor.IsInFaction(RaiderFaction)
			Pregnant_Raider = true
			Pregnancy_Action(akActor, FPFP_Global_PregnantChoice_Raider.GetValue() as int)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_PregnantChance_RR.GetValue() && akActor.IsInFaction(RailroadFaction)
			Pregnancy_Action(akActor, FPFP_Global_PregnantChoice_RR.GetValue() as int)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_PregnantChance_Vault81.GetValue() && akActor.IsInFaction(CrimeVault81)
			Pregnant_V81 = true
			Pregnancy_Action(akActor, FPFP_Global_PregnantChoice_Vault81.GetValue() as int)
		elseif Utility.RandomFloat(1,100) <= FPFP_Global_PregnantChance_Settler.GetValue() && (akActor.IsInFaction(CaravanFaction) || akActor.IsInFaction(CovenantFaction) || akActor.IsInFaction(WorkshopNPCFaction))
			Pregnancy_Action(akActor, FPFP_Global_PregnantChoice_Settler.GetValue() as int)
		elseIf Utility.RandomFloat(1,100) <= FPFP_Global_Allow_Pregnancy.GetValue()
			Pregnancy_Action(akActor, FPFP_Global_PregnantChoice.GetValue() as int)
		endIf
	endIf
EndFunction

Function Pregnancy_Action(Actor akActor, int choice)
	if (bool_Sterile) || !akActor.hasPerk(WLD_Perk_Sterile) && !akActor.IsDead()
		if FPFP_Global_FakeAV.GetValue() == 1
			akActor.SetValue(FPFP_AV_SexHuman, Utility.RandomFloat(1,10))
		endIf 

		if Pregnant_BoS == true
			if choice == 0
				akActor.additem(FPFP_Everything_BoS, abSilent = True)
			elseIf choice == 1
				akActor.additem(FPFP_Pregnant_Both_BoS, abSilent = True)
			elseIf choice == 2
				akActor.additem(FPFP_Pregnant_Human_BoS, abSilent = True)
			elseIf choice == 3
				akActor.additem(FPFP_Pregnant_Creature_BoS_Fuck, abSilent = True)
			elseIf choice == 4
				akActor.additem(FPFP_Pregnant_Creature_BoS, abSilent = True)
			elseIf choice == 5
				akActor.EquipItem(Game.GetFormFromFile(0x0101236E, "INVB_WastelandDairy.esp"), abSilent = True)
				akActor.additem(FPFP_Baby_BoS, abSilent = True)
				if FPFP_Global_FakeAV.GetValue() == 1
					akActor.SetValue(FPFP_AV_BirthHuman, 1)
				endIf
			endIf
			Pregnant_BoS = false
		elseif Pregnant_V81 == true
			if choice == 0 || choice == 1
				akActor.additem(FPFP_Pregnant_Human, abSilent = True)
			elseIf choice == 2 || choice == 3
				akActor.additem(FPFP_Pregnant_Human_V81, abSilent = True)
			elseIf choice == 4
				akActor.EquipItem(Game.GetFormFromFile(0x0101236E, "INVB_WastelandDairy.esp"), abSilent = True)
				akActor.additem(FPFP_Baby_V81, abSilent = True)
				if FPFP_Global_FakeAV.GetValue() == 1
					akActor.SetValue(FPFP_AV_BirthHuman, 1)
				endIf
			endIf
			Pregnant_V81 = false
		elseif Pregnant_Raider == true
			if choice == 0
				akActor.additem(FPFP_Everything_Raider, abSilent = True)
			elseIf choice == 1
				akActor.additem(FPFP_Pregnant_Both_Raider, abSilent = True)
			elseIf choice == 2
				akActor.additem(FPFP_Pregnant_Human_Raider, abSilent = True)
			elseIf choice == 3
				akActor.additem(FPFP_Pregnant_Creature_Raider_Fuck, abSilent = True)
			elseIf choice == 4
				akActor.additem(FPFP_Pregnant_Creature_Raider, abSilent = True)
			elseIf choice == 5
				akActor.EquipItem(Game.GetFormFromFile(0x0101236E, "INVB_WastelandDairy.esp"), abSilent = True)
				akActor.additem(FPFP_Baby_Raider, abSilent = True)
				if FPFP_Global_FakeAV.GetValue() == 1
					akActor.SetValue(FPFP_AV_BirthHuman, 1)
				endIf
			endIf	
			Pregnant_Raider = false
		elseif Pregnant_Gunner == true
			if choice == 0
				akActor.additem(FPFP_Everything_Gunner, abSilent = True)
			elseIf choice == 1
				akActor.additem(FPFP_Pregnant_Both_Gunner, abSilent = True)
			elseIf choice == 2
				akActor.additem(FPFP_Pregnant_Human_Gunner, abSilent = True)
			elseIf choice == 3
				akActor.additem(FPFP_Pregnant_Creature_Gunner_Fuck, abSilent = True)
			elseIf choice == 4
				akActor.additem(FPFP_Pregnant_Creature_Gunner, abSilent = True)
			elseIf choice == 5
				akActor.EquipItem(Game.GetFormFromFile(0x0101236E, "INVB_WastelandDairy.esp"), abSilent = True)
				akActor.additem(FPFP_Baby_Gunner, abSilent = True)
				if FPFP_Global_FakeAV.GetValue() == 1
					akActor.SetValue(FPFP_AV_BirthHuman, 1)
				endIf
			endIf
			Pregnant_Gunner = false
		else
			if choice == 0
				akActor.additem(FPFP_Everything, abSilent = True)
			elseIf choice == 1
				akActor.additem(FPFP_Pregnant_Both, abSilent = True)
			elseIf choice == 2
				akActor.additem(FPFP_Pregnant_Human, abSilent = True)
			elseIf choice == 3
				akActor.additem(FPFP_Pregnant_Creature_Fuck, abSilent = True)
			elseIf choice == 4
				akActor.additem(FPFP_Pregnant_Creature, abSilent = True)
			elseIf choice == 5
				akActor.EquipItem(Game.GetFormFromFile(0x0101236E, "INVB_WastelandDairy.esp"), abSilent = True)
				akActor.additem(FPFP_Baby, abSilent = True)
				if FPFP_Global_FakeAV.GetValue() == 1
					akActor.SetValue(FPFP_AV_BirthHuman, 1)
				endIf
			endIf
		endIf
	endIf
EndFunction

Function Spread_Pregnancy_Traits(Actor akActor)

	if (((!akActor.HasKeyword(AnimArchetypeElderly) || !akActor.HasKeyword(kw_Elderly)) && FPFP_Global_Allow_Pregnancy_Outcomes_Elderly.GetValue() == 0) || FPFP_Global_Allow_Pregnancy_Outcomes_Elderly.GetValue() == 1) && !akActor.IsDead()
		if akActor.IsInFaction(CurrentCompanionFaction)
			Pregnancy_Traits(akActor, FPFP_Global_BirthingChoice_Companion.GetValue() as int)
		elseif (akActor.IsInFaction(BoSGenericNPCFaction) || akActor.IsInFaction(BrotherhoodofSteelFaction))
			Pregnancy_Traits(akActor, FPFP_Global_BirthingChoice_BOS.GetValue() as int)
		elseif akActor.IsInFaction(ChildrenOfAtomFaction)
			Pregnancy_Traits(akActor, FPFP_Global_BirthingChoice_COA.GetValue() as int)
		elseif akActor.IsInFaction(CaptiveFaction)
			Pregnancy_Traits(akActor, FPFP_Global_BirthingChoice_DLC04_Slaves.GetValue() as int)
		elseif akActor.IsInFaction(GunnerFaction)
			Pregnancy_Traits(akActor, FPFP_Global_BirthingChoice_Gunner.GetValue() as int)
		elseif (akActor.IsInFaction(InstituteFaction) || akActor.IsInFaction(InstituteRefugeeFaction))
			Pregnancy_Traits(akActor, FPFP_Global_BirthingChoice_Institute.GetValue() as int)
		elseif akActor.IsInFaction(SynthFaction)
			Pregnancy_Traits(akActor, FPFP_Global_BirthingChoice_Institute_Synth.GetValue() as int)
		elseif akActor.IsInFaction(MinutemenFaction)
			Pregnancy_Traits(akActor, FPFP_Global_BirthingChoice_MM.GetValue() as int)
		elseif akActor.IsInFaction(RaiderFaction)
			Pregnancy_Traits(akActor, FPFP_Global_BirthingChoice_Raider.GetValue() as int)
		elseif akActor.IsInFaction(RailroadFaction)
			Pregnancy_Traits(akActor, FPFP_Global_BirthingChoice_RR.GetValue() as int)
		elseif akActor.IsInFaction(CrimeVault81)
			Pregnancy_Traits(akActor, FPFP_Global_BirthingChoice_Vault81.GetValue() as int)
		elseif (akActor.IsInFaction(CaravanFaction) || akActor.IsInFaction(CovenantFaction) || akActor.IsInFaction(WorkshopNPCFaction))
			Pregnancy_Traits(akActor, FPFP_Global_BirthingChoice_Settler.GetValue() as int)
		else
			Pregnancy_Traits(akActor, FPFP_Global_BirthingChoice.GetValue() as int)
		endIf
	endIf
EndFunction

Function Pregnancy_Traits(Actor akActor, int choice_Outcome)
	if !akActor.IsDead()
		If choice_Outcome == 1 ;Sterile && FPFP_Global_Sterile.GetValue() == 1
			bool_Sterile = true
			akActor.AddPerk(WLD_Perk_Sterile)
		elseIf choice_Outcome == 2 ;DontAsk
			akActor.AddPerk(WLD_Perk_Birth_Nothing)
		elseIf choice_Outcome == 3
			akActor.AddPerk(WLD_Perk_Birth_Nothing_Infanticide)
		elseIf choice_Outcome == 4
			akActor.AddPerk(WLD_Perk_Birth_Nothing_Mutated)
		elseIf choice_Outcome == 5
			akActor.AddPerk(WLD_Perk_Birth_Nothing_Phantom)
		elseIf choice_Outcome == 6 ;PoorLifestyle
			akActor.AddPerk(WLD_Perk_Birth_PoorLifestyle)
		elseIf choice_Outcome == 7 ;Stillborn
			akActor.AddPerk(WLD_Perk_Birth_Stillborn)
		elseIf choice_Outcome == 8 ;Surrogate
			akActor.AddPerk(WLD_Perk_Surrogate_1)
		elseIf choice_Outcome == 9 ;Random
			int random_Outcome = Utility.Randomint(1,6)
			if random_Outcome == 2 && FPFP_Global_Sterile.GetValue() == 1
				akActor.AddPerk(WLD_Perk_Sterile)
				bool_Sterile = true
			elseIf random_Outcome == 3
				akActor.AddPerk(WLD_Perk_Birth_Nothing)
			elseIf random_Outcome == 4
				akActor.AddPerk(WLD_Perk_Birth_Nothing_Infanticide)
			elseIf random_Outcome == 5
				akActor.AddPerk(WLD_Perk_Birth_Nothing_Mutated)
			elseIf random_Outcome == 6
				akActor.AddPerk(WLD_Perk_Birth_Nothing_Phantom)
			elseIf random_Outcome == 7
				akActor.AddPerk(WLD_Perk_Birth_PoorLifestyle)
			elseIf random_Outcome == 8
				akActor.AddPerk(WLD_Perk_Birth_Stillborn)
			elseIf random_Outcome == 9
				akActor.AddPerk(WLD_Perk_Surrogate_1)
			endIf
		endIf
	endIf	
EndFunction





Function Debug_Messages(Actor akActor)
	if FPFP_Global_Allow_Pregnancy_Faction.GetValue() == 1
		if FPFP_Global_Allow_Pregnancy_Companion.GetValue() == 1 && akActor.IsInFaction(CurrentCompanionFaction)
			debug.trace("FPFP_Global_Allow_Pregnancy_Companion.GetValue() = "+ FPFP_Global_Allow_Pregnancy_Companion.GetValue())
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has been impregnated a while ago")
		elseif FPFP_Global_Allow_Pregnancy_Companion.GetValue() == 0 && akActor.IsInFaction(CurrentCompanionFaction)	
			debug.trace("FPFP_Global_Allow_Pregnancy_Companion.GetValue() = "+ FPFP_Global_Allow_Pregnancy_Companion.GetValue())
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has been impregnated a while ago")
		elseif akActor.IsInFaction(BoSGenericNPCFaction) || akActor.IsInFaction(BrotherhoodofSteelFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has been impregnated a while ago")
		elseif akActor.IsInFaction(ChildrenOfAtomFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has been impregnated a while ago")
		elseif akActor.IsInFaction(CaptiveFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has been impregnated a while ago")
		elseif akActor.IsInFaction(GunnerFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has been impregnated a while ago")
		elseif akActor.IsInFaction(InstituteFaction) || akActor.IsInFaction(InstituteRefugeeFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has been impregnated a while ago")
		elseif akActor.IsInFaction(SynthFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has been impregnated a while ago")
		elseif akActor.IsInFaction(MinutemenFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has been impregnated a while ago")
		elseif akActor.IsInFaction(RaiderFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has been impregnated a while ago")
		elseif akActor.IsInFaction(RailroadFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has been impregnated a while ago")
		elseif akActor.IsInFaction(CrimeVault81)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has been impregnated a while ago")
		elseif akActor.IsInFaction(CaravanFaction) || akActor.IsInFaction(CovenantFaction) || akActor.IsInFaction(WorkshopNPCFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has been impregnated a while ago")
		else
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has been impregnated a while ago")
		endIf
	else
		debug.trace("FPFP_Global_Allow_Pregnancy_Faction.GetValue() = "+ FPFP_Global_Allow_Pregnancy_Faction.GetValue())
		debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has been impregnated a while ago")
	endIf
EndFunction