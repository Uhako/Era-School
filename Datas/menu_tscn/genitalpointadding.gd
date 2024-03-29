extends Control
@export_group("数据列表","base_")
@export var base_points:int
@export var base_datasize:int
@export var base_dataname:Array[String]
@export var base_datalevel:Array[int]
@export_group("UI面板","UI_")
@export var UI_format:String
@export var UI_points:Label
@export var UI_dataname:Array[Label]
@export var UI_datalevel:Array[Label]
@export var UI_plusbutton:Array[Button]
@export var UI_subbutton:Array[Button]
@onready var default_points:int = base_points
@onready var default_datalevel:Array[int] = base_datalevel.duplicate()
enum breast_size {貧乳,微乳,普乳,巨乳,爆乳}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	UIupdata()
	_on_gender_changed(1)

func UIupdata():
	UI_points.text = "残り：%s"%str(float(base_points)/10).pad_decimals(1)
	for i in range(base_datasize):
		UI_dataname[i].text = base_dataname[i]
		if i != 4 :
			UI_datalevel[i].text = UI_format%str(float(base_datalevel[i])/10).pad_decimals(1)
		else :
			UI_datalevel[i].text = str(base_datalevel[i])
			
func _on_plus_pressed(idx: int) -> void:
	if idx !=4:
		if base_points>0 :
			if Input.is_physical_key_pressed(KEY_SHIFT):
				base_datalevel[idx]+=base_points
				base_points-=base_points
			else :
				base_datalevel[idx]+=1
				base_points-=1
	else:
		if base_points/10>0 :
			if Input.is_physical_key_pressed(KEY_SHIFT):
				base_datalevel[idx]+=base_points/10
				base_points-=(base_points/10)*10
			else :
				base_datalevel[idx]+=1
				base_points-=10
	UIupdata()
	
func _on_sub_pressed(idx: int) -> void:
	if idx !=4:
		if base_datalevel[idx]>default_datalevel[idx]:
			if Input.is_physical_key_pressed(KEY_SHIFT):
				base_points+=base_datalevel[idx]-default_datalevel[idx]
				base_datalevel[idx]-=base_datalevel[idx]-default_datalevel[idx]
			else :
				base_datalevel[idx]-=1
				base_points+=1
	else:
		if base_datalevel[idx]>default_datalevel[idx]:
			if Input.is_physical_key_pressed(KEY_SHIFT):
				base_points+=(base_datalevel[idx]-default_datalevel[idx])*10
				base_datalevel[idx]-=base_datalevel[idx]-default_datalevel[idx]
			else :
				base_datalevel[idx]-=1
				base_points+=10
	UIupdata()

func _on_gender_changed(tab: int) -> void:
	if tab == 1 :
		for i in range(0,2):
			get_node("MarginContainer/VBoxContainer/data%s"%(i+1)).visible = true
		for i in range(2,5):
			get_node("MarginContainer/VBoxContainer/data%s"%(i+1)).visible = false
	elif tab == 0 : 
		for i in range(0,2):
			get_node("MarginContainer/VBoxContainer/data%s"%(i+1)).visible = false
		for i in range(2,5):
			get_node("MarginContainer/VBoxContainer/data%s"%(i+1)).visible = true
	base_points = default_points
	for i in range(base_datasize):
		base_datalevel[i] = default_datalevel[i]
	UIupdata()
