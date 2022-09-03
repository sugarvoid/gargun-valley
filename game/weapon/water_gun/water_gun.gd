class_name WaterGun
extends Weapon

func _init():
	self.weapon_ID = Global.WEAPON_IDS.water_gun
	bullet_speed = 200
	bullet_life = 2.5
	reload_time = 3.0
	magazine_size = 15
	bullets_left = 15
	bullet_sprite_frame = 0
	bullet_ID = Global.PROJECTILE_IDS.water_bullet

func primary_action() -> void:
	self.fire_bullet()
	
func secondary_action() -> void:
	pass
