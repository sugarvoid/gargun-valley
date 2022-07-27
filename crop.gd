extends Area2D
class_name Crop


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
export var days_growing: int 
var is_clickable: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	turn_off()

# Make crop clickable
func turn_on() -> void:
	print('on')
	self.is_clickable = true

# Make crop unclickable
func turn_off() -> void:
	print('off')
	self.is_clickable = false


func _on_Crop_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_released("click"):
		if self.is_clickable:
			print("I have been alive %s days." % self.days_growing)
		else:
			print('im off')
