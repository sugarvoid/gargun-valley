class_name HandGun
extends Weapon

func _init() -> void:
	self.weapon_ID = Global.WEAPON_IDS.hand_gun
	bullet_speed = 300
	bullet_life = 3.5
	reload_time = 2.5
	magazine_size = 9
	bullets_left = 9
	bullet_sprite_frame = 1
	bullet_ID = Global.PROJECTILE_IDS.player_damage_bullet


func primary_action() -> void:
	self.fire_bullet()
	
func secondary_action() -> void:
	pass
