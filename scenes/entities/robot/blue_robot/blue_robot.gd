class_name BlueRobot extends Robot

func _ready():
	super._ready()
	colour = "blue"
	reputation = 0

func _process(delta: float) -> void:
	#reputation = get_parent().get_parent().blue
	#print(reputation)
	pass
