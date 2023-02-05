Scriptname FPE_MCM_Debug extends Quest

ActorBase Property ac_FatherCum Auto					; changed from Actor
Actor property PlayerRef Auto Const Mandatory
Keyword Property kw_noPreg Auto
Faction Property FPFP_Preggo Auto Const Mandatory
Keyword Property fpfp_noDaddy Auto
FPFP_Player_Script FPE
Form[] Property Armor_Baby Auto Const Mandatory
Perk[] Property Perk_Pregnancies Auto Const Mandatory
Perk[] Property Perk_Months Auto Const Mandatory
Perk[] Property Perk_STD Auto Const Mandatory
Quest property FPFP_Labour auto const

Perk Property WLD_Perk_Surrogate_1 Auto
Perk Property WLD_Perk_Surrogate_2 Auto
Perk Property WLD_Perk_Surrogate_3 Auto
Keyword Property kw_Surrogate02_perk Auto
Keyword Property kw_Surrogate03_perk Auto
Perk Property WLD_Perk_Pregnancy_Freezing Auto

GlobalVariable property FPFP_Global_Current_Births Auto Const Mandatory
GlobalVariable property FPFP_Global_Current_Births_Player Auto Const Mandatory

Faction[] Property Creature_Factions Auto Const
Perk Property WLD_Perk_Pheromones Auto


ActorValue[] Property FPFP_AV_Sex Auto Const
GlobalVariable[] property FPFP_Global_Counter_Sex Auto Const Mandatory
ActorValue[] Property FPFP_AV_Birth Auto Const
GlobalVariable[] property FPFP_Global_Counter_Birth Auto Const Mandatory

ActorValue Property FPFP_AV_SafeSex Auto Const
GlobalVariable property FPFP_Global_Counter_SafeSex Auto Const Mandatory
Keyword Property FPFP_UniqueSexPartner Auto Const Mandatory
GlobalVariable property FPFP_Global_Counter_SexHuman_Player Auto Const Mandatory
ActorValue Property FPFP_AV_SexHuman_Player Auto Const

Perk[] Property WLD_Perk_Sex Auto
Perk[] Property WLD_Perk_Birth Auto
Perk Property WLD_Perk_SexHuman_Player Auto
Perk Property WLD_Perk_SafeSex Auto
String[] Property Creatures Auto

ActorValue Property FPFP_AV_Romance_Drugs Auto Const
ActorValue Property FPFP_AV_Romance_Drugs_Reveal Auto Const
ActorValue Property FPFP_AV_Romance_Gift Auto Const
ActorValue Property FPFP_AV_Romance_Gift_Reveal Auto Const
ActorValue Property FPFP_AV_Romance_Sex Auto Const
ActorValue Property FPFP_AV_Romance_Sex_Reveal Auto Const
ActorValue Property FPFP_AV_Romance_Total Auto Const
GlobalVariable property INVB_Global_Marriage_Total Auto Mandatory


Keyword Property FPFP_Cum_Keyword Auto Const Mandatory
Perk Property WLD_Perk_Cumflated Auto Const Mandatory
;Sex
Perk Property WLD_Perk_Sexually_Normal Auto
Perk Property WLD_Perk_Sexually_Sexually Auto
Perk Property WLD_Perk_Sexually_Active Auto
Perk Property WLD_Perk_Sexually_SexuallyShy Auto
;Gift
Perk Property WLD_Perk_Gifts_GoldDigger Auto
Perk Property WLD_Perk_Gifts_Frugal Auto
Perk Property WLD_Perk_Gifts_LoveGuns Auto
Perk Property WLD_Perk_Gifts_HatesGuns Auto
Perk Property WLD_Perk_Gifts_LoveClothes Auto
Perk Property WLD_Perk_Gifts_HatesClothes Auto
Perk Property WLD_Perk_Gifts_LoveSexToys Auto
Perk Property WLD_Perk_Gifts_HatesSexToys Auto
Perk Property WLD_Perk_Gifts_LoveFood Auto
Perk Property WLD_Perk_Gifts_HatesFood Auto
Perk Property WLD_Perk_Gifts_LoveDrink Auto
Perk Property WLD_Perk_Gifts_HatesDrink Auto
;Drugs
Perk Property WLD_Perk_Drugs_Junkie Auto
Perk Property WLD_Perk_Drugs_Teetotaler Auto


Potion property Aid_Pickup_Charisma Auto Const Mandatory
Perk Property WLD_Perk_PostPartum Auto

Spell Property FPFP_BasePregSpell Auto Const Mandatory

Keyword property FPFP_KW_IsPlayersChild auto const

Form[] Property Baby_Growing Auto Const Mandatory
Form[] Property Baby_NotGrowing Auto Const Mandatory

Quest property FPFP_SpreadContent auto const
Quest Property FPFP_BabyNames Auto Const 
Quest Property FPFP_Interests Auto Const 
Quest Property FPFP_Cumflation_Quest Auto Const 
Quest Property FPFP_Repeat_Addiction Auto Const 
Quest Property FPFP_ActorValuePerker Auto Const 
Quest Property FPFP_Messages Auto Const 
Quest Property FPFP_STD Auto Const 
Quest Property FPFP_Engagement Auto Const 

GlobalVariable property FPFP_Global_Debug_Bodymonth Auto Const Mandatory

Function GiveNPCUnderCrosshairs_Baby_Growing_Object() ;Not Working
	debug.notification("You have started the Baby Growing Process") 

	ObjectReference TheBaby_Ground = GetMiscObjectUnderCrosshairs()
	
	int i
	while (i <= Baby_NotGrowing.Length-1)
		if TheBaby_Ground == Baby_NotGrowing[i]
			Utility.Wait(1)
			; Find the dropped baby
			ObjectReference TheBaby = Game.FindClosestReferenceOfTypeFromRef(Baby_NotGrowing[i], PlayerRef, 100)
			
			String BabyName = RenameAnything.GetRefName(TheBaby)
			ObjectReference theBaby_new = PlayerRef.PlaceAtMe(Baby_Growing[i], aiCount = 1, abForcePersist = False, abInitiallyDisabled = false, abDeleteWhenAble = false)
			
			If (Game.IsPluginInstalled("SKK476OpenWorld.esp") == TRUE)
				theBaby_new.AddKeyword(Game.GetFormFromFile(0x00019bcb, "SKK476OpenWorld.esp") as Keyword)
			EndIf
			
			If theBaby.HasKeyword(FPFP_KW_IsPlayersChild)
				theBaby_new.AddKeyword(FPFP_KW_IsPlayersChild)
			EndIf
						
			RenameAnything.SetRefName(theBaby_new, BabyName)
			(TheBaby as FPFP_BabyScript_Fake).StartDelete()
			i = Baby_NotGrowing.Length
		endIf
		i += 1
	endwhile

	debug.notification("You have finished the Baby Growing Process") 
