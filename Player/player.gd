extends CharacterBody2D

@export var speed = 200;
@onready var animated_sprite_2d = $AnimatedSprite2D


func _physics_process(delta):
	playerMovement(delta)




func playerMovement(delta):
	if Input.is_action_pressed("Right"):
		velocity.y = 0
		velocity.x = speed
		animated_sprite_2d.play("run_right")
		
	elif Input.is_action_pressed("Left"):
		velocity.y = 0
		velocity.x = -speed
		
	elif Input.is_action_pressed("Up"):
		velocity.y = -speed
		velocity.x = 0
		animated_sprite_2d.play("run_up")
	elif Input.is_action_pressed("Down"):
		velocity.y = speed
		velocity.x = 0
	else:
		velocity.y = 0
		animated_sprite_2d.play("idle_down")
		velocity.x = 0
		animated_sprite_2d.play("idle_right")
		
	

	move_and_slide()
