extends CharacterBody2D
class_name Player


var move_speed: float = 100
var mode: int

var click_recharge_time: float = 2.0
var can_click: bool = true

@onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")

@export var friction = 0.1
@export var acceleration = 0.1

signal is_over_crop

func _ready() -> void:
	self.animation_player.play("idle")




func get_input():
	var input = Vector2()
	if Input.is_action_pressed('move_right'):

		input.x += 1
	if Input.is_action_pressed('move_left'):

		input.x -= 1
	if Input.is_action_pressed('move_down'):
		input.y += 1
	if Input.is_action_pressed('move_up'):
		input.y -= 1
	return input

func _physics_process(delta):
	var direction = get_input()
	$InteractionArea.monitoring = self.can_click
	$Sprite/Hand/Weapon.look_at(get_global_mouse_position())
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * move_speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
	move_and_slide()
	





#########///////////////
#func get_input() -> void:
#	var direction: Vector2 = Vector2(
#		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
#		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
#	)
#	if direction.length() > 1.0:
#		direction = direction.normalized()
#	move_and_slide()
#
#func _physics_process(delta) -> void:
#	_handle_mode()
#	$Sprite/Hand/Weapon.look_at(get_global_mouse_position())
#	get_input()
#	move_and_slide()
#######///////////////


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("click"):
		if can_click:
			$Sprite/Hand/Weapon/AnimationPlayer.play("swing")
			can_click = false
			$ClickTimer.start(self.click_recharge_time)
	if event.is_action_released("switch_mode"):
		Global.toggle_player_mode()

func _on_InteractionArea_area_entered(area: InteractiveObject) -> void:
	if area.is_in_group('InteractiveObject'):
		area.turn_on()

func _handle_mode() -> void:
	match Global.player_mode:
		Global.PLAY_MODES.FARMER:
			pass
			# change item in hand
		Global.PLAY_MODES.SHOOTER:
			pass
			# change item in hand


func _on_InteractionArea_area_exited(area: InteractiveObject) -> void:
	if area.is_in_group('InteractiveObject'):
		area.turn_off()











func _on_click_timer_timeout() -> void:
	self.can_click = true
	$ClickTimer.start(self.click_recharge_time)
