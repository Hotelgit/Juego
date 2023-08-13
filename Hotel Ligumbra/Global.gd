extends Node


var inventario = ["Nada","Bomba_Eletrica"]
var objeto = 0
var objeto_seleccionado = inventario[objeto]
var Cantidad_de_Objetos =  len(inventario)

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("C"):
		objeto -= 1
		objeto_seleccionado = inventario[objeto]
	if Input.is_action_just_pressed("V"):
		objeto += 1
		objeto_seleccionado = inventario[objeto]
		print(objeto_seleccionado)
	
	if objeto <= -1 :
		objeto = 0
	
	if objeto < Cantidad_de_Objetos :
		objeto = 0
