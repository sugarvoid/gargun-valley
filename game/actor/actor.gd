extends KinematicBody2D
class_name Actor


var move_speed: float = 65
var velocity = Vector2.ZERO
var target: Actor
var is_facing_right: bool = true
var max_health: int
var health: int


func _ready() -> void:
	pass 

func handle_sprite_direction(object_loc: Vector2):
	if object_loc.x < 0:
		if is_facing_right:
			scale.x = -1
			is_facing_right = false
	else: 
		if not is_facing_right:
			scale.x = 1
			is_facing_right = true

func set_target(actor: Actor) -> void:
	self.target = actor

func heal(amount: int) -> void:
	self.health = clamp(self.health + amount, 0, self.max_health)
	

func take_damage(amount: int) -> void:
	self.health -= amount
	if self.health <= 0:
		self._die()

func _die() -> void:
	assert(false, "Replace method")
