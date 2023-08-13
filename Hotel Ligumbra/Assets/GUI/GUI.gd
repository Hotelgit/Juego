extends CanvasLayer

onready var player : KinematicBody2D = get_tree().get_nodes_in_group("Player")[0]

func _ready():
	pass

func _process(delta):
	$Barra_de_Vida.value = player.vida
	$Energia/Label.text = str(player.energia)
	if Input.is_action_just_pressed("Pausa"):
		get_tree().paused = true
		$Pausa.visible = true
	
	if GLOBAL.objeto_seleccionado == "Nada":
		$Inventario/AnimationPlayer.play("Mano")
	if GLOBAL.objeto_seleccionado == "Bomba_Eletrica":
		$Inventario/AnimationPlayer.play("Bomba_Eletrica")
	if GLOBAL.objeto_seleccionado == "Machete":
		$Inventario/AnimationPlayer.play("Machete")
	
	$Inventario/Label.text = str(GLOBAL.objeto_seleccionado)

func _on_Jugar_pressed():
	get_tree().paused = true
	$Pausa.visible = true

func _on_Menu_pressed():
	get_tree().change_scene("res://Assets/Menu/Menu.tscn")
