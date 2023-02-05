Scriptname FPFP_BabyHandlerScript extends Quest

Group SharedProperties
Actor property PlayerREF auto const
ImpactDataSet Property BloodSprayImpactSetRed Auto Const
Keyword property KeySettle auto const
Keyword property FPFP_KW_IsPlayersChild auto const
Sound Property FXExplosionLimb Auto Const
Sound property VOCShaun Auto Const Mandatory
ActorValue Property FPFP_AV_BirthDate Auto Const 
ActorValue Property FPFP_AV_GrowthTimeMult Auto Const 
WorkshopParentScript Property WorkshopParent Auto const
EndGroup

Form[] property BabyTypes_F auto ; Default baby types
Form[] property BabyTypes_M auto ; Default baby types
Form[] property RadBabyTypes_F auto ; Default radiation baby types
Form[] property RadBabyTypes_M auto ; Default radiation baby types

Form[] property BabyTypes_nongrowing_F auto ; Default baby types
Form[] property BabyTypes_nongrowing_M auto ; Default baby types
Form[] property RadBabyTypes_nongrowing_F auto ; Default radiation baby types
Form[] property RadBabyTypes_nongrowing_M auto ; Default radiation baby types

Form[] Property BabyTypeItem_dead Auto Const

Form[] Property HumanChildActors_F Auto Const
Form[] Property HumanChildActors_M Auto Const

Form[] Property HumanAdultActors_F Auto Const
Form[] Property HumanAdultActors_M Auto Const

Form[] Property GhoulChildActors_F Auto Const
Form[] Property GhoulChildActors_M Auto Const

Form[] Property GhoulAdultActors_F Auto Const
Form[] Property GhoulAdultActors_M Auto Const

Actor property Piper auto const
Quest property FPFP_Crib auto const
FPFP_Player_Script property FPE auto const
ReferenceAlias property Crib auto const
Message Property FPFP_Msg_BabyInfo Auto Const
Message Property FPFP_Msg_ChildInfo Auto Const

FPFP_BabyTypeAddon[] AddonBabyTypes
FPFP_BabyScript[] Babies ; now deprecated

CustomEvent FPEBabyTypeReregister
CustomEvent FPEBabyUpdateGameTimer


GlobalVariable property FPFP_Global_Gender_Select Auto Const Mandatory

Race Property HumanRace Auto
Race Property GhoulRace Auto

GlobalVariable property FPFP_Global_Rename_Human Auto Const Mandatory

string BabyName
int BabyName_Which = 0
FPE_BabyNames Property FPFP_BabyNames Auto Const Mandatory
GlobalVariable property FPFP_Global_Viable Auto Const Mandatory
GlobalVariable property FPFP_Global_Viable_Renaming Auto Const Mandatory

Perk Property WLD_Perk_Breeder Auto
GlobalVariable property FPFP_Global_Breeder_Viable Auto Const Mandatory

GlobalVariable property FPFP_Global_Viable_Ghoul Auto Const Mandatory
FPE_Messages Property FPFP_Messages Auto Const Mandatory
Perk Property WLD_Perk_DeadBaby Auto
Potion property aid_DeadBaby Auto Const

GlobalVariable property FPFP_Global_Ghoul_Birth Auto Const
GlobalVariable property FPFP_Global_Human_Birth Auto Const


GlobalVariable property FPFP_Global_Length_Human Auto Const Mandatory
GlobalVariable property FPFP_Global_Morph_Human Auto Const Mandatory
GlobalVariable property FPFP_Global_Chance Auto Const Mandatory
Perk Property WLD_Perk_Impregnated Auto


Event OnInit()

	AddonBabyTypes = new FPFP_BabyTypeAddon[0]

EndEvent

Function OnUpdate(int aiVersion)

	If aiVersion < 2100
		Babies = new FPFP_BabyScript[0] ; clear up this, we don't need it
	EndIf
	
EndFunction

;Baby creation and uncreation

Function AddBaby(Actor akMother, Race akDadRace, int aiNumChildren, float afRadiation = -1.0) 

	Var babyType = GetBabyType(akDadRace, afRadiation, akMother)
	
	If babyType
		BHTrace("AddBaby has found a baby type")
		
		If babyType as FPFP_BabyTypeAddon
			BHTrace("AddBaby has found a baby type that was FPFP_BabyTypeAddon. Setting appropriate variables")
			aiNumChildren += (babyType as FPFP_BabyTypeAddon).AdditionalBabies()
		EndIf
		
		int iteration = 1
	
		While iteration <= aiNumChildren 
			BHTrace("AddBaby started on iteration "+iteration+" of "+aiNumChildren+" total children")
			Debug.Trace("AddBaby started on iteration "+iteration+" of "+aiNumChildren+" total children")
			
			Form babyTypeToSpawn = babyType as Form
			
			If babyType as FPFP_BabyTypeAddon && akMother.HasPerk(WLD_Perk_Breeder)
				babyTypeToSpawn = (babyType as FPFP_BabyTypeAddon).GetBabyType(false, FPFP_Global_Breeder_Viable.GetValue()) as Form ; causes the baby item or actor to be different each while loop iteration, so that there are varied babies.
			elseIf babyType as FPFP_BabyTypeAddon
				babyTypeToSpawn = (babyType as FPFP_BabyTypeAddon).GetBabyType(false, 1) as Form ; causes the baby item or actor to be different each while loop iteration, so that there are varied babies.
			EndIf
			
			if babyTypeToSpawn == ismybabydead(akDadRace)
				If akMother == PlayerREF && FPFP_Global_Viable_Renaming.GetValue() == 1
					BabyName_Which = Utility.RandomInt(1, 2)
				elseif FPFP_Global_Viable_Renaming.GetValue() == 2
					BabyName_Which = Utility.RandomInt(1, 2)
				else
					BabyName = ""
					BabyName_Which = 5
				endif	
			endif
			
			ObjectReference theBaby = akMother.PlaceAtMe(babyTypeToSpawn, aiCount = 1, abForcePersist = False, abInitiallyDisabled = false, abDeleteWhenAble = false)
			
			If akMother == PlayerREF
				theBaby.AddKeyword(FPFP_KW_IsPlayersChild)
			EndIf
			
			; for SKK50's Fallout 4-76
			If (Game.IsPluginInstalled("SKK476OpenWorld.esp") == TRUE)
				theBaby.AddKeyword(Game.GetFormFromFile(0x00019bcb, "SKK476OpenWorld.esp") as Keyword)
			EndIf 
			
			; the following will rename the baby and then pick a new name for the next baby if there is one
			if BabyName_Which != 5 && (akDadRace != HumanRace && akDadRace != None && WhatsmyName_Auto(akDadRace) == 1) || (akDadRace == HumanRace && FPFP_Global_Rename_Human.GetValue() == 1)
				if BabyName_Which == 1
					BabyName = FPFP_BabyNames.BabyNames_Female(akDadRace)
				elseif BabyName_Which == 2
					BabyName = FPFP_BabyNames.BabyNames_Male(akDadRace)
				elseif BabyName_Which == 3
					BabyName = FPFP_BabyNames.BabyNames(akDadRace)
				endif
				RenameAnything.SetRefName(theBaby, BabyName)
			endif
									
			If theBaby as FPFP_BabyScript ; if we're a baby object rather than anything else
				BHTrace("AddBaby found that the baby spawned was a misc object with FPFP_BabyScript applied onto it. Registering it into the array to keep it persistent")
				
				If akMother.Is3DLoaded()
					(theBaby as FPFP_BabyScript).GetBabyBirthSound().Play(akMother)
				EndIf
				
				akMother.AddItem(theBaby, 1)

			ElseIf theBaby as Actor
			
				BHTrace("AddBaby found that the baby spawned was an actor. Setting its bday")
				theBaby.SetValue(FPFP_AV_BirthDate,Utility.GetCurrentGameTime())
				
				If theBaby as FPFP_GrowingChildScript
					If akMother.Is3DLoaded()
						(theBaby as FPFP_GrowingChildScript).GetBabyBirthSound().Play(akMother)
					EndIf
					(theBaby as FPFP_GrowingChildScript).Initialize()
				EndIf
				
			EndIf
			BHTrace("AddBaby ended iteration "+iteration+" of "+aiNumChildren+" total children")
			iteration += 1
			
		EndWhile
		BHTrace("AddBaby has finished adding children")
	EndIf
	BHTrace("AddBaby has finished")
