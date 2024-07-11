extends CharacterBody2D

var enemyInRange = false
var enemyAttackCoolDown = true
var playerIsAlive = true
var playerHealth = 100
var speed = 150

var playerAttackAnim = false
var acceleration = 800
var friction = 600
@onready var animationPlayer = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	input_vector.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle_Animation/blend_position", input_vector)
		animationTree.set("parameters/Run_Animation/blend_position", input_vector)
		animationState.travel("Run_Animation")
		velocity = velocity.move_toward(input_vector * speed, acceleration * delta)
	else:
		animationState.travel("Idle_Animation")
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	enemyAttacking()
	
	UpdateHeathBar()
	
	# Player Health Check function
	if playerHealth <= 0:
		playerIsAlive = false
		playerHealth = 0
		print("Player is Dead!!!")
		self.queue_free()
		

	move_and_collide(velocity * delta)


func _on_enemy_can_attack_body_entered(body):
	if body.has_method("enemy"):
		enemyInRange = true


func _on_enemy_can_attack_body_exited(body):
	if body.has_method("enemy"):
		enemyInRange = false
		
func enemyAttacking():
	if enemyInRange and enemyAttackCoolDown == true:
		playerHealth -= 10
		enemyAttackCoolDown = false
		$enemyAttackCooldownTimer.start()
		print ("your health: ", playerHealth)
		
func player():
	pass

func _on_enemy_attack_cooldown_timer_timeout():
	enemyAttackCoolDown = true

		
func _on_player_attack_cooldown_timer_timeout():
	$playerAttackCooldownTimer.stop()
	Globle.playerCurrentlyAttacking = false
	playerAttackAnim = false

func UpdateHeathBar():
	$playerHealthBar.value = playerHealth
	
	if playerHealth >= 100:
		$playerHealthBar.visible = false
	else:
		$playerHealthBar.visible = true
		
func _on_health_regen_timeout():
	if playerHealth < 100:
		playerHealth += 20
		if playerHealth > 100:
			playerHealth = 100
	if playerHealth <= 0:
		playerHealth = 0
