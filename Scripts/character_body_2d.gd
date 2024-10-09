extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
@export var speed: int = 215
@onready var animations = $AnimationPlayer

func handleInput():
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction*speed
	
func updateAnimation():
	if velocity.length() == 0:
		animations.stop()
	else:
		var direction = "down"
		if velocity.x < 0: direction = "left"
		elif velocity.x > 0: direction = "right"
		elif velocity.y < 0: direction = "up"
	
		animations.play("walk_" + direction)
	
func _physics_process(delta):
	handleInput()
	updateAnimation()
	move_and_slide()
