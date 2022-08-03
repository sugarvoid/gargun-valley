class_name Weapon
extends Node2D

signal give_bullet

enum WEAPON_TYPE {
	WATER,
	DAMAGE
}


onready var ReloadTimer = get_node("ReloadTimer")
onready var muzzle = get_node("Muzzle")


var bullet_speed: float
var bullet_life: float
var reload_time: float
var magazine_size: int
var bullets_left: int

var is_reloading: bool 

func _ready() -> void:
	pass
	#_set_stats()

func reload() -> void:
	ReloadTimer.start(reload_time)
	is_reloading == true

func fire() -> void:
	if !is_reloading:
		print(self.bullets_left)
		if bullets_left > 0:
			emit_signal("give_bullet")
			self.bullets_left -= 1
			if self.bullets_left == 0:
				reload()

func can_shoot() -> bool:
	return !is_reloading


func _on_ReloadTimer_timeout() -> void:
	is_reloading = false
	bullets_left = magazine_size
