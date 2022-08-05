class_name ShovelGun
extends Weapon

func _init():
	self.weapon_ID = Global.WEAPON_IDS.shovel_gun

func primary_action() -> void:
	pass

func secondary_action() -> void:
	pass
	

func play_dig_anmi() -> void:
	$AnimationPlayer.play("dig")
