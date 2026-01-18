extends Node2D
var reputations = [50,50,50]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = randf_range(16,334)
	position.y = randf_range(9,261)
	hide()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for r in reputations:
		if r < 25:
			show()
			$AnimatedSprite2D.play("default")
		else:
			hide()
