extends Node2D


onready var p_Projectile: PackedScene = preload("res://game/projectile/Projectile.tscn")


onready var hud: CanvasLayer = get_node("HUD")
onready var clock: GameClock = get_node("GameClock")
onready var player: Player = get_node("Player")


func _ready() -> void:
	self.player.connect("on_play_mode_toggle", self, "_toggle_mode_icon")
	self.player.connect("on_weapon_fired_pressed", self, "_make_bullet")
	self.clock.connect("_on_the_minunte", self.hud, "update_time")

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _make_bullet(muzzle: Node2D) -> void:
	var bullet = p_Projectile.instance()
	bullet.transform = muzzle.transform
	bullet.position = muzzle.global_position
	$BulletContainer.add_child(bullet)
	var target = get_global_mouse_position()
	var dir_to_mouse = bullet.global_position.direction_to(target).normalized()
	bullet.direction = dir_to_mouse

func _toggle_mode_icon():
	hud.toggle_icon()

