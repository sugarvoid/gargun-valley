class_name GardenManager
extends Node2D

onready var p_Crop: PackedScene = preload("res://game/item/crop/Crop.tscn")
onready var p_Plot: PackedScene = preload("res://game/interactive_object/plot/Plot.tscn")

var used_plots: Array = [
	
]

func add_to_used_plots(pos: Vector2) -> void:
	self.used_plots.append(pos)

func place_plot(pos: Vector2) -> void:
	####print(pos)
	for plot_pos in used_plots:
		if plot_pos == pos:
			print('alrady a plot there')
			return
	#TODO: check to see if there is already a plot place
	var new_plot = p_Plot.instance()
	new_plot.position = pos
	$Plots.add_child(new_plot)
	add_to_used_plots(pos)

