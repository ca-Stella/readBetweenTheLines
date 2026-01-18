extends CanvasLayer
var blue_robots = []
var pink_robots = []
var green_robots = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_robots()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var blue_robot = preload("res://scenes/entities/robot/blue_robot/blue_robot.tscn")
var pink_robot = preload("res://scenes/entities/robot/pink_robot/pink_robot.tscn")
var green_robot = preload("res://scenes/entities/robot/green_robot/green_robot.tscn")

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
	self.get_parent().blue_robots = blue_robots
	self.get_parent().green_robots = green_robots
	self.get_parent().pink_robots = pink_robots
