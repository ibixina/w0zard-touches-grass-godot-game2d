extends CharacterBody2D

const SPEED = 200
const JUMP_FORCE = 380
const GRAVITY = 700
var frameIndex = 0
var walkDir = 1
var _animated_sprite
var inputGiven = false
func _on_ready():
	_animated_sprite = $walk

func _physics_process(delta):
	# Get the parent node's rotation for world orientation
	inputGiven = false
	var world_rotation = get_parent().rotation_degrees
	
	rotation = -deg_to_rad(world_rotation)
	#$Sprite2D.rotation = deg_to_rad(world_rotation)
	#print(deg_to_rad(world_rotation))

	var gravity_direction = Vector2(0,1)
	## Apply gravity if not on the floor
	#print(is_on_floor())
	if not is_on_floor():
		velocity += gravity_direction * GRAVITY * delta
	
	
	## Get input direction for horizontal movement
	var input_direction = 0.0
	if Input.is_action_pressed("ui_right"):
		inputGiven = true
		
		input_direction = 1.0
		walkDir = 1
		frameIndex += 1
		$walk.scale.x = walkDir
		if is_on_floor():
			
			$walk.play("default")
	elif Input.is_action_pressed("ui_left"):
		inputGiven = true
		input_direction = -1.0
		walkDir = -1
		frameIndex += 1
		$walk.scale.x = walkDir
		if is_on_floor():
			
			$walk.play("default")	
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		inputGiven = true
		$walk.play("jump")
		velocity -= gravity_direction * JUMP_FORCE
	
	# Animation handling
	if not is_on_floor():
		# Play jump animation while in air
		$walk.play("jump")
		inputGiven = true  # Keep animation playing while in air
	
	if is_on_floor() and not inputGiven:
		$walk.stop()
		
	
	
	# Calculate movement vector perpendicular to gravity
	#var right_vector = Vector2(-gravity_direction.y, gravity_direction.x)
	var movement =  input_direction * SPEED
	velocity.x = movement
	#
	## Maintain vertical velocity while updating horizontal movement
	#var vertical_velocity = velocity.project(gravity_direction)
	#velocity = vertical_velocity + movement
	#
	# Handle jumping
	
	
	# Apply movement
	move_and_slide()
