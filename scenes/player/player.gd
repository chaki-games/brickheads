extends Area2D

@export var isIdle:bool

func _ready():
	print("player ready")

func _process(delta):
	move_player(delta)
	
func move_player(delta):
	if isIdle:
		$AnimatedSprite2D.play("IDLE")
	else:
		$AnimatedSprite2D.play("run")
