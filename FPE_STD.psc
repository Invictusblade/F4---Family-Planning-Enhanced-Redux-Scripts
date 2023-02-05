Scriptname FPE_STD extends Quest

GlobalVariable property INVB_Global_Infect_Chance Auto Const Mandatory
GlobalVariable property INVB_Global_Infect_Chance_New Auto Const Mandatory
GlobalVariable property FPFP_Global_Infect_Message Auto Const Mandatory

Perk Property WLD_STD_RotGut Auto
Perk Property WLD_STD_NumbSkull Auto
Perk Property WLD_STD_13Digits Auto
Perk Property WLD_STD_SoftCock Auto
Perk Property WLD_STD_BlueEye Auto
Perk Property WLD_STD_DeathBreath Auto
Perk Property WLD_STD_Tripod Auto
Perk Property WLD_Perk_Breeder Auto

Race Property HumanRace Auto 
Actor Property PlayerREF Auto Const Mandatory
int random_LList

FPFP_BabyHandlerScript property FPFP_BabyHandler Auto Const Mandatory

Function Infect(Actor akActor, Actor akMan) 
	int random_LList_infect = Utility.RandomInt(1, 100)
	if (random_LList_infect <= INVB_Global_Infect_Chance.GetValue()) && akMan.GetLeveledActorBase().GetRace() == HumanRace
		int random_Gender = Utility.RandomInt(1, 4)
		if (random_Gender == 1) 
		
			if akActor.HasPerk(WLD_Perk_Breeder) ;Breeder
				akMan.addperk(WLD_Perk_Breeder)
			elseif akActor.HasPerk(WLD_STD_SoftCock) ;Strength
				akMan.addperk(WLD_STD_SoftCock)
			elseif akActor.HasPerk(WLD_STD_BlueEye) ;Perception
				akMan.addperk(WLD_STD_BlueEye)
			elseif akActor.HasPerk(WLD_STD_RotGut) ;Endurance
				akMan.addperk(WLD_STD_RotGut)
			elseif akActor.HasPerk(WLD_STD_DeathBreath) ;Charisma
				akMan.addperk(WLD_STD_DeathBreath)
			elseif akActor.HasPerk(WLD_STD_NumbSkull) ;Intelligence
				akMan.addperk(WLD_STD_NumbSkull)
			elseif akActor.HasPerk(WLD_STD_Tripod) ;Agility
				akMan.addperk(WLD_STD_Tripod)
			elseif akActor.HasPerk(WLD_STD_13Digits) ;Luck
				akMan.addperk(WLD_STD_13Digits)
			else 
				int random_LList_infect_New = Utility.RandomInt(1, 100)
				if (random_LList_infect_New <= INVB_Global_Infect_Chance_New.GetValue())	
					int random_Infect = Utility.RandomInt(1, 12)
					if (random_Infect == 1)
						akMan.addperk(WLD_STD_RotGut)
					elseif (random_Infect == 2)
						akMan.addperk(WLD_STD_NumbSkull)
					elseif (random_Infect == 3)
						akMan.addperk(WLD_STD_13Digits)
					elseif (random_Infect == 4)
						akMan.addperk(WLD_STD_SoftCock)
					elseif (random_Infect == 5)
						akMan.addperk(WLD_STD_BlueEye)
					elseif (random_Infect == 6)
						akMan.addperk(WLD_STD_DeathBreath)
					elseif (random_Infect == 7)
						akMan.addperk(WLD_STD_Tripod)
					elseif (random_Infect > 7)
					endif
				endif	
			endif
			if FPFP_Global_Infect_Message.GetValue() >= 1
				Debug.notification(akActor.GetLeveledActorBase().GetName() +" has been infected with something")
			endif
		else	
			if akMan.HasPerk(WLD_Perk_Breeder) ;Breeder
				akActor.addperk(WLD_Perk_Breeder)
			elseif akMan.HasPerk(WLD_STD_SoftCock) ;Strength
				akActor.addperk(WLD_STD_SoftCock)
			elseif akMan.HasPerk(WLD_STD_BlueEye) ;Perception
				akActor.addperk(WLD_STD_BlueEye)
			elseif akMan.HasPerk(WLD_STD_RotGut) ;Endurence
				akActor.addperk(WLD_STD_RotGut)
			elseif akMan.HasPerk(WLD_STD_DeathBreath) ;Charisma
				akActor.addperk(WLD_STD_DeathBreath)
			elseif akMan.HasPerk(WLD_STD_NumbSkull) ;Intellenge
				akActor.addperk(WLD_STD_NumbSkull)
			elseif akMan.HasPerk(WLD_STD_Tripod) ;Agility
				akActor.addperk(WLD_STD_Tripod)
			elseif akMan.HasPerk(WLD_STD_13Digits) ;Luck
				akActor.addperk(WLD_STD_13Digits)
			else
				int random_LList_infect_New = Utility.RandomInt(1, 100)
				if (random_LList_infect_New <= INVB_Global_Infect_Chance_New.GetValue())	
					int random_Infect = Utility.RandomInt(1, 12)
					if (random_Infect == 1)
						akActor.addperk(WLD_STD_RotGut)
					elseif (random_Infect == 2)
						akActor.addperk(WLD_STD_NumbSkull)
					elseif (random_Infect == 3)
						akActor.addperk(WLD_STD_13Digits)
					elseif (random_Infect == 4)
						akActor.addperk(WLD_STD_SoftCock)
					elseif (random_Infect == 5)
						akActor.addperk(WLD_STD_BlueEye)
					elseif (random_Infect == 6)
						akActor.addperk(WLD_STD_DeathBreath)
					elseif (random_Infect == 7)
						akActor.addperk(WLD_STD_Tripod)
					elseif (random_Infect > 7)
					endif
				endif	
			endif
			if FPFP_Global_Infect_Message.GetValue() >= 1
				Debug.notification(akActor.GetLeveledActorBase().GetName() +" has been infected with something")
			endif	
		endif
		
	elseif (random_LList_infect <= INVB_Global_Infect_Chance.GetValue()) && !akMan.GetLeveledActorBase().GetRace() == HumanRace
		perk STD = FPFP_BabyHandler.WhatsmyDisease(akMan.GetLeveledActorBase().GetRace())
		akActor.addperk(STD)
		akMan.addperk(STD)
		if FPFP_Global_Infect_Message.GetValue() >= 1
			Debug.notification(akActor.GetLeveledActorBase().GetName() +" has been infected with something")
		endif	
	endif

