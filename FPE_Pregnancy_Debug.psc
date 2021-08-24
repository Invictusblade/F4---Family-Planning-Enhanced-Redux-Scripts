Scriptname FPE_Pregnancy_Debug extends activemagiceffect

Faction Property FPFP_Preggo Auto Const Mandatory
Perk Property WLD_Perk_Month_1 Auto
Perk Property WLD_Perk_Month_2 Auto
Perk Property WLD_Perk_Month_3 Auto
Perk Property WLD_Perk_Month_4 Auto
Perk Property WLD_Perk_Month_5 Auto
Perk Property WLD_Perk_Month_6 Auto
Perk Property WLD_Perk_Month_7 Auto
Perk Property WLD_Perk_Month_8 Auto
Perk Property WLD_Perk_Month_9 Auto
Perk Property WLD_Perk_Month_10 Auto
Perk Property WLD_Perk_Impregnated_Player Auto
Perk Property WLD_Perk_Impregnated Auto
SPELL Property AbPerk_Pregnant_month_01 Auto 
SPELL Property AbPerk_Pregnant_month_02 Auto 
SPELL Property AbPerk_Pregnant_month_03 Auto 
SPELL Property AbPerk_Pregnant_month_04 Auto 
SPELL Property AbPerk_Pregnant_month_05 Auto 
SPELL Property AbPerk_Pregnant_month_06 Auto 
SPELL Property AbPerk_Pregnant_month_07 Auto 
SPELL Property AbPerk_Pregnant_month_08 Auto 
SPELL Property AbPerk_Pregnant_month_09 Auto 
SPELL Property AbPerk_Pregnant_month_10 Auto 
SPELL Property AbPerk_Player Auto 
SPELL Property AbPerk_Random Auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
	If !akTarget.IsInFaction(FPFP_Preggo)
		akTarget.RemovePerk(WLD_Perk_Month_1)
		akTarget.RemovePerk(WLD_Perk_Month_2)
		akTarget.RemovePerk(WLD_Perk_Month_3)
		akTarget.RemovePerk(WLD_Perk_Month_4)
		akTarget.RemovePerk(WLD_Perk_Month_5)
		akTarget.RemovePerk(WLD_Perk_Month_6)
		akTarget.RemovePerk(WLD_Perk_Month_7)
		akTarget.RemovePerk(WLD_Perk_Month_8)
		akTarget.RemovePerk(WLD_Perk_Month_9)
		akTarget.RemovePerk(WLD_Perk_Month_10)
		akTarget.RemovePerk(WLD_Perk_Impregnated)
		akTarget.RemovePerk(WLD_Perk_Impregnated_Player)
		akTarget.RemoveSpell(AbPerk_Pregnant_month_01)
		akTarget.RemoveSpell(AbPerk_Pregnant_month_02)
		akTarget.RemoveSpell(AbPerk_Pregnant_month_03)
		akTarget.RemoveSpell(AbPerk_Pregnant_month_04)
		akTarget.RemoveSpell(AbPerk_Pregnant_month_05)
		akTarget.RemoveSpell(AbPerk_Pregnant_month_06)
		akTarget.RemoveSpell(AbPerk_Pregnant_month_07)
		akTarget.RemoveSpell(AbPerk_Pregnant_month_08)
		akTarget.RemoveSpell(AbPerk_Pregnant_month_09)
		akTarget.RemoveSpell(AbPerk_Pregnant_month_10)
		akTarget.RemoveSpell(AbPerk_Player)
		akTarget.RemoveSpell(AbPerk_Random)
	endif
EndEvent