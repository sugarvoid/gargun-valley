extends Weapon

func _init():
	self.weapon_ID = Global.WEAPON_IDS.water_gun

func _ready() -> void:
	bullet_speed = 100
	bullet_life = 3.5
	reload_time = 2.0
	magazine_size = 15
	bullets_left = 15

