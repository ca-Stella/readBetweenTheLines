extends Node2D
var headlines = 20
var reputations = [50, 50, 50]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = 240
	position.y = 135
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if headlines == 20:
		$Label.text = "The robots lived together in peace and harmony."
		show()
	for r in reputations:
		if r <= 0:
			$Label.text = "The robots started a war."
			show()
