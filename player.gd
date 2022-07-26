extends KinematicBody2D

var speed: int = 100
var velocity = Vector2.ZERO

func get_input():
	var direction: Vector2 = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	if direction.length() > 1.0:
		direction = direction.normalized()
	move_and_slide(speed * direction)

func _physics_process(delta):
	$Sprite/Hand/Weapon.look_at(get_global_mouse_position())
	get_input()
	velocity = move_and_slide(velocity)
	
func _unhandled_input(event):
	if event.is_action_released("click"):
		$Sprite/Hand/Weapon/AnimationPlayer.play("swing")
