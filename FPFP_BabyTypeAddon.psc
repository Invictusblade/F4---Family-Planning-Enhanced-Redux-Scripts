ScriptName FPFP_BabyTypeAddon Extends Quest 

Group MandatoryProperties

String Property BabyTypeAddonName Auto Const Mandatory
{Used to announce that the mod is loaded in papyrus logs, and to distinguish it from other mods}
Form[] Property BabyTypeItem_F Auto Const
Form[] Property BabyTypeItem_M Auto Const
Form[] Property BabyTypeItem Auto Const
Form[] Property BabyTypeItem_dead Auto Const
{This list holds all the baby items that you want to be compatible with your father race.
If you want the baby item to properly grow, attach FPFP_BabyScript to it.}
Race[] Property FatherRace Auto Const Mandatory 
{If a father's race matches this one, then the woman should birth this kind of child. 
Note, this is checked if there are no elements in the FatherRaceKeywords variable.}

EndGroup

Group OptionalProperties

Form[] Property OptionalChildActors_F Auto Const
Form[] Property OptionalChildActors_M Auto Const
Form[] Property OptionalChildActors Auto Const
{This list holds any child actors that should be spawned on birth. 
NOTE that if this is filled with one viable actor base, then the BabyTypeItem variable is ignored.}

int Property ExtraBabiesToAdd = 0 Auto Const 
{How many children to add to the minimum 1 child to be born.
Useful if you want a specific race to give more than one child}

EndGroup

GlobalVariable property INVB_Global_Creature_Birth Auto Const
GlobalVariable property FPFP_Global_Gender_Select Auto Const Mandatory
GlobalVariable property FPFP_Global_Viable Auto Const Mandatory

FPFP_Player_Script FPE
FPFP_BabyHandlerScript BabyHandler

Group Data_Creature
	Float Property Creature_Cycle = 9.0 Auto Const	;How Long is the Pregnancy
	Float Property Creature_Morph = 1.0 Auto Const	;How Large can the Pregnant belly be
	Perk Property Creature_Perk Auto Const	;What Perk is given to NPC when Pregnant with said Creature
	Potion Property Creature_Cum Auto Const	;if wearing a condom, what kind of Creature Cum is produced during sex
	Potion Property Egg_Object Auto Const	;if Creature can lay an egg
	Potion Property Milk_Object Auto Const	;if Creature can be Milked
	Bool Property Creature_Cycle_Multi = false Auto Const	;If a creature pregnancy has multple birthings
	Bool Property Creature_Start = false Auto Const	;if the pregnancy starts halfway (for WDF Impregnation Mod)
	String Property Creature_String Auto Const	;Creatures Sex Message
	String Property Creature_String_Birth Auto Const	;Creatures Birth Message
	String Property Creature_String_Impreg Auto Const	;Creatures Impregnation Message
	Perk Property Creature_STD Auto Const	;Creatures STD that could be given
	SPELL Property SP_Cumshot_Extra Auto	;What colour is a Creatures Cum
	int Property int_Surrogate_Worth = 100 Auto	;How much is this in Surrogacy
	String[] Property Creature_Names_M Auto Const ;Male Name
	String[] Property Creature_Names_F Auto Const ;Female Name
	String[] Property Creature_Names Auto Const ;Unisex Name
	GlobalVariable property FPFP_Global_Rename_Auto Auto Const Mandatory ;if Naming is Automated
	Faction Property Creature_Faction Auto Const
	Faction Property Creature_Faction_Friendly Auto Const
	GlobalVariable property INVB_Global_Creature_Chance Auto Const Mandatory ;Chances of Pregnancy
	GlobalVariable property INVB_Global_Creature_Length Auto Const Mandatory ;Length of Pregnancy
	GlobalVariable property INVB_Global_Creature_Morph Auto Const Mandatory ;Size of Morph
	GlobalVariable property INVB_Global_Creature_Extra Auto Const Mandatory ;Extra Babies
	
	Actorbase Property NewFather Auto Const ;Fake Father who will come in to cockblock you
	Perk Property Creature_Balls Auto Const	;Creatures Perk when given to NPC allows them to father this Race
EndGroup

