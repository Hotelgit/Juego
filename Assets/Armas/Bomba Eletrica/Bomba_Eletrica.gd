extends Area2D


func _ready():
	pass 

func _on_Bomba_Eletrica_body_entered(body):
	if body.is_in_group("Enemigo"):
		queue_free()