EndFunction

Function Infect_NPC(Actor akActor, Actor akMan) 
	int random_LList_infect = Utility.RandomInt(1, 100)
	if (random_LList_infect <= INVB_Global_Infect_Chance.GetValue()) && akMan.GetLeveledActorBase().GetRace() == HumanRace
		int random_Gender = Utility.RandomInt(1, 4)
		if (random_Gender == 1) 
		
			if akActor.HasPerk(WLD_Perk_Breeder) ;Breeder
				akMan.addperk(WLD_Perk_Breeder)
			elseif akActor.HasPerk(WLD_STD_SoftCock) ;Strength
				akMan.addperk(WLD_STD_SoftCock)
			elseif akActor.HasPerk(WLD_STD_BlueEye) ;Perception
				akMan.addperk(WLD_STD_BlueEye)
			elseif akActor.HasPerk(WLD_STD_RotGut) ;Endurance
				akMan.addperk(WLD_STD_RotGut)
			elseif akActor.HasPerk(WLD_STD_DeathBreath) ;Charisma
				akMan.addperk(WLD_STD_DeathBreath)
			elseif akActor.HasPerk(WLD_STD_NumbSkull) ;Intelligence
				akMan.addperk(WLD_STD_NumbSkull)
			elseif akActor.HasPerk(WLD_STD_Tripod) ;Agility
				akMan.addperk(WLD_STD_Tripod)
			elseif akActor.HasPerk(WLD_STD_13Digits) ;Luck
				akMan.addperk(WLD_STD_13Digits)
			else 
				int random_LList_infect_New = Utility.RandomInt(1, 100)
				if (random_LList_infect_New <= INVB_Global_Infect_Chance_New.GetValue())	
					int random_Infect = Utility.RandomInt(1, 12)
					if (random_Infect == 1)
						akMan.addperk(WLD_STD_RotGut)
					elseif (random_Infect == 2)
						akMan.addperk(WLD_STD_NumbSkull)
					elseif (random_Infect == 3)
						akMan.addperk(WLD_STD_13Digits)
					elseif (random_Infect == 4)
						akMan.addperk(WLD_STD_SoftCock)
					elseif (random_Infect == 5)
						akMan.addperk(WLD_STD_BlueEye)
					elseif (random_Infect == 6)
						akMan.addperk(WLD_STD_DeathBreath)
					elseif (random_Infect == 7)
						akMan.addperk(WLD_STD_Tripod)
					elseif (random_Infect > 7)
					endif
				endif	
			endif
			if FPFP_Global_Infect_Message.GetValue() == 2
				Debug.notification(akActor.GetLeveledActorBase().GetName() +" has been infected with something")
			endif
		else	
			if akMan.HasPerk(WLD_Perk_Breeder) ;Breeder
				akActor.addperk(WLD_Perk_Breeder)
			elseif akMan.HasPerk(WLD_STD_SoftCock) ;Strength
				akActor.addperk(WLD_STD_SoftCock)
			elseif akMan.HasPerk(WLD_STD_BlueEye) ;Perception
				akActor.addperk(WLD_STD_BlueEye)
			elseif akMan.HasPerk(WLD_STD_RotGut) ;Endurence
				akActor.addperk(WLD_STD_RotGut)
			elseif akMan.HasPerk(WLD_STD_DeathBreath) ;Charisma
				akActor.addperk(WLD_STD_DeathBreath)
			elseif akMan.HasPerk(WLD_STD_NumbSkull) ;Intellenge
				akActor.addperk(WLD_STD_NumbSkull)
			elseif akMan.HasPerk(WLD_STD_Tripod) ;Agility
				akActor.addperk(WLD_STD_Tripod)
			elseif akMan.HasPerk(WLD_STD_13Digits) ;Luck
				akActor.addperk(WLD_STD_13Digits)
			else
				int random_LList_infect_New = Utility.RandomInt(1, 100)
				if (random_LList_infect_New <= INVB_Global_Infect_Chance_New.GetValue())	
					int random_Infect = Utility.RandomInt(1, 12)
					if (random_Infect == 1)
						akActor.addperk(WLD_STD_RotGut)
					elseif (random_Infect == 2)
						akActor.addperk(WLD_STD_NumbSkull)
					elseif (random_Infect == 3)
						akActor.addperk(WLD_STD_13Digits)
					elseif (random_Infect == 4)
						akActor.addperk(WLD_STD_SoftCock)
					elseif (random_Infect == 5)
						akActor.addperk(WLD_STD_BlueEye)
					elseif (random_Infect == 6)
						akActor.addperk(WLD_STD_DeathBreath)
					elseif (random_Infect == 7)
						akActor.addperk(WLD_STD_Tripod)
					elseif (random_Infect > 7)
					endif
				endif	
			endif
			if FPFP_Global_Infect_Message.GetValue() == 2
				Debug.notification(akActor.GetLeveledActorBase().GetName() +" has been infected with something")
			endif
		endif
		
	elseif (random_LList_infect <= INVB_Global_Infect_Chance.GetValue()) && !akMan.GetLeveledActorBase().GetRace() == HumanRace
		perk STD = FPFP_BabyHandler.WhatsmyDisease(akMan.GetLeveledActorBase().GetRace())
		akActor.addperk(STD)
		if FPFP_Global_Infect_Message.GetValue() == 2
			Debug.notification(akActor.GetLeveledActorBase().GetName() +" has been infected with something")
		endif
	endif