EndFunction	
	
Function GiveNPCUnderCrosshairs_Baby_NotGrowing_Object() ;Not Working
	debug.notification("You have started the Baby Non-Growing Process") 
	ObjectReference TheBaby_Ground = GetMiscObjectUnderCrosshairs()
	int i
	while (i <= Baby_Growing.Length-1)
		if TheBaby_Ground == Baby_Growing[i]
			Utility.Wait(1)
			; Find the dropped baby
			ObjectReference TheBaby = Game.FindClosestReferenceOfTypeFromRef(Baby_Growing[i], PlayerRef, 100)
			String BabyName = RenameAnything.GetRefName(TheBaby)
			ObjectReference theBaby_new = PlayerRef.PlaceAtMe(Baby_NotGrowing[i], aiCount = 1, abForcePersist = False, abInitiallyDisabled = false, abDeleteWhenAble = false)
			
			If (Game.IsPluginInstalled("SKK476OpenWorld.esp") == TRUE)
				theBaby_new.AddKeyword(Game.GetFormFromFile(0x00019bcb, "SKK476OpenWorld.esp") as Keyword)
			EndIf
			
			If theBaby.HasKeyword(FPFP_KW_IsPlayersChild)
				theBaby_new.AddKeyword(FPFP_KW_IsPlayersChild)
			EndIf
			
			RenameAnything.SetRefName(theBaby_new, BabyName)
			(TheBaby as FPFP_BabyScript).StartDelete()
			i = Baby_Growing.Length
		endIf
		i += 1
	endwhile
	
	debug.notification("You have finished the Baby Non-Growing Process") 
EndFunction		


Function GiveNPCUnderCrosshairs_Baby_Growing()
	debug.notification("You have started the Baby Growing Process") 

	Actor akActor = GetActorUnderCrosshairs()
	int i
	while (i <= Baby_NotGrowing.Length)
		if (akActor.GetItemCount(Baby_NotGrowing[i]) >= 1)
			Utility.Wait(1)
			akActor.DropObject(Baby_NotGrowing[i])
			Utility.Wait(0.5)
			; Find the dropped baby
			ObjectReference TheBaby = Game.FindClosestReferenceOfTypeFromRef(Baby_NotGrowing[i], akActor, 100)
			
			String BabyName = RenameAnything.GetRefName(TheBaby)
			ObjectReference theBaby_new = akActor.PlaceAtMe(Baby_Growing[i], aiCount = 1, abForcePersist = False, abInitiallyDisabled = false, abDeleteWhenAble = false)
			
			If (Game.IsPluginInstalled("SKK476OpenWorld.esp") == TRUE)
				theBaby_new.AddKeyword(Game.GetFormFromFile(0x00019bcb, "SKK476OpenWorld.esp") as Keyword)
			EndIf
			
			If theBaby.HasKeyword(FPFP_KW_IsPlayersChild)
				theBaby_new.AddKeyword(FPFP_KW_IsPlayersChild)
			EndIf
			RenameAnything.SetRefName(theBaby_new, BabyName)			
			akActor.additem(theBaby_new, 1)
			RenameAnything.SetRefName(theBaby_new, BabyName)
			(TheBaby as FPFP_BabyScript_Fake).StartDelete()
			i = Baby_NotGrowing.Length
		endIf
		i += 1
	endwhile

	debug.notification("You have finished the Baby Growing Process") 
EndFunction	
	
Function GiveNPCUnderCrosshairs_Baby_NotGrowing()
	debug.notification("You have started the Baby Non-Growing Process") 
	Actor akActor = GetActorUnderCrosshairs()
	int i
	while (i <= Baby_Growing.Length)
		if (akActor.GetItemCount(Baby_Growing[i]) >= 1)
			Utility.Wait(1)
			akActor.DropObject(Baby_Growing[i])
			Utility.Wait(0.5)
			; Find the dropped baby
			ObjectReference TheBaby = Game.FindClosestReferenceOfTypeFromRef(Baby_Growing[i], akActor, 100)
			String BabyName = RenameAnything.GetRefName(TheBaby)
			ObjectReference theBaby_new = akActor.PlaceAtMe(Baby_NotGrowing[i], aiCount = 1, abForcePersist = False, abInitiallyDisabled = false, abDeleteWhenAble = false)
			
			If (Game.IsPluginInstalled("SKK476OpenWorld.esp") == TRUE)
				theBaby_new.AddKeyword(Game.GetFormFromFile(0x00019bcb, "SKK476OpenWorld.esp") as Keyword)
			EndIf
			
			If theBaby.HasKeyword(FPFP_KW_IsPlayersChild)
				theBaby_new.AddKeyword(FPFP_KW_IsPlayersChild)
			EndIf
			RenameAnything.SetRefName(theBaby_new, BabyName)
			akActor.additem(theBaby_new, 1)
			RenameAnything.SetRefName(theBaby_new, BabyName)
			(TheBaby as FPFP_BabyScript).StartDelete()
			;TheBaby.Delete()
			i = Baby_Growing.Length
		endIf
		i += 1
	endwhile
	
	debug.notification("You have finished the Baby Non-Growing Process") 
EndFunction		
	

Function GiveNPCUnderCrosshairs_FixBasePregSpell()
	Actor akActor = GetActorUnderCrosshairs()
	akActor.AddSpell(FPFP_BasePregSpell)
	debug.notification("FPFP_BasePregSpell has been added to NPC (or Player if you selected nothing)") 	
