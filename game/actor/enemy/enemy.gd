extends Actor
class_name Enemy


func _process(_delta: float) -> void:
	pass
	#self.handle_sprite_direction(self.target)


func _die():
	self.queue_free()
