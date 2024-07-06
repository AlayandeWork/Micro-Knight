extends CharacterBody2D

var enemyInRange = false
var enemyAttackCoolDown = true
var playerIsAlive = true
var playerHealth = 100
var speed = 150
var direction = "none"
@onready var anim = $AnimatedSprite2D

func _ready():
	anim.play("idle_down")

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		direction = "right"
		animationplay(1)
		velocity.y = 0
		velocity.x = speed
		
	elif Input.is_action_pressed("ui_left"):
		direction = "left"
		animationplay(1)
		velocity.y = 0
		velocity.x = -speed
		
	elif Input.is_action_pressed("ui_up"):
		direction = "up"
		animationplay(1)
		velocity.y = -speed
		velocity.x = 0
		
	elif Input.is_action_pressed("ui_down"):
		direction = "down"
		animationplay(1)
		velocity.y = speed
		velocity.x = 0
	else:
		animationplay(0)
		velocity = Vector2.ZERO

	move_and_slide()

func animationplay(move):
	if direction == "right":
		anim.flip_h = false
		if move == 1:
			anim.play("run_right")
		else:
			anim.play("idle_right")
			
	elif direction == "left":
		anim.flip_h = true
		if move == 1:
			anim.play("run_right")
		else:
			anim.play("idle_right")
			
	elif direction == "up":
		anim.flip_h = false
		if move == 1:
			anim.play("run_up")
		else:
			anim.play("idle_up")
			
	elif direction == "down":
		anim.flip_h = false
		if move == 1:
			anim.play("run_down")
		else:
			anim.play("idle_down")


func _on_enemy_can_attack_body_entered(body):
	if body.has_method("enemy"):
		enemyInRange = true


func _on_enemy_can_attack_body_exited(body):
	pass # Replace with function body.