EndFunction



Function AddBaby_dead(Actor akMother, Race akDadRace, int aiNumChildren, float afRadiation = -1.0) 

	If akMother == PlayerREF
		FPFP_Messages.Birth_Baby_Death()
	elseif akMother.GetDistance(PlayerRef) < 256.000
		Debug.notification(RenameAnything.GetRefName(akMother) +": Crying uncontrollably. \n While her baby isn't")
	endif

	Var babyType = GetBabyType_Dead(akDadRace, afRadiation, akMother)
	
	If babyType
		Form babyTypeToSpawn = babyType as Form
			
		If babyType as FPFP_BabyTypeAddon
			babyTypeToSpawn = (babyType as FPFP_BabyTypeAddon).GetBabyType(false, 1) as Form ; causes the baby item or actor to be different each while loop iteration, so that there are varied babies.
		EndIf
			
		ObjectReference theBaby = akMother.PlaceAtMe(babyTypeToSpawn, aiCount = 1, abForcePersist = False, abInitiallyDisabled = false, abDeleteWhenAble = false)
		akMother.AddItem(theBaby, aiNumChildren)
	EndIf
	
EndFunction

Function AddBaby_nongrowing(Actor akMother, Race akDadRace, int aiNumChildren, float afRadiation = -1.0) 

	Var babyType = GetBabyType_nongrowing(akDadRace, afRadiation, akMother)
	
	If babyType
		BHTrace("AddBaby has found a baby type")
		
		If babyType as FPFP_BabyTypeAddon
			BHTrace("AddBaby has found a baby type that was FPFP_BabyTypeAddon. Setting appropriate variables")
			aiNumChildren += (babyType as FPFP_BabyTypeAddon).AdditionalBabies()
		EndIf
		Debug.Trace("(babyType as FPFP_BabyTypeAddon).AdditionalBabies()")
		Debug.Trace((babyType as FPFP_BabyTypeAddon).AdditionalBabies())
		
		int iteration = 1
	
		While iteration <= aiNumChildren 
			BHTrace("AddBaby started on iteration "+iteration+" of "+aiNumChildren+" total children")
			Debug.Trace("AddBaby started on iteration "+iteration+" of "+aiNumChildren+" total children")
			
			Form babyTypeToSpawn = babyType as Form
			
			If babyType as FPFP_BabyTypeAddon && akMother.HasPerk(WLD_Perk_Breeder)
				babyTypeToSpawn = (babyType as FPFP_BabyTypeAddon).GetBabyType(true, FPFP_Global_Breeder_Viable.GetValue()) as Form ; causes the baby item or actor to be different each while loop iteration, so that there are varied babies.
			elseIf babyType as FPFP_BabyTypeAddon
				babyTypeToSpawn = (babyType as FPFP_BabyTypeAddon).GetBabyType(true, 1) as Form ; causes the baby item or actor to be different each while loop iteration, so that there are varied babies.
			EndIf
			
			if babyTypeToSpawn == ismybabydead(akDadRace)
				If akMother == PlayerREF && FPFP_Global_Viable_Renaming.GetValue() == 1
					BabyName_Which = Utility.RandomInt(1, 2)
				elseif FPFP_Global_Viable_Renaming.GetValue() == 2
					BabyName_Which = Utility.RandomInt(1, 2)
				else
					BabyName = ""
					BabyName_Which = 5
				endif	
			endif
			
			ObjectReference theBaby = akMother.PlaceAtMe(babyTypeToSpawn, aiCount = 1, abForcePersist = False, abInitiallyDisabled = false, abDeleteWhenAble = false)
			
			If akMother == PlayerREF
				theBaby.AddKeyword(FPFP_KW_IsPlayersChild)
			EndIf
			
			; for SKK50's Fallout 4-76
			If (Game.IsPluginInstalled("SKK476OpenWorld.esp") == TRUE)
				theBaby.AddKeyword(Game.GetFormFromFile(0x00019bcb, "SKK476OpenWorld.esp") as Keyword)
			EndIf 
			
			; the following will rename the baby and then pick a new name for the next baby if there is one
			if BabyName_Which != 5 && (akDadRace != HumanRace && akDadRace != None && WhatsmyName_Auto(akDadRace) == 1) || (akDadRace == HumanRace && FPFP_Global_Rename_Human.GetValue() == 1)
				if BabyName_Which == 1
					BabyName = FPFP_BabyNames.BabyNames_Female(akDadRace)
				elseif BabyName_Which == 2
					BabyName = FPFP_BabyNames.BabyNames_Male(akDadRace)
				elseif BabyName_Which == 3
					BabyName = FPFP_BabyNames.BabyNames(akDadRace)
				endif
				RenameAnything.SetRefName(theBaby, BabyName)
			endif
						
			If akMother.Is3DLoaded()
				(theBaby as FPFP_BabyScript).GetBabyBirthSound().Play(akMother)
			EndIf
				
			akMother.AddItem(theBaby, 1)
			
			BHTrace("AddBaby ended iteration "+iteration+" of "+aiNumChildren+" total children")
			iteration += 1
			
		EndWhile
		BHTrace("AddBaby has finished adding children")
	EndIf
	BHTrace("AddBaby has finished")
EndFunction



