extends Weapon


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bullet_speed = 100
	bullet_life = 3.5
	reload_time = 2.0
	magazine_size = 15
	bullets_left = 15


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
