class_name Player
extends Actor


signal is_over_crop
signal on_play_mode_toggle
signal on_weapon_fired_pressed
signal started_reloading
signal done_reloading
signal request_plot_placement

onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
onready var reload_timer: Timer = get_node("ReloadTimer")
onready var player_light: Light2D = get_node("Light")
onready var hand = get_node("Hand")
onready var backpack = get_node("Backpack")

var mode: int
var click_recharge_time: float = 2.0
var can_click: bool = true
var friction = 0.1
var acceleration = 0.1
var mouse_location: Vector2
var current_weapon: Weapon
var is_reloading: bool 


func get_class() -> String: 
	return "Player"

func _ready() -> void:
	_update_current_weapon()
	self.animation_player.play("idle")
	$Backpack/WaterGun.connect("give_bullet", self, "_make_bullet")

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
	self.current_weapon.look_at(get_global_mouse_position())
	_move(_get_input())

func _move(direction: Vector2) -> void:
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * move_speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	velocity = move_and_slide(velocity)

func _update_current_weapon() -> void:
	print(hand.get_child(0))
	self.current_weapon = hand.get_child(0)

func _reload() -> void:
	if !is_reloading:
		emit_signal("started_reloading")
		reload_timer.start(current_weapon.reload_time)
		is_reloading = true

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("left_click"):
		print(current_weapon.weapon_ID)
		if current_weapon.weapon_ID == Global.WEAPON_IDS.shovel_gun:
			_create_plot()
		elif current_weapon.weapon_ID == Global.WEAPON_IDS.water_gun:
			_pull_trigger() #move later
		if can_click:
			can_click = false
			$ClickTimer.start(self.click_recharge_time)
	
	if event.is_action_released("right_click"):
		current_weapon.secondary_action()
		
	if event.is_action_released("switch_mode"):
		emit_signal("on_play_mode_toggle")
		Global.toggle_player_mode()
	
	if event.is_action_released("cycle_hand"):
		self._cycle_hand()
	
	if event.is_action_released("light_toggle"):
		player_light.enabled = 1 - int(player_light.enabled)

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

func _make_bullet():
	self.emit_signal("on_weapon_fired_pressed", current_weapon)

func _pull_trigger() -> void:
	if current_weapon.bullets_left > 0:
		# get current weapon info
		# Send signal to bullet factory
		current_weapon.fire()
	else:
		_reload()

func _on_ClickTimer_timeout() -> void:
	self.can_click = true
	$ClickTimer.start(self.click_recharge_time)

func _on_ReloadTimer_timeout() -> void:
	emit_signal("done_reloading")
	self.is_reloading = false
	current_weapon.bullets_left = current_weapon.magazine_size

func _create_plot() -> void:
	var pos: Vector2 = get_global_mouse_position()
	emit_signal("request_plot_placement", pos)

func _cycle_hand() -> void:
	if backpack.get_child_count() > 0:
		var current_hand = hand.get_child(0)
		hand.remove_child(hand.get_child(0))
		backpack.add_child(current_hand)
		var top_of_pack = backpack.get_child(0)
		backpack.remove_child(backpack.get_child(0))
		hand.add_child(top_of_pack)
		_update_current_weapon()
	else:
		return
	
