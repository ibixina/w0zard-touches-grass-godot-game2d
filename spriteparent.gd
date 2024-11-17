extends Node2D  # Or another node type appropriate for your setup
const speed = 20
var direction = 1
var loc;
func _ready() -> void:
	loc = position.x
	

func _process(delta):
	position.x += direction * speed * delta
	
	
	if position.x - loc > 263:
		direction = -1
		scale.x = -1
	if position.x - loc < 0:
		direction = 1
		scale.x = 1
