extends Actor
class_name Player

signal is_over_crop
signal on_play_mode_toggle
signal on_weapon_fired_pressed

onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")

var mode: int
var click_recharge_time: float = 2.0
var can_click: bool = true
var friction = 0.1
var acceleration = 0.1
var mouse_location: Vector2


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
	self.handle_sprite_direction(get_local_mouse_position())
	$InteractionArea.monitoring = self.can_click
	$Hand/Weapon.look_at(get_global_mouse_position())
	_move(_get_input())

func _move(direction: Vector2) -> void:
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * move_speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	velocity = move_and_slide(velocity)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("click"):
		shoot() #move later
		if can_click:
			can_click = false
			$ClickTimer.start(self.click_recharge_time)
	
	if event.is_action_released("switch_mode"):
		emit_signal("on_play_mode_toggle")
		Global.toggle_player_mode()
	
	if event.is_action_released("light_toggle"):
		$Light.enabled = 1 - int($Light.enabled)

func _on_InteractionArea_area_entered(area: InteractiveObject) -> void:
	if area != InteractiveObject: 
		return
	if area.is_in_group('InteractiveObject'):
		area.turn_on()
	else: pass

func _handle_mode() -> void:
	match Global.player_mode:
		Global.PLAY_MODES.FARMER:
			pass
			# change item in hand
		Global.PLAY_MODES.SHOOTER:
			pass
			# change item in hand

func _on_InteractionArea_area_exited(area: InteractiveObject) -> void:
	if area != InteractiveObject: 
		return
	if area.is_in_group('InteractiveObject'):
		area.turn_off()

func shoot() -> void:
	# get current weapon info
	# Send signal to bullet factory
	print('pew pew')
	self.emit_signal("on_weapon_fired_pressed", $Hand/Weapon/Muzzle)

func _on_ClickTimer_timeout() -> void:
	self.can_click = true
	$ClickTimer.start(self.click_recharge_time)
