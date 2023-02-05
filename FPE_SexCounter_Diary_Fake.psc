Scriptname FPE_SexCounter_Diary_Fake extends activemagiceffect

Actor property PlayerRef Auto Const Mandatory
FPE_MCM_Debug Property FPFP_MCM_Debug Auto Const Mandatory
potion Property potion_self_new Auto
potion Property potion_self Auto
ActorValue Property FPFP_AV_SexHuman Auto Const
ActorValue Property FPFP_AV_BirthHuman Auto Const
ActorValue Property FPFP_AV_SafeSex Auto Const
ActorValue Property FPFP_AV_SexHuman_Player Auto Const
GlobalVariable property FPFP_Global_FakeAV Auto Mandatory


Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget == PlayerREF && PlayerREF.GetLeveledActorBase().GetSex() == 0 && FPFP_Global_FakeAV.GetValue() == 2 ;Claste
		akTarget.SetValue(FPFP_AV_SexHuman, Utility.RandomFloat(1,10))
		akTarget.SetValue(FPFP_AV_SafeSex, Utility.RandomFloat(1,10))
		akTarget.SetValue(FPFP_AV_SexHuman_Player, 1)
	elseif akTarget == PlayerREF && PlayerREF.GetLeveledActorBase().GetSex() == 0 && FPFP_Global_FakeAV.GetValue() == 3 ;Normal
		akTarget.SetValue(FPFP_AV_SexHuman, Utility.RandomFloat(1,50))
		akTarget.SetValue(FPFP_AV_SafeSex, Utility.RandomFloat(1,10))
		akTarget.SetValue(FPFP_AV_SexHuman_Player, Utility.RandomFloat(1,10))		
	elseif akTarget == PlayerREF && PlayerREF.GetLeveledActorBase().GetSex() == 0 && FPFP_Global_FakeAV.GetValue() == 4 ;Swinger
		akTarget.SetValue(FPFP_AV_SexHuman, Utility.RandomFloat(1,100))
		akTarget.SetValue(FPFP_AV_SafeSex, Utility.RandomFloat(1,10))
		akTarget.SetValue(FPFP_AV_SexHuman_Player, Utility.RandomFloat(1,10))
	elseif akTarget == PlayerREF && PlayerREF.GetLeveledActorBase().GetSex() == 1 && FPFP_Global_FakeAV.GetValue() == 2 ;Claste
		akTarget.SetValue(FPFP_AV_BirthHuman, 1)
		akTarget.SetValue(FPFP_AV_SafeSex, Utility.RandomFloat(1,10))
		akTarget.SetValue(FPFP_AV_SexHuman, Utility.RandomFloat(1,10))
		akTarget.SetValue(FPFP_AV_SexHuman_Player, 1)		
	elseif akTarget == PlayerREF && PlayerREF.GetLeveledActorBase().GetSex() == 1 && FPFP_Global_FakeAV.GetValue() == 3 ;Normal
		akTarget.SetValue(FPFP_AV_BirthHuman, 1)
		akTarget.SetValue(FPFP_AV_SafeSex, Utility.RandomFloat(1,0))
		akTarget.SetValue(FPFP_AV_SexHuman, Utility.RandomFloat(1,50))
		akTarget.SetValue(FPFP_AV_SexHuman_Player, Utility.RandomFloat(1,10))		
	elseif akTarget == PlayerREF && PlayerREF.GetLeveledActorBase().GetSex() == 1 && FPFP_Global_FakeAV.GetValue() == 4 ;Swinger
		akTarget.SetValue(FPFP_AV_BirthHuman, 1)
		akTarget.SetValue(FPFP_AV_SafeSex, Utility.RandomFloat(1,100))
		akTarget.SetValue(FPFP_AV_SexHuman, Utility.RandomFloat(1,100))	
		akTarget.SetValue(FPFP_AV_SexHuman_Player, Utility.RandomFloat(1,10))
	endif

	if akTarget == PlayerREF
		FPFP_MCM_Debug.GiveNPCUnderCrosshairs_Counter_Sex()
		FPFP_MCM_Debug.GiveNPCUnderCrosshairs_Counter_Births()
		FPFP_MCM_Debug.GiveNPCUnderCrosshairs_Counter_Misc()
		akcaster.additem(potion_self_new, 1, true)	
	elseif !akTarget == PlayerREF
		akcaster.additem(potion_self, 1, true)
	endif	
	
EndEvent