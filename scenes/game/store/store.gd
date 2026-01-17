extends CanvasLayer

var rng = RandomNumberGenerator.new()
var headline1
var headline2
var headline3
#var headline_choice: PackedScene = preload("res://path_to_scene.tscn")

@export var headline_choice: PackedScene

var headlines = {
	"pink-kill": [{"cost": 10, "text": "Pink robots killed a blue robot", "hp_change": -20}, 
			{"cost": 5, "text": "Blue robot dead!", "hp_change": -10}
			],
	"green-help": [{"cost": 20, "text": "Green robot helps out a blue robot", "hp_change": 30},
			{"cost": 25, "text": "Green robot saves blue robot from red robot", "hp_change": -20}
	],
	"blue-unite": [{"cost": 15, "text": "Blue robots unite together! ", "hp_change": 10},
			{"cost": 25, "text": "Blue robots hate red robots!", "hp_change": -50}
	],
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	headline_choice = load("res://scenes/game/store/headline_choice.tscn")
	var random_items = get_random_headlines(headlines, 3)

	headline1 = headline_choice.instantiate()
	headline2 = headline_choice.instantiate()
	headline3 = headline_choice.instantiate()

	$ColorRect/HBoxContainer.add_child(headline1)
	$ColorRect/HBoxContainer.add_child(headline2)
	$ColorRect/HBoxContainer.add_child(headline3)

	headline1.set_headline_info(headlines[random_items[0]][0], headlines[random_items[0]][1])
	headline2.set_headline_info(headlines[random_items[1]][0], headlines[random_items[1]][1])
	headline3.set_headline_info(headlines[random_items[2]][0], headlines[random_items[2]][1])


# Function to get random items from the dictionary
func get_random_headlines(dict: Dictionary, count: int) -> Array:

	var keys = dict.keys()
	keys.shuffle()
	var random_keys = keys.slice(0, 3)
	return random_keys

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
