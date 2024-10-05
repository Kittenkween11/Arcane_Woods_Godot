extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
@export var speed: int = 175

func _process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
	
func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()
