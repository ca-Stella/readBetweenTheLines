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
var is_scared = false
var is_mad = false
var colour = ""

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
	if reputation < 25:
		is_mad = true
	else:
		is_mad = false
	if self.colour == "blue":
		reputation = self.get_parent().get_parent().blue
		print("blue rep",reputation)
	elif self.colour == "green":
		reputation = self.get_parent().get_parent().green
		print("green rep",reputation)
	elif self.colour == "pink":
		reputation = self.get_parent().get_parent().pink
		print("pink rep",reputation)
	
func _physics_process(delta: float) -> void:
	if is_scared:
		var flee_vector = Vector2.ZERO
		var scare_detected = false
		for body in collision_area.get_overlapping_bodies():
			var parent = body.get_parent()
			if parent.colour != colour and parent.reputation < 50:
				flee_vector += (position - parent.position)
				scare_detected = true
		if scare_detected:
			is_scared = true
			direction = flee_vector.normalized()
			sprite.play("scared")
			if direction.x != 0:
				sprite.flip_h = direction.x < 0
		else:
			is_scared = false
	elif is_mad:
		velocity = direction * speed
		sprite.play("mad")
	elif is_walking:
		velocity = direction * speed
		sprite.play("walk")
	else:
		velocity = Vector2.ZERO
		sprite.stop()
		
	if position.x <= 16 and direction.x < 0:
		direction.x = max(direction.x, 0)
		sprite.flip_h = direction.x < 0
	if position.x >= 334 and direction.x > 0:
		direction.x = min(direction.x, 0)
		sprite.flip_h = direction.x < 0
	if position.y <= 9 and direction.y < 0:
		direction.y = max(direction.y, 0)
	if position.y >= 261 and direction.y > 0:
		direction.y = min(direction.y, 0)
	
	velocity = direction * speed
	position += velocity * delta

func _on_timer_timeout() -> void:
	if is_scared:
		return
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
	if body.get_parent().colour != colour:
		if body.get_parent().reputation < 25:
			is_scared = true
