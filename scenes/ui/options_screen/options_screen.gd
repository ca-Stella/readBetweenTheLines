extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_help_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/help_screen/help_scene.tscn")

func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)


func _on_check_box_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_volume_db(0, toggled_on)


#func _on_back_pressed() -> void:	
	#send back to scene depending where they came from 
	#var tree := get_tree()
	#var path := str(tree.get_meta("return_scene_path"))
	##clear
	#tree.remove_meta("return_scene_path")
	#tree.change_scene_to_file(path)
