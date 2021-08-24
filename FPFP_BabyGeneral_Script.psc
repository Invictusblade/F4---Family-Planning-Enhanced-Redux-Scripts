Scriptname FPFP_BabyGeneral_Script extends Quest Conditional

Function RetrievePlayerBabyHealth()

	FPFP_PlayerPregData playerInfo = FPFP_Player_Script.GetAPI().GetPlayerPregnancyInfo()

	BabyHealth = playerInfo.BabyHealth

	RadiationDamage = playerInfo.RadiationDamage

EndFunction

Float Property BabyHealth Auto Conditional

Float Property RadiationDamage Auto Conditional
