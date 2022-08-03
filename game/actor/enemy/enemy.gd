extends Actor
class_name Enemy



func _process(_delta: float) -> void:
	pass
	#self.handle_sprite_direction(self.target)


func _die():
	self.queue_free()


func _on_PlayerDetectionZone_body_entered(body: Node) -> void:
	
	if body.get_class() != "Player":
		return
	print('got player')
	self.target = body


func _on_Hitbox_area_entered(area: Area2D) -> void:
	if area.get_class() == "Projectile":
		area.made_contact(self)
		print('im hit')
