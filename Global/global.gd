extends Node

var playerCurrentlyAttacking = false

var currentScene = "level"
var isTransitioning = false
gg
var playerExitX = 169
var playerExitY = 14
var playerEnterX = 156
var playerEnterY = 132


var gameStart = true



func finishSceneTransition():
	if isTransitioning == true:
		isTransitioning = false
		if currentScene == "level":
			currentScene = "level_2"
		else:
			currentScene = "level"
