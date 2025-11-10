extends Node2D

func _ready():
	$Mauri.isIdle = false
	$AudioStreamPlayer.play()