Var Function GetBabyType(Race akDadRace, float afRadiation, Actor akMother)
	; function to get the baby type. Can return none, the addon quest, or the default misc objects
	
	If FPE.FPFP_Global_GhoulifyChildren.GetValue() == 1.0 && (afRadiation >= 400 || akDadRace == GhoulRace)
		; if mom has accumulated enough rads OR the dad was a ghoul
		int random_LList = Utility.RandomInt(1, 100)
		int random_Viable = Utility.RandomInt(1, 100)
	
		if random_Viable >= FPFP_Global_Viable_Ghoul.GetValue() && !akMother.HasPerk(WLD_Perk_Breeder)
			If akMother == PlayerREF && FPFP_Global_Viable_Renaming.GetValue() == 1
				BabyName_Which = Utility.RandomInt(1, 2)
			elseif FPFP_Global_Viable_Renaming.GetValue() == 2
				BabyName_Which = Utility.RandomInt(1, 2)
			else
				BabyName = ""
				BabyName_Which = 5
			endif
			
			If akMother == PlayerREF
				FPFP_Messages.Birth_Baby_Death()
			elseif akMother.GetDistance(PlayerRef) < 256.000
				Debug.notification(RenameAnything.GetRefName(akMother) +": Crying uncontrollably. \n While her baby isn't")
			endif
			
			if !akMother.HasPerk(WLD_Perk_DeadBaby)
				akMother.EquipItem(aid_DeadBaby, abSilent = True)
			endif	
			
			Return BabyTypeItem_dead[Utility.RandomInt(0,BabyTypeItem_dead.Length-1)]
			
		else
			If GhoulAdultActors_F.Length > 0 && FPFP_Global_Ghoul_Birth.GetValue() == 2 && (random_LList <= FPFP_Global_Gender_Select.GetValue())
					BabyName = FPFP_BabyNames.BabyNames_Female(akDadRace)
					BabyName_Which = 1
				Return GhoulAdultActors_F[Utility.RandomInt(0,GhoulAdultActors_F.Length-1)]

			ElseIf GhoulAdultActors_M.Length > 0 && FPFP_Global_Ghoul_Birth.GetValue() == 2
					BabyName = FPFP_BabyNames.BabyNames_Male(akDadRace)
					BabyName_Which = 2
				Return GhoulAdultActors_M[Utility.RandomInt(0,GhoulAdultActors_M.Length-1)]
			
			ElseIf GhoulChildActors_F.Length > 0 && FPFP_Global_Ghoul_Birth.GetValue() == 1 && (random_LList <= FPFP_Global_Gender_Select.GetValue())
					BabyName = FPFP_BabyNames.BabyNames_Female(akDadRace)
					BabyName_Which = 1
				Return GhoulChildActors_F[Utility.RandomInt(0,GhoulChildActors_F.Length-1)]

			ElseIf GhoulChildActors_M.Length > 0 && FPFP_Global_Ghoul_Birth.GetValue() == 1
					BabyName = FPFP_BabyNames.BabyNames_Male(akDadRace)
					BabyName_Which = 2
				Return GhoulChildActors_M[Utility.RandomInt(0,GhoulChildActors_M.Length-1)]
			
			else
			
				if (random_LList <= FPFP_Global_Gender_Select.GetValue())
					BabyName = FPFP_BabyNames.BabyNames_Female(akDadRace)
					BabyName_Which = 1
					Return RadBabyTypes_F[Utility.RandomInt(0,RadBabyTypes_F.Length-1)] ; give Female Default babies, as to save computational power
				else
					BabyName = FPFP_BabyNames.BabyNames_Male(akDadRace)
					BabyName_Which = 2
					Return RadBabyTypes_M[Utility.RandomInt(0,RadBabyTypes_M.Length-1)] ; give Male default babies, as to save computational power
				EndIf
			EndIf
			
		EndIf	
	EndIf

	If akDadRace == HumanRace  ; If the father is a human
	
		int random_LList = Utility.RandomInt(1, 100)
		int random_Viable = Utility.RandomInt(1, 100)
	
		if random_Viable >= FPFP_Global_Viable.GetValue() && !akMother.HasPerk(WLD_Perk_Breeder)
			If akMother == PlayerREF && FPFP_Global_Viable_Renaming.GetValue() == 1
				BabyName_Which = Utility.RandomInt(1, 2)
			elseif FPFP_Global_Viable_Renaming.GetValue() == 2
				BabyName_Which = Utility.RandomInt(1, 2)
			else
				BabyName = ""
				BabyName_Which = 5
			endif
			
			If akMother == PlayerREF
				FPFP_Messages.Birth_Baby_Death()
			elseif akMother.GetDistance(PlayerRef) < 256.000
				Debug.notification(RenameAnything.GetRefName(akMother) +": Crying uncontrollably. \n While her baby isn't")
			endif
			
			if !akMother.HasPerk(WLD_Perk_DeadBaby)
				akMother.EquipItem(aid_DeadBaby, abSilent = True)
			endif
			
			Return BabyTypeItem_dead[Utility.RandomInt(0,BabyTypeItem_dead.Length-1)]
			
		else
		
			If HumanAdultActors_F.Length > 0 && FPFP_Global_Human_Birth.GetValue() == 2 && (random_LList <= FPFP_Global_Gender_Select.GetValue())
					BabyName = FPFP_BabyNames.BabyNames_Female(akDadRace)
					BabyName_Which = 1
				Return HumanAdultActors_F[Utility.RandomInt(0,HumanAdultActors_F.Length-1)]

			ElseIf HumanAdultActors_M.Length > 0 && FPFP_Global_Human_Birth.GetValue() == 2
					BabyName = FPFP_BabyNames.BabyNames_Male(akDadRace)
					BabyName_Which = 2
				Return HumanAdultActors_M[Utility.RandomInt(0,HumanAdultActors_M.Length-1)]
			
			ElseIf HumanChildActors_F.Length > 0 && FPFP_Global_Human_Birth.GetValue() == 1 && (random_LList <= FPFP_Global_Gender_Select.GetValue())
					BabyName = FPFP_BabyNames.BabyNames_Female(akDadRace)
					BabyName_Which = 1
				Return HumanChildActors_F[Utility.RandomInt(0,HumanChildActors_F.Length-1)]

			ElseIf HumanChildActors_M.Length > 0 && FPFP_Global_Human_Birth.GetValue() == 1
					BabyName = FPFP_BabyNames.BabyNames_Male(akDadRace)
					BabyName_Which = 2
				Return HumanChildActors_M[Utility.RandomInt(0,HumanChildActors_M.Length-1)]
			
			else
				if (random_LList <= FPFP_Global_Gender_Select.GetValue())
					BabyName = FPFP_BabyNames.BabyNames_Female(akDadRace)
					BabyName_Which = 1
					Return BabyTypes_F[Utility.RandomInt(0,BabyTypes_F.Length-1)] ; give Female Default babies, as to save computational power
				else
					BabyName = FPFP_BabyNames.BabyNames_Male(akDadRace)
					BabyName_Which = 2
					Return BabyTypes_M[Utility.RandomInt(0,BabyTypes_M.Length-1)] ; give Male default babies, as to save computational power
				EndIf
			EndIf
		EndIf	
	EndIf
	
	
	If akDadRace != HumanRace
		Var theReturn
		FPFP_BabyTypeAddon[] validTypes = new FPFP_BabyTypeAddon[0]
		
		int i = 0
	
		While i < AddonBabyTypes.Length
			If AddonBabyTypes[i].IsRaceMatch(akDadRace)
				validTypes.Add(AddonBabyTypes[i])
			EndIf
			i += 1
		EndWhile
		
		If validTypes.Length > 0 ; if there were valid race types added to the array
		
			; the following does the initial Baby name to be read at a later time
			
			int random_LList = Utility.RandomInt(1, 100)
				
			if (random_LList <= FPFP_Global_Gender_Select.GetValue())
				BabyName = FPFP_BabyNames.BabyNames_Female(akDadRace)
				BabyName_Which = 1
			else
				BabyName = FPFP_BabyNames.BabyNames_Male(akDadRace)
				BabyName_Which = 2
			EndIf
				
			if FPFP_BabyNames.BabyNames(akDadRace)
				BabyName = FPFP_BabyNames.BabyNames(akDadRace)
				BabyName_Which = 3
			endif
			
			
			theReturn = validTypes[Utility.RandomInt(0,validTypes.Length-1)] ; set our return to one of the valid babytypeaddons
		
		else ; if there were no valid types
			int random_LList = Utility.RandomInt(1, 100)
			if (random_LList <= FPFP_Global_Gender_Select.GetValue())
				BabyName = FPFP_BabyNames.BabyNames_Female(akDadRace)
				BabyName_Which = 1
				Return BabyTypes_F[Utility.RandomInt(0,BabyTypes_F.Length-1)] ; give Female Default babies, as to save computational power
			else
				BabyName = FPFP_BabyNames.BabyNames_Male(akDadRace)
				BabyName_Which = 2
				Return BabyTypes_M[Utility.RandomInt(0,BabyTypes_M.Length-1)] ; give Male default babies, as to save computational power
			EndIf
		EndIf
		
		return theReturn
	EndIf
	
