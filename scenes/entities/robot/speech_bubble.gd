extends Control
var colours_capitalized = ["Blue", "Green", "Pink"]
var colour
var reputations = {"blue" : 50, "green" : 50, "pink" : 50}
var low_reps = []
var low_rep = false
var showing = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func show_bubble(c):
	print("hi")
	colour = c
	showing = true
	var general_phrases = []
	general_phrases.append("%s robots are a burden to society." % colour)
	general_phrases.append("I heard %s robots are violent." % colour)
	general_phrases.append("I hope I don't catch a viruse from that %s robot." % colour)
	$"Label".text = general_phrases.pick_random()
	$"Speech Timer".wait_time = 3
	$"Speech Timer".start()
	show()

func _on_speech_timer_timeout() -> void:
	hide()
	$"Speech Timer".stop()
	showing = false
