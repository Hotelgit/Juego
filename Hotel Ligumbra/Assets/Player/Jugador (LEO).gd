extends KinematicBody2D

export (PackedScene) var Bomba

onready var leo_concepto = $leo_sprites

var inmunity=false

var velocidad = Vector2(0,0)
export (int) var speed = 120
var estamina

var vida : int = 100
var energia : int = 100

var objeto_seleccionado = GLOBAL.objeto_seleccionado

func _process(_delta):
	Damage()
	if objeto_seleccionado == "Bomba_Eletrica":
		Poner_Bomba()
	if objeto_seleccionado == "Machete":
		activar_area_de_ataque_mele()
	
	activar_area_de_dialogo()
	velocidad = $UI/Joystick.get_velo()
	move_and_slide(velocidad*speed , Vector2.UP)

func get_input():
	velocidad = Vector2()
	
	if Input.is_action_pressed("Correr"):
		speed = 200
	else:
		speed = 120
	
	if Input.is_action_pressed("Tecla_A"):
		leo_concepto.play("izquierda")
		velocidad.x -= 1 * speed
		$Position2D.rotation_degrees = 90

	if Input.is_action_pressed("Tecla_D"):
		leo_concepto.play("derecha")
		velocidad.x += 1 * speed
		$Position2D.rotation_degrees = 270

	if Input.is_action_pressed("Tecla_W"):
		leo_concepto.play("arriba")
		velocidad.y -= 1 * speed
		$Position2D.rotation_degrees = 180

	if Input.is_action_pressed("Tecla_S"):
		leo_concepto.play("abajo")
		velocidad.y += 1 * speed
		$Position2D.rotation_degrees = 0

func _physics_process(_delta):
	get_input()
	velocidad = move_and_slide(velocidad)

func _on_Centro_de_colicion_dao_area_entered(area):
	if area.is_in_group("Area_Enemy"):
		vida -= 7
		$Sonido/Dolor.play()
		inmunity = true

func Damage():
	if inmunity==false:
		$"Centro_de_colicion_daño/CollisionShape2D".disabled = false
		
	if inmunity==true:
		$"Centro_de_colicion_daño/CollisionShape2D".disabled = true
		$AnimationPlayer.play("Resivir_daño")

func fire():
	var shoot = Bomba.instance()
	shoot.global_position = $Position2D/Poner_bomba.global_position
	get_tree().call_group("level", "add_child", shoot)

func Poner_Bomba():
	if Input.is_action_just_pressed("Ataque"):
		fire()
		energia -= 10

func activar_area_de_ataque_mele():
	if Input.is_action_just_pressed("Ataque"):
		$Position2D/Area_de_Ataque_Machete/CollisionShape2D.disabled = false
	else:
		$Position2D/Area_de_Ataque_Machete/CollisionShape2D.disabled = true

func activar_area_de_dialogo():
	if Input.is_action_just_pressed("Ataque"):
		$Position2D/Area_de_Dialogo/CollisionShape2D.disabled = false
	else:
		$Position2D/Area_de_Dialogo/CollisionShape2D.disabled = true

func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"Resivir_daño":
			inmunity=false
