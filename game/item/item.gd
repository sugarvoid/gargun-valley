extends Area2D
class_name Item


var quality: int
var base_price: float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _determine_sell_price() -> int:
	return 4

