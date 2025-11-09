extends Area2D

@export var speed = 500

func _ready():
	print("player ready")

func _process(delta):
	move_player(delta)
	
func move_player(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("IDLE")
	
	position += velocity * delta
