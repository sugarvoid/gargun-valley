extends Area2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var speed: float = 2.0
var life: float = 0.5
var direction: Vector2 = Vector2()

func _physics_process(delta: float) -> void:
	if self.direction != Vector2.ZERO:
		var velocity = direction * speed
		self.global_position += velocity
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LifeTimer.start(self.life)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_LifeTimer_timeout() -> void:
	queue_free()
