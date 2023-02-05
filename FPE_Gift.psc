Scriptname FPE_Gift extends activemagiceffect

Actor Property PlayerREF Auto Const Mandatory
Bool property bool_Gift = false Auto
Bool property bool_Sexy = false Auto
Potion property aid_Self Auto Const
GlobalVariable property INVB_Global_Marriage_Total Auto Mandatory
ActorValue Property FPFP_AV_Romance_Gift Auto Const
ActorValue Property FPFP_AV_Romance_Gift_Reveal Auto Const
ActorValue Property FPFP_AV_Romance_Sex Auto Const
ActorValue Property FPFP_AV_Romance_Sex_Reveal Auto Const
LeveledItem Property FPFP_Gift Auto Const Mandatory
ActorValue Property FPFP_AV_Romance_Total Auto Const
FPE_Interests Property FPFP_Interests Auto Const Mandatory
string property stringChoice = "Gift" Auto Const
aaf:aaf_api AAF_API 
GlobalVariable property FPFP_Global_GiftSex_Duration Auto
GlobalVariable property FPFP_Global_GiftSex_Chances Auto
Bool bool_SexTime_1 = false 
Bool bool_SexTime_2 = false 

Perk Property WLD_Perk_Romance_Relationship Auto Const
Perk Property WLD_Perk_Romance_Serious Auto Const
Perk Property WLD_Perk_Romance_Hatred Auto Const

perk Property Perk_Delay Auto Const Mandatory
Potion property aid_Delay Auto Const
GlobalVariable property FPFP_Global_Gift_Delay Auto

perk Property Perk_Delay_Sex Auto Const Mandatory
Potion property aid_Delay_Sex Auto Const
GlobalVariable property FPFP_Global_Gift_Delay_Sex Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget = GetActorUnderCrosshairs()
	
	if akTarget != PlayerREF && !akTarget.hasperk(Perk_Delay)
		String ActorName = RenameAnything.GetRefName(akTarget)
		float GiftAmount = akTarget.GetValue(FPFP_AV_Romance_Gift) + Utility.RandomInt(1, 10)
		
		if akTarget.GetValue(FPFP_AV_Romance_Gift_Reveal) == 0
			akTarget.SetValue(FPFP_AV_Romance_Gift_Reveal, Utility.RandomInt(1, akTarget.GetValue(FPFP_AV_Romance_Total) as int /3))
		endIf
		
		if akTarget.HasPerk(WLD_Perk_Romance_Hatred)
			GiftAmount *= 0
		elseIf akTarget.HasPerk(WLD_Perk_Romance_Relationship)
			GiftAmount *= 1.5
		elseIf akTarget.HasPerk(WLD_Perk_Romance_Serious)
			GiftAmount *= 2
		endIf
		
		if stringChoice == "Gift"
			akTarget.SetValue(FPFP_AV_Romance_Gift, GiftAmount * FPFP_Interests.CheckInterest_Gift(akTarget))
		elseif stringChoice == "Guns"
			akTarget.SetValue(FPFP_AV_Romance_Gift, GiftAmount * FPFP_Interests.CheckInterest_Gift_Guns(akTarget))
		elseif stringChoice == "Clothes"
			akTarget.SetValue(FPFP_AV_Romance_Gift, GiftAmount * FPFP_Interests.CheckInterest_Gift_Clothes(akTarget))
		elseif stringChoice == "Drink"
			akTarget.SetValue(FPFP_AV_Romance_Gift, GiftAmount * FPFP_Interests.CheckInterest_Drink(akTarget))
		elseif stringChoice == "Food"
			akTarget.SetValue(FPFP_AV_Romance_Gift, GiftAmount * FPFP_Interests.CheckInterest_Food(akTarget))
		elseif stringChoice == "Drugs"
			akTarget.SetValue(FPFP_AV_Romance_Gift, GiftAmount * FPFP_Interests.CheckInterest_Drugs(akTarget))
		elseif stringChoice == "SexToys"
			akTarget.SetValue(FPFP_AV_Romance_Gift, GiftAmount * FPFP_Interests.CheckInterest_Gift_SexToys(akTarget))	
			if akTarget.GetValue(FPFP_AV_Romance_Gift) > akTarget.GetValue(FPFP_AV_Romance_Gift_Reveal) && Utility.RandomFloat(1,100) <= FPFP_Global_GiftSex_Chances.GetValue() && !akTarget.hasperk(Perk_Delay_Sex)
				SexScene_1(akTarget)
				bool_SexTime_1 = true
				
			endIf
		endIf
		
		if akTarget.GetValue(FPFP_AV_Romance_Gift) > akTarget.GetValue(FPFP_AV_Romance_Gift_Reveal) && Utility.RandomFloat(1,100) <= FPFP_Global_GiftSex_Chances.GetValue() && bool_SexTime_1 == false && !akTarget.hasperk(Perk_Delay_Sex)
			SexScene_2(akTarget)
			bool_SexTime_2 = true
		endIf	
		
		
		if FPFP_Interests.CheckInterest_Gift(akTarget) == 0
			Debug.notification(ActorName+": Thank you but no Thank you.")
			PlayerREF.AddItem(aid_Self, 1, abSilent = True)
		elseif bool_SexTime_1 == true
			Debug.notification(ActorName+": God, This gift is making me horny.")
		elseif bool_SexTime_2 == true
			Debug.notification(ActorName+": Thank you and I have a very special present for you. Take your clothes Off")	
		else
			Debug.notification(ActorName+": Thank you.")
		endIf
		
		if bool_Gift == True && bool_Sexy == true
			akTarget.AddItem(FPFP_Gift) 
		elseif bool_Gift == True
			akTarget.AddItem(FPFP_Gift) 
		endIf
		
		if FPFP_Global_Gift_Delay.GetValue() > 0 && (bool_SexTime_1 == false || bool_SexTime_2 == false)
			akTarget.EquipItem(aid_Delay, abSilent = True)
		elseif FPFP_Global_Gift_Delay_Sex.GetValue() > 0 && (bool_SexTime_1 == true || bool_SexTime_2 == true)
			akTarget.EquipItem(aid_Delay_Sex, abSilent = True)	
		endIf
	elseif akTarget.hasperk(Perk_Delay)
		PlayerREF.AddItem(aid_Self, 1, abSilent = True)
		Debug.notification(RenameAnything.GetRefName(akTarget)+": I should be fine with a new present, tomorrow or later today")
		Debug.notification(RenameAnything.GetRefName(akTarget)+": Thank you but you already gave me a present recently so you can take it back")
	elseif akTarget == PlayerREF && bool_Gift == True
		akTarget.AddItem(FPFP_Gift, abSilent = True) 
	elseif akTarget == PlayerREF
		akTarget.AddItem(aid_Self, 1, abSilent = True) 
	endif
	
