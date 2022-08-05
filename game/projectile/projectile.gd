class_name Projectile
extends Area2D

enum BULLET_TYPE {
	WATER,
	COMPOST,
	DAMAGE,
}

onready var sprite: Sprite = get_node("Sprite")

var projectile_ID: int
var type: int = BULLET_TYPE.WATER
var speed: float = 100.0
var life: float = 0.5

func set_projectile_properties(id: String) -> void:
	print('setting color')
	match id:
		Global.WEAPON_IDS.water_gun:
			self.sprite.frame = 0
			self.projectile_ID = Global.PROJECTILE_IDS.water_bullet

func get_class() -> String:
	return "Projectile"

func _physics_process(delta):
	global_position += Vector2(cos(rotation), sin(rotation)) * speed * delta

func _ready() -> void:
	$LifeTimer.start(self.life)

func _on_LifeTimer_timeout() -> void:
	queue_free()

func made_contact(thing: Node2D) -> void:
	print(thing)
	thing.take_damage(2)
	self.queue_free()
