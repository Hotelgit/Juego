extends KinematicBody2D


var Jugador
var puntos : Array = []
var punto_actual : int = 0
var move = Vector2.ZERO
var vel = 100
var vida : int = 100
var agro : bool = true


func _on_Conserje_Ciego_ready():
	var parent = get_parent()
	for child in parent.get_children():
		print("cuenta")
		if child is Node2D :
			if child.name.begins_with("Punto"):
				puntos.append(child)
				#child.set_as_toplevel(true)
				#remove_child(child)
				print("-----------1")
			
	if puntos.size() > 0:
		punto_actual = 1
		move = (puntos[punto_actual].global_position - global_position).normalized()



func _physics_process(delta):
	move = Vector2.ZERO
	# Calcula la distancia al waypoint actual
	var distancia = global_position.distance_to(puntos[punto_actual].global_position)
	print(distancia)
	if distancia < 50.0:  # el minimo al estar cerca
		# Cambia al siguiente waypoint
		print("cambio")
		punto_actual = ((punto_actual + 1) % puntos.size())
	
	if Jugador != null :
		agresivo()
		
	else : 
			pasivo(delta)
		
		

func pasivo(delta : float):
	
	if puntos.size() > 0:
			agro = false
			#print("modo 0.1")
				
			move = position.direction_to(puntos[punto_actual].position)
			move = ( move * vel )
			move_and_slide(move)
		
	#print("modo 0")

func agresivo():
	move = position.direction_to(Jugador.position)
	move = move.normalized()
	move = move_and_collide(move)
	agro = true
	print("modo 1")


func _process(delta):
	$ProgressBar.value = vida
	if vida <= 0 :
		queue_free()

func _on_Area2D_body_entered(body):
	if body != self:
		if body.name.begins_with("Jugador"):
			Jugador = body

func _on_Area2D_area_entered(area):
	Jugador = null

func _on_Area_donde_Resibe_Dao_area_entered(area):
	if area.is_in_group("Bala_Eletrica"):
		vida -= 30
	if area.is_in_group("Ataque_Mele"):
		vida -= 23



