extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_resume_pressed() -> void:
	print("resume pressed")
	


func _on_restart_pressed() -> void:
	print("restart pressed")
	#should be same as when player selects start game in start screen


func _on_options_pressed() -> void:
	print("options pressed")


func _on_exit_pressed() -> void:
	get_tree().quit()