EndFunction

Var Function GetBabyType_Dead(Race akDadRace, float afRadiation, Actor akMother)
	; function to get the baby type. Can return none, the addon quest, or the default misc objects
	
	If FPE.FPFP_Global_GhoulifyChildren.GetValue() == 1.0 && (afRadiation >= 400 || akDadRace == GhoulRace)
		Return BabyTypeItem_dead[Utility.RandomInt(0,BabyTypeItem_dead.Length-1)]	
	EndIf

	If akDadRace == HumanRace  ; If the father is a human
		Return BabyTypeItem_dead[Utility.RandomInt(0,BabyTypeItem_dead.Length-1)]
	EndIf
	
	
	If akDadRace != HumanRace
		Return ismybabydead(akDadRace)
	EndIf
	
EndFunction


Var Function GetBabyType_nongrowing(Race akDadRace, float afRadiation, Actor akMother)
	; function to get the baby type. Can return none, the addon quest, or the default misc objects
	
	If FPE.FPFP_Global_GhoulifyChildren.GetValue() == 1.0 && (afRadiation >= 400 || akDadRace == GhoulRace)
		; if mom has accumulated enough rads OR the dad was a ghoul
		int random_LList = Utility.RandomInt(1, 100)
		int random_Viable = Utility.RandomInt(1, 100)
	
		if random_Viable >= FPFP_Global_Viable_Ghoul.GetValue() && !akMother.HasPerk(WLD_Perk_Breeder)
			If akMother == PlayerREF && FPFP_Global_Viable_Renaming.GetValue() == 1
				BabyName_Which = Utility.RandomInt(1, 2)
			elseif FPFP_Global_Viable_Renaming.GetValue() == 2
				BabyName_Which = Utility.RandomInt(1, 2)
			else
				BabyName = ""
				BabyName_Which = 5
			endif
			
			If akMother == PlayerREF
				FPFP_Messages.Birth_Baby_Death()
			elseif akMother.GetDistance(PlayerRef) < 256.000
				Debug.notification(RenameAnything.GetRefName(akMother) +": Crying uncontrollably. \n While her baby isn't")
			endif
			
			if !akMother.HasPerk(WLD_Perk_DeadBaby)
				akMother.EquipItem(aid_DeadBaby, abSilent = True)
			endif	
			
			Return BabyTypeItem_dead[Utility.RandomInt(0,BabyTypeItem_dead.Length-1)]
			
		else
			If GhoulAdultActors_F.Length > 0 && FPFP_Global_Ghoul_Birth.GetValue() == 2 && (random_LList <= FPFP_Global_Gender_Select.GetValue())
					BabyName = FPFP_BabyNames.BabyNames_Female(akDadRace)
					BabyName_Which = 1
				Return GhoulAdultActors_F[Utility.RandomInt(0,GhoulAdultActors_F.Length-1)]

			ElseIf GhoulAdultActors_M.Length > 0 && FPFP_Global_Ghoul_Birth.GetValue() == 2
					BabyName = FPFP_BabyNames.BabyNames_Male(akDadRace)
					BabyName_Which = 2
				Return GhoulAdultActors_M[Utility.RandomInt(0,GhoulAdultActors_M.Length-1)]
			
			ElseIf GhoulChildActors_F.Length > 0 && FPFP_Global_Ghoul_Birth.GetValue() == 1 && (random_LList <= FPFP_Global_Gender_Select.GetValue())
					BabyName = FPFP_BabyNames.BabyNames_Female(akDadRace)
					BabyName_Which = 1
				Return GhoulChildActors_F[Utility.RandomInt(0,GhoulChildActors_F.Length-1)]

			ElseIf GhoulChildActors_M.Length > 0 && FPFP_Global_Ghoul_Birth.GetValue() == 1
					BabyName = FPFP_BabyNames.BabyNames_Male(akDadRace)
					BabyName_Which = 2
				Return GhoulChildActors_M[Utility.RandomInt(0,GhoulChildActors_M.Length-1)]
			
			else
			
				if (random_LList <= FPFP_Global_Gender_Select.GetValue())
					BabyName = FPFP_BabyNames.BabyNames_Female(akDadRace)
					BabyName_Which = 1
					Return RadBabyTypes_nongrowing_F[Utility.RandomInt(0,RadBabyTypes_nongrowing_F.Length-1)] ; give Female Default babies, as to save computational power
				else
					BabyName = FPFP_BabyNames.BabyNames_Male(akDadRace)
					BabyName_Which = 2
					Return RadBabyTypes_nongrowing_M[Utility.RandomInt(0,RadBabyTypes_nongrowing_M.Length-1)] ; give Male default babies, as to save computational power
				EndIf
			EndIf
			
		EndIf	
	EndIf

	If akDadRace == HumanRace  ; If the father is a human
	
		int random_LList = Utility.RandomInt(1, 100)
		int random_Viable = Utility.RandomInt(1, 100)
	
		if random_Viable >= FPFP_Global_Viable.GetValue() && !akMother.HasPerk(WLD_Perk_Breeder)
			If akMother == PlayerREF && FPFP_Global_Viable_Renaming.GetValue() == 1
				BabyName_Which = Utility.RandomInt(1, 2)
			elseif FPFP_Global_Viable_Renaming.GetValue() == 2
				BabyName_Which = Utility.RandomInt(1, 2)
			else
				BabyName = ""
				BabyName_Which = 5
			endif
			
			If akMother == PlayerREF
				FPFP_Messages.Birth_Baby_Death()
			elseif akMother.GetDistance(PlayerRef) < 256.000
				Debug.notification(RenameAnything.GetRefName(akMother) +": Crying uncontrollably. \n While her baby isn't")
			endif
			
			if !akMother.HasPerk(WLD_Perk_DeadBaby)
				akMother.EquipItem(aid_DeadBaby, abSilent = True)
			endif
			
			Return BabyTypeItem_dead[Utility.RandomInt(0,BabyTypeItem_dead.Length-1)]
			
		else
		
			If HumanAdultActors_F.Length > 0 && FPFP_Global_Human_Birth.GetValue() == 2 && (random_LList <= FPFP_Global_Gender_Select.GetValue())
					BabyName = FPFP_BabyNames.BabyNames_Female(akDadRace)
					BabyName_Which = 1
				Return HumanAdultActors_F[Utility.RandomInt(0,HumanAdultActors_F.Length-1)]

			ElseIf HumanAdultActors_M.Length > 0 && FPFP_Global_Human_Birth.GetValue() == 2
					BabyName = FPFP_BabyNames.BabyNames_Male(akDadRace)
					BabyName_Which = 2
				Return HumanAdultActors_M[Utility.RandomInt(0,HumanAdultActors_M.Length-1)]
			
			ElseIf HumanChildActors_F.Length > 0 && FPFP_Global_Human_Birth.GetValue() == 1 && (random_LList <= FPFP_Global_Gender_Select.GetValue())
					BabyName = FPFP_BabyNames.BabyNames_Female(akDadRace)
					BabyName_Which = 1
				Return HumanChildActors_F[Utility.RandomInt(0,HumanChildActors_F.Length-1)]

			ElseIf HumanChildActors_M.Length > 0 && FPFP_Global_Human_Birth.GetValue() == 1
					BabyName = FPFP_BabyNames.BabyNames_Male(akDadRace)
					BabyName_Which = 2
				Return HumanChildActors_M[Utility.RandomInt(0,HumanChildActors_M.Length-1)]
			
			else
				if (random_LList <= FPFP_Global_Gender_Select.GetValue())
					BabyName = FPFP_BabyNames.BabyNames_Female(akDadRace)
					BabyName_Which = 1
					Return BabyTypes_nongrowing_F[Utility.RandomInt(0,BabyTypes_F.Length-1)] ; give Female Default babies, as to save computational power
				else
					BabyName = FPFP_BabyNames.BabyNames_Male(akDadRace)
					BabyName_Which = 2
					Return BabyTypes_nongrowing_M[Utility.RandomInt(0,BabyTypes_M.Length-1)] ; give Male default babies, as to save computational power
				EndIf
			EndIf
		EndIf	
	EndIf
	
	
	If akDadRace != HumanRace
		Var theReturn
		FPFP_BabyTypeAddon[] validTypes = new FPFP_BabyTypeAddon[0]
		
		int i = 0
	
		While i < AddonBabyTypes.Length
			If AddonBabyTypes[i].IsRaceMatch(akDadRace)
				validTypes.Add(AddonBabyTypes[i])
			EndIf
			i += 1
		EndWhile
		
		If validTypes.Length > 0 ; if there were valid race types added to the array
		
			; the following does the initial Baby name to be read at a later time
			
			int random_LList = Utility.RandomInt(1, 100)
				
			if (random_LList <= FPFP_Global_Gender_Select.GetValue())
				BabyName = FPFP_BabyNames.BabyNames_Female(akDadRace)
				BabyName_Which = 1
			else
				BabyName = FPFP_BabyNames.BabyNames_Male(akDadRace)
				BabyName_Which = 2
			EndIf
				
			if FPFP_BabyNames.BabyNames(akDadRace)
				BabyName = FPFP_BabyNames.BabyNames(akDadRace)
				BabyName_Which = 3
			endif
			
			
			theReturn = validTypes[Utility.RandomInt(0,validTypes.Length-1)] ; set our return to one of the valid babytypeaddons
		
		else ; if there were no valid types
			int random_LList = Utility.RandomInt(1, 100)
			if (random_LList <= FPFP_Global_Gender_Select.GetValue())
				BabyName = FPFP_BabyNames.BabyNames_Female(akDadRace)
				BabyName_Which = 1
				Return BabyTypes_nongrowing_F[Utility.RandomInt(0,BabyTypes_F.Length-1)] ; give Female Default babies, as to save computational power
			else
				BabyName = FPFP_BabyNames.BabyNames_Male(akDadRace)
				BabyName_Which = 2
				Return BabyTypes_nongrowing_M[Utility.RandomInt(0,BabyTypes_M.Length-1)] ; give Male default babies, as to save computational power
			EndIf
		EndIf
		
		return theReturn
	EndIf
	
