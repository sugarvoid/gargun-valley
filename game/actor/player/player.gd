extends KinematicBody2D
class_name Player

var move_speed: int = 100
var velocity = Vector2.ZERO
var mode: int

var click_recharge_time: float = 2.0
var can_click: bool = true
var is_facing_right: bool = true

onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
export var friction = 0.1
export var acceleration = 0.1



signal is_over_crop
signal on_play_mode_toggle

func _ready() -> void:
	self.animation_player.play("idle")

func _get_input():
	var input: Vector2 = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	return input


func _physics_process(delta):
	_handle_mode()
	self.flip(get_local_mouse_position())
	$InteractionArea.monitoring = self.can_click
	$Sprite/Hand/Weapon.look_at(get_global_mouse_position())
	_move(_get_input())

func _move(direction: Vector2) -> void:
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * move_speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	velocity = move_and_slide(velocity)
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("click"):
		if can_click:
			can_click = false
			$ClickTimer.start(self.click_recharge_time)
	if event.is_action_released("switch_mode"):
		emit_signal("on_play_mode_toggle")
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

func flip(object_loc: Vector2):
	if object_loc.x < 0:
		if is_facing_right:
			scale.x = -1
			is_facing_right = false
	else: 
		if not is_facing_right:
			scale.x = 1
			is_facing_right = true

func _on_InteractionArea_area_exited(area: InteractiveObject) -> void:
	if area.is_in_group('InteractiveObject'):
		area.turn_off()


func _on_ClickTimer_timeout() -> void:
	self.can_click = true
	$ClickTimer.start(self.click_recharge_time)