EndFunction	

Function GiveNPCUnderCrosshairs_FixCumflation()
	Actor akActor = GetActorUnderCrosshairs()
	if akActor.HasKeyword(FPFP_Cum_Keyword) || akActor.HasPerk(WLD_Perk_Cumflated)
		if akActor.HasKeyword(FPFP_Cum_Keyword)		
			akActor.RemoveKeyword(FPFP_Cum_Keyword)		
		endIf
		if akActor.HasPerk(WLD_Perk_Cumflated)
			akActor.RemovePerk(WLD_Perk_Cumflated)
		endIf
		
		BodyGen.SetMorph(akActor, true, "BigBelly", FPFP_Cum_Keyword, 0)
		BodyGen.SetMorph(akActor, true, "Belly Big", FPFP_Cum_Keyword, 0)
		BodyGen.SetMorph(akActor, true, "BellyFatty", FPFP_Cum_Keyword, 0)
		BodyGen.UpdateMorphs(akActor)
		debug.notification("Cumflation should be fixed, however you will need to remove the particle effects yourself") 
	
	else
		debug.notification("Cumflation didn't get fixed wether it is not active or something else went wrong") 
	endIf	
EndFunction

Function GiveNPCUnderCrosshairs_PickupLines()
	PlayerRef.EquipItem(Aid_Pickup_Charisma, abSilent = True)
EndFunction

Function GiveNPCUnderCrosshairs_PostPartum()
	Actor akActor = GetActorUnderCrosshairs()
	
	if !akActor.HasPerk(WLD_Perk_PostPartum)
		akActor.AddPerk(WLD_Perk_PostPartum)
	else
		akActor.RemovePerk(WLD_Perk_PostPartum)
	endIf	
EndFunction

Function GiveNPCUnderCrosshairs_Romance_one()
	Actor akActor = GetActorUnderCrosshairs()
	akActor.SetValue(FPFP_AV_Romance_Sex_Reveal, 1)
	akActor.SetValue(FPFP_AV_Romance_Gift_Reveal, 1)
	akActor.SetValue(FPFP_AV_Romance_Drugs_Reveal, 1)
EndFunction

Function GiveNPCUnderCrosshairs_Romance_Reset()
	Actor akActor = GetActorUnderCrosshairs()
	akActor.SetValue(FPFP_AV_Romance_Sex_Reveal, Utility.RandomInt(1, akActor.GetValue(FPFP_AV_Romance_Total) as int /3))
	akActor.SetValue(FPFP_AV_Romance_Gift_Reveal, Utility.RandomInt(1, akActor.GetValue(FPFP_AV_Romance_Total) as int /3))
	akActor.SetValue(FPFP_AV_Romance_Drugs_Reveal, Utility.RandomInt(1, akActor.GetValue(FPFP_AV_Romance_Total) as int /3))
EndFunction