EndFunction


;the Following read the already existing AddonBabyTypes Quests to receive data from each race

bool Function FoundtheFather(Race akDadRace) ;bool to see if there is a father to be found
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return true
		EndIf
		i += 1
	EndWhile
	
	return false
EndFunction

bool Function AdultAllowed(Race akDadRace) ;bool to see if the creature would be harvested as an adult
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].Adult_Allowed
		EndIf
		i += 1
	EndWhile
	
	return false
EndFunction

Float Function Howlongismypregnancy(Race akDadRace) ;Float to see how long the pregnancy will be, Default is 9
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].INVB_Global_Creature_Length.GetValue()
			;return AddonBabyTypes[i].Creature_Cycle
		EndIf
		i += 1
	EndWhile
	
	return FPFP_Global_Length_Human.GetValue()
EndFunction

Spell Function WhatColourisMyCum(Race akDadRace) ;Spell to choose colour of semen is used by the creature
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].SP_Cumshot_Extra
		EndIf
		i += 1
	EndWhile
EndFunction

int Function HowMuch(Race akDadRace) ;Int to see how much product(Caps or other) the birth is if it is a surrogate birth
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].int_Surrogate_Worth
		EndIf
		i += 1
	EndWhile
	
	return 100
EndFunction

bool Function WhatTwins(Race akDadRace) ;bool to see if this is a multilevel birth (for example this is mostly used for small creatures that cannot justify the length of time used for pregnancy for a single egg or womb)
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].Creature_Cycle_Multi
		EndIf
		i += 1
	EndWhile
	
	return false
EndFunction

Float Function HowBig(Race akDadRace) ;Float to see how big the pregnancy will be on the mother
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].INVB_Global_Creature_Morph.GetValue()
			;return AddonBabyTypes[i].Creature_Morph
		EndIf
		i += 1
	EndWhile
	
	return FPFP_Global_Morph_Human.GetValue()
EndFunction

Float Function HowBig_Cumflation(Race akDadRace) ;Float to see how big the Cumflation will be on the mother
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].INVB_Global_Creature_Morph_Cumflation.GetValue()
			;return AddonBabyTypes[i].Creature_Morph_Cum
		EndIf
		i += 1
	EndWhile
	
	return 1
EndFunction

Perk Function WhatsmyPerk(Race akDadRace) ;which perk will be picked if pregnant by this race
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].Creature_Perk
		EndIf
		i += 1
	EndWhile
	
	return WLD_Perk_Impregnated
EndFunction

