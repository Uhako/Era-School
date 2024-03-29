class_name Character
extends Node

var chara_idx:int
var chara_firstname:String
var chara_lastname:String
var gender:bool

var description:String = "ある人、セクスが好き"

var chara_state = {
	"maxstamina":1000.0,
	"stamina":1000.0,
	"maxsanity":1000.0,
	"sanity":1000.0,
	"maxlibido":1000.0,
	"libido":0.0,
	"maxerection":1000.0,
	"erection":0.0,#50*淫乱度 +动作基础值*级别*技能
	"maxarousal":1000.0,
	"arousal":0.0,#50*淫乱度 +动作基础值*级别*技能
	"maxorgasm":1000.0,
	"orgasm":0.0,#动作基础值*feel/10*
	"current_Cfeel":0.0,#动作基础值*级别*skill
	"current_Vfeel":0.0,#动作基础值*级别*skill*器官差距
	"current_Bfeel":0.0,#动作基础值*级别*skill
	"current_Afeel":0.0,#动作基础值*级别*skill
	"current_Ufeel":0.0,#动作基础值*级别*skill
	"current_Mfeel":0.0,#动作基础值*级别*skill
}
var chara_skill = {
	"talk":0,#增加好感度倍率
	"work":0,#增加工作薪酬倍率
	"sport":0,#降低体力消耗
	"serviceskill":0,#增加爱抚、奉仕系倍率
	"sexualskill":0,#增加插入式性交系倍率
	"sexknowledge":0,#增加道具行为倍率
}
var chara_sexuallevel = {
	"Csensitivity":0,
	"Vsensitivity":0,#男性无
	"Bsensitivity":0,
	"Asensitivity":0,
	"Usensitivity":0,
	"Msensitivity":0,
	"lewdness":0,
	"sadism":0,
	"masochism":0,
	"exhibitionism":0
}
var chara_experience = {
	"Cexp":0,
	"Vexp":0,#男性无
	"Bexp":0,
	"Aexp":0,
	"Uexp":0,
	"Mexp":0,
	"sexexp":0,
	"masoexp":0,
	"sadiexp":0,
	"exhibitexp":0,
	"talkexp":0,
	"workexp":0,
	"sportexp":0
}
var chara_sexrecord = {
	
}
var genital_size = {
	#前四项单位为mm
	"penis_length":100,#差值影響快感，可變動
	"penis_diameter":28,#差值影響快感，可變動
	"vaginal_depth":80,#差值影響快感，可變動
	"vaginal_diameter":18,#差值影響快感，可變動
	"breast_size":1#1为贫乳，2为微乳，3为普乳，4为巨乳，5为爆乳
}
var clothes = {
	"outer":0,
	"upper":0,
	"downpers":0,
	"inner_up":0,
	"inner_down":0,
	"legwear":0,
	"shoes":0,
	"handwear":0,
	"facewear":0,
	"headwear":0
}
var equipment = {
	"C":0,
	"V":0,
	"B":0,
	"A":0,
	"U":0,
	"M":0
}

func character_loadfromfile(path:String):
	pass
