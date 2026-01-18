extends Node2D
class_name Robot

var is_walking = false
var direction = Vector2.ZERO
var velocity = Vector2.ZERO
@onready var walk_timer = $"Timer"
@onready var sprite = $"CharacterBody2D/AnimatedSprite2D"
@onready var collision_area = $"CharacterBody2D/Area2D"
var speed = 40
var reputation = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.play("walk")
	sprite.frame = 1
	sprite.stop()
	walk_timer.start()
	collision_area.body_entered.connect(_on_area_entered)
	position.x = randf_range(16,334)
	position.y = randf_range(9,261)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if is_walking:
		velocity = direction * speed
		sprite.play("walk")
	else:
		velocity = Vector2.ZERO
		sprite.stop()
		
	position += velocity * delta
	if position.x <= 16 and direction.x < 0:
		direction.x = -direction.x
		sprite.flip_h = direction.x < 0
	if position.x >= 334 and direction.x > 0:
		direction.x = -direction.x
		sprite.flip_h = direction.x < 0
	if position.y <= 9 and direction.y < 0:
		direction.y = -direction.y
	if position.y >= 261 and direction.y > 0:
		direction.y = -direction.y

func _on_timer_timeout() -> void:
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
		
func change_rep(value):
	reputation += value
	
func _on_area_entered(body):
	if body.get_parent().reputation < 50:
		var x = body.position.x - position.x
		var y = body.position.y - position.y
		direction = Vector2(-x, -y).normalized()