Function GiveNPCUnderCrosshairs_Romance()
	Actor akActor = GetActorUnderCrosshairs()
	int Romance_Total = 0
	String ActorName = RenameAnything.GetRefName(akActor)
	
	if ActorName == ""
		ActorName = akActor.GetLeveledActorBase().GetName()
	endIf
	
	String Romance_Message
	
	if akActor.GetValue(FPFP_AV_Romance_Sex_Reveal) == 0
		akActor.SetValue(FPFP_AV_Romance_Sex_Reveal, Utility.RandomInt(1, akActor.GetValue(FPFP_AV_Romance_Total) as int /3))
	endIf
	
	if akActor.GetValue(FPFP_AV_Romance_Gift_Reveal) == 0
		akActor.SetValue(FPFP_AV_Romance_Gift_Reveal, Utility.RandomInt(1, akActor.GetValue(FPFP_AV_Romance_Total) as int /3))
	endIf
	
	if akActor.GetValue(FPFP_AV_Romance_Drugs_Reveal) == 0
		akActor.SetValue(FPFP_AV_Romance_Drugs_Reveal, Utility.RandomInt(1, akActor.GetValue(FPFP_AV_Romance_Total) as int /3))
	endIf
	
	if akActor.GetValue(FPFP_AV_Romance_Total) == 0
		int Random_Total = (Utility.RandomInt(INVB_Global_Marriage_Total.GetValue() as int / 2, INVB_Global_Marriage_Total.GetValue() as int * 2))
		akActor.SetValue(FPFP_AV_Romance_Total, Random_Total)
	endif
	
	Romance_Message = ActorName + "\n"
	Romance_Message += "The Current Romance Totals for "+ ActorName +"\n"
	Romance_Message += "The Current Romance Count for "+ ActorName +" Drugs is "+ akActor.GetValue(FPFP_AV_Romance_Drugs) as int +"\n"
	Romance_Total += akActor.GetValue(FPFP_AV_Romance_Drugs) as int
	Romance_Message += "The Current Romance Count for "+ ActorName +" Gifts is "+ akActor.GetValue(FPFP_AV_Romance_Gift) as int +"\n"
	Romance_Total += akActor.GetValue(FPFP_AV_Romance_Gift) as int
	Romance_Message += "The Current Romance Count for "+ ActorName +" Sex is "+ akActor.GetValue(FPFP_AV_Romance_Sex) as int +"\n"
	Romance_Total += akActor.GetValue(FPFP_AV_Romance_Sex) as int
	
	if akActor.GetValue(FPFP_AV_Romance_Sex) >= akActor.GetValue(FPFP_AV_Romance_Sex_Reveal)
		if akActor.HasPerk(WLD_Perk_Sexually_Normal)
			Romance_Message += ActorName +" is quite Normal\n"
		elseif akActor.HasPerk(WLD_Perk_Sexually_SexuallyShy)
			Romance_Message += ActorName +" is Sexually Shy\n"
		elseif akActor.HasPerk(WLD_Perk_Sexually_Sexually)
			Romance_Message += ActorName +" is quite Sexual\n"
		elseif akActor.HasPerk(WLD_Perk_Sexually_Active)
			Romance_Message += ActorName +" is Sexually Active\n"
		else
			Romance_Message += ActorName +" doesn't really care about labels(Pansexual(Default))\n"
		endIf
	else
			Romance_Message += "You will find out more about me if you fuck me some more. "+akActor.GetValue(FPFP_AV_Romance_Sex) as int+ "/"+akActor.GetValue(FPFP_AV_Romance_Sex_Reveal) as int+"\n"	
	endIf	
	if akActor.GetValue(FPFP_AV_Romance_Gift) >= akActor.GetValue(FPFP_AV_Romance_Gift_Reveal)
		if akActor.HasPerk(WLD_Perk_Gifts_GoldDigger)
			Romance_Message += ActorName +" is a Golddigger so Love Gifts\n"
		
		elseif akActor.HasPerk(WLD_Perk_Gifts_Frugal)
			Romance_Message += ActorName +" is really Frugal\n"
		
		elseif akActor.HasPerk(WLD_Perk_Gifts_LoveGuns)
			Romance_Message += ActorName +" Loves to have Guns\n"
		
		elseif akActor.HasPerk(WLD_Perk_Gifts_HatesGuns)
			Romance_Message += ActorName +" Hates Guns\n"
		
		elseif akActor.HasPerk(WLD_Perk_Gifts_LoveClothes)
			Romance_Message += ActorName +" Loves to have Clothes\n"
		
		elseif akActor.HasPerk(WLD_Perk_Gifts_HatesClothes)
			Romance_Message += ActorName +" Hates Clothes\n"
			
		elseif akActor.HasPerk(WLD_Perk_Gifts_LoveFood)
			Romance_Message += ActorName +" Loves to eat interesting food. I wonder what Human tastes like\n"
		
		elseif akActor.HasPerk(WLD_Perk_Gifts_HatesFood)
			Romance_Message += ActorName +" wants to keep to consistant food. My stomach cannot stand new food\n"
		elseif akActor.HasPerk(WLD_Perk_Gifts_LoveDrink)
			Romance_Message += ActorName +" Loves Drinking. I need a drink right now.\n"
		
		elseif akActor.HasPerk(WLD_Perk_Gifts_HatesDrink)
			Romance_Message += ActorName +" hates the taste of alcohol, Cannot stand the stuff\n"	
		elseif akActor.HasPerk(WLD_Perk_Gifts_LoveSexToys)
			Romance_Message += ActorName +" Loves to have and use Sex Toys\n"
		elseif akActor.HasPerk(WLD_Perk_Gifts_HatesSexToys)
			Romance_Message += ActorName +" Hates Sex Toys\n"
		else
			Romance_Message += ActorName +" Has no interest in Gifts\n"
		endIf
	else
			Romance_Message += "You will find out more about me if you give me more gifts. "+akActor.GetValue(FPFP_AV_Romance_Gift) as int+ "/"+akActor.GetValue(FPFP_AV_Romance_Gift_Reveal) as int+"\n"
	endIf	
	if akActor.GetValue(FPFP_AV_Romance_Drugs) >= akActor.GetValue(FPFP_AV_Romance_Drugs_Reveal)
		if akActor.HasPerk(WLD_Perk_Drugs_Junkie)
			Romance_Message += ActorName +" is a Junkie\n"
		elseif akActor.HasPerk(WLD_Perk_Drugs_Teetotaler)
			Romance_Message += ActorName +" is a Teetotaler\n"	
		else
			Romance_Message += ActorName +" is a Casual User\n"
		endIf
	else
			Romance_Message += "You will find out more about me if you give me more drugs. "+akActor.GetValue(FPFP_AV_Romance_Drugs) as int+ "/"+akActor.GetValue(FPFP_AV_Romance_Drugs_Reveal) as int+"\n"	
	endIf	 
	Romance_Message += "The amount for marriage for "+ ActorName +" is "+Romance_Total+" out of "+ akActor.GetValue(FPFP_AV_Romance_Total) as int +"\n"
	
	if Romance_Total >= akActor.GetValue(FPFP_AV_Romance_Total) as int
		Romance_Message += "Marriage is Allowed"
	else
		Romance_Message += "Marriage is Not Allowed"
	endif
	
	Debug.Messagebox(Romance_Message)
EndFunction


Function GiveNPCUnderCrosshairs_Counter_Sex()
	Actor akActor = GetActorUnderCrosshairs()
	String ActorName = RenameAnything.GetRefName(akActor)
	String Statement_Counter
	Statement_Counter = "The Current Sex Count for "+ ActorName +"\n"
	Statement_Counter += ""+"\n"
	int i
	while (i <= FPFP_AV_Sex.Length)
		if akActor.GetValue(FPFP_AV_Sex[i]) > 0
			if akActor.GetValue(FPFP_AV_Sex[i]) < FPFP_Global_Counter_Sex[i].GetValue()
				Statement_Counter += Creatures[i]+": "+akActor.GetValue(FPFP_AV_Sex[i]) as int +"/"+ FPFP_Global_Counter_Sex[i].GetValue() as int +" Sex Scenes until perk is awarded"+"\n"
			else
				Statement_Counter += Creatures[i]+": "+akActor.GetValue(FPFP_AV_Sex[i]) as int +" Sex Scenes"+"\n"
			endIf
		endIf
		i += 1
	endwhile

	Debug.Messagebox(Statement_Counter)
EndFunction

bool Function GiveNPCUnderCrosshairs_Counter_Sex_bool()
	Actor akActor = GetActorUnderCrosshairs()
	bool sex_scenes_bool = false
	int i

	while (i <= FPFP_AV_Sex.Length)
		if akActor.GetValue(FPFP_AV_Sex[i]) > 0
			if akActor.GetValue(FPFP_AV_Sex[i]) < FPFP_Global_Counter_Sex[i].GetValue()
				sex_scenes_bool = true
			endIf
		endIf
		i += 1
	endwhile

	if sex_scenes_bool == false
		return false
	else
		return true
	endIf
EndFunction

