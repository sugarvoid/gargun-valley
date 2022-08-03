class_name Crop
extends Item



var days_to_grow: int
var days_left: int
var health: int
var is_dead: bool 



func die() -> void:
	if self.health == 0:
		is_dead = true

var is_watered_for_day: bool
var _is_ready_for_harvest: bool 




func _check_if_ready() -> bool:
	return _is_ready_for_harvest


