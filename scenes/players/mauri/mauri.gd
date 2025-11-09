extends Node2D

@export var isIdle : bool

func _process(delta):
	$Player.isIdle = isIdle
