class_name GardenManager
extends Node2D

onready var p_Plot: PackedScene = preload("res://game/interactive_object/plot/Plot.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func place_plot(pos: Vector2) -> void:
	var new_plot = p_Plot.instance()
	new_plot.position = pos.snapped(Vector2(16, 16))
	add_child(new_plot)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
