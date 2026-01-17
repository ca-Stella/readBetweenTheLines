extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func new_game():
	$StartScreen.show()
	#get_tree().call_group("damages", "queue_free")
	#get_tree().change_scene_to_file("res://scenes/ui/StartScreen/start_screen.tscn")
#	$start_screen.hide()
#	$Player.start($StartPosition.position)
#	$StartTimer.start()