Function GiveNPCUnderCrosshairs_Counter_Births()
	Actor akActor = GetActorUnderCrosshairs()
	String ActorName = RenameAnything.GetRefName(akActor)
	String Statement_Counter
	Statement_Counter = "The Current Birth Count for "+ ActorName +"\n"
	Statement_Counter += ""+"\n"
	
	int i
	while (i <= FPFP_AV_Birth.Length)
		if akActor.GetValue(FPFP_AV_Birth[i]) > 0
			if akActor.GetValue(FPFP_AV_Birth[i]) < FPFP_Global_Counter_Birth[i].GetValue()
				Statement_Counter += Creatures[i]+": "+akActor.GetValue(FPFP_AV_Birth[i]) as int +"/"+ FPFP_Global_Counter_Birth[i].GetValue() as int +" Births until perk is awarded"+"\n"
			else
				Statement_Counter += Creatures[i]+": "+akActor.GetValue(FPFP_AV_Birth[i]) as int +" Births"+"\n"
			endIf
		endIf
		i += 1
	endwhile
	
	Debug.Messagebox(Statement_Counter)
EndFunction

bool Function GiveNPCUnderCrosshairs_Counter_Births_bool()
	Actor akActor = GetActorUnderCrosshairs()
	bool Birth_bool = false
	
	int i
	while (i <= FPFP_AV_Birth.Length)
		if akActor.GetValue(FPFP_AV_Birth[i]) > 0
			if akActor.GetValue(FPFP_AV_Birth[i]) < FPFP_Global_Counter_Birth[i].GetValue()
				Birth_bool = true
			endIf
		endIf
		i += 1
	endwhile
	
	if Birth_bool == false
		return false
	else
		return true
	endIf
EndFunction

bool Function GiveNPCUnderCrosshairs_Counter_Misc_bool()
	Actor akActor = GetActorUnderCrosshairs()
	bool misc_bool = false
	
	if akActor.haskeyword(FPFP_UniqueSexPartner) && akActor != PlayerRef
		if akActor.GetValue(FPFP_AV_SexHuman_Player) < FPFP_Global_Counter_SexHuman_Player.GetValue()
			misc_bool = true
		endIf
		
	else
		if akActor.GetValue(FPFP_AV_SexHuman_Player) < FPFP_Global_Counter_SexHuman_Player.GetValue()
			misc_bool = true
		endIf
		
		
	endIf
	
	if akActor.GetValue(FPFP_AV_SafeSex) < FPFP_Global_Counter_SafeSex.GetValue()
		misc_bool = true
	endIf
	
	if misc_bool == false
		return false
	else
		return true
	endIf
EndFunction

Function GiveNPCUnderCrosshairs_Counter_Misc()
	Actor akActor = GetActorUnderCrosshairs()
	String ActorName = RenameAnything.GetRefName(akActor)
	String Statement_Counter
	Statement_Counter = "The Current Misc Sex Count for "+ ActorName +"\n"
	Statement_Counter += ""+"\n"
	
	if akActor.haskeyword(FPFP_UniqueSexPartner) && akActor != PlayerRef
		Statement_Counter += ActorName +" has had sex with "+ ActorName +"\n"
		if akActor.GetValue(FPFP_AV_SexHuman_Player) < FPFP_Global_Counter_SexHuman_Player.GetValue()
			Statement_Counter += "Sexual Partners: "+ PlayerRef.GetValue(FPFP_AV_SexHuman_Player) as int +"/"+ FPFP_Global_Counter_SexHuman_Player.GetValue() as int +" Sexual Partners until perk is awarded to "+ PlayerRef.GetLeveledActorBase().GetName()+"\n"
		else
			Statement_Counter += "Sexual Partners: "+ PlayerRef.GetValue(FPFP_AV_SexHuman_Player) as int +" Sexual Partners"+"\n"
		endIf
		
	else
		if akActor.GetValue(FPFP_AV_SexHuman_Player) < FPFP_Global_Counter_SexHuman_Player.GetValue()
			Statement_Counter += "Sexual Partners: "+ PlayerRef.GetValue(FPFP_AV_SexHuman_Player) as int +"/"+ FPFP_Global_Counter_SexHuman_Player.GetValue() as int +" Sexual Partners until perk is awarded"+"\n"
		else
			Statement_Counter += "Sexual Partners: "+ PlayerRef.GetValue(FPFP_AV_SexHuman_Player) as int +" Sexual Partners"+"\n"
		endIf
		
		
	endIf
	
	if akActor.GetValue(FPFP_AV_SafeSex) < FPFP_Global_Counter_SafeSex.GetValue()
		Statement_Counter += "Amount of Safe Sex: "+ akActor.GetValue(FPFP_AV_SafeSex) as int +"/"+ FPFP_Global_Counter_SafeSex.GetValue() as int +" Safe Sex Scenes until perk is awarded"+"\n"
	else
		Statement_Counter += "Amount of Safe Sex: "+ akActor.GetValue(FPFP_AV_SafeSex) as int +" Safe Sex Scenes"+"\n"
	endIf
	
	Debug.Messagebox(Statement_Counter)
EndFunction


Function GiveNPCUnderCrosshairs_Surrogate()
	Actor akActor = GetActorUnderCrosshairs()
	
	if akActor.HasPerk(WLD_Perk_Surrogate_1) || akActor.HasPerk(WLD_Perk_Surrogate_2) || akActor.HasPerk(WLD_Perk_Surrogate_3)
		if akActor.HasPerk(WLD_Perk_Surrogate_1) 
			akActor.removePerk(WLD_Perk_Surrogate_1) 
		elseif akActor.HasPerk(WLD_Perk_Surrogate_2)
			akActor.removePerk(WLD_Perk_Surrogate_2)
			akActor.addkeyword(kw_Surrogate02_perk)	 
		elseif akActor.HasPerk(WLD_Perk_Surrogate_3)
			akActor.removePerk(WLD_Perk_Surrogate_3)
			akActor.addkeyword(kw_Surrogate03_perk)	
		endIf
	else	
		if !akActor.haskeyword(kw_Surrogate02_perk) || !akActor.haskeyword(kw_Surrogate03_perk)	
			akActor.addperk(WLD_Perk_Surrogate_1)
		elseif akActor.haskeyword(kw_Surrogate02_perk)
			akActor.addperk(WLD_Perk_Surrogate_2)
			akActor.removekeyword(kw_Surrogate02_perk)	 
		elseif akActor.haskeyword(kw_Surrogate03_perk)	
			akActor.addperk(WLD_Perk_Surrogate_3)
			akActor.removekeyword(kw_Surrogate03_perk)
		endIf
	endIf
	
