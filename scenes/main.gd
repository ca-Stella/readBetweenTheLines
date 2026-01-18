extends Node
var blue_robot = preload("res://scenes/entities/robot/blue_robot/blue_robot.tscn")
var pink_robot = preload("res://scenes/entities/robot/pink_robot/pink_robot.tscn")
var green_robot = preload("res://scenes/entities/robot/green_robot/green_robot.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_robots()


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

func spawn_robots():
	for i in range(3):
		var robot = blue_robot.instantiate()
		add_child(robot)
		robot = pink_robot.instantiate()
		add_child(robot)
		robot = green_robot.instantiate()
		add_child(robot)
