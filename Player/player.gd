extends CharacterBody2D

@export var speed = 200;


func _physics_process(delta):
	playerMovement(delta)




func playerMovement(delta):
	if Input.is_action_pressed("Right"):
		velocity.y = 0
		velocity.x = speed
	elif Input.is_action_pressed("Left"):
		velocity.y = 0
		velocity.x = -speed
	elif Input.is_action_pressed("Up"):
		velocity.y = -speed
		velocity.x = 0
	elif Input.is_action_pressed("Down"):
		velocity.y = speed
		velocity.x = 0
	else:
		velocity.y = 0
		velocity.x = 0
		
	

	move_and_slide()
