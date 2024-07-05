extends CharacterBody2D

var playerIsChasing = false;
var enemySpeed = 50;
var player = null

func _physics_process(delta):
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
