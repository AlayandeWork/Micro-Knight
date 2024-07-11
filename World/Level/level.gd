extends Node2D
#
#
## Called when the node enters the scene tree for the first time.
#func _ready():
	#if Globle.gameStart == true:
		#$Player.position.x = Globle.playerEnterX
		#$Player.position.y = Globle.playerEnterY
	#else:
		#$Player.position.x = Globle.playerExitX
		#$Player.position.y = Globle.playerExitY
		#
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#changeScene()
#
#
#func _on_transition_area_body_entered(body):
	#if body.has_method("player"):
		#Globle.isTransitioning = true
		#print ("player has entered transition area")
#
#
#func _on_transition_area_body_exited(body):
	#if body.has_method("player"):
		#Globle.isTransitioning = false
		#print ("player has exited transition area")
#
#func changeScene():
	#if Globle.isTransitioning == true:
		#if Globle.currentScene == "level":
			#get_tree().change_scene_to_file("res://World/Level/level_2.tscn")
			#Globle.gameStart = false
			#Globle.finishSceneTransition()
