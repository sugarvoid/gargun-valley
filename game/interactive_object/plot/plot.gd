extends InteractiveObject
class_name Plot

var has_crop: bool
var texture: Texture
var crop: Crop

export var days_growing: int 

func _do_action() -> void:
	print("I have been alive %s days." % self.days_growing)
	


func _on_WaterHotBox_area_entered(area):
	if area.get_class() == "Bullet":
		if area.type == 0:
			print('getting water')
		elif area.type == 1:
			print('getting compost')
	else:
		return
