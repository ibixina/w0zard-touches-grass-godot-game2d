extends Node2D

var is_rotating = false
var target_rotation = 0
var rotation_speed = PI  # Rotate at π radians per second (180 degrees)
var rotation_direction = 0
var base_gravity = 980  # Default gravity strength

func _process(delta):
	if is_rotating:
		# Calculate the rotation step for this frame
		var rotation_step = rotation_speed * delta * rotation_direction
		
		# Rotate the scene
		rotation += rotation_step
		
		# Check if we've reached the target rotation
		if abs(rotation - target_rotation) < 0.1:
			rotation = target_rotation  # Snap to exact target
			is_rotating = false

func _input(event):
	if event.is_action_pressed("rotate_right"):  # A key
		if not is_rotating:
			rotation_direction = 1
			target_rotation = rotation + PI/2  # 90 degrees clockwise
			is_rotating = true
	
	elif event.is_action_pressed("rotate_left"):  # D key
		if not is_rotating:
			rotation_direction = -1
			target_rotation = rotation - PI/2  # 90 degrees counterclockwise
			is_rotating = true
	elif event.is_action_pressed("ui_page_up"):
		if not is_rotating:
			rotation_direction = 1
			target_rotation = rotation + PI  # 90 degrees counterclockwise
			is_rotating = true
		

func update_gravity():
	# Calculate gravity vector based on current rotation
	# Convert rotation to a normalized direction vector
	var gravity_direction = Vector2(-sin(rotation), cos(rotation))
	
	# Set the gravity in the project
	ProjectSettings.set_setting("physics/2d/default_gravity_vector", gravity_direction)
	
	# Keep the gravity strength consistent
	ProjectSettings.set_setting("physics/2d/default_gravity", base_gravity)
