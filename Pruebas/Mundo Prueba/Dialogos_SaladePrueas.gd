extends CanvasLayer

enum NPC{GODOT,GODOT_ROJO,GODOT_AMARILLO,GODOT_VERDE}

const IMAGENES : Dictionary = {
	'GODOT' : preload("res://icon.png"),
	'VIEJO' : preload("res://Pruebas/NPC Provicional/avatar Viejo.png")
}

const TEXTOS_GODOT : Array = [
	'Hola como le a ido el dia',
	'AHORA dame dinero'
]

const TEXTOS_GODOT_ROJO : Array = [
	'Musca',
	'Ya no seme ocurre que poner',
	'Huevo'
]

const TEXTOS_GODOT_AMARILLO : Array = [
	'Ya seme olvido lo que iva a escribir',
	'No seme ocurre nada',
	'Bueno de todas forma no creo que nadie se de cuenta'
]

const TEXTOS_GODOT_VERDE : Array = [
	'Soy roberto',
	'Que roberto',
	'el que te dejo el culo habierto',
	'Se desbanese epicamente'
]

var chats : int = 0 

var npc : int = 0

func poner_TEXTO(TEXTO:String, NPC: int, IMAGEN:Texture) -> void:
	show()
	get_tree().paused = true
	$Texto.text = TEXTO
	npc = NPC
	$IMAGEN.texture = IMAGEN
	$AnimationPlayer.play("SET_TEXTO")

func _on_NPC_area_entered(area):
	if area.is_in_group("Area_de_dialogo"):
		poner_TEXTO(TEXTOS_GODOT[chats],NPC.GODOT,IMAGENES["VIEJO"])
		chats += 1

func _on_NPC2_area_entered(area):
	if area.is_in_group("Area_de_dialogo"):
		poner_TEXTO(TEXTOS_GODOT_ROJO[chats],NPC.GODOT_ROJO,IMAGENES["GODOT"])
		chats += 1

func _on_NPC3_area_entered(area):
	if area.is_in_group("Area_de_dialogo"):
		poner_TEXTO(TEXTOS_GODOT_AMARILLO[chats],NPC.GODOT_AMARILLO,IMAGENES["GODOT"])
		chats += 1

func _on_NPC4_area_entered(area):
	if area.is_in_group("Area_de_dialogo"):
		poner_TEXTO(TEXTOS_GODOT_VERDE[chats],NPC.GODOT_VERDE,IMAGENES["GODOT"])
		chats += 1

func _on_Boton_pressed() -> void:
	match npc:
		NPC.GODOT:
			if chats < TEXTOS_GODOT.size():
				poner_TEXTO(TEXTOS_GODOT[chats],NPC.GODOT,IMAGENES["VIEJO"])
				chats  += 1
			else:
				chats -= TEXTOS_GODOT.size()
				hide()
				get_tree().paused = false

		NPC.GODOT_ROJO:
			if chats < TEXTOS_GODOT_ROJO.size():
				poner_TEXTO(TEXTOS_GODOT_ROJO[chats],NPC.GODOT_ROJO,IMAGENES["GODOT"])
				chats  += 1
			else:
				chats -= TEXTOS_GODOT_ROJO.size()
				hide()
				get_tree().paused = false

		NPC.GODOT_AMARILLO:
			if chats < TEXTOS_GODOT_ROJO.size():
				poner_TEXTO(TEXTOS_GODOT_AMARILLO[chats],NPC.GODOT_AMARILLO,IMAGENES["GODOT"])
				chats  += 1
			else:
				chats -= TEXTOS_GODOT_AMARILLO.size()
				hide()
				get_tree().paused = false

		NPC.GODOT_VERDE:
			if chats < TEXTOS_GODOT_VERDE.size():
				poner_TEXTO(TEXTOS_GODOT_VERDE[chats],NPC.GODOT_VERDE,IMAGENES["GODOT"])
				chats  += 1
			else:
				chats -= TEXTOS_GODOT_VERDE.size()
				hide()
				get_tree().paused = false
