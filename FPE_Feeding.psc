Scriptname FPE_Feeding extends activemagiceffect

potion Property Potion_Feed Auto Const Mandatory
Armor Property pArmor_Baby_Blood Auto Const Mandatory
Armor Property pArmor_Baby_Abandon Auto Const Mandatory
LeveledItem Property pArmor_Baby Auto Const Mandatory

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	If (Game.GetPlayer().GetItemCount(pArmor_Baby_Blood) >= 1)
		akTarget.removeitem(pArmor_Baby_Blood, 1)
		akTarget.additem(pArmor_Baby)
	elseIf (Game.GetPlayer().GetItemCount(pArmor_Baby_Abandon) >= 1)
		akTarget.removeitem(pArmor_Baby_Abandon, 1)
		akTarget.additem(pArmor_Baby)
	else
		akTarget.additem(Potion_Feed)
	endIf
	
EndEvent