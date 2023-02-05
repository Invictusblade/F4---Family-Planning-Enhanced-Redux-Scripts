Scriptname FPE_SexScene_Lines extends activemagiceffect

Actor Property PlayerREF Auto Const
String[] Property PickupLines Auto Const
String[] Property PickupLines_C01 Auto Const
String[] Property PickupLines_C02 Auto Const
String[] Property PickupLines_C03 Auto Const
String[] Property PickupLines_C04 Auto Const
String[] Property PickupLines_C05 Auto Const
String[] Property PickupLines_C06 Auto Const
String[] Property PickupLines_C07 Auto Const
String[] Property PickupLines_C08 Auto Const
String[] Property PickupLines_C09 Auto Const
String[] Property PickupLines_C10 Auto Const
String[] Property NPC_Answer_Accept Auto Const
String[] Property NPC_Answer_Reject Auto Const
bool Property bool_PickupBook Auto
ActorValue Property Charisma Auto Const
GlobalVariable property FPFP_Global_SexScene_Duration Auto
potion Property potion_self Auto
aaf:aaf_api AAF_API 
ActorValue Property FPFP_AV_Romance_Sex Auto Const
ActorValue Property FPFP_AV_Romance_Sex_Reveal Auto Const
ActorValue Property FPFP_AV_Romance_Total Auto Const
GlobalVariable property INVB_Global_Marriage_Total Auto Mandatory
FPE_Interests Property FPFP_Interests Auto Const Mandatory


perk Property Perk_Delay_Sex Auto Const Mandatory
Potion property aid_Delay_Sex Auto Const
GlobalVariable property FPFP_Global_Gift_Delay_Sex Auto

Event OnEffectStart(Actor akActor, Actor akCaster)
	akActor = GetActorUnderCrosshairs()
	String ActorName_Player = RenameAnything.GetRefName(PlayerREF)
	String ActorName_NPC = RenameAnything.GetRefName(akActor)
	
	if bool_PickupBook == true
		if (Utility.RandomInt(1, 100) == 50) && FPFP_Interests.CheckInterest_Sex_Bool(akActor) && !akActor.hasperk(Perk_Delay_Sex)
			debug.notification(ActorName_NPC +": "+ NPC_Answer_Accept[Utility.RandomInt(0, NPC_Answer_Accept.Length-1)]) 
			SexScene(akActor)
			
			
		else
			debug.notification(ActorName_NPC +": "+ NPC_Answer_Reject[Utility.RandomInt(0, NPC_Answer_Reject.Length-1)]) 
		endif
		
		debug.notification(ActorName_Player +": "+ PickupLines[Utility.RandomInt(0, PickupLines.Length-1)]) 
		
		PlayerREF.additem(potion_self, 1, true)
	else
		
		if (CharismaCheck()) && FPFP_Interests.CheckInterest_Sex_Bool(akActor) && !akActor.hasperk(Perk_Delay_Sex)
			debug.notification(ActorName_NPC +": "+ NPC_Answer_Accept[Utility.RandomInt(0, NPC_Answer_Accept.Length-1)]) 
			CharismaMessage()
			SexScene(akActor)
			
			
		else
			debug.notification(ActorName_NPC +": "+ NPC_Answer_Reject[Utility.RandomInt(0, NPC_Answer_Reject.Length-1)]) 
			CharismaMessage()
		endif
	endif
	
		
EndEvent

Function SexScene(Actor akActor)

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
	settings.duration = FPFP_Global_SexScene_Duration.GetValue()
	settings.excludeTags = "Spanking,Jackoff,Pose,Utility,Tease,Foreplay,Finish,TitJob"
	aaf:aaf_api.GetAPI().StartScene(Actors, settings)
	
	if FPFP_Global_Gift_Delay_Sex.GetValue() > 0
		akActor.EquipItem(aid_Delay_Sex, abSilent = True)	
	endIf
	
EndFunction

bool Function CharismaCheck()
	int finalcharisma = PlayerREF.GetValue(Charisma) as int * 10
	
	if (Utility.RandomInt(1, 100) <= finalcharisma)
		return true
	else
		return false
	endif
	
	return false
EndFunction

Function CharismaMessage()
	String ActorName_Player = RenameAnything.GetRefName(PlayerREF)
	
	
	if PlayerREF.GetValue(Charisma) == 1
		debug.notification(ActorName_Player +": "+ PickupLines_C01[Utility.RandomInt(0, PickupLines_C01.Length-1)])
	elseif PlayerREF.GetValue(Charisma) == 2
		debug.notification(ActorName_Player +": "+ PickupLines_C02[Utility.RandomInt(0, PickupLines_C02.Length-1)])
	elseif PlayerREF.GetValue(Charisma) == 3
		debug.notification(ActorName_Player +": "+ PickupLines_C03[Utility.RandomInt(0, PickupLines_C03.Length-1)])
	elseif PlayerREF.GetValue(Charisma) == 4
		debug.notification(ActorName_Player +": "+ PickupLines_C04[Utility.RandomInt(0, PickupLines_C04.Length-1)])
	elseif PlayerREF.GetValue(Charisma) == 5
		debug.notification(ActorName_Player +": "+ PickupLines_C05[Utility.RandomInt(0, PickupLines_C05.Length-1)])
	elseif PlayerREF.GetValue(Charisma) == 6
		debug.notification(ActorName_Player +": "+ PickupLines_C06[Utility.RandomInt(0, PickupLines_C06.Length-1)])
	elseif PlayerREF.GetValue(Charisma) == 7
		debug.notification(ActorName_Player +": "+ PickupLines_C07[Utility.RandomInt(0, PickupLines_C07.Length-1)])
	elseif PlayerREF.GetValue(Charisma) == 8
		debug.notification(ActorName_Player +": "+ PickupLines_C08[Utility.RandomInt(0, PickupLines_C08.Length-1)])
	elseif PlayerREF.GetValue(Charisma) == 9
		debug.notification(ActorName_Player +": "+ PickupLines_C09[Utility.RandomInt(0, PickupLines_C09.Length-1)])
	elseif PlayerREF.GetValue(Charisma) == 10
		debug.notification(ActorName_Player +": "+ PickupLines_C10[Utility.RandomInt(0, PickupLines_C10.Length-1)])
	else
		debug.notification(ActorName_Player +": I wanna fuck ya")
	endif
	
	
EndFunction

Actor Function GetActorUnderCrosshairs()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return None
	EndIf
	Return ScannedActor
EndFunction