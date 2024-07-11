extends CharacterBody2D

var enemyInRange = false
var enemyAttackCoolDown = true
var playerIsAlive = true
var playerHealth = 100
var speed = 150
var direction = "none"
var playerAttackAnim = false

@onready var anim = $AnimatedSprite2D

func _ready():
	anim.play("idle_down")

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	input_vector.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector
	else:
		velocity = Vector2.ZERO
	#player_movement(delta)
	enemyAttacking()
	AttackAnimation()
	UpdateHeathBar()
	
	# Player Health Check function
	if playerHealth <= 0:
		playerIsAlive = false
		playerHealth = 0
		print("Player is Dead!!!")
		self.queue_free()
		

#func player_movement(delta):
	#if Input.is_action_pressed("ui_right"):
		#direction = "right"
		#animationplay(1)
		#velocity.y = 0
		#velocity.x = speed
		#
	#elif Input.is_action_pressed("ui_left"):
		#direction = "left"
		#animationplay(1)
		#velocity.y = 0
		#velocity.x = -speed
		#
	#elif Input.is_action_pressed("ui_up"):
		#direction = "up"
		#animationplay(1)
		#velocity.y = -speed
		#velocity.x = 0
		#
	#elif Input.is_action_pressed("ui_down"):
		#direction = "down"
		#animationplay(1)
		#velocity.y = speed
		#velocity.x = 0
	#else:
		#animationplay(0)
		#velocity = Vector2.ZERO

	move_and_collide(velocity)

func animationplay(move):
	if direction == "right":
		anim.flip_h = false
		if move == 1:
			anim.play("run_right")
		else:
			if playerAttackAnim == false:
				anim.play("idle_right")
			
	elif direction == "left":
		anim.flip_h = true
		if move == 1:
			anim.play("run_right")
		else:
			if playerAttackAnim == false:
				anim.play("idle_right")
			
	elif direction == "up":
		anim.flip_h = false
		if move == 1:
			anim.play("run_up")
		else:
			if playerAttackAnim == false:
				anim.play("idle_up")
			
	elif direction == "down":
		anim.flip_h = false
		if move == 1:
			anim.play("run_down")
		else:
			if playerAttackAnim == false:
				anim.play("idle_down")


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
	
func AttackAnimation():
	if 	Input.is_action_just_pressed("Attack"):
		Globle.playerCurrentlyAttacking = true
		playerAttackAnim = true
		
		if direction == "right":
			$AnimatedSprite2D.flip_h = false
			anim.play("attack_right")
			$playerAttackCooldownTimer.start()
		if direction == "left":
			$AnimatedSprite2D.flip_h = true
			anim.play("attack_right")
			$playerAttackCooldownTimer.start()
		if direction == "up":
			anim.play("attack_up")
			$playerAttackCooldownTimer.start()
		if direction == "down":
			anim.play("attack_down")
			$playerAttackCooldownTimer.start()
			

		
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