Potion Function WhatsmyDNA(Race akDadRace) ;which DNA will be collected when having sex with a condom
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].Creature_Cum
		EndIf
		i += 1
	EndWhile
EndFunction

String Function WhatsmyLine(Race akDadRace) ;the string for Sex Messages
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].Creature_String
		EndIf
		i += 1
	EndWhile
EndFunction

String Function WhatsmyLine_Impreg(Race akDadRace) ;the string for Impregnation Messages
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].Creature_String_Impreg
		EndIf
		i += 1
	EndWhile
EndFunction

String Function WhatsmyLine_Birth(Race akDadRace) ;the string for Birth Messages
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].Creature_String_Birth
		EndIf
		i += 1
	EndWhile
EndFunction

Perk Function WhatsmyDisease(Race akDadRace) ;The Perk(STD) will be picked if infected by this race
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].Creature_STD
		EndIf
		i += 1
	EndWhile
EndFunction

int Function HowMuch_Exile(Race akDadRace) ;Int to see how much product(Caps or other) if the Child or Adult is Exiled
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].int_howmuch_Exile
		EndIf
		i += 1
	EndWhile
EndFunction

int Function HowMuch_Slave(Race akDadRace) ;Int to see how much product(Caps or other) if the Child or Adult is Sold
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].int_howmuch_Slave
		EndIf
		i += 1
	EndWhile
EndFunction

int Function HowMuch_Butcher(Race akDadRace) ;Int to see how much product(Meat or other) if the Child or Adult is Butchered
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].int_howmuch_Meat
		EndIf
		i += 1
	EndWhile
EndFunction

String Function WhatsmyLine_Exile(Race akDadRace) ;the string for Exiled Messages
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].fpfp_leavingHome
		EndIf
		i += 1
	EndWhile
EndFunction

String Function WhatsmyLine_Slave(Race akDadRace) ;the string for Sold Messages
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].fpfp_Slavery
		EndIf
		i += 1
	EndWhile
EndFunction

String Function WhatsmyLine_Butcher(Race akDadRace) ;the string for Butchered Messages
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].fpfp_Butchered
		EndIf
		i += 1
	EndWhile
EndFunction

String Function WhatsmyLine_Caged(Race akDadRace) ;the string for Caged Messages
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].fpfp_Caged
		EndIf
		i += 1
	EndWhile
EndFunction

form Function WhatsmyStuff_Exile(Race akDadRace) ;what product(Caps or other) if the Child or Adult is Exiled
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].Caps_Object
		EndIf
		i += 1
	EndWhile
EndFunction

form Function WhatsmyStuff_Butcher(Race akDadRace) ;what product(Meat or other) if the Child or Adult is Butchered
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].Meat_Object
		EndIf
		i += 1
	EndWhile
EndFunction

form Function WhatsmyStuff_Caged(Race akDadRace) ;what product(Cage or other) if the Child or Adult is Caged
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].Caged_Object
		EndIf
		i += 1
	EndWhile
EndFunction

String Function WhatsmyName(Race akDadRace) ;Unisex name for Baby
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			int random_Name = Utility.RandomInt(0, AddonBabyTypes[i].Creature_Names.Length-1)
			return AddonBabyTypes[i].Creature_Names[random_Name]
		EndIf
		i += 1
	EndWhile
EndFunction

String Function WhatsmyName_Male(Race akDadRace) ;Male name for Baby
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			int random_Name = Utility.RandomInt(0, AddonBabyTypes[i].Creature_Names_M.Length-1)
			return AddonBabyTypes[i].Creature_Names_M[random_Name]
		EndIf
		i += 1
	EndWhile
EndFunction

String Function WhatsmyName_Female(Race akDadRace) ;Female name for Baby
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			int random_Name = Utility.RandomInt(0, AddonBabyTypes[i].Creature_Names_F.Length-1)
			return AddonBabyTypes[i].Creature_Names_F[random_Name]
		EndIf
		i += 1
	EndWhile
EndFunction

float Function WhatsmyName_Auto(Race akDadRace) ;bool to see if the baby does get named automatically
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].FPFP_Global_Rename_Auto.GetValue()
		EndIf
		i += 1
	EndWhile
EndFunction

Potion Function Wheresmy_Eggs(Race akDadRace) ;what product(Egg or other) if the Child or Adult is laying
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].Egg_Object
		EndIf
		i += 1
	EndWhile
EndFunction


Potion Function Wheresmy_Milk(Race akDadRace) ;what product(Milk or other) if the Child or Adult is Milked
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].Milk_Object
		EndIf
		i += 1
	EndWhile
EndFunction

Perk Function WhatBallsdoIHave(Actor akMan) ;The Perk(Balls) will be picked if injected with bah
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsPerkMatch(akMan)
			return AddonBabyTypes[i].Creature_Balls
		EndIf
		i += 1
	EndWhile
EndFunction

Faction Function WhatFaction(Race akDadRace) ;The Faction(Creature Faction) will be picked if injected with bah
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].Creature_Faction
		EndIf
		i += 1
	EndWhile
EndFunction

Faction Function WhatFaction_Friendly(Race akDadRace) ;The Faction(Creature Faction) will be picked if injected with bah
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].Creature_Faction_Friendly
		EndIf
		i += 1
	EndWhile
EndFunction

Actorbase Function NewFather(Actor akMan) ;The Actor will be spawned to impregnate the other person
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsPerkMatch(akMan)
			return AddonBabyTypes[i].NewFather
		EndIf
		i += 1
	EndWhile
EndFunction

form Function ismybabydead(Race akDadRace) ;what product(Cage or other) if the Child or Adult is Caged
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].BabyTypeItem_dead[0]
		EndIf
		i += 1
	EndWhile
EndFunction


float Function WhatsmyChances(Race akDadRace) ;bool to see if the baby does get named automatically
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].INVB_Global_Creature_Chance.GetValue()
		EndIf
		i += 1
	EndWhile
	
	return FPFP_Global_Chance.GetValue()
EndFunction





ActorValue Function SexCounter(Race akDadRace) ;Counter for Sex Scenes from Creatures
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].INVB_Global_Creature_SexCounter
		EndIf
		i += 1
	EndWhile
EndFunction

ActorValue Function BirthCounter(Race akDadRace) ;Counter for Birth Scenes from Creatures
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].INVB_Global_Creature_BirthCounter
		EndIf
		i += 1
	EndWhile
EndFunction

float Function BirthCounter_Global(Race akDadRace) ;bool to see if the baby does get named automatically
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].INVB_Global_Creature_BirthCounter_Global.GetValue()
		EndIf
		i += 1
	EndWhile
EndFunction

float Function SexCounter_Global(Race akDadRace) ;bool to see if the baby does get named automatically
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].INVB_Global_Creature_SexCounter_Global.GetValue()
		EndIf
		i += 1
	EndWhile
EndFunction

Perk Function BirthPerk(Race akDadRace) ;Perks for Births from Creatures
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].INVB_Global_Creature_BirthPerk
		EndIf
		i += 1
	EndWhile
EndFunction

