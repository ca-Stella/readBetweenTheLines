extends Node
#Move to whichever script needs it
var blue_robot = preload("res://scenes/entities/robot/blue_robot/blue_robot.tscn")
var pink_robot = preload("res://scenes/entities/robot/pink_robot/pink_robot.tscn")
var green_robot = preload("res://scenes/entities/robot/green_robot/green_robot.tscn")
var background = preload("res://scenes/game/world/land/land.tscn")
var fire = preload("res://scenes/entities/fire/fire.tscn")
var reputations = {"blue" : 0, "green" : 0, "pink": 0}
var blue_robots = []
var pink_robots = []
var green_robots = []
var low_rep = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_robots()
	for i in range(5):
		var fire_instance = fire.instantiate()
		add_child(fire_instance)
	var grass = background.instantiate()
	add_child(grass)
	$Timer.start()
	$Timer.wait_time = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if reputations["blue"] < 25 or reputations["green"] < 25 or reputations["pink"] < 25:
		low_rep = true
	else:
		low_rep = false
	
func new_game():
	$StartScreen.show()
	#get_tree().call_group("damages", "queue_free")
	#get_tree().change_scene_to_file("res://scenes/ui/StartScreen/start_screen.tscn")
#	$start_screen.hide()
#	$Player.start($StartPosition.position)
#	$StartTimer.start()

func spawn_robots():
	for i in range(7):
		var robot = blue_robot.instantiate()
		add_child(robot)
		blue_robots.append(robot)
		robot = pink_robot.instantiate()
		add_child(robot)
		pink_robots.append(robot)
		robot = green_robot.instantiate()
		add_child(robot)
		green_robots.append(robot)

func _on_timer_timeout() -> void:
	if low_rep == true:
		var low_reps = []
		if reputations["blue"] < 25:
			low_reps.append("blue")
		if reputations["green"] < 25:
			low_reps.append("green")
		if reputations["pink"] < 25:
			low_reps.append("pink")
		var colour = low_reps.pick_random()
		var r = null
		if colour == "blue":
			var l = pink_robots + green_robots
			r = l.pick_random()
			colour = "Blue"
		elif colour == "green":
			var l = pink_robots + blue_robots
			r = l.pick_random()
			colour = "Green"
		else:
			var l = blue_robots + green_robots
			r = l.pick_random()
			colour = "Pink"
		r.get_node("Speech Bubble").show_bubble(colour)
