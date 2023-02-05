Scriptname FPE_Faction_Sorter_Traits extends activemagiceffect

Actor Property PlayerREF Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_Traits Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_Traits_Companion Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_Traits_Faction Auto Const Mandatory
GlobalVariable property FPFP_Global_Allow_Traits_Elderly Auto Const Mandatory
GlobalVariable property FPFP_Global_WaitTime_Traits Auto Const Mandatory
GlobalVariable property FPFP_Global_Notif_Debug_Traits Auto Const Mandatory

GlobalVariable property FPFP_Global_BlackTakeover Auto Mandatory
Perk Property WLD_Perk_Racial_Black Auto Const Mandatory
GlobalVariable property FPFP_Global_Vault81Takeover Auto Mandatory

Perk Property WLD_Perk_Sexually_Normal Auto
Perk Property WLD_Perk_Sexually_Sexually Auto
Perk Property WLD_Perk_Sexually_Active Auto
Perk Property WLD_Perk_Sexually_SexuallyShy Auto
;Gift
Perk Property WLD_Perk_Gifts_GoldDigger Auto
Perk Property WLD_Perk_Gifts_Frugal Auto
Perk Property WLD_Perk_Gifts_LoveGuns Auto
Perk Property WLD_Perk_Gifts_HatesGuns Auto
Perk Property WLD_Perk_Gifts_LoveClothes Auto
Perk Property WLD_Perk_Gifts_HatesClothes Auto
Perk Property WLD_Perk_Gifts_LoveSexToys Auto
Perk Property WLD_Perk_Gifts_HatesSexToys Auto
;Drugs
Perk Property WLD_Perk_Drugs_Junkie Auto
Perk Property WLD_Perk_Drugs_Teetotaler Auto

GlobalVariable property FPFP_Global_Traits_Drugs Auto Mandatory
GlobalVariable property FPFP_Global_Traits_Gifts Auto Mandatory
GlobalVariable property FPFP_Global_Traits_Sexually Auto Mandatory


Keyword Property AnimArchetypeElderly Auto
Keyword Property kw_Elderly Auto

ActorValue Property FPFP_AV_Romance_Drugs_Reveal Auto Const
ActorValue Property FPFP_AV_Romance_Gift_Reveal Auto Const
ActorValue Property FPFP_AV_Romance_Sex_Reveal Auto Const
ActorValue Property FPFP_AV_Romance_Total Auto Const
GlobalVariable property INVB_Global_Marriage_Total Auto Mandatory


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