Perk Function SexPerk(Race akDadRace) ;Perks for Sex Scenes from Creatures
	int i = 0
	While i < AddonBabyTypes.Length
		If AddonBabyTypes[i].IsRaceMatch(akDadRace)
			return AddonBabyTypes[i].INVB_Global_Creature_SexPerk
		EndIf
		i += 1
	EndWhile
EndFunction




;/Int Function RegisterBaby(FPFP_BabyScript akBabyRef) 

	If !Babies
	
		Babies = new FPFP_BabyScript[100]
		
	Endif

	int element = Babies.Find(NONE)
	
	If element >= 0 ; If we have a NONE slot
	
		Babies[element] = akBabyRef
		
		Return element
	
	Else 
	
		If LL_FourPlay.GetLLFPScriptVersion() ; Make sure we have the LL_FourPlay script
		
			element = Babies.Length
		
			Babies = LL_FourPlay.ResizeFormArray(Babies as Form[], Babies.Length + 1, akBabyRef as Form) as FPFP_BabyScript[]
			
			return element ; Return the position
			
		Else
		
			Debug.MessageBox("WARNING: LL_FourPlay isn't installed. We couldn't add the babby person. Please re-install Four Play Community Patch.")
			
			Return -1
			
		EndIf
	
	EndIf
	
EndFunction

Function UnregisterBaby(FPFP_BabyScript akBabyRef) ; deletes the baby, then any other pertinent information in our registered babys ( i.e. the pointer itself )
	
	int Element = Babies.Find(akBabyRef)
	Babies[Element].StartDelete()
	If Element > -1
		Babies[Element] = None
	Endif
	
EndFunction/;

;Baby helper functions

Bool I_GetCrib_Lock = False
ObjectReference Function GetCrib()

	int i = 0
	
	ObjectReference theReturn
	
	If I_GetCrib_Lock && i < 15
		Utility.Wait(0.1)
		i += 1
	EndIf
	
	I_GetCrib_Lock = true
	
	FPFP_Crib.Stop()
	FPFP_Crib.Start()
	If FPFP_Crib.IsRunning()

		theReturn = Crib.getReference()
	
	Endif
	FPFP_Crib.Stop()
	
	I_GetCrib_Lock = false
	
	Return theReturn

EndFunction

Function SetCribOwner(ObjectReference akCrib, bool abNotNONE = True)

	If akCrib

		If abNotNONE
	
			akCrib.setActorRefOwner(Piper)
		
		Else
	
			akCrib.setActorRefOwner(NONE)
	
		EndIf
	
	EndIf
	
EndFunction

Function ShowBabyInfo(FPFP_BabyScript akBabyRef)

	float ageInMonths = (Utility.GetCurrentGameTime() - akBabyRef.BirthDate ) / FPE.FPFP_Global_Day.GetValue()
	
	float monthsUntilChild = (akBabyRef.INVB_Global_BabyToChild.GetValue() * akBabyRef.GetGrowthMultiplier()) - ageInMonths
	
	FPFP_Msg_BabyInfo.Show(ageInMonths, monthsUntilChild, FPE.FPFP_Global_Day.GetValue()) 

EndFunction

Function ShowChildInfo(FPFP_GrowingChildScript akChildRef)

	float ageInMonths = (Utility.GetCurrentGameTime() - akChildRef.GetValue(FPFP_AV_BirthDate) ) / FPE.FPFP_Global_Day.GetValue()
	
	float monthsUntilAdult = akChildRef.INVB_Global_ChildToAdult.GetValue() - ageInMonths
		
	FPFP_Msg_ChildInfo.Show(ageInMonths,monthsUntilAdult, FPE.FPFP_Global_Day.GetValue()) 

EndFunction

Function ShowAdultInfo(FPFP_EvolvingAdult akAdultRef)

	float ageInMonths = (Utility.GetCurrentGameTime() - akAdultRef.GetValue(FPFP_AV_BirthDate) ) / FPE.FPFP_Global_Day.GetValue()
	
	float monthsUntilAdult = akAdultRef.INVB_Global_AdultEvolve.GetValue() - ageInMonths
		
	FPFP_Msg_ChildInfo.Show(ageInMonths,monthsUntilAdult, FPE.FPFP_Global_Day.GetValue()) 

EndFunction

Function HandleMCMUpdate(string asFunc)
	If asFunc == "BabyToChild" || "Day" || "ChildToAdult"
		SendCustomEvent("FPEBabyUpdateGameTimer")
	EndIf
EndFunction

;Handle quest shutdown

Function StartReset()

	;RemoveAndResetBabies()
	
	AddonBabyTypes = new FPFP_BabyTypeAddon[0]

EndFunction

;/Function RemoveAndResetBabies()

	int i = 0
	
	While i < Babies.Length
	
		Babies[i].StartDelete()
		
		Babies[i] = None
		
		i += 1
	
	Endwhile

EndFunction; 2.1 now deprecated, will be handled by general OnReset and caught by all/;

; Register custom addons

Function RegisterBabyType(FPFP_BabyTypeAddon akBabyType) ; puts babytype into our addon list, and announces it
	AddonBabyTypes.Add(akBabyType)
	Debug.Trace("FPE Baby Handler: Baby Type " + akBabyType.BabyTypeAddonName +" has been added to FPE")
EndFunction

Function ReregisterBabyTypeAddons() ; Sends event to all baby type quests to tell them to reregister with the main mod
	AddonBabyTypes = new FPFP_BabyTypeAddon[0]
	Utility.Wait(5.0)
	SendCustomEvent("FPEBabyTypeReregister")
	Utility.Wait(5.0)
	Debug.MessageBox("Please Save and Reload Game.")
EndFunction

Function ShowRegisteredAddons()

	If AddonBabyTypes.Length < 1
		Debug.MessageBox("There are no registered addons currently.")
		Return	
	else
		Utility.Wait(5.0)
		Debug.MessageBox("Please press Escape to Exit MCM (if you are still in MCM)")
		Debug.MessageBox("Please press Enter or click Ok to proceed")
		Debug.MessageBox("You will be pressing those buttons for a while if you are using my mod")
	
		int i = 0
		While i < AddonBabyTypes.length
			Debug.MessageBox(BuildAddonDisplayInfo(AddonBabyTypes[i], i))
			i+=1
		Endwhile
	EndIf
EndFunction

Function ShowRegisteredAddons_Details()

	If AddonBabyTypes.Length < 1
		Debug.MessageBox("There are no registered addons currently.")
		Return	
	else
		Utility.Wait(5.0)
		Debug.MessageBox("Please press Escape to Exit MCM (if you are still in MCM)")
		
		Debug.MessageBox("Please press Enter or click Ok to proceed")
		Debug.MessageBox("You will be pressing those buttons for a while if you are using my mod")
	
		int i = 0
		While i < AddonBabyTypes.length
			Debug.MessageBox(BuildAddonDisplayInfo_Details(AddonBabyTypes[i], i))
			i+=1
		Endwhile
	EndIf
EndFunction

