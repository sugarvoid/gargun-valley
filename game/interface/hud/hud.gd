class_name HUD
extends CanvasLayer


onready var time_label: Label = get_node("%TimeLabel")
onready var reload_icon: Sprite = get_node("ReloadIcon")



func toggle_icon() -> void:
	###playmode_icon_frame = 1 - playmode_icon_frame #Toggles between 1 and 0
	$PlayModeIcon.frame = 1 - $PlayModeIcon.frame

func update_time(time: String) -> void:
	time_label.text = time

func show_reload_icon() -> void:
	reload_icon.visible = true

func hide_reload_icon() -> void:
	reload_icon.visible = false
