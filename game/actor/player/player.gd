extends KinematicBody2D
class_name Player

var speed: int = 100
var velocity = Vector2.ZERO
var mode: int



signal is_over_crop

func get_input() -> void:
	var direction: Vector2 = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	if direction.length() > 1.0:
		direction = direction.normalized()
	move_and_slide(speed * direction)

func _physics_process(delta) -> void:
	_handle_mode()
	$Sprite/Hand/Weapon.look_at(get_global_mouse_position())
	get_input()
	velocity = move_and_slide(velocity)
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("click"):
		$Sprite/Hand/Weapon/AnimationPlayer.play("swing")
	if event.is_action_released("switch_mode"):
		Global.toggle_player_mode()

func _on_InteractionArea_area_entered(area: Crop) -> void:
	if area.is_in_group('Crop'):
		area.turn_on()

func _handle_mode() -> void:
	match Global.player_mode:
		Global.PLAY_MODES.FARMER:
			pass
		Global.PLAY_MODES.SHOOTER:
			pass


func _on_InteractionArea_area_exited(area: Crop) -> void:
	if area.is_in_group('Crop'):
		area.turn_off()
