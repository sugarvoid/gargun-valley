class_name GardenManager
extends Node2D

onready var p_Crop: PackedScene = preload("res://game/item/crop/Crop.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var used_plots: Array = [
	
]

func add_to_used_plots(pos: Vector2) -> void:
	self.used_plots.append(pos)

func place_plot(pos: Vector2) -> void:
	print(pos)
	#TODO: check to see if there is already a plot place
	var new_plot = p_Crop.instance()
	new_plot.position = pos
	add_child(new_plot)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
