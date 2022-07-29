extends Area2D


var speed: float = 100.0
var life: float = 0.5


func _physics_process(delta):
	global_position += Vector2(cos(rotation), sin(rotation)) * speed * delta

func _ready() -> void:
	$LifeTimer.start(self.life)

func _on_LifeTimer_timeout() -> void:
	queue_free()
