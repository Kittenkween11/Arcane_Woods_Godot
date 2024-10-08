extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
@export var speed: int = 215
@onready var animations = $AnimationsPlayer

func handleInput():
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction*speed
	
func updateAnimation():
	var direction = "Down"
	if velocity.x < 0: direction = "Left"
	elif velocity.x > 0: direction = "Right"
	elif velocity.y <0: direction = "Up"
	
	animations.play("walk" + direction)
	
func _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimation
