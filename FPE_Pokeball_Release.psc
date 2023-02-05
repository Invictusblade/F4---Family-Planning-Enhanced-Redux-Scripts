Scriptname FPE_Pokeball_Release extends activemagiceffect

bool Property Has_Array Auto Const
Actorbase Property Creature_Donor Auto Const
Actorbase[] Property Creature_Donors Auto Const
FPE_BabyNames Property FPFP_BabyNames Auto Const Mandatory
Race Property OtherRace Auto
Bool Property OtherRace_bool = false Auto
String SummonName

Event OnEffectStart(Actor akActor, Actor akCaster)
	if Has_Array == false
		Game.FadeOutGame(true, true, 0, 1, true)
			Utility.Wait(1)
			Debug.notification("Ten Minutes Later.")
			Utility.Wait(1)
			
		Actor tempActor = akCaster.PlaceAtMe(Creature_Donor) as Actor
	
		if tempActor.GetLeveledActorBase().GetSex() == 0
			if OtherRace_bool == true
				SummonName = FPFP_BabyNames.BabyNames_Male(OtherRace)
			else	
				SummonName = FPFP_BabyNames.BabyNames_Male(tempActor.GetLeveledActorBase().GetRace())
			endif
		else
			if OtherRace_bool == true
				SummonName = FPFP_BabyNames.BabyNames_Female(OtherRace)
			else	
				SummonName = FPFP_BabyNames.BabyNames_Female(tempActor.GetLeveledActorBase().GetRace())
			endif
		endif
		
		RenameAnything.SetRefName(tempActor, SummonName)
		Game.FadeOutGame(false, true, 0, 1)	
	elseif Has_Array == true
		Game.FadeOutGame(true, true, 0, 1, true)
			Utility.Wait(1)
			Debug.notification("Ten Minutes Later.")
			Utility.Wait(1)
		int random_Gift = Utility.RandomInt(0, Creature_Donors.Length-1)
		
		Actor tempActor = akCaster.PlaceAtMe(Creature_Donors[random_Gift]) as Actor
		
		if tempActor.GetLeveledActorBase().GetSex() == 0
			if OtherRace_bool == true
				SummonName = FPFP_BabyNames.BabyNames_Male(OtherRace)
			else	
				SummonName = FPFP_BabyNames.BabyNames_Male(tempActor.GetLeveledActorBase().GetRace())
			endif
		else
			if OtherRace_bool == true
				SummonName = FPFP_BabyNames.BabyNames_Female(OtherRace)
			else	
				SummonName = FPFP_BabyNames.BabyNames_Female(tempActor.GetLeveledActorBase().GetRace())
			endif
		endif
		
		RenameAnything.SetRefName(tempActor, SummonName)
		Game.FadeOutGame(false, true, 0, 1)	
	endif	
EndEvent