extends ViewportContainer


var player : KinematicBody2D


func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]
	
func _process(delta):
	$Viewport/Camera.global_transform.origin.x = player.global_transform.origin.x
	$Viewport/Camera.global_transform.origin.y = player.global_transform.origin.y
