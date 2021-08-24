Scriptname FPE_MCM_Hotkeys_AAF extends Quest

Actor Property PlayerRef Auto Const
aaf:aaf_api AAF_API 

Actor Function GetActorUnderCrosshairs()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return None
	EndIf
	Return ScannedActor
EndFunction

Actor Function GetActorUnderCrosshairs_PlayerRef()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return PlayerRef
	EndIf
	Return ScannedActor
EndFunction

Function GiveNPCUnderCrosshairs_Married()
	Actor akActor = GetActorUnderCrosshairs()
	Perk WLD_Perk_Married = Game.GetFormFromFile(0x01E9A1, "FP_FamilyPlanningEnhanced.esp") as Perk
	Perk WLD_Perk_Married_2 = Game.GetFormFromFile(0x01E9AA, "FP_FamilyPlanningEnhanced.esp") as Perk
	Perk WLD_Perk_Married_Poly = Game.GetFormFromFile(0x01E9AB, "FP_FamilyPlanningEnhanced.esp") as Perk
	Perk WLD_Perk_Married_Harem = Game.GetFormFromFile(0x01E9AC, "FP_FamilyPlanningEnhanced.esp") as Perk
	GlobalVariable INVB_Global_Marriage_Command_Duration = Game.GetFormFromFile(0x01EA5B, "FP_FamilyPlanningEnhanced.esp") as GlobalVariable
	GlobalVariable INVB_Global_Marriage_Command_Chance = Game.GetFormFromFile(0x01EA80, "FP_FamilyPlanningEnhanced.esp") as GlobalVariable
	int random_LList = Utility.RandomInt(1, 100)

	if (PlayerREF.HasPerk(WLD_Perk_Married) || PlayerREF.HasPerk(WLD_Perk_Married_2) || PlayerREF.HasPerk(WLD_Perk_Married_Harem) || PlayerREF.HasPerk(WLD_Perk_Married_Poly)) && akActor.HasPerk(WLD_Perk_Married)
		if (random_LList <= INVB_Global_Marriage_Command_Chance.GetValue())
			Actor[] Actors = new Actor[2]
			Actors[0] = PlayerREF
			Actors[1] = akActor
			AAF:AAF_API:SceneSettings settings = AAF_API.GetSceneSettings()
			settings.duration = INVB_Global_Marriage_Command_Duration.GetValue()
			settings.skipWalk = true
			settings.preventFurniture = true
			settings.isNPCControlled = true
			settings.locationObject = Actors[1]
			settings.excludeTags = "Spanking,Jackoff,Pose,Utility,Tease,Foreplay,Finish,TitJob"
			aaf:aaf_api.GetAPI().StartScene(Actors, settings)
		else
			Debug.notification(akActor.GetLeveledActorBase().GetName() +" brushes you off")
		endIf	
	else
		Debug.notification(akActor.GetLeveledActorBase().GetName() +" is not married to you")
	endIf
EndFunction


Function GiveNPCUnderCrosshairs_hypnotist()
	Actor akActor = GetActorUnderCrosshairs()
	Perk WLD_perk_25_hypnotist = Game.GetFormFromFile(0x005966, "INVB_WastelandDairy.esp") as Perk
	GlobalVariable INVB_Global_hypnotis_Command_Duration = Game.GetFormFromFile(0x005B5F, "INVB_WastelandDairy.esp") as GlobalVariable
	GlobalVariable INVB_Global_hypnotis_Command_Chance = Game.GetFormFromFile(0x005B78, "INVB_WastelandDairy.esp") as GlobalVariable
	
	int random_LList = Utility.RandomInt(1, 100)
	if (random_LList <= INVB_Global_hypnotis_Command_Chance.GetValue()) && PlayerREF.HasPerk(WLD_perk_25_hypnotist)
		Actor[] Actors = new Actor[2]
		Actors[0] = PlayerREF
		Actors[1] = akActor
		AAF:AAF_API:SceneSettings settings = AAF_API.GetSceneSettings()
		settings.skipWalk = true
		settings.preventFurniture = true
		settings.isNPCControlled = true
		settings.locationObject = Actors[1]
		settings.duration = INVB_Global_hypnotis_Command_Duration.GetValue()
		settings.excludeTags = "Spanking,Jackoff,Pose,Utility,Tease,Foreplay,Finish,TitJob"
		aaf:aaf_api.GetAPI().StartScene(Actors, settings)
	else
		Debug.notification(akActor.GetLeveledActorBase().GetName() +" looks at you like you are a fucking creep")
	endIf
