extends Area2D
class_name InteractiveObject


var is_clickable: bool
# TODO: replace varible with can_interact

func _ready() -> void:
	turn_off()

# Make crop clickable
func turn_on() -> void:
	self.is_clickable = true

# Make crop unclickable
func turn_off() -> void:
	self.is_clickable = false

func _do_action() -> void:
	assert(false, 'override tis fuction')

func _on_GameObject_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
		if event.is_action_released("left_click"):
			if self.is_clickable:
				_do_action()
			else:
				print('not in zone')
