class_name HandGun
extends Weapon

func _init() -> void:
	self.weapon_ID = Global.WEAPON_IDS.hand_gun


func _ready() -> void:
	bullet_speed = 100
	bullet_life = 3.5
	reload_time = 2.5
	magazine_size = 9
	bullets_left = 9

