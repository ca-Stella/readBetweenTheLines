extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_resume_pressed() -> void:
	print("resume pressed")
#get_tree().change_scene_to_file(" back to game window here")


func _on_faq_pressed() -> void:
	print("faq/save pressed")


func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_restart_pressed() -> void:
	print("restart pressed")
	#use same file path as starting the game 
	#get_tree().change_scene_to_file("game window here")
