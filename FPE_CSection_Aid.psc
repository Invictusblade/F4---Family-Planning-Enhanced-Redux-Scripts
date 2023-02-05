Scriptname FPE_CSection_Aid extends activemagiceffect

FPFP_Player_Script FPE
GlobalVariable property FPFP_Global_CSection_Chance Auto Const Mandatory
GlobalVariable property FPFP_Global_CSection_MonthLimit Auto Const Mandatory
GlobalVariable property FPFP_Global_CSection_Alive Auto Const Mandatory
GlobalVariable property FPFP_Global_CSection_Failure_Chance Auto Const Mandatory
Keyword Property kw_CSection Auto
Keyword Property kw_NoPreg Auto
Faction Property FPFP_Preggo Auto Const Mandatory
Actor Property PlayerREF Auto Const Mandatory

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	akTarget = GetActorUnderCrosshairs()
	
	if akTarget.IsInFaction(FPFP_Preggo)
		if !akTarget.haskeyword(kw_CSection)
			int random_LList_CSection = Utility.RandomInt(1, 100)
			if (random_LList_CSection <= FPFP_Global_CSection_Chance.GetValue())
			
				if akTarget.IsDead()
					
					FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akTarget)
					
					if FPFP_Global_CSection_MonthLimit.GetValue() >= (tmpData.GetCurrentMonth())
						tmpData.GiveBirth(true)
					else	
						tmpData.GiveBirth(false)
					endif
				
				elseif FPFP_Global_CSection_Alive.GetValue() == 1 && !akTarget.IsDead()
					FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akTarget)
					if FPFP_Global_CSection_MonthLimit.GetValue() >= (tmpData.GetCurrentMonth())
						tmpData.GiveBirth(true)
						int random_LList_Failure = Utility.RandomInt(1, 100)
						if (random_LList_Failure <= FPFP_Global_CSection_Failure_Chance.GetValue())
							Debug.notification("You botched the C-Section, while the baby survived. The mother will never have another child because of the damage")
							akTarget.addkeyword(kw_CSection)
							akTarget.addkeyword(kw_NoPreg)
						endif
					else	
						tmpData.GiveBirth(false)
						int random_LList_Failure = Utility.RandomInt(1, 100)
						if (random_LList_Failure <= FPFP_Global_CSection_Failure_Chance.GetValue())
							Debug.notification("You botched the C-Section, there is no hope for babies suvival now and the mother will never have another child because of the damage")
							akTarget.addkeyword(kw_CSection)
							akTarget.addkeyword(kw_NoPreg)
						endif
					endif
				endif
				
			else
				Debug.notification("You botched the C-Section, there is no hope for babies suvival now")
				FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akTarget)
				tmpData.GiveBirth(false)
				akTarget.addkeyword(kw_CSection)	
			endif

		else
			Debug.notification("you have already tried a C-Section, this is a complete waste of resources")
		endif
	else
		Debug.notification(akTarget.GetName() + " is not pregnant")
	endif	
EndEvent



Actor Function GetActorUnderCrosshairs()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return None
	EndIf
	Return ScannedActor
EndFunction