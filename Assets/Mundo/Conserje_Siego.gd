extends KinematicBody2D


var Jugador
var move = Vector2.ZERO
var vel = 100
var vida : int = 100

func _physics_process(delta):
	move = Vector2.ZERO
	
	if Jugador != null:
		move = position.direction_to(Jugador.position)
	else:
		move = Vector2.ZERO
		
	move = move.normalized()
	move = move_and_collide(move)
		

func _process(delta):
	$ProgressBar.value = vida
	if vida <= 0 :
		queue_free()

func _on_Area2D_body_entered(body):
	if body != self:
		Jugador = body

func _on_Area2D_area_entered(area):
	Jugador = null

func _on_Area_donde_Resibe_Dao_area_entered(area):
	if area.is_in_group("Bala_Eletrica"):
		vida -= 30
	if area.is_in_group("Ataque_Mele"):
		vida -= 23