Group Data_Adults
	Form property Caps_Object = None auto ;Money or Product
	Form Property Meat_Object Auto Const ;Meat Object to be Selected
	Form Property Caged_Object Auto Const ;Caged Object to be Selected
	int Property int_howmuch_Meat auto ;How much Meat is the Creature
	int Property int_howmuch_Exile auto ;How much Product is the Creature
	int Property int_howmuch_Slave auto ;How much Money is the Creature
	string Property fpfp_leavingHome auto ;String for Creature being Exiled 
	string Property fpfp_Butchered auto ;String for Creature being Butchered
	string Property fpfp_Caged auto ;String for Creature being Caged
	string Property fpfp_Slavery auto ;String for Creature being Sold
	
	Bool Property Adult_Allowed = true Auto Const	;if Creature is allowed to be Bah
EndGroup

Event OnQuestInit() 
	
	FPE = FPFP_Player_Script.GetAPI()
	BabyHandler = FPFP_Player_Script.GetBabyAPI()
	BabyHandler.RegisterBabyType(self)
	RegisterForCustomEvent(BabyHandler, "FPEBabyTypeReregister")
	
EndEvent

Var Function GetBabyType(bool Breeder, float mod) 

	Var theReturn
	
	int random_LList = Utility.RandomInt(1, 100)
	int random_Viable = Utility.RandomInt(1, 100)
	
	if mod > 1
		random_Viable = random_Viable * mod as int
	endif	
	
	if random_Viable >= FPFP_Global_Viable.GetValue()
		Return BabyTypeItem_dead[Utility.RandomInt(0,BabyTypeItem_dead.Length-1)]
	else
	
		If OptionalChildActors_F.Length > 0 && INVB_Global_Creature_Birth.GetValue() == 1 && (random_LList <= FPFP_Global_Gender_Select.GetValue())
			Return OptionalChildActors_F[Utility.RandomInt(0,OptionalChildActors_F.Length-1)]

		ElseIf OptionalChildActors_M.Length > 0 && INVB_Global_Creature_Birth.GetValue() == 1
			Return OptionalChildActors_M[Utility.RandomInt(0,OptionalChildActors_M.Length-1)]
		
		ElseIf OptionalChildActors.Length > 0 && INVB_Global_Creature_Birth.GetValue() == 1
			Return OptionalChildActors[Utility.RandomInt(0,OptionalChildActors.Length-1)]
		
		else
			
			If BabyTypeItem.Length > 0
				Return BabyTypeItem[Utility.RandomInt(0,BabyTypeItem.Length-1)]
			endif
		
			if (random_LList <= FPFP_Global_Gender_Select.GetValue())
				Return BabyTypeItem_F[Utility.RandomInt(0,BabyTypeItem_F.Length-1)]
			else
				Return BabyTypeItem_M[Utility.RandomInt(0,BabyTypeItem_M.Length-1)]
			EndIf
		EndIf
	EndIf
	
	Return theReturn
	
EndFunction

Bool Function IsRaceMatch(Race akRace) ; uses our properties to check if the race sent to us matches
	int i_Race = 0
	While i_Race < FatherRace.Length
		If akRace == FatherRace[i_Race]
			Return True ; the given race matches one of ours
		EndIf
		i_Race += 1
	EndWhile
	Return False ; if we get here then there are no keywords AND no match	
EndFunction

Bool Function IsPerkMatch(Actor akMan) ; uses our properties to check if the race sent to us matches
	If akMan.HasPerk(Creature_Balls)	
		Return True ; the given race matches one of ours
	EndIf

	Return False ; if we get here then there are no keywords AND no match	
EndFunction

Int Function AdditionalBabies() ; This function is here to ensure that the add.babbs are >= 0
	
	;If ExtraBabiesToAdd >= 0
	
	;	return ExtraBabiesToAdd
	;else 
	
	if INVB_Global_Creature_Birth.GetValue() > 0
		return ExtraBabiesToAdd
	EndIf
	
	return 0
	
EndFunction

Event FPFP_BabyHandlerScript.FPEBabyTypeReregister(FPFP_BabyHandlerScript akSender, Var[] akVars) ; Used to reregister after an FPE reset
	
	BabyHandler.RegisterBabyType(self)
	
EndEvent
