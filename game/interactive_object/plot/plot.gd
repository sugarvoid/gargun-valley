extends InteractiveObject
class_name Plot

var has_crop: bool

var crop: Crop

export var days_growing: int 

func _do_action() -> void:
	print("I have been alive %s days." % self.days_growing)
	
