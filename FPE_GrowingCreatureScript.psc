ScriptName FPE_GrowingCreatureScript Extends FPFP_GrowingChildScript

Float Function GetGrowthMultiplier()
    FPFP_Player_Script FPE = FPFP_Player_Script.GetAPI()
    FPFP_BabyHandlerScript BabyHandler = FPFP_Player_Script.GetBabyAPI()
    
    float avGrowthTimeMult = GetValue(BabyHandler.FPFP_AV_GrowthTimeMult) ; grab the actor value set by the Baby object
    
    If GrowthTimeMultiplier > 0     ; if this script's float property is valid
        Return GrowthTimeMultiplier ; return it
    ElseIf avGrowthTimeMult > 0     ; if the actor value on the Baby object was valid
        Return avGrowthTimeMult     ; return it
    Else                            ; if all else fails
        Return 1.0                  ; return a normal number if it was not normal
    EndIf

EndFunction