extends Weapon

func _init():
	self.weapon_ID = Global.WEAPON_IDS.water_gun

func _ready() -> void:
	bullet_speed = 80
	bullet_life = 2.5
	reload_time = 3.0
	magazine_size = 15
	bullets_left = 15

