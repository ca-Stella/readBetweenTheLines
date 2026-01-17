extends Node2D
class_name Robot

var is_walking = false
var direction = Vector2.ZERO
var velocity = Vector2.ZERO
@onready var walk_timer = $"Timer"
@onready var sprite = $"CharacterBody2D/AnimatedSprite2D"
var speed = 40

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	walk_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += velocity * delta
	
func _physics_process(delta: float) -> void:
	if is_walking:
		velocity = direction * speed
		sprite.play("walk")
	else:
		velocity = Vector2.ZERO
		sprite.stop()

func _on_timer_timeout() -> void:
	print("switch")
	is_walking = !is_walking
	
	if is_walking:
		var dir_x = [-1,1].pick_random()
		var dir_y = [-1,1].pick_random()
		direction = Vector2(dir_x, dir_y).normalized()
		walk_timer.wait_time = randf_range(0.5,2)
		if direction.x != 0:
			sprite.flip_h = direction.x < 0
	else:
		direction = Vector2.ZERO
		walk_timer.wait_time = randf_range(0.5,2)
