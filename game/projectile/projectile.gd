class_name Projectile
extends Area2D

enum BULLET_TYPE {
	WATER,
	COMPOST,
	DAMAGE,
}

var type: int = BULLET_TYPE.WATER
var speed: float = 100.0
var life: float = 0.5

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
	self.queue_free()
