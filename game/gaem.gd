extends Node2D

@onready var hud: CanvasLayer = get_node("HUD")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.on_play_mode_toggle.connect(_toggle_mode_icon)

func _toggle_mode_icon():
	hud.toggle_icon()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
