Scriptname FPE_Surrogate extends Quest

Perk Property WLD_Perk_Surrogate_1 Auto
Perk Property WLD_Perk_Surrogate_2 Auto
Perk Property WLD_Perk_Surrogate_3 Auto
Keyword Property kw_Surrogate01 Auto
Keyword Property kw_Surrogate02 Auto
Keyword Property kw_Surrogate03 Auto
MiscObject property Caps001 = None auto
GlobalVariable property FPFP_Global_Receiver_Surrogate Auto Const Mandatory
FPFP_BabyHandlerScript property FPFP_BabyHandler Auto Const Mandatory

Function Surrogate(bool akSurrogate, Actor Ourself, Race FatherRace, int NumChildren) 

	if akSurrogate == true
		if !Ourself.HasPerk(WLD_Perk_Surrogate_3)
			if !Ourself.HasKeyword(kw_Surrogate01) && !Ourself.HasKeyword(kw_Surrogate02) && !Ourself.HasKeyword(kw_Surrogate03)
				Ourself.addKeyword(kw_Surrogate01)
			elseif Ourself.HasKeyword(kw_Surrogate01)
				Ourself.removeKeyword(kw_Surrogate01)
				Ourself.addKeyword(kw_Surrogate02)
			elseif Ourself.HasKeyword(kw_Surrogate02)
				Ourself.removeKeyword(kw_Surrogate02)
				Ourself.addKeyword(kw_Surrogate03)
			elseif Ourself.HasKeyword(kw_Surrogate03) && Ourself.HasPerk(WLD_Perk_Surrogate_1) 
				Ourself.removeKeyword(kw_Surrogate02)
				Ourself.removePerk(WLD_Perk_Surrogate_1)
				Ourself.AddPerk(WLD_Perk_Surrogate_2)
			elseif Ourself.HasKeyword(kw_Surrogate03) && Ourself.HasPerk(WLD_Perk_Surrogate_2) 
				Ourself.removeKeyword(kw_Surrogate02)
				Ourself.removePerk(WLD_Perk_Surrogate_2)
				Ourself.AddPerk(WLD_Perk_Surrogate_3)
			endif	
		endif
	endif
	
		int levelofPayment
		if Ourself.HasPerk(WLD_Perk_Surrogate_1)
			levelofPayment = 1
		elseif Ourself.HasPerk(WLD_Perk_Surrogate_2)
			levelofPayment = 2
		elseif Ourself.HasPerk(WLD_Perk_Surrogate_3)
			levelofPayment = 3
		else
			levelofPayment = 1		
		endif
		
		int Surrogate_Total = ((FPFP_BabyHandler.HowMuch(FatherRace) * NumChildren) * levelofPayment)
		
		If FPFP_Global_Receiver_Surrogate.GetValue() == 0.0 ;Player
			Game.GetPlayer().additem(Caps001, Surrogate_Total, true)
		elseIf FPFP_Global_Receiver_Surrogate.GetValue() == 1.0 ;Workshop
			Location workshopLocation = FPFP_BabyHandler.WorkshopParent.AddActorToWorkshopPlayerChoice(Ourself) ; Assign NPC to workshop
			WorkshopScript newWorkshop = FPFP_BabyHandler.WorkshopParent.GetWorkshopFromLocation(workshopLocation) ; Get the workshop
			
			If newWorkshop
				newWorkshop.additem(Caps001, Surrogate_Total, true)
			else
				Game.GetPlayer().additem(Caps001, Surrogate_Total, true)
			endif
		endif

EndFunction

bool Function CheckPerk(Actor Ourself)

	if Ourself.HasPerk(WLD_Perk_Surrogate_1) || Ourself.HasPerk(WLD_Perk_Surrogate_2) || Ourself.HasPerk(WLD_Perk_Surrogate_3)
		return true
	else
		return false
	endif
	
EndFunction