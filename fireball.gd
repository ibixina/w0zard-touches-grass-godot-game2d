extends Node2D

var posx
const travelThreshold = 300
var dir = 1
const speed = 200

func _ready() -> void:
	posx = position.x
	
func _process(delta: float) -> void:
	var curX = position.x
	#print(curX - posx)
	position.x += speed * dir * delta
	if curX - posx >= travelThreshold:
		dir = -1
		scale.x = -1
	elif curX - posx < 0:
		dir = 1
		scale.x = 1
	
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == "Player"):
		get_tree().reload_current_scene()
