class_name Weapon
extends Node2D

signal give_bullet


enum WEAPON_TYPE {
	WATER,
	DAMAGE
}


onready var muzzle = get_node("Muzzle")


var bullet_speed: float
var bullet_life: float
var reload_time: float
var magazine_size: int
var bullets_left: int


func _ready() -> void:
	pass
	#_set_stats()

func fire() -> void:
	print(self.bullets_left)
	if bullets_left > 0:
		emit_signal("give_bullet")
		self.bullets_left -= 1
		if self.bullets_left == 0:
			return