EndFunction

Function StopSpreadContentQuest()
	
	debug.notification("I'm stopping Spread content because it is broken now") 
	FPFP_SpreadContent.Stop()
	
EndFunction

Function ResetQuest_FPFP_BabyNames()
	debug.notification("Resetting Baby Names") 
	FPFP_BabyNames.Stop()
	FPFP_BabyNames.Start()
EndFunction

Function ResetQuest_FPFP_Engagement()
	debug.notification("Resetting FPFP_Engagement") 
	FPFP_Engagement.Stop()
	FPFP_Engagement.Start()
EndFunction

Function ResetQuest_FPFP_STD()
	debug.notification("Resetting FPFP_STD") 
	FPFP_STD.Stop()
	FPFP_STD.Start()
EndFunction

Function ResetQuest_FPFP_Interests()
	debug.notification("Resetting FPFP_Interests") 
	FPFP_Interests.Stop()
	FPFP_Interests.Start()
EndFunction

Function ResetQuest_FPFP_Messages()
	debug.notification("Resetting FPFP_Messages") 
	FPFP_Messages.Stop()
	FPFP_Messages.Start()
EndFunction

Function ResetQuest_FPFP_Cumflation_Quest()
	debug.notification("Resetting FPFP_Cumflation_Quest") 
	FPFP_Cumflation_Quest.Stop()
	FPFP_Cumflation_Quest.Start()
EndFunction

Function ResetQuest_FPFP_Repeat_Addiction()
	debug.notification("Resetting FPFP_Repeat_Addiction") 
	FPFP_Repeat_Addiction.Stop()
	FPFP_Repeat_Addiction.Start()
EndFunction

Function ResetQuest_FPFP_ActorValuePerker()
	debug.notification("Resetting FPFP_ActorValuePerker") 
	FPFP_ActorValuePerker.Stop()
	FPFP_ActorValuePerker.Start()
EndFunction

Function DoLabourQuest()
	
	debug.notification("I'm going into labour. I need to find a doctor as soon as possible!") 
	FPFP_Labour.Start()
	
EndFunction

Actor Function GetActorUnderCrosshairs()
	Actor ScannedActor = LL_FourPlay.LastCrossHairActor()
	
	If ScannedActor == NONE || ScannedActor.GetDistance(PlayerRef) > 256.000
		return PlayerREF
	EndIf
	Return ScannedActor
EndFunction

ObjectReference Function GetMiscObjectUnderCrosshairs()
	ObjectReference ScannedObject = LL_FourPlay.LastCrossHairRef()
	
	If ScannedObject == NONE || ScannedObject.GetDistance(PlayerRef) > 256.000
		return NONE
	EndIf
	Return ScannedObject
EndFunction

Function GiveNPCUnderCrosshairs_Ghost()
	Actor akActor = GetActorUnderCrosshairs()
	if akActor.IsGhost()
		akActor.SetGhost(false)
	else
		akActor.SetGhost(true)
	endIf	
EndFunction

Function GiveNPCUnderCrosshairs_Impregnate_advanced()
	Actor akActor = GetActorUnderCrosshairs()
	ObjectImpregnate(akActor, True)
EndFunction

Function GiveNPCUnderCrosshairs_Impregnate()
	Actor akActor = GetActorUnderCrosshairs()
	ObjectImpregnate(akActor, false)
EndFunction

Function GiveNPCUnderCrosshairs_Impregnate_Player_advanced()
	Actor akActor = GetActorUnderCrosshairs()
	ObjectImpregnate_Other(akActor, True)
EndFunction

Function GiveNPCUnderCrosshairs_Impregnate_Player()
	Actor akActor = GetActorUnderCrosshairs()
	ObjectImpregnate_Other(akActor, false)
EndFunction


Function GiveNPCUnderCrosshairs_Birth()
	Actor akActor = GetActorUnderCrosshairs()
	if akActor.HasPerk(WLD_Perk_Pregnancy_Freezing)
		akActor.RemovePerk(WLD_Perk_Pregnancy_Freezing)
	endIf
	Instant_Birth(akActor)
EndFunction

Function GiveNPCUnderCrosshairs_Unfrozen()
	Actor akActor = GetActorUnderCrosshairs()
	if akActor.HasPerk(WLD_Perk_Pregnancy_Freezing)
		akActor.RemovePerk(WLD_Perk_Pregnancy_Freezing)
		Debug.Notification("Debug: Success- Removed Frozen Pregnancy Perk")
	else
		Debug.Notification("Debug: Failed- Didn't have or didn't remove Perk")
	endIf
EndFunction

Function GiveNPCUnderCrosshairs_GrowBaby()
	Actor akActor = GetActorUnderCrosshairs()
	BabyGrower(akActor)
EndFunction

Function GiveNPCUnderCrosshairs_GrowChild()
	Actor akActor = GetActorUnderCrosshairs()
	ChildGrower(akActor)
	Debug.Notification("Debug: Growing Child")
EndFunction

Function GiveNPCUnderCrosshairs_LeaveHome()
	Actor akActor = GetActorUnderCrosshairs()
	LeaveHome(akActor)
	Debug.Notification("Debug: Exiling NPC")
EndFunction

Function GiveNPCUnderCrosshairs_Reset()
	Actor akActor = GetActorUnderCrosshairs()
	Bodymorph_Reset(akActor)
	Debug.Notification("Debug: Reset Body Morphs")
EndFunction

Function GiveNPCUnderCrosshairs_Regenerate()
	Actor akActor = GetActorUnderCrosshairs()
	If akActor.GetLeveledActorBase().GetSex() == 0
		Debug.Notification("Debug: Is a Male so this has been Disabled")
		
	else
		Bodygen.RegenerateMorphs(akActor)
		FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akActor)
		tmpData.UpdateBody(tmpData.GetCurrentMonth())
		Debug.Notification("Debug: Regenerating Body Morphs")
	endIf
	
