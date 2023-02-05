Scriptname FPE_PreNatalKit extends activemagiceffect

Actor property PlayerRef Auto Const Mandatory
Perk Property WLD_Perk_Birth_Nothing Auto Const Mandatory
Perk Property WLD_Perk_Birth_PoorLifestyle Auto Const Mandatory
Perk Property WLD_Perk_Birth_Stillborn Auto Const Mandatory
Perk Property WLD_Perk_Pregnancy_Frozen Auto
Perk Property WLD_Perk_Birth_Nothing_Phantom Auto Const Mandatory
Perk Property WLD_Perk_Birth_Nothing_Infanticide Auto Const Mandatory
Perk Property WLD_Perk_Birth_Nothing_Mutated Auto Const Mandatory
FPFP_Player_Script FPE
Perk Property Medic01 Auto Const Mandatory
Perk Property Medic02 Auto Const Mandatory
Perk Property Medic03 Auto Const Mandatory
Perk Property Medic04 Auto Const Mandatory


Event OnEffectStart(Actor akTarget, Actor akCaster)
	actor akActor = GetActorUnderCrosshairs()
	String gender_pronoun
	String gender_pronoun_2
	
	float medic_answer = 15
	
	if PlayerRef.HasPerk(Medic04)
		medic_answer = 100
	elseif PlayerRef.HasPerk(Medic03)
		medic_answer = 75
	elseif PlayerRef.HasPerk(Medic02)
		medic_answer = 50
	elseif PlayerRef.HasPerk(Medic01)
		medic_answer = 25
	else
		medic_answer = 15
	endIf
	
	if akActor.GetLeveledActorBase().GetSex() == 0
		gender_pronoun = "his"
		gender_pronoun_2 = "he"
	else	
		gender_pronoun = "her"
		gender_pronoun_2 = "she"
	endif

	if Utility.RandomFloat(1,100) <= medic_answer
		if akActor.HasPerk(WLD_Perk_Pregnancy_Frozen)
			akActor.RemovePerk(WLD_Perk_Pregnancy_Frozen)
			Debug.notification(RenameAnything.GetRefName(akActor) +" has been cured of Static Pregnancies")
		elseIf akActor.HasPerk(WLD_Perk_Birth_Nothing)
			akActor.RemovePerk(WLD_Perk_Birth_Nothing)
			Debug.notification(RenameAnything.GetRefName(akActor) +" has been treated for "+ gender_pronoun +" PreNatal Depression")
		elseIf akActor.HasPerk(WLD_Perk_Birth_Nothing_Phantom)
			akActor.RemovePerk(WLD_Perk_Birth_Nothing_Phantom)
			FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akActor)
			tmpData.GiveBirth(false)
			Debug.notification(RenameAnything.GetRefName(akActor) +" has been treated for "+ gender_pronoun +" phantom pregnancy. She should return to normal soon")
		elseIf akActor.HasPerk(WLD_Perk_Birth_Nothing_Infanticide)
			akActor.RemovePerk(WLD_Perk_Birth_Nothing_Infanticide)
			Debug.notification(RenameAnything.GetRefName(akActor) +" has been treated for "+ gender_pronoun +" extreme PreNatal Depression and Infanticidal ideation")
		elseIf akActor.HasPerk(WLD_Perk_Birth_Nothing_Mutated)
			akActor.RemovePerk(WLD_Perk_Birth_Nothing_Mutated)
			FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akActor)
			tmpData.GiveBirth(false)
			Debug.notification(RenameAnything.GetRefName(akActor) +" has been treated for "+ gender_pronoun +" extreme genetic reproduction damage")
		elseIf akActor.HasPerk(WLD_Perk_Birth_PoorLifestyle)
			akActor.RemovePerk(WLD_Perk_Birth_PoorLifestyle)
			Debug.notification(RenameAnything.GetRefName(akActor) +" has been given some multivitamin")
		elseIf akActor.HasPerk(WLD_Perk_Birth_Stillborn)
			akActor.RemovePerk(WLD_Perk_Birth_Stillborn)
			Debug.notification(RenameAnything.GetRefName(akActor) +" has been given extensive treatment")
		else
			Debug.notification(RenameAnything.GetRefName(akActor) +" shouldn't have anything wrong in regards to PreNatal Care")
		endIf
	else
		Debug.notification(RenameAnything.GetRefName(akActor) +" hasn't been cure yet")
	endif
	
EndEvent

Actor Function GetActorUnderCrosshairs()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return None
	EndIf
	Return ScannedActor
EndFunction