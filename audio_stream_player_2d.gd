extends AudioStreamPlayer2D

func _process(delta):
	if not is_playing():
		play()  # Restart when audio finishes
