extends Area2D

func _on_Machete_body_entered(body):
	if body.is_in_group("Player"):
		GLOBAL.inventario.append("Machete")
		queue_free()
