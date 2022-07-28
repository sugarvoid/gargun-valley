extends CanvasLayer

var playmode_icon_frame = 0

@onready var time_label: Label = get_node("TimeLabel")

func toggle_icon() -> void:
	###playmode_icon_frame = 1 - playmode_icon_frame #Toggles between 1 and 0
	$PlayModeIcon.frame = 1 - $PlayModeIcon.frame