EndFunction

Function GiveNPCUnderCrosshairs_Reduce()
	Actor akActor = GetActorUnderCrosshairs()
	If akActor.GetLeveledActorBase().GetSex() == 0
		Debug.Notification("Debug: Is a Male so this has been Disabled")
		
	else
		Bodymorph_Reduce(akActor)
		Debug.Notification("Debug: Reduce Body Morphs")
	endIf
EndFunction

Function GiveNPCUnderCrosshairs_Month_Auto() 

	Actor akActor = GetActorUnderCrosshairs()
	If akActor.GetLeveledActorBase().GetSex() == 0
		Debug.Notification("Debug: Is a Male so this has been Disabled")
	else
		FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akActor)
		tmpData.UpdateBody(tmpData.GetCurrentMonth())
		Debug.Notification("Debug: Bodymorphed to Pregnancy point")
	endIf
EndFunction

Function GiveNPCUnderCrosshairs_Month_Global()
	Actor akActor = GetActorUnderCrosshairs()
	If akActor.GetLeveledActorBase().GetSex() == 0
		Debug.Notification("Debug: Is a Male so this has been Disabled")
	else
		Bodymorph_Rebuild(akActor, FPFP_Global_Debug_Bodymonth.GetValue() as int)
		Debug.Notification("Debug: Rebuild Bodymorph "+ FPFP_Global_Debug_Bodymonth.GetValue() as int)
	endIf	
EndFunction

Function GiveNPCUnderCrosshairs_Butcher()
	Actor akActor = GetActorUnderCrosshairs()
	Butcher_NPC(akActor)
	Debug.Notification("Debug: Butchering NPC")
EndFunction

Function GiveNPCUnderCrosshairs_Cage()
	Actor akActor = GetActorUnderCrosshairs()
	Caged_NPC(akActor)
	Debug.Notification("Debug: Caging NPC")
EndFunction

Function GiveNPCUnderCrosshairs_Abort()
	Actor akActor = GetActorUnderCrosshairs()
	Instant_Abort(akActor)
	Debug.Notification("Debug: Aborted Pregnancy")
EndFunction

Function Clear_Factions()
	Actor akActor = GetActorUnderCrosshairs()
	bool Worked = false
	int i
	int int_end = Creature_Factions.Length
	while (i <= Creature_Factions.Length)
		if akActor.IsInFaction(Creature_Factions[i])
			akActor.removeFromFaction(Creature_Factions[i])
			Worked = true
		endIf
		i += 1
	endwhile
	
	if akActor.HasPerk(WLD_Perk_Pheromones)
		akActor.RemovePerk(WLD_Perk_Pheromones)
	endif
	
	if Worked == true
		Debug.Notification("Debug: Success- Removed " + int_end + " Factions")
	else
		Debug.Notification("Debug: Failed- Didn't have or didn't remove Factions")
	endIf	
EndFunction



Function Perk_Remover() 
	Actor akActor = GetActorUnderCrosshairs()
	bool Worked = false
	int i
	int int_end = Perk_Pregnancies.Length
	while (i <= Perk_Pregnancies.Length)
		If akActor.HasPerk(Perk_Pregnancies[i])
			akActor.RemovePerk(Perk_Pregnancies[i])
			Worked = true
		endIf
		i += 1
	endwhile
	
	if Worked == true
		Debug.Notification("Debug: Success- Removed " + int_end + " Perks")
	else
		Debug.Notification("Debug: Failed- Didn't have or didn't remove Perks")
	endIf	
EndFunction

Function Perk_Remover_Month() 
	Actor akActor = GetActorUnderCrosshairs()
	bool Worked = false
	int i
	int int_end = Perk_Months.Length
	while (i <= Perk_Months.Length)
		If akActor.HasPerk(Perk_Months[i])
			akActor.RemovePerk(Perk_Months[i])
			Worked = true
		endIf
		i += 1
	endwhile
	
	if Worked == true
		Debug.Notification("Debug: Success- Removed " + int_end + " Perks")
	else
		Debug.Notification("Debug: Failed- Didn't have or didn't remove Perks")
	endIf	
EndFunction

Function STD_Remover() 
	Actor akActor = GetActorUnderCrosshairs()
	bool Worked = false
	int i
	int int_end = Perk_STD.Length
	while (i <= Perk_STD.Length)
		If akActor.HasPerk(Perk_STD[i])
			akActor.RemovePerk(Perk_STD[i])
			Worked = true
		endIf
		i += 1
	endwhile
	if Worked == true
		Debug.Notification("Debug: Success- Removed STD")
	else
		Debug.Notification("Debug: Failed- Didn't have or didn't remove STD")
	endIf	
EndFunction

Function BabyGrower(Actor akActor)    
	int i
	bool Worked = false
	int int_end = Armor_Baby.Length
	while (i <= Armor_Baby.Length)
		If (akActor.GetItemCount(Armor_Baby[i]) >= 1)
			DropAndGrowIntoChild(akActor, Armor_Baby[i])
			Worked = true
			i = int_end
		endIf
		i += 1
	endwhile
	 
	if Worked == true
		Debug.Notification("Debug: Success- Growing Baby Now")
	else
		Debug.Notification("Debug: Failed- Didn't Grow Baby")
	endIf	
EndFunction

Function LeaveHome(Actor akActor)    
	If (akActor as FPFP_GrowingChildScript)
		(akActor as FPFP_GrowingChildScript).LeavingHome()
	endIf
EndFunction

Function Butcher_NPC(Actor akActor)    
	If (akActor as FPFP_GrowingChildScript)
		(akActor as FPFP_GrowingChildScript).Butchered()
	endIf
EndFunction

Function Caged_NPC(Actor akActor)    
	If (akActor as FPFP_GrowingChildScript)
		(akActor as FPFP_GrowingChildScript).Caged()
	endIf
EndFunction