EndFunction



Function Infect_Init(Actor akActor) 
	if akActor.hasperk(WLD_STD_RotGut) || akActor.hasperk(WLD_STD_NumbSkull) || akActor.hasperk(WLD_STD_13Digits) || akActor.hasperk(WLD_STD_SoftCock) || akActor.hasperk(WLD_STD_BlueEye) || akActor.hasperk(WLD_STD_DeathBreath) || akActor.hasperk(WLD_STD_Tripod)
		int random_LList_infect = Utility.RandomInt(1, 100)
		if (random_LList_infect <= INVB_Global_Infect_Chance.GetValue())
			
			int random_Infect = Utility.RandomInt(1, 14)
			if (random_Infect == 1)
				akActor.addperk(WLD_STD_RotGut)
			elseif (random_Infect == 2)
				akActor.addperk(WLD_STD_NumbSkull)
			elseif (random_Infect == 3)
				akActor.addperk(WLD_STD_13Digits)
			elseif (random_Infect == 4)
				akActor.addperk(WLD_STD_SoftCock)
			elseif (random_Infect == 5)
				akActor.addperk(WLD_STD_BlueEye)
			elseif (random_Infect == 6)
				akActor.addperk(WLD_STD_DeathBreath)
			elseif (random_Infect == 7)
				akActor.addperk(WLD_STD_Tripod)
			endif
		endif
	endif
EndFunction