Keyword Property fpfp_Traits Auto
WorldSpace Property DiamondCity Auto
WorldSpace Property GoodNeighbor Auto
Cell Property GoodneighborTheThirdRail Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	If akTarget.GetLeveledActorBase().GetName() == PlayerREF.GetLeveledActorBase().GetName()
		if FPFP_Global_Notif_Debug_Traits.GetValue() >= 1
			debug.trace("PlayerREF Double is detected  for "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
		endIf	
			
		if FPFP_Global_Notif_Debug_Traits.GetValue() == 2
			debug.trace("PlayerREF Double is detected  for "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
		endIf
	else
		If PlayerREF.GetWorldSpace() == DiamondCity || PlayerREF.GetWorldSpace() == GoodNeighbor || PlayerREF.GetParentCell() == GoodneighborTheThirdRail
			Utility.Wait(Utility.RandomFloat(1, FPFP_Global_WaitTime_Traits.GetValue()) * 2)
		else	
			Utility.Wait(Utility.RandomFloat(1, FPFP_Global_WaitTime_Traits.GetValue()))
		endIf
		
		
		if  FPFP_Global_Allow_Traits_Companion.GetValue() == 0 && (akTarget.IsInFaction(CurrentCompanionFaction) || akTarget.IsInFaction(PotentialCompanionFaction))
			if FPFP_Global_Notif_Debug_Traits.GetValue() >= 1
				debug.trace("Traits is Not working for Companion "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
			endIf
			
			akTarget.addKeyword(fpfp_Traits)
			
		elseif !akTarget.HasKeyword(fpfp_Traits)
			if ((!akTarget.HasKeyword(AnimArchetypeElderly) || !akTarget.HasKeyword(kw_Elderly) && FPFP_Global_Allow_Traits_Elderly.GetValue() == 0) || FPFP_Global_Allow_Traits_Elderly.GetValue() == 1)
				
				if FPFP_Global_Notif_Debug_Traits.GetValue() >= 1
					debug.trace("Traits is working for "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
				endIf	
					
				if FPFP_Global_Notif_Debug_Traits.GetValue() == 2
					debug.notification("Traits is working for "+akTarget.GetLeveledActorBase().GetName() +"("+akTarget+")")
				endIf
				
				akTarget.addKeyword(fpfp_Traits)
				Spread_Traits(akTarget)
			endIf
		endIf
	endIf
EndEvent

Function Spread_Traits(Actor akActor)
	if FPFP_Global_Traits_Sexually.GetValue() == 1
		Spread_Traits_Sexually_Straight(akActor)
	elseif FPFP_Global_Traits_Sexually.GetValue() == 2
		Spread_Traits_Sexually_Bisexual(akActor)
	elseif FPFP_Global_Traits_Sexually.GetValue() == 3
		Spread_Traits_Sexually_Gay(akActor)
	endIf

	if FPFP_Global_Traits_Gifts.GetValue() == 1	
		Spread_Traits_Gifts(akActor)
	endIf
	
	if FPFP_Global_Traits_Drugs.GetValue() == 1	
		Spread_Traits_Drugs(akActor)
	endIf
	
	If FPFP_Global_BlackTakeover.GetValue() > 0
		Spread_RacialPerks_Raider(akActor)	
	endIf
	
	
	If (Game.IsPluginInstalled("INVB_WastelandDairy.esp") == TRUE)
		if FPFP_Global_Vault81Takeover.GetValue() > 0
			Spread_RacialPerks_Vault81(akActor)	
		endIf	
	endIf
	
	akActor.SetValue(FPFP_AV_Romance_Total,(Utility.RandomInt(INVB_Global_Marriage_Total.GetValue() as int / 2, INVB_Global_Marriage_Total.GetValue() as int * 2)))
	akActor.SetValue(FPFP_AV_Romance_Drugs_Reveal, Utility.RandomInt(1, akActor.GetValue(FPFP_AV_Romance_Total) as int /3))
	akActor.SetValue(FPFP_AV_Romance_Gift_Reveal, Utility.RandomInt(1, akActor.GetValue(FPFP_AV_Romance_Total) as int /3))
	akActor.SetValue(FPFP_AV_Romance_Sex_Reveal, Utility.RandomInt(1, akActor.GetValue(FPFP_AV_Romance_Total) as int /3))
	
	if FPFP_Global_Notif_Debug_Traits.GetValue() >= 1
		Debug_Messages(akActor)
	endIf			
EndFunction

Function Spread_RacialPerks_Raider(Actor akActor)

	if Utility.RandomFloat(1,100) <= FPFP_Global_BlackTakeover.GetValue() && akActor.IsInFaction(RaiderFaction) && akActor.GetLeveledActorBase().GetSex() == 0 && !akActor.IsDead()
		akActor.AddPerk(WLD_Perk_Racial_Black)
	endIf
	
EndFunction

Function Spread_RacialPerks_Vault81(Actor akActor)
	
	if Utility.RandomFloat(1,100) <= FPFP_Global_Vault81Takeover.GetValue() && akActor.IsInFaction(CrimeVault81) && !akActor.IsDead() && (Game.IsPluginInstalled("INVB_WastelandDairy.esp") == TRUE)
		Perk Perk_Racial_V81 = Game.GetFormFromFile(0x005C8D, "INVB_WastelandDairy.esp") as Perk
		akActor.AddPerk(Perk_Racial_V81)
	endIf

EndFunction


Function Spread_Traits_Sexually_Straight(Actor akActor)
	int Chance_Sex = Utility.Randomint(1,35)
	if Chance_Sex == 1
		akActor.AddPerk(WLD_Perk_Sexually_SexuallyShy)
	elseif Chance_Sex == 2
		akActor.AddPerk(WLD_Perk_Sexually_Sexually)
	elseif Chance_Sex == 3
		akActor.AddPerk(WLD_Perk_Sexually_Sexually)
	elseif Chance_Sex == 4
		akActor.AddPerk(WLD_Perk_Sexually_Sexually)
	elseif Chance_Sex == 5
		akActor.AddPerk(WLD_Perk_Sexually_Sexually)
	elseif Chance_Sex == 6
		akActor.AddPerk(WLD_Perk_Sexually_Sexually)
	elseif Chance_Sex == 7
		akActor.AddPerk(WLD_Perk_Sexually_Sexually)
	elseif Chance_Sex == 8
		akActor.AddPerk(WLD_Perk_Sexually_Active)
	elseif Chance_Sex == 9
		akActor.AddPerk(WLD_Perk_Sexually_Active)
	elseif Chance_Sex == 10
		akActor.AddPerk(WLD_Perk_Sexually_Active)
	elseif Chance_Sex >= 20
		akActor.AddPerk(WLD_Perk_Sexually_Normal)
	endIf
EndFunction

Function Spread_Traits_Sexually_Bisexual(Actor akActor)
	int Chance_Sex = Utility.Randomint(1,35)
	if Chance_Sex == 1
		akActor.AddPerk(WLD_Perk_Sexually_SexuallyShy)
	elseif Chance_Sex == 2
		akActor.AddPerk(WLD_Perk_Sexually_Normal)
	elseif Chance_Sex == 3
		akActor.AddPerk(WLD_Perk_Sexually_Normal)
	elseif Chance_Sex == 4
		akActor.AddPerk(WLD_Perk_Sexually_Normal)
	elseif Chance_Sex == 5
		akActor.AddPerk(WLD_Perk_Sexually_Normal)
	elseif Chance_Sex == 6
		akActor.AddPerk(WLD_Perk_Sexually_Normal)
	elseif Chance_Sex == 7
		akActor.AddPerk(WLD_Perk_Sexually_Normal)
	elseif Chance_Sex == 8
		akActor.AddPerk(WLD_Perk_Sexually_Active)
	elseif Chance_Sex == 9
		akActor.AddPerk(WLD_Perk_Sexually_Active)
	elseif Chance_Sex == 10
		akActor.AddPerk(WLD_Perk_Sexually_Active)
	elseif Chance_Sex >= 20
		akActor.AddPerk(WLD_Perk_Sexually_Sexually)
	endIf
EndFunction

Function Spread_Traits_Sexually_Gay(Actor akActor)
	int Chance_Sex = Utility.Randomint(1,35)
	if Chance_Sex == 1
		akActor.AddPerk(WLD_Perk_Sexually_SexuallyShy)
	elseif Chance_Sex == 2
		akActor.AddPerk(WLD_Perk_Sexually_Normal)
	elseif Chance_Sex == 3
		akActor.AddPerk(WLD_Perk_Sexually_Normal)
	elseif Chance_Sex == 4
		akActor.AddPerk(WLD_Perk_Sexually_Normal)
	elseif Chance_Sex == 5
		akActor.AddPerk(WLD_Perk_Sexually_Normal)
	elseif Chance_Sex == 6
		akActor.AddPerk(WLD_Perk_Sexually_Normal)
	elseif Chance_Sex == 7
		akActor.AddPerk(WLD_Perk_Sexually_Normal)
	elseif Chance_Sex == 8
		akActor.AddPerk(WLD_Perk_Sexually_Sexually)
	elseif Chance_Sex == 9
		akActor.AddPerk(WLD_Perk_Sexually_Sexually)
	elseif Chance_Sex == 10
		akActor.AddPerk(WLD_Perk_Sexually_Sexually)
	elseif Chance_Sex >= 20
		akActor.AddPerk(WLD_Perk_Sexually_Active)
	endIf
EndFunction

Function Spread_Traits_Gifts(Actor akActor)
	int Chance_Gifts = Utility.Randomint(1,10)
	if Chance_Gifts == 1
		akActor.AddPerk(WLD_Perk_Gifts_Frugal)
	elseif Chance_Gifts == 2
		akActor.AddPerk(WLD_Perk_Gifts_GoldDigger)
	elseif Chance_Gifts == 3
		akActor.AddPerk(WLD_Perk_Gifts_HatesClothes)
	elseif Chance_Gifts == 4
		akActor.AddPerk(WLD_Perk_Gifts_HatesGuns)
	elseif Chance_Gifts == 5
		akActor.AddPerk(WLD_Perk_Gifts_LoveClothes)
	elseif Chance_Gifts == 6
		akActor.AddPerk(WLD_Perk_Gifts_LoveGuns)
	elseif Chance_Gifts == 7
		akActor.AddPerk(WLD_Perk_Gifts_LoveSexToys)	
	endIf
	
EndFunction

Function Spread_Traits_Drugs(Actor akActor)
	int Chance_Drugs = Utility.Randomint(1,6)
	if Chance_Drugs == 2
		akActor.AddPerk(WLD_Perk_Drugs_Junkie)
	elseif Chance_Drugs == 4
		akActor.AddPerk(WLD_Perk_Drugs_Teetotaler)
	endIf
EndFunction

Function Debug_Messages(Actor akActor)
	if FPFP_Global_Allow_Traits_Faction.GetValue() == 1
		if FPFP_Global_Allow_Traits_Companion.GetValue() == 1 && akActor.IsInFaction(CurrentCompanionFaction)
			debug.trace("FPFP_Global_Allow_Traits_Companion.GetValue() = "+ FPFP_Global_Allow_Traits_Companion.GetValue())
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has received Traits")
		elseif FPFP_Global_Allow_Traits_Companion.GetValue() == 0 && akActor.IsInFaction(CurrentCompanionFaction)	
			debug.trace("FPFP_Global_Allow_Traits_Companion.GetValue() = "+ FPFP_Global_Allow_Traits_Companion.GetValue())
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has received Traits")
		elseif akActor.IsInFaction(BoSGenericNPCFaction) || akActor.IsInFaction(BrotherhoodofSteelFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has received Traits")
		elseif akActor.IsInFaction(ChildrenOfAtomFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has received Traits")
		elseif akActor.IsInFaction(CaptiveFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has received Traits")
		elseif akActor.IsInFaction(GunnerFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has received Traits")
		elseif akActor.IsInFaction(InstituteFaction) || akActor.IsInFaction(InstituteRefugeeFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has received Traits")
		elseif akActor.IsInFaction(SynthFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has received Traits")
		elseif akActor.IsInFaction(MinutemenFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has received Traits")
		elseif akActor.IsInFaction(RaiderFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has received Traits")
		elseif akActor.IsInFaction(RailroadFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has received Traits")
		elseif akActor.IsInFaction(CrimeVault81)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has received Traits")
		elseif akActor.IsInFaction(CaravanFaction) || akActor.IsInFaction(CovenantFaction) || akActor.IsInFaction(WorkshopNPCFaction)
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has received Traits")
		else
			debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has received Traits")
		endIf
	else
		debug.trace("FPFP_Global_Allow_Traits_Faction.GetValue() = "+ FPFP_Global_Allow_Traits_Faction.GetValue())
		debug.trace(akActor.GetLeveledActorBase().GetName() +"("+akActor+") Has received Traits")
	endIf
EndFunction