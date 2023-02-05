Scriptname FPE_Married_Sex_Aid extends activemagiceffect

Actor Property PlayerRef Auto Const
Perk Property WLD_Perk_Married Auto
Perk Property WLD_Perk_Married_2 Auto
Perk Property WLD_Perk_Married_Poly Auto
Perk Property WLD_Perk_Married_Harem Auto
aaf:aaf_api AAF_API 
FPE_Messages Property FPFP_Messages Auto Const Mandatory
ActorValue Property FPFP_AV_Romance_Gift Auto Const
ActorValue Property FPFP_AV_Romance_Gift_Reveal Auto Const
ActorValue Property FPFP_AV_Romance_Sex Auto Const
ActorValue Property FPFP_AV_Romance_Sex_Reveal Auto Const
GlobalVariable property INVB_Global_Marriage_Command_Duration Auto Mandatory
GlobalVariable property INVB_Global_Marriage_Command_Chance Auto Mandatory
GlobalVariable property INVB_Global_Marriage_Total Auto Mandatory
ActorValue Property FPFP_AV_Romance_Total Auto Const
FPE_Interests Property FPFP_Interests Auto Const Mandatory

perk Property Perk_Delay_Sex Auto Const Mandatory
Potion property aid_Delay_Sex Auto Const
GlobalVariable property FPFP_Global_Gift_Delay_Sex Auto

Perk Property WLD_Perk_Romance_Relationship Auto Const
Perk Property WLD_Perk_Romance_Serious Auto Const
Perk Property WLD_Perk_Romance_Hatred Auto Const

Event OnEffectStart(Actor akActor, Actor akCaster)
	Actor akActor_Target = GetActorUnderCrosshairs()
	
	if ((akActor_Target.HasPerk(WLD_Perk_Married) && (PlayerREF.HasPerk(WLD_Perk_Married) || PlayerREF.HasPerk(WLD_Perk_Married_2) || PlayerREF.HasPerk(WLD_Perk_Married_Harem) || PlayerREF.HasPerk(WLD_Perk_Married_Poly))) || akActor_Target.GetValue(FPFP_AV_Romance_Gift) > 50 || akActor_Target.GetValue(FPFP_AV_Romance_Sex) > 50) && FPFP_Interests.CheckInterest_Sex_Bool(akActor_Target) && !akActor_Target.hasperk(Perk_Delay_Sex)
		int random_LList = Utility.RandomInt(1, 100)
		if (random_LList <= INVB_Global_Marriage_Command_Chance.GetValue())
			Utility.wait(2.5 as float)
				FPFP_Messages.Sex_Message(PlayerREF, akActor_Target)
			Utility.wait(2.5 as float)
			
				Actor[] Actors = new Actor[2]
				Actors[0] = PlayerREF
				Actors[1] = akActor_Target
				AAF:AAF_API:SceneSettings settings = AAF_API.GetSceneSettings()
				settings.skipWalk = true
				settings.preventFurniture = False
				settings.isNPCControlled = true
				settings.locationObject = Actors[1]
				settings.duration = INVB_Global_Marriage_Command_Duration.GetValue()
				settings.excludeTags = "Spanking,Jackoff,Pose,Utility,Tease,Foreplay,Finish,TitJob"
				aaf:aaf_api.GetAPI().StartScene(Actors, settings)
				
			if FPFP_Global_Gift_Delay_Sex.GetValue() > 0
				akActor_Target.EquipItem(aid_Delay_Sex, abSilent = True)	
			endIf
				
			if akActor_Target.GetValue(FPFP_AV_Romance_Total) == 0
				int Random_Total = (Utility.RandomInt(INVB_Global_Marriage_Total.GetValue() as int / 2, INVB_Global_Marriage_Total.GetValue() as int * 2))
				akActor_Target.SetValue(FPFP_AV_Romance_Total, Random_Total)
			endif
			
			if akActor_Target.GetValue(FPFP_AV_Romance_Sex_Reveal) == 0
				akActor_Target.SetValue(FPFP_AV_Romance_Sex_Reveal, Utility.RandomInt(1, akActor_Target.GetValue(FPFP_AV_Romance_Total) as int /3))
			endIf
			float GiftAmount = akActor_Target.GetValue(FPFP_AV_Romance_Sex) + Utility.RandomInt(1, 10)
			
			if akActor_Target.HasPerk(WLD_Perk_Romance_Hatred)
				GiftAmount *= 0
			elseIf akActor_Target.HasPerk(WLD_Perk_Romance_Relationship)
				GiftAmount *= 1.5
			elseIf akActor_Target.HasPerk(WLD_Perk_Romance_Serious)
				GiftAmount *= 2
			endIf

			akActor_Target.SetValue(FPFP_AV_Romance_Sex, GiftAmount * FPFP_Interests.CheckInterest_Sex(akActor_Target))
				
		else
			Debug.notification(akActor_Target.GetLeveledActorBase().GetName() +" brushes you off")
		endIf
	else
		Debug.notification(akActor_Target.GetLeveledActorBase().GetName() +": Thank you for this.")
		
		if akActor_Target.GetValue(FPFP_AV_Romance_Total) == 0
			int Random_Total = (Utility.RandomInt(INVB_Global_Marriage_Total.GetValue() as int / 2, INVB_Global_Marriage_Total.GetValue() as int * 2))
			akActor_Target.SetValue(FPFP_AV_Romance_Total, Random_Total)
		endif
		
		if akActor_Target.GetValue(FPFP_AV_Romance_Gift_Reveal) == 0
			akActor_Target.SetValue(FPFP_AV_Romance_Gift_Reveal, Utility.RandomInt(1, akActor_Target.GetValue(FPFP_AV_Romance_Total) as int /3))
		endIf
		float GiftAmount = akActor_Target.GetValue(FPFP_AV_Romance_Gift) + Utility.RandomInt(1, 10)
		akActor_Target.SetValue(FPFP_AV_Romance_Gift, GiftAmount * FPFP_Interests.CheckInterest_Gift(akActor_Target))
	endIf
EndEvent

Actor Function GetActorUnderCrosshairs()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return None
	EndIf
	Return ScannedActor
EndFunction

Function LoadAAF()
	Quest Main = Game.GetFormFromFile(0x01000F99, "AAF.esm") as quest
	AAF_API = Game.GetFormFromFile(0x01000F99, "AAF.esm") as aaf:aaf_api
	If (!AAF_API)
		Debug.Notification("Can't find AAF API.")
		Utility.wait(0.1)
	Else
		AAF_API = Main as AAF:AAF_API
		RegisterForCustomEvent(AAF_API, "OnAnimationStop")
	EndIf
EndFunction

Event OnInit()
	Self.LoadAAF()
EndEvent

Event AAF:AAF_API.OnAnimationStop(AAF:AAF_API akSender, Var[] akArgs)

	Actor Actor0 = None
	Actor Actor1 = None
	Actor[] Actors = Utility.VarToVarArray(akArgs[1]) as Actor[]
	If (Actors.length > 0)
		If (Actors[0] != PlayerREF && Actors[1] != PlayerREF)
			Actor0 = Actors[0]
			Actor1 = Actors[1]
		EndIf
	EndIf
EndEvent