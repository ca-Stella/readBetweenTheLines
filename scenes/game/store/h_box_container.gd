extends HBoxContainer
var headline_button = preload("res://scenes/game/store/headline_button.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_buttons()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func generate_buttons() -> void:
	for i in range(3):
		var button = headline_button.instantiate()
		button.custom_minimum_size = Vector2(20, 20) 

		self.add_child(button)
	for b in self.get_children():
		b.show()
