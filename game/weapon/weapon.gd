extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
onready var p_Projectile: PackedScene = preload("res://game/projectile/Projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func spawn_bullet() -> void:
	print("Pew!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
