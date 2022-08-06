class_name Weapon
extends Node2D

signal can_shoot_bullet

enum BULLET_TYPE {
	WATER,
	COMPOST,
	DAMAGE,
}

enum WEAPON_TYPE {
	FARMING,
	COMBACT,
}

enum WEAPON_SUBTYPE {
	PROJECTILE,
	MELEE,
}

onready var muzzle = get_node("Muzzle")

var weapon_ID: String
var weapon_type: int
var weapon_subtype: int
var bullet_speed: float
var bullet_life: float
var bullet_sprite_frame: int
var reload_time: float
var magazine_size: int
var bullets_left: int
var bullet_ID: String

func _ready() -> void:
	pass
	#_set_stats()

func primary_action() -> void:
	pass
	
func secondary_action() -> void:
	pass

func fire_bullet() -> void:
	if bullets_left > 0:
		emit_signal("can_shoot_bullet")
		print('emitted can shoot signal')
		self.bullets_left -= 1
		if self.bullets_left == 0:
			return



