extends Control


func _ready():
	pass

func _on_Jugar_pressed():
	get_tree().change_scene("res://Pruebas/Mundo Prueba/Sala_Pruebas.tscn")

func _on_Opciones_pressed():
	pass # Replace with function body.

func _on_Salir_pressed():
	get_tree().quit()
