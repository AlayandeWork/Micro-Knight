extends CharacterBody2D

var speed = 100


func _physics_process(delta):
	playerMovement(delta)




func playerMovement(delta):
	if Input.is_action_just_pressed("Right"):
		velocity.y = 0
		velocity.x = speed * delta
	elif Input.is_action_just_pressed("Left"):
		velocity.y = 0
		velocity.x = -speed * delta
	elif Input.is_action_just_pressed("Up"):
		velocity.y = -speed * delta
		velocity.x = 0
	elif Input.is_action_just_pressed("Down"):
		velocity.y = speed * delta
		velocity.x = 0
	else:
		velocity.y = 0
		velocity.x = 0
		
	

	move_and_slide()
