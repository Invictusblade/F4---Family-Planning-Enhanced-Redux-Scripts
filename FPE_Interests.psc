Scriptname FPE_Interests extends Quest

Actor Property PlayerREF Auto Const

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

Int Function CheckInterest_Sex(Actor akActor)

	if akActor.HasPerk(WLD_Perk_Sexually_Normal)
		return Utility.RandomInt(2,6)
	elseif akActor.HasPerk(WLD_Perk_Sexually_Sexually)
		return Utility.RandomInt(3,8)
	elseif akActor.HasPerk(WLD_Perk_Sexually_Active)
		return Utility.RandomInt(1,4)
	elseif akActor.HasPerk(WLD_Perk_Sexually_SexuallyShy)
		return Utility.RandomInt(0,2)
	endif
	
	return Utility.RandomInt(2,6)
EndFunction

Bool Function CheckInterest_Sex_Bool(Actor akActor)
	Int Sex_Interest = Utility.Randomint(1,10)

	if Sex_Interest < 8 && akActor.HasPerk(WLD_Perk_Sexually_Sexually)
		return true
	elseif Sex_Interest < 6 && akActor.HasPerk(WLD_Perk_Sexually_Active)
		return true
	elseif Sex_Interest < 4 && akActor.HasPerk(WLD_Perk_Sexually_Normal)
		return true
	elseif Sex_Interest == 1 && akActor.HasPerk(WLD_Perk_Sexually_SexuallyShy)
		return true
	endif

	return false
EndFunction


Int Function CheckInterest_Gift(Actor akActor)
		if akActor.HasPerk(WLD_Perk_Gifts_Frugal)
			return 0
		elseif akActor.HasPerk(WLD_Perk_Gifts_GoldDigger)
			return 2
		endif
	return 1
EndFunction

Int Function CheckInterest_Gift_Guns(Actor akActor)
		if akActor.HasPerk(WLD_Perk_Gifts_HatesGuns)
			return 0
		elseif akActor.HasPerk(WLD_Perk_Gifts_LoveGuns)
			return 2
		endif
	return 1
EndFunction

Int Function CheckInterest_Gift_Clothes(Actor akActor)
		if akActor.HasPerk(WLD_Perk_Gifts_HatesClothes)
			return 0
		elseif akActor.HasPerk(WLD_Perk_Gifts_LoveClothes)
			return 2
		endif
	return 1
EndFunction

Int Function CheckInterest_Drink(Actor akActor)
		if akActor.HasPerk(WLD_Perk_Gifts_HatesDrink)
			return 0
		elseif akActor.HasPerk(WLD_Perk_Gifts_LoveDrink)
			return 2
		endif
	return 1
EndFunction

Int Function CheckInterest_Food(Actor akActor)
		if akActor.HasPerk(WLD_Perk_Gifts_HatesFood)
			return 0
		elseif akActor.HasPerk(WLD_Perk_Gifts_LoveFood)
			return 2
		endif
	return 1
EndFunction

Int Function CheckInterest_Drugs(Actor akActor)
		if akActor.HasPerk(WLD_Perk_Drugs_Teetotaler)
			return 0
		elseif akActor.HasPerk(WLD_Perk_Drugs_Junkie)
			return 2
		endif

	return 1
EndFunction

Int Function CheckInterest_Gift_SexToys(Actor akActor)
		if akActor.HasPerk(WLD_Perk_Gifts_HatesSexToys)
			return 0
		elseif akActor.HasPerk(WLD_Perk_Gifts_LoveSexToys)
			return 2
		endif

	return 1
EndFunction