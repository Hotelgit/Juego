extends CanvasLayer


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		$AnimationPlayer.play("Cerrar_Puertas")
		visible = true
		get_tree().paused = true

func _on_Lobby_pressed():
	get_tree().change_scene("res://Pruebas/Mundo Prueba/Sala_Pruebas.tscn")
	get_tree().paused = false
	visible = false

func _on_Piso_1_pressed():
	get_tree().change_scene("res://Assets/Mundo/Primer_Piso.tscn")
	get_tree().paused = false
	visible = false
