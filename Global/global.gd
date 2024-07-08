extends Node

var playerCurrentlyAttacking = false

var currentScene = "level"
var isTransitioning = false

var playerExitX = 717
var playerExitY = 164
var playerEnterX = 217
var playerEnterY = 156


var gameStart = true



func finishSceneTransition():
	if isTransitioning == true:
		isTransitioning = false
		if currentScene == "level":
			currentScene = "level_2"
		else:
			currentScene = "level"