EndFunction

Function GiveNPCUnderCrosshairs_hypnotist_Solo()
	Actor akActor = GetActorUnderCrosshairs()
	Perk WLD_perk_25_hypnotist = Game.GetFormFromFile(0x005966, "INVB_WastelandDairy.esp") as Perk
	GlobalVariable INVB_Global_hypnotis_Command_Duration = Game.GetFormFromFile(0x005B5F, "INVB_WastelandDairy.esp") as GlobalVariable
	GlobalVariable INVB_Global_hypnotis_Command_Chance = Game.GetFormFromFile(0x005B78, "INVB_WastelandDairy.esp") as GlobalVariable
	
	int random_LList = Utility.RandomInt(1, 100)
	if (random_LList <= INVB_Global_hypnotis_Command_Chance.GetValue()) && PlayerREF.HasPerk(WLD_perk_25_hypnotist)
			Actor[] Actors = new Actor[1]
			Actors[0] = akActor
			AAF:AAF_API:SceneSettings settings = AAF_API.GetSceneSettings()
			settings.skipWalk = true
			settings.preventFurniture = true
			settings.isNPCControlled = true
			settings.duration = INVB_Global_hypnotis_Command_Duration.GetValue()
			aaf:aaf_api.GetAPI().StartScene(Actors, settings)
	else
		Debug.notification(akActor.GetLeveledActorBase().GetName() +" looks at you like you are a fucking creep")
	endIf
EndFunction

Function GiveNPCUnderCrosshairs_hypnotist_Undress()
	Actor akActor = GetActorUnderCrosshairs()
	Perk WLD_perk_25_hypnotist = Game.GetFormFromFile(0x005966, "INVB_WastelandDairy.esp") as Perk
	GlobalVariable INVB_Global_hypnotis_Command_Chance = Game.GetFormFromFile(0x005B78, "INVB_WastelandDairy.esp") as GlobalVariable
	
	
	int random_LList = Utility.RandomInt(1, 100)
	if (random_LList <= INVB_Global_hypnotis_Command_Chance.GetValue()) && PlayerREF.HasPerk(WLD_perk_25_hypnotist)
		akActor.Unequipall()
	else
		Debug.notification(akActor.GetLeveledActorBase().GetName() +" looks at you like you are a fucking creep")
	endIf
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
EndEvent

Function AAFGenderChange_Male(Actor akActor)
	Keyword kw_Keyword = Game.GetFormFromFile(0x010121BB, "AAF.esm") as Keyword
	Perk Pk_Perk_Male = Game.GetFormFromFile(0x01E908, "FP_FamilyPlanningEnhanced.esp") as Perk
	
	If (akActor)
		
		if akActor.HasPerk(Pk_Perk_Male) == true
			akActor.RemovePerk(Pk_Perk_Male)
			akActor.RemoveKeyword(kw_Keyword)
		else
			akActor.AddPerk(Pk_Perk_Male)
			akActor.AddKeyword(kw_Keyword)
		endIf
	EndIf
	
EndFunction

Function AAFGenderChange_Female(Actor akActor)
	Keyword kw_Keyword = Game.GetFormFromFile(0x010121BC, "AAF.esm") as Keyword
	Perk Pk_Perk_Female = Game.GetFormFromFile(0x01E909, "FP_FamilyPlanningEnhanced.esp") as Perk
	
	If (akActor)
		
		if akActor.HasPerk(Pk_Perk_Female) == true
			akActor.RemovePerk(Pk_Perk_Female)
			akActor.RemoveKeyword(kw_Keyword)
		else
			akActor.AddPerk(Pk_Perk_Female)
			akActor.AddKeyword(kw_Keyword)
		endIf
	EndIf
	
EndFunction

Function GiveNPCUnderCrosshairs()
	Actor akActor = GetActorUnderCrosshairs_PlayerRef()
	If akActor.GetLeveledActorBase().GetSex() == 1 
		AAFGenderChange_Male(akActor)
	elseIf akActor.GetLeveledActorBase().GetSex() == 0
		AAFGenderChange_Female(akActor)
	Else
		Debug.MessageBox("There is no NPC to AAF Sex Change.")
	EndIf
	
EndFunction