extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var time_label: Label = get_node("TimeLabel")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func toggle_icon() -> void:
	###playmode_icon_frame = 1 - playmode_icon_frame #Toggles between 1 and 0
	$PlayModeIcon.frame = 1 - $PlayModeIcon.frame
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update_time(time: String) -> void:
	$TimeLabel.text = time
