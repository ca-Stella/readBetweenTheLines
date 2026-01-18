extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	print("start pressed")
	get_tree().change_scene_to_file("res://scenes/main-game.tscn")

#get_tree().change_scene_to_file("game scene here")


func _on_options_pressed() -> void:
	#click option button from pause scene, save it so when click back button from options scnee retuens tehm here correctly
	get_tree().set_meta("return_scene_path", "res://scenes/ui/start_screen/start_screen.tscn")
	#take to options scene
	get_tree().change_scene_to_file("res://scenes/ui/options_screen/options_screen.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