Function ShowRegisteredAddons_Adult()

	If AddonBabyTypes.Length < 1
		Debug.MessageBox("There are no registered addons currently.")
		Return	
	else
		Utility.Wait(5.0)
		Debug.MessageBox("Please press Escape to Exit MCM (if you are still in MCM)")
		Debug.MessageBox("Please press Enter or click Ok to proceed")
		Debug.MessageBox("You will be pressing those buttons for a while if you are using my mod")
		
		
		int i = 0
		While i < AddonBabyTypes.length
			Debug.MessageBox(BuildAddonDisplayInfo_Adult(AddonBabyTypes[i], i))
			i+=1
		Endwhile
	EndIf
EndFunction

String Function BuildAddonDisplayInfo(FPFP_BabyTypeAddon akBabyType, int aiIndex)

	String text = "Baby Addon "+aiIndex+" : "+akBabyType.BabyTypeAddonName+"\n"
	
	if GetArrayPropertyAsStringName(akBabyType.BabyTypeItem_M as Form[], 3) != ""
		text += "Male Baby Item : " + GetArrayPropertyAsStringName(akBabyType.BabyTypeItem_M as Form[], 3)+"\n"
		text += "Female Baby Item : " + GetArrayPropertyAsStringName(akBabyType.BabyTypeItem_F as Form[], 3)+"\n"
	else
		text += "Baby Item : " + GetArrayPropertyAsStringName(akBabyType.BabyTypeItem as Form[], 3)+"\n"
	endif

	text += "Father Race : " + GetArrayPropertyAsStringName(akBabyType.FatherRace as Form[], 3) +"\n"

	if GetArrayPropertyAsStringName(akBabyType.OptionalChildActors_M as Form[], 3) != ""
		text += "Male Child Actors : " + GetArrayPropertyAsStringName(akBabyType.OptionalChildActors_M as Form[], 3) +"\n"
		text += "Female Child Actors : " + GetArrayPropertyAsStringName(akBabyType.OptionalChildActors_F as Form[], 3) +"\n"
	elseif GetArrayPropertyAsStringName(akBabyType.OptionalChildActors as Form[], 3) != ""	
		text += "Child Actors : " + GetArrayPropertyAsStringName(akBabyType.OptionalChildActors as Form[], 3) +"\n"
	endif
	
	if GetArrayPropertyAsStringName(akBabyType.OptionalAdultActors_M as Form[], 3) != ""
		text += "Male Adult Actors : " + GetArrayPropertyAsStringName(akBabyType.OptionalAdultActors_M as Form[], 3) +"\n"
		text += "Female Adult Actors : " + GetArrayPropertyAsStringName(akBabyType.OptionalAdultActors_F as Form[], 3) +"\n"
	elseif GetArrayPropertyAsStringName(akBabyType.OptionalAdultActors as Form[], 3) != ""	
		text += "Adult Actors : " + GetArrayPropertyAsStringName(akBabyType.OptionalAdultActors as Form[], 3) +"\n"
	endif
	
	if akBabyType.ExtraBabiesToAdd != 0
		text += "Extra Babies : " + akBabyType.ExtraBabiesToAdd 	
	endif
	
	Return text

EndFunction

String Function BuildAddonDisplayInfo_Details(FPFP_BabyTypeAddon akBabyType, int aiIndex)

	String text = "Baby Addon(More Details) "+aiIndex+" : "+akBabyType.BabyTypeAddonName+"\n"

	text += "Race : " + GetArrayPropertyAsStringName(akBabyType.FatherRace as Form[], 3) +"\n"

	if akBabyType.Creature_Cycle != 0
		text += "How Long is pregnancy : " + akBabyType.Creature_Cycle as int + " FPE Months Long" +"\n"	
	endif
	
	
	if akBabyType.Creature_Morph != 0
		text += "How big is the pregnancy : %" + (akBabyType.Creature_Morph * 100) as int +"\n"
	endif
	
	if akBabyType.int_Surrogate_Worth != 0
		text += "How much if sold at birth: " + akBabyType.int_Surrogate_Worth +" Caps \n"
	endif
	
	if akBabyType.Creature_Perk != None
		text += "What impregnation perk : " + akBabyType.Creature_Perk.getname() +"\n"
	endif

	if akBabyType.Creature_Cum != None
		text += "What creature cum is given : " + akBabyType.Creature_Cum.getname() +"\n"
	endif
	
	if akBabyType.Egg_Object != None
		text += "What egg is given : " + akBabyType.Egg_Object.getname() +"\n"
	endif
	
	if akBabyType.Milk_Object != None
		text += "What drink is given : " + akBabyType.Milk_Object.getname() +"\n"
	endif
	
	if akBabyType.Creature_STD != None
		text += "What STD is given : " + akBabyType.Creature_STD.getname() +"\n"
	endif
	
	if akBabyType.Creature_Balls != None
		text += "What perk is required for human impregnation : " + akBabyType.Creature_Balls.getname() +"\n"
	endif
	
	text += "Does the pregnancy have multiple births : " + akBabyType.Creature_Cycle_Multi +"\n"
	
	Return text

EndFunction

String Function BuildAddonDisplayInfo_Adult(FPFP_BabyTypeAddon akBabyType, int aiIndex)

	if akBabyType.Caps_Object != None && akBabyType.Meat_Object != None && akBabyType.Caged_Object != None
		String text = "Baby Addon(Adult Resources) "+aiIndex+" : "+akBabyType.BabyTypeAddonName+"\n"

		text += "Race : " + GetArrayPropertyAsStringName(akBabyType.FatherRace as Form[], 3) +"\n"

		
		if akBabyType.Caps_Object != None
			text += "What payment or product : " + akBabyType.Caps_Object.getname() +"\n"
			text += "How much : " + akBabyType.int_howmuch_Exile  +"\n"
		endif

		if akBabyType.Meat_Object != None
			text += "What kind of meat : " + akBabyType.Meat_Object.getname() +"\n"
			text += "How much meat : " + akBabyType.int_howmuch_Meat  +"\n"
		endif
		
		if akBabyType.Caged_Object != None
			text += "What kind of cage : " + akBabyType.Caged_Object.getname() +"\n"
		endif
		
		Return text
	
	else
		String text = "Baby Addon(Adult Resources) "+aiIndex+" : "+akBabyType.BabyTypeAddonName+"\n"

		text += "Race : " + GetArrayPropertyAsStringName(akBabyType.FatherRace as Form[], 3) +"\n"
		
		text += "Doesn't contain any Adult Resource Data \n"
		
		text += "Because this race may be designed for Impregnation Only \n"
		text += "\n"
		text += "Please press OK to continue \n"
		Return text
	endif
EndFunction

String Function GetArrayPropertyAsStringName(Form[] akArray, int aiLimit)

	string text
	
	If akArray.Length < 1 || aiLimit < 1
		Return ""
	Else
		text += akArray[0].GetName()
	EndIf
	
	If akArray.Length > 1 && aiLimit > 1
		
		int i = 1
		
		While i < akArray.Length && i < aiLimit
			text+=", " + akArray[i].GetName()
			i += 1
		EndWhile
		
	EndIf
	
	return text

EndFunction

; Debug

Function BHTrace(string theText)
	Debug.Trace("FPE Bab Handler - "+ theText)
EndFunction
