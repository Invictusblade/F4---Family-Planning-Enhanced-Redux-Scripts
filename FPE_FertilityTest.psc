Scriptname FPE_FertilityTest extends activemagiceffect

FPFP_Player_Script Property FPE Auto Const Mandatory
Actor Property PlayerREF Auto Const Mandatory
Perk Property WLD_Perk_Infertile Auto Const Mandatory
Perk Property WLD_Perk_Normal Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Both Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Female Auto Const Mandatory
Perk Property WLD_Perk_Fertile_Male Auto Const Mandatory
Perk Property WLD_Perk_Breeder Auto

MagicEffect property FPFP_ME_Pill auto const Mandatory
MagicEffect property FPFP_ME_Fertile auto const Mandatory

GlobalVariable property FPFP_Global_Chance_Player_F Auto Const Mandatory
GlobalVariable property FPFP_Global_Chance_Player_M Auto Const Mandatory
GlobalVariable property FPFP_Global_Chance Auto Const Mandatory
GlobalVariable property FPFP_Global_Breeder_modifier Auto Const Mandatory
GlobalVariable property FPFP_Global_FertileEffects Auto Const Mandatory
GlobalVariable property FPFP_Global_Contra Auto Const Mandatory

Faction Property FPFP_Preggo Auto Const Mandatory

String NPC_Name
String NPC_String

Event OnEffectStart(Actor Ourself, Actor akCaster)
	Ourself = GetActorUnderCrosshairs()
	float chance
	
	If !Ourself.IsInFaction(FPFP_Preggo)
		If Ourself == PlayerREF && PlayerREF.GetLeveledActorBase().GetSex() == 1
			chance = FPFP_Global_Chance_Player_F.getValue() ;Receiver
			NPC_Name = PlayerREF.GetLeveledActorBase().GetName()
		elseIf Ourself == PlayerREF && PlayerREF.GetLeveledActorBase().GetSex() == 0
			chance = FPFP_Global_Chance_Player_M.getValue() ;Receiver
			NPC_Name = PlayerREF.GetLeveledActorBase().GetName()
		else
			chance = FPFP_Global_Chance.getValue()	
			NPC_Name = Ourself.GetLeveledActorBase().GetName()
		endif
		
		if Ourself.HasMagicEffect(FPFP_ME_Fertile) || Ourself.HasPerk(WLD_Perk_Fertile_Both) || Ourself.HasPerk(WLD_Perk_Fertile_Female) || Ourself.HasPerk(WLD_Perk_Fertile_Male)
			chance *= FPFP_Global_FertileEffects.getValue()
		Endif
		
		if Ourself.HasPerk(WLD_Perk_Infertile)
			chance *= ((100 - FPFP_Global_Contra.getValue()) * 0.01)
		Endif
		
		If Ourself.HasPerk(WLD_Perk_Breeder)
			chance *= FPFP_Global_Breeder_modifier.GetValue()
		endIf
		
		If Ourself.HasMagicEffect(FPFP_ME_Pill) ; Is the woman on the pill?
			chance *= ((100 - FPFP_Global_Contra.getValue()) * 0.01)
		Endif
		
		
		
		NPC_String = NPC_Name +" has an Impregnation chance of "+ chance as int +"%"+"\n"		
		
		
		
		if Ourself.HasMagicEffect(FPFP_ME_Fertile) || Ourself.HasPerk(WLD_Perk_Fertile_Both) || Ourself.HasPerk(WLD_Perk_Fertile_Female) || Ourself.HasPerk(WLD_Perk_Fertile_Male)
			NPC_String += " and is fertile"+"\n"
		Endif
		
		if Ourself.HasPerk(WLD_Perk_Infertile)
			NPC_String += " and is Infertile"+"\n"
		Endif
		
		If Ourself.HasPerk(WLD_Perk_Breeder)
			NPC_String += " and is infected with breeder virus"
		endIf
		
		If Ourself.HasMagicEffect(FPFP_ME_Pill) ; Is the woman on the pill?
			NPC_String += " and is on the Pill"+"\n"
		Endif

		Debug.MessageBox(NPC_String)
		
	elseIf Ourself.IsInFaction(FPFP_Preggo)
		If Ourself == PlayerREF
			FPE.ShowPlayerPregnancyInfo()
		else
			FPE.ShowNPCUnderCrosshairsPregnancyInfo()
		endIf
	endIf
EndEvent

Actor Function GetActorUnderCrosshairs()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return PlayerREF
	EndIf
	Return ScannedActor
EndFunction