extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
onready var hud: CanvasLayer = get_node("HUD")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.connect("on_play_mode_toggle", self, "_toggle_mode_icon")

func _toggle_mode_icon():
	hud.toggle_icon()

# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
