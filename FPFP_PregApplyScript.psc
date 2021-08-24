Scriptname FPFP_PregApplyScript extends activemagiceffect
Spell Property FPFP_BasePregSpell Auto Const Mandatory
Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddSpell(FPFP_BasePregSpell)
EndEvent