EndEvent

Actor Function GetActorUnderCrosshairs()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return PlayerREF
	EndIf
	Return ScannedActor
EndFunction

Function SexScene_2(Actor akActor)

	if akActor.GetValue(FPFP_AV_Romance_Total) == 0
		int Random_Total = (Utility.RandomInt(INVB_Global_Marriage_Total.GetValue() as int / 2, INVB_Global_Marriage_Total.GetValue() as int * 2))
		akActor.SetValue(FPFP_AV_Romance_Total, Random_Total)
	endif
		
	if akActor.GetValue(FPFP_AV_Romance_Sex_Reveal) == 0
		akActor.SetValue(FPFP_AV_Romance_Sex_Reveal, Utility.RandomInt(1, akActor.GetValue(FPFP_AV_Romance_Total) as int /3))
	endIf
	
	float GiftAmount = akActor.GetValue(FPFP_AV_Romance_Sex) + Utility.RandomInt(1, 10)
	akActor.SetValue(FPFP_AV_Romance_Sex, GiftAmount * FPFP_Interests.CheckInterest_Sex(akActor))


	Actor[] Actors = new Actor[2]
	Actors[0] = PlayerREF
	Actors[1] = akActor
	AAF:AAF_API:SceneSettings settings = AAF_API.GetSceneSettings()
				settings.skipWalk = true
				settings.preventFurniture = False
				settings.isNPCControlled = true
	settings.duration = FPFP_Global_GiftSex_Duration.GetValue()
	settings.excludeTags = "Spanking,Jackoff,Pose,Utility,Tease,Foreplay,Finish,TitJob"
	aaf:aaf_api.GetAPI().StartScene(Actors, settings)
EndFunction

Function SexScene_1(Actor akActor)

	Actor[] Actors = new Actor[1]
	Actors[0] = akActor
	AAF:AAF_API:SceneSettings settings = AAF_API.GetSceneSettings()
				settings.skipWalk = true
				settings.preventFurniture = False
				settings.isNPCControlled = true
	settings.duration = FPFP_Global_GiftSex_Duration.GetValue()
	settings.includeTags = "Masturbation"
	aaf:aaf_api.GetAPI().StartScene(Actors, settings)
EndFunction
