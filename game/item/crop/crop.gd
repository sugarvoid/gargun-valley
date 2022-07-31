class_name Crop
extends Item



var days_to_grow: int
var days_left: int
var health: int
var is_dead: bool 



func die() -> void:
	if self.health == 0:
		is_dead = true
