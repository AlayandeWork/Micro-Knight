extends CharacterBody2D

var playerIsChasing = false;
var enemySpeed = 50;
var player = null
var playerInRange = false
var enemyHealth = 100
var canTakeDamage = true

func _physics_process(delta):
	playerAttacking()
	if playerIsChasing:
		position += (player.position - position)/enemySpeed
		$AnimatedSprite2D.play("enemy_run")
		
		
		if (player.position.x - position.x)<0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
			
			
	else:
		$AnimatedSprite2D.play("enemy_idle")
		
func _on_enemy_detection_body_entered(body):
	player = body
	playerIsChasing = true


func _on_enemy_detection_body_exited(body):
	player = null
	playerIsChasing = false

func enemy():
	pass


func _on_player_can_attack_body_entered(body):
	if body.has_method("player"):
		playerInRange = true


func _on_player_can_attack_body_exited(body):
	if body.has_method("player"):
		playerInRange = false
		
func playerAttacking():
	if playerInRange and Globle.playerCurrentlyAttacking == true:
		if canTakeDamage == true:
			enemyHealth -= 10
			$playerAttackCooldownTimer.start()
			canTakeDamage = false
			print (enemyHealth)
			if enemyHealth <= 0:
				self.queue_free()


func _on_player_attack_cooldown_timer_timeout():
	canTakeDamage = true
