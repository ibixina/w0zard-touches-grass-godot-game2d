extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", self._on_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body):
	print(body.name)
	if (body.name == "Player"):
		get_tree().change_scene_to_file("res://platform_level.tscn")