Function ChildGrower(Actor akActor)    
	If (akActor as FPFP_GrowingChildScript)
		(akActor as FPFP_GrowingChildScript).GrowUp()
	endIf
EndFunction

Function DropAndGrowIntoChild(Actor akActor, Form BabyType)
	; Drop one baby
	akActor.DropObject(BabyType)
    Utility.Wait(0.5)
	; Find the dropped baby
	ObjectReference TheBaby = Game.FindClosestReferenceOfTypeFromRef(BabyType, akActor, 100)
      
	; Grow up the dropped baby
	(TheBaby as FPFP_BabyScript).GrowIntoChild()
EndFunction

Function Instant_Abort(actor akFemale)
    FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
	tmpData.GiveBirth(false)
EndFunction

Function Bodymorph_Reset(actor akFemale)
    FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
	tmpData.ResetBody()
EndFunction

Function Bodymorph_Reduce(actor akFemale)
    FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
	tmpData.ReduceBelly()
EndFunction

Function Bodymorph_Rebuild(actor akFemale, int Month)
    FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
	tmpData.UpdateBody(Month)
EndFunction

Function Instant_Birth(actor akFemale)
	bool Worked = false
	if akFemale.IsInFaction(FPFP_Preggo)
		FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
			Worked = true
		tmpData.GiveBirth(true)
	endIf
	 
	if Worked == true
		Debug.Notification("Debug: Giving Birth Now")
	else
		Debug.Notification("Debug: Failed- Failed to give birth")
	endIf	
EndFunction

Bool Function LoadFPE()
	If Game.IsPluginInstalled("FP_FamilyPlanningEnhanced.esp")
		FPE = FPFP_Player_Script.GetAPI()
		Return True
	Else
		Return false
	EndIf
EndFunction

Function Setup()
    OpenLog()
	If LoadFPE() == true
;		Debug.Trace("FPE Cum Inject: Family Planning Enhanced is loaded")
	Else
;		Debug.Trace("FPE Cum Inject: Family Planning Enhanced not found")
	EndIf
EndFunction


;
; This function takes into account the MCM options like chance of pregnancy, etc
Function TryToMakePregnant(actor akFemale, actor akMale)
	FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
	If (tmpData)
		If (tmpData.DeterminePotentialMan(akMale) != None) && (tmpData.IsValidWoman(akFemale) == true)
			tmpData.TrySpermFrom(akMale)
		EndIf
	EndIf
EndFunction	

;
; This function ignores most MCM settings and simply tries to make the female pregnant
Function MakePregnant(actor akFemale, actor akMale, bool advanced)
    FPFP_BasePregData tmpData = FPE.GetPregnancyInfo(akFemale)
    If (tmpData)
        If (tmpData.IsValidWoman(akFemale) == true)
            tmpData.Impregnate(akMale, advanced)
        EndIf
    EndIf
EndFunction

Function ObjectImpregnate(Actor akActor, bool advanced)
	bool Worked = false
	
	If akActor.HasKeyword(kw_noPreg) || akActor.IsInFaction(FPFP_Preggo)

	else
		If akActor.GetLeveledActorBase().GetSex() == 0
		
		else
			Actor tempActor = akActor.PlaceAtMe(ac_FatherCum, abInitiallyDisabled = true) as Actor

			tempActor.AddKeyword(fpfp_noDaddy)
			LogInfo("Equipped Cum Injector")
			if akActor.GetLeveledActorBase().GetSex() == 1
				MakePregnant(akActor, tempActor, advanced)
				Worked = true
			endif
		
			tempActor.delete()
		EndIf
	EndIf
	
	if Worked == true
		Debug.Notification("Debug: Success- Has been Impregnated")
	else
		Debug.Notification("Debug: Failed- Didn't get Impregnated")
	endIf
EndFunction

Function ObjectImpregnate_Other(Actor akActor, bool advanced)
	bool Worked = false
	
	If !PlayerRef.HasKeyword(kw_noPreg) || !PlayerRef.IsInFaction(FPFP_Preggo)
		if PlayerRef.GetLeveledActorBase().GetSex() == 1
			MakePregnant(PlayerRef, akActor, advanced)
			Worked = true
		endif
	EndIf
	
	if Worked == true
		Debug.Notification("Debug: Success- Has been Impregnated by NPC")
	else
		Debug.Notification("Debug: Failed- Didn't get Impregnated")
	endIf
EndFunction

Function Reset_Current_Births_Player()
	Debug.notification("Current Player Births is " + FPFP_Global_Current_Births_Player.getvalue())
	FPFP_Global_Current_Births_Player.setvalue(0)
	Debug.notification("Current Player Births is " + FPFP_Global_Current_Births_Player.getvalue())
EndFunction

Function Reset_Current_Births()
	Debug.notification("Current NPC Births is " + FPFP_Global_Current_Births.getvalue())
	FPFP_Global_Current_Births.setvalue(0)
	Debug.notification("Current NPC Births is " + FPFP_Global_Current_Births.getvalue())
EndFunction

Event OnInit()
	LogMessage("FPE_MCM_Debug OnInit")
	Setup()
EndEvent
;-- Debug/Logging Functions -------------------------

bool Function InDevelopmentMode() DebugOnly
    return False
EndFunction

Function OpenLog() DebugOnly
    Debug.OpenUserLog("Cum Injection")
EndFunction

Function DisplayDebugMessage(string asMessage) DebugOnly
    LogMessage(asMessage, 0)
    If (InDevelopmentMode())
        Debug.Notification(asMessage)
    EndIf
EndFunction

Function LogMessage(string asMessage, int aiSeverity = 0)
    If (InDevelopmentMode())
        Debug.Trace(self + ": " + asMessage, aiSeverity)
    EndIf
    Debug.TraceUser("Cum Injection", self + ": " + asMessage, aiSeverity);
EndFunction

Function LogInfo(string asMessage) DebugOnly
    LogMessage(asMessage, 0)
EndFunction

Function LogWarning(string asMessage) DebugOnly
    LogMessage(asMessage, 1)
EndFunction

Function LogError(string asMessage) DebugOnly
    LogMessage(asMessage, 2)
EndFunction