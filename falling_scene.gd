extends Node2D

var typed_word = ""
var fly_success = false

func _ready():
	get_node("Timer").start()

func _input(event):
	if event is InputEventKey:
		if event.unicode:
			typed_word += char(event.unicode)
			if typed_word == "fly":
				fly_success = true
				print("Spell cast successfully!")
				# Transition to next scene herel

func _process(delta):
	if not fly_success and get_node("Timer").is_stopped():
		print("You failed to cast the spell!")
		# Handle game over logic here
