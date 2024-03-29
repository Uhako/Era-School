extends Control
@export_group("数据列表","base_")
@export var base_points:int
@export var base_datasize:int
@export var base_dataname:Array[String]
@export var base_datalevel:Array[int]
@export var base_maxlevel:int = 10
@export_group("UI面板","UI_")
@export var UI_format:String
@export var UI_points:Label
@export var UI_dataname:Array[Label]
@export var UI_datalevel:Array[Label]
@export var UI_plusbutton:Array[Button]
@export var UI_subbutton:Array[Button]
@onready var default_points:int = base_points
@onready var default_datalevel:Array[int] = base_datalevel.duplicate()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	UIupdata()
	_on_gender_changed(1)
	pass # Replace with function body.

func UIupdata():
	for i in range(base_datasize):
		UI_dataname[i].text = base_dataname[i]
		UI_points.text = "残り：%s"%base_points
		UI_datalevel[i].text = UI_format%base_datalevel[i]
		
func _on_plus_pressed(idx: int) -> void:
	if base_points>0:
		if Input.is_physical_key_pressed(KEY_SHIFT):
			base_datalevel[idx]+=base_points
			base_points-=base_points
		else :
			base_datalevel[idx]+=1
			base_points-=1
	UIupdata()

func _on_sub_pressed(idx: int) -> void:
	if base_datalevel[idx]>0:
		if Input.is_physical_key_pressed(KEY_SHIFT):
			base_points+=base_datalevel[idx]
			base_datalevel[idx]-=base_datalevel[idx]
		else :
			base_datalevel[idx]-=1
			base_points+=1
	UIupdata()

func _on_gender_changed(tab: int) -> void:
	if tab == 1 :
		for i in range(base_datasize):
			if base_dataname[i].contains("C"):
				base_dataname[i] = base_dataname[i].replace("C","P")
			elif base_dataname[i].contains("V"):
				get_node("MarginContainer/VBoxContainer/data%s"%(i+1)).visible = false
				base_points += base_datalevel[i]-default_datalevel[i]
				base_datalevel[i] = default_datalevel[i]
	elif tab == 0 : 
		for i in range(base_datasize):
			if base_dataname[i].contains("P"):
				base_dataname[i] = base_dataname[i].replace("P","C")
			elif base_dataname[i].contains("V"):
				get_node("MarginContainer/VBoxContainer/data%s"%(i+1)).visible = true
	UIupdata()
